<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Config;

/**
 * Description of Before
 *
 * @author Rafał Ossowski <rafal.os@modulesgarden.com>
 */
class Before extends \ModulesGarden\ProxmoxAddon\Core\Configuration\Addon\Config\Before
{

    /**
     * @return array
     */
    public function execute(array $params = [])
    {
        $return = parent::execute($params);

        return $return;
    }
}
