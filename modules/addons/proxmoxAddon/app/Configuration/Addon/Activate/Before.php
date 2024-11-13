<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Activate;

/**
 * Description of Before
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class Before extends \ModulesGarden\ProxmoxAddon\Core\Configuration\Addon\Activate\Before
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
