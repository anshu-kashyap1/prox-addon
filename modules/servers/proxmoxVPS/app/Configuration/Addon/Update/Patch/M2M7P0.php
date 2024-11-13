<?php

namespace ModulesGarden\Servers\ProxmoxVps\App\Configuration\Addon\Update\Patch;

use ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Update\Patch\AbstractPatch;
use function ModulesGarden\Servers\ProxmoxVps\Core\Helper\sl;

/**
 * Description of M2M6P0
 *
 * @author <slawomir@modulesgarden.com>
 */
class M2M7P0 extends AbstractPatch
{
    public function execute()
    {
        if ($this->runSchema())
        {
            sl('logger')
                ->addDebug("Correctly installed update {$this->getVersion()} .", []);
        }
        else
        {
            sl('errorManager')
                ->addError(self::class, "Incorrectly installed update {$this->getVersion()} .", []);
        }

    }
}
