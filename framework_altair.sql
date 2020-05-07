-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 07 mai 2020 à 16:40
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `lastname`, `firstname`, `password`, `email`, `image`, `role`, `token`, `coach`) VALUES
(1, 'BARRET', 'J-C', '$2y$10$dwYaJp7Q0SPU9EMD9LdpHe7i74HUMQHPtcmZPK.0VB9WzP73Yoxb6', 'jcbarret@outlook.fr', 'sources/images/avatar/thumbs/lisplib_250.jpg', 'superAdmin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(5, 'LiSplib', 'JayCy', '$2y$10$BFQGRbyVLaV13NEF83TMNef9lE9aSYUVOltw.UagmwS1jWb.jevWu', 'test@test.fr', 'sources/images/avatar/thumbs/test_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(6, 'PAUL', 'Robert', '$2y$10$dmcv7K69HSUe9ZeMS51HSe/DgC4jadttquykL8nk8L4DK5QR3TiBW', 'hybridxp@hotmail.com', 'sources/images/avatar/thumbs/hybridxp_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(7, 'Lopsum', 'Lorem', '$2y$10$cWt9u9RNZgz8k5twqQThRu69hr2OZYNZ1YkFFgoWvcwgdp/wge64S', 'lorem@ipsum.com', 'sources/images/avatar/thumbs/lorem_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1),
(8, 'PIG', 'Peppa', '$2y$10$ANXncYmfKKmxJ9lTXUOLPe1tis2/4wa0fJCs5gOfYG9o6PmFYsqaK', 'peppa.pig@test.fr', 'sources/images/avatar/thumbs/peppa_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(9, 'BROS', 'Mario', '$2y$10$cL4FF4wowuZ7edkktFOmPeV15uY.GsBZ8OvJ.RdX2ruoXC7DD.ncq', 'mario@bros.fr', 'sources/images/avatar/thumbs/mario_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(10, 'Bunny', 'Bugs', '$2y$10$uLGMyAJvtQghlnZxizZ54uqqNvNt7AKkHRwVWBv68S9iq0UyibXWK', 'bugs@bunny.fr', 'sources/images/avatar/thumbs/bugs_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(11, 'MICHOU', 'Pierre', '$2y$10$ZH8dCUIxsSPCgEYbFDrhOOB54wamGDrr3kTcU3O4E0jBvIRQ1mQxK', 'pierrot@michou.fr', 'sources/images/avatar/thumbs/pierre_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(12, 'COUSCOUS', 'Taboulet', '$2y$10$ffJer.wMsDyuWYpiLyKOkeAoYxMkjJm9eURzRVwdygtYprgudpquW', 'couscous@taboulet.merguez', 'sources/images/avatar/thumbs/taboulet_250.jpg', 'admin', 'bdb8c008fa551ba75f8481963f2201da', 0),
(13, 'Hur', 'Ben', '$2y$10$RZCWadnzI0X7altLscJ/vOSCk4GRZ1.o0NYPAimA/kxtmx6uIiZHO', 'ben@hur.com', 'sources/images/avatar/thumbs/ben_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(14, 'Gilbert', 'Bruce', '$2y$10$pF0deTdz8J0uuTIyFPdWC.kxGgpU.yofWOM8DuN6qvfrFjfH4Y2i2', 'bruce@gilbert.com', 'sources/images/avatar/thumbs/bruce_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(15, 'PERRY', 'Jill', '$2y$10$RljDM6HoE8tn5NklDQsH7eU1jFTyTkjipWW.iIMii8l3LXFb4mjF2', 'jill@perry.fr', 'sources/images/avatar/thumbs/jill_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(16, 'SIMS', 'Taylor', '$2y$10$AiJCG083FRhQcN8cgLDjo.fPozkC8IZBWnex22Iecxv/wlqmt3SCO', 'taylor@sims.fr', 'sources/images/avatar/thumbs/taylor_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(17, 'Young', 'Eleanor', '$2y$10$gVnqe8Kr.hYmYlGSCXkVc.O2YwR59fowVeVvY94tVLUGlBp/SnFkK', 'eleanor@young.fr', 'sources/images/avatar/thumbs/eleanor_250.jpg', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1);

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
  `coachingDo` enum('coach professionnel de la personne','coach professionnel d’équipe & d’organisation','animateur co-développement professionnel','coach professionnel certifié «Talent»','coach professionnel superviseur') COLLATE utf8mb4_general_ci NOT NULL,
  `adherent` enum('SF Coach','EMCC','ICF','') COLLATE utf8mb4_general_ci NOT NULL,
  `coachingType` enum('coaching de dirigeant','coaching de grandes entreprises','coaching de PME','') COLLATE utf8mb4_general_ci NOT NULL,
  `categorie` enum('Coach COS','Superviseur COS','','') COLLATE utf8mb4_general_ci NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_id` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coaching`
--

INSERT INTO `coaching` (`id`, `coachingDo`, `adherent`, `coachingType`, `categorie`, `coach_id`) VALUES
(1, 'coach professionnel superviseur', 'SF Coach', 'coaching de dirigeant', 'Superviseur COS', 1),
(3, 'coach professionnel d’équipe & d’organisation', 'EMCC', 'coaching de PME', 'Coach COS', 9),
(4, 'coach professionnel d’équipe & d’organisation', 'ICF', 'coaching de grandes entreprises', 'Coach COS', 6);

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
(1, '#1a1a1a', '#1a1a1a', '#FFF', '1em', 'Roboto', '#ff999e', 'Taille', 'Police', 'Ombrage titre', 'none', 'Zoom', 'Effet Bouton');

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
  PRIMARY KEY (`id`),
  KEY `id_admin_created` (`id_admin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `start`, `end`, `id_admin`) VALUES
(1, 'Apéro', 'Allez viens tu verras on sera bien', '2020-03-28 18:45:00', '2020-03-28 20:45:00', 6),
(5, 'Soupe au pistou', 'dégustation', '2020-03-06 08:20:00', '2020-03-06 16:30:00', 6),
(9, 'Test', 'Pour voir', '2020-04-01 09:54:00', '2020-04-01 18:54:00', 6),
(10, 'Tabata', 'Entrainement', '2020-04-09 10:50:00', '2020-04-09 12:00:00', 6),
(11, 'Reprise', 'Ok', '2020-04-01 17:30:00', '2020-04-01 18:00:00', 6),
(12, 'Physique', 'Début des cours', '2020-04-01 08:00:00', '2020-04-01 08:30:00', 6),
(13, 'Bière-Pong', 'Tournoi', '2020-04-01 11:30:00', '2020-04-01 12:00:00', 6),
(14, 'aqua-poney', 'Des poneys une piscine, le reste...', '2020-04-01 13:30:00', '2020-04-01 14:00:00', 6),
(18, 'EPS', 'test', '2020-04-23 10:00:00', '2020-04-23 11:00:00', 1),
(19, 'Webinar Api', 'Introduction aux Api', '2020-04-30 10:00:00', '2020-04-30 12:00:00', 1),
(20, 'Gros couscous', 'Couscous, Tajine aux merguez', '2020-04-29 12:00:00', '2020-04-29 13:00:00', 12),
(21, 'Le soi', 'Introduction au soi', '2020-04-30 10:00:00', '2020-04-30 13:00:00', 9),
(22, 'Api', 'Api facebook', '2020-05-05 14:00:00', '2020-05-05 16:00:00', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(26, 'jcbarret@outlook.fr', '$2y$10$Bkkr/nMaG2Yj20ncQwaZJur4Tca4M1jqHNfGWOOKRj79McC9ytGfC', 'bdb8c008fa551ba75f8481963f2201da', '2020-03-19 14:52:52');

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
(13, 13);

-- --------------------------------------------------------

--
-- Structure de la table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_token_insta` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `long_token_fb` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `social_media`
--

INSERT INTO `social_media` (`id`, `long_token_insta`, `long_token_fb`) VALUES
(1, 'IGQVJXeDYwSHJOM1lFbkZAPdXpEODlZAYkdaVXd0TWltZAS11MGowcnJyM3I5SGJnZAzJkcVB3eFB3dXhmcy1EdTRCQXkwa1hiSkNOTWdXMXlHc0Q4c2I5ampZAaWNCVlRUanY4cjUyamJR', '');

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
