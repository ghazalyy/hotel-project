-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2022 pada 02.53
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_applogin`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_fasilitashotel` (IN `id_fasilitashtl` INT(11))  DELETE FROM tbl_fasilitas_hotel WHERE id_fasilitas_hotel=id_fasilitashtl$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_fasilitaskamar` (IN `id_fasilitaskmr` INT(11))  DELETE FROM tbl_fasilitas_kamar WHERE id_fasilitas_kamar=id_fasilitaskmr$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `leveluser` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `namauser`, `leveluser`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'admin', 'admin'),
('nilam', '202cb962ac59075b964b07152d234b70', 'Nilam Damayanti', 'admin'),
('rose', '202cb962ac59075b964b07152d234b70', 'rose', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_kamar`
--

CREATE TABLE `tbl_detail_kamar` (
  `id_detail_kamar` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `id_fasilitas_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_detail_kamar`
--

INSERT INTO `tbl_detail_kamar` (`id_detail_kamar`, `id_kamar`, `id_fasilitas_kamar`) VALUES
(24, 3, 11),
(29, 4, 11),
(30, 4, 12),
(31, 4, 13),
(32, 4, 14),
(33, 4, 15),
(34, 4, 16),
(35, 6, 11),
(36, 6, 13),
(37, 6, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_hotel`
--

CREATE TABLE `tbl_fasilitas_hotel` (
  `id_fasilitas_hotel` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi_fasilitas` varchar(150) NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_hotel`
--

INSERT INTO `tbl_fasilitas_hotel` (`id_fasilitas_hotel`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(11, 'Kolam renang', 'Dapat melihat matahari terbit dan terbenam sambil berenang', 'kolam renang.jpeg'),
(12, 'lapangan golf', 'tersedia satu lapangan golf', 'lapangan golf.jpg'),
(13, 'Sauna', 'Cocok untuk menghangatkan badan', 'sauna.jpg'),
(14, 'Ruang Meeting', 'Anda dapat melakukan meeting dengan nyaman', 'ruang meeting.jpg'),
(15, 'Tempat Parkir', 'Tempat parkir yang luas', 'parkir.JPG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas_kamar` int(11) NOT NULL,
  `nama_fasilitas` varchar(50) NOT NULL,
  `deskripsi_fasilitas` varchar(150) NOT NULL,
  `foto_fasilitas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas_kamar`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(11, 'wifi', 'Passwordnya : inihotel300604', 'wifi.png'),
(12, 'kulkasmini', 'cocok untuk menyimpan makanan dan minuman ', 'kulkasmini.jpg'),
(13, 'Meja Kamar', 'Tersedia 1 meja kamar disetiap kamar', 'meja kamar.png'),
(14, 'Dispenser', 'Dispenser Galon Bawah', 'dispenser.jpg'),
(15, 'Tipe Matras', 'Tambahan Kasur jiga ingin tidur dibawah', 'tipe Matras.jpg'),
(16, 'AC', 'Tersedia Disetiap Kamar', 'ac.jpg'),
(17, 'sofa', 'Tersedia satu sofa panjang', 'sofa.jpg');

--
-- Trigger `tbl_fasilitas_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusFasilitasKamar` AFTER DELETE ON `tbl_fasilitas_kamar` FOR EACH ROW DELETE FROM tbl_detail_kamar WHERE id_fasilitas_kamar=OLD.id_fasilitas_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) NOT NULL,
  `tipe_kamar` enum('standar','single','deluxe','suite') NOT NULL,
  `foto_kamar` varchar(150) NOT NULL,
  `jml_kamar` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `harga_kamar`, `tipe_kamar`, `foto_kamar`, `jml_kamar`) VALUES
(3, 350000, 'deluxe', 'deluxe.jpg', 7),
(4, 550000, 'suite', 'suitekamar.jpg', 5),
(6, 250000, 'standar', 'standar.jpeg', 7);

--
-- Trigger `tbl_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusDetailKamar` AFTER DELETE ON `tbl_kamar` FOR EACH ROW delete from tbl_detail_kamar where tbl_detail_kamar.id_kamar=old.id_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `no_handphone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `jml_kamar_dipesan` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `status` enum('in','out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `nama_pemesan`, `no_handphone`, `email`, `nama_tamu`, `jml_kamar_dipesan`, `id_kamar`, `tgl_cek_in`, `tgl_cek_out`, `status`) VALUES
(1, 'nilam', '08921019', 'nilam@gmail.com', 'lala', 1, 3, '2022-03-29', '2022-03-31', 'in'),
(6, 'Rizka ', '081212', 'kaa@gmail.com', 'Sadel', 2, 6, '2022-04-01', '2022-04-03', 'in');

--
-- Trigger `tbl_reservasi`
--
DELIMITER $$
CREATE TRIGGER `infoJmlKamar` AFTER UPDATE ON `tbl_reservasi` FOR EACH ROW BEGIN
   	 IF (NEW.status='in') THEN
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar-OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;
   	 ELSE
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar+OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;   	 
   	 END IF;    
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  ADD PRIMARY KEY (`id_detail_kamar`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_fasilitas_kamar` (`id_fasilitas_kamar`);

--
-- Indeks untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  ADD PRIMARY KEY (`id_fasilitas_hotel`);

--
-- Indeks untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas_kamar`);

--
-- Indeks untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  MODIFY `id_detail_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  MODIFY `id_fasilitas_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
