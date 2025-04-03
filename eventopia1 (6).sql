-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 02 avr. 2025 à 22:57
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eventopia1`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codePostal` int NOT NULL,
  `region` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `codePostal`, `region`) VALUES
(1, 1001, 'Tunis'),
(2, 2001, 'Sfax'),
(3, 1001, 'Tunis'),
(4, 2001, 'Sfax'),
(5, 1001, 'Tunis'),
(6, 2001, 'Sfax'),
(7, 1001, 'Tunis'),
(8, 2001, 'Sfax'),
(9, 15151515, 'test'),
(10, 5050, 'deubf'),
(11, 125555, 'tunis'),
(12, 22222, 'tunis'),
(13, 1222222, 'tunis '),
(14, 2323, 'tunis'),
(15, 6656566, 'tunis'),
(16, 2222222, 'tunis'),
(17, 25666, 'tunis '),
(18, 1212, 'tunis'),
(19, 121212, 'tunis '),
(20, 1111, 'tunis'),
(21, 202, 'tunis'),
(22, 12345, 'bouargoub'),
(23, 2224, 'TUNIS');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note` int NOT NULL,
  `date` date NOT NULL,
  `heur` time NOT NULL,
  `evenement_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_utilisateur_evenement` (`utilisateur_id`,`evenement_id`),
  KEY `fk_avis_evenement` (`evenement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `note`, `date`, `heur`, `evenement_id`, `utilisateur_id`) VALUES
(16, 3, '2025-03-02', '23:24:16', 73, 17),
(17, 3, '2025-03-04', '12:55:30', 73, 19);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_comment` date NOT NULL,
  `nbr_Likes` int NOT NULL,
  `time_comment` time NOT NULL,
  `evenement_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `nbr_Dislikes` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_commentaire_evenement` (`evenement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `comment`, `date_comment`, `nbr_Likes`, `time_comment`, `evenement_id`, `utilisateur_id`, `nbr_Dislikes`) VALUES
(25, 'good event', '2025-02-24', 15, '12:12:37', 73, 0, 11),
(26, 'bad event', '2025-02-24', 4, '12:12:47', 73, 0, 3),
(37, 'comment 1 test', '2025-02-28', 7, '17:27:55', 73, 3, 10),
(38, 'hello', '2025-02-28', 1, '17:54:24', 73, 3, 1),
(40, 'hey', '2025-02-28', 0, '22:15:57', 73, 3, 0),
(42, 'hello', '2025-03-02', 0, '22:41:02', 73, 3, 0),
(43, 'good event', '2025-03-02', 0, '23:20:27', 75, 17, 2),
(44, 'hello', '2025-03-02', 0, '23:20:49', 75, 17, 0),
(45, 'hey', '2025-03-03', 0, '01:19:09', 73, 17, 0),
(46, 'heyyyyyyyy', '2025-03-03', 0, '01:19:23', 73, 17, 0),
(47, 'heyyyyy', '2025-03-03', 0, '01:19:52', 73, 17, 0),
(48, 'cc', '2025-03-03', 0, '09:46:45', 73, 17, 0),
(49, 'cc', '2025-03-03', 0, '09:48:03', 73, 17, 0),
(50, 'hey', '2025-03-03', 1, '09:51:10', 73, 20, 1),
(51, 'ccccccccccc', '2025-03-03', 0, '09:53:28', 73, 20, 0),
(52, 'bad event', '2025-03-03', 0, '09:54:14', 73, 20, 0),
(53, 'cc ', '2025-03-03', 0, '12:31:05', 73, 17, 0);

-- --------------------------------------------------------

--
-- Structure de la table `comment_interaction`
--

