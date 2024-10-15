-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 03:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `macasddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `productID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `statusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`productID`, `orderID`, `qty`, `unitprice`, `discount`, `statusID`) VALUES
(1, 1, 0, 0, 0, 0),
(2, 2, 0, 0, 0, 0),
(3, 3, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0),
(5, 5, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `cus` varchar(100) NOT NULL,
  `orderdate` date DEFAULT NULL,
  `shippeddate` date DEFAULT NULL,
  `shipperID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `empID`, `custID`, `cus`, `orderdate`, `shippeddate`, `shipperID`) VALUES
(1, 1, 0, '', NULL, NULL, 0),
(2, 2, 0, '', NULL, NULL, 0),
(3, 3, 0, '', NULL, NULL, 0),
(4, 4, 0, '', NULL, NULL, 0),
(5, 5, 0, '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `productcode` varchar(20) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `standardcost` int(11) NOT NULL,
  `listprice` int(11) NOT NULL,
  `reorderlevel` int(11) NOT NULL,
  `targetlevel` int(11) NOT NULL,
  `qtyu` varchar(100) NOT NULL,
  `discontinued` int(11) NOT NULL,
  `mrqty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `productcode`, `productname`, `description`, `standardcost`, `listprice`, `reorderlevel`, `targetlevel`, `qtyu`, `discontinued`, `mrqty`) VALUES
(1, 'p001', 'chippy', NULL, 0, 0, 0, 0, '', 0, 0),
(2, 'p002', 'piatoss', NULL, 0, 0, 0, 0, '', 0, 0),
(3, 'p003', 'mrchips', NULL, 0, 0, 0, 0, '', 0, 0),
(4, 'p004', 'pretzel', NULL, 0, 0, 0, 0, '', 0, 0),
(5, 'p005', 'clover', NULL, 0, 0, 0, 0, '', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`productID`,`orderID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
