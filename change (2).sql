-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2022 at 10:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `change`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_for` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminder_before` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('pending','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `package_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `patient_name`, `phone`, `amount`, `image`, `appointment_for`, `order_id`, `date`, `time`, `reminder_before`, `payment_status`, `notes`, `created_at`, `updated_at`, `package_id`, `service_id`) VALUES
(3, 1, 'test', '121212122', NULL, 'uploads/appointment/1760391317_1665827348.PNG', 'myself', 'R06raliXJU7eYFPl', '12/24/2022', '12:01 AM', '25', 'paid', 'test test test', '2022-10-15 04:49:08', '2022-10-15 04:49:08', NULL, NULL),
(4, 1, 'test', '121212122', NULL, 'uploads/appointment/1760391317_1665827348.PNG', 'myself', 'R06raliXJU7eYFPl', '12/24/2022', '03:00 PM', '25', 'paid', 'test test test', '2022-10-15 04:49:08', '2022-10-15 04:49:08', NULL, NULL),
(5, 1, 'test', '121212122', '50', 'uploads/profile/779791050_1666171868.PNG', 'myself', 'Fr2IHeHGYcvcPEJ6', '12/24/2022', '1:00 AM', '25', 'paid', 'test test test', '2022-10-23 08:06:50', '2022-10-23 08:06:50', '1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(2, 'AX', 'Åland Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(3, 'AL', 'Albania', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(4, 'DZ', 'Algeria', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(5, 'AS', 'American Samoa', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(6, 'AD', 'Andorra', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(7, 'AO', 'Angola', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(8, 'AI', 'Anguilla', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(9, 'AQ', 'Antarctica', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(10, 'AG', 'Antigua and Barbuda', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(11, 'AR', 'Argentina', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(12, 'AM', 'Armenia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(13, 'AW', 'Aruba', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(14, 'AU', 'Australia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(15, 'AT', 'Austria', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(16, 'AZ', 'Azerbaijan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(17, 'BS', 'Bahamas', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(18, 'BH', 'Bahrain', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(19, 'BD', 'Bangladesh', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(20, 'BB', 'Barbados', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(21, 'BY', 'Belarus', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(22, 'BE', 'Belgium', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(23, 'BZ', 'Belize', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(24, 'BJ', 'Benin', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(25, 'BM', 'Bermuda', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(26, 'BT', 'Bhutan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(27, 'BO', 'Bolivia, Plurinational State of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(29, 'BA', 'Bosnia and Herzegovina', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(30, 'BW', 'Botswana', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(31, 'BV', 'Bouvet Island', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(32, 'BR', 'Brazil', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(33, 'IO', 'British Indian Ocean Territory', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(34, 'BN', 'Brunei Darussalam', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(35, 'BG', 'Bulgaria', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(36, 'BF', 'Burkina Faso', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(37, 'BI', 'Burundi', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(38, 'KH', 'Cambodia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(39, 'CM', 'Cameroon', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(40, 'CA', 'Canada', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(41, 'CV', 'Cape Verde', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(42, 'KY', 'Cayman Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(43, 'CF', 'Central African Republic', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(44, 'TD', 'Chad', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(45, 'CL', 'Chile', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(46, 'CN', 'China', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(47, 'CX', 'Christmas Island', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(48, 'CC', 'Cocos (Keeling) Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(49, 'CO', 'Colombia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(50, 'KM', 'Comoros', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(51, 'CG', 'Congo', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(52, 'CD', 'Congo, the Democratic Republic of the', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(53, 'CK', 'Cook Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(54, 'CR', 'Costa Rica', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(55, 'CI', 'Côte d\'Ivoire', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(56, 'HR', 'Croatia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(57, 'CU', 'Cuba', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(58, 'CW', 'Curaçao', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(59, 'CY', 'Cyprus', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(60, 'CZ', 'Czech Republic', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(61, 'DK', 'Denmark', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(62, 'DJ', 'Djibouti', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(63, 'DM', 'Dominica', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(64, 'DO', 'Dominican Republic', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(65, 'EC', 'Ecuador', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(66, 'EG', 'Egypt', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(67, 'SV', 'El Salvador', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(68, 'GQ', 'Equatorial Guinea', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(69, 'ER', 'Eritrea', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(70, 'EE', 'Estonia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(71, 'ET', 'Ethiopia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(72, 'FK', 'Falkland Islands (Malvinas)', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(73, 'FO', 'Faroe Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(74, 'FJ', 'Fiji', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(75, 'FI', 'Finland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(76, 'FR', 'France', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(77, 'GF', 'French Guiana', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(78, 'PF', 'French Polynesia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(79, 'TF', 'French Southern Territories', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(80, 'GA', 'Gabon', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(81, 'GM', 'Gambia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(82, 'GE', 'Georgia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(83, 'DE', 'Germany', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(84, 'GH', 'Ghana', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(85, 'GI', 'Gibraltar', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(86, 'GR', 'Greece', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(87, 'GL', 'Greenland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(88, 'GD', 'Grenada', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(89, 'GP', 'Guadeloupe', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(90, 'GU', 'Guam', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(91, 'GT', 'Guatemala', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(92, 'GG', 'Guernsey', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(93, 'GN', 'Guinea', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(94, 'GW', 'Guinea-Bissau', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(95, 'GY', 'Guyana', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(96, 'HT', 'Haiti', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(97, 'HM', 'Heard Island and McDonald Mcdonald Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(98, 'VA', 'Holy See (Vatican City State)', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(99, 'HN', 'Honduras', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(100, 'HK', 'Hong Kong', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(101, 'HU', 'Hungary', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(102, 'IS', 'Iceland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(103, 'IN', 'India', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(104, 'ID', 'Indonesia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(105, 'IR', 'Iran, Islamic Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(106, 'IQ', 'Iraq', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(107, 'IE', 'Ireland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(108, 'IM', 'Isle of Man', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(109, 'IL', 'Israel', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(110, 'IT', 'Italy', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(111, 'JM', 'Jamaica', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(112, 'JP', 'Japan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(113, 'JE', 'Jersey', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(114, 'JO', 'Jordan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(115, 'KZ', 'Kazakhstan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(116, 'KE', 'Kenya', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(117, 'KI', 'Kiribati', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(118, 'KP', 'Korea, Democratic People\'s Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(119, 'KR', 'Korea, Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(120, 'KW', 'Kuwait', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(121, 'KG', 'Kyrgyzstan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(122, 'LA', 'Lao People\'s Democratic Republic', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(123, 'LV', 'Latvia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(124, 'LB', 'Lebanon', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(125, 'LS', 'Lesotho', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(126, 'LR', 'Liberia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(127, 'LY', 'Libya', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(128, 'LI', 'Liechtenstein', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(129, 'LT', 'Lithuania', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(130, 'LU', 'Luxembourg', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(131, 'MO', 'Macao', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(132, 'MK', 'Macedonia, the Former Yugoslav Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(133, 'MG', 'Madagascar', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(134, 'MW', 'Malawi', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(135, 'MY', 'Malaysia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(136, 'MV', 'Maldives', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(137, 'ML', 'Mali', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(138, 'MT', 'Malta', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(139, 'MH', 'Marshall Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(140, 'MQ', 'Martinique', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(141, 'MR', 'Mauritania', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(142, 'MU', 'Mauritius', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(143, 'YT', 'Mayotte', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(144, 'MX', 'Mexico', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(145, 'FM', 'Micronesia, Federated States of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(146, 'MD', 'Moldova, Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(147, 'MC', 'Monaco', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(148, 'MN', 'Mongolia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(149, 'ME', 'Montenegro', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(150, 'MS', 'Montserrat', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(151, 'MA', 'Morocco', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(152, 'MZ', 'Mozambique', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(153, 'MM', 'Myanmar', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(154, 'NA', 'Namibia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(155, 'NR', 'Nauru', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(156, 'NP', 'Nepal', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(157, 'NL', 'Netherlands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(158, 'NC', 'New Caledonia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(159, 'NZ', 'New Zealand', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(160, 'NI', 'Nicaragua', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(161, 'NE', 'Niger', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(162, 'NG', 'Nigeria', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(163, 'NU', 'Niue', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(164, 'NF', 'Norfolk Island', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(165, 'MP', 'Northern Mariana Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(166, 'NO', 'Norway', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(167, 'OM', 'Oman', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(168, 'PK', 'Pakistan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(169, 'PW', 'Palau', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(170, 'PS', 'Palestine, State of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(171, 'PA', 'Panama', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(172, 'PG', 'Papua New Guinea', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(173, 'PY', 'Paraguay', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(174, 'PE', 'Peru', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(175, 'PH', 'Philippines', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(176, 'PN', 'Pitcairn', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(177, 'PL', 'Poland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(178, 'PT', 'Portugal', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(179, 'PR', 'Puerto Rico', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(180, 'QA', 'Qatar', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(181, 'RE', 'Réunion', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(182, 'RO', 'Romania', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(183, 'RU', 'Russian Federation', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(184, 'RW', 'Rwanda', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(185, 'BL', 'Saint Barthélemy', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(186, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(187, 'KN', 'Saint Kitts and Nevis', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(188, 'LC', 'Saint Lucia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(189, 'MF', 'Saint Martin (French part)', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(190, 'PM', 'Saint Pierre and Miquelon', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(191, 'VC', 'Saint Vincent and the Grenadines', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(192, 'WS', 'Samoa', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(193, 'SM', 'San Marino', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(194, 'ST', 'Sao Tome and Principe', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(195, 'SA', 'Saudi Arabia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(196, 'SN', 'Senegal', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(197, 'RS', 'Serbia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(198, 'SC', 'Seychelles', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(199, 'SL', 'Sierra Leone', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(200, 'SG', 'Singapore', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(201, 'SX', 'Sint Maarten (Dutch part)', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(202, 'SK', 'Slovakia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(203, 'SI', 'Slovenia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(204, 'SB', 'Solomon Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(205, 'SO', 'Somalia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(206, 'ZA', 'South Africa', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(207, 'GS', 'South Georgia and the South Sandwich Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(208, 'SS', 'South Sudan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(209, 'ES', 'Spain', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(210, 'LK', 'Sri Lanka', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(211, 'SD', 'Sudan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(212, 'SR', 'Suriname', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(213, 'SJ', 'Svalbard and Jan Mayen', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(214, 'SZ', 'Swaziland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(215, 'SE', 'Sweden', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(216, 'CH', 'Switzerland', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(217, 'SY', 'Syrian Arab Republic', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(218, 'TW', 'Taiwan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(219, 'TJ', 'Tajikistan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(220, 'TZ', 'Tanzania, United Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(221, 'TH', 'Thailand', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(222, 'TL', 'Timor-Leste', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(223, 'TG', 'Togo', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(224, 'TK', 'Tokelau', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(225, 'TO', 'Tonga', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(226, 'TT', 'Trinidad and Tobago', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(227, 'TN', 'Tunisia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(228, 'TR', 'Turkey', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(229, 'TM', 'Turkmenistan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(230, 'TC', 'Turks and Caicos Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(231, 'TV', 'Tuvalu', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(232, 'UG', 'Uganda', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(233, 'UA', 'Ukraine', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(234, 'AE', 'United Arab Emirates', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(235, 'GB', 'United Kingdom', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(236, 'US', 'United States', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(237, 'UM', 'United States Minor Outlying Islands', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(238, 'UY', 'Uruguay', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(239, 'UZ', 'Uzbekistan', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(240, 'VU', 'Vanuatu', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(241, 'VE', 'Venezuela, Bolivarian Republic of', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(242, 'VN', 'Viet Nam', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(243, 'VG', 'Virgin Islands, British', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(244, 'VI', 'Virgin Islands, U.S.', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(245, 'WF', 'Wallis and Futuna', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(246, 'EH', 'Western Sahara', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(247, 'YE', 'Yemen', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(248, 'ZM', 'Zambia', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(249, 'ZW', 'Zimbabwe', '2022-10-15 04:31:35', '2022-10-15 04:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_09_18_095727_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2020_06_29_065140_create__countries__table', 1),
(12, '2020_06_30_111004_create_packages_table', 1),
(13, '2020_08_03_074634_create_settings_table', 1),
(14, '2020_09_18_155213_create_transactions_table', 1),
(15, '2022_10_12_112234_create_otp_requests_table', 1),
(16, '2022_10_14_114745_create_appointments_table', 1),
(17, '2022_10_14_223710_create_reviews_table', 1),
(18, '2022_10_19_175855_add_about_to_users_table', 2),
(19, '2022_10_21_191437_add_package_id_to_appointments_table', 3),
(20, '2022_10_21_193849_create_services_table', 4),
(21, '2022_10_23_124339_create_notifications_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_seen` enum('seen','unseen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unseen',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `body`, `from_user`, `to_user`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 'New Appointment Created', '1', '1', 'unseen', '2022-10-23 08:06:50', '2022-10-23 08:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('363c1adbad7b1dd6bb1452af6b167049712e98047ec5c5c9b0b5f26a6eda852a5790204b5fa8cd12', 26, 1, 'MyApp', '[]', 0, '2022-10-23 07:26:09', '2022-10-23 07:26:09', '2023-10-23 12:26:09'),
('466ea4a1d80b6b660e17a9de867b981df5cb8139660f83d958404a704bfe6cf7a055a7f9029e4408', 1, 1, 'MyApp', '[]', 0, '2022-10-23 10:51:03', '2022-10-23 10:51:03', '2023-10-23 15:51:03'),
('53f81a0d0e354afb7145ff79cdb93bcd085d516ed9e95732abc884be2dda37ca253d251c4ffdeb71', 1, 1, 'MyApp', '[]', 0, '2022-10-20 15:34:36', '2022-10-20 15:34:36', '2023-10-20 20:34:36'),
('5afe0c4ce494cde73fb7580df8e2bca7868af7ba662b2eefd6528f55373d8b59582f2cb1fecfdbb9', 1, 1, 'MyApp', '[]', 0, '2022-10-23 08:05:21', '2022-10-23 08:05:21', '2023-10-23 13:05:21'),
('5d09e35cb097edc898482334b3add89a89b9391044bf314745ce7a5cd2443b08aac0888333a091b3', 1, 1, 'MyApp', '[]', 0, '2022-10-19 04:30:28', '2022-10-19 04:30:28', '2023-10-19 09:30:28'),
('8d567e40b1c62c17ea402ea00ffb8bb29c9aa583eee6ba4af3e6dcaf94a491c62370195758c319eb', 1, 1, 'MyApp', '[]', 0, '2022-10-21 15:06:12', '2022-10-21 15:06:12', '2023-10-21 20:06:12'),
('9f7136ff4ad79e2a3ceb4021a85fe1918c4d665c1ace7f31bee09eed50dfdbfdcecc51d6d0dd768c', 1, 1, 'MyApp', '[]', 0, '2022-10-15 04:31:43', '2022-10-15 04:31:43', '2023-10-15 09:31:43'),
('b302254b4059390a5e471bfc8d8faaa56b96fa9117b9dafd0767c9f332b34cd7f89555df9b8cbc07', 25, 1, 'MyApp', '[]', 0, '2022-10-23 07:25:37', '2022-10-23 07:25:37', '2023-10-23 12:25:37'),
('b90788b86c6cdfb2401354631f3365bbb4796d69527da727a0b71fb972cdb81e81ea038ec0eaf23a', 24, 1, 'MyApp', '[]', 0, '2022-10-25 05:01:18', '2022-10-25 05:01:18', '2023-10-25 10:01:18'),
('c8706f3d5259aa8e2bd42ec41c0acfe2015ed3fefe1f634454c2d4a48f15078c65b93ccb9668cdf5', 27, 1, 'MyApp', '[]', 0, '2022-10-23 07:26:38', '2022-10-23 07:26:38', '2023-10-23 12:26:38'),
('d2effeaf675c882290862fa1df8bd59ee625f1ef7aee11455a92880d24f704f8679ed2dc98dd4fb2', 1, 1, 'MyApp', '[]', 0, '2022-10-19 12:44:19', '2022-10-19 12:44:19', '2023-10-19 17:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'k5C36EMYJ4KkP1aXNLtFCka2lKWckQuoVh3Iqw6m', NULL, 'http://localhost', 1, 0, 0, '2022-10-15 04:31:38', '2022-10-15 04:31:38'),
(2, NULL, 'Laravel Password Grant Client', 'nPClubnoVkN2hw6g3Mvf0MzPE8o9jeCPmFNeX5KY', 'users', 'http://localhost', 0, 1, 0, '2022-10-15 04:31:38', '2022-10-15 04:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-15 04:31:38', '2022-10-15 04:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_requests`
--

CREATE TABLE `otp_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` enum('weekly','monthly','yearly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yearly',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `description`, `duration`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Basic Plan', 50.99, 'basic plan', 'yearly', NULL, '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(2, 'Business Plan', 9.99, 'business Plan', 'monthly', NULL, '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(3, 'Enterprices Plan', 19.99, 'enterprises plan', 'weekly', NULL, '2022-10-15 04:31:35', '2022-10-15 04:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `star` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewed_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewed_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2022-10-15 04:31:35', '2022-10-15 04:31:35'),
(2, 'User', 'user', '2022-10-15 04:31:35', '2022-10-15 04:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'paypal_client_id', 'AZ-CXHgvkCckFCrEHfWgQmD3He6R-vjAMeFIzrPuc91YoZQ1wqd31LLHMI4n_ynss7FzHuiOOCed-gew', NULL, '2022-10-15 04:31:35', '2022-10-15 04:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('membership','subscription','charge') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'charge',
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `appointment_id`, `user_id`, `type`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'charge', '{\"id\":\"ch_3Lt6isHjpLrUB46k08ycyPad\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Lt6isHjpLrUB46k0A09GB4n\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1665826322,\"currency\":\"usd\",\"customer\":null,\"description\":\"Test payment from Change Your Life App!\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":34,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Lt6irHjpLrUB46k7J714Q7H\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSmx6akJIanBMclVCNDZrKJP8qZoGMgaShZY-7AE6LBYizs_SL57hQaCui5-lf2bYt7h5wJT8TMjSkXcQxfiOPorMHL_Z3PPffcLc\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Lt6isHjpLrUB46k08ycyPad\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Lt6irHjpLrUB46k7J714Q7H\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '2022-10-15 04:32:03', '2022-10-15 04:32:03'),
(2, 2, 1, 'charge', '{\"id\":\"ch_3Lt6okHjpLrUB46k03wxsx18\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Lt6okHjpLrUB46k0pEgwpD3\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1665826686,\"currency\":\"usd\",\"customer\":null,\"description\":\"Test payment from Change Your Life App!\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":25,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Lt6okHjpLrUB46kWm0KJsvu\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSmx6akJIanBMclVCNDZrKP_-qZoGMgZG_w3peMY6LBa3Duy4gOGAUrIhSS5ObxK7zNkA8P2bX7ZA1PR5u5MxNJRt3f6TYvreAURp\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Lt6okHjpLrUB46k03wxsx18\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Lt6okHjpLrUB46kWm0KJsvu\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '2022-10-15 04:38:08', '2022-10-15 04:38:08'),
(3, 3, 1, 'charge', '{\"id\":\"ch_3Lt6zPHjpLrUB46k0UyElqhq\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Lt6zPHjpLrUB46k0NMeldX9\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1665827347,\"currency\":\"usd\",\"customer\":null,\"description\":\"Test payment from Change Your Life App!\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":40,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Lt6zOHjpLrUB46kLiH5d7kx\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSmx6akJIanBMclVCNDZrKJSEqpoGMgZ__geBxlU6LBa40MozCrUw3odpyGPy9vscI6fpDsl9BEHu-tY4wqgKOaWSvGlQwnYut2Fx\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Lt6zPHjpLrUB46k0UyElqhq\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Lt6zOHjpLrUB46kLiH5d7kx\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '2022-10-15 04:49:08', '2022-10-15 04:49:08'),
(4, 5, 1, 'charge', '{\"id\":\"ch_3Lw3t4HjpLrUB46k0fZgIARb\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Lw3t4HjpLrUB46k0v33WcVR\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":null,\"phone\":null},\"calculated_statement_descriptor\":\"Stripe\",\"captured\":true,\"created\":1666530406,\"currency\":\"usd\",\"customer\":null,\"description\":\"Test payment from Change Your Life App!\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":1,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Lw3t1HjpLrUB46kBWTAbnWT\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":null,\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xSmx6akJIanBMclVCNDZrKOf41JoGMgY0vjafZQo6LBb1OjQlm6IgJgDbiURlia7rLLOhlruAKNBOKHorL-oVGBeozfEkyBtpWy-1\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Lw3t4HjpLrUB46k0fZgIARb\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Lw3t1HjpLrUB46kBWTAbnWT\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":null,\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":1,\"exp_year\":2025,\"fingerprint\":\"XFFyBhSs6G96NGzC\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":null,\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}', '2022-10-23 08:06:50', '2022-10-23 08:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => inactive, 1 => active',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `password`, `is_active`, `role_id`, `phone`, `address`, `city`, `state`, `country`, `image`, `identity_token`, `remember_token`, `created_at`, `updated_at`, `about`) VALUES
(1, 'test', 'admin@test.com', NULL, '$2y$10$ofrKHTCk6VZgCvWHWy1F2OkG4K2X9chCXPHhg/vFOpt//B9eswQ7e', 1, 1, '1232323', 'ABC Road, XYZ Street', 'Housten', 'TX', 'United States', '', '5U8ni46JNSCG', NULL, '2022-10-15 04:31:35', '2022-10-23 10:50:38', ''),
(25, 'Guest92363', 'guest-92363@guest.com', NULL, '$2y$10$BFGfC168Sk8N3.Etj06nDOPfpP0dpZK.oJr/zHB3LJCGj0vIPg/sK', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'kkKxRUkn6988', NULL, '2022-10-23 07:25:37', '2022-10-23 07:25:37', 'anonymous'),
(26, 'Guest18547', 'guest-18547@guest.com', NULL, '$2y$10$5bfXKA7Jrt7aNbrY/.DEY.xELkcXcB4wIfywCYp7y6sU.6WHZrWb.', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'JQZG5XxjUsFx', NULL, '2022-10-23 07:26:09', '2022-10-23 07:26:09', 'anonymous'),
(27, 'Guest89571', 'guest-89571@guest.com', NULL, '$2y$10$XL3GM/WTl6cKUtT6MIk0Ru1hiSf9Wb.TkEuUL0XkDGwGDqNGPw0Bq', 1, 2, '1321215441', NULL, NULL, NULL, NULL, NULL, 'q8cx9UmMmOvX', NULL, '2022-10-23 07:26:38', '2022-10-23 07:26:38', 'anonymous');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_code_index` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_body_index` (`body`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `otp_requests`
--
ALTER TABLE `otp_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_requests_email_index` (`email`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otp_requests`
--
ALTER TABLE `otp_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
