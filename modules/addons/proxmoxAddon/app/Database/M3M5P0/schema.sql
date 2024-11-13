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
-- `#prefix#IpServers`
--
CREATE TABLE IF NOT EXISTS `#prefix#IpServers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip_id` INT(11) NOT NULL,
  `sid` INT(11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (ip_id) REFERENCES mg_proxmox_addon_ip (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

INSERT INTO `#prefix#IpServers` (`ip_id`, `sid`) SELECT `id`, `sid` FROM `mg_proxmox_addon_ip` addon_ips WHERE NOT EXISTS
    (SELECT id FROM `#prefix#IpServers` ip_servers WHERE ip_servers.ip_id = addon_ips.id AND (ip_servers.sid = addon_ips.sid OR (ip_servers.sid IS NULL AND addon_ips.sid IS NULL)));
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

INSERT INTO `#prefix#IpNodes` (`ip_id`, `node`) SELECT `id`, `node` FROM `mg_proxmox_addon_ip` addon_ips WHERE NOT EXISTS
    (SELECT id FROM `#prefix#IpNodes` ip_nodes WHERE ip_nodes.ip_id = addon_ips.id AND (ip_nodes.node = addon_ips.node OR (ip_nodes.node IS NULL AND addon_ips.node IS NULL)));

ALTER TABLE `#prefix#Job` CHANGE `retry_after` `retry_after` datetime CHARACTER SET utf8 COLLATE #collation# NOT NULL DEFAULT '0000-00-00 00:00:00';