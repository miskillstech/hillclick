-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2017 at 09:12 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hillclick`
--

-- --------------------------------------------------------

--
-- Table structure for table `hlck_admin_login`
--

CREATE TABLE `hlck_admin_login` (
  `admin_id` int(11) NOT NULL,
  `admin_user_name` varchar(30) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlck_admin_login`
--

INSERT INTO `hlck_admin_login` (`admin_id`, `admin_user_name`, `admin_password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `hlck_ci_sessions`
--

CREATE TABLE `hlck_ci_sessions` (
  `session_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `last_activity` varchar(255) NOT NULL,
  `user_data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlck_ci_sessions`
--

INSERT INTO `hlck_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
(0, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '1466255079', ''),
(0, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '1467212058', '');

-- --------------------------------------------------------

--
-- Table structure for table `hlck_hotels`
--

CREATE TABLE `hlck_hotels` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `property_type_id` int(11) NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `hotel_country` varchar(255) NOT NULL,
  `hotel_address` text,
  `hotel_description` longtext,
  `hotel_mail_id` varchar(255) NOT NULL,
  `hotel_city` varchar(255) NOT NULL,
  `hotel_location` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `star_rating` int(11) NOT NULL,
  `check_in_time` time NOT NULL,
  `check_out_time` time NOT NULL,
  `hotel_cancellation` text NOT NULL,
  `children_and_extrabeds` text NOT NULL,
  `fine_print` text NOT NULL,
  `hotel_pets` varchar(255) NOT NULL,
  `accepted_cards` varchar(255) NOT NULL,
  `hotel_status` enum('Active','Inactive','Pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hlck_members`
--

CREATE TABLE `hlck_members` (
  `id` int(11) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  `member_email` varchar(255) NOT NULL,
  `member_password` varchar(255) NOT NULL,
  `member_address` varchar(255) NOT NULL,
  `member_address2` text NOT NULL,
  `member_city` varchar(255) NOT NULL,
  `member_state` varchar(255) NOT NULL,
  `member_country` varchar(255) NOT NULL,
  `member_zipcode` varchar(255) NOT NULL,
  `member_phone` varchar(255) NOT NULL,
  `newsletter` int(11) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `login_type` varchar(255) NOT NULL,
  `network_id` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlck_members`
--

INSERT INTO `hlck_members` (`id`, `member_name`, `member_email`, `member_password`, `member_address`, `member_address2`, `member_city`, `member_state`, `member_country`, `member_zipcode`, `member_phone`, `newsletter`, `app_id`, `login_type`, `network_id`, `user_type`, `status`, `date_of_birth`, `date_modified`, `created_at`) VALUES
(1, 'tapas', 'tapas@gmail.com', '97278050f54a4d771e6db8400ffef0a9', 'abc', '', 'Bihar Sharif', '', 'IN', '722101', '9563159481', 0, '', '', '', '', 'Inactive', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(2, 'tapas kumar', 'tapas@webhawkstechnology.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '', 0, '', '', '', '', 'Active', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(15, 'Renu Gupta', 'renuguptashwara@gmail.com', '', '', '', '', '', '', '', '', 0, '969798139771764', 'facebook', '', '', 'Active', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(19, 'adegf', 'renu2354346@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'stfghf', 'srtf', 'Bhopal', '', 'IN', '34534', '234534', 0, '', '', '', '', 'Active', '0000-00-00', '2017-02-05 02:53:24', '2017-02-05 07:13:46'),
(20, 'desa', 'renu123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'adrgd', 'sdfgsd', 'Bhopal', '', 'IN', '5555', '555555', 0, '', '', '', '', 'Active', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(22, 'adg', 'renu1234dfg567@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'adfg', 'adfg', 'Jaipur', '', 'IN', '35', '2345', 0, '', '', '', '', 'Active', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(23, 'fg', 'renu123dfgaSDF4567@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'dtfg', 'ad', 'Bhopal', '', 'IN', '346', '236', 0, '', '', '', '', 'Active', '0000-00-00', '0000-00-00 00:00:00', '2017-02-05 07:13:46'),
(25, 'hfh', 'jgjg@gggg', '', 'vcvg', '', '', '', '', '', '', 0, '', '', '', '', 'Active', '0000-00-00', '2017-02-05 03:06:24', '2017-02-05 07:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `hlck_settings`
--

CREATE TABLE `hlck_settings` (
  `setting_id` int(11) NOT NULL,
  `setting_key` varchar(200) NOT NULL,
  `setting_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlck_settings`
--

INSERT INTO `hlck_settings` (`setting_id`, `setting_key`, `setting_value`, `status`) VALUES
(1, 'admin_email', 'webhawks@gmail.com', 'Active'),
(2, 'facebook', 'https://www.facebook.com/IdealClinicsKSA', 'Active'),
(3, 'google_plus', 'debarpita@webhawkstechnology.com', 'Active'),
(4, 'linked_in', 'https://www.linkedin.com/company/ideal-clinics-jeddah', 'Active'),
(6, 'reply_email', 'INFO@IDEALCLINICS.COM', 'Active'),
(7, 'twitter', 'https://twitter.com/IdealClinic', 'Active'),
(8, 'Fax', '+966-12-6636006', 'Active'),
(12, 'Address', 'IDEAL CLINICS TAHLIA STREET, <br/>AL MANAR CENTER BESIDE FAYFA<br/> P.O.BOX 9121 JEDDAH 21413<br/> K.S.A', 'Inactive'),
(19, 'Email', 'INFO@IDEALCLINICS.COM', 'Active'),
(20, 'Phone', '+966-12-6689999', 'Inactive'),
(24, 'Website', 'idealclinics.com', 'Active'),
(25, 'latlong', ' <iframe width="100%" height="480" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.sa/maps/ms?msid=215080762581044234058.0004bbc06b7a0f31e83fe&amp;msa=0&amp;ie=UTF8&amp;t=m&amp;ll=21.549307,39.145124&amp;spn=0.003143,0.005997&amp;z=17&amp;output=embed"></iframe>', 'Active'),
(26, 'site key', '6LcUSBQTAAAAAD5vhFa9b1hzyOuO0bV0kV327TrB', 'Active'),
(27, 'secret Key', '6LcUSBQTAAAAABWekLV05QSuvLMLplQMxRk6Mb4b', 'Active'),
(28, 'instagram', 'https://www.instagram.com/idealclinics/', 'Active'),
(29, 'Address Arabic', 'IDEAL CLINICS TAHLIA STREET,  AL MANAR CENTER BESIDE FAYFA P.O.BOX 9121 JEDDAH 21413 K.S.A', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hlck_state`
--

CREATE TABLE `hlck_state` (
  `state_id` int(11) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlck_state`
--

INSERT INTO `hlck_state` (`state_id`, `country_id`, `state_name`, `state_code`) VALUES
(3, '1', 'West Bengal', 'WB'),
(4, '2', 'Maharastra', 'MH');

-- --------------------------------------------------------

--
-- Table structure for table `hlclk_city`
--

CREATE TABLE `hlclk_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hlclk_city`
--

INSERT INTO `hlclk_city` (`city_id`, `city_name`, `country_id`, `state_id`) VALUES
(1, 'Kolkata', 1, 3),
(2, 'Mumbai', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hlck_admin_login`
--
ALTER TABLE `hlck_admin_login`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `hlck_hotels`
--
ALTER TABLE `hlck_hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hlck_members`
--
ALTER TABLE `hlck_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hlck_settings`
--
ALTER TABLE `hlck_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `hlck_state`
--
ALTER TABLE `hlck_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `hlclk_city`
--
ALTER TABLE `hlclk_city`
  ADD PRIMARY KEY (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hlck_admin_login`
--
ALTER TABLE `hlck_admin_login`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hlck_hotels`
--
ALTER TABLE `hlck_hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hlck_members`
--
ALTER TABLE `hlck_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `hlck_settings`
--
ALTER TABLE `hlck_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `hlck_state`
--
ALTER TABLE `hlck_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `hlclk_city`
--
ALTER TABLE `hlclk_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
