<?php

namespace ModulesGarden\proxmoxAddon\app\Configuration\Addon\Update\Patch;

use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\Core\Helper;
use function ModulesGarden\ProxmoxAddon\Core\Helper;

/**
 * Description of M3M8P0
 */
class M3M8P0 extends DefaultPatch
{
    public function execute()
    {
        if ($this->runSchema())
        {
            $this->vlans();
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
    }
}
