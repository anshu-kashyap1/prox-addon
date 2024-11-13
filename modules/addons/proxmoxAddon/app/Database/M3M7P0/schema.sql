--
-- `#prefix#VmPowerTasks`
--
CREATE TABLE IF NOT EXISTS `#prefix#VmPowerTasks` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`  BIGINT UNSIGNED NOT NULL,
    `description` TEXT,
    `action`      VARCHAR(40) NOT NULL,
    `start`       DATETIME,
    `end`         DATETIME,
    `job_type`    VARCHAR(40) NOT NULL,
    `job_time`    TIME NOT NULL,
    `days`        TEXT,
    `last_run`    DATETIME,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#ResourcesNotifications`
--
CREATE TABLE IF NOT EXISTS `#prefix#ResourcesNotifications` (
    `id`           INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`  BIGINT UNSIGNED NOT NULL,
    `name`         VARCHAR(200) NOT NULL,
    `status`       BOOL,
    `period`       INT NOT NULL,
    `timeframe`    INT NOT NULL,
    `requires_all` BOOL,
    `email`        TEXT,
    `conditions`   TEXT,
    `last_notify`  TIMESTAMP DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;

--
-- `#prefix#Backups`
--
CREATE TABLE IF NOT EXISTS `#prefix#Backups` (
    `id`           INT(11) NOT NULL AUTO_INCREMENT,
    `hosting_id`   BIGINT UNSIGNED NOT NULL,
    `vm_id`        BIGINT UNSIGNED NOT NULL,
    `volid`        VARCHAR(200) NOT NULL,
    `format`       VARCHAR(40) NOT NULL,
    `size`         BIGINT UNSIGNED NOT NULL,
    `node`         VARCHAR(100) NOT NULL,
    `storage`      VARCHAR(100) NOT NULL,
    `create_date`  TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;