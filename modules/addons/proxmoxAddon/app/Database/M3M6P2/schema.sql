ALTER TABLE `ProxmoxAddon_ModuleSettings` CHANGE `setting` `setting` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

--
-- `#prefix#ModuleCache`
--
CREATE TABLE IF NOT EXISTS `#prefix#ModuleCache` (
    `name`              VARCHAR(255) NOT NULL UNIQUE,
    `value`             LONGTEXT NOT NULL,
    `valid_until`       INT NOT NULL,
    PRIMARY KEY (`name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
