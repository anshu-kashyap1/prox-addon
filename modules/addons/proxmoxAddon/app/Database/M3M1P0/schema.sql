--
-- `#prefix#CloudInitScript`
--
CREATE TABLE IF NOT EXISTS `#prefix#CloudInitScript` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `script` text NOT NULL,
  `meta` text NULL,
  `network` text NULL,
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ServerConfiguration`
--
  CREATE TABLE IF NOT EXISTS `#prefix#ServerConfiguration` (
    `server_id` int(11),
    `setting`  varchar (255),
    `value`  text,
    PRIMARY KEY (`setting`,`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;