ALTER TABLE `ProxmoxAddon_Backups` ADD INDEX `idx_node_volid` (`node`, `volid`);
ALTER TABLE `ProxmoxAddon_Vm` ALTER COLUMN created_at SET DEFAULT '1997-01-01 01:00:00';
ALTER TABLE `ProxmoxAddon_Vm` ADD `server_id` int(11) DEFAULT NULL AFTER `hosting_id`;
ALTER TABLE `ProxmoxAddon_VirtualNetwork` ALTER COLUMN created_at SET DEFAULT '1997-01-01 01:00:00';
ALTER TABLE `ProxmoxAddon_VirtualNetwork` ADD `server_id` int(11) DEFAULT NULL AFTER `hosting_id`;
ALTER TABLE `ProxmoxAddon_ModuleCache` ADD INDEX `idx_valid_until` (`valid_until`);
ALTER TABLE `ProxmoxAddon_Backups` CHANGE `create_date` `create_date` TIMESTAMP DEFAULT '2000-01-01 01:00:00';
ALTER TABLE `ProxmoxAddon_Backups` ADD `protected` BOOL DEFAULT FALSE AFTER `size`;