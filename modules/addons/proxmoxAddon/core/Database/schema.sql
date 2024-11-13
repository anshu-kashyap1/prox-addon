--
-- `#prefix#Logger`
--
CREATE TABLE IF NOT EXISTS `#prefix#Logger` (
    `id`            int(10) unsigned NOT NULL AUTO_INCREMENT,
    `id_ref`        int(10) unsigned NOT NULL,
    `id_type`       VARCHAR(255) NOT NULL,
    `type`          VARCHAR(255) NOT NULL,
    `level`         VARCHAR(255) NOT NULL,
    `date`          DATETIME DEFAULT null,
    `request`       TEXT NOT NULL,
    `response`      TEXT NOT NULL,
    `before_vars`   TEXT NOT NULL,
    `vars`          TEXT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ModuleSettings`
--
CREATE TABLE IF NOT EXISTS `#prefix#ModuleSettings` (
    `setting`              VARCHAR(64) NOT NULL UNIQUE,
    `value`            TEXT NOT NULL,
    PRIMARY KEY (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#Commands`
--
CREATE TABLE IF NOT EXISTS `#prefix#Commands` (
    `name`             VARCHAR(64) NOT NULL UNIQUE,
    `uuid`             VARCHAR(64) NOT NULL UNIQUE,
    `parent_uuid`      VARCHAR(64) DEFAULT NULL,
    `status`           enum('stopped', 'running', 'error', 'sleeping') DEFAULT 'stopped',
    `action`           enum('none', 'stop', 'reboot') DEFAULT 'none',
    `params`           TEXT NOT NULL,
    `created_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       timestamp,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;


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