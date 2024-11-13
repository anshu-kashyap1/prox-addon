--
-- `#prefix#VmModel`
--
CREATE TABLE IF NOT EXISTS `#prefix#Vm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `node` varchar(250) NOT NULL,
  `vmid` int(11) NOT NULL,
  `virtualization` varchar(128) NOT NULL,
  `name` varchar(250) NOT NULL ,
  `password` varchar(250) NOT NULL,
  `cores` INT (2) DEFAULT '0',
  `sockets` INT (2) DEFAULT '0',
  `vcpus` INT (2) DEFAULT '0',
  `cpulimit` FLOAT(5) DEFAULT '0',
  `cpuunits` INT (8) NULL,
  `memory`  INT (10) NOT NULL,
  `swap` INT (10) DEFAULT '0',
  `disk`  INT (10) NOT NULL,
  `disks` INT (12) DEFAULT '0',
  `netin` INT (12) DEFAULT '0',
  `netout` INT (12) DEFAULT '0',
  `template` INT (1) DEFAULT '0',
    `data`  text,
  `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
  `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`hosting_id`,`vmid`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VirtualNetwork`
--
CREATE TABLE IF NOT EXISTS `#prefix#VirtualNetwork` (
 `id`  int(11) NOT NULL AUTO_INCREMENT,
 `hosting_id` int(11) NOT NULL,
 `name` varchar(200) NOT NULL,
 `tag` int(11) NOT NULL,
 `pool` varchar(200) NOT NULL,
 `cidr` int(11) NOT NULL,
 `gateway`  varchar(200) NOT NULL,
 `updated_at`       timestamp DEFAULT CURRENT_TIMESTAMP,
 `created_at`       timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#VirtualInterface`
--
CREATE TABLE IF NOT EXISTS `#prefix#VirtualInterface` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `vn_id` int(11) NOT NULL,
  `vm_id` int(11) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `ip_long` int(11) NOT NULL,
  `net` varchar(10) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;
--
-- `#prefix#RrdDataCommand`
--
CREATE TABLE IF NOT EXISTS `#prefix#RrdData` (
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `hosting_id` int(11) NOT NULL,
  `vm_id` int(11) NOT NULL,
  `diskread` float NOT NULL DEFAULT 0,
  `diskwrite` float NOT NULL DEFAULT 0,
  `cpu` float NOT NULL DEFAULT 0,
  `maxcpu` float NOT NULL DEFAULT 0,
  `mem` float NOT NULL DEFAULT 0,
  `maxmem` float NOT NULL DEFAULT 0,
  `netin` float NOT NULL DEFAULT 0,
  `netout` float NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL,
 PRIMARY KEY (`id`, `hosting_id`, `vm_id`, `time`)
) ENGINE=InnoDB DEFAULT CHARSET=#charset# DEFAULT COLLATE #collation#;