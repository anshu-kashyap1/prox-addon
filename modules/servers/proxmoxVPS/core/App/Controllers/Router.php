<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers;

class Router
{
    use \ModulesGarden\Servers\ProxmoxVps\Core\Traits\Lang;
    use \ModulesGarden\Servers\ProxmoxVps\Core\Traits\Smarty;
    use \ModulesGarden\Servers\ProxmoxVps\Core\Traits\OutputBuffer;
    use \ModulesGarden\Servers\ProxmoxVps\Core\Traits\IsAdmin;
    use \ModulesGarden\Servers\ProxmoxVps\Core\UI\Traits\RequestObjectHandler;

    const ADMIN = 'admin';
    const CLIENT = 'client';

    protected $controllerClass = null;
    protected $controllerMethod = null;

    public function __construct()
    {
        $this->isAdmin();
        $this->loadController();
    }

    /**
     * load routing params
     */
    public function loadController()
    {
        $this->getControllerClass();
        $this->getControllerMethod();
    }

    /**
     * @return string
     * class name of the controller
     */
    public function getControllerClass()
    {
        if ($this->controllerClass === null)
        {
            $this->controllerClass = '\ModulesGarden\Servers\ProxmoxVps\App\Http\\' . ucfirst($this->getControllerType()) . '\\' . ucfirst($this->getController());
        }

        return $this->controllerClass;
    }

    /**
     * @return string
     * admin/client context type
     */
    public function getControllerType()
    {
        return $this->isAdminStatus ? self::ADMIN : self::CLIENT;
    }

    /**
     * @return string
     * get controller name
     */
    public function getController()
    {
        return filter_var($this->getRequestValue('mg-page', 'Home'), FILTER_SANITIZE_SPECIAL_CHARS);
    }

    /**
     * @return string
     * controller method name
     */
    public function getControllerMethod()
    {
        if ($this->controllerMethod === null)
        {
            $this->controllerMethod = $this->request->get('mg-action', 'index');
        }

        return $this->controllerMethod;
    }

    /**
     * @return bool
     * determines if controller can be called
     */
    public function isControllerCallable()
    {
        if (!class_exists($this->controllerClass))
        {
            return false;
        }

        if (!method_exists($this->controllerClass, $this->controllerMethod))
        {
            return false;
        }

        $controllerClassObj = new $this->controllerClass();
        if (!is_callable([$controllerClassObj, $this->controllerMethod]))
        {
            return false;
        }

        return true;
    }
}
