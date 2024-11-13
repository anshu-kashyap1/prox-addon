<?php

namespace ModulesGarden\Servers\ProxmoxVps\App\Configuration\Addon\Deactivate;

/**
 * Runs before addon deactivation
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class Before extends \ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Deactivate\Before
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
