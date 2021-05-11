-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 22, 2020 at 07:20 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecake`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--
create database onlinecakeshop;
use onlinecakeshop;
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartNo` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) DEFAULT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `customerId` varchar(100) DEFAULT NULL,
  `pimage` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`cartNo`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartNo`, `itemId`, `itemName`, `customerId`, `pimage`, `quantity`, `price`) VALUES
(26, 13, 'Strawberry', '', 'sm.jpg', 1, 450),
(41, 10, 'Chocolate', '', 'ci.jpg', 1, 500),
(42, 20, 'Pineapple', '', 'pi.jpg', 1, 500),
(43, 20, 'Pineapple', '', 'pi.jpg', 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `csr`
--

DROP TABLE IF EXISTS `csr`;
CREATE TABLE IF NOT EXISTS `csr` (
  `csrNo` int(11) NOT NULL AUTO_INCREMENT,
  `employeeId` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userpwd` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  PRIMARY KEY (`csrNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csr`
--

INSERT INTO `csr` (`csrNo`, `employeeId`, `username`, `userpwd`, `firstname`, `lastname`) VALUES
(1, 'mahenoormansuri19@gmail.com', 'Mahenoor', 'bn', 'mahenoor', 'mansuri'),
(2, 'Prajaktachengda@gmail.com', 'Prajakta chengda', 'm12345678', 'Prajakta', 'chengda');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerNo` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `userpwd` varchar(30) DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerNo`, `customerId`, `username`, `userpwd`, `firstname`, `lastname`, `address`, `city`, `postalCode`) VALUES
(6, 'mahenoormansuri19@gmail.com', 'Mahenoor Mansuri', 'm12345678', 'Mahenoor', 'Mansuri', '107 sarang street khatri jamat bldg room no 13 ', 'mumbai', '400003');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) DEFAULT NULL,
  `itemName` varchar(100) DEFAULT NULL,
  `customerId` varchar(100) DEFAULT NULL,
  `pimage` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `orderStatus` varchar(100) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `product_image` varchar(20) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`itemId`, `itemName`, `category`, `price`, `product_image`, `content`, `quantity`) VALUES
(1, 'Vanilla', 'Cupcakes', '30.00', 'vc.jpg', 'testing', 19),
(2, 'Vanilla', 'BirthdayCakes', '300.00', 'vb.jpg', 'testing', 50),
(3, 'Vanilla', 'MarriageCakes', '500.00', 'vm.jpg', 'testing', 30),
(5, 'vanilla', 'Icecakes', '400.00', 'vi.jpg', 'testing', 30),
(6, 'Chocolate', 'Cupcakes', '40.00', 'cc.jpg', 'testing', 30),
(7, 'Chocolate', 'BirthdayCakes', '400.00', 'cb.jpg', 'testing', 50),
(8, 'Chocolate', 'MarriageCakes', '550.00', 'cm.jpg', 'testing', 30),
(9, 'Chocolate', 'Pastery', '70.00', 'cp.jpg', 'testing', 40),
(10, 'Chocolate', 'Icecakes', '500.00', 'ci.jpg', 'testing', 30),
(11, 'Strawberry', 'Cupcakes', '35.00', 'sc.jpg', 'testing', 35),
(12, 'Strawberry', 'BirthdayCakes', '350.00', 'sb.jpg', 'testing', 50),
(13, 'Strawberry', 'MarriageCakes', '450.00', 'sm.jpg', 'testing', 30),
(14, 'Strawberry', 'Pastery', '60.00', 'sp.jpg', 'testing', 39),
(15, 'Strawberry', 'Icecakes', '450.00', 'si.jpg', 'testing', 30),
(16, 'Pineapple', 'Cupcakes', '30.00', 'pc.jpg', 'testing', 20),
(17, 'Pineapple', 'BirthdayCakes', '450.00', 'pb.jpg', 'testing', 50),
(18, 'Pineapple', 'MarriageCakes', '350.00', 'pm.jpg', 'testing', 30),
(19, 'Pineapple', 'Pastery', '70.00', 'pp.jpg', 'testing', 40),
(20, 'Pineapple', 'Icecakes', '500.00', 'pi.jpg', 'testing', 30),
(21, 'Butterscotch', 'Cupcakes', '200.00', 'bc.jpg', 'testing', 25),
(22, 'Butterscotch', 'BirthdayCakes', '300.00', 'bb.jpg', 'testing', 60),
(23, 'Butterscotch', 'MarriageCakes', '400.00', 'bm.jpg', 'testing', 35),
(24, 'Butterscotch', 'Pastery', '30.00', 'bp.jpg', 'mycakeshop', 20),
(25, 'Butterscotch', 'Icecakes', '600.00', 'bi.jpg', 'testing', 30),
(33, 'Vanilla', 'Pastery', '20.00', 'vp.jpg', 'testing', 30);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
