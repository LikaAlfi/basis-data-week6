-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 03:26 PM
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
-- Database: `week6_2410506010`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_matkul`
--

CREATE TABLE `ambil_matkul` (
  `NPM` char(3) NOT NULL,
  `kode_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_matkul`
--

INSERT INTO `ambil_matkul` (`NPM`, `kode_mk`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kode_dos` int(2) NOT NULL,
  `nama_dos` varchar(25) NOT NULL,
  `alamat_dos` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kode_dos`, `nama_dos`, `alamat_dos`) VALUES
(10, 'Suharto', 'Jl.Jombang'),
(11, 'Martono', 'Jl.Kalpataru'),
(12, 'Rahmawati', 'Jl.Jakarta'),
(13, 'Bambang', 'Jl.Bandung'),
(14, 'Nurul', 'Jl.Raya Tidar');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jur` char(2) NOT NULL,
  `nama_jur` varchar(25) NOT NULL,
  `kode_dos` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jur`, `nama_jur`, `kode_dos`) VALUES
('TE', 'Teknik Elektro', 10),
('TM', 'Teknik Mesin', 13),
('TS', 'Teknik Sipil', 23);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(3) NOT NULL,
  `nama_mhs` varchar(20) NOT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama_mhs`, `jenis_kelamin`, `alamat`) VALUES
('101', 'Arif', 'L', 'Jl.Kenangan'),
('102', 'Budi', 'L', 'Jl.Jombang'),
('103', 'Wati', 'P', 'Jl.Surabaya'),
('104', 'Ika', 'P', 'Jl.Jombang'),
('105', 'Tono', 'L', 'Jl.Jakarta'),
('106', 'Iwan', 'L', 'Jl.Bandung'),
('107', 'Sari', 'P', 'Jl.Malang');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(20) NOT NULL,
  `SKS` int(1) NOT NULL,
  `semester` int(2) NOT NULL,
  `kode_dos` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kode_mk`, `nama_mk`, `SKS`, `semester`, `kode_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, 12),
('PTI333', 'Basis Data Terdistri', 3, 5, 10),
('PTI447', 'Praktikum Basis Data', 1, 3, 11),
('PTI777', 'Sistem Informasi', 2, 3, 99),
('TIK123', 'Jaringan Komputer', 2, 5, 10),
('TIK333', 'Sistem Operasi', 3, 5, 10),
('TIK342', 'Praktikum Basis Data', 1, 3, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_matkul`
--
ALTER TABLE `ambil_matkul`
  ADD PRIMARY KEY (`NPM`,`kode_mk`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dos`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jur`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_matkul`
--
ALTER TABLE `ambil_matkul`
  ADD CONSTRAINT `ambil_matkul_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`),
  ADD CONSTRAINT `ambil_matkul_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matkul` (`kode_mk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
