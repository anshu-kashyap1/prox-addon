<?php

namespace ModulesGarden\Servers\ProxmoxVps\App\Configuration\Addon\Deactivate;

/**
 * Runs after addon deactivation
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class After extends \ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Deactivate\After
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
