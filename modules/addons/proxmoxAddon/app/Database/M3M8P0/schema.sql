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