<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers;

use ModulesGarden\Servers\ProxmoxVps\Core\ServiceLocator;

abstract class AppController
{
    public function runController($callerName, $params)
    {
        $controller = $this->getControllerInstanceClass($callerName, $params);

        $controllerInstance = ServiceLocator::call($controller);

        $result = $controllerInstance->runExecuteProcess($params);

        return $result;
    }
}
