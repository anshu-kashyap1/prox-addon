<?php

namespace ModulesGarden\Servers\ProxmoxVps\App\Configuration\Addon\Activate;

/**
 * Runs before module activation actions
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class Before extends \ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Activate\Before
{

    /**
     * @param array $params
     * @return array
     */
    public function execute(array $params = [])
    {
        $return = parent::execute($params);

        return $return;
    }
}
