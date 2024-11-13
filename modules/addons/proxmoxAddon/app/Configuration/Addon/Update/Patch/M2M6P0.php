<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\Patch;

use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\Core\Helper;

/**
 * Description of M2M6P0
 *
 * @author <slawomir@modulesgarden.com>
 */
class M2M6P0 extends DefaultPatch
{
    public function execute()
    {
        $this->up();
        if ($this->runSchema())
        {
            Helper\sl('logger')
                ->addDebug("Correctly installed update {$this->getVersion()} .", []);
        }
        else
        {
            Helper\sl('"errorManager"')
                ->addError(self::class, "Incorrectly installed update {$this->getVersion()} .", []);
        }

    }
}
