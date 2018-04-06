-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2018 at 03:53 PM
-- Server version: 5.5.59
-- PHP Version: 5.4.4-14+deb7u9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+10:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Tank`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `resetTank`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetTank`()
BEGIN
	DELETE FROM Tank WHERE ID = 1;
	SET @var = 0;
	UPDATE Tank SET ID = (@var := @var + 1);
	ALTER TABLE Tank AUTO_INCREMENT = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gauge_detail`
--

DROP TABLE IF EXISTS `gauge_detail`;
CREATE TABLE IF NOT EXISTS `gauge_detail` (
  `id` int(11) NOT NULL,
  `min_value` int(11) NOT NULL,
  `max_value` int(11) NOT NULL,
  `color_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gauge_detail`
--

INSERT INTO `gauge_detail` (`id`, `min_value`, `max_value`, `color_code`) VALUES
(1, 0, 4000, '#ff0000'),
(2, 4000, 8000, '#ff0000'),
(3, 8000, 12000, '#ffA500'),
(4, 12000, 16000, '#ffA500'),
(5, 16000, 20000, '#ffA500'),
(6, 20000, 24000, ' 	#ffff00'),
(7, 24000, 28000, ' 	#ffff00'),
(8, 28000, 32000, ' 	#ffff00'),
(9, 32000, 36000, '00ff00'),
(10, 36000, 40000, '00ff00'),
(11, 40000, 44000, '00ff00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `last 30 readings`
--
DROP VIEW IF EXISTS `last 30 readings`;
CREATE TABLE IF NOT EXISTS `last 30 readings` (
`ID` int(12)
,`Level` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `lastreading`
--

DROP TABLE IF EXISTS `lastreading`;
CREATE TABLE IF NOT EXISTS `lastreading` (
  `dial_id` int(11) NOT NULL,
  `dial_value` int(11) NOT NULL,
  PRIMARY KEY (`dial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lastreading`
--

INSERT INTO `lastreading` (`dial_id`, `dial_value`) VALUES
(1, 44531);

-- --------------------------------------------------------

--
-- Table structure for table `Name`
--

DROP TABLE IF EXISTS `Name`;
CREATE TABLE IF NOT EXISTS `Name` (
  `NameID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`NameID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Name`
--

INSERT INTO `Name` (`NameID`, `Name`) VALUES
(1, 'Tank 1'),
(2, 'Tank 2'),
(3, 'Tank 3');

-- --------------------------------------------------------

--
-- Table structure for table `Tank`
--

DROP TABLE IF EXISTS `Tank`;
CREATE TABLE IF NOT EXISTS `Tank` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TankID` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `LogTime` (`LogTime`),
  KEY `TankID` (`TankID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `Tank`
--

