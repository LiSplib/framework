-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 30 mai 2020 à 20:02
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
CREATE DATABASE IF NOT EXISTS `framework_altair` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `framework_altair`;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(18, 'BOULOT', 'Jules', '$2y$10$NiXMqyEwb9CGZ9K0Gw9PL..vvnb2vSQF8BF/.CACULaINhdKKXCsa', 'jules@boulot.fr', 'https://c.pxhere.com/photos/73/e2/person_male_man_beard_hipster_young_portrait_side_face-755410.jpg!d', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1),
(19, 'Krapabelle', 'Yvonne', '$2y$10$SYr1tuLFs4a.XTxyZeN6/OZn2MdpKw8DYXWWOWomuDT8dUjydEkjO', 'Yvonne@krapabelle.fr', 'https://c.pxhere.com/photos/95/59/fitness_jump_health_woman_girl_healthy_fit_sportive-1103572.jpg!d', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1),
(20, 'Simpson', 'Bart', '$2y$10$DCF.HCC24GbGHvZHhYG7n./CnGabjS5sselUv.iknwNexHtSQ0K76', 'bart@simpson.fr', 'https://c.pxhere.com/photos/69/f2/person_man_male_portrait_head_face_side_face_hairstyle-883815.jpg!d', 'user', 'bdb8c008fa551ba75f8481963f2201da', 0),
(21, 'Horn', 'Mike', '$2y$10$4eLx8jeDIQ4OG.99R6MPz.6tElNDSmnaaiovg.SYF3CGAoMeysDdK', 'mike@horn.fr', 'https://c.pxhere.com/photos/c7/42/young_man_portrait_beard_young_man_male_handsome_young_man_handsome-1046502.jpg!d', 'user', 'bdb8c008fa551ba75f8481963f2201da', 1);

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
  `job` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `societe` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vimeo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `skype` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `google` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `snapchat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `soundcloud` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `spotify` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_admin` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admininfo`
--

INSERT INTO `admininfo` (`id`, `region`, `departement`, `ville`, `telephone`, `adresse`, `job`, `societe`, `website`, `facebook`, `linkedin`, `vimeo`, `skype`, `google`, `youtube`, `instagram`, `pinterest`, `snapchat`, `twitter`, `soundcloud`, `spotify`, `id_admin`) VALUES
(1, 'Provence-Alpes-Côte d\'Azur', '83 Var', 'La Valette Du Var', '0606060606', 'chez moi', 'Coach Master', 'LiSp', '', 'https://www.facebook.com/jeanchristophe.lisplib', 'https://www.linkedin.com/in/jcbarret83160/', '', 'hybridxp@hotmail.com', '', 'https://www.youtube.com/channel/UCKiHxUT7O3TMuhMYZivtEbw', '', '', '', '', '', '', 1),
(3, 'Provence-Alpes-Côte d\'Azur', '13  Bouches du Rhône', 'Marseille', '0606060606', 'mais t\'es ou', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 6),
(4, 'Provence-Alpes-Côte d\'Azur', '83  Var', 'Toulon', '0610101010', 'Rue Picot', '', 'Peppa Coaching', '', '', '', '', '', '', '', '', '', '', '', '', '', 8),
(5, 'Provence-Alpes-Côte d\'Azur', '83 Var', 'Toulon', '0606060202', 'Champs de Mars', '', 'Supa Mario', 'en cours de réalisation', '', '', '', '', '', '', '', '', '', '', '', '', 9),
(6, 'Provence-Alpes-Côte d\'Azur', '13  Bouches du Rhône', 'Marseille', '0606050606', 'la canebiere', '', 'Couscous &amp; co', 'https://couscous_cboncommelabas.fr', 'https://www.facebook.com/LeMediaPourTous/', '', '', 'couscous@skype.fr', '', '', '', '', 'https://www.snapchat.com/add/lisplib', '', '', 'https://open.spotify.com/user/1160451464?si=hJU_MOL0SASABnsLKt2yVg', 12),
(7, 'Provence-Alpes-Côte d\'Azur', '06  Alpes Maritimes', 'Cannes', '0706060606', '', '', 'Michou & Co', '', '', '', '', '', '', '', '', '', '', '', '', '', 11),
(8, 'Provence-Alpes-Côte d\'Azur', '13  Bouches du Rhône', 'Marseille', '0708090708', '10 rue Rousseau', '', 'Kraps', 'https://lacasadibino.000webhostapp.com/index.amp.html', 'https://www.facebook.com/gaelle.guido', '', '', '', '', '', '', '', '', '', '', '', 19),
(9, 'Provence-Alpes-Côte d\'Azur', '83  Var', 'Toulon', '0708090710', 'Place Besagne', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 10),
(10, 'Provence-Alpes-Côte d\'Azur', '83  Var', 'Toulon', '0708090711', 'Place Besagne', 'Coach', 'Include', 'https://lacasadibino.000webhostapp.com/index.amp.html', 'https://www.facebook.com/gaelle.guido', 'https://www.linkedin.com/company/frenchtechtoulon/', '', '', '', 'https://www.youtube.com/user/grafikarttv', 'https://www.instagram.com/aude_83160/', '', '', '', '', '', 17),
(11, 'Provence-Alpes-Côte d\'Azur', '13  Bouches du Rhône', 'Aubagne', '0708080907', '25 Rue Jeu de Ballon', 'Commercial', 'Disney', '', '', '', '', '', '', '', '', '', '', '', '', '', 5);

-- --------------------------------------------------------

--
-- Structure de la table `adminpro`
--

DROP TABLE IF EXISTS `adminpro`;
CREATE TABLE IF NOT EXISTS `adminpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intervention` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `training` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `publication` text COLLATE utf8mb4_general_ci NOT NULL,
  `interest` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quote` text COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adminpro`
--

INSERT INTO `adminpro` (`id`, `intervention`, `training`, `course`, `publication`, `interest`, `quote`, `admin_id`) VALUES
(1, 'Coaching d\'entreprise', 'BTS big mac', 'Mc do Sup', 'C\'est cool vive la frite et le ketchup', 'Escape game', 'Oublies que tu n\'as aucune chance sur un malentendu ça peut passer', 1),
(2, 'Carglass', 'Manouche niveau II', 'Math sup Math spé', 'lorem ispum', 'Yoga - danse - piano', 'I will survive', 17);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coaching`
--

