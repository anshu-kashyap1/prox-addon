<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Requirements;

/**
 * Description of Handler
 *
 * @author INBSX-37H
 */
class Checker
{
    /** 
     * \ModulesGarden\Servers\ProxmoxVps\Core\FileReader\PathValidator
     * @var type null|\ModulesGarden\Servers\ProxmoxVps\Core\FileReader\|\ModulesGarden\Servers\ProxmoxVps\Core\FileReader\Directory
     */
    protected $directoryHandler = null;
    
    protected $requirementsList = [];
    
    protected $checkResaults = [];
    
    /** 
     * Paths for Requirements class to be placed in
     * @var type array
     */
    const PATHS = [
        'app' . DIRECTORY_SEPARATOR . 'Configuration' . DIRECTORY_SEPARATOR . 'Requirements',
        'core' . DIRECTORY_SEPARATOR . 'Configuration' . DIRECTORY_SEPARATOR . 'Requirements'
    ];
 
    public function __construct()
    {
        $this->directoryHandler = new \ModulesGarden\Servers\ProxmoxVps\Core\FileReader\Directory();

        $this->loadRequirements();
        
        $this->checkRequirements();
    }
    
    protected function loadRequirements()
    {
        foreach (self::PATHS as $path)
        {
            $this->loadClassesByPath($path);
        }
    }
    
    protected function loadClassesByPath($path)
    {
        $fullPath = \ModulesGarden\Servers\ProxmoxVps\Core\ModuleConstants::getModuleRootDir() . DIRECTORY_SEPARATOR . $path;
        $files = $this->directoryHandler->getFilesList($fullPath, '.php', true);
        $classNamespace = $this->getClassNamespaceByPath($path);
        foreach ($files as $file)
        {
            $className = $classNamespace . $file;
            if (!class_exists($className) || !is_subclass_of($className, RequirementInterface::class))
            {
                continue;
            }
            
            $this->requirementsList[] = $className;
        }
    }
    
    protected function getClassNamespaceByPath($path)
    {
        $contextParts = explode('\\', self::class);
        $coreParts = explode(DIRECTORY_SEPARATOR, $path);

        $mergeArray = in_array($contextParts[1], ['Servers', 'Registrars'])
            ? [$contextParts[0], $contextParts[1], $contextParts[2]] : [$contextParts[0], $contextParts[1]];

        $allParts = array_merge($mergeArray, $coreParts);
        array_walk($allParts, function(&$item){
            $item = ucfirst($item);
        });
        
        return '\\' . implode('\\', $allParts) . '\\';
    }
    
    protected function checkRequirements()
    {
        foreach ($this->requirementsList as $requirement)
        {
            $instance = \ModulesGarden\Servers\ProxmoxVps\Core\DependencyInjection\DependencyInjection::call($requirement);
            $handler = $instance->getHandlerInstance();
            
            $this->checkResaults = array_merge($this->checkResaults, $handler->getUnfulfilledRequirements());
        }
    }
    
    public function getUnfulfilledRequirements()
    {
        return $this->checkResaults;
    }
}
