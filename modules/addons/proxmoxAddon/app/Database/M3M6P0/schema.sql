ALTER TABLE `mg_proxmox_addon_ip`  CHANGE `type` `type` ENUM('IPv4','IPv6', 'IPv6_Subnet') CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT 'IPv4';

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