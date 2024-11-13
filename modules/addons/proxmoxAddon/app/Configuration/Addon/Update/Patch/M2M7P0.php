<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\Patch;

use Illuminate\Database\Capsule\Manager as DB;
use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\ProductConveter;
use ModulesGarden\ProxmoxAddon\Core\Helper;

/**
 * Description of M2M6P0
 *
 * @author <slawomir@modulesgarden.com>
 */
class M2M7P0 extends DefaultPatch
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
        $this->up();
        //import ip addresses
        $this->vmIpAddresses();
        //import key pairs
        $this->keyPairs();
        //import users
        $this->users();
        try
        {
            $productConveter = new ProductConveter();
            foreach (DB::table("proxmoxVPS_prodConfig")->get() as $row)
            {
                $setting = $productConveter->convert($row->setting, $row->value, $row->product_id);
                if (is_null($setting))
                {
                    continue;
                }
                if ($productConveter->exist($setting))
                {
                    continue;
                }
                $setting->save();
            }

        }
        catch (\Exception $ex)
        {

        }
    }
}
