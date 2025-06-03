-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 03 juin 2025 à 12:13
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ll`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande_conge`
--

CREATE TABLE `demande_conge` (
  `id` bigint(20) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `document_pdf` tinyblob DEFAULT NULL,
  `duree` int(11) NOT NULL,
  `id_employee` bigint(20) DEFAULT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `motif_refus` varchar(255) DEFAULT NULL,
  `pdf_file_name` varchar(255) DEFAULT NULL,
  `remplacant_arab` varchar(255) DEFAULT NULL,
  `remplacer_par` varchar(255) DEFAULT 'CCCC',
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demande_conge`
--

INSERT INTO `demande_conge` (`id`, `date_creation`, `date_debut`, `date_fin`, `document_path`, `document_pdf`, `duree`, `id_employee`, `motif`, `motif_refus`, `pdf_file_name`, `remplacant_arab`, `remplacer_par`, `statut`) VALUES
(1, NULL, '2025-05-22', '2025-05-23', NULL, NULL, 2, 3, '--', NULL, NULL, 'حسناء', 'hasna', 'APPROUVE'),
(2, NULL, '2025-06-19', '2025-06-26', NULL, NULL, 6, 3, '---', 'bb', NULL, 'الياس', 'ilyass', 'EN_COURS_DE_TRAITEMENT'),
(7, NULL, '2025-05-23', '2025-05-26', NULL, NULL, 7, 1, 'jj', 'la charge de travail', NULL, 'jj', 'jj', 'REFUSE'),
(10, NULL, '2025-06-10', '2025-06-16', NULL, NULL, 5, 1, 'nn', NULL, NULL, 'mmm', 'mmmvv', 'APPROUVE'),
(16, '2025-05-26', '2025-06-11', '2025-06-18', NULL, NULL, 6, 1, 'bbb', 'nn', NULL, 'gg', 'dd', 'EN_ATTENTE'),
(24, '2025-06-02', '2025-06-03', '2025-06-18', NULL, NULL, 11, 32, '---', NULL, NULL, 'حسناء زهري', 'hasna', 'APPROUVE'),
(25, '2025-06-02', '2025-06-11', '2025-06-17', NULL, NULL, 5, 38, 'yyy', NULL, NULL, 'h', 'g', 'EN_ATTENTE');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nom_departement` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `date`, `description`, `nom_departement`) VALUES
(1, '2025-05-02 12:00:29.000000', '---', 'IT'),
(9, '2025-06-02 10:48:55.000000', 'Direction générale', 'DIRECTEUR'),
(10, '2025-06-02 10:49:07.000000', 'Gestion des systèmes informatiques', 'SERVICE INFORMATIQUE et systèmes d\'information'),
(11, '2025-06-02 10:49:25.000000', 'Communication interne et externe', 'Service de Communication et de Coopération'),
(12, '2025-06-02 10:49:35.000000', 'Évaluation et planification des ressources', 'DIVISION Évaluation et Planification des RE'),
(13, '2025-06-02 10:49:46.000000', 'Gestion des ressources hydriques', 'DIVISION Gestion durable des ressources en eau'),
(14, '2025-06-02 10:50:04.000000', 'Contrôle des ressources', 'SERVICE DE CONTRACTION ET ÉTABLISSEMENT DES RESSOURCES'),
(15, '2025-06-02 10:50:17.000000', 'Gestion administrative et financière', 'DIVISION Des Affaires Administratives Et Financières'),
(16, '2025-06-02 10:50:21.000000', 'Délégation régionale', 'Délégation El Jadida');

-- --------------------------------------------------------

--
-- Structure de la table `religious_holidays`
--

