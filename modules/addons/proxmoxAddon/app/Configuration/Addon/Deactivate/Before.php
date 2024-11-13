<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Deactivate;

/**
 * Description of Before
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class Before extends \ModulesGarden\ProxmoxAddon\Core\Configuration\Addon\Deactivate\Before
{

    /**
     * @return array
     */
    public function execute($params = [])
    {
        $return = parent::execute($params);

        return $return;
    }
}
