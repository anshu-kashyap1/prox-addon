<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Instances\Http;

use \ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Interfaces\AdminArea;
use \ModulesGarden\Servers\ProxmoxVps\Core\App\Controllers\Instances\HttpController;

class AdminServicesTabFieldsIntegration extends HttpController implements AdminArea
{
    protected $templateName = 'adminServicesTabFieldsIntegration';
    protected $templateDir = null;

    public function execute($response = null)
    {
        $this->loadLangContext();
        $this->setControllerResult($response);

        if (!$this->controllerResult)
        {
            return '';
        }

        return ['' => $this->resolveResponse()];
    }

    public function resolveResponse()
    {
        if ($this->controllerResult instanceof \ModulesGarden\Servers\ProxmoxVps\Core\Http\Response)
        {
            $this->controllerResult->setForceHtml();
        }

        return $this->responseResolver->setResponse($this->controllerResult)
            ->setTemplateName($this->getTemplateName())
            ->setTemplateDir($this->getTemplateDir())
            ->setPageController($this)
            ->resolve();
    }
}
