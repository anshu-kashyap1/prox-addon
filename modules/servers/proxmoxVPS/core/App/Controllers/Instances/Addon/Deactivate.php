<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Instances\Addon;

use ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Interfaces\AddonController;
use ModulesGarden\Servers\ProxmoxVps\Core\ServiceLocator;

/**
 * Deactivate module action
 */
class Deactivate extends \ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Instances\AddonController implements AddonController
{

    /**
     * @param array $params
     * @return array
     */
    public function execute($params = [])
    {
        try
        {
            // before
            $return = ServiceLocator::call(\ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Deactivate\Before::class)->execute($params);

            if (!isset($return['status']))
            {
                $return['status'] = 'success';
            }

            // after
            $return = ServiceLocator::call(\ModulesGarden\Servers\ProxmoxVps\Core\Configuration\Addon\Deactivate\After::class)->execute($return);

            return $return;
        }
        catch (\Exception $exc)
        {
            ServiceLocator::call(\ModulesGarden\Servers\ProxmoxVps\Core\HandlerError\ErrorManager::class)->addError(self::class, $exc->getMessage(), $return);
            return [
                'status' => 'error',
                'description' => $exc->getMessage()
            ];
        }
    }
}
