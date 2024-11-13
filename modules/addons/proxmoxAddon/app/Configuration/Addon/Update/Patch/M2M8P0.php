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
 */
class M2M8P0 extends DefaultPatch
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
    }
}
