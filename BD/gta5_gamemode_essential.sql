-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2017 at 10:46 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gta5_gamemode_essential`
--

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coordinates`
--

CREATE TABLE `coordinates` (
  `id` int(11) UNSIGNED NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coordinates`
--

INSERT INTO `coordinates` (`id`, `x`, `y`, `z`, `Name`) VALUES
(1, 2222.84301757813, 5578.4443359375, 53.7291946411133, ''),
(2, 2477.29931640625, 3784.62109375, 41.4352760314941, ''),
(3, -1476.54870605469, 171.836669921875, 55.8890762329102, ''),
(4, 2645.97143554688, 2806.37280273438, 33.9922828674316, ''),
(5, 1038.34326171875, 2261.36840820313, 43.729866027832, ''),
(6, 172.151062011719, 2279.62280273438, 92.6908645629883, ''),
(7, -586.731062011719, 5334.00080273438, 70.2144545629883, 'Recolte Scierie'),
(8, -106.731062011719, 2796.00080273438, 53.2144545629883, 'Vente scierie'),
(9, 586.731062011719, 5334.00080273438, 70.2144545629883, 'Traitement useless'),
(10, 591.731062011719, 2927.00080273438, 40.2144545629883, 'Recup Petrole'),
(11, 643.731062011719, 268.00080273438, 103.2144545629883, 'Vente Petrole'),
(12, 531.731062011719, -1600.00080273438, 29.2144545629883, 'Recolt electricien'),
(13, -301.731062011719, -1171.00080273438, 23.2144545629883, 'Vente electricien'),
(14, -423.731062011719, 6130.00080273438, 31.2144545629883, 'Recolte postier'),
(15, 2119.731062011719, 4790.00080273438, 41.2144545629883, 'Vente postier'),
(16, 1198.731062011719, 1839.00080273438, 78.2144545629883, 'Recolt Beton'),
(17, -487.731062011719, -958.00080273438, 22.2144545629883, 'Vente Beton');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `libelle`) VALUES
(1, 'Cuivre'),
(2, 'Fer'),
(3, 'Petrole'),
(4, 'Weed'),
(5, 'Courrier'),
(6, 'Pièce défectueuse'),
(7, 'Béton'),
(8, 'Pefra'),
(9, 'Casserole'),
(10, 'Bois');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Chomeur', 500),
(2, 'Ouvrier', 1200),
(3, 'Pompiste', 1200),
(4, 'Mineur', 700),
(5, 'Electricien', 1000),
(6, 'Ebeniste', 1000),
(7, 'Illegal', 0),
(8, 'Postier', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `recolt`
--

CREATE TABLE `recolt` (
  `ID` int(11) UNSIGNED NOT NULL,
  `raw_id` int(11) UNSIGNED DEFAULT NULL,
  `treated_id` int(11) UNSIGNED DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `treatment_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recolt`
--

INSERT INTO `recolt` (`ID`, `raw_id`, `treated_id`, `job_id`, `price`, `field_id`, `treatment_id`, `seller_id`, `Comment`) VALUES
(1, 4, 8, 7, 3000, 1, 2, 3, 'Weed'),
(2, 2, 2, 4, 1500, 4, 5, 6, 'Fer'),
(3, 10, 10, 6, 1500, 7, 9, 8, 'Bois'),
(4, 4, 8, 7, 3000, 1, 2, 3, 'Weed 2'),
(5, 3, 3, 3, 1500, 10, 10, 11, 'Bois'),
(6, 5, 5, 8, 1500, 14, 14, 15, 'Courrier'),
(7, 6, 6, 5, 1500, 12, 12, 13, 'Electronique'),
(8, 7, 7, 2, 1500, 16, 16, 17, 'Beton');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `job` int(11) DEFAULT '1',
  `lastpos` varchar(255) DEFAULT '{-1037.79388671875, -2738.11872070313,  20.16776553153992, 142.503463745117}',
  `personalvehicle` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `group`, `permission_level`, `money`, `bankbalance`, `job`, `lastpos`, `personalvehicle`) VALUES
('steam:11000010017dcc3', 'owner', 0, 307, 287010, 6, '{84.5269241333008, -180.056716918945,  54.3768348693848, 248.89208984375}', 'schafter3'),
('steam:110000102234e70', 'user', 0, 3000, 0, 1, '{1257.1728515625, -1145.74743652344,  51.0427513122559, 59.6480445861816}', ''),
('steam:1100001047c07d7', 'user', 0, 4000, 0, 1, '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('steam:11000010017dcc3', 1, 16),
('steam:11000010017dcc3', 2, 0),
('steam:11000010017dcc3', 3, 0),
('steam:11000010017dcc3', 4, 17),
('steam:11000010017dcc3', 5, 0),
('steam:11000010017dcc3', 6, 0),
('steam:11000010017dcc3', 7, 0),
('steam:11000010017dcc3', 8, 0),
('steam:11000010017dcc3', 9, 0),
('steam:11000010017dcc3', 10, 0),
('steam:110000102234e70', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_weapons`
--

INSERT INTO `user_weapons` (`ID`, `identifier`, `weapon_model`, `withdraw_cost`) VALUES
(19, 'steam:11000010017dcc3', 'WEAPON_CombatPistol', 10),
(20, 'steam:11000010017dcc3', 'WEAPON_AssaultRifle', 2500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `recolt`
--
ALTER TABLE `recolt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `raw_id` (`raw_id`),
  ADD KEY `treated_id` (`treated_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `treatment_id` (`treatment_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `user_weapons`
--
ALTER TABLE `user_weapons`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coordinates`
--
ALTER TABLE `coordinates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `recolt`
--
ALTER TABLE `recolt`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `recolt`
--
ALTER TABLE `recolt`
  ADD CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`);

--
-- Constraints for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