INSERT INTO `coaching` (`id`, `coachingDo`, `adherent`, `categorie`, `coach_id`) VALUES
(1, 'coach professionnel superviseur', 'SF Coach', 'Superviseur COS', 1),
(3, 'coach professionnel d’équipe & d’organisation', 'EMCC', 'Coach COS', 9),
(4, 'coach professionnel d’équipe & d’organisation', 'ICF', 'Coach COS', 6),
(8, 'coaching de dirigeant', 'SF Coach', 'Superviseur COS', 17);

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
(1, '#1a1a1a', '#1a1a1a', '#FFF', 'Taille', 'Police', '#ff999e', 'Taille', 'Police', 'Ombrage titre', 'none', 'Zoom', 'Effet Bouton');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `start`, `end`, `id_admin`, `theme`, `themeColor`, `urlImage`, `isValide`, `adress`, `zipcode`, `city`) VALUES
(1, 'Apéro', 'Allez viens tu verras on sera bien', '2020-03-28 18:45:00', '2020-03-28 20:45:00', 6, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(5, 'Soupe au pistou', 'dégustation', '2020-03-06 08:20:00', '2020-03-06 16:30:00', 6, 'PME', 'warning', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(9, 'Test', 'Pour voir', '2020-04-01 09:54:00', '2020-04-01 18:54:00', 6, 'Dirigeant', 'success', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(10, 'Tabata', 'Entrainement', '2020-04-09 10:50:00', '2020-04-09 12:00:00', 6, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(11, 'Reprise', 'Ok', '2020-04-01 17:30:00', '2020-04-01 18:00:00', 6, 'Grande Entreprise', 'primary', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(12, 'Physique', 'Début des cours', '2020-04-01 08:00:00', '2020-04-01 08:30:00', 6, 'PME', 'warning', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(13, 'Bière-Pong', 'Tournoi', '2020-04-01 11:30:00', '2020-04-01 12:00:00', 6, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(14, 'aqua-poney', 'Des poneys une piscine, le reste...', '2020-04-01 13:30:00', '2020-04-01 14:00:00', 6, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(18, 'EPS', 'test', '2020-04-23 10:00:00', '2020-04-23 11:00:00', 1, 'Dirigeant', 'success', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(19, 'Webinar Api', 'Introduction aux Api', '2020-04-30 10:00:00', '2020-04-30 12:00:00', 1, 'Grande Entreprise', 'primary', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(20, 'Gros couscous', 'Couscous, Tajine aux merguez', '2020-04-29 12:00:00', '2020-04-29 13:00:00', 12, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(21, 'Le soi', 'Introduction au soi', '2020-04-30 10:00:00', '2020-04-30 13:00:00', 9, 'Développement Personnel', 'danger', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(22, 'Api', 'Api facebook', '2020-05-05 14:00:00', '2020-05-05 16:00:00', 1, 'Dirigeant', 'success', '', 0, '54 Rue Picot', 83000, 'Toulon'),
(23, 'La CNV', 'La Communication Non Violente\r\nCela permet d’améliorer les relations et de développer le plaisir d’échanger et de coopérer entre collaborateurs. ', '2020-05-20 16:00:00', '2020-05-20 18:00:00', 1, 'Grande Entreprise', 'primary', 'https://c.pxhere.com/photos/ec/f3/group_team_balloons_question_mark_problems_clouds_word_clouds_abstract-1333194.jpg!d', 0, '54 rue Picot', 83000, 'Toulon'),
(24, 'Meeting Facebook', 'test', '2020-05-22 11:21:00', '2020-05-22 11:21:00', 1, 'PME', 'warning', 'https://c.pxhere.com/photos/de/38/facebook_social_media_media_social_internet_network_blog_seo-1230789.jpg!d', 0, '54 rue Picot', 83000, 'Toulon'),
(25, 'Bilan mensuel', 'On fait le bilan calmement', '2020-05-28 10:00:00', '2020-05-28 16:00:00', 1, 'Dirigeant', 'success', 'https://c.pxhere.com/photos/e6/87/stock_trading_monitor_desk_business_finance_exchange_investment-1170475.jpg!d', 0, '54 rue picot', 83000, 'Toulon'),
(26, 'Test validation évènement', 'Test ok', '2020-05-30 17:44:00', '2020-05-30 17:44:00', 1, 'Grande Entreprise', 'primary', 'https://c.pxhere.com/images/40/4f/802b1f1c7c4c215641d173548a54-1610907.jpg!d', 0, '2 Boulevard Faidherbe', 13012, 'Marseille'),
(30, 'Webinar Relaxation', 'Détente et relaxation au menu', '2020-05-26 09:00:00', '2020-05-26 12:00:00', 1, 'Développement Personnel', 'danger', 'https://c.pxhere.com/photos/29/a3/cup_tee_teacup_glass_cup_spoon_sugar_sugar_lumps_sweet-911395.jpg!d', 0, ' 420 Avenue Gabriel Péri', 83160, 'La Valette du Var'),
(31, 'La résilience, un acte de transformation', 'Chaque individu est le produit d’une histoire dont il cherche à devenir le sujet. Cette histoire toujours complexe est façonnée par les influences multiples de l’environnement dans lequel chacun a vécu et vit. Influences sociales, familiales, psychologiques, économiques, politiques, culturelles… Impossible d’en faire une liste définitive, impossible de connaitre la chimie des interactions de toutes ces dimensions. A chacun, alors, d’inventer son chemin, de trouver sa place.\r\n\r\nLes chemins empruntés par la vie ne sont pas sans aléas. Le monde du travail ne fait pas exception. Les professionnels de l’accompagnement et du coaching en particulier en savent quelque chose. Leur écoute les confronte à de nombreuses situations professionnelles difficiles, et même parfois extrêmes, pour ceux qui y sont aux prises. Et, il n’est d’ailleurs pas rare que le coach en ait fait lui-même l’expérience. Face à ces situations, le travail du coach l’amène à aider les personnes à mobiliser des ressources de résistance ou encore de résilience. L’une et l’autre de ces notions méritent d’être distinguées.\r\n\r\nCet atelier se fonde sur le postulat que résistance et résilience impliquent une mobilisation particulière des ressources de la personne et, que cette mobilisation relève d’un acte de création. Résistance et résilience sont deux processus différenciés opérant ainsi de façon singulière. L’atelier permettra aux participants de les envisager, de s’approprier des « supports » adaptés et favorisant le travail de création. Les contenus de l’atelier mettront un éclairage spécifique sur le travail de la résilience pour montrer qu’il engage un processus de transformation que le coach peut faciliter.\r\n\r\nL’atelier propose d’aborder la résistance et la résilience dans le travail de création qu’elles partagent et, de mettre en évidence le travail de transformation auquel engage la résilience. Le rôle du coach professionnel dans ce travail sera au cœur des échanges.', '2020-05-27 14:00:00', '2020-05-27 16:00:00', 17, 'Développement Personnel', 'danger', 'https://c.pxhere.com/images/1c/ac/5dd0f1bf312a8d40a39b47e12c5b-1448601.jpg!d', 0, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(32, 'La résilience, un acte de transformation acte 2', 'La suite du premier évènement', '2020-05-29 10:00:00', '2020-05-29 14:00:00', 17, 'Développement Personnel', 'danger', 'https://c.pxhere.com/images/1c/ac/5dd0f1bf312a8d40a39b47e12c5b-1448601.jpg!d', 0, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(33, 'La résilience, un acte de transformation', 'Chaque individu est le produit d’une histoire dont il cherche à devenir le sujet. Cette histoire toujours complexe est façonnée par les influences multiples de l’environnement dans lequel chacun a vécu et vit. Influences sociales, familiales, psychologiques, économiques, politiques, culturelles… Impossible d’en faire une liste définitive, impossible de connaitre la chimie des interactions de toutes ces dimensions. A chacun, alors, d’inventer son chemin, de trouver sa place. Les chemins empruntés par la vie ne sont pas sans aléas. Le monde du travail ne fait pas exception. Les professionnels de l’accompagnement et du coaching en particulier en savent quelque chose. Leur écoute les confronte à de nombreuses situations professionnelles difficiles, et même parfois extrêmes, pour ceux qui y sont aux prises. Et, il n’est d’ailleurs pas rare que le coach en ait fait lui-même l’expérience. Face à ces situations, le travail du coach l’amène à aider les personnes à mobiliser des ressources de résistance ou encore de résilience. L’une et l’autre de ces notions méritent d’être distinguées. Cet atelier se fonde sur le postulat que résistance et résilience impliquent une mobilisation particulière des ressources de la personne et, que cette mobilisation relève d’un acte de création. Résistance et résilience sont deux processus différenciés opérant ainsi de façon singulière. L’atelier permettra aux participants de les envisager, de s’approprier des « supports » adaptés et favorisant le travail de création. Les contenus de l’atelier mettront un éclairage spécifique sur le travail de la résilience pour montrer qu’il engage un processus de transformation que le coach peut faciliter. L’atelier propose d’aborder la résistance et la résilience dans le travail de création qu’elles partagent et, de mettre en évidence le travail de transformation auquel engage la résilience. Le rôle du coach professionnel dans ce travail sera au cœur des échanges.', '2020-06-10 10:00:00', '2020-06-10 14:00:00', 17, 'Développement Personnel', 'danger', 'https://c.pxhere.com/images/1c/ac/5dd0f1bf312a8d40a39b47e12c5b-1448601.jpg!d', 0, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(34, 'La résilience, un acte de transformation acte 2', 'La suite du premier évènement', '2020-06-15 10:00:00', '2020-06-15 14:00:00', 17, 'Développement Personnel', 'danger', 'https://c.pxhere.com/images/1c/ac/5dd0f1bf312a8d40a39b47e12c5b-1448601.jpg!d', 1, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(35, 'La psychologie positive', 'L’idée que le bonheur serait commandable par la volonté, auparavant suspecte, est maintenant au centre de la psychologie positive, fondée par Martin Seligman à la fin des années 1990 et qui s’est propagée à force de conférences et de lobbying au sein de l’American Psychological Association. Cette idée, applicable par le coaching, a été intégrée au champ de la psychologie positive pour créer une base solide : en raison de son aspect scientifique, la psychologie positive lui apporte une légitimité théorique.\r\n\r\nL’intérêt est double : pour les psychologues, il s’agit de renouveler leur discipline et obtenir des financements de recherche ; pour les entreprises, il s’agit d’augmenter la productivité du travail et de reporter les contraintes du marché sur les employés. La « formule du bonheur » proposée par la psychologie positive est basée sur des postulats aisément compréhensibles : le bonheur est attribué pour 90% à des facteurs individuels et psychologiques et les facteurs non-individuels (circonstances) jouent un rôle insignifiant ; il peut être acquis, ce n’est qu’une question de volonté et de savoir-faire.', '2020-06-18 11:00:00', '2020-06-18 13:00:00', 17, 'Développement Personnel', 'danger', 'https://www.evenement.com/wp-content/uploads/2019/11/developpement-personnel-event-illus-1-768x512.jpg', 1, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(36, 'Meeting Facebook', 'Aujourd’hui, ce sont 80 millions des PME qui utilisent des pages Facebook à travers le monde, dont 1 million en France. Autant de PME qui misent régulièrement sur leurs clients et prospects locaux dans le but de créer des communautés locales.', '2020-06-11 10:00:00', '2020-06-11 15:00:00', 6, 'PME', 'warning', 'https://c.pxhere.com/photos/de/38/facebook_social_media_media_social_internet_network_blog_seo-1230789.jpg!d', 0, 'Avenue de l\'université', 83130, 'La Garde'),
(37, 'Coronavirus : quelles aides pour les micro-entreprises et les entreprises ?', 'Suites aux dernières mesures prises par le gouvernement face à l’épidémie du Coronavirus, micro-entreprises, startups et entreprises font face à de réelles difficultés dans l’exercice de leur activité. ', '2020-06-02 10:00:00', '2020-06-02 14:00:00', 6, 'PME', 'warning', 'http://www.43117.tl/var/tvt/storage/images/media/images/actualites/photo-1554415707-6e8cfc93fe23.jfif/172572-1-fre-FR/photo-1554415707-6e8cfc93fe23.jfif_full_news_43117.jpg', 0, 'Place Besagne', 83000, 'Toulon'),
(38, 'System Factory Day', 'Vous êtes une startup innovante sur les marchés des deep tech, blue tech ou green tech ? Participez à notre concours de pitchs : l\'occasion de vous présenter, de rencontrer des grands donneurs d\'ordre...', '2020-06-16 10:00:00', '2020-06-16 14:00:00', 6, 'Grande Entreprise', 'primary', 'https://c.pxhere.com/photos/84/0f/distribution_center_distribution_logistics_logistics_platform_logistics_building_barn-663063.jpg!s', 0, 'Place Besagne', 83000, 'Toulon'),
(39, 'La psychologie positive', 'L’idée que le bonheur serait commandable par la volonté, auparavant suspecte, est maintenant au centre de la psychologie positive, fondée par Martin Seligman à la fin des années 1990 et qui s’est propagée à force de conférences et de lobbying au sein de l’American Psychological Association. Cette idée, applicable par le coaching, a été intégrée au champ de la psychologie positive pour créer une base solide : en raison de son aspect scientifique, la psychologie positive lui apporte une légitimité théorique. L’intérêt est double : pour les psychologues, il s’agit de renouveler leur discipline et obtenir des financements de recherche ; pour les entreprises, il s’agit d’augmenter la productivité du travail et de reporter les contraintes du marché sur les employés. La « formule du bonheur » proposée par la psychologie positive est basée sur des postulats aisément compréhensibles : le bonheur est attribué pour 90% à des facteurs individuels et psychologiques et les facteurs non-individuels (circonstances) jouent un rôle insignifiant ; il peut être acquis, ce n’est qu’une question de volonté et de savoir-faire.', '2020-05-22 16:00:00', '2020-05-22 18:00:00', 17, 'Développement Personnel', 'danger', 'https://www.evenement.com/wp-content/uploads/2019/11/developpement-personnel-event-illus-1-768x512.jpg', 0, '2 rue Hippolyte Duprat', 83000, 'Toulon'),
(40, 'Webinar Relaxation', 'Le mauvais est un véritable ennemi capable de menacer votre santé. Stop ! Apprenez à vous détendre. découvrez les principales techniques de relaxation ainsi que les secrets de nos experts pour retrouver calme et sérénité !', '2020-06-17 14:00:00', '2020-06-17 18:00:00', 1, 'Développement Personnel', 'danger', 'https://c.pxhere.com/photos/29/a3/cup_tee_teacup_glass_cup_spoon_sugar_sugar_lumps_sweet-911395.jpg!d', 1, '420 Avenue Gabriel Péri', 83160, 'La Valette du Var');

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
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(268, 'jcbarret@outlook.fr', '$2y$10$FrbNJt3MZ9RXKXf76BDRJOaSFdlI9pmv5Xv/vo2UJ9GAPrAigefLi', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-18 08:52:37'),
(267, 'eleanor@young.fr', '$2y$10$M0MH188SSX3DSd1FT1gHNe8W6ed8ZQ6Fgzz7dWOGVxnxpaqGDwh/K', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-15 15:59:32'),
(266, 'jules@boulot.fr', '$2y$10$CcsaFd0eE.vL6wCXek5.oOYo3XoZYXi/6VTEAHOO.1AOgWN9Mx1ti', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-15 15:56:26'),
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
(244, 'jcbarret@outlook.fr', '$2y$10$cEfnceuFeZpti43VQu867Ok2z/FknORsr9REvCv4ffv.pisDchHSG', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-11 15:38:26'),
(294, 'jcbarret@outlook.fr', '$2y$10$9F93tUU9pXQlINuE4K2Nweo0yuKF2scwHis6Yg/PHBgoaZxpE9f0q', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 12:23:26'),
(293, 'jcbarret@outlook.fr', '$2y$10$0L/m3Mc2dryUrQ7/1MmwNu3STsJgwVneb/3JjUJYr09g8CDMbR3be', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 11:14:03'),
(292, 'jcbarret@outlook.fr', '$2y$10$VxDH/U.rpqoJcKDgVMgolu.FkZg/28XB9LvZdr/5B2EEbJJFJ2f2K', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 11:12:45'),
(291, 'jcbarret@outlook.fr', '$2y$10$XNeQrKlfwiOvKIRhv1CdRu7ipsRI48vmvEu/b5n8Y9uNHnm9AjQpm', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 11:12:21'),
(290, 'jcbarret@outlook.fr', '$2y$10$diKh9W7s0hy3TsJ8z3eBSO/gJ0gl.LJfGMKHxRLvR2bK52aH1W9d2', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 10:30:47'),
(289, 'jules@boulot.fr', '$2y$10$LDtsqY5qiCU/3Fo8CizvQudcfU8Lz6XINXoV5/Ua.XTto5k1gmN2.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 09:59:20'),
(288, 'jcbarret@outlook.fr', '$2y$10$Qo.C2qRm.kdbobtl/xSFk.hKZlwxlPFpyHCI0TbhG0L9u0lfo3ntG', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 09:27:40'),
(287, 'eleanor@young.fr', '$2y$10$30NcVCGebXm12o839wpLGOe2JNScDtwP4NkroIT9WsPunDArWnera', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-21 16:29:43'),
(286, 'jcbarret@outlook.fr', '$2y$10$HQ8HBpbHeUw8PwXK7G6hLe9LFzH8yrLNpO6sVhnEmvA92/qg2r5Ya', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-21 09:18:52'),
(285, 'eleanor@young.fr', '$2y$10$OTtMjoKGbe4peqzAZOpn7uoOsljHpn5gJt15enwjT9XioMpI5m89O', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 18:03:00'),
(284, 'eleanor@young.fr', '$2y$10$exSCLAGOu6X/nrKJPWN0ZedkacHSJY1XNPbZitAGAZ0xiEt83iawa', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 18:01:36'),
(283, 'jcbarret@outlook.fr', '$2y$10$iSwUWLxdN9X6mDoxWhdKYu8zn60eV0vkWJ3KcCmzelMxa2I0cHyPO', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 16:01:43'),
(282, 'eleanor@young.fr', '$2y$10$eiiZwWT1f8v6j91dSsjW2ebqVY4xQ1Op0Q7b7Caj19lbEdz8Jq01O', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 15:47:26'),
(281, 'eleanor@young.fr', '$2y$10$JaRBRw4dr5BODeAhKw6UtetmhtHupljL4JyUCAf/Oaq6G6egY2.f.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 10:59:26'),
(280, 'test@test.fr', '$2y$10$JbUYNOQnjCIDYFFK4f5fCOUvu5tiiBqW2.8/BFHX10eR9tzeOcX36', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 10:52:13'),
(279, 'hybridxp@hotmail.com', '$2y$10$7WDlsZfwdVLm1s65iWuPk.ZeAL2UfkrGdPPdw9OPJxeQ20AHYA9S.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 10:51:22'),
(278, 'jcbarret@outlook.fr', '$2y$10$SercU0lO34gxwR./4dbjaexq0NqptiMS9VItZY/LTl6SBz4iTs2Bu', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-20 08:37:54'),
(269, 'eleanor@young.fr', '$2y$10$6W0/Ml/BUw/YEJlS/t1TzuZ5ssUZE1EAYZrA0zwheXD1QY1.R.S8u', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-18 09:33:31'),
(270, 'test@test.fr', '$2y$10$KQKd7SrTMflHewO9yRiYLOnXOZ3sf1SQMlQ3AjrmyzidDN9ZYDnfS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-18 09:34:22'),
(271, 'jcbarret@outlook.fr', '$2y$10$YvfWlrhvBqIDivgyFuZgku6boIRdaFR0Ty/6hVPb7ICPx49MiNuQe', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-18 13:17:35'),
(272, 'eleanor@young.fr', '$2y$10$y3D2uScBbk9.iqVSKyXJR.zU6zWd06zzQV89aliUH0QITOwfeRAfq', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-18 16:00:21'),
(273, 'jcbarret@outlook.fr', '$2y$10$7.H3ySI8snDi0.DEDD23dO4kDS/0AjFNq6GyzPe7MJ9dUnuR2EasS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-19 08:55:44'),
(274, 'eleanor@young.fr', '$2y$10$d6uXWrdJzxdEXC03kujCweXE8HRjgi6KnVHv4mEdZTCY6IKIx9xju', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-19 09:08:21'),
(275, 'test@test.fr', '$2y$10$jmbsxkVJn16Rimy9Qpijh.J7U2oWPd3Sb2EAHMbbwzr.3i7NQBwSy', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-19 09:08:49'),
(276, 'eleanor@young.fr', '$2y$10$fwkE368AyeYC2wQMNS/tcO6ExKLi2ivoJv7mStltGw9usDWNMbXHW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-19 15:40:08'),
(277, 'hybridxp@hotmail.com', '$2y$10$410qxP4gsSDeJJxlN7z4mOjX8g29Q651piIuXuUohnv/2mX34PAoS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-19 16:21:12'),
(314, 'jcbarret@outlook.fr', '$2y$10$XGQ8bHa/1ay1o4Akb6RSCuafLN2cX5Pw.TJ0nad7b/eQHccuWJL9K', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 12:35:27'),
(313, 'bugs@bunny.fr', '$2y$10$.95xIFZRh7ypFmqKSpIxCOzpHmM89CBwuTc9hp75J6ZJX50cC.7n6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 11:38:29'),
(312, 'couscous@taboulet.merguez', '$2y$10$lwPiSIAHbPkHAGdY3DO4eeAS.QBvyo9c8a43Pw.k0mCgREqbD/jny', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 08:49:31'),
(311, 'jcbarret@outlook.fr', '$2y$10$7TFuL.tg3efoSs01yIz8teq4Rz9iqFq1Nk6pL0p/hHGNt1NnZ2Ld6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 08:45:37'),
(310, 'Yvonne@krapabelle.fr', '$2y$10$NtKa9LgSdaeA0lKXA6tc/.YHSA6o4l03toibRqrpCWujQ4gfj4HJ2', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 08:37:50'),
(309, 'jcbarret@outlook.fr', '$2y$10$Cbkv1RqF.UZWZv9Hyzz9EOgmLkqxptqoidzwAqpm7nCbGvCJnuxcW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 08:26:56'),
(308, 'jcbarret@outlook.fr', '$2y$10$m4p2.18TY30EXQlF2MICfufIehteLSOnp2YSDvKy2sayZG.ntt0eK', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-24 17:02:41'),
(307, 'jcbarret@outlook.fr', '$2y$10$Oq6CQvAIt9TdjDPfZYnMaek321pKC2.5487O1qSu9DlwLJ8FW7Q1S', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-24 16:08:26'),
(306, 'jcbarret@outlook.fr', '$2y$10$O3Ptv.mOIM6RLboP3N8HlucR5TDMUTY0M3kGb7.dPz4SnbkYSokgK', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-24 16:05:52'),
(305, 'jcbarret@outlook.fr', '$2y$10$HHfw0P0Ie9DyyBEuh.hO3uTJMonTO/5URificLOfq/zwON40iCVd.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-24 16:05:14'),
(304, 'jcbarret@outlook.fr', '$2y$10$bRM29tEV.mofQG3sEn9ihOG4RJLM.ZKCi2WN1v86dDUQJWKSQEjOm', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-24 15:12:29'),
(303, 'Yvonne@krapabelle.fr', '$2y$10$gGRIaUnrZcwKAdyFhs/84epJax4wvrt.S5C5qiskftv1k4j.k5eTW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-23 17:08:09'),
(302, 'jcbarret@outlook.fr', '$2y$10$6IMYSWS/PXQuivfGsre4COoYIATttVFjCUyqOAARkLRcq6u9HQCRu', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-23 15:29:36'),
(295, 'eleanor@young.fr', '$2y$10$cmckLswYIYfKfKNB0yHL1O90p09JqYxg7GTiT0lOaszjtG9AFapca', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 14:56:47'),
(296, 'jcbarret@outlook.fr', '$2y$10$lNxtaRLmJCX9fwvczNS3Z.VxR6h4krqe4mLW2EdMZfZenKKCtwmhu', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 15:07:25'),
(297, 'jcbarret@outlook.fr', '$2y$10$pFF92uIaS197xwRu8o45ne8WIDGYo.4zB1D4it9AXgfzo/ssSRwPK', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 15:10:09'),
(298, 'jcbarret@outlook.fr', '$2y$10$akaJpV5lKPfoO0SuN8MMy.xy7UarPMQU0EDbr/AiLmGFuLBqjB9p2', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 15:10:31'),
(299, 'test@test.fr', '$2y$10$hSNf4Y/t06ADgdAe9SpWxu6GPPyODOQlfDLowomX9hlOrH/9PuVV6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 16:08:52'),
(300, 'couscous@taboulet.merguez', '$2y$10$Z5A4.MZ7ZkFoj6Fvnk6PfudIZLdWSbRiK77gBPYx7cJZxiJyzFAh6', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 16:09:27'),
(301, 'peppa.pig@test.fr', '$2y$10$YPD6RM1GdXvomC.iavUNf.XGOQZvmpkFvgz4MBnTl5SPwHSoKLHLW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-22 16:26:26'),
(330, 'couscous@taboulet.merguez', '$2y$10$txffO7zpPGVIKPlS8yJgn.VIwVOr66kMiSzfhE5YRDKiBOcHWqssm', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-29 12:05:07'),
(329, 'couscous@taboulet.merguez', '$2y$10$oOblF0UBEBGaO9Ekjs0gJeIWFnjxx5Xe4GViXuLxWF2EXNMRywkGy', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-29 11:38:31'),
(328, 'eleanor@young.fr', '$2y$10$jmyeMopop3bL.EyD4FggcOmcUnlBWqfPCWAed7dcXVXWEYD.vQ/AG', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-29 09:08:55'),
(327, 'jcbarret@outlook.fr', '$2y$10$ZFKSpFjjDRnnAsCZFpYypOTDny1r476W2Ef2OKZZ/dK/USz6lt5dS', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-29 08:53:04'),
(326, 'test@test.fr', '$2y$10$I6VuoOLr/0N8b//ymvDZ8ejoXfw0JtbdWySQbDiQ9KHPX5.zDWL36', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-28 15:07:33'),
(325, 'eleanor@young.fr', '$2y$10$MfzuhAft//hqQpUaWUNjfu5dHvOMkJGOlbmQc1dO.bF/ueXcBNHi.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-28 14:42:01'),
(315, 'jcbarret@outlook.fr', '$2y$10$91/NWXE25Abbn0F4rr/i4eBWNplYC5NY.G88l29F7eZ9wveHHRYja', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-25 12:41:44'),
(316, 'jcbarret@outlook.fr', '$2y$10$tJh11N8Kt6.YTmQGbWzsj.GhcSyne..NP0wpsIEPTUJFCaL/doBi.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-26 09:02:19'),
(317, 'bart@simpson.fr', '$2y$10$3aOElEQ5ZMGpjvihOEyYh.CcznX/IkFy5RdCXHQ0p8nBBfAFDR5vW', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-26 09:37:06'),
(318, 'jcbarret@outlook.fr', '$2y$10$y0Nw2ffSqoZkxGacPFkNpOhKtG0k8WNB0grX5lvK97SAfCkn7JKOi', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-27 08:59:35'),
(319, 'mike@horn.fr', '$2y$10$0AlEGWkSRQMHhRGlEtXmQuhFXyuvPsuIWzM2mf0wRmkU3hUJtaQ5W', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-27 09:16:08'),
(320, 'mike@horn.fr', '$2y$10$ltoZRRweABRAPsgAowXkYuHFCHQDNVyFIXR6.0tib3QqLWYoycrm2', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-27 09:38:22'),
(321, 'jcbarret@outlook.fr', '$2y$10$UdD56ltAAsteuC8fGADojOXsjjzmi.g4u.m5NPOFcXry6pBFrNP/.', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-27 10:14:31'),
(322, 'jcbarret@outlook.fr', '$2y$10$7Odk.hMkcLfIsNEyY6UzzO5KuEch73ntypBMnQzPB/58ZquB34JZC', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-28 09:06:20'),
(323, 'jcbarret@outlook.fr', '$2y$10$QBbi5mJz6Y3oL9ca/2iamO9Lo77oxfLqQRGjjb1AI9/os55s3lF9m', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-28 10:20:58'),
(324, 'jcbarret@outlook.fr', '$2y$10$qVufrQQaMTVhyDlKERlrD.TeNqRkmrOO67IuG8XustC/88gAaKcvm', 'bdb8c008fa551ba75f8481963f2201da', '2020-05-28 11:40:02');

-- --------------------------------------------------------

--
-- Structure de la table `interested`
--

DROP TABLE IF EXISTS `interested`;
CREATE TABLE IF NOT EXISTS `interested` (
  `admin_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `events_id` (`events_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `interested`
--

INSERT INTO `interested` (`admin_id`, `events_id`) VALUES
(5, 30),
(5, 26),
(1, 31);

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
(18, 25),
(5, 31),
(5, 23),
(18, 26),
(18, 32),
(17, 26),
(10, 37),
(10, 36);

-- --------------------------------------------------------

--
-- Structure de la table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_token_insta` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nextTokenDate` date NOT NULL,
  `long_token_fb` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `app_secret` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `social_media`
--

INSERT INTO `social_media` (`id`, `long_token_insta`, `nextTokenDate`, `long_token_fb`, `app_id`, `app_secret`) VALUES
(1, 'IGQVJYNWZAHNnhWZA3RqaEt5QVlSaURMUkc4bVRMSTdLY2NUbXQyUHZAWckJ0Q2lJbTJmWGpGN0hlc0x6RklSSUN0NXNjTVlpRmpYRW5qQm5rNUVUSV81UzZAiVFQ3Y04xTk5QRXVLYjFR', '2020-07-23', 'EAAkQ6FE7518BABqpoz1pZA8ynApbP9laLPJ9ESPL3AM3ZADJyU7xtIKXviPiKGOSZBvjfobJ50GgocIr8H3hb4UK80ArIsaxYQtjtZB22x2P9tSnDZArBjUMVyRF5ZC1dEie7fz5ZCGWWwsZCvaid9W9CpgKXXABYQy3oEenZAEUI4QZDZD', '2551864771733343', 'fe7b2802c990a277af929b85f8371486');

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
-- Contraintes pour la table `adminpro`
--
ALTER TABLE `adminpro`
  ADD CONSTRAINT `adminpro_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Contraintes pour la table `interested`
--
ALTER TABLE `interested`
  ADD CONSTRAINT `interested_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `interested_ibfk_2` FOREIGN KEY (`events_id`) REFERENCES `events` (`id`);

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
