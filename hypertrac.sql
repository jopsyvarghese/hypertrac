-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2019 at 08:42 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.25

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
(1, 'AE10000', 6, 'Emigration Clearence', '2019-06-19 04:00:00', '15 Days', 0, 2),
(2, 'AE00002', 1, 'Stolen Passport', '2019-06-25 00:19:20', '23 Days', 4, 0),
(15, 'PSQ', 10, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(16, 'Sample Company', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 1, 1),
(17, 'RUCL', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(18, 'Sample Company', 7, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 3, 1),
(19, 'Sample Company', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 1, 2),
(20, 'Sample Company', 6, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 2, 2),
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
(32, 'Sample Company', 1, 'ID Proofs', '2019-08-03 11:02:57', '15 Days', 0, 16),
(33, 'Sample Company', 1, 'ID Proofs', '2019-08-03 11:06:13', '15 Days', 0, 2),
(34, 'Welcome company', 4, 'ID Proofs', '2019-08-03 11:14:12', '15 Days', 0, 16),
(35, 'My personal Company', 3, 'ID Proofs', '2019-08-13 23:30:59', '15 Days', 0, 15),
(36, 'My personal Company', 3, 'ID Proofs', '2019-08-13 23:31:32', '15 Days', 0, 15),
(37, 'Welcome company', 3, 'ID Proofs', '2019-08-25 13:25:57', '15 Days', 0, 16),
(38, 'Sample Company', 3, 'ID Proofs', '2019-08-25 20:02:20', '15 Days', 0, 2),
(39, 'Sample Company', 3, 'ID Proofs', '2019-08-25 20:08:52', '15 Days', 0, 2),
(40, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:11:04', '15 Days', 0, 2),
(41, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:11:20', '15 Days', 0, 2),
(42, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:12:01', '15 Days', 0, 2),
(43, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:12:23', '15 Days', 0, 2),
(44, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:14:02', '15 Days', 0, 2),
(45, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:14:33', '15 Days', 0, 2),
(46, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:16:49', '15 Days', 0, 2),
(47, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:17:19', '15 Days', 0, 2),
(48, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:20:21', '15 Days', 0, 2),
(49, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:21:51', '15 Days', 0, 2),
(50, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:22:48', '15 Days', 0, 2),
(51, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:24:03', '15 Days', 0, 2),
(52, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:24:43', '15 Days', 0, 2),
(53, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:25:00', '15 Days', 0, 2),
(54, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:26:29', '15 Days', 0, 2),
(55, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:27:30', '15 Days', 0, 2),
(56, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:28:11', '15 Days', 0, 2),
(57, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:29:30', '15 Days', 0, 2),
(58, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:31:38', '15 Days', 0, 2),
(59, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:31:54', '15 Days', 0, 2),
(60, 'My ID Card Application', 3, 'ID Proofs', '2019-08-25 20:32:04', '15 Days', 0, 2),
(61, 'Welcome company', 3, 'ID Proofs', '2019-08-25 20:35:59', '15 Days', 0, 2),
(62, 'Sample Company', 3, 'ID Proofs', '2019-08-26 00:00:17', '15 Days', 0, 2),
(63, 'Sample Company', 3, 'ID Proofs', '2019-08-26 00:02:48', '15 Days', 0, 2),
(64, 'Sample Company', 3, 'ID Proofs', '2019-08-26 00:03:19', '15 Days', 0, 2),
(65, 'Sample Company', 3, 'ID Proofs', '2019-08-26 00:06:05', '15 Days', 0, 2),
(66, 'Welcome company', 3, 'asd fsdaf', '2019-08-31 16:49:12', '15 Days', 0, 2),
(67, 'Welcome company', 3, 'ID Proofs', '2019-08-31 16:50:59', '15 Days', 0, 2),
(68, 'Welcome company', 3, 'ID Proofs', '2019-08-31 16:54:18', '15 Days', 0, 2),
(69, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:55:29', '15 Days', 0, 2),
(70, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:55:45', '15 Days', 0, 2),
(71, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:55:47', '15 Days', 0, 2),
(72, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:56:21', '15 Days', 0, 2),
(73, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:56:52', '15 Days', 0, 2),
(74, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:57:34', '15 Days', 0, 2),
(75, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:58:04', '15 Days', 0, 2),
(76, 'Sample Company', 3, 'ID Proofs', '2019-08-31 16:58:57', '15 Days', 0, 2),
(77, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:02:14', '15 Days', 0, 2),
(78, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:02:28', '15 Days', 0, 2),
(79, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:03:21', '15 Days', 0, 2),
(80, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:06:26', '15 Days', 0, 2),
(81, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:08:13', '15 Days', 0, 2),
(82, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:09:15', '15 Days', 0, 2),
(83, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:09:41', '15 Days', 0, 2),
(84, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:09:52', '15 Days', 0, 2),
(85, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:10:01', '15 Days', 0, 2),
(86, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:10:16', '15 Days', 0, 2),
(87, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:11:16', '15 Days', 0, 2),
(88, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:11:32', '15 Days', 0, 2),
(89, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:12:39', '15 Days', 0, 2),
(90, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:13:24', '15 Days', 0, 2),
(91, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:13:53', '15 Days', 0, 2),
(92, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:23:02', '15 Days', 0, 2),
(93, 'Welcome company', 3, 'ID Proofs', '2019-08-31 17:24:30', '15 Days', 0, 2),
(94, 'Sample Company', 3, 'ID Proofs', '2019-08-31 17:27:06', '15 Days', 0, 2),
(95, 'Sample Company', 1, 'ID Proofs', '2019-08-31 17:29:21', '15 Days', 0, 2),
(96, 'Welcome company', 3, 'ID Proofs', '2019-09-01 22:54:27', '15 Days', 0, 2),
(97, 'Welcome company', 3, 'ID Proofs', '2019-09-02 00:05:05', '15 Days', 0, 2),
(98, 'Welcome company', 6, 'ID Proofs', '2019-09-02 00:05:05', '15 Days', 0, 2);

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
  `status` int(11) NOT NULL,
  `staff_assigned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_comment`
--

INSERT INTO `applications_comment` (`id`, `app_id`, `dept_assigned`, `comment`, `comment_by`, `role`, `commented_on`, `status`, `staff_assigned`) VALUES
(7, 2, 3, 'Please assign to correct department', 1, 1, '2019-06-27 13:20:00', 1, 0),
(9, 1, 3, 'Please close this asap', 5, 1, '2019-06-27 13:36:42', 2, 0),
(10, 1, 4, 'This is not the correct queue', 1, 1, '2019-06-29 10:50:33', 1, 0),
(11, 2, 7, 'Please ask the concern team', 1, 1, '2019-06-29 22:16:20', 2, 0),
(12, 2, 9, 'This has to be assigned to correct department', 2, 1, '2019-06-29 22:33:02', 1, 0),
(13, 1, 1, 'Hello', 3, 1, '2019-07-24 21:00:35', 4, 0),
(14, 34, 10, 'This is a test data', 1, 1, '2019-08-03 11:18:26', 4, 0),
(15, 34, 10, 'Sample things', 3, 1, '2019-08-03 11:19:15', 4, 0),
(16, 1, 5, 'welcome', 1, 1, '2019-08-03 11:56:27', 4, 0),
(17, 2, 2, 'This is not working', 3, 2, '2019-08-03 23:26:47', 1, 0),
(18, 2, 6, 'This is now working', 3, 2, '2019-08-03 23:27:24', 2, 0),
(19, 15, 6, 'What is this guys? ', 1, 1, '2019-08-03 23:29:34', 3, 0),
(20, 15, 10, 'Department Changed', 1, 1, '2019-08-03 23:30:24', 3, 0),
(21, 1, 4, 'fasfd sd fsad', 3, 2, '2019-08-05 20:46:57', 3, 0),
(22, 17, 2, 'This is something complicated', 1, 1, '2019-08-13 23:21:53', 1, 0),
(23, 18, 7, 'a sdfsadfsa ', 1, 1, '2019-08-13 23:35:49', 1, 0),
(24, 1, 11, 'working or not? ', 3, 2, '2019-08-13 23:40:10', 3, 0),
(25, 20, 3, 'This is a comment', 1, 1, '2019-08-21 10:11:52', 2, 0),
(26, 20, 3, 'This ticket has to closed as the documentation and processing is completed today', 1, 1, '2019-08-21 11:26:35', 4, 0),
(27, 20, 1, 'This is to be addressed by Jopsy. Please take care of this', 1, 1, '2019-08-21 11:53:54', 1, 1),
(28, 20, 6, 'Sorry. please do the needful from your end', 1, 1, '2019-08-21 11:59:41', 1, 14),
(29, 1, 1, 'Why did you assign it to Sudheesh, it has to be handled from your department. Please check with your department head for help', 3, 2, '2019-08-21 12:13:39', 1, 1),
(30, 1, 1, 'That\'s a good point', 3, 0, '2019-08-21 12:23:08', 1, 1),
(31, 2, 1, ' This is not a problem', 4, 0, '2019-08-21 13:39:03', 1, 1),
(32, 32, 1, 'Test', 4, 0, '2019-08-25 23:26:54', 1, 1),
(33, 95, 1, 'sdfsd sdf ', 1, 1, '2019-08-31 17:31:08', 1, 1),
(34, 1, 5, 'This has to be added with all purposes', 1, 1, '2019-09-02 08:01:36', 1, 22),
(35, 1, 5, 'This has to be added with all purposes', 1, 1, '2019-09-02 08:04:06', 1, 22),
(36, 1, 6, 'd asdfsad fasdfa sdfa ', 1, 1, '2019-09-02 08:06:21', 1, 14),
(37, 1, 6, 'd asdfsad fasdfa sdfa ', 1, 1, '2019-09-02 08:07:16', 1, 14),
(38, 1, 6, 'sdf sadf asdf', 1, 1, '2019-09-02 08:08:02', 1, 14),
(39, 1, 6, 'er tewrt fdg dfsg', 1, 1, '2019-09-02 08:12:37', 1, 14),
(40, 1, 6, 'asdf sdf asdf', 3, 2, '2019-09-02 08:17:09', 1, 14),
(41, 98, 6, 'Sfdlds fjskldjf l', 4, 3, '2019-09-02 08:20:49', 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `applications_img`
--

CREATE TABLE `applications_img` (
  `id` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  `img_path` text NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploaded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications_img`
--

INSERT INTO `applications_img` (`id`, `fk_id`, `img_path`, `updated_at`, `uploaded_by`) VALUES
(79, 96, '1567358667354maxresdefault.jpg', '2019-09-01 22:54:27', 0),
(80, 96, '1567358667358web3.jpg', '2019-09-01 22:54:27', 0),
(81, 97, '1567362905855maxresdefault.jpg', '2019-09-02 00:05:05', 2),
(82, 98, '1567362905851maxresdefault.jpg', '2019-09-02 00:05:05', 2),
(83, 97, '1567362905860web3.jpg', '2019-09-02 00:05:05', 2),
(84, 98, '1567362905859web3.jpg', '2019-09-02 00:05:05', 2),
(85, 0, '1567391496159testimonial-4.jpg', '2019-09-02 08:01:36', 1),
(86, 0, '1567391646206testimonial-4.jpg', '2019-09-02 08:04:06', 1),
(87, 1, '1567391781014testimonial-4.jpg', '2019-09-02 08:06:21', 1),
(88, 1, '1567391836335testimonial-4.jpg', '2019-09-02 08:07:16', 1),
(89, 1, '1567391882201testimonial-4.jpg', '2019-09-02 08:08:02', 1),
(90, 1, '1567392157647team-4.jpg', '2019-09-02 08:12:37', 1),
(91, 1, '1567392429865history-iphone-4s-hero.jpg', '2019-09-02 08:17:09', 3),
(92, 98, '1567392649688930-00.jpg', '2019-09-02 08:20:49', 4);

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
(8, 20, 'Sample Company', 'asdf sdafj l', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
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
(21, 34, 'Welcome company', 'skdfjh', 30023493, 20034934, 'baljit.singh-bhayana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(22, 35, 'My personal Company', 'asdf sad fsalkdf lsakdjflks adflsdj flasjdflksjadfjlksa dfhoisd flsdfjklsja lfjlskadjfosdfalskfjsakl jflksja fasfd', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(23, 36, 'My personal Company', 'asdf sad fsalkdf lsakdjflks adflsdj flasjdflksjadfjlksa dfhoisd flsdfjklsja lfjlskadjfosdfalskfjsakl jflksja fasfd', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(24, 37, 'Welcome company', 'sasda asd a sdfsdf', 23423423, 20034934, 'baljiyana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(25, 38, 'Sample Company', 'sklcvhsakldf jl', 23948923, 23894299, 'sal@fjdk.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(26, 39, 'Sample Company', 'asdfasjdf alsjdfk ls', 90898988, 98324298, 'jsdfwe7se@gmail.com', 'www.infosdfh.com', 2, 'ID Proofs', 3, 1),
(27, 40, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(28, 41, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(29, 42, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(30, 43, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(31, 44, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(32, 45, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(33, 46, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(34, 47, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(35, 48, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(36, 49, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(37, 50, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(38, 51, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(39, 52, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(40, 53, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(41, 54, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(42, 55, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(43, 56, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(44, 57, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(45, 58, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(46, 59, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(47, 60, 'My ID Card Application', 'Sample service', 23894832849, 3928492347, 'jopsy2387@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(48, 61, 'Welcome company', 'sdklfskldjfl', 23948932, 347829734, 'hon29304ey@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(49, 62, 'Sample Company', 'dsflkjsdl', 9898898987, 9898989887, 'baljit.sayana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(50, 63, 'Sample Company', 'asdfsdklj ', 932898, 989898, 'josdfsdpsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(51, 64, 'Sample Company', 'asdfsdklj ', 932898, 989898, 'josdfsdpsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(52, 65, 'Sample Company', 'asdfsdklj ', 932898, 989898, 'josdfsdpsy@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(53, 66, 'Welcome company', 'as sdf asf', 23423423, 234234, 'jopsy7sdf77@gmail.com', 'www.infosdfh.com', 1, 'asd fsdaf', 3, 6),
(54, 67, 'Welcome company', 'sasda asd a sdfsdf', 30023493, 20034934, 'honasdfey@gmail.com', 'www.info23432.com', 2, 'ID Proofs', 3, 1),
(55, 68, 'Welcome company', 'sasda asd a sdfsdf', 23948923, 234234, 'baljitd@capgemini.com', 'www.info.com', 1, 'ID Proofs', 3, 1),
(56, 69, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(57, 70, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(58, 71, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(59, 72, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(60, 73, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(61, 74, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jsdfrghese@gmail.com', 'www.info.com', 1, 'ID Proofs', 3, 1),
(62, 75, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(63, 76, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(64, 77, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(65, 78, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(66, 79, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(67, 80, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(68, 81, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(69, 82, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(70, 83, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(71, 84, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(72, 85, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(73, 86, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(74, 87, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(75, 88, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(76, 89, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(77, 90, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(78, 91, 'Sample Company', 'sasda asd a sdfsdf', 23423423, 234234, 'jopsywqghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(79, 92, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'salsdf@fjdk.com', 'www.infosdfh.com', 2, 'ID Proofs', 3, 1),
(80, 93, 'Welcome company', 'sasda asd a sdfsdf', 30023493, 20034934, 'jopssdfy@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 1),
(81, 94, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'hosdfney@gmail.com', 'www.infosdfh.com', 2, 'ID Proofs', 3, 1),
(82, 95, 'Sample Company', 'sasda asd a sdfsdf', 30023493, 20034934, 'josdfpsy777@gmail.com', 'www.info232.com', 1, 'ID Proofs', 3, 1),
(83, 96, 'Welcome company', 'sasda asd a sdfsdf', 23948923, 234234, 'jopsyvasdfsarghese@gmail.com', 'sdfwe.comd.co', 2, 'ID Proofs', 3, 1),
(84, 97, 'Welcome company', 'sasda asd a sdfsdf', 30023493, 234234, 'honey@gmail.cos', 'www.info23432.com', 2, 'ID Proofs', 3, 1),
(85, 98, 'Welcome company', 'sasda asd a sdfsdf', 30023493, 234234, 'honey@gmail.cos', 'www.info23432.com', 2, 'ID Proofs', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `addr` text NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pwd` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `role` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `rc` varchar(30) NOT NULL,
  `mob2` bigint(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `pwd_reset` int(11) NOT NULL DEFAULT '0',
  `reset_hash` text,
  `pro_pic` varchar(150) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `fname`, `addr`, `uname`, `pwd`, `email`, `mob`, `role`, `created_at`, `rc`, `mob2`, `created_by`, `pwd_reset`, `reset_hash`, `pro_pic`, `status`) VALUES
(1, 'jopsy varghese', 'ABC Street, PSR Nagar, UT - 23389', 'jopsy', '79967c73489f12ebd4295049fa22eb89e4fdbb2e3f97da6747969df54b4d59cbdf0c7f5f2b33ef9c23ddfdc5aa2a6013b04abd3ac1e2fedc6c04fa289ded2dab', 'jopsyvarghese@gmail.com', 7411395003, 1, '2019-06-26 18:21:51', '234100', 0, 0, 0, '', '1567443820535pp.jpg', 0),
(2, 'jomit', 'Personal', 'jomit', '835b3ebafad84afcc1c2e73f9425e3361df1b83683a79f755deb5698ec63cb0078ccb1f9e1bf5607f39e20eea2208ecf150354483b0cb5146fb9700b7876388e', 'jopsyvasdfrghese@gmail.com', 7411180882, 0, '2019-06-26 18:45:10', '253585', 0, 0, 0, '', '1567358626452maxresdefault.jpg', 0),
(3, 'Jabir', 'Loby#23, Back Street Boys Road, BBP', 'Jabir', '1f71d9321dd22607901162989db685958781906c28c5d2480022ae29a56e0e19d10058cefa52cedc585a040107394961f0f132ed8ff1d96cc239ef829d092e51', 'jopsyvarghese23@gmail.com', 9995559992, 2, '2019-06-26 18:54:05', '982222', 0, 0, 0, '', '', 0),
(4, 'Hypertrac Limited', 'I don\'t need to update my address', 'admin', '6a8eabb9447e2fd817035c282e2275d4fa21f91409dd4726eb071d35e645418192feb3b5f0c60ff836345481bcf3739e3c728e91bd97aa191f92c148be4becae', 'hypertracltd@gmail.com', 9965656565, 3, '2019-06-26 19:31:48', '56DC58', 0, 0, 0, '', '', 0),
(7, 'labeesh', 'lakshmanan', 'labeesh', 'Labeesh@123', 'labeesh@gmail.com', 9876543211, 0, '2019-07-24 22:00:00', '252522', 0, 0, 0, '', '', 0),
(14, 'Sudheesh', 'Kumar', 'sudheesh15300', 'Sudheesh@123', 'jopsyvarghesdfkhsse@gmail.com', 99832948384, 1, '2019-08-04 13:03:30', '0', 0, 0, 0, '', '', 0),
(16, 'Sams Infotech', 'sdlfjs dlfjksl dflsdj fsodjfoiw eldsjf lsdjf', 'samsinfo', '6dbcd1a99470d76a0d8bcd978d51040e1c752c054f2100bba2ee0595e9d7e6b03c81645f2245324c2fd9e489a0b8a7312030587c254bad4561a36c7762e54767', 'sandeiii@fm.com', 9384647377, 4, '2019-08-15 20:06:09', '3847234', 0, 0, 0, NULL, '', 0),
(21, 'Shaji', 'Abc House PQE Street, Konni', 'shaji', '79967c73489f12ebd4295049fa22eb89e4fdbb2e3f97da6747969df54b4d59cbdf0c7f5f2b33ef9c23ddfdc5aa2a6013b04abd3ac1e2fedc6c04fa289ded2dab', 'hsaldsfkj@gmilad.com', 2309424, 2, '2019-08-15 21:33:28', '', 0, 4, 0, NULL, '', 0),
(38, 'josena', 'jessy joseph', 'josena', '79967c73489f12ebd4295049fa22eb89e4fdbb2e3f97da6747969df54b4d59cbdf0c7f5f2b33ef9c23ddfdc5aa2a6013b04abd3ac1e2fedc6c04fa289ded2dab', 'josenajopsy@gmail.com', 7411180883, 4, '2019-09-02 11:04:00', '', 0, 0, 0, NULL, '', 0);

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
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `c_by` int(11) NOT NULL,
  `c_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `fk_id`, `comment`, `c_by`, `c_time`) VALUES
(1, 5, 'maple gold color phone is not available for me', 2, '2019-08-11 08:00:00'),
(2, 5, 'Some sample data', 2, '2019-08-12 00:02:34'),
(3, 5, 'Will this work? ', 2, '2019-08-12 00:09:38'),
(4, 5, 'I don\'t htink so', 2, '2019-08-12 00:16:48'),
(5, 5, 'Is it so? ', 2, '2019-08-12 00:17:45'),
(6, 5, 'sdt;sdfsd', 2, '2019-08-12 00:18:47'),
(7, 5, 'Are you coming? ', 2, '2019-08-12 00:23:42'),
(8, 5, 'Hi Jopsy', 2, '2019-08-13 21:21:12'),
(9, 6, 'Hi Jopsy, how are you? ', 15, '2019-08-13 23:34:35'),
(10, 5, 'hello', 2, '2019-08-15 22:57:33'),
(11, 7, 'This  is a test ', 1, '2019-08-16 23:19:43'),
(12, 7, 'Thi si another sample', 1, '2019-08-16 23:21:29'),
(13, 7, 'Is it working? ', 1, '2019-08-16 23:25:30'),
(14, 5, 'Haiiiiiiiiiiiiiiiiiiiiii', 1, '2019-08-16 23:25:53'),
(15, 5, 'Test', 2, '2019-08-16 23:28:21'),
(16, 5, 'Sample', 2, '2019-08-16 23:37:09'),
(17, 5, 'Hello Jomit', 1, '2019-08-21 10:12:34'),
(18, 8, 'Hello Jabir', 4, '2019-08-31 22:33:52'),
(19, 8, 'How are you? ', 4, '2019-08-31 22:37:04'),
(20, 8, 'How\'s your health?', 4, '2019-08-31 22:38:08'),
(21, 8, 'Company is going well? ', 4, '2019-08-31 22:39:26'),
(22, 8, 'Ok', 4, '2019-08-31 22:40:40'),
(23, 9, 'Hello', 4, '2019-08-31 22:46:56'),
(24, 9, 'How are you? ', 4, '2019-08-31 22:49:02'),
(25, 10, 'Hi', 4, '2019-08-31 22:53:25'),
(26, 11, 'Hi Sams', 4, '2019-08-31 22:56:01'),
(27, 12, 'Hi', 2, '2019-08-31 23:41:20'),
(28, 13, 'Hi', 3, '2019-09-01 13:54:04'),
(29, 13, 'Hello', 3, '2019-09-01 13:54:10'),
(30, 14, 'Hi', 3, '2019-09-01 13:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `chat_head`
--

CREATE TABLE `chat_head` (
  `id` int(11) NOT NULL,
  `c_by` int(11) NOT NULL,
  `c_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_head`
--

INSERT INTO `chat_head` (`id`, `c_by`, `c_to`) VALUES
(5, 2, 1),
(6, 15, 1),
(7, 1, 21),
(8, 4, 3),
(9, 4, 1),
(10, 4, 2),
(11, 4, 16),
(12, 2, 14),
(13, 3, 2),
(14, 3, 16);

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `id` int(11) NOT NULL,
  `chat_by` int(11) NOT NULL,
  `comment` text NOT NULL,
  `chat_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_room`
--

INSERT INTO `chat_room` (`id`, `chat_by`, `comment`, `chat_on`) VALUES
(1, 3, 'This is a sample Chat Data, What I can do is to help you people at any case of issues when your documents are being passed to different departments.', '2019-08-11 08:00:00'),
(2, 3, 'Any doubts? Pls comment Here', '2019-08-11 14:00:00'),
(3, 2, 'No Doubts so far... Thanks for the help', '2019-08-11 15:28:00'),
(4, 7, 'Acutally I have a doubt. Please tell me how can I make payment here? ', '2019-08-11 00:00:17'),
(5, 2, 'Hello.. I also do have doubts', '2019-08-11 14:34:26'),
(6, 2, 'Shall I ask? ', '2019-08-11 14:36:13'),
(7, 2, 'Yes proceed', '2019-08-11 14:54:37'),
(8, 15, 'test', '2019-08-13 23:32:33'),
(9, 3, 'Hello', '2019-08-15 21:48:45'),
(10, 1, 'sldfjlsld', '2019-08-16 21:34:26'),
(11, 1, 'sdf sdf', '2019-08-16 21:34:29'),
(12, 1, 'as dfsdaf', '2019-08-16 21:34:30'),
(13, 1, 'asd fsdf ', '2019-08-16 21:34:32'),
(14, 1, 'asd fsadfsdaf ewr', '2019-08-16 21:34:34'),
(15, 1, 'asdfasdf asdfweqrf', '2019-08-16 21:34:36'),
(16, 1, 'asdf asdf3ewrwsef wsf', '2019-08-16 21:34:39'),
(17, 1, 'asdlfjlkas dfjlajs lfjsal;dj fla;sjdf asljdf as;djf lasjdfljlasjd fajskdhfhsakdhf sdfa dsf', '2019-08-16 21:35:56'),
(18, 1, 'asdfsdaf', '2019-08-16 22:03:59'),
(19, 1, 'asdf', '2019-08-16 22:04:01'),
(20, 1, 'asdf', '2019-08-16 22:04:03'),
(21, 1, 'asdf', '2019-08-16 22:04:04'),
(22, 1, 'asdf', '2019-08-16 22:04:06'),
(23, 1, 'asdf', '2019-08-16 22:04:07'),
(24, 1, 'asdf', '2019-08-16 22:04:08'),
(25, 2, 'SOmethignslddfn sldfjsldj flsjdf aposdf apsdfj aspd faiposdruwop sdjal; fjs;adj fsdf', '2019-08-16 23:39:21'),
(26, 4, 'sljkwe', '2019-08-17 21:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `cso`
--

CREATE TABLE `cso` (
  `id` int(11) NOT NULL,
  `mc_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cso`
--

INSERT INTO `cso` (`id`, `mc_id`, `email`) VALUES
(1, 3, 'cso.ecospace_phase2@hypertrac.online'),
(2, 3, 'cso.bmp@hypertrac.online');

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
(1, 'OSPAND', 3, 'Sam Jacobson'),
(3, 'NDDC', 2, 'Sony P S'),
(4, 'SHELL', 2, 'Sony P S'),
(5, 'AGIP', 1, 'Sashidhar M'),
(6, 'MTN', 3, 'Sam Jacob'),
(7, 'GLO', 1, 'Sashidhar M'),
(12, 'NNPC', 3, 'Mariya Jameson'),
(14, 'Jameson', 3, 'Mariya Jameson');

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
  `extra_docs` text NOT NULL,
  `invite_by` int(11) NOT NULL DEFAULT '0',
  `for_dept` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invitation`
--

INSERT INTO `invitation` (`app_id`, `status`, `docs_submitted`, `ofc_visited`, `extra_docs_required`, `extra_docs`, `invite_by`, `for_dept`) VALUES
(1, 1, 1, 1, 1, 'Need fresh docs', 0, 0),
(2, 1, 1, 1, 1, '', 0, 0),
(15, 0, 1, 0, 0, 'No extra docs required', 0, 0),
(16, 1, 0, 0, 0, '', 0, 0),
(17, 1, 1, 0, 0, '', 0, 0),
(20, 0, 1, 1, 1, 'Yes it is required', 3, 0),
(34, 1, 0, 0, 1, 'New Docs required', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  `paid_on` datetime NOT NULL,
  `plan` int(11) NOT NULL,
  `amount` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(14, 6, 1, 5, 3),
(22, 5, 2, 1, 4),
(31, 1, 1, 1, 4);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_head`
--
ALTER TABLE `chat_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cso`
--
ALTER TABLE `cso`
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
-- Indexes for table `payments`
--
ALTER TABLE `payments`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `applications_comment`
--
ALTER TABLE `applications_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `applications_img`
--
ALTER TABLE `applications_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `applications_more`
--
ALTER TABLE `applications_more`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `chat_head`
--
ALTER TABLE `chat_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cso`
--
ALTER TABLE `cso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dept_sub`
--
ALTER TABLE `dept_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
