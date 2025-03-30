/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS `corbeau`;
CREATE DATABASE `corbeau` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `corbeau`;



CREATE TABLE `consultation` (
  `consultation` int UNSIGNED NOT NULL,
  `patient` varchar(128) NOT NULL,
  `docteur` varchar(128) NOT NULL,
  `date` date NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `diagnostic` (
  `consultation` int UNSIGNED NOT NULL,
  `trouble` varchar(128) NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `hospitalisation` (
  `consultation` int UNSIGNED NOT NULL,
  `entrée` date NOT NULL,
  `sortie` date DEFAULT NULL,
  `lit` int UNSIGNED NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Calendrier d''occupation des lits de l''hôpital de Saint-Robin';


CREATE TABLE `indication` (
  `trouble` varchar(128) NOT NULL,
  `spécialité` varchar(128) NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `travail` (
  `id_travail` int UNSIGNED NOT NULL,
  `nom_travail` varchar(128) NOT NULL,
  `site` varchar(128) DEFAULT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `lettre` (
  `lettre` int UNSIGNED NOT NULL,
  `destinataire` varchar(128) DEFAULT NULL,
  `date` date NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `emprunt` (
  `emprunt` smallint UNSIGNED NOT NULL,
  `personne` varchar(128) NOT NULL,
  `montant` decimal(13,2) UNSIGNED NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_rendu` date DEFAULT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Emprunts contractés par Rolande';


CREATE TABLE `amants` (
  `personne_1` varchar(128) NOT NULL,
  `personne_2` varchar(128) NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `personne` (
  `personne` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sexe` enum('M','F') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `âge` tinyint DEFAULT NULL,
  `id_travail` int UNSIGNED DEFAULT NULL,
  `complément` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numéro` tinyint DEFAULT NULL,
  `voie` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pratiquant` tinyint(1) DEFAULT NULL,
  `date_décès` date DEFAULT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `prescription` (
  `consultation` int UNSIGNED NOT NULL,
  `spécialité` varchar(128) NOT NULL,
  `durée` int UNSIGNED NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `relation` (
  `personne_1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nature` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `personne_2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `fragment` (
  `fragment` int UNSIGNED NOT NULL,
  `texte` varchar(1024) NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `spécialité` (
  `spécialité` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stock` int UNSIGNED DEFAULT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `site` (
  `site` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numéro` tinyint DEFAULT NULL,
  `voie` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `assistance` (
  `date` date NOT NULL,
  `personne` varchar(128) NOT NULL,
  `hash` bigint UNSIGNED NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



ALTER TABLE `consultation`
  ADD PRIMARY KEY (`consultation`),
  ADD KEY `patient` (`patient`),
  ADD KEY `docteur` (`docteur`);

ALTER TABLE `diagnostic`
  ADD PRIMARY KEY (`consultation`,`trouble`),
  ADD KEY `diagnostic` (`consultation`),
  ADD KEY `trouble` (`trouble`);

ALTER TABLE `hospitalisation`
  ADD PRIMARY KEY (`consultation`);

ALTER TABLE `indication`
  ADD PRIMARY KEY (`trouble`,`spécialité`),
  ADD KEY `spécialité` (`spécialité`);

ALTER TABLE `travail`
  ADD PRIMARY KEY (`id_travail`),
  ADD KEY `site` (`site`);

ALTER TABLE `lettre`
  ADD PRIMARY KEY (`lettre`),
  ADD KEY `destinataire` (`destinataire`);

ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`emprunt`),
  ADD KEY `personne` (`personne`);

ALTER TABLE `amants`
  ADD PRIMARY KEY (`personne_1`,`personne_2`),
  ADD KEY `personne_2` (`personne_2`);

ALTER TABLE `personne`
  ADD PRIMARY KEY (`personne`),
  ADD KEY `id_travail` (`id_travail`);

ALTER TABLE `prescription`
  ADD PRIMARY KEY (`consultation`,`spécialité`),
  ADD KEY `spécialité` (`spécialité`);

ALTER TABLE `relation`
  ADD PRIMARY KEY (`personne_1`,`nature`,`personne_2`),
  ADD KEY `name_2` (`personne_2`);

ALTER TABLE `fragment`
  ADD PRIMARY KEY (`fragment`);

ALTER TABLE `spécialité`
  ADD PRIMARY KEY (`spécialité`);

ALTER TABLE `site`
  ADD PRIMARY KEY (`site`);

ALTER TABLE `assistance`
  ADD PRIMARY KEY (`personne`,`date`);

-- FK

ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`patient`) REFERENCES `personne` (`personne`),
  ADD CONSTRAINT `consultation_ibfk_4` FOREIGN KEY (`docteur`) REFERENCES `personne` (`personne`);

ALTER TABLE `diagnostic`
  ADD CONSTRAINT `diagnostic_ibfk_1` FOREIGN KEY (`consultation`) REFERENCES `consultation` (`consultation`);

ALTER TABLE `hospitalisation`
  ADD CONSTRAINT `hospitalization_ibfk_2` FOREIGN KEY (`consultation`) REFERENCES `consultation` (`consultation`);

ALTER TABLE `indication`
  ADD CONSTRAINT `indication_ibfk_1` FOREIGN KEY (`spécialité`) REFERENCES `spécialité` (`spécialité`);

ALTER TABLE `travail`
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`site`) REFERENCES `site` (`site`);

ALTER TABLE `lettre`
  ADD CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`destinataire`) REFERENCES `personne` (`personne`);

ALTER TABLE `emprunt`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`personne`) REFERENCES `personne` (`personne`);

ALTER TABLE `amants`
  ADD CONSTRAINT `lovers_ibfk_1` FOREIGN KEY (`personne_1`) REFERENCES `personne` (`personne`),
  ADD CONSTRAINT `lovers_ibfk_2` FOREIGN KEY (`personne_2`) REFERENCES `personne` (`personne`);

ALTER TABLE `personne`
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`id_travail`) REFERENCES `travail` (`id_travail`);

ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`consultation`) REFERENCES `consultation` (`consultation`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`spécialité`) REFERENCES `spécialité` (`spécialité`);

ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`personne_1`) REFERENCES `personne` (`personne`),
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`personne_2`) REFERENCES `personne` (`personne`);

ALTER TABLE `assistance`
  ADD CONSTRAINT `sunday_ibfk_1` FOREIGN KEY (`personne`) REFERENCES `personne` (`personne`);
