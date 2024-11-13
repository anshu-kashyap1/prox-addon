UPDATE `ProxmoxAddon_Job` SET `status` = 'waiting' WHERE `status` = 'running' AND TIMESTAMP(`created_at`) <= TIMESTAMP(NOW() - INTERVAL 1 HOUR);
ALTER TABLE `mg_proxmox_addon_ip` DEFAULT COLLATE #collation#;
ALTER TABLE `mg_proxmox_addon_ip` CHANGE `ip` `ip` VARCHAR(200) CHARACTER SET utf8 COLLATE #collation# NOT NULL;
ALTER TABLE `mg_proxmox_addon_ip`  CHANGE `type` `type` ENUM('IPv4','IPv6') CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT 'IPv4';
ALTER TABLE `mg_proxmox_addon_ip`  CHANGE `mac_address` `mac_address` VARCHAR(200) CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT NULL;
ALTER TABLE `mg_proxmox_addon_ip`  CHANGE `subnet_mask` `subnet_mask` VARCHAR(200) CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT NULL;
ALTER TABLE `mg_proxmox_addon_ip` CHANGE `visualization` `visualization` ENUM('Auto','KVM','LXC') CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT 'Auto';
ALTER TABLE `mg_proxmox_addon_ip` CHANGE `node` `node` VARCHAR(200) CHARACTER SET utf8 COLLATE #collation# NULL DEFAULT '0';