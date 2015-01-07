-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 07. Januari 2015 jam 10:40
-- Versi Server: 5.1.41
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `enterprise`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE IF NOT EXISTS `akun` (
  `akunid` int(25) NOT NULL AUTO_INCREMENT,
  `memberid` bigint(50) NOT NULL,
  `nama_akun` varchar(250) NOT NULL,
  `tanggal_lahir` varchar(20) NOT NULL,
  `jenis_kelamin` int(5) NOT NULL,
  `jabatanid` int(25) NOT NULL,
  `handphone` int(35) NOT NULL,
  `provinsiid` int(25) NOT NULL,
  `kotaid` int(25) NOT NULL,
  `kecamatanid` int(25) NOT NULL,
  `alamat` int(11) NOT NULL,
  `jam` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  PRIMARY KEY (`akunid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `badan_hukum`
--

CREATE TABLE IF NOT EXISTS `badan_hukum` (
  `badan_hukumid` int(25) NOT NULL AUTO_INCREMENT,
  `nama_badan_hukum` varchar(60) NOT NULL,
  PRIMARY KEY (`badan_hukumid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `barangid` bigint(25) NOT NULL AUTO_INCREMENT,
  `cabangid` bigint(25) NOT NULL,
  `akunid` bigint(25) NOT NULL,
  `barang_usahaid` bigint(25) NOT NULL,
  `nama_barang` longtext NOT NULL,
  `expired` varchar(30) NOT NULL,
  `stok` bigint(50) NOT NULL,
  `harga_pokok` bigint(100) NOT NULL,
  `persen_untung` int(100) NOT NULL,
  `diskon` int(30) NOT NULL,
  `harga_jual` bigint(100) NOT NULL,
  `keterangan` longtext NOT NULL,
  `jam` varchar(15) NOT NULL,
  `tanggal` varchar(15) NOT NULL,
  PRIMARY KEY (`barangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_usaha`
--

CREATE TABLE IF NOT EXISTS `barang_usaha` (
  `barang_usahaid` bigint(30) NOT NULL,
  `jualan_usahaid` bigint(30) NOT NULL,
  `kode_barang_usaha` varchar(30) NOT NULL,
  `nama _barang_usaha` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang`
--

CREATE TABLE IF NOT EXISTS `cabang` (
  `cabangid` int(25) NOT NULL AUTO_INCREMENT,
  `usahaid` int(25) NOT NULL,
  `jenis_usahaid` int(25) NOT NULL,
  `jualan_usahaid` int(25) NOT NULL,
  `faxid` int(25) NOT NULL,
  `provinsiid` int(25) NOT NULL,
  `kotaid` int(25) NOT NULL,
  `kecamatan` int(25) NOT NULL,
  `alamat` longtext NOT NULL,
  PRIMARY KEY (`cabangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `chatid` bigint(30) NOT NULL AUTO_INCREMENT,
  `senderid` bigint(30) NOT NULL,
  `receiverid` bigint(30) NOT NULL,
  `chat` longtext NOT NULL,
  `time` varchar(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi_akun`
--

CREATE TABLE IF NOT EXISTS `detail_transaksi_akun` (
  `detail_transaksi_akunid` bigint(30) NOT NULL AUTO_INCREMENT,
  `transaksi_akunid` bigint(30) NOT NULL,
  `barangid` bigint(30) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `subtotal` bigint(30) NOT NULL,
  PRIMARY KEY (`detail_transaksi_akunid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi_usaha`
--

CREATE TABLE IF NOT EXISTS `detail_transaksi_usaha` (
  `detail_transaksi_usahaid` bigint(30) NOT NULL AUTO_INCREMENT,
  `transaksi_usahaid` bigint(30) NOT NULL,
  `barangid` bigint(30) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `subtotal` bigint(30) NOT NULL,
  PRIMARY KEY (`detail_transaksi_usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fax`
--

CREATE TABLE IF NOT EXISTS `fax` (
  `faxid` int(25) NOT NULL AUTO_INCREMENT,
  `usahaid` int(25) NOT NULL,
  `nomor_fax` varchar(40) NOT NULL,
  PRIMARY KEY (`faxid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `forumid` bigint(50) NOT NULL,
  `memberid` bigint(50) NOT NULL,
  `nama_forum` longtext NOT NULL,
  `sifat` int(15) NOT NULL,
  `jam` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `handphone`
--

CREATE TABLE IF NOT EXISTS `handphone` (
  `handphoneid` int(25) NOT NULL AUTO_INCREMENT,
  `usahaid` int(25) NOT NULL,
  `nomor_handphone` int(35) NOT NULL,
  PRIMARY KEY (`handphoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
  `jabatanid` int(30) NOT NULL AUTO_INCREMENT,
  `kode_jabatan` varchar(30) NOT NULL,
  `jualan_usahaid` bigint(30) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  PRIMARY KEY (`jabatanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_usaha`
--

CREATE TABLE IF NOT EXISTS `jenis_usaha` (
  `jenis_usahaid` int(30) NOT NULL AUTO_INCREMENT,
  `nama_jenis_usaha` varchar(240) NOT NULL,
  PRIMARY KEY (`jenis_usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `join_forum`
--

CREATE TABLE IF NOT EXISTS `join_forum` (
  `join_forumid` bigint(40) NOT NULL AUTO_INCREMENT,
  `forum_usahaid` bigint(40) NOT NULL,
  `memberid` bigint(40) NOT NULL,
  `status` int(40) NOT NULL,
  PRIMARY KEY (`join_forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jualanusaha`
--

CREATE TABLE IF NOT EXISTS `jualanusaha` (
  `jualan_usahaid` int(25) NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(250) NOT NULL,
  PRIMARY KEY (`jualan_usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE IF NOT EXISTS `kecamatan` (
  `kecamatanid` int(25) NOT NULL AUTO_INCREMENT,
  `kode_kecamatan` int(25) NOT NULL,
  `nama_kecamatan` varchar(150) NOT NULL,
  PRIMARY KEY (`kecamatanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
  `kotaid` int(25) NOT NULL AUTO_INCREMENT,
  `kode_kota` int(25) NOT NULL,
  `nama_kota` varchar(150) NOT NULL,
  PRIMARY KEY (`kotaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `memberid` bigint(100) NOT NULL AUTO_INCREMENT,
  `username` longtext NOT NULL,
  `password` longtext NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menuid` bigint(30) NOT NULL AUTO_INCREMENT,
  `parentid` bigint(30) NOT NULL,
  `jualanusahaid` bigint(30) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `url` longtext NOT NULL,
  `urutan` int(20) NOT NULL,
  `c` int(10) NOT NULL,
  `r` int(10) NOT NULL,
  `u` int(10) NOT NULL,
  `d` int(10) NOT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE IF NOT EXISTS `provinsi` (
  `provinsiid` int(25) NOT NULL AUTO_INCREMENT,
  `kode_provinsi` int(25) NOT NULL,
  `nama_provinsi` varchar(150) NOT NULL,
  PRIMARY KEY (`provinsiid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sharing_forum`
--

CREATE TABLE IF NOT EXISTS `sharing_forum` (
  `sharing_forumid` bigint(50) NOT NULL AUTO_INCREMENT,
  `forumid` bigint(50) NOT NULL,
  `memberid` bigint(50) NOT NULL,
  `konten` longtext NOT NULL,
  `jam` int(11) NOT NULL,
  `tanggal` int(11) NOT NULL,
  PRIMARY KEY (`sharing_forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `staf`
--

CREATE TABLE IF NOT EXISTS `staf` (
  `stafid` int(25) NOT NULL AUTO_INCREMENT,
  `akunid` int(25) NOT NULL,
  `usahaid` int(25) NOT NULL,
  PRIMARY KEY (`stafid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `telepon`
--

CREATE TABLE IF NOT EXISTS `telepon` (
  `teleponid` int(25) NOT NULL AUTO_INCREMENT,
  `usahaid` int(25) NOT NULL,
  `nomor_telepon` int(30) NOT NULL,
  PRIMARY KEY (`teleponid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_akun`
--

CREATE TABLE IF NOT EXISTS `transaksi_akun` (
  `transaksi_akunid` bigint(30) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(50) NOT NULL,
  `usahaid` bigint(30) NOT NULL,
  `akunids` bigint(30) NOT NULL,
  `akunid` bigint(30) NOT NULL,
  `total` bigint(30) NOT NULL,
  `jam` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`transaksi_akunid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_satuan_akun`
--

CREATE TABLE IF NOT EXISTS `transaksi_satuan_akun` (
  `transaksi_satuan_akunid` bigint(30) NOT NULL AUTO_INCREMENT,
  `transaksi_akunid` bigint(30) NOT NULL,
  `barangid` bigint(30) NOT NULL,
  `usahaid` bigint(30) NOT NULL,
  `akunid` bigint(30) NOT NULL,
  `nama_akun` varchar(240) NOT NULL,
  `jumlah` int(40) NOT NULL,
  `jam` varchar(40) NOT NULL,
  `tanggal` varchar(40) NOT NULL,
  PRIMARY KEY (`transaksi_satuan_akunid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_satuan_usaha`
--

CREATE TABLE IF NOT EXISTS `transaksi_satuan_usaha` (
  `transaksi_satuan_usahaid` bigint(30) NOT NULL AUTO_INCREMENT,
  `transaksi_usahaid` bigint(30) NOT NULL,
  `barangid` bigint(30) NOT NULL,
  `usahaids` bigint(30) NOT NULL,
  `usahaid` bigint(30) NOT NULL,
  `jumlah` int(40) NOT NULL,
  `jam` varchar(40) NOT NULL,
  `tanggal` varchar(40) NOT NULL,
  PRIMARY KEY (`transaksi_satuan_usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_usaha`
--

CREATE TABLE IF NOT EXISTS `transaksi_usaha` (
  `transaksi_usahaid` bigint(30) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(50) NOT NULL,
  `usahaids` bigint(30) NOT NULL,
  `usahaid` bigint(30) NOT NULL,
  `total` bigint(30) NOT NULL,
  `jam` varchar(20) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`transaksi_usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `usaha`
--

CREATE TABLE IF NOT EXISTS `usaha` (
  `usahaid` int(20) NOT NULL AUTO_INCREMENT,
  `memberid` bigint(50) NOT NULL,
  `badan_hukumid` int(20) NOT NULL,
  `nama_usaha` varchar(240) NOT NULL,
  `jam` varchar(10) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  PRIMARY KEY (`usahaid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
