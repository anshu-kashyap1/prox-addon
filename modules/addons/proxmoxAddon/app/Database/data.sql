INSERT INTO `#prefix#IpServers` (`ip_id`, `sid`) SELECT `id`, `sid` FROM `mg_proxmox_addon_ip` addon_ips WHERE NOT EXISTS
    (SELECT id FROM `#prefix#IpServers` ip_servers WHERE ip_servers.ip_id = addon_ips.id AND (ip_servers.sid = addon_ips.sid OR (ip_servers.sid IS NULL AND addon_ips.sid IS NULL)));
    INSERT INTO `#prefix#IpNodes` (`ip_id`, `node`) SELECT `id`, `node` FROM `mg_proxmox_addon_ip` addon_ips WHERE NOT EXISTS
    (SELECT id FROM `#prefix#IpNodes` ip_nodes WHERE ip_nodes.ip_id = addon_ips.id AND (ip_nodes.node = addon_ips.node OR (ip_nodes.node IS NULL AND addon_ips.node IS NULL)));