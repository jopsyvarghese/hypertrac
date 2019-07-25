-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2019 at 03:09 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hypertrac`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `name_or_no` varchar(100) NOT NULL,
  `dept` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `submitted_on` datetime NOT NULL,
  `validity` text NOT NULL,
  `status` int(11) NOT NULL,
  `app_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `name_or_no`, `dept`, `subject`, `submitted_on`, `validity`, `status`, `app_by`) VALUES
(1, 'AE10000', 1, 'Emigration Clearence', '2019-06-19 04:00:00', '15 Days', 0, 2),
(2, 'AE00002', 9, 'Stolen Passport', '2019-06-25 00:19:20', '23 Days', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `applications_comment`
--

CREATE TABLE `applications_comment` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `dept_assigned` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_by` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `commented_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_comment`
--

INSERT INTO `applications_comment` (`id`, `app_id`, `dept_assigned`, `comment`, `comment_by`, `role`, `commented_on`) VALUES
(7, 2, 3, 'Please assign to correct department', 1, 1, '2019-06-27 13:20:00'),
(9, 1, 3, 'Please close this asap', 1, 1, '2019-06-27 13:36:42'),
(10, 1, 4, 'This is not the correct queue', 1, 1, '2019-06-29 10:50:33'),
(11, 2, 7, 'Please ask the concern team', 1, 1, '2019-06-29 22:16:20'),
(12, 2, 9, 'This has to be assigned to correct department', 1, 1, '2019-06-29 22:33:02'),
(13, 1, 1, 'Hello', 1, 1, '2019-07-24 21:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `applications_more`
--

CREATE TABLE `applications_more` (
  `id` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  `company` varchar(30) NOT NULL,
  `comp_addr` text NOT NULL,
  `phone` bigint(20) NOT NULL,
  `phone2` bigint(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `website` varchar(30) NOT NULL,
  `buzz_type` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `major_client` int(11) NOT NULL,
  `sub_dept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_more`
--

INSERT INTO `applications_more` (`id`, `fk_id`, `company`, `comp_addr`, `phone`, `phone2`, `email`, `website`, `buzz_type`, `doc_name`, `major_client`, `sub_dept`) VALUES
(1, 2, 'Tretchmore Tech Solutions', 'some address where these beggers won\'t come', 9876541230, 9895989555, 'info@trechmore.com', 'www.trechmore.com', 1, 'silly doc', 2, 2),
(2, 1, 'Dorova Manpower', 'Sbc Square, Mount Crest Road, Kuwait', 32252332, 32255689, 'info@dorova.kw', 'www.dorova.kw', 1, 'Sample ', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pwd` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `role` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `rc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `fname`, `lname`, `uname`, `pwd`, `email`, `mob`, `role`, `created_at`, `rc`) VALUES
(1, 'jopsy', 'varghese', 'jopsy', 'Jopsy@123', 'jopsy@gmail.com', 7411395002, 1, '2019-06-26 18:21:51', '234100'),
(2, 'jomit', 'jose', 'jomit', 'Jomit@123', 'jomitjose9020@gmail.com', 7411180882, 0, '2019-06-26 18:45:10', '253585'),
(3, 'Jabir', 'Lalu', 'Jabir', 'Jabir@123', 'jabir@gmail.com', 9995559990, 2, '2019-06-26 18:54:05', '982222'),
(4, 'admin', 'varghese', 'admin', 'Admin@123', 'sdlfkj@gmal.com', 9965656565, 3, '2019-06-26 19:31:48', '56DC58'),
(5, 'Ajith', 'Kumar', 'ajith', 'Ajith@123', 'ajithkumar@gmail.com', 9876767676, 0, '2019-06-29 22:30:50', '56532E3'),
(7, 'labeesh', 'lakshmanan', 'labeesh', 'Labeesh@123', 'labeesh@gmail.com', 9876543211, 0, '2019-07-24 22:00:00', '252522');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(11) NOT NULL,
  `buzz_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `buzz_type`) VALUES
(1, 'Corporate Business'),
(2, 'Contractor Business');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `id` int(11) NOT NULL,
  `dname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`id`, `dname`) VALUES
(1, 'OSPAND'),
(2, 'NNPC'),
(3, 'NDDC'),
(4, 'SHELL'),
(5, 'AGIP'),
(6, 'MTN'),
(7, 'GLO'),
(8, 'CHEVRON'),
(9, 'PRESIDENCY'),
(10, 'UK EMBASSY');

-- --------------------------------------------------------

--
-- Table structure for table `dept_sub`
--

CREATE TABLE `dept_sub` (
  `id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `sname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_sub`
--

INSERT INTO `dept_sub` (`id`, `dept_id`, `sname`) VALUES
(1, 1, 'SA'),
(2, 2, 'DFA');

-- --------------------------------------------------------

--
-- Table structure for table `major_client`
--

CREATE TABLE `major_client` (
  `id` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `addr` varchar(500) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `phone2` bigint(20) DEFAULT NULL,
  `pwd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `major_client`
--

INSERT INTO `major_client` (`id`, `cname`, `addr`, `email`, `phone`, `phone2`, `pwd`) VALUES
(1, 'IBPOL', 'PO Box 2, Safat 13001, Kuwait City, Kuwait', 'info@ibpol.com', 2403335, 2426799, 'Sample@123'),
(2, 'PCROB', 'Arabian Gulf Street, Dasman, Kuwait City, Kuwait', 'info@pcrob.kw', 2409855, 2403377, 'Sample@123');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Asst. Engineer'),
(2, 'Asst. Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `dept` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `dept`, `position`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications_comment`
--
ALTER TABLE `applications_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications_more`
--
ALTER TABLE `applications_more`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept_sub`
--
ALTER TABLE `dept_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major_client`
--
ALTER TABLE `major_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applications_comment`
--
ALTER TABLE `applications_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `applications_more`
--
ALTER TABLE `applications_more`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dept_sub`
--
ALTER TABLE `dept_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `major_client`
--
ALTER TABLE `major_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
