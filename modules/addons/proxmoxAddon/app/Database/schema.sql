--
-- `#prefix#ModuleSettings`
-- 
CREATE TABLE IF NOT EXISTS `#prefix#ModuleSettings`
  (
     `setting` VARCHAR (255) NOT NULL UNIQUE,
     `value`   TEXT NOT NULL,
     PRIMARY KEY ( `setting` )
  ) engine=innodb DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
-- 
-- `mg_proxmox_addon_ip`
-- 
CREATE TABLE IF NOT EXISTS `mg_proxmox_addon_ip`
  (
     `id`            INT (11) NOT NULL auto_increment,
     `ip`            VARCHAR (200) NOT NULL,
     `type`          ENUM ('IPv4', 'IPv6', 'IPv6_Subnet') DEFAULT 'IPv4',
     `mac_address`   VARCHAR (200) DEFAULT NULL,
     `subnet_mask`   VARCHAR (200),
     `gateway`       VARCHAR (200),
     `cidr`          INT (6),
     `sid`           INT (11),
     `visualization` ENUM ('Auto', 'KVM', 'LXC') DEFAULT 'Auto',
     `last_check`    DATETIME DEFAULT NULL,
     `private`       TINYINT (1) DEFAULT 0,
     `hosting_id`    INT (11) DEFAULT 0,
     `trunks`        INT (11) DEFAULT NULL,
     `tag`           INT (11) DEFAULT NULL,
     `node`          VARCHAR (200) DEFAULT '0',
     `bridge`        VARCHAR (20) DEFAULT '',
     PRIMARY KEY ( `id` ),
     UNIQUE ( `ip` )
  ) engine=innodb DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
-- 
-- `mg_proxmox_vmranges`
-- 
CREATE TABLE IF NOT EXISTS `mg_proxmox_vmranges`
  (
     `server_id` INT (11) NOT NULL,
     `vmid_from` INT (11),
     `vmid_to`   INT (11),
     PRIMARY KEY ( `server_id` )
  ) engine=innodb DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
-- 
-- Table structure for table `mg_proxmox_addon_tasks`
-- 
CREATE TABLE IF NOT EXISTS `mg_proxmox_addon_tasks`
  (
     `id` INT (11) NOT NULL auto_increment,
     `hosting_id`  INT (11) NOT NULL,
     `upid`        VARCHAR (128) NOT NULL,
     `name`        VARCHAR (128) NOT NULL,
     `description` TEXT,
     `node`        VARCHAR (128) NOT NULL,
     `vmid`        INT (11) NOT NULL,
     `status`      INT (11) NOT NULL,
     `start_time`  DATETIME DEFAULT NULL,
     PRIMARY KEY ( `id` )
  ) engine=innodb DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
