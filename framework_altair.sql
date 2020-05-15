-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 15 mai 2020 à 14:47
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `framework_altair`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` text COLLATE utf8mb4_general_ci NOT NULL,
  `coach` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `lastname`, `firstname`, `password`, `email`, `image`, `role`, `token`, `coach`) VALUES
(1, 'BARRET', 'J-C', '$2y$10$dwYaJp7Q0SPU9EMD9LdpHe7i74HUMQHPtcmZPK.0VB9WzP73Yoxb6', 'jcbarret@outlook.fr', 'sources/images/avatar/thumbs/lisplib_250.jpg', 'superAdmin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(5, 'LiSplib', 'JayCy', '$2y$10$BFQGRbyVLaV13NEF83TMNef9lE9aSYUVOltw.UagmwS1jWb.jevWu', 'test@test.fr', 'sources/images/avatar/thumbs/test_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(6, 'PAUL', 'Robert', '$2y$10$dmcv7K69HSUe9ZeMS51HSe/DgC4jadttquykL8nk8L4DK5QR3TiBW', 'hybridxp@hotmail.com', 'sources/images/avatar/thumbs/hybridxp_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(7, 'LOPSUM', 'Lorem', '$2y$10$cWt9u9RNZgz8k5twqQThRu69hr2OZYNZ1YkFFgoWvcwgdp/wge64S', 'lorem@ipsum.com', 'sources/images/avatar/thumbs/lorem_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(8, 'PIG', 'Peppa', '$2y$10$ANXncYmfKKmxJ9lTXUOLPe1tis2/4wa0fJCs5gOfYG9o6PmFYsqaK', 'peppa.pig@test.fr', 'sources/images/avatar/thumbs/peppa_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(9, 'BROS', 'Mario', '$2y$10$cL4FF4wowuZ7edkktFOmPeV15uY.GsBZ8OvJ.RdX2ruoXC7DD.ncq', 'mario@bros.fr', 'sources/images/avatar/thumbs/mario_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(10, 'Bunny', 'Bugs', '$2y$10$uLGMyAJvtQghlnZxizZ54uqqNvNt7AKkHRwVWBv68S9iq0UyibXWK', 'bugs@bunny.fr', 'sources/images/avatar/thumbs/bugs_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(11, 'MICHOU', 'Pierre', '$2y$10$ZH8dCUIxsSPCgEYbFDrhOOB54wamGDrr3kTcU3O4E0jBvIRQ1mQxK', 'pierrot@michou.fr', 'sources/images/avatar/thumbs/pierre_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(12, 'COUSCOUS', 'Taboulet', '$2y$10$ffJer.wMsDyuWYpiLyKOkeAoYxMkjJm9eURzRVwdygtYprgudpquW', 'couscous@taboulet.merguez', 'sources/images/avatar/thumbs/taboulet_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(13, 'Hur', 'Ben', '$2y$10$RZCWadnzI0X7altLscJ/vOSCk4GRZ1.o0NYPAimA/kxtmx6uIiZHO', 'ben@hur.com', 'sources/images/avatar/thumbs/ben_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(14, 'Gilbert', 'Bruce', '$2y$10$pF0deTdz8J0uuTIyFPdWC.kxGgpU.yofWOM8DuN6qvfrFjfH4Y2i2', 'bruce@gilbert.com', 'sources/images/avatar/thumbs/bruce_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(15, 'PERRY', 'Jill', '$2y$10$RljDM6HoE8tn5NklDQsH7eU1jFTyTkjipWW.iIMii8l3LXFb4mjF2', 'jill@perry.fr', 'sources/images/avatar/thumbs/jill_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(16, 'SIMS', 'Taylor', '$2y$10$AiJCG083FRhQcN8cgLDjo.fPozkC8IZBWnex22Iecxv/wlqmt3SCO', 'taylor@sims.fr', 'sources/images/avatar/thumbs/taylor_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(17, 'YOUNG', 'Eleanor', '$2y$10$gVnqe8Kr.hYmYlGSCXkVc.O2YwR59fowVeVvY94tVLUGlBp/SnFkK', 'eleanor@young.fr', 'sources/images/avatar/thumbs/eleanor_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(18, 'BOULOT', 'Jules', '$2y$10$NiXMqyEwb9CGZ9K0Gw9PL..vvnb2vSQF8BF/.CACULaINhdKKXCsa', 'jules@boulot.fr', 'https://c.pxhere.com/photos/73/e2/person_male_man_beard_hipster_young_portrait_side_face-755410.jpg!d', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1);

-- --------------------------------------------------------

--
-- Structure de la table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE IF NOT EXISTS `admininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` enum('Auvergne-Rhône-Alpes','Bourgogne-Franche-Comté','Bretagne','Centre-Val de Loire','Corse','Grand Est','Hauts-de-France','Île-de-France','Normandie','Nouvelle-Aquitaine','Occitanie','Pays de la Loire','Provence-Alpes-Côte d''Azur','Guadeloupe','Martinique','Guyane','La Réunion','Mayotte') COLLATE utf8mb4_general_ci NOT NULL,
  `departement` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `societe` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `viadeo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `skype` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admininfo`
--

INSERT INTO `admininfo` (`id`, `region`, `departement`, `ville`, `telephone`, `adresse`, `societe`, `website`, `facebook`, `linkedin`, `viadeo`, `skype`, `id_admin`) VALUES
(1, 'Provence-Alpes-Côte d\'Azur', '83 Var', 'La Valette Du Var', '0606060606', 'chez moi', 'LiSp', '', 'https://www.facebook.com/jeanchristophe.lisplib', 'https://www.linkedin.com/in/jcbarret83160/', '', 'hybridxp@hotmail.com', 1),
(3, 'Provence-Alpes-Côte d\'Azur', '13  Bouches du Rhône', 'Marseille', '0606060606', 'mais t\'es ou', '', '', '', '', '', '', 6),
(4, 'Provence-Alpes-Côte d\'Azur', '83  Var', 'Toulon', '0610101010', 'Rue Picot', 'Peppa Coaching', '', '', '', '', '', 8),
(5, 'Provence-Alpes-Côte d\'Azur', '83 Var', 'Toulon', '0606060202', 'Champs de Mars', 'Supa Mario', 'en cours de réalisation', '', '', '', '', 9),
(6, '', '13 Bouches du Rhône', 'Marseille', '0606050606', 'la canebiere ', 'Couscous & co', 'https://couscous_cboncommelabas.fr', 'https://www.facebook.com/LeMediaPourTous/', '', '', 'couscous@skype.fr', 12),
(7, 'Provence-Alpes-Côte d\'Azur', '06  Alpes Maritimes', 'Cannes', '0706060606', '', 'Michou & Co', '', '', '', '', '', 11);

-- --------------------------------------------------------

--
-- Structure de la table `coaching`
--

DROP TABLE IF EXISTS `coaching`;
CREATE TABLE IF NOT EXISTS `coaching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coachingDo` enum('coach professionnel de la personne','coach professionnel d’équipe & d’organisation','animateur co-développement professionnel','coach professionnel certifié «Talent»','coach professionnel superviseur','coaching de dirigeant','coaching de grandes entreprises','coaching de PME') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `adherent` enum('SF Coach','EMCC','ICF','') COLLATE utf8mb4_general_ci NOT NULL,
  `categorie` enum('Coach COS','Superviseur COS','','') COLLATE utf8mb4_general_ci NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coaching`
