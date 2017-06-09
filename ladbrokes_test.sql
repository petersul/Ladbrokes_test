-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2017 at 09:52 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ladbrokes_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `competitor`
--

CREATE TABLE `competitor` (
  `competitorid` bigint(20) UNSIGNED NOT NULL,
  `competitorname` varchar(20) NOT NULL,
  `competitortype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `competitor`
--

INSERT INTO `competitor` (`competitorid`, `competitorname`, `competitortype`) VALUES
(1, 'Bitter Destroyer', 'Thoroughbred'),
(2, 'Ferral Giant', 'Thoroughbred'),
(3, 'Sovereign Chaos', 'Thoroughbred'),
(4, 'Jagged Hartstriker', 'Thoroughbred'),
(5, 'Ferocious Marvel', 'Thoroughbred'),
(6, 'Scared Fire', 'Thoroughbred'),
(7, 'Haunted Vagabond', 'Thoroughbred'),
(8, 'Clankingwood', 'Greyhound'),
(9, 'Rumbletopper', 'Greyhound'),
(10, 'Supperstone', 'Greyhound'),
(11, 'Worthingdale', 'Greyhound'),
(12, 'Wakefellow', 'Greyhound'),
(13, 'Supperfield', 'Greyhound'),
(14, 'Rothhold', 'Greyhound'),
(15, 'Knightchild', 'Greyhound'),
(16, 'Swashbuckler', 'Harness'),
(17, 'Sir Montague', 'Harness'),
(18, 'Super Peach', 'Harness'),
(19, 'Captain Parrot', 'Harness'),
(20, 'Fearful Scallywag', 'Harness'),
(21, 'Lady Josephine', 'Harness');

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `meetingid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `meeting_date` date NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting`
--

INSERT INTO `meeting` (`meetingid`, `name`, `meeting_date`, `type`) VALUES
(1, 'Doomben', '2017-06-10', 'Thoroughbred'),
(2, 'Ipswich', '2017-06-10', 'Greyhound'),
(3, 'Albion Park', '2017-06-11', 'Harness'),
(4, 'Kilcoy', '2017-06-11', 'Thoroughbred');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `raceid` int(11) NOT NULL,
  `competitorid` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`raceid`, `competitorid`, `position`) VALUES
(1, 2, 1),
(1, 4, 2),
(1, 3, 3),
(1, 5, 4),
(1, 6, 5),
(2, 1, 1),
(2, 6, 2),
(2, 7, 3),
(2, 5, 4),
(3, 13, 1),
(3, 11, 2),
(3, 9, 3),
(3, 14, 4),
(3, 12, 5),
(3, 15, 6),
(3, 10, 7),
(4, 19, 1),
(4, 16, 2),
(4, 17, 3),
(4, 20, 4),
(4, 18, 5),
(5, 7, 1),
(5, 2, 2),
(5, 6, 3),
(5, 3, 4),
(6, 20, 1),
(6, 17, 2),
(6, 21, 3),
(6, 18, 4),
(6, 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `raceid` bigint(20) UNSIGNED NOT NULL,
  `meetingid` int(11) NOT NULL,
  `closing_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `race`
--

INSERT INTO `race` (`raceid`, `meetingid`, `closing_time`) VALUES
(1, 1, '17:00:00'),
(2, 1, '19:00:00'),
(3, 2, '18:00:00'),
(4, 3, '14:00:00'),
(5, 4, '14:30:00'),
(6, 3, '15:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitor`
--
ALTER TABLE `competitor`
  ADD UNIQUE KEY `competitorid` (`competitorid`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meetingid`),
  ADD UNIQUE KEY `meetingid` (`meetingid`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`raceid`),
  ADD UNIQUE KEY `raceid` (`raceid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competitor`
--
ALTER TABLE `competitor`
  MODIFY `competitorid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `meetingid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `race`
--
ALTER TABLE `race`
  MODIFY `raceid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
