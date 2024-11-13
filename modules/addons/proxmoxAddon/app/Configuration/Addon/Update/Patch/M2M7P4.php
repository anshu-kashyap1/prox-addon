<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\Patch;

use Illuminate\Database\Capsule\Manager as DB;
use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\App\Models\ProductConfiguration;
use ModulesGarden\ProxmoxAddon\App\Models\Whmcs\Product;
use ModulesGarden\ProxmoxAddon\Core\Helper;

/**
 * Description of M2M6P0
 *
 * @author <slawomir@modulesgarden.com>
 */
class M2M7P4 extends DefaultPatch
{
    public function execute()
    {
        //default options
        foreach (Product::where('servertype','proxmoxVPS')->pluck('id')->all() as $productId) {
            if(ProductConfiguration::ofProductId($productId)->ofSetting('permissionSshkeys')->count()){
                continue;
            }
            $setting = new ProductConfiguration();
            $setting->product_id = $productId;
            $setting->setting = 'permissionSshkeys';
            $setting->value = 'on';
            $setting->save();
        }
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
    }
}