--

INSERT INTO `coaching` (`id`, `coachingDo`, `adherent`, `categorie`, `coach_id`) VALUES
(1, 'coach professionnel superviseur', 'SF Coach', 'Superviseur COS', 1),
(3, 'coach professionnel d’équipe & d’organisation', 'EMCC', 'Coach COS', 9),
(4, 'coach professionnel d’équipe & d’organisation', 'ICF', 'Coach COS', 6),
(7, '', 'SF Coach', 'Superviseur COS', 1);

-- --------------------------------------------------------

--
-- Structure de la table `custom_site`
--

DROP TABLE IF EXISTS `custom_site`;
CREATE TABLE IF NOT EXISTS `custom_site` (
  `customSiteId` int(10) NOT NULL AUTO_INCREMENT,
  `backgroundColor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `boxBackgroundColor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `textColor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `textFontSize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `textFontFamily` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titleColor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titleFontSize` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titleFontFamily` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titleTextShadow` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `boxShadow` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `btnEffect` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`customSiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `custom_site`
--

INSERT INTO `custom_site` (`customSiteId`, `backgroundColor`, `boxBackgroundColor`, `textColor`, `textFontSize`, `textFontFamily`, `titleColor`, `titleFontSize`, `titleFontFamily`, `titleTextShadow`, `boxShadow`, `class`, `btnEffect`) VALUES
(1, '#1a1a1a', '#1a1a1a', '#FFF', 'Taille', 'Police', '#ff999e', 'Taille', 'Police', 'Ombrage titre', 'none', 'zoom15', 'Effet Bouton');

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `id_admin` int(11) NOT NULL,
  `theme` enum('Développement Personnel','Dirigeant','Grande Entreprise','PME') COLLATE utf8mb4_general_ci NOT NULL,
  `themeColor` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `urlImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isValide` tinyint(4) NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_admin_created` (`id_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `start`, `end`, `id_admin`, `theme`, `themeColor`, `urlImage`, `isValide`, `adress`, `zipcode`, `city`) VALUES
