-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jun 2024 pada 14.47
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website_perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(20) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `tahun_terbit` int(4) NOT NULL,
  `file` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `penulis`, `penerbit`, `tahun_terbit`, `file`, `image`, `created_at`) VALUES
(6, 'Megalodon', 'Muchib', 'Muchib Jaya Perkasa', 2021, 'Tugas 4_22082010249_Agung Andhika Saputra (1).pdf', '106466_f.jpg', '2024-06-05 00:26:01'),
(7, 'asa', 'adada', 'dadaa', 2020, 'TUGAS 4_22082010233_Ardhito Reynata.pdf', '106466_f.jpg', '2024-06-05 00:26:01'),
(8, 'asdasdasdasd', 'sadasda', 'dito', 2023, 'TUGAS 4_22082010233_Ardhito Reynata.pdf', 'KumpulanCerita.jpg', '2024-06-05 00:26:01'),
(9, 'asdasdasdasd', 'xzczczx', 'cczxczxczx', 2023, 'Laporan_Pengabdian_Masyrakat_Kelompok_4_Pendidikan_Pancasila[1].pdf', '106466_f.jpg', '2024-06-05 00:26:01'),
(10, 'sadasdasd', 'xzczczx', 'cczxczxczx', 2022, 'mahasiswa_0d160436-9495-423c-8556-58da12967d3b.pdf', 'KumpulanCerita.jpg', '2024-06-05 00:26:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `otoritas` enum('MEMBER','ADMIN') NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `otoritas`, `nama_lengkap`, `alamat`, `telepon`, `image`, `created_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', 'ADMIN', 'Administratorr', 'UPN Veteran Jawa Timur', '08970864932', 'Default_Profile.png', '2024-06-05 00:08:10'),
(15, 'Dito', '22082010233@student.upnjatim.ac.id', 'dito1234', 'ADMIN', 'Ardhito Reynata', 'Rungkut Asri', '082139962799', 'Logo.png', '2024-06-05 00:08:10'),
(16, 'Agung', '22082010249@student.upnjatim.ac.id', 'agung2003', 'ADMIN', 'Agung Andhika Saputra', 'Gunung Anyar', '08123456789', '', '2024-06-05 00:08:10'),
(17, 'mbahman', '22082010228@student.upnjatim.ac.id', 'mbahman123', 'ADMIN', 'Alfan Dwi Cahya', 'Tropodo Indah', '08763213256', '', '2024-06-05 00:08:10'),
(18, 'Dyra', 'dytajanuartimarsa@gmail.com', 'dyra123', 'MEMBER', 'Dyta Januarti Marsa', 'Sidosermo Indah', '08768758798', '', '2024-06-05 00:08:10'),
(19, 'Satria', 'satriaramadhan@gmail.com', 'satria123', 'MEMBER', 'Muhammad Satria Ramadhan', 'Lidah Wetan', '08868859985', '', '2024-06-05 00:08:10'),
(20, 'Ariq', 'akhtarariq@gmail.com', 'ariq123', 'MEMBER', 'Akhtar Ariq', 'Pandugo Indah', '08123124521', '', '2024-06-05 00:08:10'),
(21, 'Hangg', 'naufalhanggara@gmail.com', 'hang123', 'MEMBER', 'Naufal Hanggara', 'Lidah Kulon', '089582364982', '', '2024-06-05 00:08:10'),
(27, 'vxsssd', 'hhdiah@gmail.com', 'dadada', 'MEMBER', 'dito reynataz', 'Rungkut', '08970865932', '', '2024-06-05 00:15:24'),
(28, 'saasa', 'ardhito.reynata@yahoo.com', 'assasa', 'ADMIN', 'dito reynataz12', 'amkdjak', '08970865932', '', '2024-06-05 00:21:56'),
(29, 'Yudi', 'yudilapas@gmail.com', 'yudi1234', 'MEMBER', 'Yudi Lapas', 'Banyuwangi', '08970865932', '', '2024-06-05 01:23:37'),
(30, 'Dika', 'dikakuasa@gmail.com', 'dika123', 'MEMBER', 'Dika', 'Gunung Anyar', '08873819619', '', '2024-06-05 20:37:05'),
(32, 'Bismillah', 'bismillah@gmail.com', 'bismillah', 'MEMBER', 'Bismillah', 'dasdas', '089708659325', '', '2024-06-06 00:30:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
