DROP DATABASE IF EXISTS `jcasdb`;
CREATE DATABASE IF NOT EXISTS `jcasdb` CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `jcasdb`;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` varchar(45) NOT NULL DEFAULT '',
  `region_name` varchar(45) NOT NULL DEFAULT '' UNIQUE,
  `location` varchar(45),
  `cn_own_ids` longtext,
  `create_time` datetime,
  `update_time` datetime,
  `region_info` longtext,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `event_conf`
--

DROP TABLE IF EXISTS `event_conf`;
CREATE TABLE `event_conf` (
  `event_conf_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(45) NOT NULL DEFAULT '',
  `event_code` int(11) NOT NULL DEFAULT '0',
  `event_type` varchar(45) NOT NULL DEFAULT '',
  `severity` varchar(45) NOT NULL DEFAULT '',
  `message` varchar(100) NOT NULL DEFAULT '',
  `occur_condition` longtext,
  `exec_enable` tinyint(1) NOT NULL DEFAULT '0',
  `notify_method` longtext,
  `notify_interval` int(11) NOT NULL DEFAULT '0',
  `sop` varchar(100),
  `binding_region_id` varchar(100) NOT NULL DEFAULT '',
  `event_conf_info` longtext,
  PRIMARY KEY (`event_conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_conf_id` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime,
  `occur_time` datetime,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `notify_time` datetime,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `finish_time` datetime,
  `event_info` longtext,
  PRIMARY KEY (`event_id`),
  FOREIGN KEY (`event_conf_id`) REFERENCES event_conf(`event_conf_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `supported_event`
--

DROP TABLE IF EXISTS `supported_event`;
CREATE TABLE `supported_event` (
  `supported_event_code` int(11) NOT NULL DEFAULT '0',
  `supported_event_name` varchar(45) NOT NULL DEFAULT '',
  `supported_event_type` varchar(45) NOT NULL DEFAULT '',
  `supported_message` varchar(100) NOT NULL DEFAULT '',
  `built_in` tinyint(1) NOT NULL DEFAULT '0',
  `supported_event_info` longtext,
  PRIMARY KEY (`supported_event_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supported_event`
--

INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7101,'PERSON_POSTURE','SENSING_EVENT','ARM_RAISE_LEFT',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7102,'PERSON_POSTURE','SENSING_EVENT','ARM_RAISE_RIGHT',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7103,'PERSON_POSTURE','SENSING_EVENT','ARM_RAISE_BOTH',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7104,'PERSON_POSTURE','SENSING_EVENT','POSTURE_STEPPING',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7105,'PERSON_POSTURE','SENSING_EVENT','POSTURE_IDLE_LONG',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7106,'PERSON_POSTURE','SENSING_EVENT','POSTURE_SQUAT',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7107,'PERSON_POSTURE','SENSING_EVENT','ARM_ROTATE_SINGLE',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7108,'PERSON_POSTURE','SENSING_EVENT','ARM_RAISE_HIGH_BOTH',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (6701,'PERSON_POSTURE','SENSING_ALARM','ARM_RAISE_HIGH_BOTH_MULTI',1,NULL);

INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (6601,'AGV_STATUS','SENSING_ALARM','AGV_APPROACHING',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (6801,'PERSON_STATUS','SENSING_ALARM','PERSON_CROWDED',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (6802,'PERSON_STATUS','SENSING_ALARM','PERSON_INTRUSION',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7201,'AGV_STATUS','SENSING_EVENT','AGV_ENTER',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7202,'AGV_STATUS','SENSING_EVENT','AGV_LEAVE',1,NULL);

INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7501,'HAND_GESTURE','SENSING_EVENT','HAND_ROTATE_COUNTERCLOCKWISE',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7502,'HAND_GESTURE','SENSING_EVENT','HAND_ROTATE_CLOCKWISE',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7503,'HAND_GESTURE','SENSING_EVENT','HAND_HORIZONTAL_LEFT',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7504,'HAND_GESTURE','SENSING_EVENT','HAND_HORIZONTAL_RIGHT',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7505,'HAND_GESTURE','SENSING_EVENT','HAND_HORIZONTAL_REVERSE',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7506,'HAND_GESTURE','SENSING_EVENT','HAND_GESTURE_ENABLE',1,NULL);
INSERT INTO supported_event (supported_event_code, supported_event_name, supported_event_type, supported_message, built_in, supported_event_info) VALUES (7507,'HAND_GESTURE','SENSING_EVENT','HAND_GESTURE_DISABLE',1,NULL);
--
-- Table structure for table `computing_node_conf`
--

DROP TABLE IF EXISTS `computing_node_conf`;
CREATE TABLE `computing_node_conf` (
  `cn_id` varchar(45) NOT NULL DEFAULT '',
  `cn_name` varchar(45) NOT NULL DEFAULT '' UNIQUE,
  `cn_ip` varchar(45),
  `cn_type` varchar(45),
  `cpu_total_core` int(11),
  `cpu_max_percent` double,
  `gpu_total_byte` bigint,
  `gpu_max_percent` double,
  `memory_total_byte` bigint,
  `memory_max_percent` double,
  `cn_power_plugged` tinyint(1) NOT NULL DEFAULT '0',
  `supported_sensors` longtext,
  `create_time` datetime,
  `update_time` datetime,  
  `cn_info` longtext,
  PRIMARY KEY (`cn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `task_conf`
--

DROP TABLE IF EXISTS `task_conf`;
CREATE TABLE `task_conf` (
  `task_conf_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(45) NOT NULL DEFAULT '' UNIQUE,
  `task_priority` int(11),
  `task_latency_ms` int(11),
  `cpu_min_core` int(11),
  `gpu_min_byte` bigint,
  `memory_min_byte` bigint,  
  `task_power_plugged` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime,
  `update_time` datetime,  
  `task_conf_info` longtext,
  PRIMARY KEY (`task_conf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
