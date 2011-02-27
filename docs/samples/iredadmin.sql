#CREATE DATABASE iredadmin DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
#GRANT INSERT,UPDATE,DELETE,SELECT on iredadmin.* to iredadmin@localhost identified by 'secret_passwd';
#USE iredadmin;

#
# Session table required by webpy session module.
#
CREATE TABLE IF NOT EXISTS `sessions` (
    `session_id` CHAR(128) UNIQUE NOT NULL,
    `atime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `data` TEXT
) ENGINE=MyISAM;

#
# Store all admin operations.
#
CREATE TABLE IF NOT EXISTS `log` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `timestamp` TIMESTAMP(14) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `admin` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(15) NOT NULL,
    `domain` VARCHAR(255) NOT NULL DEFAULT '',
    `username` VARCHAR(255) NOT NULL DEFAULT '',
    `event` VARCHAR(10) NOT NULL DEFAULT '',
    `loglevel` VARCHAR(10) NOT NULL DEFAULT 'info',
    `msg` VARCHAR(255) NOT NULL,
    KEY id (id),
    INDEX (timestamp),
    INDEX (admin),
    INDEX (ip),
    INDEX (domain),
    INDEX (username),
    INDEX (event),
    INDEX (loglevel)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `updatelog` (
    `id` BIGINT(20) UNSIGNED AUTO_INCREMENT,
    `date` DATE NOT NULL,
    KEY id (id),
    INDEX (date)
) ENGINE=MyISAM;