-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 18, 2020 at 11:21 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `waktu_absen` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(50) NOT NULL,
  `alasan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_jadwal`, `id_mahasiswa`, `waktu_absen`, `keterangan`, `alasan`) VALUES
(16, 10, 10, '2020-05-18 06:02:58', 'Hadir', ''),
(17, 11, 10, '2020-05-18 04:28:34', 'Hadir', ''),
(18, 11, 11, '2020-05-18 04:34:11', 'Hadir', ''),
(19, 10, 11, '2020-05-18 06:23:43', 'Hadir', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `jenis_kelamin` char(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `jenis_kelamin`, `phone`, `foto`, `username`, `password`) VALUES
(1, 'Poltak Sianipar', 'L', '+6282276858079', 'Screenshot (23).png', 'poltakssss', '$2y$10$/xFbvDBptztbpgp74I5E5uunnIx3YQE.rlslm1LghzgNESVHDd8xW'),
(3, 'Japri Aritonang', 'L', '+6287791283201', 'Screenshot (26).png', 'japri2213', '$2y$10$mhiaSCF4051N4lhdZ1EfpujJ8Tt6PqyWLBzZUNActEDRKEOi0W5QG');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`, `jenis_kelamin`, `telepon`, `username`, `password`, `foto`) VALUES
(11, 'Verawaty Situmorang', 'Perempuan', '+6282276889912', 'verawaty', '$2y$10$ByYmOAIE7eJOP2HScHPJYugY2YrCM0zkRPSw4ZTJcrly/dwj1pNbe', ''),
(12, 'Istas Pratomo Manalu', 'Laki-laki', '+6282266551122', 'istas', '$2y$10$vHSCvvf2LG9fkalNSkQjXOlTrMVgujWUytNGh9Z8G/KlPd//CRUnG', '');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_matkul`
--

CREATE TABLE `dosen_matkul` (
  `id_dosen` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen_matkul`
--

INSERT INTO `dosen_matkul` (`id_dosen`, `id_matkul`) VALUES
(11, 28),
(11, 29),
(12, 27);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama_fakultas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `nama_fakultas`) VALUES
(1, 'Fakultas Informatika dan Teknik Elektro (FITE)'),
(2, 'Fakultas Teknologi Industri (FTI)'),
(8, 'Fakultas Bioteknologi (FB)');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `tanggal_jadwal` date NOT NULL,
  `waktu_jadwal` time NOT NULL,
  `waktu_berakhir` time NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_matkul`, `tanggal_jadwal`, `waktu_jadwal`, `waktu_berakhir`, `id_kelas`, `id_dosen`) VALUES
(10, 28, '2020-05-18', '08:00:00', '10:00:00', 2, 11),
(11, 27, '2020-05-18', '10:00:00', '11:50:00', 2, 12),
(12, 29, '2020-05-19', '08:00:00', '10:00:00', 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kode_kelas` varchar(255) NOT NULL,
  `id_prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `id_prodi`) VALUES
(1, '41TRPL1', 9),
(2, '41TRPL2', 9),
(3, 'S1SI1', 3),
(6, '31TK1', 11);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `NIM` char(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `NIM`, `username`, `password`, `foto`, `id_prodi`, `id_kelas`) VALUES
(10, 'Jerry Andrianto Pangaribuan', '11419046', 'jerry2204', '$2y$10$YtaDorn8jaQonJ2.6tegeupuZr.1uSSu8bDuhvOA3kgco9EmS/PaS', 'Jerry Andrianto Pangaribuan_DIV Teknologi Rekayasa Perangkat Lunak_Fakultas Informatika dan Teknik Elektro_11419046.JPG', 9, 2),
(11, 'Timothy', '11419053', 'timothy', '$2y$10$IHBROx24vF6bKQB4Ouzs3OJo.gMvqs.vToev5C9Uh.fCsBUaONflW', 'Logo IT Del.png', 9, 2),
(12, 'Pabertoni Panjaitan', '11SI1146', 'pabertoni', '$2y$10$D5KRYZUuK09/0BOgJn8lyeW52Ox24E9RrrGpsJMBvpK4fnHfYdhEW', '11419046_Jerry Andrianto Pangaribuan.jpg', 3, 3),
(13, 'Andree Panjaitan', '11419014', 'andree', '$2y$10$El5Ow6rNcGL11NHfCMQoV.u6eGW8c5TUqE0dGs/r18Uk77Va7V0We', '1.png', 9, 1),
(14, 'Yonathan Andreas Parsaoran Lumban Tobing', '11419038', 'yonatan', '$2y$10$hBg6M.nHtEM5PbAPz2p7B.hnKHmPAGtSBX84gKJyOFUpsB7ORoei2', 'Screenshot (26).png', 9, 2),
(15, 'Marselino Gila', '11s10989', 'marsel', '$2y$10$5M0D1IWa8BhvswrTfNK4yOanu23FZmLxKmM6ja5mgA7iyW9sUI4vq', 'Screenshot (26).png', 3, 3),
(17, 'Jerikho Silaban', '11419052', 'jerikho13', '$2y$10$ad/JQCL6gX2MVY3K//Wuxe9W0jpsxjvBoExzEcq2gnxrYovd2PqLS', 'Screenshot (22).png', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_matkul`
--

CREATE TABLE `mahasiswa_matkul` (
  `id_mahasiswa` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa_matkul`
--

INSERT INTO `mahasiswa_matkul` (`id_mahasiswa`, `id_matkul`) VALUES
(11, 21),
(10, 27),
(10, 28),
(11, 27),
(11, 28),
(17, 27),
(10, 29),
(10, 36),
(10, 37),
(10, 38);

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id_matkul` int(11) NOT NULL,
  `kode_matkul` varchar(15) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `SKS` int(10) NOT NULL,
  `semester` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id_matkul`, `kode_matkul`, `nama_matkul`, `SKS`, `semester`) VALUES
(21, 'PRPL01', 'Pengenalan Rekayasa Perangkat Lunak', 3, 'Ganjil'),
(25, 'KD01', 'Kimia Dasar 1', 3, 'Ganjil'),
(27, 'SISOP02', 'Sistem Operasi', 3, 'Genap'),
(28, 'PBD02', 'Pengenalan Basis Data', 3, 'Genap'),
(29, 'AKPL02', 'Analisis Kebutuhan Perangkat Lunak', 3, 'Genap'),
(30, 'Eng01', 'English I', 2, 'Ganjil'),
(31, 'PSW01', 'Pengembangan Situs Web 1', 3, 'Ganjil'),
(32, 'AOK01', 'Arsitektur dan Organisasi Komputer', 2, 'Ganjil'),
(33, 'PSW02', 'Pengembangan Situs Web 2', 3, 'Ganjil'),
(34, 'Delcha01', 'Del Character', 2, 'Ganjil'),
(35, 'Daspro01', 'Dasar Pemrograman', 3, 'Ganjil'),
(36, 'Eng02', 'English II', 2, 'Genap'),
(37, 'PNKI02', 'Penulisan Karya Ilmiah', 2, 'Genap'),
(38, 'PA01', 'Proyek Akhir 1', 3, 'Genap');

-- --------------------------------------------------------

--
-- Table structure for table `matkul_prodi`
--

CREATE TABLE `matkul_prodi` (
  `id_prodi` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul_prodi`
--

INSERT INTO `matkul_prodi` (`id_prodi`, `id_matkul`) VALUES
(3, 21),
(9, 21),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 36),
(9, 37),
(9, 38);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `id_fakultas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `id_fakultas`) VALUES
(3, 'S1 Sistem Informasi', 1),
(5, 'S1 Informatika', 1),
(8, 'S1 Manajemen Rekayasa', 2),
(9, 'DIV Teknologi Rekayasa Perangkat Lunak', 1),
(11, 'D3 Teknologi Komputer', 1),
(12, 'S1 Teknik Elektro', 1),
(24, 'D3 Teknologi Informasi', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `dosen_matkul`
--
ALTER TABLE `dosen_matkul`
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `jadwal_ibfk_2` (`id_matkul`),
  ADD KEY `jadwal_ibfk_3` (`id_dosen`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `kelas_ibfk_1` (`id_prodi`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `mahasiswa_ibfk_1` (`id_prodi`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `mahasiswa_matkul`
--
ALTER TABLE `mahasiswa_matkul`
  ADD KEY `id_mahasiswa` (`id_mahasiswa`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `matkul_prodi`
--
ALTER TABLE `matkul_prodi`
  ADD KEY `matkul_prodi_ibfk_1` (`id_matkul`),
  ADD KEY `matkul_prodi_ibfk_2` (`id_prodi`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dosen_matkul`
--
ALTER TABLE `dosen_matkul`
  ADD CONSTRAINT `dosen_matkul_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_matkul_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa_matkul`
--
ALTER TABLE `mahasiswa_matkul`
  ADD CONSTRAINT `mahasiswa_matkul_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_matkul_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matkul_prodi`
--
ALTER TABLE `matkul_prodi`
  ADD CONSTRAINT `matkul_prodi_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliah` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matkul_prodi_ibfk_2` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
