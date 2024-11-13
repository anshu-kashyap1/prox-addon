--
-- `#prefix#SnapshootJob`
--
CREATE TABLE IF NOT EXISTS `#prefix#SnapshotJob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11)  NOT NULL,
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
-- ALTER TABLE
--
ALTER TABLE `ProxmoxAddon_Commands` CHANGE `status` `status` ENUM('stopped','running','error','sleeping') CHARACTER SET #charset# COLLATE #collation# NULL DEFAULT 'stopped';
--
-- Fix missing ip addresses
--
delete i.* from ProxmoxAddon_VmIpAddress i left join tblhosting h ON (h.id = i.hosting_id) where h.domainstatus NOT IN ("Active", "Suspended");