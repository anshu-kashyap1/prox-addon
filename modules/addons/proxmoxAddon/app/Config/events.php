<?php

return [
    \ModulesGarden\ProxmoxAddon\App\Events\Vps\VmCreatedEvent::class     => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Vps\VmCreatedListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Vps\VmReinstalledEvent::class => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Vps\VmReinstalledListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Vps\QemuUpdateEvent::class    => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Vps\QemuUpdateListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Vps\LxcUpdateEvent::class     => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Vps\LxcUpdateListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Cloud\VmCreatedEvent::class     => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Cloud\VmCreatedListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Cloud\VmReinstalledEvent::class => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Cloud\VmReinstalledListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Cloud\QemuUpdateEvent::class    => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Cloud\QemuUpdateListener::class
    ],
    \ModulesGarden\ProxmoxAddon\App\Events\Cloud\LxcUpdateEvent::class     => [
        \ModulesGarden\ProxmoxAddon\App\Listeners\Cloud\LxcUpdateListener::class
    ]

];