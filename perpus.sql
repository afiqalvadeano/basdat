-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28 Okt 2019 pada 05.07
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `kode_buku` char(4) NOT NULL,
  `judul` char(20) DEFAULT NULL,
  `pengarang` char(15) DEFAULT NULL,
  `jml_buku` int(11) DEFAULT NULL,
  `kode_penerbit` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul`, `pengarang`, `jml_buku`, `kode_penerbit`) VALUES
('BD01', 'dBase III plus', 'Epsi B', 5, '01'),
('BD04', 'Clipper', 'Ahmad G', 4, '02'),
('FI01', 'Fisika', 'Sutrisno', 10, '04'),
('S001', 'DOS', 'M.Urip', 10, '01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` varchar(9) NOT NULL,
  `Nama` varchar(20) DEFAULT NULL,
  `Alamat` varchar(20) DEFAULT NULL,
  `Kota` varchar(15) DEFAULT 'Yogyakarta',
  `Tgl_lhr` date DEFAULT NULL,
  `Jenis_kel` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `Alamat`, `Kota`, `Tgl_lhr`, `Jenis_kel`) VALUES
('123010001', 'Ifan', 'Jl.Babarsari', ' ', '1980-07-27', 'L'),
('123010002', 'Adi', 'Jl.Janti', ' ', '1979-06-28', 'L'),
('123010003', 'Ayu', 'Jl.Pemuda', 'Klaten', '1981-05-10', 'P'),
('123010004', 'Yulia', 'Jl.Veteran', 'Sleman', '1970-04-15', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `kode_penerbit` char(2) DEFAULT NULL,
  `nm_penerbit` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`kode_penerbit`, `nm_penerbit`) VALUES
('01', 'Piksi ITB'),
('02', 'Ganesha'),
('03', 'Epsilon'),
('04', 'Gramedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `tgl_pinjam` datetime DEFAULT NULL,
  `mhs_no_induk` varchar(9) DEFAULT NULL,
  `buk_kode_buku` char(4) DEFAULT NULL,
  `tgl_hrs_kembali` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`tgl_pinjam`, `mhs_no_induk`, `buk_kode_buku`, `tgl_hrs_kembali`, `tgl_kembali`) VALUES
('2003-04-20 00:00:00', '123010001', 'S001', '2003-04-23 00:00:00', '2003-04-23 00:00:00'),
('2003-04-20 00:00:00', '123010002', 'BD01', '2003-04-23 00:00:00', '2003-04-22 00:00:00'),
('2003-04-20 00:00:00', '123010003', 'BD04', '2003-04-23 00:00:00', '2003-04-24 00:00:00'),
('2003-04-21 00:00:00', '123010003', 'FI01', '2003-04-24 00:00:00', '2003-04-25 00:00:00'),
('2003-04-21 00:00:00', '123010004', 'S001', '2003-04-24 00:00:00', '2003-04-25 00:00:00'),
('2003-04-21 00:00:00', '123010001', 'BD01', '2003-04-24 00:00:00', '2003-04-24 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD KEY `fk_kode_buku` (`buk_kode_buku`),
  ADD KEY `fk_nim_pinjam` (`mhs_no_induk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `fk_kode_buku` FOREIGN KEY (`buk_kode_buku`) REFERENCES `buku` (`kode_buku`),
  ADD CONSTRAINT `fk_nim_pinjam` FOREIGN KEY (`mhs_no_induk`) REFERENCES `mahasiswa` (`NIM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
