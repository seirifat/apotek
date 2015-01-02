-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2015 at 11:13 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `bentuk`
--

CREATE TABLE IF NOT EXISTS `bentuk` (
  `bentukid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_bentuk` varchar(10) DEFAULT NULL,
  `nama_bentuk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bentukid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_pemesanan_obat`
--

CREATE TABLE IF NOT EXISTS `daftar_pemesanan_obat` (
  `daftar_pemesanan_barangid` int(50) NOT NULL AUTO_INCREMENT,
  `pemesanan_obatid` int(11) NOT NULL,
  `obatid` int(11) NOT NULL,
  `jumlah` int(10) NOT NULL,
  PRIMARY KEY (`daftar_pemesanan_barangid`),
  KEY `fk_obat` (`obatid`),
  KEY `fk_pemesanan_obatid` (`pemesanan_obatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_akses`
--

CREATE TABLE IF NOT EXISTS `detail_akses` (
  `detail_aksesid` int(25) NOT NULL AUTO_INCREMENT,
  `kode_aksesid` int(11) NOT NULL,
  `jabatanid` int(11) NOT NULL,
  `keterangan` longtext NOT NULL,
  PRIMARY KEY (`detail_aksesid`),
  KEY `fk_jabatan` (`jabatanid`),
  KEY `fk_kode_akses` (`kode_aksesid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE IF NOT EXISTS `detail_transaksi` (
  `detailtransaksiid` int(11) NOT NULL AUTO_INCREMENT,
  `transaksiid` int(11) DEFAULT NULL,
  `obatid` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`detailtransaksiid`),
  KEY `fk_transaksi` (`transaksiid`),
  KEY `fk_obat` (`obatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `distributorid` int(50) NOT NULL AUTO_INCREMENT,
  `kode_distributor` varchar(10) DEFAULT NULL,
  `nama_distributor` varchar(130) DEFAULT NULL,
  `alamat` varchar(240) DEFAULT NULL,
  `no_kontak_1` varchar(20) DEFAULT NULL,
  `no_kontak_2` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `kode_pos` varchar(20) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`distributorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`distributorid`, `kode_distributor`, `nama_distributor`, `alamat`, `no_kontak_1`, `no_kontak_2`, `email`, `fax`, `kode_pos`, `status`) VALUES
(1, 'S', 'PT. Alpha', 'itu', '099', '022', 'a@a.coy', '420741', '4039', 1),
(2, 'A', 'CV. Beta', 'Cikutra', '747', '289237', 'b@b.coy', '2736', '40391', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
  `jabatanid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jabatan` varchar(10) DEFAULT NULL,
  `nama_jabatan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`jabatanid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`jabatanid`, `kode_jabatan`, `nama_jabatan`) VALUES
(1, 'ADM', 'Admin'),
(2, 'KSR', 'Kasir'),
(3, 'APT', 'Apoteker'),
(4, 'PLK', 'Pemilik');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE IF NOT EXISTS `jenis` (
  `jenisid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jenis` varchar(10) DEFAULT NULL,
  `nama_jenis` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jenisid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE IF NOT EXISTS `karyawan` (
  `karyawanid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_karyawan` varchar(10) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_karyawan` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `jabatanid` int(11) DEFAULT NULL,
  `kode_aksesid` int(11) DEFAULT NULL,
  `handphone` varchar(100) DEFAULT NULL,
  `alamat` longtext,
  PRIMARY KEY (`karyawanid`),
  KEY `fk_jabatan` (`jabatanid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawanid`, `kode_karyawan`, `username`, `password`, `nama_karyawan`, `tanggal_lahir`, `jenis_kelamin`, `jabatanid`, `kode_aksesid`, `handphone`, `alamat`) VALUES
(1, 'ADM01', 'centaury', '579463e94b675f7ecbc4ae0ec0b4d6f7', NULL, '1991-09-19', 'Pria', 1, NULL, NULL, NULL),
(2, 'ADM01', 'cibs', 'a045363994a92d17354094ee0318302c', 'cibs', '2015-01-01', 'P', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kemasan`
--

CREATE TABLE IF NOT EXISTS `kemasan` (
  `kemasanid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kemasan` varchar(35) DEFAULT NULL,
  `nama_kemasan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`kemasanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kode_akses`
--

CREATE TABLE IF NOT EXISTS `kode_akses` (
  `kode_aksesid` int(20) NOT NULL AUTO_INCREMENT,
  `kode_akses` varchar(30) NOT NULL,
  `menuid` int(11) NOT NULL,
  `c` int(5) NOT NULL,
  `r` int(5) NOT NULL,
  `u` int(5) NOT NULL,
  `d` int(5) NOT NULL,
  PRIMARY KEY (`kode_aksesid`),
  KEY `fk_menu` (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menuid` int(20) NOT NULL AUTO_INCREMENT,
  `parentid` int(20) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `url` longtext NOT NULL,
  `urutan` int(15) NOT NULL,
  `c` int(5) NOT NULL,
  `r` int(5) NOT NULL,
  `u` int(5) NOT NULL,
  `d` int(5) NOT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuid`, `parentid`, `nama_menu`, `url`, `urutan`, `c`, `r`, `u`, `d`) VALUES
(1, 0, 'Kasir', 'kasir', 1, 1, 1, 1, 1),
(3, 0, 'Obat', 'obat', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `obatid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_obat` varchar(10) DEFAULT NULL,
  `nama_obat` varchar(100) DEFAULT NULL,
  `jenisid` int(11) DEFAULT NULL,
  `tablet_strip` int(11) DEFAULT NULL,
  `kemasanid` int(11) DEFAULT NULL,
  `bentukid` int(11) DEFAULT NULL,
  `ukuran` varchar(100) DEFAULT NULL,
  `expired` date DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga_pokok` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `indikasi` longtext,
  PRIMARY KEY (`obatid`),
  KEY `fk_jenis` (`jenisid`),
  KEY `fk_bentuk` (`bentukid`),
  KEY `fk_kemasan` (`kemasanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_obat`
--

CREATE TABLE IF NOT EXISTS `pemesanan_obat` (
  `pemesanan_obatid` int(20) NOT NULL AUTO_INCREMENT,
  `kode_pemesanan` varchar(10) NOT NULL,
  `karyawanid` int(11) DEFAULT NULL,
  `supplierid` int(11) NOT NULL,
  `status_pemesanan` int(5) NOT NULL,
  `status_komunikasi` int(5) NOT NULL,
  `jenis_komunikasi` varchar(20) NOT NULL,
  PRIMARY KEY (`pemesanan_obatid`),
  KEY `fk_supplier` (`supplierid`),
  KEY `fk_karyawan` (`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE IF NOT EXISTS `pendapatan` (
  `pendapatanid` int(11) NOT NULL AUTO_INCREMENT,
  `sistem_waktu` varchar(10) NOT NULL,
  `total` bigint(140) NOT NULL,
  `tahun` int(10) NOT NULL,
  PRIMARY KEY (`pendapatanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE IF NOT EXISTS `pengeluaran` (
  `pengeluaranid` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengeluaran` varchar(100) DEFAULT NULL,
  `tanggal_pengeluaran` date DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  PRIMARY KEY (`pengeluaranid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplierid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(20) NOT NULL,
  `distributorid` int(11) NOT NULL,
  `nama_supplier` varchar(20) NOT NULL,
  `kode_jabatan` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(5) NOT NULL,
  `no_kontak_1` varchar(20) NOT NULL,
  `no_kontak_2` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` int(5) NOT NULL,
  PRIMARY KEY (`supplierid`),
  KEY `fk_distributor` (`distributorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksiid` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(10) DEFAULT NULL,
  `karyawanid` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaksiid`),
  KEY `fk_karyawan` (`karyawanid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_satuan`
--

CREATE TABLE IF NOT EXISTS `transaksi_satuan` (
  `transaksisatuanid` int(11) NOT NULL AUTO_INCREMENT,
  `obatid` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaksisatuanid`),
  KEY `fk_obat` (`obatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_pemesanan_obat`
--
ALTER TABLE `daftar_pemesanan_obat`
  ADD CONSTRAINT `daftar_pemesanan_obat_ibfk_1` FOREIGN KEY (`obatid`) REFERENCES `obat` (`obatid`),
  ADD CONSTRAINT `daftar_pemesanan_obat_ibfk_2` FOREIGN KEY (`pemesanan_obatid`) REFERENCES `pemesanan_obat` (`pemesanan_obatid`);

--
-- Constraints for table `detail_akses`
--
ALTER TABLE `detail_akses`
  ADD CONSTRAINT `detail_akses_ibfk_1` FOREIGN KEY (`jabatanid`) REFERENCES `jabatan` (`jabatanid`),
  ADD CONSTRAINT `detail_akses_ibfk_2` FOREIGN KEY (`kode_aksesid`) REFERENCES `kode_akses` (`kode_aksesid`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`transaksiid`) REFERENCES `transaksi` (`transaksiid`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`obatid`) REFERENCES `obat` (`obatid`);

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`jabatanid`) REFERENCES `jabatan` (`jabatanid`);

--
-- Constraints for table `kode_akses`
--
ALTER TABLE `kode_akses`
  ADD CONSTRAINT `kode_akses_ibfk_1` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`);

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`jenisid`) REFERENCES `jenis` (`jenisid`),
  ADD CONSTRAINT `obat_ibfk_2` FOREIGN KEY (`bentukid`) REFERENCES `bentuk` (`bentukid`),
  ADD CONSTRAINT `obat_ibfk_3` FOREIGN KEY (`kemasanid`) REFERENCES `kemasan` (`kemasanid`);

--
-- Constraints for table `pemesanan_obat`
--
ALTER TABLE `pemesanan_obat`
  ADD CONSTRAINT `pemesanan_obat_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `supplier` (`supplierid`),
  ADD CONSTRAINT `pemesanan_obat_ibfk_2` FOREIGN KEY (`karyawanid`) REFERENCES `karyawan` (`karyawanid`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`distributorid`) REFERENCES `distributor` (`distributorid`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`karyawanid`) REFERENCES `karyawan` (`karyawanid`);

--
-- Constraints for table `transaksi_satuan`
--
ALTER TABLE `transaksi_satuan`
  ADD CONSTRAINT `transaksi_satuan_ibfk_1` FOREIGN KEY (`obatid`) REFERENCES `obat` (`obatid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