DROP TABLE IF EXISTS `comment_interaction`;
CREATE TABLE IF NOT EXISTS `comment_interaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `commentaire_id` int NOT NULL,
  `interaction` enum('LIKE','DISLIKE') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_comment` (`utilisateur_id`,`commentaire_id`),
  UNIQUE KEY `unique_user_commentInteraction` (`utilisateur_id`,`commentaire_id`),
  KEY `commentaire_id` (`commentaire_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comment_interaction`
--

INSERT INTO `comment_interaction` (`id`, `utilisateur_id`, `commentaire_id`, `interaction`) VALUES
(22, 3, 37, 'DISLIKE'),
(15, 3, 26, 'LIKE'),
(30, 3, 25, 'LIKE'),
(18, 3, 38, 'DISLIKE'),
(32, 17, 25, 'DISLIKE'),
(33, 20, 50, 'DISLIKE'),
(34, 19, 26, 'LIKE'),
(35, 19, 37, 'DISLIKE');

-- --------------------------------------------------------

--
-- Structure de la table `espace`
--

DROP TABLE IF EXISTS `espace`;
CREATE TABLE IF NOT EXISTS `espace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `etat` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type_espace_id` int NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_espace` (`type_espace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `espace`
--

INSERT INTO `espace` (`id`, `nom`, `localisation`, `etat`, `type_espace_id`, `imageUrl`) VALUES
(11, 'dqs', 'dqzd', 'INDISPONIBLE', 58, ''),
(16, 'sdsq', 'sqdsd', 'INDISPONIBLE', 58, ''),
(17, 'sdq', 'qsx', 'INDISPONIBLE', 59, ''),
(22, 'nza,azaz', ',azfnlfzanz', 'INDISPONIBLE', 59, 'images/OIP (17).jpeg'),
(30, 'gamarth espace', 'tunis', 'INDISPONIBLE', 58, 'images/event.png');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date` date NOT NULL,
  `statut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `categorie` enum('Conference','Atelier','Seminaire') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL DEFAULT '0.00',
  `espace_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_espace` (`espace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `titre`, `description`, `date`, `statut`, `categorie`, `image`, `prix`, `espace_id`) VALUES
(73, 'farouk1', 'fezfzfz', '2025-02-14', 'En cours', 'Conference', 'images/R (8).jpeg', 20.70, 30),
(75, 'lora', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Nulla tristique velit eget massa condimentum, a convallis magna lacinia. Nunc et est id purus interdum vulputate. Curabitur pharetra urna et ante fermentum, a feugiat nulla sollicitudin. Sed ac venenatis risus. Etiam interdum magna ac odio fermentum, vel condimentum augue mollis. Aliquam erat volutpat. Sed non urna sed leo sollicitudin consequat id non nisi. Morbi sit amet risus libero. Suspendisse potenti. Cras maximus felis sit amet velit suscipit, eu accumsan elit laoreet.\n', '2025-01-30', 'En cours', 'Conference', 'images/OIP (16).jpeg', 80.00, 22),
(76, 'vida loca', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Nulla tristique velit eget massa condimentum, a convallis magna lacinia. Nunc et est id purus interdum vulputate. Curabitur pharetra urna et ante fermentum, a feugiat nulla sollicitudin. Sed ac venenatis risus. Etiam interdum magna ac odio fermentum, vel condimentum augue mollis. Aliquam erat volutpat. Sed non urna sed leo sollicitudin consequat id non nisi. Morbi sit amet risus libero. Suspendisse potenti. Cras maximus felis sit amet velit suscipit, eu accumsan elit laoreet.\n', '2025-01-29', 'Planifié', 'Conference', 'images/photographe_evenementiel_003.jpg', 0.00, 17),
(77, 'LAFFET', 'LAUREM IPSUM ', '2025-02-06', 'En cours', 'Atelier', 'images/OIP (18).jpeg', 25.00, 11),
(78, 'bora bora ', 'hiihiihi', '2025-03-12', 'En cours', 'Conference', 'images/OIP (16).jpeg', 180.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prix` float NOT NULL,
  `etat` enum('DISPONIBLE','INDISPONIBLE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_materiel_id` int DEFAULT NULL,
  `ImagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_materiel` (`type_materiel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id`, `nom`, `prix`, `etat`, `type_materiel_id`, `ImagePath`) VALUES
(23, 'sarsourr', 111, 'DISPONIBLE', 12, 'images/Screenshot_20220819-130012_Instagram.jpg'),
(24, 'testttttt', 111111, 'DISPONIBLE', 3, 'images/20221022_152119.jpg'),
(27, 'sarra', 1111, 'DISPONIBLE', 3, 'images/image1.png'),
(30, 'testttttttttt', 1111, 'DISPONIBLE', 3, 'images/image1.png'),
(36, 'llalalllaal', 1111, 'DISPONIBLE', 3, 'images/image1.png'),
(39, 'TTTTT', 1234, 'DISPONIBLE', 3, 'images/image1.png'),
(43, 'LKNBJCGHG', 555555, 'DISPONIBLE', 3, 'images/image1.png');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateur` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `materiel_id` int NOT NULL,
  `id_evenement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materiel_id` (`materiel_id`),
  KEY `fk_utilisateur` (`utilisateur`(250)),
  KEY `fk_evenement` (`id_evenement`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `utilisateur`, `date_debut`, `date_fin`, `materiel_id`, `id_evenement`) VALUES
(52, '19', '2025-03-05', '2025-03-12', 27, 73),
(51, '19', '2025-03-05', '2025-03-12', 24, 73),
(50, '19', '2025-03-05', '2025-03-11', 27, 73),
(49, '19', '2025-03-05', '2025-03-11', 24, 73);

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

DROP TABLE IF EXISTS `programme`;
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `heurDebut` time NOT NULL,
  `heurFin` time NOT NULL,
  `evenement_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programme_evenement` (`evenement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `programme`
--

INSERT INTO `programme` (`id`, `activite`, `heurDebut`, `heurFin`, `evenement_id`) VALUES
(31, 'hey', '12:20:20', '10:12:12', 73);

-- --------------------------------------------------------

--
-- Structure de la table `reply`
--

DROP TABLE IF EXISTS `reply`;
CREATE TABLE IF NOT EXISTS `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `feedback_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_id` (`feedback_id`),
  KEY `utilisateur_id` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `id_utilisateur` int NOT NULL,
  `id_evenement` int NOT NULL,
  `nombre_places` int NOT NULL,
  `date_reservation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `email`, `id_utilisateur`, `id_evenement`, `nombre_places`, `date_reservation`) VALUES
(1, 'john.doe@example.com', 1, 73, 2, '2025-02-21 23:00:00'),
(2, 'john.doe@example.com', 1, 75, 2, '2025-02-22 23:00:00'),
(3, 'john.doe@example.com', 1, 73, 2, '2025-02-23 23:00:00'),
(4, 'john.doe@example.com', 1, 73, 2, '2025-02-23 23:00:00'),
(5, 'cherni.anass02@gmail.com', 17, 73, 2, '2025-03-01 23:00:00'),
(6, 'cherni.anass02@gmail.com', 17, 73, 3, '2025-03-01 23:00:00'),
(7, 'saiflaffet001@gmail.com', 20, 73, 2, '2025-03-01 23:00:00'),
(8, 'saiflaffet001@gmail.com', 20, 73, 2, '2025-03-01 23:00:00'),
(9, 'saiflaffet001@gmail.com', 20, 73, 3, '2025-03-01 23:00:00'),
(10, 'saiflaffet001@gmail.com', 20, 73, 3, '2025-03-01 23:00:00'),
(11, 'saiflaffet001@gmail.com', 20, 73, 4, '2025-03-01 23:00:00'),
(12, 'cherni.anass02@gmail.com', 17, 75, 2, '2025-03-01 23:00:00'),
(13, 'omaraguil4@gmail.com', 21, 75, 2, '2025-03-01 23:00:00'),
(14, 'cherni.anass02@gmail.com', 17, 73, 12, '2025-03-02 23:00:00'),
(15, 'saiflaffet001@gmail.com', 20, 73, 2, '2025-03-02 23:00:00'),
(16, 'cherni.anass022@gmail.com', 19, 75, 2, '2025-03-02 23:00:00'),
(17, 'saiflaffet001@gmail.com', 20, 73, 2, '2025-03-03 23:00:00'),
(18, 'cherni.anass02@gmail.com', 17, 75, 2, '2025-03-03 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `type_espace`
--

DROP TABLE IF EXISTS `type_espace`;
CREATE TABLE IF NOT EXISTS `type_espace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_espace`
--

INSERT INTO `type_espace` (`id`, `type`, `description`) VALUES
(58, 'ss', 'ss'),
(59, 'aze', 'qsdsq');

-- --------------------------------------------------------

--
-- Structure de la table `type_materiel`
--

DROP TABLE IF EXISTS `type_materiel`;
CREATE TABLE IF NOT EXISTS `type_materiel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomM` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_materiel`
--

INSERT INTO `type_materiel` (`id`, `nomM`, `description`) VALUES
(3, 'micro', 'sans fils'),
(4, 'micro', 'sans fils'),
(5, 'micro', 'sans fils'),
(6, 'micro', 'sans fils'),
(7, 'micro', 'sans fils');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `role` enum('ADMIN','ORGANISATEUR','PARTICIPANT') NOT NULL,
  `adresse_id` int NOT NULL,
  `tel` varchar(15) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adresse_id` (`adresse_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `motDePasse`, `role`, `adresse_id`, `tel`, `email`, `imageUrl`) VALUES
(2, 'Samir', 'Ben Ali', 'pass456', 'PARTICIPANT', 4, '98765432', NULL, NULL),
(3, 'Fedi', 'Salah', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN', 5, '55512345', 'test@test.com', NULL),
(4, 'Samir', 'Ben Ali', 'pass456', 'PARTICIPANT', 6, '98765432', NULL, NULL),
(21, 'omar', 'aguil', '$2a$10$dm.8YMwWx0XyK6LNMPONrO/2Bpfl/o0a18Gw5rawTpqn2UAhwtc56', 'PARTICIPANT', 22, '98166256', 'omaraguil4@gmail.com', NULL),
(20, 'saif ', 'laffet', '$2a$10$ikXZvUPf7B3Cfvut0veEluYTMwpt03SIztpGZpk0/WBFbaGbzIRQa', 'PARTICIPANT', 21, '98166256', 'saiflaffet001@gmail.com', NULL),
(17, 'anas ', 'cherni ', '$2a$10$JRfV0d2o2TYV0hiL3FbL3.4SZGbkVLIqyR8JwCSwtzVTIfgIOo222', 'PARTICIPANT', 18, '98166256', 'cherni.anass02@gmail.com', NULL),
(22, 'laffet', 'said ', '$2a$10$E.0ykXlnKoOr8TOIApg8z.RXt0Cu3cJ7VcJT1C8PNAMRxgC.JYaSW', 'PARTICIPANT', 23, '98166256', 'kthiriyoussef09@gmail.com', NULL),
(19, 'anas ', 'cherni', '$2a$10$JVvaL8F6zwXM7Ez9aP/tQOdkVWZSY4fJaMrnTvXJOvzhRIne2WoiW', 'ORGANISATEUR', 20, '98166256', 'cherni.anass022@gmail.com', 'utilisateur_images/OIP (18).jpeg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `fk_avis_evenement` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_commentaire_evenement` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `espace`
--
ALTER TABLE `espace`
  ADD CONSTRAINT `fk_type_espace` FOREIGN KEY (`type_espace_id`) REFERENCES `type_espace` (`id`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fk_espace` FOREIGN KEY (`espace_id`) REFERENCES `espace` (`id`);

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `fk_programme_evenement` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
