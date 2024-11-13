ALTER TABLE `mg_proxmox_addon_ip` ADD `bridge`  VARCHAR (20) DEFAULT '' AFTER `node`;
ALTER TABLE `#prefix#CloudInitScript` ADD `meta` text NULL AFTER `script`, ADD `network` text NULL AFTER `meta`;
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