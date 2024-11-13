<?php


namespace ModulesGarden\ProxmoxAddon\App\Configuration\Addon\Update;


use ModulesGarden\ProxmoxAddon\App\Models\ProductConfiguration;

class ProductCloudConveter
{
    const  data = [
        "virtualization_type"              => [
            "newSetting" => "virtualization",
            'newValue'   => ["KVM" => "qemu", "LXC" => "lxc"]
        ],
        "default_node"                     => [
            "newSetting" => "defaultNode",
            'newValue'   => ["Server-Node" => "serverNode", "Auto-Node" => "autoNode"]
        ],
        "console_ip"                       => [
            "newSetting" => "consoleHost",
            'newValue'   => []
        ],
        "available_resources"              => [
            "newSetting" => "checkResources",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "backupVmBeforeRebuild"            => [
            "newSetting" => "backupVmBeforeReinstall",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "user_prefix"                      => [
            "newSetting" => "userPrefix",
            'newValue'   => []
        ],
        "user_comment"                     => [
            "newSetting" => "userComment",
            'newValue'   => []
        ],
        "domains"                          => [
            "newSetting" => "realm",
            'newValue'   => []
        ],
        "roles"                            => [
            "newSetting" => "userRole",
            'newValue'   => []
        ],
        "lxc_storage"                      => [
            "newSetting" => "storage",
            'newValue'   => []
        ],
        "lxc_arch"                         => [
            "newSetting" => "arch",
            'newValue'   => []
        ],
        "lxc_cmode"                        => [
            "newSetting" => "cmode",
            'newValue'   => []
        ],
        "lxc_console"                      => [
            "newSetting" => "console",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_ostype"                       => [
            "newSetting" => "ostype",
            'newValue'   => []
        ],
        "lxc_onboot"                       => [
            "newSetting" => "onboot",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_pool"                         => [
            "newSetting" => "pool",
            'newValue'   => []
        ],
        "lxc_protection"                   => [
            "newSetting" => "protection",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_description"                  => [
            "newSetting" => "description",
            'newValue'   => []
        ],
        "lxc_startup"                      => [
            "newSetting" => "startup",
            'newValue'   => []
        ],
        "lxc_ostemplates"                  => [
            "newSetting" => "permissionOsTemplates",
            'newValue'   => []
        ],
        "lxc_tty"                          => [
            "newSetting" => "tty",
            'newValue'   => []
        ],
        "lxc_unprivileged"                 => [
            "newSetting" => "unprivileged",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_sshKeyPairs"                  => [
            "newSetting" => "sshKeyPairs",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_sshDeletePrivateKey"          => [
            "newSetting" => "sshDeletePrivateKey",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_cpulimit"                     => [
            "newSetting" => "cpulimit",
            'newValue'   => []
        ],
        "default_cpu_cores_limit"                        => [
            "newSetting" => "cores",
            'newValue'   => []
        ],
        "lxc_swap"                         => [
            "newSetting" => "swap",
            'newValue'   => []
        ],
        "lxc_cpuunits"                     => [
            "newSetting" => "cpuunits",
            'newValue'   => []
        ],
        "default_memory_limit"                       => [
            "newSetting" => "memory",
            'newValue'   => []
        ],
        "default_storage_limit"                         => [
            "newSetting" => "storageSize",
            'newValue'   => []
        ],
        "default_ip_addresses_limit"                         => [
            "newSetting" => "ipv4",
            'newValue'   => []
        ],
        "default_ipv6_addresses_limit"                         => [
            "newSetting" => "ipv6",
            'newValue'   => []
        ],
        "lxc_snapshots_limit"              => [
            "newSetting" => "snapshotMaxFiles",
            'newValue'   => []
        ],
        "default_backup_limit_gb"              => [
            "newSetting" => "backupMaxSize",
            'newValue'   => []
        ],
        "default_backup_limit_maxfile"         => [
            "newSetting" => "backupMaxFiles",
            'newValue'   => []
        ],
        "default_bandwidth_limit"              => [
            "newSetting" => "bandwidth",
            'newValue'   => []
        ],
        "lxc_lan_rate"                     => [
            "newSetting" => "rate",
            'newValue'   => []
        ],
        "lxc_minimum_rate"                 => [
            "newSetting" => "minimumRate",
            'newValue'   => []
        ],
        "lxc_mpStorage"                    => [
            "newSetting" => "mountPointStorage",
            'newValue'   => []
        ],
        "lxc_mpAcl"                        => [
            "newSetting" => "mountPointAcl",
            'newValue'   => []
        ],
        "lxc_mpRo"                         => [
            "newSetting" => "mountPointRo",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "lxc_mpQuota"                      => [
            "newSetting" => "mountPointQuota",
            'newValue'   => []
        ],
        "lxc_mpReplicate"                  => [
            "newSetting" => "mountPointReplicate",
            'newValue'   => []
        ],
        "lxc_ipv4_mode"                    => [
            "newSetting" => "ipv4NetworkMode",
            'newValue'   => []
        ],
        "lxc_ipv6_mode"                    => [
            "newSetting" => "ipv6NetworkMode",
            'newValue'   => []
        ],
        "lxc_bridge"                       => [
            "newSetting" => "bridge",
            'newValue'   => []
        ],
        "lxc_vlantag_from"                 => [
            "newSetting" => "tagFrom",
            'newValue'   => []
        ],
        "lxc_vlantag_to"                   => [
            "newSetting" => "tagTo",
            'newValue'   => []
        ],
        "lxc_private_bridge"               => [
            "newSetting" => "privateBridge",
            'newValue'   => []
        ],
        "lxc_firewall"                     => [
            "newSetting" => "networkFirewall",
            'newValue'   => ["0" => "off", "1" => "on"]
        ],
        "kvm_ostype"                       => [
            "newSetting" => "ostype",
            'newValue'   => []
        ],
        "kvm_acpi"                         => [
            "newSetting" => "acpi",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_agent"                        => [
            "newSetting" => "agent",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_args"                         => [
            "newSetting" => "args",
            'newValue'   => []
        ],
        "kvm_autostart"                    => [
            "newSetting" => "autostart",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_balloon"                      => [
            "newSetting" => "balloon",
            'newValue'   => []
        ],
        "kvm_shares"                       => [
            "newSetting" => "shares",
            'newValue'   => []
        ],
        "kvm_cdrom"                        => [
            "newSetting" => "cdrom",
            'newValue'   => []
        ],
        "kvm_cpu"                          => [
            "newSetting" => "cpu",
            'newValue'   => []
        ],
        "kvm_numa"                         => [
            "newSetting" => "numa",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_pcid"                         => [
            "newSetting" => "pcid",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_spec-ctrl"                    => [
            "newSetting" => "spec-ctrl",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_description"                  => [
            "newSetting" => "description",
            'newValue'   => []
        ],
        "kvm_freeze"                       => [
            "newSetting" => "freeze",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_hotplug"                      => [
            "newSetting" => "hotplug",
            'newValue'   => []
        ],
        "kvm_cdrom"                        => [
            "newSetting" => "cdrom",
            'newValue'   => []
        ],
        "kvm_keyboard"                     => [
            "newSetting" => "keyboard",
            'newValue'   => []
        ],
        "kvm_kvm"                          => [
            "newSetting" => "kvm",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_localtime"                    => [
            "newSetting" => "localtime",
            'newValue'   => ['Yes' => "on", 'No' => "off"]
        ],
        "kvm_migrate_downtime"             => [
            "newSetting" => "migrate_downtime",
            'newValue'   => []
        ],
        "kvm_onboot"                       => [
            "newSetting" => "onboot",
            'newValue'   => ['Yes' => "on", 'No' => "off"]
        ],
        "kvm_pool"                         => [
            "newSetting" => "pool",
            'newValue'   => []
        ],
        "kvm_reboot"                       => [
            "newSetting" => "reboot",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_startdate"                    => [
            "newSetting" => "startdate",
            'newValue'   => []
        ],
        "kvm_startup"                      => [
            "newSetting" => "startup",
            'newValue'   => []
        ],
        "kvm_storage"                      => [
            "newSetting" => "diskStorage",
            'newValue'   => []
        ],
        "kvm_tablet"                       => [
            "newSetting" => "tablet",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_tdf"                          => [
            "newSetting" => "tdf",
            'newValue'   => ['Enable' => "on", 'Disable' => "off"]
        ],
        "kvm_vga"                          => [
            "newSetting" => "vga",
            'newValue'   => []
        ],
        "kvm_watchdog"                     => [
            "newSetting" => "watchdog",
            'newValue'   => []
        ],
        "kvm_os_template"                  => [
            "newSetting" => "permissionOsTemplates",
            'newValue'   => []
        ],
        "kvm_cloneMode"                    => [
            "newSetting" => "cloneMode",
            'newValue'   => []
        ],
        "kvm_sockets"                      => [
            "newSetting" => "sockets",
            'newValue'   => []
        ],
        "kvm_vcpus"                        => [
            "newSetting" => "vcpus",
            'newValue'   => []
        ],
        "default_cpuLimit"                     => [
            "newSetting" => "cpulimit",
            'newValue'   => []
        ],
        "default_cpuunits_limit"                     => [
            "newSetting" => "cpuunits",
            'newValue'   => []
        ],
        "kvm_lan_rate"                     => [
            "newSetting" => "rate",
            'newValue'   => []
        ],
        "kvm_minimum_rate"                 => [
            "newSetting" => "minimumRate",
            'newValue'   => []
        ],
        "kvm_cdrom_isoimage"               => [
            "newSetting" => "isoImage",
            'newValue'   => []
        ],
        "kvm_disk_type"                    => [
            "newSetting" => "diskType",
            'newValue'   => ['IDE' => "ide", 'SATA' => 'sata', 'VIRTIO' => 'virtio', 'SCSI' => 'scsi']
        ],
        "kvm_disk_format"                  => [
            "newSetting" => "diskFormat",
            'newValue'   => []
        ],
        "kvm_disk_cache"                   => [
            "newSetting" => "diskCache",
            'newValue'   => []
        ],
        "kvm_scsihw"                       => [
            "newSetting" => "scsihw",
            'newValue'   => []
        ],
        "kvm_discard"                      => [
            "newSetting" => "discard",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_replicate"                    => [
            "newSetting" => "replicate",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_ioThread"                     => [
            "newSetting" => "ioThread",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_AdditionalDisksStorage"       => [
            "newSetting" => "additionalDiskStorage",
            'newValue'   => []
        ],
        "kvm_AdditionalDisksType"          => [
            "newSetting" => "additionalDiskType",
            'newValue'   => ['IDE' => "ide", 'SATA' => 'sata', 'VIRTIO' => 'virtio', 'SCSI' => 'scsi'],
        ],
        "kvm_AdditionalDisksFrmats"        => [
            "newSetting" => "additionalDiskFormat",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskCache"          => [
            "newSetting" => "additionalDiskCache",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskReplicate"      => [
            "newSetting" => "additionalDiskReplicate",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_AdditionalDiskDiscard"        => [
            "newSetting" => "additionalDiskDiscard",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_AdditionalDiskIoThread"       => [
            "newSetting" => "additionalDiskIoThread",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_AdditionalDiskAllowBackups"   => [
            "newSetting" => "permissionAdditionalDiskBackup",
            'newValue'   => ['1' => "on", '0' => "off"]
        ],
        "kvm_DiskReadLimit"                => [
            "newSetting" => "mbps_rd",
            'newValue'   => []
        ],
        "kvm_DiskWriteLimit"               => [
            "newSetting" => "mbps_wr",
            'newValue'   => []
        ],
        "kvm_iops_rd"                      => [
            "newSetting" => "iops_rd",
            'newValue'   => []
        ],
        "kvm_iops_rd"                      => [
            "newSetting" => "iops_rd",
            'newValue'   => []
        ],
        "kvm_iops_rd_max"                  => [
            "newSetting" => "iops_rd_max",
            'newValue'   => []
        ],
        "kvm_iops_wr"                      => [
            "newSetting" => "iops_wr",
            'newValue'   => []
        ],
        "kvm_iops_wr_max"                  => [
            "newSetting" => "iops_wr_max",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskReadLimit"      => [
            "newSetting" => "additionalDiskMbps_rd",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskWriteLimit"     => [
            "newSetting" => "additionalDiskMbps_wr",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskIops_rd"        => [
            "newSetting" => "additionalDiskIops_rd",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskIops_rd_max"    => [
            "newSetting" => "additionalDiskIops_rd_max",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskIops_wr"        => [
            "newSetting" => "additionalDiskIops_wr",
            'newValue'   => []
        ],
        "kvm_AdditionalDiskIops_wr_max"    => [
            "newSetting" => "additionalDiskIops_wr_max",
            'newValue'   => []
        ],
        "kvm_cdrom_type"                   => [
            "newSetting" => "cdromType",
            'newValue'   => [ 'IDE' => 'ide', 'SATA' => 'sata', 'SCSI' =>  'scsi']
        ],
        "kvm_cdrom_isoimage"                    => [
            "newSetting" => "permissionIsoImages",
            'newValue'   => []
        ],
        "kvm_lan_bridge"                   => [
            "newSetting" => "bridge",
            'newValue'   => []
        ],
        "kvm_lan_network_model"            => [
            "newSetting" => "networkModel",
            'newValue'   => []
        ],
        "kvm_disable_additional_nic"       => [
            "newSetting" => "oneNetworkDevice",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "kvm_vlantag_from"                 => [
            "newSetting" => "tagFrom",
            'newValue'   => []
        ],
        "kvm_vlantag_to"                   => [
            "newSetting" => "tagTo",
            'newValue'   => []
        ],
        "kvm_private_bridge"               => [
            "newSetting" => "privateBridge",
            'newValue'   => []
        ],
        "kvm_private_lan_network_model"    => [
            "newSetting" => "networkPrivateModel",
            'newValue'   => []
        ],
        "kvm_network_firewall"             => [
            "newSetting" => "networkFirewall",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "kvm_queues"                       => [
            "newSetting" => "queues",
            'newValue'   => []
        ],
        "kvm_boot_1"                       => [
            "newSetting" => "bootDevice1",
            'newValue'   => []
        ],
        "kvm_boot_2"                       => [
            "newSetting" => "bootDevice2",
            'newValue'   =>  []
        ],
        "kvm_boot_3"                       => [
            "newSetting" => "bootDevice3",
            'newValue'   =>  []
        ],
        "kvm_bootdisk"                     => [
            "newSetting" => "bootdisk",
            'newValue'   =>  []
        ],
        "backup_storage"                   => [
            "newSetting" => "backupStorage",
            'newValue'   => ["Hard Disk" => "c", "Network" => "n", "CD-ROM" => "d"]
        ],
        "backup_routing"                   => [
            "newSetting" => "backupRouting",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "backup_delete_older_than"         => [
            "newSetting" => "backupStoreDays",
            'newValue'   => []
        ],
        "firewall_interfaces"              => [
            "newSetting" => "firewallInterfaces",
            'newValue'   => []
        ],
        "firewall_rules_limit"             => [
            "newSetting" => "firewallMaxRules",
            'newValue'   => []
        ],
        "kvm_ipset_ip_filter"              => [
            "newSetting" => "ipsetIpFilter",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "cluster_state"                    => [
            "newSetting" => "clusterState",
            'newValue'   => []
        ],
        "cluster_group"                    => [
            "newSetting" => "clusterGroup",
            'newValue'   => []
        ],
        "cluster_max_restart"              => [
            "newSetting" => "clusterMaxRestart",
            'newValue'   => []
        ],
        "cluster_max_relocate"             => [
            "newSetting" => "clusterMaxRelocate",
            'newValue'   => []
        ],
        "kvm_cloudInit"                    => [
            "newSetting" => "cloudInit",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "kvm_ciuser"                       => [
            "newSetting" => "ciuser",
            'newValue'   => []
        ],
        "loadBalancer"                     => [
            "newSetting" => "loadBalancer",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "loadBalancerOnUpgrade"            => [
            "newSetting" => "loadBalancerOnUpgrade",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "loadBalancerShutdownOnUpgrade"    => [
            "newSetting" => "loadBalancerShutdownOnUpgrade",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "loadBalancerStopOnUpgrade"        => [
            "newSetting" => "loadBalancerStopOnUpgrade",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "per_boot"                         => [
            "newSetting" => "permissionStart",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_reboot"                       => [
            "newSetting" => "permissionReboot",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_stop"                         => [
            "newSetting" => "permissionStop",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_shutdown"                     => [
            "newSetting" => "permissionShutdown",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_novnc_console"                => [
            "newSetting" => "permissionNovnc",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "per_spice_console"                => [
            "newSetting" => "permissionSpice",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "xtermjsConsole"                   => [
            "newSetting" => "permissionXtermjs",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "per_reinstallation"               => [
            "newSetting" => "permissionReinstall",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "kvm_per_kvm_templates"            => [
            "newSetting" => "permissionOsTemplate",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "kvm_per_iso_images"               => [
            "newSetting" => "permissionIsoImage",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "kvm_snapshots_limit"              => [
            "newSetting" => "snapshotMaxFiles",
            'newValue'   => []
        ],
        "per_mrtg_graphics"                => [
            "newSetting" => "permissionGraph",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "backup_list"                      => [
            "newSetting" => "permissionBackup",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "backup_jobs"                      => [
            "newSetting" => "permissionBackupJob",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_task_history"                 => [
            "newSetting" => "permissionTaskHistory",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_network"                      => [
            "newSetting" => "permissionNetwork",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_snapshots"                    => [
            "newSetting" => "permissionSnapshot",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_firewall"                     => [
            "newSetting" => "permissionFirewall",
            'newValue'   => ['No' => "off", 'Yes' => "on"]
        ],
        "per_firewallOptions"              => [
            "newSetting" => "permissionFirewall",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "per_DisksManagement"              => [
            "newSetting" => "permissionDisk",
            'newValue'   => ['0' => "off", '1' => "on"]
        ],
        "memory_unit"  => [
            "newSetting" => "memoryUnit",
            'newValue'   => []
        ],
        "swap_unit"  => [
            "newSetting" => "swapUnit",
            'newValue'   => []
        ],
        "disk_unit"  => [
            "newSetting" => "diskUnit",
            'newValue'   => []
        ],
        "adisk_unit"  => [
            "newSetting" => "additionalDiskUnit",
            'newValue'   => []
        ],
        'locations' => [
            "newSetting" => "locations",
            'newValue'   => []
        ],
        'default_ipv6' => [
            "newSetting" => "permissionIpv6",
            'newValue'   => ['1' => 'on', '0' => 'off']
        ],
        'default_ipv4' => [
            "newSetting" => "permissionIpv4",
            'newValue'   => ['1' => 'on', '0' => 'off']
        ],
        //Default Configuration
        'kvm_private_network_limit' => [
            "newSetting" => "virtualNetworks",
            'newValue'   => []
        ],
        'lxc_networkRate'  => [
            "newSetting" => "rate",
            'newValue'   => []
        ],
        'lxc_private_network_limit' => [
            "newSetting" => "virtualNetworks",
            'newValue'   => []
        ],
        //Server Limits
        'kvm_limit_sockets' => [
            "newSetting" => "serverSockets",
            'newValue'   => []
        ],
        'kvm_limit_vcpus' => [
            "newSetting" => "serverVcpus",
            'newValue'   => []
        ],
        'kvm_limit_cores' => [
            "newSetting" => "serverCores",
            'newValue'   => []
        ],
        'lxc_limit_cpu'=> [
            "newSetting" => "serverCores",
            'newValue'   => []
        ],
        'limit_cpulimit'=> [
            "newSetting" => "serverCpulimit",
            'newValue'   => []
        ],
        'limit_cpuunits'=> [
            "newSetting" => "serverCpuunit",
            'newValue'   => []
        ],
         'limit_memory'=> [
             "newSetting" => "serverMemory",
             'newValue'   => []
         ],
        'lxc_limit_swap' => [
            "newSetting" => "serverSwap",
            'newValue' => []
        ],
        'limit_storage' => [
            "newSetting" => "serverDiskSize",
            'newValue' => []
        ],
        'limit_ipv4' => [
            "newSetting" => "serverIpv4",
            'newValue' => []
        ],
        'limit_ipv6' => [
            "newSetting" => "serverIpv6",
            'newValue' => []
        ],
        //Cloud-Init
        'kvm_cloudInitSetUsername'=> [
            "newSetting" => "permissionUsername",
            'newValue' => ['1' => 'on', '0'=> 'off']
        ],
        'kvm_cipassword'=> [
            "newSetting" => "permissionPassword",
            'newValue' => ['1' => 'on', '0'=> 'off']
        ],
         'kvm_sshkeys'=> [
             "newSetting" => "permissionSshkeys",
             'newValue' => ['1' => 'on', '0'=> 'off']
         ],
        'kvm_searchdomain' => [
            "newSetting" => "permissionSearchdomain",
            'newValue' => ['1' => 'on', '0' => 'off']
        ],
        'kvm_nameserver' => [
            "newSetting" => "permissionNameservers",
            'newValue' => ['1' => 'on', '0' => 'off']
        ],
    ];

    /**
     * @param $key
     * @param $value
     * @param $productId
     * @return ProductConfiguration|null
     */
    public function convert($key, $value, $productId)
    {
        if (!self::data[$key] && !self::data[$key]['newSetting'])
        {
            return null;
        }
        $setting          = new ProductConfiguration();
        $setting->setting = self::data[$key]['newSetting'];
        if (preg_match("/\[\"/", $value))
        {
            $value = \json_decode($value, true);
        }
        $isset = !empty(self::data[$key]['newValue'][$value]);
        $method = self::data[$key]['newSetting'];
        if( method_exists($this,   $method )){
            $this-> $method($value);
            $setting->value = $value;
        }
        else  if ($isset && !is_array($value))
        {
            $setting->value = self::data[$key]['newValue'][$value];
        }
        else if(is_array($value) &&  $isset){
            $newValue=[];
            foreach($value as &$v){
                $oldValue = $v;
                if(!empty(self::data[$key]['newValue'][$oldValue])){
                    $newValue[]=self::data[$key]['newValue'][$oldValue];
                }
            }
            $setting->value = $newValue;

        }
        else
        {
            $setting->value = $value;
        }
        $setting->product_id = $productId;
        return $setting;
    }

    public function exist(ProductConfiguration $setting)
    {
        return ProductConfiguration::ofProductId($setting->product_id)->ofSetting($setting->setting)->count();
    }

    public function additionalDiskType(&$value){
        foreach ($value as &$v){
            $v= strtolower($v);
        }
    }

}