(1, 'Apéro', 'Allez viens tu verras on sera bien', '2020-03-28 18:45:00', '2020-03-28 20:45:00', 6, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(5, 'Soupe au pistou', 'dégustation', '2020-03-06 08:20:00', '2020-03-06 16:30:00', 6, 'PME', 'warning', '', 0, '', 0, ''),
(9, 'Test', 'Pour voir', '2020-04-01 09:54:00', '2020-04-01 18:54:00', 6, 'Dirigeant', 'success', '', 0, '', 0, ''),
(10, 'Tabata', 'Entrainement', '2020-04-09 10:50:00', '2020-04-09 12:00:00', 6, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(11, 'Reprise', 'Ok', '2020-04-01 17:30:00', '2020-04-01 18:00:00', 6, 'Grande Entreprise', 'primary', '', 0, '', 0, ''),
(12, 'Physique', 'Début des cours', '2020-04-01 08:00:00', '2020-04-01 08:30:00', 6, 'PME', 'warning', '', 0, '', 0, ''),
(13, 'Bière-Pong', 'Tournoi', '2020-04-01 11:30:00', '2020-04-01 12:00:00', 6, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(14, 'aqua-poney', 'Des poneys une piscine, le reste...', '2020-04-01 13:30:00', '2020-04-01 14:00:00', 6, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(18, 'EPS', 'test', '2020-04-23 10:00:00', '2020-04-23 11:00:00', 1, 'Dirigeant', 'success', '', 0, '', 0, ''),
(19, 'Webinar Api', 'Introduction aux Api', '2020-04-30 10:00:00', '2020-04-30 12:00:00', 1, 'Grande Entreprise', 'primary', '', 0, '', 0, ''),
(20, 'Gros couscous', 'Couscous, Tajine aux merguez', '2020-04-29 12:00:00', '2020-04-29 13:00:00', 12, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(21, 'Le soi', 'Introduction au soi', '2020-04-30 10:00:00', '2020-04-30 13:00:00', 9, 'Développement Personnel', 'danger', '', 0, '', 0, ''),
(22, 'Api', 'Api facebook', '2020-05-05 14:00:00', '2020-05-05 16:00:00', 1, 'Dirigeant', 'success', '', 0, '', 0, ''),
(23, 'La CNV', 'La Communication Non Violente\r\nCela permet d’améliorer les relations et de développer le plaisir d’échanger et de coopérer entre collaborateurs. ', '2020-05-20 16:00:00', '2020-05-20 18:00:00', 1, 'Grande Entreprise', 'primary', '', 0, '', 0, ''),
(24, 'Meeting Facebook', 'test', '2020-05-22 11:21:00', '2020-05-22 11:21:00', 1, 'PME', 'warning', '', 0, '', 0, ''),
(25, 'Bilan mensuel', 'On fait le bilan calmement', '2020-05-28 10:00:00', '2020-05-28 16:00:00', 1, 'Dirigeant', 'success', 'https://c.pxhere.com/photos/e6/87/stock_trading_monitor_desk_business_finance_exchange_investment-1170475.jpg!d', 0, '54 rue picot', 83000, 'Toulon'),
(26, 'Test validation évènement', 'Test ok', '2020-05-30 17:44:00', '2020-05-30 17:44:00', 1, 'Grande Entreprise', 'primary', 'https://c.pxhere.com/images/40/4f/802b1f1c7c4c215641d173548a54-1610907.jpg!d', 0, '', 0, ''),
(30, 'Webinar Relaxation', 'Détente et relaxation au menu', '2020-05-26 09:00:00', '2020-05-26 12:00:00', 1, 'Développement Personnel', 'danger', 'https://c.pxhere.com/photos/29/a3/cup_tee_teacup_glass_cup_spoon_sugar_sugar_lumps_sweet-911395.jpg!d', 1, ' 420 Avenue Gabriel Péri', 83160, 'La Valette du Var');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `history`
--

INSERT INTO `history` (`id`, `email`, `password`, `token`, `date`) VALUES
(2, 'jcbarret@outlook.fr', '$2y$10$i8cMHWb9KKRthBpXdOLsnucDrNg8uJ5aheJdvXEWGPkgZsNqA5qdi', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-17 15:29:43'),
(3, 'hybridxp@hotmail.com', '$2y$10$Lj3vL1WxAPCMbqBdI1G01ugkME6GhIBSmX.vAOzl.kr71.gk8I7g.', 'd68229f521316a03b517e42128c87060', '2020-03-17 15:42:30'),
(4, 'jcbarret@outlook.fr', '$2y$10$9F4954RRf/EoIubZO4bjQujtp1i.eQ19RJLZGRPr9vtaopbpaXX2y', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-17 17:06:11'),
(5, 'jcbarret@outlook.fr', '$2y$10$s/kGMQ8geqwk27MghIts2eoFJaD3faySZgMhVPtH/BvnjCcHrDLwe', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:41:53'),
(6, 'jcbarret@outlook.fr', '$2y$10$KbgnPOWagSglVyDpUfhOjOpeztjEOKA2PRXZiHhNKOV9gahVj59CO', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:52:10'),
(7, 'jcbarret@outlook.fr', '$2y$10$MqfVERL2Bthe46fp3jfN3.V5E0zoMzSD0yv0BQNv1FyVJm9Hd89Ya', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:53:19'),
(8, 'jcbarret@outlook.fr', '$2y$10$nrIYUOD9HIqJfyZX9A/ri.3/wYA5qwGtWSLc1KwmunDpMlbaM9wTi', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:53:55'),
(9, 'jcbarret@outlook.fr', '$2y$10$pWlOfiid9TqbEKwnsqRhKOmfUGTeaSESWBifsKXGLpCmFo7CJ4YwK', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:55:18'),
(10, 'jcbarret@outlook.fr', '$2y$10$GdgZ0mbNJcyzQN3gEYtVNeERe8.bThFjylPnZDfgzAB9TcmWodofO', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:55:46'),
(11, 'jcbarret@outlook.fr', '$2y$10$txAR0xOgSHvqqOqzxbAilO3EQkj1o4FsHigUD0s9quFjd2SrFZa9i', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:55:59'),
(12, 'jcbarret@outlook.fr', '$2y$10$0dVYyZM76aWnExmeVkVkjuKG.leiVNFKHv.lfWAry.CtnSHrYJ.WG', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:56:40'),
(13, 'jcbarret@outlook.fr', '$2y$10$nFnOgEWsA41rgJ/z.Fck5uYzp7N3aMmi/yS1f4oVWIIJHEvpcpKDu', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 08:59:48'),
(14, 'jcbarret@outlook.fr', '$2y$10$YKUlLBYb9CjCIO9/Mlbg4.QEIhhI9/i4ZBMy1nArcH9sB6bkicBWG', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 09:02:52'),
(15, 'jcbarret@outlook.fr', '$2y$10$4QYtIiXrFKaqiRBQM1mRA.yPkCah3yl2HwDVm7566u6WrGY4/Ol9G', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 09:03:31'),
(16, 'jcbarret@outlook.fr', '$2y$10$K6LO3D60Uk0ZLzOlmWYtEeuLuM/y1unymqdJJjHyPkQje/tb5rKLy', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 09:29:39'),
(17, 'jcbarret@outlook.fr', '$2y$10$Lzky0SYjHEILBinwML9GN.ZPM5IPhx1s54X6n1EVd3zJYD40X59PK', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 09:51:58'),
(18, 'hybridxp@hotmail.com', '$2y$10$Hs5kZ1Osqtam1OTSnTDrwe/LDGzlx1LaF39Q7zWdbN0gSlmvqWZ.6', 'd68229f521316a03b517e42128c87060', '2020-03-18 13:14:19'),
(19, 'jcbarret@outlook.fr', '$2y$10$75l4yvd3lujIl8HX7NghneaiGSs0KiyGItaMLNCs3PDb7H8NpXqoe', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 13:16:32'),
(20, 'jcbarret@outlook.fr', '$2y$10$AN8N8vm/c.qV9X.0Kn6R3.1FEKzM9THRn0mMen9S.bwgugO6zCJF6', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 13:34:49'),
(21, 'jcbarret@outlook.fr', '$2y$10$SEajOWlaElDu/ZHLjOCeeecjX5/tHdtaup50ChcAeEIv7GvR1ysQ.', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-18 18:15:23'),
(22, 'jcbarret@outlook.fr', '$2y$10$oVXi1pOs5uGVKY.hUDFBVuqH/aYUa5Z5pqDAs./8gn/0i2I9XkyhO', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 10:04:39'),
(23, 'jcbarret@outlook.fr', '$2y$10$YfYisa3./lNF.pnf3zma/.uMw1HvRWA2dUyjWUbDjtbon1Tmse8pu', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 10:14:24'),
(24, 'jcbarret@outlook.fr', '$2y$10$/ojK7iuCZqcMGqblzfBZeukMWCkrc2LbeFYjKW8Ic3pEQL.noSyiy', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 10:16:22'),
(25, 'jcbarret@outlook.fr', '$2y$10$vEe6Jl0jQ58FiBd.vRfTh.FuQ/S8Aitz37hl8LrUoqDveyjOheyce', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 11:30:22'),
(26, 'jcbarret@outlook.fr', '$2y$10$Bkkr/nMaG2Yj20ncQwaZJur4Tca4M1jqHNfGWOOKRj79McC9ytGfC', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 14:52:52'),
(265, 'jcbarret@outlook.fr', '$2y$10$TgEY64uw.SMWyNoZz6LL/ueG1.Bwk0I55VVZKrRVTz44M5C1CfBnK', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-15 08:47:48'),
(264, 'jcbarret@outlook.fr', '$2y$10$4CKMRgyHdWJhbUYDKEBmV.F9Qof5i2fr8OahgTg9JHYDFEGHbQCxi', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-15 08:46:40'),
(263, 'jcbarret@outlook.fr', '$2y$10$3PMnL6GD.s54eHR/Z.bUv.cH1ugH/TMEzcwJwb.YLp3GXDGXZCuVm', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-14 08:45:14'),
(262, 'jcbarret@outlook.fr', '$2y$10$ZFjBkvJvdQ0SqGYN5WAXM.Ha.IWp39W7fkNfxZA0LhmL9AZcolI5y', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 14:30:25'),
(261, 'jcbarret@outlook.fr', '$2y$10$zY6a.FsRReEAbV4Jxd5iNuRzA9LcZjgbhwQWaykrJL8mZZZRoTg.y', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 14:27:20'),
(260, 'jcbarret@outlook.fr', '$2y$10$rOcwAZ7xJRijgwsfVwLAL.n48Em69Em9MuaXS3FAf3nvJSF.2rina', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 13:53:26'),
(259, 'jules@boulot.fr', '$2y$10$zGX1jPeIiXER.dILhHld4e9l1nHegVD76eU9pLCjPqz7RATd3OEiW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 13:49:26'),
(258, 'taylor@sims.fr', '$2y$10$wsWAaQZUkeG7UWH.cGdj6uLSsRYAWwrUoE14nsDKZCrDsdfyRJTi2', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 13:46:47'),
(257, 'jcbarret@outlook.fr', '$2y$10$dTmGxER.o.7ZenZlFceLrOVo/AnkPJhXjjoVOTIMDM.SYoNrACwJu', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 10:46:29'),
(256, 'jcbarret@outlook.fr', '$2y$10$yNsIctysND1TrjF3R45LMeo9KQhg/5LRza1GEFuzJm3BurFmU7EP.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-13 08:59:53'),
(255, 'jcbarret@outlook.fr', '$2y$10$XnvOGoDD88a5pztvJWRG/ujGIZTIekNa5jDRi1O1xSZJlr0hGKW2u', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 20:14:12'),
(254, 'jcbarret@outlook.fr', '$2y$10$pIgwjcFLf/djnTPmVjaQa.xRu/h6NfEixFFtkd.KFMyC57XAbUV5a', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 10:14:36'),
(253, 'jules@boulot.fr', '$2y$10$gWJmgjpIlMMVl/.yZToXdetyiUbX21J7fd/X72PNo.ml/DjMs8u0i', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 10:13:41'),
(252, 'jcbarret@outlook.fr', '$2y$10$7kbId7qSNbJb/Waut0mX.uIuxUw/A/x72fv644dkLyElRYa5kY5F6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:52:59'),
(251, 'jcbarret@outlook.fr', '$2y$10$RILu2FQeW8o6yHZ9SBivP.I.Y5yDxV2T/Dk9MMlOOkC4ydXfVNbga', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:49:18'),
(250, 'jcbarret@outlook.fr', '$2y$10$4ENofYhTd.8dzzyjL2VdE.eZP/xlDZyrYVD3X7Ueo0ZbYGAJqqjjq', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:48:53'),
(249, 'bugs@bunny.fr', '$2y$10$J3P9LSgQ5Do47gw5uqdEP.tTga0qP//MROWkkRkgsXw14uo8WQ96W', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:47:58'),
(248, 'jcbarret@outlook.fr', '$2y$10$Gyiqtb2VSFx4P5xwloDGduRHv5B7j0FFHa0DDI7whwzrD5bNx0p1m', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:45:39'),
(247, 'jcbarret@outlook.fr', '$2y$10$5qLQdlHvdNxkPglDfKQ/reEd8xU8J./ZyKYbxIbQ8mQqZ1fuP4jlS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-12 09:01:08'),
(246, 'jcbarret@outlook.fr', '$2y$10$7UVtzd7BecSUNvSc9XSG8epcgHULmWS4WnTrTCZ8QVzbDJjvuelAi', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 17:06:35'),
(245, 'jcbarret@outlook.fr', '$2y$10$FPirLgW9MDy2BSY7InS/jOHOumSNNuR5nz7FbyH4MbDTjRIClsOzW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 15:38:41'),
(238, 'jcbarret@outlook.fr', '$2y$10$OksExhYkKseK.jw5/3PShuTpq1mEJFZed758sHmRJldOqOCrA2QkK', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-07 16:53:15'),
(239, 'jcbarret@outlook.fr', '$2y$10$a2144O9P1uJxWlFYoE5HCurS9T/cAGIezCazj0FGElvSga1yuXOMS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-08 17:50:39'),
(240, 'jcbarret@outlook.fr', '$2y$10$.LYVecx6VrroAunovqb7Aes6LIeZQNIrewHwK75JWCxrvih00eGqG', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-09 14:46:03'),
(241, 'jcbarret@outlook.fr', '$2y$10$RD4ecowdkrDYWHzqh8dRE.hU8hNr.8M3o7FZ91IfW/vfgxz94puo6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 08:55:04'),
(242, 'jcbarret@outlook.fr', '$2y$10$5nLmvYKLxp1ZyJ1drXMiku211h49Ty1/yR97jHi5fifwjdCGFM286', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 15:17:40'),
(243, 'jcbarret@outlook.fr', '$2y$10$9dluJ1X48c21SAJWYcPfZuQvIYvzMd8Iic8Ero69MF.V3S1NnJp4O', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 15:28:04'),
(244, 'jcbarret@outlook.fr', '$2y$10$cEfnceuFeZpti43VQu867Ok2z/FknORsr9REvCv4ffv.pisDchHSG', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 15:38:26');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `admin_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `events_id` (`events_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `register`
--

INSERT INTO `register` (`admin_id`, `events_id`) VALUES
(5, 9),
(5, 1),
(5, 5),
(5, 10),
(10, 19),
(10, 13),
(10, 10),
(5, 19),
(13, 19),
(13, 20),
(13, 10),
(13, 13),
(16, 25),
(16, 24),
(16, 23),
(18, 23),
(18, 24),
(18, 25);

-- --------------------------------------------------------

--
-- Structure de la table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_token_insta` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `long_token_fb` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `app_secret` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `social_media`
--

INSERT INTO `social_media` (`id`, `long_token_insta`, `long_token_fb`, `app_id`, `app_secret`) VALUES
(1, 'IGQVJXeDYwSHJOM1lFbkZAPdXpEODlZAYkdaVXd0TWltZAS11MGowcnJyM3I5SGJnZAzJkcVB3eFB3dXhmcy1EdTRCQXkwa1hiSkNOTWdXMXlHc0Q4c2I5ampZAaWNCVlRUanY4cjUyamJR', 'EAAkQ6FE7518BABqpoz1pZA8ynApbP9laLPJ9ESPL3AM3ZADJyU7xtIKXviPiKGOSZBvjfobJ50GgocIr8H3hb4UK80ArIsaxYQtjtZB22x2P9tSnDZArBjUMVyRF5ZC1dEie7fz5ZCGWWwsZCvaid9W9CpgKXXABYQy3oEenZAEUI4QZDZD', '2551864771733343', 'fe7b2802c990a277af929b85f8371486');

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` int(11) NOT NULL,
  `ref` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `votedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admininfo`
--
ALTER TABLE `admininfo`
  ADD CONSTRAINT `admininfo_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `coaching`
--
ALTER TABLE `coaching`
  ADD CONSTRAINT `coaching_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_events_id` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
