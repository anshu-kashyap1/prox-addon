--
-- `#prefix#ServerGroup`
--
CREATE TABLE IF NOT EXISTS `#prefix#ServerGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `server_id` INT (11),
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#ServerGroupItem`
--
CREATE TABLE IF NOT EXISTS `#prefix#ServerGroupItem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL,
  `group_id` INT (11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (group_id)
                REFERENCES #prefix#ServerGroup (id)  ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;