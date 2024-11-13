<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Interfaces;

interface AppController
{
    public function getControllerInstanceClass($callerName, $params);
}
