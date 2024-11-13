<?php

namespace ModulesGarden\Servers\ProxmoxVps\Core\App\Packages;

use ModulesGarden\Servers\ProxmoxVps\Core\FileReader\Directory;
use ModulesGarden\Servers\ProxmoxVps\Core\ModuleConstants;

class PackageManager
{
    const STATUS_ACTIVE = 'active';
    const STATUS_INACTIVE = 'inactive';

    const STATUS_REASON_INACTIVE = 'Inactive in the configuration';
    const STATUS_REASON_CONFIG_MISSING = 'Inactive because of lack of the configuration file';

    protected $packageList = [];

    public function __construct()
    {
        $this->loadPackages();
    }

    public function getPackageConfiguration($packageName)
    {
        if (isset($this->packageList[$packageName]))
        {
            return $this->packageList[$packageName];
        }

        return null;
    }

    public function getPackagesConfiguration()
    {
        return $this->packageList;
    }

    protected function loadPackages()
    {
        $packageList = $this->getPackageListByDirectory();
        foreach ($packageList as $className)
        {
            $config = new $className();
            $packageName = $config->getName();

            if ($this->isNameValid($packageName) && $this->isVersionValid($config->{PackageConfigurationConst::VERSION}) && $this->isStatusValid($config->{AppPackageConfiguration::PACKAGE_STATUS}))
            {
                $this->packageList[$packageName] = $config;
            }
        }
    }

    public function getPackageListByDirectory()
    {
        $directoryHelper = new Directory();

        $packagesDirectory = ModuleConstants::getModuleRootDir() . DIRECTORY_SEPARATOR . 'packages';

        $packagesList = $directoryHelper->getFilesList($packagesDirectory);

        $existing = [];
        foreach ($packagesList as $packageName)
        {
            $className = '\ModulesGarden\Servers\ProxmoxVps\Packages\\' . $packageName . '\Config\PackageConfiguration';
            if (class_exists($className) && is_subclass_of($className, BasePackageConfiguration::class))
            {
                $existing[] = $className;
            }
        }

        return $existing;
    }

    public function isNameValid($name = null)
    {
        if(trim($name) === '' || !is_string($name))
        {
            return false;
        }

        return true;
    }

    public function isVersionValid($version = null)
    {
        if(trim($version) === '' || !is_string($version))
        {
            return false;
        }

        return true;
    }

    public function isStatusValid($status = null)
    {
        if(!in_array($status, [AppPackageConfiguration::PACKAGE_STATUS_ACTIVE, AppPackageConfiguration::PACKAGE_STATUS_INACTIVE]))
        {
            return false;
        }

        return true;
    }
}
