<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Activate;

use ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update\DefaultPatch;
use ModulesGarden\ProxmoxAddon\Core\Helper\DatabaseHelper;

/**
 * Description of After
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class After extends \ModulesGarden\ProxmoxAddon\Core\Configuration\Addon\Activate\After
{

    /**
     * @return array
     */
    public function execute(array $params = [])
    {
        $return      = parent::execute($params);
        $defaultPath = new DefaultPatch(new DatabaseHelper);
        $defaultPath->up();
        return $return;
    }
}