INSERT INTO `Tank` (`ID`, `TankID`, `Level`, `LogTime`) VALUES
(1, 1, 44444, '2017-11-15 06:16:52'),
(2, 1, 44444, '2017-11-15 10:16:51'),
(3, 1, 44422, '2017-11-15 14:16:51'),
(4, 1, 44422, '2017-11-15 18:16:50'),
(5, 1, 44422, '2017-11-15 22:16:50'),
(6, 1, 44422, '2017-11-16 02:16:49'),
(7, 1, 44422, '2017-11-16 06:16:48'),
(8, 1, 44411, '2017-11-16 10:16:48'),
(9, 1, 44389, '2017-11-16 14:16:47'),
(10, 1, 44389, '2017-11-16 18:16:47'),
(11, 1, 44378, '2017-11-16 22:16:46'),
(12, 1, 44389, '2017-11-17 02:16:46'),
(13, 1, 44367, '2017-11-17 06:16:45'),
(14, 1, 44367, '2017-11-17 10:16:45'),
(15, 1, 44345, '2017-11-17 14:16:44'),
(16, 1, 44356, '2017-11-17 18:16:43'),
(17, 1, 44356, '2017-11-17 22:16:43'),
(18, 1, 44422, '2017-11-18 02:16:42'),
(19, 1, 44531, '2017-11-18 06:16:42'),
(20, 1, 44596, '2017-11-18 11:11:35'),
(21, 1, 44574, '2017-11-18 15:11:35'),
(22, 1, 44563, '2017-11-18 19:11:34'),
(23, 1, 45000, '2018-03-29 07:30:10'),
(24, 1, 45000, '2018-03-29 11:30:10'),
(25, 1, 45000, '2018-03-29 15:30:10'),
(26, 1, 45000, '2018-03-29 19:30:11'),
(27, 1, 45000, '2018-03-29 23:30:11'),
(28, 1, 45000, '2018-03-30 03:30:11'),
(29, 1, 45000, '2018-03-31 03:55:17'),
(30, 1, 45000, '2018-03-31 07:55:17'),
(31, 1, 45000, '2018-03-31 11:55:17'),
(32, 1, 45000, '2018-03-31 15:55:17'),
(33, 1, 45000, '2018-03-31 19:55:17'),
(34, 1, 45000, '2018-03-31 23:55:18'),
(35, 1, 45000, '2018-04-01 03:55:18'),
(36, 1, 45000, '2018-04-01 07:55:18'),
(37, 1, 45000, '2018-04-01 11:55:18'),
(38, 1, 45000, '2018-04-01 15:55:18'),
(39, 1, 45000, '2018-04-02 01:18:04'),
(40, 1, 45000, '2018-04-02 09:39:48'),
(41, 1, 45000, '2018-04-02 13:39:48'),
(42, 1, 45000, '2018-04-02 17:39:48'),
(43, 1, 45000, '2018-04-02 21:39:48'),
(44, 1, 45000, '2018-04-03 01:39:48'),
(45, 1, 45000, '2018-04-03 05:39:48'),
(46, 1, 45000, '2018-04-03 09:39:48'),
(47, 1, 45000, '2018-04-03 13:39:48'),
(48, 1, 45000, '2018-04-03 17:39:49'),
(49, 1, 45000, '2018-04-03 21:39:49'),
(50, 1, 45000, '2018-04-04 01:39:49'),
(51, 1, 45000, '2018-04-04 05:39:17'),
(52, 1, 45000, '2018-04-04 09:16:23'),
(53, 1, 45000, '2018-04-04 09:39:17'),
(54, 1, 45000, '2018-04-04 13:39:17'),
(55, 1, 45000, '2018-04-04 17:39:17'),
(56, 1, 45000, '2018-04-04 21:39:17'),
(57, 1, 45000, '2018-04-05 01:39:17'),
(58, 1, 45000, '2018-04-05 05:39:18'),
(59, 1, 45000, '2018-04-05 06:39:14'),
(60, 1, 45000, '2018-04-05 09:39:18'),
(61, 1, 45000, '2018-04-05 15:43:30'),
(62, 1, 45000, '2018-04-05 19:43:30'),
(63, 1, 45000, '2018-04-05 23:43:31'),
(64, 1, 45000, '2018-04-06 03:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TankID` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `LogTime` (`LogTime`),
  KEY `TankID` (`TankID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`ID`, `TankID`, `Level`, `LogTime`) VALUES
(1, 1, 44509, '2017-11-13 22:17:53'),
(2, 1, 44520, '2017-11-14 02:17:53'),
(3, 1, 44509, '2017-11-14 06:17:52'),
(4, 1, 44487, '2017-11-14 10:17:52'),
(5, 1, 44487, '2017-11-14 14:17:51'),
(6, 1, 44476, '2017-11-14 18:17:51'),
(7, 1, 44454, '2017-11-14 22:17:50'),
(8, 1, 44454, '2017-11-15 02:16:52'),
(9, 1, 44444, '2017-11-15 06:16:52'),
(10, 1, 44444, '2017-11-15 10:16:51'),
(11, 1, 44422, '2017-11-15 14:16:51'),
(12, 1, 44422, '2017-11-15 18:16:50'),
(13, 1, 44422, '2017-11-15 22:16:50'),
(14, 1, 44422, '2017-11-16 02:16:49'),
(15, 1, 44422, '2017-11-16 06:16:48'),
(16, 1, 44411, '2017-11-16 10:16:48'),
(17, 1, 44389, '2017-11-16 14:16:47'),
(18, 1, 44389, '2017-11-16 18:16:47'),
(19, 1, 44378, '2017-11-16 22:16:46'),
(20, 1, 44389, '2017-11-17 02:16:46'),
(21, 1, 44367, '2017-11-17 06:16:45'),
(22, 1, 44367, '2017-11-17 10:16:45'),
(23, 1, 44345, '2017-11-17 14:16:44'),
(24, 1, 44356, '2017-11-17 18:16:43'),
(25, 1, 44356, '2017-11-17 22:16:43'),
(26, 1, 44422, '2017-11-18 02:16:42'),
(27, 1, 44531, '2017-11-18 06:16:42'),
(28, 1, 44596, '2017-11-18 11:11:35'),
(29, 1, 44574, '2017-11-18 15:11:35'),
(30, 1, 44563, '2017-11-18 19:11:34'),
(31, 1, 45000, '2018-03-29 07:30:10'),
(32, 1, 45000, '2018-03-29 11:30:10'),
(33, 1, 45000, '2018-03-29 15:30:10'),
(34, 1, 45000, '2018-03-29 19:30:11'),
(35, 1, 45000, '2018-03-29 23:30:11'),
(36, 1, 45000, '2018-03-30 03:30:11'),
(37, 1, 45000, '2018-03-31 03:55:17'),
(38, 1, 45000, '2018-03-31 07:55:17'),
(39, 1, 45000, '2018-03-31 11:55:17'),
(40, 1, 45000, '2018-03-31 15:55:17'),
(41, 1, 45000, '2018-03-31 19:55:17'),
(42, 1, 45000, '2018-03-31 23:55:18'),
(43, 1, 45000, '2018-04-01 03:55:18'),
(44, 1, 45000, '2018-04-01 07:55:18'),
(45, 1, 45000, '2018-04-01 11:55:18'),
(46, 1, 45000, '2018-04-01 15:55:18'),
(47, 1, 45000, '2018-04-02 01:18:04'),
(48, 1, 45000, '2018-04-02 09:39:48'),
(49, 1, 45000, '2018-04-02 13:39:48'),
(50, 1, 45000, '2018-04-02 17:39:48'),
(51, 1, 45000, '2018-04-02 21:39:48'),
(52, 1, 45000, '2018-04-03 01:39:48'),
(53, 1, 45000, '2018-04-03 05:39:48'),
(54, 1, 45000, '2018-04-03 09:39:48'),
(55, 1, 45000, '2018-04-03 13:39:48'),
(56, 1, 45000, '2018-04-03 17:39:49'),
(57, 1, 45000, '2018-04-03 21:39:49'),
(58, 1, 45000, '2018-04-04 01:39:49'),
(59, 1, 45000, '2018-04-04 05:39:17'),
(60, 1, 43532, '2018-04-04 09:16:23'),
(61, 1, 0, '2018-04-05 06:16:53'),
(62, 1, 44444, '2018-04-05 06:17:47'),
(63, 1, 44455, '2018-04-05 06:18:59'),
(64, 1, 40454, '2018-04-05 06:24:32');

-- --------------------------------------------------------

--
-- Stand-in structure for view `topBottom`
--
DROP VIEW IF EXISTS `topBottom`;
CREATE TABLE IF NOT EXISTS `topBottom` (
`ID` int(12)
,`TankID` int(11)
,`Level` int(11)
,`LogTime` timestamp
);
-- --------------------------------------------------------

--
-- Structure for view `last 30 readings`
--
DROP TABLE IF EXISTS `last 30 readings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last 30 readings` AS select `ID` AS `ID`,`Level` AS `Level` from `Tank` order by `ID` desc limit 30;

-- --------------------------------------------------------

--
-- Structure for view `topBottom`
--
DROP TABLE IF EXISTS `topBottom`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topBottom` AS select `ID` AS `ID`,`TankID` AS `TankID`,`Level` AS `Level`,`LogTime` AS `LogTime` from `Tank` where (not(`ID` in (select `ID` from `Tank` where ((`ID` > 5) and (`ID` < 60)))));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
