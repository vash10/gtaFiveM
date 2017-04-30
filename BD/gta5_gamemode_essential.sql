-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 30 Avril 2017 à 16:51
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gta5_gamemode_essential`
--

-- --------------------------------------------------------

--
-- Structure de la table `bans`
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
-- Structure de la table `coordinates`
--

CREATE TABLE `coordinates` (
  `id` int(11) UNSIGNED NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coordinates`
--

INSERT INTO `coordinates` (`id`, `x`, `y`, `z`) VALUES
(1, 2222.84301757813, 5578.4443359375, 53.7291946411133),
(2, 2477.29931640625, 3784.62109375, 41.4352760314941),
(3, -1476.54870605469, 171.836669921875, 55.8890762329102),
(4, 2645.97143554688, 2806.37280273438, 33.9922828674316),
(5, 1038.34326171875, 2261.36840820313, 43.729866027832),
(6, 172.151062011719, 2279.62280273438, 92.6908645629883);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`id`, `libelle`) VALUES
(1, 'Cuivre'),
(2, 'Fer'),
(3, 'Or'),
(4, 'Weed'),
(5, 'Pain'),
(6, 'Eau'),
(7, 'Coca'),
(8, 'Pefra'),
(9, 'Casserole');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Chomeur', 500),
(2, 'Policier', 1200),
(3, 'Pompier', 1200),
(4, 'Mineur', 700),
(5, 'Chauffeur de taxi', 1000),
(6, 'Illegal', 0);

-- --------------------------------------------------------

--
-- Structure de la table `recolt`
--

CREATE TABLE `recolt` (
  `ID` int(11) UNSIGNED NOT NULL,
  `raw_id` int(11) UNSIGNED DEFAULT NULL,
  `treated_id` int(11) UNSIGNED DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `treatment_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `recolt`
--

INSERT INTO `recolt` (`ID`, `raw_id`, `treated_id`, `job_id`, `price`, `field_id`, `treatment_id`, `seller_id`) VALUES
(1, 4, 8, 6, 3000, 1, 2, 3),
(2, 1, 9, 4, 1500, 4, 5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `job` int(11) DEFAULT '1',
  `lastpos` varchar(255) DEFAULT '{-1037.79388671875, -2738.11872070313,  20.16776553153992, 142.503463745117}',
  `personalvehicle` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`identifier`, `group`, `permission_level`, `money`, `bankbalance`, `job`, `lastpos`, `personalvehicle`) VALUES
('steam:11000010017dcc3', 'owner', 0, 257947, 281010, 5, '{2212.59326171875, 5577.7109375,  53.8124885559082, 81.0682830810547}', 'AKUMA'),
('steam:11000010062fbbc', 'user', 0, 1500, 0, 1, '{253.611404418945, 2798.13989257813,  43.3018989562988, 4.50258255004883}', NULL),
('steam:11000010063d2c7', 'user', 0, 4500, 0, 4, '{217.540374755859, 3364.46875,  38.8761520385742, 214.745025634766}', NULL),
('steam:110000102234e70', 'user', 0, 3000, 0, 1, '{1257.1728515625, -1145.74743652344,  51.0427513122559, 59.6480445861816}', ''),
('steam:1100001047c07d7', 'user', 0, 4000, 0, 1, '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}', '');

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('steam:11000010017dcc3', 1, 29),
('steam:11000010017dcc3', 4, 2),
('steam:11000010017dcc3', 8, 0),
('steam:11000010017dcc3', 9, 0),
('steam:11000010062fbbc', 1, 3),
('steam:11000010062fbbc', 9, 0),
('steam:11000010063d2c7', 1, 1),
('steam:11000010063d2c7', 9, 0),
('steam:110000102234e70', 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_weapons`
--

INSERT INTO `user_weapons` (`ID`, `identifier`, `weapon_model`, `withdraw_cost`) VALUES
(19, 'steam:11000010017dcc3', 'WEAPON_CombatPistol', 10),
(20, 'steam:11000010017dcc3', 'WEAPON_AssaultRifle', 2500);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `recolt`
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
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `coordinates`
--
ALTER TABLE `coordinates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `recolt`
--
ALTER TABLE `recolt`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `recolt`
--
ALTER TABLE `recolt`
  ADD CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
  ADD CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`);

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
