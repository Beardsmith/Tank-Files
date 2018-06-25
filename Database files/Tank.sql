-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2018 at 06:09 PM
-- Server version: 5.5.59
-- PHP Version: 5.4.4-14+deb7u9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


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
-- Table structure for table `Average`
--

CREATE TABLE IF NOT EXISTS `Average` (
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Average` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Average`
--

INSERT INTO `Average` (`DateTime`, `Average`) VALUES
('2018-06-25 00:26:04', 27009.5),
('2018-06-25 03:51:18', 27076.6),
('2018-06-25 07:51:18', 27073.4);

-- --------------------------------------------------------

--
-- Table structure for table `gauge_detail`
--

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
(1, 0, 3823, '#ff0000'),
(2, 3823, 7645, '#ff0000'),
(3, 7645, 11468, '#ffA500'),
(4, 11468, 15290, '#ffA500'),
(5, 15290, 19113, '#ffA500'),
(6, 19113, 22935, ' 	#ffff00'),
(7, 22935, 26758, ' 	#ffff00'),
(8, 26758, 30580, ' 	#ffff00'),
(9, 30580, 34403, '00ff00'),
(10, 34403, 38227, '00ff00'),
(11, 38227, 45000, '00ff00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `last 30 readings`
--
CREATE TABLE IF NOT EXISTS `last 30 readings` (
`ID` int(12)
,`Level` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `Name`
--

CREATE TABLE IF NOT EXISTS `Name` (
  `NameID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Height` int(11) DEFAULT NULL,
  `Width` int(11) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  PRIMARY KEY (`NameID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Name`
--

INSERT INTO `Name` (`NameID`, `Name`, `Height`, `Width`, `Volume`) VALUES
(1, 'Tank 1', 0, 0, 0),
(2, 'Tank 2', 0, 0, 0),
(3, 'Tank 3', 0, 0, 0),
(4, 'Tank 4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Tank`
--

CREATE TABLE IF NOT EXISTS `Tank` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `TankID` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `LogTime` (`LogTime`),
  KEY `TankID` (`TankID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `Tank`
--

INSERT INTO `Tank` (`ID`, `TankID`, `Level`, `LogTime`) VALUES
(1, 1, 27150, '2018-06-21 07:15:12'),
(2, 1, 27052, '2018-06-21 07:16:12'),
(3, 1, 27146, '2018-06-21 07:17:12'),
(4, 1, 27154, '2018-06-21 07:18:12'),
(5, 1, 27056, '2018-06-21 07:19:12'),
(6, 1, 27052, '2018-06-21 07:20:12'),
(7, 1, 27056, '2018-06-21 07:21:12'),
(8, 1, 27150, '2018-06-21 07:22:12'),
(9, 1, 27150, '2018-06-21 07:23:12'),
(10, 1, 27059, '2018-06-21 07:24:12'),
(11, 1, 27056, '2018-06-21 07:25:12'),
(12, 1, 27052, '2018-06-21 07:26:12'),
(13, 1, 27052, '2018-06-21 07:27:12'),
(14, 1, 27146, '2018-06-21 07:28:12'),
(15, 1, 27139, '2018-06-21 07:29:12'),
(16, 1, 27059, '2018-06-21 07:30:12'),
(17, 1, 27056, '2018-06-21 07:31:12'),
(18, 1, 27052, '2018-06-21 07:32:13'),
(19, 1, 27143, '2018-06-21 07:33:13'),
(20, 1, 27139, '2018-06-21 07:34:13'),
(21, 1, 27143, '2018-06-21 07:35:13'),
(22, 1, 27052, '2018-06-21 07:36:13'),
(23, 1, 27143, '2018-06-21 07:37:13'),
(24, 1, 27146, '2018-06-21 07:38:13'),
(25, 1, 27146, '2018-06-21 07:39:13'),
(26, 1, 27052, '2018-06-21 07:40:13'),
(27, 1, 27052, '2018-06-21 07:41:13'),
(28, 1, 27052, '2018-06-21 07:42:13'),
(29, 1, 27052, '2018-06-21 07:43:13'),
(30, 1, 27052, '2018-06-21 07:44:13'),
(31, 1, 27135, '2018-06-21 07:45:13'),
(32, 1, 27056, '2018-06-21 07:46:13'),
(33, 1, 27139, '2018-06-21 07:47:13'),
(34, 1, 27146, '2018-06-21 07:48:13'),
(35, 1, 26907, '2018-06-21 11:49:31'),
(36, 1, 26831, '2018-06-21 15:49:30'),
(37, 1, 26929, '2018-06-21 19:49:29'),
(38, 1, 27187, '2018-06-22 01:45:00'),
(39, 1, 27282, '2018-06-22 05:45:00'),
(40, 1, 27161, '2018-06-22 09:44:59'),
(41, 1, 27165, '2018-06-22 13:44:59'),
(42, 1, 27088, '2018-06-22 17:44:58'),
(43, 1, 27073, '2018-06-22 21:44:58'),
(44, 1, 27080, '2018-06-23 01:44:57'),
(45, 1, 27168, '2018-06-23 05:44:57'),
(46, 1, 27135, '2018-06-23 09:44:56'),
(47, 1, 26963, '2018-06-23 13:44:56'),
(48, 1, 26927, '2018-06-23 17:44:55'),
(49, 1, 26981, '2018-06-23 21:44:55'),
(50, 1, 27187, '2018-06-24 03:51:21'),
(51, 1, 27003, '2018-06-24 07:51:21'),
(52, 1, 26970, '2018-06-24 11:51:20'),
(53, 1, 27147, '2018-06-24 12:29:10'),
(54, 1, 27147, '2018-06-24 12:29:11'),
(55, 1, 27147, '2018-06-24 12:29:12'),
(56, 1, 27147, '2018-06-24 12:30:12'),
(57, 1, 27147, '2018-06-24 12:30:13'),
(58, 1, 27147, '2018-06-24 12:30:14'),
(59, 1, 27147, '2018-06-24 12:31:15'),
(60, 1, 27147, '2018-06-24 12:31:15'),
(61, 1, 27147, '2018-06-24 12:31:16'),
(62, 1, 26813, '2018-06-24 15:51:20'),
(63, 1, 26795, '2018-06-24 19:51:19'),
(64, 1, 26853, '2018-06-24 23:51:19'),
(65, 1, 26853, '2018-06-25 00:26:04'),
(66, 1, 26941, '2018-06-25 03:51:18'),
(67, 1, 26934, '2018-06-25 07:51:18');

--
-- Triggers `Tank`
--
DROP TRIGGER IF EXISTS `average_after_insert`;
DELIMITER //
CREATE TRIGGER `average_after_insert` AFTER INSERT ON `Tank`
 FOR EACH ROW BEGIN
		DECLARE avgLevel FLOAT;
		SELECT AVG(Level) FROM Tank INTO avgLevel;
		INSERT INTO Average(Average) VALUES (avgLevel);
	END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `topBottom`
--
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
