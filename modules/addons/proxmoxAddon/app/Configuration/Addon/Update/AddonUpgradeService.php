<?php


namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update;


use ModulesGarden\ProxmoxAddon\Core\ModuleConstants;
use Illuminate\Database\Capsule\Manager as DB;

class AddonUpgradeService
{

    public function getVersion(){
        $file = ModuleConstants::getModuleRootDir() . DIRECTORY_SEPARATOR . 'moduleVersion.php';
        if(file_exists($file)) {
            $content = file_get_contents($file);
            $moduleVersion = $this->findModuleVersion($content);

            if (!$moduleVersion) {
                throw new \Exception('Invalid module version');
            }

            return $moduleVersion;
        }
        return null;
    }

    public function getDatabaseVersion(){
        return DB::table("tbladdonmodules")->where("module","proxmoxAddon")->where("setting","version")->value("value");
    }
    public function run(){
        $version = $this->getVersion();
        if($version && $this->getDatabaseVersion() != $version ){

            if(!function_exists('proxmoxAddon_upgrade')){

                require_once ModuleConstants::getFullPath() . DIRECTORY_SEPARATOR . "proxmoxAddon.php";
            }
            if(function_exists('proxmoxAddon_upgrade')){
                \proxmoxAddon_upgrade([
                    "module"=> "proxmoxAddon",
                    "modulelink" => "addonmodules.php?module=proxmoxAddon",
                    "version"=> $version,
                    "access" => 1
                ]);
            }
        }
    }

    private function findModuleVersion($content)
    {
        $matches = [];
        preg_match('/\$moduleVersion\s?=\s?\'([A-Za-z0-9_\.\-]+)\'/', (string)$content, $matches);
        return $matches[1];
    }
}