<?php

namespace ModulesGarden\ProxmoxAddon\App\Configuration\Requirements;

use ModulesGarden\ProxmoxAddon\Core\App\Requirements\ActionTypes;

/**
 * Description of RemoveFiles
 *
 * @author INBSX-37H
 */
class Files extends \ModulesGarden\ProxmoxAddon\Core\App\Requirements\Instances\Files
{
    protected $fileList = [
        [
            self::PATH => self::MODULE_PATH . '/storage',
            self::TYPE => self::IS_WRITABLE
        ],
        [
            self::PATH => self::MODULE_PATH . '/storage/app',
            self::TYPE => self::IS_WRITABLE
        ],
        [
            self::PATH => self::MODULE_PATH . '/storage/crons',
            self::TYPE => self::IS_WRITABLE
        ],
        [
            self::PATH => self::MODULE_PATH . '/storage/logs',
            self::TYPE => self::IS_WRITABLE
        ]
    ];
}
