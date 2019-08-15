-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2019 at 07:10 PM
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
(1, 'AE10000', 11, 'Emigration Clearence', '2019-06-19 04:00:00', '15 Days', 0, 2),
(2, 'AE00002', 6, 'Stolen Passport', '2019-06-25 00:19:20', '23 Days', 4, 0),
(15, 'PSQ', 10, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(16, 'Sample Company', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 1, 1),
(17, 'RUCL', 2, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 0, 1),
(18, 'Sample Company', 7, 'ID Proofs', '2019-07-29 03:00:00', '15 Days', 3, 1),
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
(34, 'Welcome company', 4, 'ID Proofs', '2019-08-03 11:14:12', '15 Days', 0, 2),
(35, 'My personal Company', 3, 'ID Proofs', '2019-08-13 23:30:59', '15 Days', 0, 15),
(36, 'My personal Company', 3, 'ID Proofs', '2019-08-13 23:31:32', '15 Days', 0, 15);

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
(21, 1, 4, 'fasfd sd fsad', 3, 2, '2019-08-05 20:46:57', 3),
(22, 17, 2, 'This is something complicated', 1, 1, '2019-08-13 23:21:53', 1),
(23, 18, 7, 'a sdfsadfsa ', 1, 1, '2019-08-13 23:35:49', 1),
(24, 1, 11, 'working or not? ', 3, 2, '2019-08-13 23:40:10', 3);

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
(21, 34, 'Welcome company', 'skdfjh', 30023493, 20034934, 'baljit.singh-bhayana@capgemini.com', 'www.info.com', 2, 'ID Proofs', 1, 1),
(22, 35, 'My personal Company', 'asdf sad fsalkdf lsakdjflks adflsdj flasjdflksjadfjlksa dfhoisd flsdfjklsja lfjlskadjfosdfalskfjsakl jflksja fasfd', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6),
(23, 36, 'My personal Company', 'asdf sad fsalkdf lsakdjflks adflsdj flasjdflksjadfjlksa dfhoisd flsdfjklsja lfjlskadjfosdfalskfjsakl jflksja fasfd', 30023493, 20034934, 'jopsyvarghese@gmail.com', 'www.info.com', 2, 'ID Proofs', 3, 6);

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
  `reset_hash` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `fname`, `addr`, `uname`, `pwd`, `email`, `mob`, `role`, `created_at`, `rc`, `mob2`, `created_by`, `pwd_reset`, `reset_hash`) VALUES
(1, 'jopsy', 'ABC Street, PSR Nagar, UT - 23389', 'jopsy', '79967c73489f12ebd4295049fa22eb89e4fdbb2e3f97da6747969df54b4d59cbdf0c7f5f2b33ef9c23ddfdc5aa2a6013b04abd3ac1e2fedc6c04fa289ded2dab', 'jopsyvarghese2@gmail.com', 7411395002, 1, '2019-06-26 18:21:51', '234100', 0, 0, 0, ''),
(2, 'jomit', 'Personal', 'jomit', '835b3ebafad84afcc1c2e73f9425e3361df1b83683a79f755deb5698ec63cb0078ccb1f9e1bf5607f39e20eea2208ecf150354483b0cb5146fb9700b7876388e', 'jopsyvarghese@gmail.com', 7411180882, 0, '2019-06-26 18:45:10', '253585', 0, 0, 0, ''),
(3, 'Jabir', 'Loby#23, Back Street Boys Road, BBP', 'Jabir', '1f71d9321dd22607901162989db685958781906c28c5d2480022ae29a56e0e19d10058cefa52cedc585a040107394961f0f132ed8ff1d96cc239ef829d092e51', 'jopsyvarghese23@gmail.com', 9995559992, 2, '2019-06-26 18:54:05', '982222', 0, 0, 0, ''),
(4, 'Hypertrac Limited', 'I don\'t need to update my address', 'admin', '6a8eabb9447e2fd817035c282e2275d4fa21f91409dd4726eb071d35e645418192feb3b5f0c60ff836345481bcf3739e3c728e91bd97aa191f92c148be4becae', 'hypertracltd@gmail.com', 9965656565, 3, '2019-06-26 19:31:48', '56DC58', 0, 0, 0, ''),
(5, 'Ajith', 'Kumar', 'ajith', 'Ajith@123', 'ajithkumar@gmail.com', 9876767676, 0, '2019-06-29 22:30:50', '56532E3', 0, 0, 0, ''),
(7, 'labeesh', 'lakshmanan', 'labeesh', 'Labeesh@123', 'labeesh@gmail.com', 9876543211, 0, '2019-07-24 22:00:00', '252522', 0, 0, 0, ''),
(14, 'Sudheesh', 'Kumar', 'sudheesh15300', 'Sudheesh@123', 'jopsyvarghesdfkhsse@gmail.com', 99832948384, 1, '2019-08-04 13:03:30', '0', 0, 0, 0, ''),
(16, 'Sams Infotech', 'sdlfjs dlfjksl dflsdj fsodjfoiw eldsjf lsdjf', 'samsinfo', '6dbcd1a99470d76a0d8bcd978d51040e1c752c054f2100bba2ee0595e9d7e6b03c81645f2245324c2fd9e489a0b8a7312030587c254bad4561a36c7762e54767', 'sandeiii@fm.com', 9384647377, 0, '2019-08-15 20:06:09', '3847234', 0, 0, 0, NULL),
(21, 'Shaji', 'sldfjs ldfjs ldfjsldfl sldjf', 'shaji', '6f9a956a6fb27068c23d1e9d0b04db6701cec6242cf9d3e3c00705b1495a6d1435d3d0926e772b04b8af784ef1ef798eaaac7fd298c238be5961f5e1ec5bbbc5', 'hsaldsfkj@gmilad.com', 2309423, 2, '2019-08-15 21:33:28', '', 0, 4, 0, NULL);

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
(9, 6, 'Hi Jopsy, how are you? ', 15, '2019-08-13 23:34:35');

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
(6, 15, 1);

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
(9, 3, 'Hello', '2019-08-15 21:48:45');

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
(11, 'IDORLA', 3, 'Sudheesh Sasi');

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
(20, 0, 1, 0, 0, ''),
(34, 1, 0, 0, 1, 'New Docs required');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `applications_comment`
--
ALTER TABLE `applications_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `applications_img`
--
ALTER TABLE `applications_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `applications_more`
--
ALTER TABLE `applications_more`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chat_head`
--
ALTER TABLE `chat_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
