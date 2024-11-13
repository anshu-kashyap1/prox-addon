<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Requirements\Handlers;

use ModulesGarden\Servers\ProxmoxVps\Core\App\Requirements\Handler;
use ModulesGarden\Servers\ProxmoxVps\Core\App\Requirements\HandlerInterface;
use ModulesGarden\Servers\ProxmoxVps\Core\App\Requirements\Instances\PhpExtensions as PhpExtensionsInstance;

/**
 * Description of PhpExtensions
 *
 * @author INBSX-37H
 */
class PhpExtensions extends Handler implements HandlerInterface
{
    use \ModulesGarden\Servers\ProxmoxVps\Core\Traits\Lang;
    
    protected $extensionsList = [];

    public function __construct(array $classList = [])
    {
        $this->extensionsList = $classList;
        
        $this->handleRequirements();
    }

    public function handleRequirements()
    {
        foreach ($this->extensionsList as $record)
        {
            $this->handleRequirement($record);
        }
    }

    protected function handleRequirement($record)
    {
        $extension = $record[PhpExtensionsInstance::EXTENSION_NAME];

        if (extension_loaded($extension))
        {
            return null;
        }

        $this->addUnfulfilledRequirement('In order for the module to work correctly, it requires the :extension_name: PHP extension to be installed.',
            ['extension_name' => $extension]);
    }
}
