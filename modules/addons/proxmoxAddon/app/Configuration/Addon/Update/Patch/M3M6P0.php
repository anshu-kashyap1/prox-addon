<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\Patch;

use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\Core\Helper;

/**
 * Description of M3M6P0
 */
class M3M6P0 extends DefaultPatch
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
    }


}