--
-- Table structure for table `mg_proxmox_addon_recovery_vm_list`
--
CREATE TABLE IF NOT EXISTS `mg_proxmox_addon_recovery_vm_list` (
  `id` INT (11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `server_id` int(11) NOT NULL,
  `vserver_id` int(11) NOT NULL,
  `node` varchar(128) NOT NULL,
  `vmid` int(11) NOT NULL,
  `virtualization` varchar(128) NOT NULL,
  `config` text,
  `status` text,
  `dns` text,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY ( `id` )
) ENGINE=InnoDB DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
-- 
-- `#prefix#NodeSetting`
-- 
CREATE TABLE IF NOT EXISTS `#prefix#NodeSetting`
  (
     `id`        INT (11) NOT NULL auto_increment,
     `server_id` INT (10) UNSIGNED NOT NULL,
     `node`      VARCHAR (64) NOT NULL,
     `setting`   VARCHAR (64) NOT NULL,
     `value`     TEXT NOT NULL,
     PRIMARY KEY ( `id` )
  ) engine=innodb DEFAULT charset=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ProductConfiguration`
--
CREATE TABLE IF NOT EXISTS `#prefix#ProductConfiguration` (
    `product_id` int(11),
    `setting`  varchar (255),
    `value`  text,
    PRIMARY KEY (`setting`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VmIpAddress`
--
CREATE TABLE IF NOT EXISTS `#prefix#VmIpAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11),
  `server_id` INT (11),
  `vm_id` INT (11) DEFAULT  null,
  `ip` varchar(200) NOT NULL,
  `mac_address` varchar(200) DEFAULT NULL,
  `subnet_mask` varchar(200),
  `gateway` varchar(200),
  `cidr` INT (6),
  `trunks` INT (11) DEFAULT NULL,
  `tag` INT (11) DEFAULT NULL,
  `net` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#User`
--
CREATE TABLE IF NOT EXISTS `#prefix#User` (
  `id`  int(12)    NOT NULL AUTO_INCREMENT,
  `user_id`  int(12),
  `hosting_id`  int(12) NOT NULL,
  `username` varchar(360) NOT NULL,
  `password` varchar(360) NOT NULL,
  `realm` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#KeyPair`
--
CREATE TABLE IF NOT EXISTS `#prefix#KeyPair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` INT(11) NOT NULL,
  `vm_id` INT (11) DEFAULT  null,
  `public` text NOT NULL,
  `private` text NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`hosting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#Job`
--
CREATE TABLE IF NOT EXISTS `#prefix#Job` (
    `id` int(10) unsigned  NOT NULL AUTO_INCREMENT,
    `retry_after` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `retry_count` int(10) unsigned NOT NULL,
    `job` varchar(255) NOT NULL,
    `data` text,
    `parent_id` int(10) unsigned DEFAULT NULL,
    `rel_id` int(10) unsigned DEFAULT NULL,
    `rel_type` varchar(32) DEFAULT NULL,
    `custom_id` int(10) unsigned DEFAULT NULL,
    `status` varchar(32) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`),
    KEY(`parent_id`),
    KEY(`rel_type`, `rel_id`, `custom_id`),
    KEY(`status`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#JobLog`
--
CREATE TABLE IF NOT EXISTS `#prefix#JobLog` (
    `id` int(10) unsigned  NOT NULL AUTO_INCREMENT,
    `job_id` int(10) unsigned NOT NULL,
    `type` varchar(32) NOT NULL,
    `message` varchar(512) NOT NULL,
    `additional` text,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `job_id` (`job_id`),
    KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#SnapshootJob`
--
CREATE TABLE IF NOT EXISTS `#prefix#SnapshotJob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `vm_id` INT (11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `description` text  DEFAULT NULL,
  `vmstate` TINYINT(1) DEFAULT NULL,
  `period` varchar(100) NOT NULL,
  `run_every` INT (2) DEFAULT NULL,
  `days` text DEFAULT NULL,
  `start_time`  TIME DEFAULT NULL,
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VmModel`
--
CREATE TABLE IF NOT EXISTS `#prefix#Vm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `server_id` int(11) DEFAULT NULL,
  `node` varchar(250) NOT NULL,
  `vmid` int(11) NOT NULL,
  `virtualization` varchar(128) NOT NULL,
  `name` varchar(250) NOT NULL ,
  `password` varchar(250) NOT NULL,
  `cores` INT (2) DEFAULT '0',
  `sockets` INT (2) DEFAULT '0',
  `vcpus` INT (2) DEFAULT '0',
  `cpulimit` FLOAT(5) DEFAULT '0',
  `cpuunits` INT (8) NULL,
  `memory`  INT (10) NOT NULL,
  `swap` INT (10) DEFAULT '0',
  `disk`  INT (10) NOT NULL,
  `disks` INT (12) DEFAULT '0',
  `netin` INT (12) DEFAULT '0',
  `netout` INT (12) DEFAULT '0',
  `template` INT (1) DEFAULT '0',
  `data`  text,
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`hosting_id`,`vmid`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VirtualNetwork`
--
CREATE TABLE IF NOT EXISTS `#prefix#VirtualNetwork` (
 `id`  int(11) NOT NULL AUTO_INCREMENT,
 `hosting_id` int(11) NOT NULL,
 `server_id` int(11) DEFAULT NULL,
 `name` varchar(200) NOT NULL,
 `tag` int(11) NOT NULL,
 `pool` varchar(200) NOT NULL,
 `cidr` int(11) NOT NULL,
 `gateway`  varchar(200) NOT NULL,
 `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
 `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VirtualInterface`
--
CREATE TABLE IF NOT EXISTS `#prefix#VirtualInterface` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `vn_id` int(11) NOT NULL,
  `vm_id` int(11) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `ip_long` int(11) NOT NULL,
  `net` varchar(10) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#RrdDataCommand`
--
CREATE TABLE IF NOT EXISTS `#prefix#RrdData` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `vm_id` int(11) NOT NULL,
  `diskread` float NOT NULL DEFAULT 0,
  `diskwrite` float NOT NULL DEFAULT 0,
  `cpu` float NOT NULL DEFAULT 0,
  `maxcpu` float NOT NULL DEFAULT 0,
  `mem` float NOT NULL DEFAULT 0,
  `maxmem` float NOT NULL DEFAULT 0,
  `netin` float NOT NULL DEFAULT 0,
  `netout` float NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL,
 PRIMARY KEY (`id`, `hosting_id`, `vm_id`, `time`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#CloudInitScript`
--
CREATE TABLE IF NOT EXISTS `#prefix#CloudInitScript` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `script` text NOT NULL,
  `meta` text NULL,
  `network` text NULL,
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ServerConfiguration`
--
  CREATE TABLE IF NOT EXISTS `#prefix#ServerConfiguration` (
    `server_id` int(11),
    `setting`  varchar (255),
    `value`  text,
    PRIMARY KEY (`setting`,`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ServerGroup`
--
CREATE TABLE IF NOT EXISTS `#prefix#ServerGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `server_id` INT (11),
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ServerGroupItem`
--
CREATE TABLE IF NOT EXISTS `#prefix#ServerGroupItem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL,
  `group_id` INT (11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (group_id)
                REFERENCES #prefix#ServerGroup (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#IpLog`
--
CREATE TABLE IF NOT EXISTS `#prefix#IpLog` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`    INT (11) DEFAULT 0,
    `message`             VARCHAR(250) NOT NULL,
    `created_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#IpServers`
--
CREATE TABLE IF NOT EXISTS `#prefix#IpServers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip_id` INT(11) NOT NULL,
  `sid` INT (11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (ip_id) REFERENCES mg_proxmox_addon_ip (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#IpNodes`
--
CREATE TABLE IF NOT EXISTS `#prefix#IpNodes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip_id` INT(11) NOT NULL,
  `node` VARCHAR(200),
  PRIMARY KEY (`id`),
  FOREIGN KEY (ip_id) REFERENCES mg_proxmox_addon_ip (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#SdnBridge`
--
CREATE TABLE IF NOT EXISTS `#prefix#SdnBridge` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `vn_id` INT(11),
  `hosting_id` INT(11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (vn_id) REFERENCES #prefix#VirtualNetwork (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#ServerUsage`
--
CREATE TABLE IF NOT EXISTS `#prefix#ServerUsage` (
    `server_id`            INT(11),
    `ram_assigned_active`  BIGINT UNSIGNED,
    `ram_total`            BIGINT UNSIGNED,
    `ram_free`             BIGINT UNSIGNED,
    `ram_assigned_suspend` BIGINT UNSIGNED,
    `ram_suspended`        BIGINT UNSIGNED,
    PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#VmPowerTasks`
--
CREATE TABLE IF NOT EXISTS `#prefix#VmPowerTasks` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`  BIGINT UNSIGNED NOT NULL,
    `description` TEXT,
    `action`      VARCHAR(40) NOT NULL,
    `start`       DATETIME,
    `end`         DATETIME,
    `job_type`    VARCHAR(40) NOT NULL,
    `job_time`    TIME NOT NULL,
    `days`        TEXT,
    `last_run`    DATETIME,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#ResourcesNotifications`
--
CREATE TABLE IF NOT EXISTS `#prefix#ResourcesNotifications` (
    `id`           INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`  BIGINT UNSIGNED NOT NULL,
    `name`         VARCHAR(200) NOT NULL,
    `status`       BOOL,
    `period`       INT NOT NULL,
    `timeframe`    INT NOT NULL,
    `requires_all` BOOL,
    `email`        TEXT,
    `conditions`   TEXT,
    `last_notify`  TIMESTAMP DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#Backups`
--
CREATE TABLE IF NOT EXISTS `#prefix#Backups` (
    `id`           INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`   BIGINT UNSIGNED NOT NULL,
    `vm_id`        BIGINT UNSIGNED NOT NULL,
    `volid`        VARCHAR(200) NOT NULL,
    `format`       VARCHAR(40) NOT NULL,
    `size`         BIGINT UNSIGNED NOT NULL,
    `protected`    BOOL DEFAULT FALSE,
    `node`         VARCHAR(100) NOT NULL,
    `storage`      VARCHAR(100) NOT NULL,
    `create_date`  TIMESTAMP DEFAULT '2000-01-01 01:00:00',
    PRIMARY KEY (`id`),
    INDEX `idx_node_volid` (`node`, `volid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ModuleCache`
--
CREATE TABLE IF NOT EXISTS `#prefix#ModuleCache` (
    `name`              VARCHAR(255) NOT NULL UNIQUE,
    `value`             LONGTEXT NOT NULL,
    `valid_until`       INT NOT NULL,
    PRIMARY KEY (`name`),
    INDEX `idx_valid_until` (`valid_until`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#Vlans`
--
CREATE TABLE IF NOT EXISTS `#prefix#Vlans` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `server_id`   BIGINT UNSIGNED NOT NULL,
    `user_id`     BIGINT UNSIGNED NOT NULL,
    `hosting_id`  BIGINT UNSIGNED NOT NULL,
    `vm_id`       BIGINT UNSIGNED,
    `vlan_tag`    BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#BackupScheduleTemplates`
--
CREATE TABLE IF NOT EXISTS `#prefix#BackupScheduleTemplates` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#BackupJobTemplates`
--
CREATE TABLE IF NOT EXISTS `#prefix#BackupJobTemplates` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `schedule_id` int(11) NOT NULL,
    `starttime` TIME NOT NULL,
    `dow` TEXT NOT NULL,
    `compress` varchar(100) NOT NULL,
    `mode` varchar(100) NOT NULL,
    `mailnotification` varchar(100) DEFAULT 'never',
    `mailto` varchar(255) DEFAULT '',
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`),
    FOREIGN KEY (schedule_id) REFERENCES #prefix#BackupScheduleTemplates (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#FirewallTemplates`
--
CREATE TABLE IF NOT EXISTS `#prefix#FirewallTemplates` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#FirewallOptionsTemplates`
--
CREATE TABLE IF NOT EXISTS `#prefix#FirewallOptionsTemplates` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `firewall_id` int(11) NOT NULL,
    `enable` bool DEFAULT FALSE,
    `dhcp` bool DEFAULT FALSE,
    `ndp` bool DEFAULT FALSE,
    `radv` bool DEFAULT FALSE,
    `macfilter` bool DEFAULT FALSE,
    `ipfilter` bool DEFAULT FALSE,
    `log_level_in` varchar(100) DEFAULT 'nolog',
    `log_level_out` varchar(100) DEFAULT 'nolog',
    `policy_in` varchar(100) DEFAULT 'DROP',
    `policy_out` varchar(100) DEFAULT 'ACCEPT',
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`),
    FOREIGN KEY (firewall_id) REFERENCES #prefix#FirewallTemplates (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#FirewallRuleTemplates`
--
CREATE TABLE IF NOT EXISTS `#prefix#FirewallRuleTemplates` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `firewall_id` int(11) NOT NULL,
    `pos` int(11) NOT NULL,
    `enable` bool DEFAULT FALSE,
    `type` varchar(100) NOT NULL,
    `action` varchar(100) NOT NULL,
    `source` varchar(100) NOT NULL,
    `dest` varchar(100) NOT NULL,
    `macro` varchar(100) NOT NULL,
    `proto` varchar(100) NOT NULL,
    `sport` varchar(100) NOT NULL,
    `dport` varchar(100) NOT NULL,
    `comment` varchar(255) NOT NULL,
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`),
    FOREIGN KEY (firewall_id) REFERENCES #prefix#FirewallTemplates (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#BackupSchedules`
--
CREATE TABLE IF NOT EXISTS `#prefix#BackupSchedules` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `hosting_id` int(11) NOT NULL,
    `starttime` TIME NOT NULL,
    `dow` TEXT NOT NULL,
    `compress` varchar(100) NOT NULL,
    `mode` varchar(100) NOT NULL,
    `mailnotification` varchar(100) DEFAULT 'never',
    `mailto` varchar(255) DEFAULT '',
    `last_usage` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `updated_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#OsGroups`
--
CREATE TABLE IF NOT EXISTS `#prefix#OsGroups` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#OsGroupDetails`
--
CREATE TABLE IF NOT EXISTS `#prefix#OsGroupDetails` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `os_group_id` int(11) NOT NULL,
    `template` varchar(200),
    PRIMARY KEY (`id`),
    FOREIGN KEY (os_group_id) REFERENCES #prefix#OsGroups (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;