CREATE TABLE `religious_holidays` (
  `id` bigint(20) NOT NULL,
  `end_date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `religious_holidays`
--

INSERT INTO `religious_holidays` (`id`, `end_date`, `name`, `start_date`) VALUES
(3, '2025-06-08', 'Eid El Adha', '2025-06-07');

-- --------------------------------------------------------

--
-- Structure de la table `services_departement`
--

CREATE TABLE `services_departement` (
  `id` bigint(20) NOT NULL,
  `nom_service` varchar(100) NOT NULL,
  `departement_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services_departement`
--

INSERT INTO `services_departement` (`id`, `nom_service`, `departement_id`) VALUES
(6, 'Service Planification Des Ressources En eau et Études', 12),
(7, 'Service Suivi et évaluation Des ressources En eau', 12),
(8, 'Service Gestion et développement Des RE', 13),
(9, 'Service Travaux et Aménagements Hydrauliques', 13),
(10, 'Service suivi de la qualité Des ressources en eau', 13),
(11, 'Service Gestion du DPH MASSAM MARINAR', 14),
(12, 'Service Des Affaires Juridiques Et Contentieux', 14),
(13, 'Service Alides et Redevances', 14),
(14, 'Service Marchés Et Comptabilité', 15),
(15, 'Service Ressources Humaines Et moyens généraux', 15),
(16, 'Service Financement et Programmation', 15),
(17, 'Service Contrôle de Gestion et Audit interne', 15),
(18, 'Service Infrastructure et Réseaux', 10),
(19, 'Service Support Technique', 10),
(20, 'Service Cybersécurité', 10),
(21, 'Service Base de Données', 10);

-- --------------------------------------------------------

--
-- Structure de la table `solde_conges`
--

CREATE TABLE `solde_conges` (
  `id` bigint(20) NOT NULL,
  `annee` int(11) DEFAULT NULL,
  `date_mise_a_jour` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `solde_annee_courante` int(11) DEFAULT 22,
  `solde_annee_precedente` int(11) DEFAULT 0,
  `solde_global` int(11) DEFAULT 22,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `solde_conges`
--

INSERT INTO `solde_conges` (`id`, `annee`, `date_mise_a_jour`, `solde_annee_courante`, `solde_annee_precedente`, `solde_global`, `id_employee`) VALUES
(1, 2025, '2025-05-26 11:02:41', 4, 0, 4, 1),
(27, 2025, NULL, 22, 0, 22, 27),
(28, 2025, NULL, 22, 0, 22, 28),
(29, 2025, NULL, 22, 0, 22, 29),
(30, 2025, NULL, 22, 0, 22, 30),
(31, 2025, NULL, 22, 0, 22, 31),
(32, 2025, NULL, 11, 0, 11, 32),
(33, 2025, NULL, 22, 0, 22, 33),
(34, 2025, NULL, 22, 0, 22, 34),
(35, 2025, NULL, 22, 0, 22, 35),
(36, 2025, NULL, 22, 0, 22, 36),
(37, 2025, NULL, 22, 0, 22, 37),
(38, 2025, NULL, 22, 0, 22, 38),
(39, 2025, NULL, 22, 0, 22, 39),
(40, 2025, NULL, 22, 0, 22, 40),
(41, 2025, NULL, 22, 0, 22, 41),
(42, 2025, NULL, 22, 0, 22, 42),
(43, 2025, NULL, 22, 0, 22, 43),
(44, 2025, NULL, 22, 0, 22, 44),
(45, 2025, NULL, 22, 0, 22, 45),
(46, 2025, NULL, 22, 0, 22, 46),
(47, 2025, NULL, 22, 0, 22, 47),
(48, 2025, NULL, 22, 0, 22, 48),
(49, 2025, NULL, 22, 0, 22, 49),
(50, 2025, NULL, 22, 0, 22, 50),
(51, 2025, NULL, 22, 0, 22, 51);

-- --------------------------------------------------------

--
-- Structure de la table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `is_logged_out` bit(1) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `date_naissance` varchar(255) DEFAULT NULL,
  `echelle` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `echelle_arab` varchar(255) DEFAULT NULL,
  `grade_arab` varchar(255) DEFAULT NULL,
  `nom_arab` varchar(255) DEFAULT NULL,
  `prenom_arab` varchar(255) DEFAULT NULL,
  `fonction` varchar(255) DEFAULT NULL,
  `fonction_arab` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `adresse`, `date_naissance`, `echelle`, `email`, `first_name`, `grade`, `last_name`, `matricule`, `password`, `role`, `username`, `departement_id`, `service_id`, `echelle_arab`, `grade_arab`, `nom_arab`, `prenom_arab`, `fonction`, `fonction_arab`) VALUES
(1, '123 rue des Exemples', '1990-01-01', '10', 'laila@gmail.com', 'laila', 'Ingénieur', 'Ben Salahh', 'A12345', '$2a$10$mgrMSlEOJNCqvVz1tAUz.e9YnILR23xxP9ziVT/Jm3t9/P8W82Vd.', 'ADMIN', 'ooo', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '123 Avenue Hassan II, Beni Mellal', '1975-03-15', '11', 'a.elamrani@abhoer.ma', 'Ahmed', 'ADMINISTRATEUR DE 1ER GRADE', 'El Amrani', 'ABH001', '$2a$10$sGp2lmJg/57sfrh.Cipo6etwgQPQ9zThpRhfX5vhK8oembbw0M6q6', 'ADMIN', 'a.elamrani', 9, NULL, '11', 'مسؤول من الدرجة الأولى', 'أحمد', 'العمراني', 'Directeur de l\'Agence', 'مدير الوكالة'),
(28, '45 Rue Mohammed V, Beni Mellal', '1980-07-22', '11', 'f.zahraoui@abhoer.ma', 'Fatima', 'INGENIEUR EN CHEF GRADE PRINCIPAL', 'Zahraoui', 'ABH002', '$2a$10$zwa/8/wnbeKsq4OD4S4/7OETIhH9kjGolkxQWBhdeqSpiNFxIo2Pi', 'CHEF_DEPARTEMENT', 'f.zahraoui', 12, NULL, '11', 'مهندس رئيسي درجة رئيسية', 'فاطمة', 'الزهراوي', 'Chef de Division Évaluation', 'رئيس قسم التقييم'),
(29, '78 Boulevard Moulay Youssef, Beni Mellal', '1982-11-05', '11', 'k.benjelloun@abhoer.ma', 'Karim', 'ADMINISTRATEUR DE 2EME GRADE', 'Benjelloun', 'ABH003', '$2a$10$Rq29rz3nh433OMPDTTkJJuoxZHhaUZ.wl6gIRlTi/rgC4cTXey9g6', 'CHEF_SERVICE', 'k.benjelloun', 12, 6, '11', 'مسؤول من الدرجة الثانية', 'كريم', 'بنجلون', 'Chef de Service Planification', 'رئيس خدمة التخطيط'),
(30, '32 Rue Ibn Khaldoun, Beni Mellal', '1985-09-18', '9', 'l.mouhtadi@abhoer.ma', 'Leila', 'TECHNICIEN PREMIER GRADE', 'Mouhtadi', 'ABH004', '$2a$10$/N1ESeZZjUqrNf1h8xSkA.jA7MjciMPrifaDrulzrbUTr47ye9GJS', 'USER', 'l.mouhtadi', 12, 6, '9', 'فني من الدرجة الأولى', 'ليلى', 'المحتادي', 'Technicien en Planification', 'فني في التخطيط'),
(31, '56 Avenue Mohammed VI, Beni Mellal', '1978-04-30', '11', 'y.elfassi@abhoer.ma', 'Youssef', 'INGENIEUR D\'ETAT GRADE PRINCIPAL', 'El Fassi', 'ABH005', '$2a$10$WIH5.Sl/ohDT2JJrYqj3s.xJ8MrEOgE8YdzKDoVd/NnN416sAuXpW', 'CHEF_DEPARTEMENT', 'y.elfassi', 13, 8, '11', 'مهندس دولة درجة رئيسية', 'يوسف', 'الفاسي', 'Chef de Division Gestion', 'رئيس قسم التدبير'),
(32, '89 Rue Al Massira, Beni Mellal', '1983-12-14', '11', 'n.berrada@abhoer.ma', 'Nadia', 'ADMINISTRATEUR DE 2EME GRADE', 'Berrada', 'ABH006', '$2a$10$xc5UAgg3ERi/2vpOuTbsI.UZXKu/nEetBx73YmypguOzaoGFoyNju', 'CHEF_SERVICE', 'n.berrada', 13, 8, '11', 'مسؤول من الدرجة الثانية', 'نادية', 'البرادة', 'Chef de Service Gestion', 'رئيس خدمة التدبير'),
(33, '14 Rue Ibn Sina, Beni Mellal', '1987-06-25', '10', 'h.elouazzani@abhoer.ma', 'Hassan', 'TECHNICIEN DEUXIEME GRADE', 'El Ouazzani', 'ABH007', '$2a$10$M1w.RHbShWC8EiMLofpSzufJRGfGyLUqWi6fAOLmf8m1n7w6OhUje', 'USER', 'h.elouazzani', 13, 8, '10', 'فني من الدرجة الثانية', 'حسن', 'الوزاني', 'Technicien en Ressources', 'فني في الموارد'),
(34, '23 Avenue Moulay Ismail, Beni Mellal', '1979-01-10', '10', 's.elkhayat@abhoer.ma', 'Samira', 'ADMINISTRATEUR DE 3EME GRADE', 'El Khayat', 'ABH008', '$2a$10$jBMhz31M7/PMmi7ObNgLB.rnV6L.ZmNGtpvMMiWOIh5Wepqfrdc36', 'CHEF_DEPARTEMENT', 's.elkhayat', 14, 12, '10', 'مسؤول من الدرجة الثالثة', 'سميرة', 'الخياط', 'Chef de Service Contrôle', 'رئيس خدمة المراقبة'),
(35, '67 Rue Ibn Rochd, Beni Mellal', '1984-08-17', '11', 'm.benchekroun@abhoer.ma', 'Mehdi', 'ADMINISTRATEUR DE 2EME GRADE', 'Benchekroun', 'ABH009', '$2a$10$BjofyElH6ya8SKMb9L7r0uzdb1QHAUc020FwbfqESLFzscrWmQwki', 'CHEF_SERVICE', 'm.benchekroun', 14, 11, '11', 'مسؤول من الدرجة الثانية', 'مهدي', 'بنشقرون', 'Chef de Service DPH', 'رئيس خدمة DPH'),
(36, '42 Avenue Al Wahda, Beni Mellal', '1986-05-22', '9', 'a.elmansouri@abhoer.ma', 'Amina', 'TECHNICIEN TROISIEME GRADE', 'El Mansouri', 'ABH010', '$2a$10$cJndQrB140kSgmYUxOfCceUi611CZJkRJoX0WE.7ob0vm6BpqNESq', 'USER', 'a.elmansouri', 14, 11, '9', 'فني من الدرجة الثالثة', 'أمينة', 'المنصوري', 'Technicien DPH', 'فني DPH'),
(37, '31 Rue Ibn Batouta, Beni Mellal', '1976-10-08', '11', 'r.elfassi@abhoer.ma', 'Rachid', 'ADMINISTRATEUR DE 2EME GRADE', 'El Fassi', 'ABH011', '$2a$10$42sMOFZcITDO89A8okXCRu2qH4ndkljq51ig5Y9iHire9vSuUQm4y', 'CHEF_DEPARTEMENT', 'r.elfassi', 15, 17, '11', 'مسؤول من الدرجة الثانية', 'رشيد', 'الفاسي', 'Chef de Division Administrative', 'رئيس قسم الشؤون الإدارية'),
(38, '58 Avenue Al Amir Moulay Abdellah, Beni Mellal', '1981-03-19', '10', 'n.bennis@abhoer.ma', 'Noura', 'ADMINISTRATEUR DE 3EME GRADE', 'Bennis', 'ABH012', '$2a$10$yWMnR4qD9elMGGrTLysFJOm8/awTmvdBZQJ7rQNHXKj9Q/iC8LtwS', 'RH', 'n.bennis', 15, 15, '10', 'مسؤول من الدرجة الثالثة', 'نورة', 'بنيس', 'Responsable RH', 'مسؤول الموارد البشرية'),
(39, '76 Rue Ibn Zaydoun, Beni Mellal', '1988-07-30', '6', 'k.elamraoui@abhoer.ma', 'Khalid', 'ADJOINT TECHNIQUE 3EME GRADE', 'El Amraoui', 'ABH013', '$2a$10$bqr3.7zjDM8MGZAYgYe4Me/mDuG6iX.jcZ1hY90Z9y6jYBkxXLRlm', 'USER', 'k.elamraoui', 15, 15, '6', 'مساعد تقني من الدرجة الثالثة', 'خالد', 'العمراوي', 'Adjoint Administratif', 'مساعد إداري'),
(40, '19 Avenue Hassan I, Beni Mellal', '1989-02-14', '8', 'z.elkhattabi@abhoer.ma', 'Zineb', 'TECHNICIEN QUATRIEME GRADE', 'El Khattabi', 'ABH014', '$2a$10$zwxPcLSZF4iX2lesIUJfP.inWT1NUzO92sQ.9J98lAsQvGKYjngHa', 'USER', 'z.elkhattabi', 10, 18, '8', 'فني من الدرجة الرابعة', 'زينب', 'الخطابي', 'Technicien Informatique', 'فني معلوماتيات'),
(41, '34 Rue Ibn Toumert, Beni Mellal', '1983-11-25', '9', 'o.elidrissi@abhoer.ma', 'Omar', 'INGENIEUR EN CHEF PREMIER GRADE', 'El Idrissi', 'ABH015', '$2a$10$tUYjHtEB9mgthxJ2li32bul/mTD8OG6ErwjJsLE.fNTmsFvagEIGO', 'CHEF_SERVICE', 'o.elidrissi', 10, 18, '9', 'مهندس رئيسي من الدرجة الأولى', 'عمر', 'الإدريسي', 'Chef de Service Infrastructure', 'رئيس خدمة البنية التحتية'),
(42, '27 Avenue Al Qods, Beni Mellal', '1985-04-05', '9', 'h.elmoutawakil@abhoer.ma', 'Houda', 'TECHNICIEN TROISIEME GRADE', 'El Moutawakil', 'ABH016', '$2a$10$TiGh6jx4Z1MPyg.GLSJVwO8oZxjd7jsjrodaCu.90acdNcnX2YwZS', 'USER', 'h.elmoutawakil', 10, 19, '9', 'فني من الدرجة الثالثة', 'هدى', 'المتوكل', 'Technicien Support', 'فني الدعم'),
(43, '53 Rue Ibn Khaldoun, Beni Mellal', '1982-09-12', '11', 'y.elhassani@abhoer.ma', 'Younes', 'ADMINISTRATEUR DE 2EME GRADE', 'El Hassani', 'ABH017', '$2a$10$WbNPxoE0/bJ5xjWcoRpKpecjQtvGdaMyKZR1cXyjYAP7rRjqx1Gte', 'CHEF_SERVICE', 'y.elhassani', 10, 20, '11', 'مسؤول من الدرجة الثانية', 'يونس', 'الحساني', 'Chef de Service Cybersécurité', 'رئيس خدمة الأمن السيبراني'),
(44, '62 Avenue Al Massira, Beni Mellal', '1987-12-03', '10', 's.elfahsi@abhoer.ma', 'Sanaa', 'TECHNICIEN DEUXIEME GRADE', 'El Fahsi', 'ABH018', '$2a$10$nVyt.AMqcpix4voU9H6ateCyvcZLC5v2LK3xBxXYhfulh7W/wkXPC', 'USER', 's.elfahsi', 10, 21, '10', 'فني من الدرجة الثانية', 'سناء', 'الفاسي', 'Technicien Base de Données', 'فني قواعد البيانات'),
(45, '38 Rue Ibn Tachfine, Beni Mellal', '1980-06-28', '9', 'm.elouardi@abhoer.ma', 'Mohamed', 'INGENIEUR D\'ETAT PREMIER GRADE', 'El Ouardi', 'ABH019', '$2a$10$fJbrZS1jU/AV/ArLzIJcDuNW8Cu2r9UoaircQ.GecBajpddRUr.XO', 'CHEF_DEPARTEMENT', 'm.elouardi', 11, NULL, '9', 'مهندس دولة من الدرجة الأولى', 'محمد', 'الوردي', 'Chef de Service Communication', 'رئيس خدمة الاتصال'),
(46, '71 Avenue Mohammed V, Beni Mellal', '1984-03-17', '11', 'a.elkhamlichi@abhoer.ma', 'Asmae', 'ADMINISTRATEUR DE 2EME GRADE', 'El Khamlichi', 'ABH020', '$2a$10$b3bSAsMhC02LaomOT9tByejeuHE8G310PLnVv6psMat5j8KVy4mUe', 'CHEF_SERVICE', 'a.elkhamlichi', 11, 11, '11', 'مسؤول من الدرجة الثانية', 'أسماء', 'الخمليشي', 'Responsable Communication', 'مسؤول الاتصال'),
(47, '15 Rue Al Andalous, Beni Mellal', '1986-08-09', '9', 'i.elfilali@abhoer.ma', 'Ibrahim', 'TECHNICIEN TROISIEME GRADE', 'El Filali', 'ABH021', '$2a$10$HKctO3WkK/Lq1sgDTxgLHOBhO.VFHa2k3tbN/TrWfOQ8qQm10fs4i', 'USER', 'i.elfilali', 16, 16, '9', 'فني من الدرجة الثالثة', 'إبراهيم', 'الفيلالي', 'Technicien Délégation', 'فني التمثيلية'),
(48, '29 Avenue Al Fath, Beni Mellal', '1989-05-22', '6', 's.elansari@abhoer.ma', 'Salma', 'ADJOINT TECHNIQUE 3EME GRADE', 'El Ansari', 'ABH022', '$2a$10$JLmNeiXhGXEwKEvzTpZha.GnkiKr0BdenZ5ltncFGw3I4vHfVOCpe', 'USER', 's.elansari', 15, 17, '6', 'مساعد تقني من الدرجة الثالثة', 'سلمى', 'العنصري', 'Adjoint de Contrôle', 'مساعد المراقبة'),
(49, '47 Rue Ibn Arabi, Beni Mellal', '1981-10-15', '11', 'a.elbouhali@abhoer.ma', 'Abdelkrim', 'ADMINISTRATEUR DE 2EME GRADE', 'El Bouhali', 'ABH023', '$2a$10$2gv5yD004v77/TVPX3WLl.SuacKH/Fep/PVTPLMBMn20nsksHqIv6', 'CHEF_SERVICE', 'a.elbouhali', 15, 17, '11', 'مسؤول من الدرجة الثانية', 'عبد الكريم', 'البوهالي', 'Chef de Service Audit', 'رئيس خدمة التدقيق'),
(50, '83 Avenue Al Amir Moulay Abdellah, Beni Mellal', '1983-07-08', '11', 'h.elmoussaoui@abhoer.ma', 'Hicham', 'INGENIEUR D\'ETAT GRADE PRINCIPAL', 'El Moussaoui', 'ABH024', '$2a$10$slI2hefy3jHViO4vhqA2HuX.gKq943lm4VSIlx9aTOUr/JKybJSXy', 'CHEF_SERVICE', 'h.elmoussaoui', 13, 9, '11', 'مهندس دولة درجة رئيسية', 'هشام', 'الموساوي', 'Chef de Service Travaux', 'رئيس خدمة الأشغال'),
(51, '24 Rue Ibn Zaidoun, Beni Mellal', '1988-01-30', '8', 'n.elghazi@abhoer.ma', 'Naima', 'TECHNICIEN QUATRIEME GRADE', 'El Ghazi', 'ABH025', '$2a$10$0dENz.P93GJ66HJjUTBb3eCFCIV2ApwOvBuKtEA6tofYAFjYUiT6.', 'USER', 'n.elghazi', 13, 10, '8', 'فني من الدرجة الرابعة', 'نعيمة', 'الغازي', 'Technicien Qualité', 'فني الجودة');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande_conge`
--
ALTER TABLE `demande_conge`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `religious_holidays`
--
ALTER TABLE `religious_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `services_departement`
--
ALTER TABLE `services_departement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3upkp8l4dw746ad10fsu01k9q` (`departement_id`);

--
-- Index pour la table `solde_conges`
--
ALTER TABLE `solde_conges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_employee_annee` (`id_employee`,`annee`);

--
-- Index pour la table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8e20r8lhisysq41948slf05sk` (`departement_id`),
  ADD KEY `FKtg37u2cqu76oa2y8h2683a4i4` (`service_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande_conge`
--
ALTER TABLE `demande_conge`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `religious_holidays`
--
ALTER TABLE `religious_holidays`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `services_departement`
--
ALTER TABLE `services_departement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `solde_conges`
--
ALTER TABLE `solde_conges`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `services_departement`
--
ALTER TABLE `services_departement`
  ADD CONSTRAINT `FK3upkp8l4dw746ad10fsu01k9q` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`);

--
-- Contraintes pour la table `solde_conges`
--
ALTER TABLE `solde_conges`
  ADD CONSTRAINT `FKepnw4ri2y2cjmnngd5schme72` FOREIGN KEY (`id_employee`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK8e20r8lhisysq41948slf05sk` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`),
  ADD CONSTRAINT `FKtg37u2cqu76oa2y8h2683a4i4` FOREIGN KEY (`service_id`) REFERENCES `services_departement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
