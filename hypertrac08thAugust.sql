-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2019 at 06:56 PM
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
(1, 'AE10000', 4, 'Emigration Clearence', '2019-06-19 04:00:00', '15 Days', 0, 2),
(2, 'AE00002', 6, 'Stolen Passport', '2019-06-25 00:19:20', '23 Days', 4, 0),
(15, 'PSQ', 10, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(16, 'Sample Company', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 1, 1),
(17, 'RUCL', 1, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(18, 'Sample Company', 1, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 3, 1),
(19, 'Sample Company', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 1, 2),
(20, 'Sample Company', 1, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 2, 2),
(21, 'Sample Company', 1, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 3, 2),
(22, 'Sample Company', 1, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 4, 2),
(23, 'SDlfjsdl', 1, 'ID Proofs', '2019-07-30 23:20:00', '15 Days', 3, 2),
(24, 'Sample Company', 2, 'ID Proofs', '2019-07-30 23:21:19', '15 Days', 0, 2),
(25, 'Sample Company', 2, 'ID Proofs', '2019-08-03 10:12:17', '15 Days', 0, 2),
(26, 'asdfsfjlk', 1, 'Samp Doc', '2019-08-03 10:24:03', '15 Days', 0, 2),
(27, 'sam asdflk ', 2, 'Samp Doc', '2019-08-03 10:26:27', '15 Days', 0, 2),
(28, 'sdfsdf', 2, 'sdfksh', '2019-08-03 10:28:35', '15 Days', 0, 2),
(29, 'sdlui', 1, 'ID Proofs', '2019-08-03 10:34:58', '15 Days', 0, 2),
(30, 'Welcome company', 1, 'ID Proofs', '2019-08-03 10:53:18', '15 Days', 0, 2),
(31, 'Sample Company', 1, 'ID Proofs', '2019-08-03 11:00:45', '15 Days', 0, 2),
(32, 'Sample Company', 2, 'ID Proofs', '2019-08-03 11:02:57', '15 Days', 0, 2),
(33, 'Sample Company', 1, 'ID Proofs', '2019-08-03 11:06:13', '15 Days', 0, 2),
(34, 'Welcome company', 4, 'ID Proofs', '2019-08-03 11:14:12', '15 Days', 0, 2);

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
  `commented_on` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_comment`
--

INSERT INTO `applications_comment` (`id`, `app_id`, `dept_assigned`, `comment`, `comment_by`, `role`, `commented_on`, `status`) VALUES
(7, 2, 3, 'Please assign to correct department', 1, 1, '2019-06-27 13:20:00', 1),
(9, 1, 3, 'Please close this asap', 5, 1, '2019-06-27 13:36:42', 2),
(10, 1, 4, 'This is not the correct queue', 1, 1, '2019-06-29 10:50:33', 1),
(11, 2, 7, 'Please ask the concern team', 1, 1, '2019-06-29 22:16:20', 2),
(12, 2, 9, 'This has to be assigned to correct department', 2, 1, '2019-06-29 22:33:02', 1),
(13, 1, 1, 'Hello', 3, 1, '2019-07-24 21:00:35', 4),
(14, 34, 10, 'This is a test data', 1, 1, '2019-08-03 11:18:26', 4),
(15, 34, 10, 'Sample things', 3, 1, '2019-08-03 11:19:15', 4),
(16, 1, 5, 'welcome', 1, 1, '2019-08-03 11:56:27', 4),
(17, 2, 2, 'This is not working', 3, 2, '2019-08-03 23:26:47', 1),
(18, 2, 6, 'This is now working', 3, 2, '2019-08-03 23:27:24', 2),
(19, 15, 6, 'What is this guys? ', 1, 1, '2019-08-03 23:29:34', 3),
(20, 15, 10, 'Department Changed', 1, 1, '2019-08-03 23:30:24', 3),
(21, 1, 4, 'fasfd sd fsad', 3, 2, '2019-08-05 20:46:57', 3);

-- --------------------------------------------------------

--
-- Table structure for table `applications_img`
--

CREATE TABLE `applications_img` (
  `id` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  `img_path` text NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_img`
--

INSERT INTO `applications_img` (`id`, `fk_id`, `img_path`, `updated_at`) VALUES
(2, 24, '1564509079304maxresdefault.jpg', '2019-07-30 23:21:19'),
(3, 19, 'maxresdefault.jpg', '2019-07-31 02:00:00'),
(4, 19, 'web3.jpg', '2019-07-31 10:18:15'),
(5, 25, '1564807337753a6.png', '2019-08-03 10:12:17'),
(6, 26, '1564808043118a5.png', '2019-08-03 10:24:03'),
(7, 27, '', '2019-08-03 10:26:27'),
(8, 28, '', '2019-08-03 10:28:35'),
(9, 29, '1564808698071a4.png', '2019-08-03 10:34:58'),
(10, 30, '1564809798098kuwait.png', '2019-08-03 10:53:18'),
(11, 31, '1564810245542a1.png', '2019-08-03 11:00:45'),
(12, 31, '1564810245554a3.png', '2019-08-03 11:00:45'),
(13, 31, '1564810245557a5.png', '2019-08-03 11:00:45'),
(14, 32, '1564810377065a4.png', '2019-08-03 11:02:57'),
(15, 32, '1564810377068a5.png', '2019-08-03 11:02:57'),
(16, 32, '1564810377071a6.png', '2019-08-03 11:02:57'),
(17, 32, '1564810377073gmap.png', '2019-08-03 11:02:57'),
(18, 32, '1564810377075gulfMallu.png', '2019-08-03 11:02:57'),
(19, 32, '1564810377077kuwait.png', '2019-08-03 11:02:57'),
(20, 33, '1564810573353a1.png', '2019-08-03 11:06:13'),
(21, 33, '1564810573363a2.png', '2019-08-03 11:06:13'),
(22, 33, '1564810573365a3.png', '2019-08-03 11:06:13'),
(23, 34, '1564811052275a3.png', '2019-08-03 11:14:12'),
(24, 34, '1564811052285a4.png', '2019-08-03 11:14:12');

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
  `email` varchar(50) NOT NULL,
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
(2, 1, 'Dorova Manpower', 'Sbc Square, Mount Crest Road, Kuwait', 32252332, 32255689, 'info@dorova.kw', 'www.dorova.kw', 1, 'Sample ', 2, 2),
(3, 15, 'Sample Company', 's df sdf asd fasdf asf', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(4, 16, 'Sample Company', 's df sdf asd fasdf asf', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 2, 2),
(5, 17, 'Sample Company', 's df sdf asd fasdf asf', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(6, 18, 'Sample Company', 's sdf sadf', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(7, 19, 'Sample Company', 'd fsdf sdf ', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 1, 'ID Proofs', 2, 2),
(8, 20, 'Sample Company', 'asdf sdafj l', 30023493, 20034934, 'jopsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(9, 21, 'Sample Company', 'sadfsjdf a', 30023493, 20034934, 'jopsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(10, 22, 'Sample Company', 'sadfsjdf a', 30023493, 20034934, 'jopsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(11, 24, 'Sample Company', 'sdfsljdf l j', 30023493, 20034934, 'baljit.singh-bhayana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 2, 2),
(12, 25, 'Sample Company', 'sdfjsdfklsj l jlj lj', 30023493, 20034934, 'jopsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 2, 2),
(13, 26, 'asdfsfjlk', 'sdf jsajdf lk', 23348378, 382748237, 'abc@gkc.com', 'www.abc.com', 2, 'Samp Doc', 1, 1),
(14, 27, 'sam asdflk ', 'sdf asdlfkj sfjl asdf', 23348378, 382748237, 'abc@gkc.com', 'www.abc.com', 2, 'Samp Doc', 2, 2),
(15, 28, 'sdfsdf', 's  fsals lskfd', 23348378, 382748237, 'abc@gkc.com', 'www.abc.com', 2, 'sdfksh', 2, 2),
(16, 29, 'Welcome company', 'This is a test', 30023493, 20034934, 'jopsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(17, 30, 'Welcome company', 'asdfsfd sd df', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(18, 1, 'Sample Company', 'sdfk slajfdlj ', 30023493, 20034934, 'sal@fjdk.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(19, 32, 'Sample Company', 'sdfk slajfdlj ', 30023493, 20034934, 'sal@fjdk.com', 'www.info.com', 2, 'ID Proofs', 2, 2),
(20, 33, 'Sample Company', 'sdfk slajfdlj ', 30023493, 20034934, 'sal@fjdk.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(21, 34, 'Welcome company', 'skdfjh', 30023493, 20034934, 'baljit.singh-bhayana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 1, 1);

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
(3, 'Jabir', 'Lalu', 'Jabir', 'Jabir@123', 'jabir123@gmail.com', 9995559992, 2, '2019-06-26 18:54:05', '982222'),
(4, 'admin', 'varghese', 'admin', 'Admin@123', 'sdlfkj@gmal.com', 9965656565, 3, '2019-06-26 19:31:48', '56DC58'),
(5, 'Ajith', 'Kumar', 'ajith', 'Ajith@123', 'ajithkumar@gmail.com', 9876767676, 0, '2019-06-29 22:30:50', '56532E3'),
(7, 'labeesh', 'lakshmanan', 'labeesh', 'Labeesh@123', 'labeesh@gmail.com', 9876543211, 0, '2019-07-24 22:00:00', '252522'),
(14, 'Sudheesh', 'Kumar', 'sudheesh15342', 'Sudheesh@123', 'jopsyvarghese@gmail.com', 99832948384, 1, '2019-08-04 13:03:30', '0');

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
  `dname` varchar(30) NOT NULL,
  `mc_id` int(11) NOT NULL,
  `dept_head` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`id`, `dname`, `mc_id`, `dept_head`) VALUES
(1, 'OSPAND', 3, 'Sam Jacob'),
(2, 'NNPC', 3, 'Sam Jacob'),
(3, 'NDDC', 2, 'Sony P S'),
(4, 'SHELL', 2, 'Sony P S'),
(5, 'AGIP', 1, 'Sashidhar M'),
(6, 'MTN', 3, 'Sam Jacob'),
(7, 'GLO', 1, 'Sashidhar M'),
(8, 'CHEVRON', 3, 'Sam Jacob'),
(9, 'PRESIDENCY', 1, 'Sashidhar M'),
(10, 'UK EMBASSY', 3, 'Sam Jacob'),
(11, 'IDORL', 3, 'Sudheesh S ');

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
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `app_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `docs_submitted` int(11) NOT NULL,
  `ofc_visited` int(11) NOT NULL,
  `extra_docs_required` int(11) NOT NULL,
  `extra_docs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invitation`
--

INSERT INTO `invitation` (`app_id`, `status`, `docs_submitted`, `ofc_visited`, `extra_docs_required`, `extra_docs`) VALUES
(1, 1, 1, 1, 1, 'Need fresh docs'),
(2, 1, 1, 1, 0, 'Not required'),
(15, 0, 1, 0, 0, 'No extra docs required'),
(16, 1, 0, 0, 0, ''),
(17, 1, 1, 0, 0, ''),
(34, 1, 0, 0, 1, 'New Docs required');

-- --------------------------------------------------------

--
-- Table structure for table `major_client`
--

CREATE TABLE `major_client` (
  `id` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `addr` varchar(500) NOT NULL,
  `phone2` bigint(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `major_client`
--

INSERT INTO `major_client` (`id`, `cname`, `addr`, `phone2`, `created_by`) VALUES
(2, 'PCROB', 'Arabian Gulf Street, Dasman, Kuwait City, Kuwait', 2403377, 0),
(3, 'IBPOLS', 'PO Box 23, Safat 13001, Kuwait City, Kuwait', 2426799, 0);

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
(2, 'Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `dept` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `sub_dept_id` int(11) NOT NULL,
  `mc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `dept`, `position`, `sub_dept_id`, `mc_id`) VALUES
(1, 1, 1, 1, 3),
(14, 6, 1, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `send_by` int(11) NOT NULL,
  `sent_to` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `posted_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `applications_img`
--
ALTER TABLE `applications_img`
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
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`app_id`);

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
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `applications_comment`
--
ALTER TABLE `applications_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `applications_img`
--
ALTER TABLE `applications_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `applications_more`
--
ALTER TABLE `applications_more`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dept_sub`
--
ALTER TABLE `dept_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
