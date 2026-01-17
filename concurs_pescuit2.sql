-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2026 at 06:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concurs_pescuit2`
--

-- --------------------------------------------------------

--
-- Table structure for table `capturi`
--

CREATE TABLE `capturi` (
  `id` int(4) NOT NULL,
  `specie` enum('avat','biban','clean','salau','stiuca','somn') NOT NULL,
  `Dimensiune` int(11) NOT NULL DEFAULT 10,
  `Greutate` decimal(10,3) DEFAULT NULL,
  `id_participare` int(4) NOT NULL,
  `ora` datetime DEFAULT NULL
) ;

--
-- Dumping data for table `capturi`
--

INSERT INTO `capturi` (`id`, `specie`, `Dimensiune`, `Greutate`, `id_participare`, `ora`) VALUES
(1, 'somn', 120, 800.000, 1, '2024-12-11 17:39:40'),
(2, 'stiuca', 75, 3500.000, 2, '2025-07-13 12:05:00'),
(3, 'salau', 55, 2000.000, 3, '2025-08-12 09:15:40'),
(4, 'avat', 8, 300.000, 4, '2025-10-08 20:30:02'),
(5, 'biban', 12000, 500.000, 1, '2025-08-20 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `concursuri`
--

CREATE TABLE `concursuri` (
  `id` int(3) NOT NULL,
  `Denumire` varchar(96) NOT NULL,
  `Localitate` varchar(32) NOT NULL,
  `data_desfasurarii` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `concursuri`
--

INSERT INTO `concursuri` (`id`, `Denumire`, `Localitate`, `data_desfasurarii`) VALUES
(1, 'Campionat National de pescuit', 'Bucuresti', '2025-07-13'),
(2, 'Cupa Dunarii', 'Cluj', '2024-12-11'),
(4, 'Campionatul mondial de pescuit', 'Oradea', '2025-08-12'),
(5, 'Cupa Pestelui', 'Cluj', '2025-10-08'),
(6, 'Cupa Mării Negre', 'Constanta', '2025-08-20');

-- --------------------------------------------------------

--
-- Stand-in structure for view `participanti_etape`
-- (See below for the actual view)
--
CREATE TABLE `participanti_etape` (
`nume` varchar(45)
,`prenume` varchar(64)
,`concurs` varchar(96)
,`Localitate` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `participari`
--

CREATE TABLE `participari` (
  `id` int(4) NOT NULL,
  `id_concurs` int(3) NOT NULL,
  `id_sportiv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participari`
--

INSERT INTO `participari` (`id`, `id_concurs`, `id_sportiv`) VALUES
(1, 5, 1),
(2, 2, 2),
(3, 4, 3),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sportivi`
--

CREATE TABLE `sportivi` (
  `id` int(3) NOT NULL,
  `nume` varchar(45) NOT NULL,
  `prenume` varchar(64) NOT NULL,
  `data_nasterii` date NOT NULL,
  `loc_participare` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sportivi`
--

INSERT INTO `sportivi` (`id`, `nume`, `prenume`, `data_nasterii`, `loc_participare`) VALUES
(1, 'Costin', 'Alexia', '2005-12-25', 'Cluj'),
(2, 'Borze', 'Teodora', '2005-07-29', 'Oradea'),
(3, 'Popa', 'Loli', '2010-08-20', 'Bucuresti'),
(4, 'Popescu', 'Mirel', '1980-11-02', 'Cluj');

-- --------------------------------------------------------

--
-- Structure for view `participanti_etape`
--
DROP TABLE IF EXISTS `participanti_etape`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `participanti_etape`  AS SELECT `s`.`nume` AS `nume`, `s`.`prenume` AS `prenume`, `cs`.`Denumire` AS `concurs`, `cs`.`Localitate` AS `Localitate` FROM ((`sportivi` `s` join `participari` `p` on(`s`.`id` = `p`.`id_sportiv`)) join `concursuri` `cs` on(`p`.`id_concurs` = `cs`.`id`)) WHERE `cs`.`id` in (1,2) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capturi`
--
ALTER TABLE `capturi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_capturi_participare` (`id_participare`),
  ADD KEY `idx_specie` (`specie`);

--
-- Indexes for table `concursuri`
--
ALTER TABLE `concursuri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_localitate` (`Localitate`);

--
-- Indexes for table `participari`
--
ALTER TABLE `participari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_id_concurs` (`id_concurs`),
  ADD KEY `idx_id_sportiv` (`id_sportiv`);

--
-- Indexes for table `sportivi`
--
ALTER TABLE `sportivi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nume` (`nume`),
  ADD KEY `idx_prenume` (`prenume`),
  ADD KEY `idx_nume_sportiv` (`nume`,`prenume`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capturi`
--
ALTER TABLE `capturi`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `concursuri`
--
ALTER TABLE `concursuri`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `participari`
--
ALTER TABLE `participari`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sportivi`
--
ALTER TABLE `sportivi`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capturi`
--
ALTER TABLE `capturi`
  ADD CONSTRAINT `fk_capturi_participare` FOREIGN KEY (`id_participare`) REFERENCES `participari` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participari`
--
ALTER TABLE `participari`
  ADD CONSTRAINT `participari_ibfk_1` FOREIGN KEY (`id_sportiv`) REFERENCES `sportivi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participari_ibfk_2` FOREIGN KEY (`id_concurs`) REFERENCES `concursuri` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
