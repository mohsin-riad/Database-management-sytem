-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2019 at 08:22 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_contest_mgt_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contest_info`
--

CREATE TABLE `contest_info` (
  `t_id` varchar(30) NOT NULL,
  `university` varchar(30) DEFAULT NULL,
  `problems` int(11) DEFAULT NULL,
  `contest_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member_reg`
--

CREATE TABLE `member_reg` (
  `m_id` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `university` varchar(30) NOT NULL,
  `gender` varchar(7) DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `t_id` varchar(20) NOT NULL,
  `t_name` varchar(20) DEFAULT NULL,
  `m_id1` varchar(30) DEFAULT NULL,
  `m_id2` varchar(30) DEFAULT NULL,
  `m_id3` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `contest_info`
--
ALTER TABLE `contest_info`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `t_id` (`t_id`);

--
-- Indexes for table `member_reg`
--
ALTER TABLE `member_reg`
  ADD PRIMARY KEY (`m_id`,`username`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `fk_teams` (`m_id1`),
  ADD KEY `fk_teams1` (`m_id2`),
  ADD KEY `fk_teams2` (`m_id3`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contest_info`
--
ALTER TABLE `contest_info`
  ADD CONSTRAINT `fk_contest_info` FOREIGN KEY (`t_id`) REFERENCES `teams` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_teams` FOREIGN KEY (`m_id1`) REFERENCES `member_reg` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_teams1` FOREIGN KEY (`m_id2`) REFERENCES `member_reg` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_teams2` FOREIGN KEY (`m_id3`) REFERENCES `member_reg` (`m_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
