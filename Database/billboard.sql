-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2017 at 09:47 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertiser`
--

CREATE TABLE `advertiser` (
  `advertiser_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `contact_number` char(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billboard_location`
--

CREATE TABLE `billboard_location` (
  `billboard_location_id` int(11) NOT NULL,
  `address` varchar(10000) NOT NULL,
  `postal_code` int(4) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billboard_location`
--

INSERT INTO `billboard_location` (`billboard_location_id`, `address`, `postal_code`, `latitude`, `longitude`) VALUES
(1, '623 Valencia St. Sampaloc Village Makati City', 1700, 0, 0),
(2, 'Lot 10 Blk 5 Alliage Drive, Pasig City', 1892, 0, 0),
(3, '687 Rainbow St. Westborough Village Paranaque City', 3456, 0, 0),
(4, 'Blk 6 Lot 5 treelane Pasay City', 8754, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cobalt_reporter`
--

CREATE TABLE `cobalt_reporter` (
  `module_name` varchar(255) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `show_field` blob NOT NULL,
  `operator` blob NOT NULL,
  `text_field` blob NOT NULL,
  `sum_field` blob NOT NULL,
  `count_field` blob NOT NULL,
  `group_field1` blob NOT NULL,
  `group_field2` blob NOT NULL,
  `group_field3` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cobalt_sst`
--

CREATE TABLE `cobalt_sst` (
  `auto_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `config_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(10000) NOT NULL,
  `company_mobile_num1` char(11) NOT NULL,
  `company_mobile_num2` char(11) DEFAULT NULL,
  `company_tel_num` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_address`, `company_mobile_num1`, `company_mobile_num2`, `company_tel_num`) VALUES
(1, 'Accenture', 'Makati City', '09123', '0912345', '091234567'),
(2, 'Bench', 'Pasay City', '09263637', '93273626', '8228816'),
(4, 'Goldilocks', 'Pasig City', '87676876', '876876876', '4546'),
(5, 'Penshoppe', 'Paranaque City', '87876', '65765756', '7865');

-- --------------------------------------------------------

--
-- Table structure for table `company_ad`
--

CREATE TABLE `company_ad` (
  `company_ad_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `billboard_loc` int(11) NOT NULL,
  `ad_start_date` date NOT NULL,
  `ad_end_date` date NOT NULL,
  `advertisement_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_ad`
--

INSERT INTO `company_ad` (`company_ad_id`, `company_id`, `billboard_loc`, `ad_start_date`, `ad_end_date`, `advertisement_name`) VALUES
(1, 4, 1, '2017-02-20', '2017-02-28', 'Goldilocks Model');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `middle_name`, `last_name`, `gender`) VALUES
(1, 'Super User', 'X', 'Root', 'Male'),
(3, 'Samantha', 'Ravasco', 'Munar', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_answered_question`
--

CREATE TABLE `player_answered_question` (
  `player_answered_question_id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `points_attained` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question` varchar(10000) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `company_ad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `question`, `answer`, `points`, `time_limit`, `company_ad`) VALUES
(1, 'Who is the model/actress in the given ad?', '', 5, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_answer`
--

CREATE TABLE `question_answer` (
  `question_answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE `question_choices` (
  `question_choices_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `choice_number` int(11) NOT NULL,
  `choice` varchar(255) NOT NULL,
  `is_correct` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `entry_id` bigint(20) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `action` mediumtext NOT NULL,
  `module` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`entry_id`, `ip_address`, `user`, `datetime`, `action`, `module`) VALUES
(1, '::1', 'root', '2017-02-19 23:01:26', 'Logged in', '/ooap/login.php'),
(2, '::1', 'root', '2017-02-19 23:01:26', 'Query Executed: UPDATE user SET `password`=?, `salt`=?, `iteration`=?, `method`=? WHERE username=?\r\nArray\n(\n    [0] => ssiss\n    [1] => $2y$12$utytNn87AM0Lm.D6jKKjwuX7PJ6SCxa4otmaq3.x0T7LFD5y6fF/i\n    [2] => utytNn87AM0Lm+D6jKKjww\n    [3] => 12\n    [4] => blowfish\n    [5] => root\n)\n', '/ooap/login.php'),
(3, '::1', 'root', '2017-02-19 23:16:55', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(4, '::1', 'root', '2017-02-19 23:16:55', 'Query Executed: INSERT INTO billboard_location(billboard_location_id, address, postal_code) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => asd\n    [3] => 1233\n)\n', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(5, '::1', 'root', '2017-02-19 23:17:10', 'Pressed delete button', '/ooap/modules/billboar_location/billboard_location/delete_billboard_location.php'),
(6, '::1', 'root', '2017-02-19 23:17:10', 'Query Executed: DELETE FROM company_ad WHERE billboard_loc = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/billboar_location/billboard_location/delete_billboard_location.php'),
(7, '::1', 'root', '2017-02-19 23:17:10', 'Query Executed: DELETE FROM billboard_location WHERE billboard_location_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 5\n)\n', '/ooap/modules/billboar_location/billboard_location/delete_billboard_location.php'),
(8, '::1', 'root', '2017-02-19 23:19:09', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(9, '::1', 'root', '2017-02-19 23:19:10', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => asd\n    [3] => asd\n    [4] => asddddddddd\n    [5] => a\n    [6] => a\n)\n', '/ooap/modules/company/company/add_company.php'),
(10, '::1', 'root', '2017-02-19 23:19:38', 'Pressed cancel button', '/ooap/modules/company/company/add_company.php'),
(11, '::1', 'root', '2017-02-19 23:19:58', 'Pressed cancel button', '/ooap/modules/player/player_answered_question/add_player_answered_question.php'),
(12, '::1', 'root', '2017-02-19 23:31:34', 'Pressed delete button', '/ooap/modules/company/company/delete_company.php'),
(13, '::1', 'root', '2017-02-19 23:31:34', 'Query Executed: DELETE FROM trivia WHERE company = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/delete_company.php'),
(14, '::1', 'root', '2017-02-19 23:31:34', 'Query Executed: DELETE FROM company_ad WHERE billboard_loc = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/delete_company.php'),
(15, '::1', 'root', '2017-02-19 23:31:34', 'Query Executed: DELETE FROM advertiser WHERE company_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 5\n)\n', '/ooap/modules/company/company/delete_company.php'),
(16, '::1', 'root', '2017-02-19 23:31:35', 'Query Executed: DELETE FROM company WHERE company_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 5\n)\n', '/ooap/modules/company/company/delete_company.php'),
(17, '::1', 'root', '2017-02-19 23:38:57', 'Pressed submit button', '/ooap/sysadmin/add_user_passport_groups.php'),
(18, '::1', 'root', '2017-02-19 23:38:58', 'Query Executed: INSERT INTO user_passport_groups(passport_group_id, passport_group, priority, icon) VALUES(?,?,?,?)\r\nArray\n(\n    [0] => isis\n    [1] => \n    [2] => Advertiser\n    [3] => 4\n    [4] => blue_folder3.png\n)\n', '/ooap/sysadmin/add_user_passport_groups.php'),
(19, '::1', 'root', '2017-02-19 23:39:49', 'Pressed cancel button', '/ooap/sysadmin/edit_user_links.php'),
(20, '::1', 'root', '2017-02-19 23:40:30', 'Pressed cancel button', '/ooap/sysadmin/edit_user_links.php'),
(21, '::1', 'root', '2017-02-19 23:40:42', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(22, '::1', 'root', '2017-02-19 23:40:42', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View question\n    [2] => modules/question/question/listview_question.php\n    [3] => Question\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 63\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(23, '::1', 'root', '2017-02-19 23:41:01', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(24, '::1', 'root', '2017-02-19 23:41:02', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View trivia\n    [2] => modules/trivia/trivia/listview_trivia.php\n    [3] => Trivia\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 67\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(25, '::1', 'root', '2017-02-19 23:41:29', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(26, '::1', 'root', '2017-02-19 23:41:29', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View question\n    [2] => modules/question/question/listview_question.php\n    [3] => Question\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 63\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(27, '::1', 'root', '2017-02-19 23:41:58', 'Pressed cancel button', '/ooap/modules/question/question/listview_question.php'),
(28, '::1', 'root', '2017-02-19 23:42:16', 'Pressed submit button', '/ooap/sysadmin/edit_user_passport_groups.php'),
(29, '::1', 'root', '2017-02-19 23:42:16', 'Query Executed: UPDATE user_passport_groups SET passport_group = ?, priority = ?, icon = ? WHERE passport_group_id = ?\r\nArray\n(\n    [0] => sisi\n    [1] => Default\n    [2] => 3\n    [3] => blue_folder3.png\n    [4] => 1\n)\n', '/ooap/sysadmin/edit_user_passport_groups.php'),
(30, '::1', 'root', '2017-02-19 23:42:21', 'Pressed submit button', '/ooap/sysadmin/edit_user_passport_groups.php'),
(31, '::1', 'root', '2017-02-19 23:42:21', 'Query Executed: UPDATE user_passport_groups SET passport_group = ?, priority = ?, icon = ? WHERE passport_group_id = ?\r\nArray\n(\n    [0] => sisi\n    [1] => Admin\n    [2] => 2\n    [3] => preferences-system.png\n    [4] => 2\n)\n', '/ooap/sysadmin/edit_user_passport_groups.php'),
(32, '::1', 'root', '2017-02-19 23:45:02', 'Pressed submit button', '/ooap/sysadmin/edit_user_passport_groups.php'),
(33, '::1', 'root', '2017-02-19 23:45:02', 'Query Executed: UPDATE user_passport_groups SET passport_group = ?, priority = ?, icon = ? WHERE passport_group_id = ?\r\nArray\n(\n    [0] => sisi\n    [1] => Advertiser\n    [2] => 1\n    [3] => blue_folder3.png\n    [4] => 3\n)\n', '/ooap/sysadmin/edit_user_passport_groups.php'),
(34, '::1', 'root', '2017-02-19 23:46:39', 'Pressed submit button', '/ooap/sysadmin/edit_user_passport_groups.php'),
(35, '::1', 'root', '2017-02-19 23:46:40', 'Query Executed: UPDATE user_passport_groups SET passport_group = ?, priority = ?, icon = ? WHERE passport_group_id = ?\r\nArray\n(\n    [0] => sisi\n    [1] => Advertiser\n    [2] => 4\n    [3] => blue_folder3.png\n    [4] => 3\n)\n', '/ooap/sysadmin/edit_user_passport_groups.php'),
(36, '::1', 'root', '2017-02-19 23:46:42', 'Pressed cancel button', '/ooap/sysadmin/listview_user_passport_groups.php'),
(37, '::1', 'root', '2017-02-19 23:47:22', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(38, '::1', 'root', '2017-02-19 23:47:22', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add question\n    [2] => modules/question/question/add_question.php\n    [3] => Add Question\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 61\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(39, '::1', 'root', '2017-02-19 23:47:30', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(40, '::1', 'root', '2017-02-19 23:47:30', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete question\n    [2] => modules/question/question/delete_question.php\n    [3] => Delete Question\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 64\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(41, '::1', 'root', '2017-02-19 23:47:39', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(42, '::1', 'root', '2017-02-19 23:47:39', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit question\n    [2] => modules/question/question/edit_question.php\n    [3] => Edit Question\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 62\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(43, '::1', 'root', '2017-02-19 23:47:44', 'Pressed cancel button', '/ooap/sysadmin/listview_user_links.php'),
(44, '::1', 'root', '2017-02-19 23:51:07', 'Pressed submit button', '/ooap/sysadmin/add_user_passport_groups.php'),
(45, '::1', 'root', '2017-02-19 23:51:07', 'Query Executed: INSERT INTO user_passport_groups(passport_group_id, passport_group, priority, icon) VALUES(?,?,?,?)\r\nArray\n(\n    [0] => isis\n    [1] => \n    [2] => OAAP\n    [3] => 5\n    [4] => blue_folder3.png\n)\n', '/ooap/sysadmin/add_user_passport_groups.php'),
(46, '::1', 'root', '2017-02-19 23:51:35', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(47, '::1', 'root', '2017-02-19 23:51:35', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add player answered question\n    [2] => modules/player/player_answered_question/add_player_answered_question.php\n    [3] => Add Player Answered Question\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 57\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(48, '::1', 'root', '2017-02-19 23:51:42', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(49, '::1', 'root', '2017-02-19 23:51:42', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit player answered question\n    [2] => modules/player/player_answered_question/edit_player_answered_question.php\n    [3] => Edit Player Answered Question\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 58\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(50, '::1', 'root', '2017-02-19 23:51:50', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(51, '::1', 'root', '2017-02-19 23:51:50', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View player answered question\n    [2] => modules/player/player_answered_question/listview_player_answered_question.php\n    [3] => Player Answered Question\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 59\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(52, '::1', 'root', '2017-02-19 23:51:58', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(53, '::1', 'root', '2017-02-19 23:51:59', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete player answered question\n    [2] => modules/player/player_answered_question/delete_player_answered_question.php\n    [3] => Delete Player Answered Question\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 60\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(54, '::1', 'root', '2017-02-19 23:54:49', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(55, '::1', 'root', '2017-02-19 23:54:49', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View advertiser\n    [2] => modules/advertiser/advertiser/listview_advertiser.php\n    [3] => Advertiser\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 39\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(56, '::1', 'root', '2017-02-19 23:55:25', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(57, '::1', 'root', '2017-02-19 23:55:25', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View billboard location\n    [2] => modules/billboar_location/billboard_location/listview_billboard_location.php\n    [3] => Billboard Location\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 43\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(58, '::1', 'root', '2017-02-19 23:56:24', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(59, '::1', 'root', '2017-02-19 23:56:24', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View company\n    [2] => modules/company/company/listview_company.php\n    [3] => Company\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 47\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(60, '::1', 'root', '2017-02-19 23:57:12', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(61, '::1', 'root', '2017-02-19 23:57:12', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View company ad\n    [2] => modules/company_ad/company_ad/listview_company_ad.php\n    [3] => Company Ad\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 51\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(62, '::1', 'root', '2017-02-19 23:57:29', 'Pressed cancel button', '/ooap/sysadmin/edit_user_links.php'),
(63, '::1', 'root', '2017-02-19 23:57:36', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(64, '::1', 'root', '2017-02-19 23:57:36', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View player\n    [2] => modules/player/player/listview_player.php\n    [3] => Player\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 55\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(65, '::1', 'root', '2017-02-20 00:00:00', 'Pressed submit button', '/ooap/sysadmin/add_user_role.php'),
(66, '::1', 'root', '2017-02-20 00:00:17', 'Pressed submit button', '/ooap/sysadmin/add_user_role.php'),
(67, '::1', 'root', '2017-02-20 00:00:18', 'Query Executed: INSERT INTO user_role(role_id, role, description) VALUES(?,?,?)\r\nArray\n(\n    [0] => iss\n    [1] => \n    [2] => Advertiser\n    [3] => Can Manage advertisements\n)\n', '/ooap/sysadmin/add_user_role.php'),
(68, '::1', 'root', '2017-02-20 00:00:38', 'Query executed: DELETE FROM user_role_links WHERE role_id=''3'' AND link_id IN (''39'',''51'',''61'',''62'',''63'',''64'',''67'')', '/ooap/sysadmin/role_permissions.php'),
(69, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''61'')', '/ooap/sysadmin/role_permissions.php'),
(70, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''39'')', '/ooap/sysadmin/role_permissions.php'),
(71, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''51'')', '/ooap/sysadmin/role_permissions.php'),
(72, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''64'')', '/ooap/sysadmin/role_permissions.php'),
(73, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''62'')', '/ooap/sysadmin/role_permissions.php'),
(74, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''63'')', '/ooap/sysadmin/role_permissions.php'),
(75, '::1', 'root', '2017-02-20 00:00:39', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''67'')', '/ooap/sysadmin/role_permissions.php'),
(76, '::1', 'root', '2017-02-20 00:01:24', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(77, '::1', 'root', '2017-02-20 00:01:24', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add advertiser\n    [2] => modules/advertiser/advertiser/add_advertiser.php\n    [3] => Add Advertiser\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 37\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(78, '::1', 'root', '2017-02-20 00:01:31', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(79, '::1', 'root', '2017-02-20 00:01:31', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit advertiser\n    [2] => modules/advertiser/advertiser/edit_advertiser.php\n    [3] => Edit Advertiser\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 38\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(80, '::1', 'root', '2017-02-20 00:01:37', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(81, '::1', 'root', '2017-02-20 00:01:37', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete advertiser\n    [2] => modules/advertiser/advertiser/delete_advertiser.php\n    [3] => Delete Advertiser\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 40\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(82, '::1', 'root', '2017-02-20 00:02:02', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(83, '::1', 'root', '2017-02-20 00:02:02', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add company\n    [2] => modules/company/company/add_company.php\n    [3] => Add Company\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 45\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(84, '::1', 'root', '2017-02-20 00:02:07', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(85, '::1', 'root', '2017-02-20 00:02:07', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add company ad\n    [2] => modules/company_ad/company_ad/add_company_ad.php\n    [3] => Add Company Ad\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 49\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(86, '::1', 'root', '2017-02-20 00:02:14', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(87, '::1', 'root', '2017-02-20 00:02:14', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit company ad\n    [2] => modules/company_ad/company_ad/edit_company_ad.php\n    [3] => Edit Company Ad\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 50\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(88, '::1', 'root', '2017-02-20 00:02:21', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(89, '::1', 'root', '2017-02-20 00:02:21', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete company ad\n    [2] => modules/company_ad/company_ad/delete_company_ad.php\n    [3] => Delete Company Ad\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 52\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(90, '::1', 'root', '2017-02-20 00:02:51', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(91, '::1', 'root', '2017-02-20 00:02:52', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add trivia\n    [2] => modules/trivia/trivia/add_trivia.php\n    [3] => Add Trivia\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 65\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(92, '::1', 'root', '2017-02-20 00:02:57', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(93, '::1', 'root', '2017-02-20 00:02:57', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit trivia\n    [2] => modules/trivia/trivia/edit_trivia.php\n    [3] => Edit Trivia\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 66\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(94, '::1', 'root', '2017-02-20 00:03:05', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(95, '::1', 'root', '2017-02-20 00:03:05', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete trivia\n    [2] => modules/trivia/trivia/delete_trivia.php\n    [3] => Delete Trivia\n    [4] => \n    [5] => 3\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 68\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(96, '::1', 'root', '2017-02-20 00:04:58', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(97, '::1', 'root', '2017-02-20 00:04:58', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit company\n    [2] => modules/company/company/edit_company.php\n    [3] => Edit Company\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 46\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(98, '::1', 'root', '2017-02-20 00:05:06', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(99, '::1', 'root', '2017-02-20 00:05:06', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Delete company\n    [2] => modules/company/company/delete_company.php\n    [3] => Delete Company\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 48\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(100, '::1', 'root', '2017-02-20 00:05:14', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(101, '::1', 'root', '2017-02-20 00:05:14', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add company\n    [2] => modules/company/company/add_company.php\n    [3] => Add Company\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 45\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(102, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: DELETE FROM user_role_links WHERE role_id=''3'' AND link_id IN (''37'',''38'',''39'',''40'',''49'',''50'',''51'',''52'',''61'',''62'',''63'',''64'',''65'',''66'',''67'',''68'')', '/ooap/sysadmin/role_permissions.php'),
(103, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''37'')', '/ooap/sysadmin/role_permissions.php'),
(104, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''49'')', '/ooap/sysadmin/role_permissions.php'),
(105, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''61'')', '/ooap/sysadmin/role_permissions.php'),
(106, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''65'')', '/ooap/sysadmin/role_permissions.php'),
(107, '::1', 'root', '2017-02-20 00:05:48', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''39'')', '/ooap/sysadmin/role_permissions.php'),
(108, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''51'')', '/ooap/sysadmin/role_permissions.php'),
(109, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''40'')', '/ooap/sysadmin/role_permissions.php'),
(110, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''52'')', '/ooap/sysadmin/role_permissions.php'),
(111, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''64'')', '/ooap/sysadmin/role_permissions.php'),
(112, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''68'')', '/ooap/sysadmin/role_permissions.php'),
(113, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''38'')', '/ooap/sysadmin/role_permissions.php'),
(114, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''50'')', '/ooap/sysadmin/role_permissions.php'),
(115, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''62'')', '/ooap/sysadmin/role_permissions.php'),
(116, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''66'')', '/ooap/sysadmin/role_permissions.php'),
(117, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''63'')', '/ooap/sysadmin/role_permissions.php'),
(118, '::1', 'root', '2017-02-20 00:05:49', 'Query executed: INSERT INTO user_role_links(role_id, link_id) VALUES(''3'', ''67'')', '/ooap/sysadmin/role_permissions.php'),
(119, '::1', 'root', '2017-02-20 00:06:16', 'Pressed submit button', '/ooap/sysadmin/add_person.php'),
(120, '::1', 'root', '2017-02-20 00:06:17', 'Query Executed: INSERT INTO person(person_id, first_name, middle_name, last_name, gender) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => issss\n    [1] => \n    [2] => Samantha\n    [3] => Ravasco\n    [4] => Munar\n    [5] => Female\n)\n', '/ooap/sysadmin/add_person.php'),
(121, '::1', 'root', '2017-02-20 00:06:40', 'Pressed submit button', '/ooap/sysadmin/add_user.php'),
(122, '::1', 'root', '2017-02-20 00:06:40', 'Query Executed: INSERT INTO user(username, password, salt, iteration, method, person_id, role_id, skin_id) VALUES(?,?,?,?,?,?,?,?)\r\nArray\n(\n    [0] => sssisiii\n    [1] => srmunar\n    [2] => $2y$12$vkE3J27zuRc7HOLyfiUVIuP3iBIHwSYMoPI3EpgwnXJ2mW2szcKT6\n    [3] => vkE3J27zuRc7HOLyfiUVIw\n    [4] => 12\n    [5] => blowfish\n    [6] => 2\n    [7] => 3\n    [8] => 4\n)\n', '/ooap/sysadmin/add_user.php'),
(123, '::1', 'root', '2017-02-20 00:06:41', 'Query executed: INSERT `user_passport` SELECT ''srmunar'', `link_id` FROM user_role_links WHERE role_id=''3''', '/ooap/sysadmin/add_user.php'),
(124, '::1', 'root', '2017-02-20 00:06:44', 'Logged out', '/ooap/end.php'),
(125, '::1', 'srmunar', '2017-02-20 00:06:50', 'Logged in', '/ooap/login.php'),
(126, '::1', 'srmunar', '2017-02-20 00:07:12', 'Logged out', '/ooap/end.php'),
(127, '::1', 'root', '2017-02-20 00:07:27', 'Logged in', '/ooap/login.php'),
(128, '::1', 'root', '2017-02-20 00:08:16', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(129, '::1', 'root', '2017-02-20 00:08:16', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Add billboard location\n    [2] => modules/billboar_location/billboard_location/add_billboard_location.php\n    [3] => Add Billboard Location\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 41\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(130, '::1', 'root', '2017-02-20 00:08:22', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(131, '::1', 'root', '2017-02-20 00:08:22', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => Edit billboard location\n    [2] => modules/billboar_location/billboard_location/edit_billboard_location.php\n    [3] => Edit Billboard Location\n    [4] => \n    [5] => 4\n    [6] => No\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 42\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(132, '::1', 'root', '2017-02-20 13:22:02', 'Logged in', '/ooap/login.php'),
(133, '::1', 'root', '2017-02-20 13:22:56', 'Logged out', '/ooap/end.php'),
(134, '::1', 'srmunar', '2017-02-20 13:24:08', 'Logged in', '/ooap/login.php'),
(135, '::1', 'srmunar', '2017-02-20 13:24:13', 'Logged out', '/ooap/end.php'),
(136, '::1', 'root', '2017-02-20 13:24:22', 'Logged in', '/ooap/login.php'),
(137, '::1', 'root', '2017-02-20 13:39:12', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(138, '::1', 'root', '2017-02-20 13:39:12', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Accenture\n    [3] => Makati City\n    [4] => 09123\n    [5] => 0912345\n    [6] => 091234567\n)\n', '/ooap/modules/company/company/add_company.php'),
(139, '::1', 'root', '2017-02-20 13:40:38', 'Logged out', '/ooap/end.php'),
(140, '::1', 'root', '2017-02-20 13:40:42', 'Logged in', '/ooap/login.php'),
(141, '::1', 'root', '2017-02-20 14:49:19', 'Logged out', '/ooap/end.php'),
(142, '::1', 'srmunar', '2017-02-20 14:49:55', 'Logged in', '/ooap/login.php'),
(143, '::1', 'srmunar', '2017-02-20 14:50:13', 'Logged out', '/ooap/end.php'),
(144, '::1', 'root', '2017-02-20 14:50:17', 'Logged in', '/ooap/login.php'),
(145, '::1', 'root', '2017-02-20 14:53:57', 'Query executed: UPDATE user SET skin_id=''2'' WHERE username=''root''', '/ooap/change_skin.php'),
(146, '::1', 'root', '2017-02-20 14:53:59', 'Query executed: UPDATE user SET skin_id=''5'' WHERE username=''root''', '/ooap/change_skin.php'),
(147, '::1', 'root', '2017-02-20 14:54:10', 'Query executed: UPDATE user SET skin_id=''4'' WHERE username=''root''', '/ooap/change_skin.php'),
(148, '::1', 'root', '2017-02-20 14:54:13', 'Query executed: UPDATE user SET skin_id=''11'' WHERE username=''root''', '/ooap/change_skin.php'),
(149, '::1', 'root', '2017-02-20 15:01:04', 'Query executed: UPDATE user SET skin_id=''6'' WHERE username=''root''', '/ooap/change_skin.php'),
(150, '::1', 'root', '2017-02-20 15:01:25', 'Query executed: UPDATE user SET skin_id=''1'' WHERE username=''root''', '/ooap/change_skin.php'),
(151, '::1', 'root', '2017-02-20 15:01:30', 'Query executed: UPDATE user SET skin_id=''5'' WHERE username=''root''', '/ooap/change_skin.php'),
(152, '::1', 'root', '2017-02-20 15:01:34', 'Query executed: UPDATE user SET skin_id=''8'' WHERE username=''root''', '/ooap/change_skin.php'),
(153, '::1', 'root', '2017-02-20 15:01:37', 'Query executed: UPDATE user SET skin_id=''12'' WHERE username=''root''', '/ooap/change_skin.php'),
(154, '::1', 'root', '2017-02-20 15:01:39', 'Query executed: UPDATE user SET skin_id=''6'' WHERE username=''root''', '/ooap/change_skin.php'),
(155, '::1', 'root', '2017-02-20 15:02:29', 'Logged out', '/ooap/end.php'),
(156, '::1', 'srmunar', '2017-02-20 15:02:36', 'Logged in', '/ooap/login.php'),
(157, '::1', 'srmunar', '2017-02-20 15:02:58', 'Pressed cancel button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(158, '::1', 'srmunar', '2017-02-20 15:03:10', 'Pressed submit button', '/ooap/modules/trivia/trivia/add_trivia.php'),
(159, '::1', 'srmunar', '2017-02-20 15:03:10', 'Query Executed: INSERT INTO trivia(trivia_id, trivia, company) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => what is your name?\n    [3] => 1\n)\n', '/ooap/modules/trivia/trivia/add_trivia.php'),
(160, '::1', 'srmunar', '2017-02-20 15:03:29', 'Logged out', '/ooap/end.php'),
(161, '::1', 'root', '2017-02-20 15:03:43', 'Logged in', '/ooap/login.php'),
(162, '::1', 'root', '2017-02-20 15:03:51', 'Logged out', '/ooap/end.php'),
(163, '::1', 'root', '2017-02-20 15:15:02', 'Logged in', '/ooap/login.php'),
(164, '::1', 'root', '2017-02-20 15:18:34', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(165, '::1', 'root', '2017-02-20 15:18:34', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Bench\n    [3] => Makati City\n    [4] => 09263637\n    [5] => 93273626\n    [6] => 8228816\n)\n', '/ooap/modules/company/company/add_company.php'),
(166, '::1', 'root', '2017-02-20 15:18:57', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(167, '::1', 'root', '2017-02-20 15:18:57', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Accenture\n    [3] => Makati City\n    [4] => 163\n    [5] => 76238\n    [6] => 67234\n)\n', '/ooap/modules/company/company/add_company.php'),
(168, '::1', 'root', '2017-02-20 15:19:20', 'Pressed delete button', '/ooap/modules/company/company/delete_company.php'),
(169, '::1', 'root', '2017-02-20 15:19:20', 'Query Executed: DELETE FROM trivia WHERE company = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/delete_company.php'),
(170, '::1', 'root', '2017-02-20 15:19:20', 'Query Executed: DELETE FROM company_ad WHERE billboard_loc = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/delete_company.php'),
(171, '::1', 'root', '2017-02-20 15:19:20', 'Query Executed: DELETE FROM advertiser WHERE company_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 3\n)\n', '/ooap/modules/company/company/delete_company.php'),
(172, '::1', 'root', '2017-02-20 15:19:20', 'Query Executed: DELETE FROM company WHERE company_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 3\n)\n', '/ooap/modules/company/company/delete_company.php'),
(173, '::1', 'root', '2017-02-20 15:19:39', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(174, '::1', 'root', '2017-02-20 15:19:39', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Goldilocks\n    [3] => Pasig City\n    [4] => 87676876\n    [5] => 876876876\n    [6] => 4546\n)\n', '/ooap/modules/company/company/add_company.php'),
(175, '::1', 'root', '2017-02-20 15:20:03', 'Pressed submit button', '/ooap/modules/company/company/add_company.php'),
(176, '::1', 'root', '2017-02-20 15:20:03', 'Query Executed: INSERT INTO company(company_id, company_name, company_address, company_mobile_num1, company_mobile_num2, company_tel_num) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => isssss\n    [1] => \n    [2] => Penshoppe\n    [3] => Paranaque City\n    [4] => 87876\n    [5] => 65765756\n    [6] => 7865\n)\n', '/ooap/modules/company/company/add_company.php'),
(177, '::1', 'root', '2017-02-20 15:20:09', 'Pressed cancel button', '/ooap/modules/company/company/add_company.php'),
(178, '::1', 'root', '2017-02-20 15:20:15', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(179, '::1', 'root', '2017-02-20 15:21:30', 'Logged out', '/ooap/end.php'),
(180, '::1', 'srmunar', '2017-02-20 15:21:38', 'Logged in', '/ooap/login.php'),
(181, '::1', 'srmunar', '2017-02-20 15:22:10', 'Logged out', '/ooap/end.php'),
(182, '::1', 'root', '2017-02-20 15:22:15', 'Logged in', '/ooap/login.php'),
(183, '::1', 'root', '2017-02-20 15:22:51', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(184, '::1', 'root', '2017-02-20 15:22:51', 'Query Executed: INSERT INTO billboard_location(billboard_location_id, address, postal_code) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => 623 Valencia St. Sampaloc Village Makati City\n    [3] => 1700\n)\n', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(185, '::1', 'root', '2017-02-20 15:22:53', 'Logged out', '/ooap/end.php'),
(186, '::1', 'srmunar', '2017-02-20 15:22:59', 'Logged in', '/ooap/login.php'),
(187, '::1', 'srmunar', '2017-02-20 15:23:03', 'Pressed cancel button', '/ooap/modules/advertiser/advertiser/listview_advertiser.php'),
(188, '::1', 'srmunar', '2017-02-20 15:23:19', 'Logged out', '/ooap/end.php'),
(189, '::1', 'root', '2017-02-20 15:23:25', 'Logged in', '/ooap/login.php'),
(190, '::1', 'root', '2017-02-20 15:24:04', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(191, '::1', 'root', '2017-02-20 15:24:04', 'Query Executed: INSERT INTO billboard_location(billboard_location_id, address, postal_code) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => Lot 10 Blk 5 Alliage Drive, Pasig City\n    [3] => 1892\n)\n', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(192, '::1', 'root', '2017-02-20 15:24:21', 'Pressed submit button', '/ooap/modules/company/company/edit_company.php'),
(193, '::1', 'root', '2017-02-20 15:24:21', 'Query Executed: DELETE FROM trivia WHERE company = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/edit_company.php'),
(194, '::1', 'root', '2017-02-20 15:24:21', 'Query Executed: DELETE FROM company_ad WHERE billboard_loc = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/company/company/edit_company.php'),
(195, '::1', 'root', '2017-02-20 15:24:21', 'Query Executed: DELETE FROM advertiser WHERE company_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 2\n)\n', '/ooap/modules/company/company/edit_company.php'),
(196, '::1', 'root', '2017-02-20 15:24:21', 'Query Executed: UPDATE company SET company_name = ?, company_address = ?, company_mobile_num1 = ?, company_mobile_num2 = ?, company_tel_num = ? WHERE company_id = ?\r\nArray\n(\n    [0] => sssssi\n    [1] => Bench\n    [2] => Pasay City\n    [3] => 09263637\n    [4] => 93273626\n    [5] => 8228816\n    [6] => 2\n)\n', '/ooap/modules/company/company/edit_company.php'),
(197, '::1', 'root', '2017-02-20 15:24:32', 'Pressed cancel button', '/ooap/modules/company/company/edit_company.php'),
(198, '::1', 'root', '2017-02-20 15:24:55', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(199, '::1', 'root', '2017-02-20 15:25:20', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(200, '::1', 'root', '2017-02-20 15:25:54', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(201, '::1', 'root', '2017-02-20 15:25:54', 'Query Executed: INSERT INTO billboard_location(billboard_location_id, address, postal_code) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => 687 Rainbow St. Westborough Village Paranaque City\n    [3] => 3456\n)\n', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(202, '::1', 'root', '2017-02-20 15:25:59', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/listview_billboard_location.php'),
(203, '::1', 'root', '2017-02-20 15:26:02', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/listview_billboard_location.php'),
(204, '::1', 'root', '2017-02-20 15:26:06', 'Pressed cancel button', '/ooap/modules/company/company/listview_company.php'),
(205, '::1', 'root', '2017-02-20 15:26:49', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(206, '::1', 'root', '2017-02-20 15:26:49', 'Query Executed: INSERT INTO billboard_location(billboard_location_id, address, postal_code) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => Blk 6 Lot 5 treelane Pasig City\n    [3] => 8754\n)\n', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(207, '::1', 'root', '2017-02-20 15:26:58', 'Pressed submit button', '/ooap/modules/billboar_location/billboard_location/edit_billboard_location.php'),
(208, '::1', 'root', '2017-02-20 15:26:58', 'Query Executed: DELETE FROM company_ad WHERE billboard_loc = ?\r\nArray\n(\n    [0] => i\n    [1] => \n)\n', '/ooap/modules/billboar_location/billboard_location/edit_billboard_location.php'),
(209, '::1', 'root', '2017-02-20 15:26:58', 'Query Executed: UPDATE billboard_location SET address = ?, postal_code = ? WHERE billboard_location_id = ?\r\nArray\n(\n    [0] => sii\n    [1] => Blk 6 Lot 5 treelane Pasay City\n    [2] => 8754\n    [3] => 4\n)\n', '/ooap/modules/billboar_location/billboard_location/edit_billboard_location.php'),
(210, '::1', 'root', '2017-02-20 15:27:17', 'Logged out', '/ooap/end.php'),
(211, '::1', 'srmunar', '2017-02-20 15:27:23', 'Logged in', '/ooap/login.php'),
(212, '::1', 'srmunar', '2017-02-20 15:27:31', 'Pressed cancel button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(213, '::1', 'srmunar', '2017-02-20 15:27:32', 'Pressed cancel button', '/ooap/modules/advertiser/advertiser/listview_advertiser.php'),
(214, '::1', 'srmunar', '2017-02-20 15:27:39', 'Pressed cancel button', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(215, '::1', 'srmunar', '2017-02-20 15:27:41', 'Logged out', '/ooap/end.php'),
(216, '::1', 'root', '2017-02-20 15:31:09', 'Logged in', '/ooap/login.php'),
(217, '::1', 'root', '2017-02-20 15:42:27', 'Pressed cancel button', '/ooap/modules/player/player_answered_question/add_player_answered_question.php'),
(218, '::1', 'root', '2017-02-20 15:42:44', 'Pressed cancel button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(219, '::1', 'root', '2017-02-20 15:43:06', 'Pressed cancel button', '/ooap/modules/trivia/trivia/add_trivia.php'),
(220, '::1', 'root', '2017-02-20 15:52:48', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(221, '::1', 'root', '2017-02-20 15:52:48', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View billboard location\n    [2] => modules/billboar_location/billboard_location/listview_billboard_location.php\n    [3] => Billboard Location wahh\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 43\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(222, '::1', 'root', '2017-02-20 15:53:09', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(223, '::1', 'root', '2017-02-20 15:53:09', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View billboard location\n    [2] => modules/billboar_location/billboard_location/listview_billboard_location.php\n    [3] => Billboard Location\n    [4] => \n    [5] => 4\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 43\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(224, '::1', 'root', '2017-02-20 15:54:53', 'Pressed submit button', '/ooap/sysadmin/edit_user_links.php'),
(225, '::1', 'root', '2017-02-20 15:54:53', 'Query Executed: UPDATE user_links SET name = ?, target = ?, descriptive_title = ?, description = ?, passport_group_id = ?, show_in_tasklist = ?, status = ?, icon = ?, priority = ? WHERE link_id = ?\r\nArray\n(\n    [0] => ssssisssii\n    [1] => View company ad\n    [2] => modules/company_ad/company_ad/listview_company_ad.php\n    [3] => Company Advertisement\n    [4] => \n    [5] => 3\n    [6] => Yes\n    [7] => On\n    [8] => form3.png\n    [9] => 0\n    [10] => 51\n)\n', '/ooap/sysadmin/edit_user_links.php'),
(226, '::1', 'root', '2017-02-20 16:30:17', 'Pressed cancel button', '/ooap/modules/player/player_answered_question/add_player_answered_question.php'),
(227, '::1', 'root', '2017-02-20 16:30:35', 'Pressed cancel button', '/ooap/modules/question/question/add_question.php'),
(228, '::1', 'root', '2017-02-20 16:30:36', 'Pressed cancel button', '/ooap/modules/question/question/listview_question.php'),
(229, '::1', 'root', '2017-02-20 16:33:57', 'Pressed submit button', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(230, '::1', 'root', '2017-02-20 16:34:19', 'Pressed submit button', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(231, '::1', 'root', '2017-02-20 16:36:08', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(232, '::1', 'root', '2017-02-20 16:37:31', 'Pressed submit button', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(233, '::1', 'root', '2017-02-20 16:37:31', 'Query Executed: INSERT INTO company_ad(company_ad_id, company_id, billboard_loc, ad_start_date, ad_end_date, advertisement_name) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => iiisss\n    [1] => \n    [2] => 4\n    [3] => 1\n    [4] => 2017-02-20\n    [5] => 2017-02-28\n    [6] => Goldilocks Model\n)\n', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(234, '::1', 'root', '2017-02-20 16:37:32', 'Query Executed: INSERT INTO question(question_id, question, points, time_limit, company_ad) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => isiii\n    [1] => \n    [2] => Who is the model/actress in the given ad?\n    [3] => 5\n    [4] => 20\n    [5] => 1\n)\n', '/ooap/modules/company_ad/company_ad/add_company_ad.php'),
(235, '::1', 'root', '2017-02-20 16:38:03', 'Pressed cancel button', '/ooap/modules/trivia/trivia/edit_trivia.php');
INSERT INTO `system_log` (`entry_id`, `ip_address`, `user`, `datetime`, `action`, `module`) VALUES
(236, '::1', 'root', '2017-02-20 16:38:05', 'Pressed delete button', '/ooap/modules/trivia/trivia/delete_trivia.php'),
(237, '::1', 'root', '2017-02-20 16:38:06', 'Query Executed: DELETE FROM trivia WHERE trivia_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 1\n)\n', '/ooap/modules/trivia/trivia/delete_trivia.php'),
(238, '::1', 'root', '2017-02-20 16:38:31', 'Pressed submit button', '/ooap/modules/player/player/add_player.php'),
(239, '::1', 'root', '2017-02-20 16:38:31', 'Query Executed: INSERT INTO player(player_id, person_id, email, gender) VALUES(?,?,?,?)\r\nArray\n(\n    [0] => iiss\n    [1] => \n    [2] => 2\n    [3] => srmunar@gmail.com\n    [4] => Female\n)\n', '/ooap/modules/player/player/add_player.php'),
(240, '::1', 'root', '2017-02-20 16:38:31', 'Query Executed: INSERT INTO player_answered_question(player_answered_question_id, question, player_id) VALUES(?,?,?)\r\nArray\n(\n    [0] => iii\n    [1] => \n    [2] => 1\n    [3] => 1\n)\n', '/ooap/modules/player/player/add_player.php'),
(241, '::1', 'root', '2017-02-20 16:38:56', 'Pressed submit button', '/ooap/modules/player/player_answered_question/edit_player_answered_question.php'),
(242, '::1', 'root', '2017-02-20 16:38:56', 'Query Executed: UPDATE player_answered_question SET question = ?, player_id = ? WHERE player_answered_question_id = ?\r\nArray\n(\n    [0] => iii\n    [1] => 1\n    [2] => 1\n    [3] => 1\n)\n', '/ooap/modules/player/player_answered_question/edit_player_answered_question.php'),
(243, '::1', 'root', '2017-02-20 16:54:35', 'Logged out', '/ooap/end.php'),
(244, '::1', 'srmunar', '2017-02-20 16:54:48', 'Logged in', '/ooap/login.php'),
(245, '::1', 'srmunar', '2017-02-20 16:55:14', 'Pressed submit button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(246, '::1', 'srmunar', '2017-02-20 16:55:26', 'Pressed submit button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(247, '::1', 'srmunar', '2017-02-20 16:55:26', 'Query Executed: INSERT INTO advertiser(advertiser_id, person_id, company_id, contact_number, email) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => iiiss\n    [1] => \n    [2] => 123\n    [3] => 4\n    [4] => 09276152866\n    [5] => dsufhiu\n)\n', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(248, '::1', 'srmunar', '2017-02-20 16:56:33', 'Pressed delete button', '/ooap/modules/advertiser/advertiser/delete_advertiser.php'),
(249, '::1', 'srmunar', '2017-02-20 16:56:33', 'Query Executed: DELETE FROM advertiser WHERE advertiser_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 1\n)\n', '/ooap/modules/advertiser/advertiser/delete_advertiser.php'),
(250, '::1', 'srmunar', '2017-02-20 16:56:43', 'Logged out', '/ooap/end.php'),
(251, '::1', 'root', '2017-02-20 17:10:59', 'Logged in', '/ooap/login.php'),
(252, '::1', 'root', '2017-02-22 21:27:24', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(253, '::1', 'root', '2017-02-22 21:42:44', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(254, '::1', 'root', '2017-02-22 21:42:54', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(255, '::1', 'root', '2017-02-22 21:44:12', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(256, '::1', 'root', '2017-02-22 21:44:12', 'Query Executed: INSERT INTO question(question_id, question, points, time_limit, company_ad) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => isiii\n    [1] => \n    [2] => asd\n    [3] => 123\n    [4] => 123\n    [5] => 1\n)\n', '/ooap/modules/question/question/add_question.php'),
(257, '::1', 'root', '2017-02-22 21:44:38', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(258, '::1', 'root', '2017-02-22 21:44:39', 'Query Executed: INSERT INTO question(question_id, question, points, time_limit, company_ad) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => isiii\n    [1] => \n    [2] => asd\n    [3] => 123\n    [4] => 123\n    [5] => 1\n)\n', '/ooap/modules/question/question/add_question.php'),
(259, '::1', 'root', '2017-02-22 21:55:21', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(260, '::1', 'root', '2017-02-22 21:55:22', 'Query Executed: INSERT INTO question(question_id, question, answer, points, time_limit, company_ad) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => issiii\n    [1] => \n    [2] => asddd\n    [3] => asddd\n    [4] => 1233\n    [5] => 1233\n    [6] => 1\n)\n', '/ooap/modules/question/question/add_question.php'),
(261, '::1', 'root', '2017-02-22 21:57:37', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(262, '::1', 'root', '2017-02-22 21:57:53', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(263, '::1', 'root', '2017-02-22 21:58:00', 'Pressed submit button', '/ooap/modules/question/question/add_question.php'),
(264, '::1', 'root', '2017-02-22 21:58:00', 'Query Executed: INSERT INTO question(question_id, question, answer, points, time_limit, company_ad) VALUES(?,?,?,?,?,?)\r\nArray\n(\n    [0] => issiii\n    [1] => \n    [2] => sadddd\n    [3] => asdd\n    [4] => 1233\n    [5] => 12333\n    [6] => 1\n)\n', '/ooap/modules/question/question/add_question.php'),
(265, '::1', 'root', '2017-02-22 21:58:21', 'Pressed delete button', '/ooap/modules/question/question/delete_question.php'),
(266, '::1', 'root', '2017-02-22 21:58:21', 'Query Executed: DELETE FROM question WHERE question_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 2\n)\n', '/ooap/modules/question/question/delete_question.php'),
(267, '::1', 'root', '2017-02-22 21:58:24', 'Pressed delete button', '/ooap/modules/question/question/delete_question.php'),
(268, '::1', 'root', '2017-02-22 21:58:24', 'Query Executed: DELETE FROM question WHERE question_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 3\n)\n', '/ooap/modules/question/question/delete_question.php'),
(269, '::1', 'root', '2017-02-22 21:58:27', 'Pressed delete button', '/ooap/modules/question/question/delete_question.php'),
(270, '::1', 'root', '2017-02-22 21:58:28', 'Query Executed: DELETE FROM question WHERE question_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 4\n)\n', '/ooap/modules/question/question/delete_question.php'),
(271, '::1', 'root', '2017-02-22 21:58:31', 'Pressed delete button', '/ooap/modules/question/question/delete_question.php'),
(272, '::1', 'root', '2017-02-22 21:58:31', 'Query Executed: DELETE FROM question WHERE question_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 5\n)\n', '/ooap/modules/question/question/delete_question.php'),
(273, '::1', 'root', '2017-02-22 22:02:16', 'Pressed submit button', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(274, '::1', 'root', '2017-02-22 22:02:16', 'Query Executed: INSERT INTO advertiser(advertiser_id, person_id, company_id, contact_number, email) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => iiiss\n    [1] => \n    [2] => 123\n    [3] => 1\n    [4] => 12222222222\n    [5] => dasdasd\n)\n', '/ooap/modules/advertiser/advertiser/add_advertiser.php'),
(275, '::1', 'root', '2017-02-22 22:13:38', 'Pressed submit button', '/ooap/sysadmin/add_person.php'),
(276, '::1', 'root', '2017-02-22 22:13:38', 'Query Executed: INSERT INTO person(person_id, first_name, middle_name, last_name, gender) VALUES(?,?,?,?,?)\r\nArray\n(\n    [0] => issss\n    [1] => \n    [2] => Samantha\n    [3] => Ravasco\n    [4] => Munar\n    [5] => Female\n)\n', '/ooap/sysadmin/add_person.php'),
(277, '::1', 'root', '2017-02-22 22:30:19', 'Pressed delete button', '/ooap/sysadmin/delete_user.php'),
(278, '::1', 'root', '2017-02-22 22:30:19', 'Query Executed: DELETE FROM user WHERE username = ?\r\nArray\n(\n    [0] => s\n    [1] => srmunar\n)\n', '/ooap/sysadmin/delete_user.php'),
(279, '::1', 'root', '2017-02-22 22:30:44', 'Pressed delete button', '/ooap/modules/advertiser/advertiser/delete_advertiser.php'),
(280, '::1', 'root', '2017-02-22 22:30:44', 'Query Executed: DELETE FROM advertiser WHERE advertiser_id = ?\r\nArray\n(\n    [0] => i\n    [1] => 2\n)\n', '/ooap/modules/advertiser/advertiser/delete_advertiser.php'),
(281, '::1', 'root', '2017-02-22 22:51:05', 'Logged out', '/ooap/end.php'),
(282, '::1', 'root', '2017-02-23 11:40:02', 'Logged in', '/ooap/login.php'),
(283, '::1', 'root', '2017-02-23 15:36:38', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/add_billboard_location.php'),
(284, '::1', 'root', '2017-02-23 15:36:41', 'Pressed cancel button', '/ooap/modules/billboar_location/billboard_location/listview_billboard_location.php'),
(285, '::1', 'root', '2017-02-23 15:36:44', 'Pressed cancel button', '/ooap/modules/company/company/add_company.php'),
(286, '::1', 'root', '2017-02-23 15:37:10', 'Pressed submit button', '/ooap/modules/trivia/trivia/add_trivia.php'),
(287, '::1', 'root', '2017-02-23 15:37:11', 'Query Executed: INSERT INTO trivia(trivia_id, trivia, company) VALUES(?,?,?)\r\nArray\n(\n    [0] => isi\n    [1] => \n    [2] => Suot na brief ni Neil ay Bench\n    [3] => 2\n)\n', '/ooap/modules/trivia/trivia/add_trivia.php'),
(288, '::1', 'root', '2017-02-23 15:38:41', 'Pressed submit button', '/ooap/modules/trivia/trivia/edit_trivia.php'),
(289, '::1', 'root', '2017-02-23 15:38:41', 'Query Executed: UPDATE trivia SET trivia = ?, company = ? WHERE trivia_id = ?\r\nArray\n(\n    [0] => sii\n    [1] => Bench started 1987 with small store selling men''s t-shirts.\n    [2] => 2\n    [3] => 1\n)\n', '/ooap/modules/trivia/trivia/edit_trivia.php'),
(290, '::1', 'root', '2017-02-25 14:33:56', 'Logged in', '/ooap/login.php'),
(291, '::1', 'root', '2017-02-25 14:34:22', 'Logged out', '/ooap/end.php'),
(292, '::1', 'root', '2017-02-26 00:27:35', 'Logged in', '/ooap/login.php'),
(293, '::1', 'root', '2017-03-06 16:31:16', 'Logged in', '/ooap/login.php');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `setting` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`setting`, `value`) VALUES
('Max Attachment Height', '0'),
('Max Attachment Size (MB)', '0'),
('Max Attachment Width', '0'),
('Security Level', 'HIGH');

-- --------------------------------------------------------

--
-- Table structure for table `system_skins`
--

CREATE TABLE `system_skins` (
  `skin_id` int(11) NOT NULL,
  `skin_name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `master_css` varchar(255) NOT NULL,
  `colors_css` varchar(255) NOT NULL,
  `fonts_css` varchar(255) NOT NULL,
  `override_css` varchar(255) NOT NULL,
  `icon_set` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_skins`
--

INSERT INTO `system_skins` (`skin_id`, `skin_name`, `header`, `footer`, `master_css`, `colors_css`, `fonts_css`, `override_css`, `icon_set`) VALUES
(1, 'Cobalt Default', 'skins/default_header.php', 'skins/default_footer.php', 'cobalt_master.css', 'cobalt_colors.css', 'cobalt_fonts.css', 'cobalt_override.css', 'cobalt'),
(2, 'Cobalt Minimal', 'skins/minimal_header.php', 'skins/minimal_footer.php', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt_minimal.css', 'cobalt'),
(3, 'After Sunset', 'skins/default_header.php', 'skins/default_footer.php', 'after_sunset_master.css', 'after_sunset_colors.css', 'after_sunset_fonts.css', 'after_sunset_override.css', 'cobalt'),
(4, 'Hello There', 'skins/default_header.php', 'skins/default_footer.php', 'hello_there_master.css', 'hello_there_colors.css', 'hello_there_fonts.css', 'hello_there_override.css', 'cobalt'),
(5, 'Gold Titanium', 'skins/default_header.php', 'skins/default_footer.php', 'gold_titanium_master.css', 'gold_titanium_colors.css', 'gold_titanium_fonts.css', 'gold_titanium_override.css', 'cobalt'),
(6, 'Summer Rain', 'skins/default_header.php', 'skins/default_footer.php', 'summer_rain_master.css', 'summer_rain_colors.css', 'summer_rain_fonts.css', 'summer_rain_override.css', 'cobalt'),
(7, 'Salmon Impression', 'skins/default_header.php', 'skins/default_footer.php', 'salmon_impression_master.css', 'salmon_impression_colors.css', 'salmon_impression_fonts.css', 'salmon_impression_override.css', 'cobalt'),
(8, 'Royal Amethyst', 'skins/default_header.php', 'skins/default_footer.php', 'royal_amethyst_master.css', 'royal_amethyst_colors.css', 'royal_amethyst_fonts.css', 'royal_amethyst_override.css', 'cobalt'),
(9, 'Red Decadence', 'skins/default_header.php', 'skins/default_footer.php', 'red_decadence_master.css', 'red_decadence_colors.css', 'red_decadence_fonts.css', 'red_decadence_override.css', 'cobalt'),
(10, 'Modern Eden', 'skins/default_header.php', 'skins/default_footer.php', 'modern_eden_master.css', 'modern_eden_colors.css', 'modern_eden_fonts.css', 'modern_eden_override.css', 'cobalt'),
(11, 'Warm Teal', 'skins/default_header.php', 'skins/default_footer.php', 'warm_teal_master.css', 'warm_teal_colors.css', 'warm_teal_fonts.css', 'warm_teal_override.css', 'cobalt'),
(12, 'Purple Rain', 'skins/default_header.php', 'skins/default_footer.php', 'purple_rain_master.css', 'purple_rain_colors.css', 'purple_rain_fonts.css', 'purple_rain_override.css', 'cobalt');

-- --------------------------------------------------------

--
-- Table structure for table `trivia`
--

CREATE TABLE `trivia` (
  `trivia_id` int(11) NOT NULL,
  `trivia` varchar(10000) NOT NULL,
  `company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trivia`
--

INSERT INTO `trivia` (`trivia_id`, `trivia`, `company`) VALUES
(1, 'Bench started 1987 with small store selling men''s t-shirts.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `iteration` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `salt`, `iteration`, `method`, `person_id`, `role_id`, `skin_id`) VALUES
('root', '$2y$12$utytNn87AM0Lm.D6jKKjwuX7PJ6SCxa4otmaq3.x0T7LFD5y6fF/i', 'utytNn87AM0Lm+D6jKKjww', 12, 'blowfish', 1, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_links`
--

CREATE TABLE `user_links` (
  `link_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `descriptive_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `passport_group_id` int(11) NOT NULL,
  `show_in_tasklist` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_links`
--

INSERT INTO `user_links` (`link_id`, `name`, `target`, `descriptive_title`, `description`, `passport_group_id`, `show_in_tasklist`, `status`, `icon`, `priority`) VALUES
(1, 'Module Control', 'sysadmin/module_control.php', 'Module Control', 'Enable or disable system modules', 2, 'Yes', 'On', 'modulecontrol.png', 0),
(2, 'Set User Passports', 'sysadmin/set_user_passports.php', 'Set User Passports', 'Change the passport settings of system users', 2, 'Yes', 'On', 'passport.png', 0),
(3, 'Security Monitor', 'sysadmin/security_monitor.php', 'Security Monitor', 'Examine the system log', 2, 'Yes', 'On', 'security3.png', 0),
(4, 'Add person', 'sysadmin/add_person.php', 'Add Person', '', 2, 'No', 'On', 'form.png', 0),
(5, 'Edit person', 'sysadmin/edit_person.php', 'Edit Person', '', 2, 'No', 'On', 'form.png', 0),
(6, 'View person', 'sysadmin/listview_person.php', 'Person', '', 2, 'Yes', 'On', 'persons.png', 0),
(7, 'Delete person', 'sysadmin/delete_person.php', 'Delete Person', '', 2, 'No', 'On', 'form.png', 0),
(8, 'Add user', 'sysadmin/add_user.php', 'Add User', '', 2, 'No', 'On', 'form.png', 0),
(9, 'Edit user', 'sysadmin/edit_user.php', 'Edit User', '', 2, 'No', 'On', 'form.png', 0),
(10, 'View user', 'sysadmin/listview_user.php', 'User', '', 2, 'Yes', 'On', 'card.png', 0),
(11, 'Delete user', 'sysadmin/delete_user.php', 'Delete User', '', 2, 'No', 'On', 'form.png', 0),
(12, 'Add user role', 'sysadmin/add_user_role.php', 'Add User Role', '', 2, 'No', 'On', 'form.png', 0),
(13, 'Edit user role', 'sysadmin/edit_user_role.php', 'Edit User Role', '', 2, 'No', 'On', 'form.png', 0),
(14, 'View user role', 'sysadmin/listview_user_role.php', 'User Roles', '', 2, 'Yes', 'On', 'roles.png', 0),
(15, 'Delete user role', 'sysadmin/delete_user_role.php', 'Delete User Role', '', 2, 'No', 'On', 'form.png', 0),
(16, 'Add system settings', 'sysadmin/add_system_settings.php', 'Add System Settings', '', 2, 'No', 'On', 'form.png', 0),
(17, 'Edit system settings', 'sysadmin/edit_system_settings.php', 'Edit System Settings', '', 2, 'No', 'On', 'form.png', 0),
(18, 'View system settings', 'sysadmin/listview_system_settings.php', 'System Settings', '', 2, 'Yes', 'On', 'system_settings.png', 0),
(19, 'Delete system settings', 'sysadmin/delete_system_settings.php', 'Delete System Settings', '', 2, 'No', 'On', 'form.png', 0),
(20, 'Add user links', 'sysadmin/add_user_links.php', 'Add User Links', '', 2, 'No', 'On', 'form.png', 0),
(21, 'Edit user links', 'sysadmin/edit_user_links.php', 'Edit User Links', '', 2, 'No', 'On', 'form.png', 0),
(22, 'View user links', 'sysadmin/listview_user_links.php', 'User Links', '', 2, 'Yes', 'On', 'links.png', 0),
(23, 'Delete user links', 'sysadmin/delete_user_links.php', 'Delete User Links', '', 2, 'No', 'On', 'form.png', 0),
(24, 'Add user passport groups', 'sysadmin/add_user_passport_groups.php', 'Add User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(25, 'Edit user passport groups', 'sysadmin/edit_user_passport_groups.php', 'Edit User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(26, 'View user passport groups', 'sysadmin/listview_user_passport_groups.php', 'User Passport Groups', '', 2, 'Yes', 'On', 'passportgroup.png', 0),
(27, 'Delete user passport groups', 'sysadmin/delete_user_passport_groups.php', 'Delete User Passport Groups', '', 2, 'No', 'On', 'form.png', 0),
(28, 'Add system skins', 'sysadmin/add_system_skins.php', 'Add System Skins', '', 2, 'No', 'On', 'form.png', 0),
(29, 'Edit system skins', 'sysadmin/edit_system_skins.php', 'Edit System Skins', '', 2, 'No', 'On', 'form.png', 0),
(30, 'View system skins', 'sysadmin/listview_system_skins.php', 'System Skins', '', 2, 'Yes', 'On', 'system_skins.png', 0),
(31, 'Delete system skins', 'sysadmin/delete_system_skins.php', 'Delete System Skins', '', 2, 'No', 'On', 'form.png', 0),
(32, 'Reset Password', 'sysadmin/reset_password.php', 'Reset Password', '', 2, 'Yes', 'On', 'lock_big.png', 0),
(33, 'Add cobalt sst', 'sst/add_cobalt_sst.php', 'Add Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(34, 'Edit cobalt sst', 'sst/edit_cobalt_sst.php', 'Edit Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(35, 'View cobalt sst', 'sst/listview_cobalt_sst.php', 'Cobalt SST', '', 2, 'Yes', 'On', 'form3.png', 0),
(36, 'Delete cobalt sst', 'sst/delete_cobalt_sst.php', 'Delete Cobalt SST', '', 2, 'No', 'On', 'form3.png', 0),
(37, 'Add advertiser', 'modules/advertiser/advertiser/add_advertiser.php', 'Add Advertiser', '', 3, 'No', 'On', 'form3.png', 0),
(38, 'Edit advertiser', 'modules/advertiser/advertiser/edit_advertiser.php', 'Edit Advertiser', '', 3, 'No', 'On', 'form3.png', 0),
(39, 'View advertiser', 'modules/advertiser/advertiser/listview_advertiser.php', 'Advertiser', '', 3, 'Yes', 'On', 'form3.png', 0),
(40, 'Delete advertiser', 'modules/advertiser/advertiser/delete_advertiser.php', 'Delete Advertiser', '', 3, 'No', 'On', 'form3.png', 0),
(41, 'Add billboard location', 'modules/billboar_location/billboard_location/add_billboard_location.php', 'Add Billboard Location', '', 4, 'No', 'On', 'form3.png', 0),
(42, 'Edit billboard location', 'modules/billboar_location/billboard_location/edit_billboard_location.php', 'Edit Billboard Location', '', 4, 'No', 'On', 'form3.png', 0),
(43, 'View billboard location', 'modules/billboar_location/billboard_location/listview_billboard_location.php', 'Billboard Location', '', 4, 'Yes', 'On', 'form3.png', 0),
(44, 'Delete billboard location', 'modules/billboar_location/billboard_location/delete_billboard_location.php', 'Delete Billboard Location', '', 1, 'No', 'On', 'form3.png', 0),
(45, 'Add company', 'modules/company/company/add_company.php', 'Add Company', '', 4, 'No', 'On', 'form3.png', 0),
(46, 'Edit company', 'modules/company/company/edit_company.php', 'Edit Company', '', 4, 'No', 'On', 'form3.png', 0),
(47, 'View company', 'modules/company/company/listview_company.php', 'Company', '', 4, 'Yes', 'On', 'form3.png', 0),
(48, 'Delete company', 'modules/company/company/delete_company.php', 'Delete Company', '', 4, 'No', 'On', 'form3.png', 0),
(49, 'Add company ad', 'modules/company_ad/company_ad/add_company_ad.php', 'Add Company Ad', '', 3, 'No', 'On', 'form3.png', 0),
(50, 'Edit company ad', 'modules/company_ad/company_ad/edit_company_ad.php', 'Edit Company Ad', '', 3, 'No', 'On', 'form3.png', 0),
(51, 'View company ad', 'modules/company_ad/company_ad/listview_company_ad.php', 'Company Advertisement', '', 3, 'Yes', 'On', 'form3.png', 0),
(52, 'Delete company ad', 'modules/company_ad/company_ad/delete_company_ad.php', 'Delete Company Ad', '', 3, 'No', 'On', 'form3.png', 0),
(53, 'Add player', 'modules/player/player/add_player.php', 'Add Player', '', 1, 'No', 'On', 'form3.png', 0),
(54, 'Edit player', 'modules/player/player/edit_player.php', 'Edit Player', '', 1, 'No', 'On', 'form3.png', 0),
(55, 'View player', 'modules/player/player/listview_player.php', 'Player', '', 4, 'Yes', 'On', 'form3.png', 0),
(56, 'Delete player', 'modules/player/player/delete_player.php', 'Delete Player', '', 1, 'No', 'On', 'form3.png', 0),
(57, 'Add player answered question', 'modules/player/player_answered_question/add_player_answered_question.php', 'Add Player Answered Question', '', 4, 'No', 'On', 'form3.png', 0),
(58, 'Edit player answered question', 'modules/player/player_answered_question/edit_player_answered_question.php', 'Edit Player Answered Question', '', 4, 'No', 'On', 'form3.png', 0),
(59, 'View player answered question', 'modules/player/player_answered_question/listview_player_answered_question.php', 'Player Answered Question', '', 4, 'Yes', 'On', 'form3.png', 0),
(60, 'Delete player answered question', 'modules/player/player_answered_question/delete_player_answered_question.php', 'Delete Player Answered Question', '', 4, 'No', 'On', 'form3.png', 0),
(61, 'Add question', 'modules/question/question/add_question.php', 'Add Question', '', 3, 'No', 'On', 'form3.png', 0),
(62, 'Edit question', 'modules/question/question/edit_question.php', 'Edit Question', '', 3, 'No', 'On', 'form3.png', 0),
(63, 'View question', 'modules/question/question/listview_question.php', 'Question', '', 3, 'Yes', 'On', 'form3.png', 0),
(64, 'Delete question', 'modules/question/question/delete_question.php', 'Delete Question', '', 3, 'No', 'On', 'form3.png', 0),
(65, 'Add trivia', 'modules/trivia/trivia/add_trivia.php', 'Add Trivia', '', 3, 'No', 'On', 'form3.png', 0),
(66, 'Edit trivia', 'modules/trivia/trivia/edit_trivia.php', 'Edit Trivia', '', 3, 'No', 'On', 'form3.png', 0),
(67, 'View trivia', 'modules/trivia/trivia/listview_trivia.php', 'Trivia', '', 3, 'Yes', 'On', 'form3.png', 0),
(68, 'Delete trivia', 'modules/trivia/trivia/delete_trivia.php', 'Delete Trivia', '', 3, 'No', 'On', 'form3.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_passport`
--

CREATE TABLE `user_passport` (
  `username` varchar(255) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_passport`
--

INSERT INTO `user_passport` (`username`, `link_id`) VALUES
('root', 1),
('root', 2),
('root', 3),
('root', 4),
('root', 5),
('root', 6),
('root', 7),
('root', 8),
('root', 9),
('root', 10),
('root', 11),
('root', 12),
('root', 13),
('root', 14),
('root', 15),
('root', 16),
('root', 17),
('root', 18),
('root', 19),
('root', 20),
('root', 21),
('root', 22),
('root', 23),
('root', 24),
('root', 25),
('root', 26),
('root', 27),
('root', 28),
('root', 29),
('root', 30),
('root', 31),
('root', 32),
('root', 33),
('root', 34),
('root', 35),
('root', 36),
('root', 37),
('root', 38),
('root', 39),
('root', 40),
('root', 41),
('root', 42),
('root', 43),
('root', 44),
('root', 45),
('root', 46),
('root', 47),
('root', 48),
('root', 49),
('root', 50),
('root', 51),
('root', 52),
('root', 53),
('root', 54),
('root', 55),
('root', 56),
('root', 57),
('root', 58),
('root', 59),
('root', 60),
('root', 61),
('root', 62),
('root', 63),
('root', 64),
('root', 65),
('root', 66),
('root', 67),
('root', 68),
('srmunar', 37),
('srmunar', 38),
('srmunar', 39),
('srmunar', 40),
('srmunar', 49),
('srmunar', 50),
('srmunar', 51),
('srmunar', 52),
('srmunar', 61),
('srmunar', 62),
('srmunar', 63),
('srmunar', 64),
('srmunar', 65),
('srmunar', 66),
('srmunar', 67),
('srmunar', 68);

-- --------------------------------------------------------

--
-- Table structure for table `user_passport_groups`
--

CREATE TABLE `user_passport_groups` (
  `passport_group_id` int(11) NOT NULL,
  `passport_group` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_passport_groups`
--

INSERT INTO `user_passport_groups` (`passport_group_id`, `passport_group`, `priority`, `icon`) VALUES
(1, 'Default', 3, 'blue_folder3.png'),
(2, 'Admin', 2, 'preferences-system.png'),
(3, 'Advertiser', 4, 'blue_folder3.png'),
(4, 'OAAP', 5, 'blue_folder3.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `role`, `description`) VALUES
(1, 'Super Admin', 'Super admin role with 100% system privileges'),
(2, 'System Admin', 'System admin role with all sysadmin permissions'),
(3, 'Advertiser', 'Can Manage advertisements');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_links`
--

CREATE TABLE `user_role_links` (
  `role_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role_links`
--

INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 68);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertiser`
--
ALTER TABLE `advertiser`
  ADD PRIMARY KEY (`advertiser_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `billboard_location`
--
ALTER TABLE `billboard_location`
  ADD PRIMARY KEY (`billboard_location_id`);

--
-- Indexes for table `cobalt_reporter`
--
ALTER TABLE `cobalt_reporter`
  ADD PRIMARY KEY (`module_name`,`report_name`);

--
-- Indexes for table `cobalt_sst`
--
ALTER TABLE `cobalt_sst`
  ADD PRIMARY KEY (`auto_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_ad`
--
ALTER TABLE `company_ad`
  ADD PRIMARY KEY (`company_ad_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `billboard_loc` (`billboard_loc`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `person_id_2` (`person_id`);

--
-- Indexes for table `player_answered_question`
--
ALTER TABLE `player_answered_question`
  ADD PRIMARY KEY (`player_answered_question_id`),
  ADD KEY `question` (`question`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `question_answer`
--
ALTER TABLE `question_answer`
  ADD PRIMARY KEY (`question_answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `answer` (`answer`(767));

--
-- Indexes for table `question_choices`
--
ALTER TABLE `question_choices`
  ADD PRIMARY KEY (`question_choices_id`),
  ADD KEY `question_idx` (`question_id`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`entry_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`setting`);

--
-- Indexes for table `system_skins`
--
ALTER TABLE `system_skins`
  ADD PRIMARY KEY (`skin_id`);

--
-- Indexes for table `trivia`
--
ALTER TABLE `trivia`
  ADD PRIMARY KEY (`trivia_id`),
  ADD KEY `company` (`company`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_links`
--
ALTER TABLE `user_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `user_passport`
--
ALTER TABLE `user_passport`
  ADD PRIMARY KEY (`username`,`link_id`);

--
-- Indexes for table `user_passport_groups`
--
ALTER TABLE `user_passport_groups`
  ADD PRIMARY KEY (`passport_group_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user_role_links`
--
ALTER TABLE `user_role_links`
  ADD PRIMARY KEY (`role_id`,`link_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertiser`
--
ALTER TABLE `advertiser`
  MODIFY `advertiser_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `billboard_location`
--
ALTER TABLE `billboard_location`
  MODIFY `billboard_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cobalt_sst`
--
ALTER TABLE `cobalt_sst`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `company_ad`
--
ALTER TABLE `company_ad`
  MODIFY `company_ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_answered_question`
--
ALTER TABLE `player_answered_question`
  MODIFY `player_answered_question_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `question_answer`
--
ALTER TABLE `question_answer`
  MODIFY `question_answer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
  MODIFY `question_choices_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_log`
--
ALTER TABLE `system_log`
  MODIFY `entry_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT for table `system_skins`
--
ALTER TABLE `system_skins`
  MODIFY `skin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `trivia`
--
ALTER TABLE `trivia`
  MODIFY `trivia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_links`
--
ALTER TABLE `user_links`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `user_passport_groups`
--
ALTER TABLE `user_passport_groups`
  MODIFY `passport_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertiser`
--
ALTER TABLE `advertiser`
  ADD CONSTRAINT `advertiser_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `company_ad`
--
ALTER TABLE `company_ad`
  ADD CONSTRAINT `company_ad_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `company_ad_ibfk_2` FOREIGN KEY (`billboard_loc`) REFERENCES `billboard_location` (`billboard_location_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `player_answered_question`
--
ALTER TABLE `player_answered_question`
  ADD CONSTRAINT `player_answered_question_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `player_answered_question_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`);

--
-- Constraints for table `question_answer`
--
ALTER TABLE `question_answer`
  ADD CONSTRAINT `question_answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `question_choices`
--
ALTER TABLE `question_choices`
  ADD CONSTRAINT `question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trivia`
--
ALTER TABLE `trivia`
  ADD CONSTRAINT `trivia_ibfk_1` FOREIGN KEY (`company`) REFERENCES `company` (`company_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
