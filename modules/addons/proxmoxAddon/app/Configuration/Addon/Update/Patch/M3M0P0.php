<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\Patch;

use Illuminate\Database\Capsule\Manager as DB;
use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\App\Models\ProductConfiguration;
use ModulesGarden\ProxmoxAddon\App\Models\VirtualInterface;
use ModulesGarden\ProxmoxAddon\App\Models\VmIpAddress;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\Hosting;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\Product;
use ModulesGarden\ProxmoxAddon\Core\Helper;
use ModulesGarden\ProxmoxAddon\Core\ModuleConstants;

/**
 * Description of M2M6P0
 *
 */
class M3M0P0 extends DefaultPatch
{
    public function execute()
    {
        if ($this->runSchema())
        {
            Helper\sl('logger')
                ->addDebug("Correctly installed update {$this->getVersion()} .", []);
        }
        else
        {
            Helper\sl('errorManager')
                ->addError(self::class, "Incorrectly installed update {$this->getVersion()} .", []);
        }
        //data
        $this->up();
        //Proxmox Cloud import vms
        $this->vms();
        //ip addresses not assigned
        $this->ipAddressesForCloud();
        //proxmoxcloud_private_interfaces
        //proxmoxcloud_private_networks
        $this->productCloud();
        $this->defaultProductOptions();
        //users
        $this->usersCloud();
        //assign ip adresses
        $this->changePackegeCloud();

    }

    protected function  defaultProductOptions(){
        foreach (Product::ofProxmoxCloud()->get() as $product){
            $setting =  ProductConfiguration::firstOrNew([
                'product_id' => $product->id,
                'setting' => 'permissionVirtualNetwork'
            ]);
            $setting->value = 'on';
            $setting->save();
        }
    }

    protected  function  changePackegeCloud(){

        $file   = \ModulesGarden\ProxmoxAddon\Core\ModuleConstants::getFullPathWhmcs('modules', 'servers','ProxmoxCloudVps', 'core') . DIRECTORY_SEPARATOR . 'Bootstrap.php';
        if(!file_exists($file))
        {
            return;
        }
        include_once  $file;
        if (!function_exists('ModuleBuildParams'))
        {
            require_once ModuleConstants::getFullPathWhmcs('includes') . DIRECTORY_SEPARATOR . "modulefunctions.php";
        }
        foreach (Hosting::ofProxmoxCloudAndStatusActiveAndSuspended()->get() as $hosting) {
            $params = \ModuleBuildParams($hosting->id);
            \ModulesGarden\Servers\ProxmoxCloudVps\Core\Helper\sl('whmcsParams')->setParams($params);
            $controller = new \ModulesGarden\Servers\ProxmoxCloudVps\App\Http\Actions\ChangePackage();
            $result = $controller->execute($params);
            if($result != 'success'){
                $msg = sprintf('Module Change Package Failed - Service ID: %s - Error: %s', $hosting->id, $result);
                logActivity( $msg );
            }
        }
    }

    public function  ipAddressesForCloud(){
        try
        {
            $query = DB::table("proxmoxcloud_ips")->where('vid', '0');
            foreach ($query->get() as $entery)
            {
                if(!Hosting::ofId($entery->hid)->activeAndSuspended()->count()){
                    continue;
                }
                if (VmIpAddress::ofHostingId($entery->hid)->ofIp($entery->ip)->count()) {
                    continue;
                }
                //public ip only
                if(!filter_var($entery->ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE)){
                    continue;
                }
                $entity             = new VmIpAddress();
                $entery->hosting_id =  $entery->hid;
                $entery->server_id = $entery->sid;
                $entery->vm_id = null;
                $entity->fill((array)$entery)
                      ->save();
            }
        }
        catch (\Exception $ex)
        {
            if (!preg_match("/doesn\'t/", $ex->getMessage()))
            {
                throw $ex;
            }
        }
    }

}
