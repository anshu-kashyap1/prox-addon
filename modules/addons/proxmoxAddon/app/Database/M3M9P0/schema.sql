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