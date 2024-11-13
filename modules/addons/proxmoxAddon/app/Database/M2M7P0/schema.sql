--
-- `#prefix#ModuleSettings`
--
CREATE TABLE IF NOT EXISTS `#prefix#ModuleSettings`
  (
     `setting` VARCHAR (64) NOT NULL UNIQUE,
     `value`   TEXT NOT NULL,
     PRIMARY KEY ( `setting` )
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
-- `#prefix#VmIpAddress`
--
CREATE TABLE IF NOT EXISTS `#prefix#VmIpAddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11),
  `server_id` INT (11),
  `vm_id` INT (11) DEFAULT  null,
  `ip` varchar(200) NOT NULL,
  `mac_address` varchar(200) DEFAULT 'auto',
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
-- ALTER TABLE `#prefix#Job`
--
ALTER TABLE `#prefix#Job` ADD `parent_id` INT(10) unsigned  NULL DEFAULT NULL AFTER `data`, ADD `rel_id` INT(10) unsigned NULL DEFAULT NULL AFTER `parent_id`, ADD `rel_type` INT(10) unsigned NULL DEFAULT NULL AFTER `rel_id`, ADD `custom_id` INT(10) unsigned NULL DEFAULT NULL AFTER `rel_type`;
ALTER TABLE `#prefix#Job` ADD KEY(`parent_id`, `rel_type`, `rel_id`, `custom_id`) ;
--
-- `#prefix#Job`
--
CREATE TABLE IF NOT EXISTS `#prefix#Job` (
    `id` int(10) unsigned  NOT NULL AUTO_INCREMENT,
    `retry_after` datetime NOT NULL,
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
    KEY(`status`)
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
-- `#mg_proxmox_addon_ip`
--
UPDATE `mg_proxmox_addon_ip` SET  `mac_address`= NULL WHERE `mac_address`='auto';
ALTER TABLE `mg_proxmox_addon_ip` CHANGE `mac_address` `mac_address` VARCHAR(200) DEFAULT NULL;