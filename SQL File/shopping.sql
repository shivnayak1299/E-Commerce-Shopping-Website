-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 12:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `billingAddress` varchar(255) DEFAULT NULL,
  `biilingCity` varchar(150) DEFAULT NULL,
  `billingState` varchar(100) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `billingCountry` varchar(100) DEFAULT NULL,
  `shippingAddress` varchar(300) DEFAULT NULL,
  `shippingCity` varchar(150) DEFAULT NULL,
  `shippingState` varchar(100) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `shippingCountry` varchar(100) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userId`, `billingAddress`, `biilingCity`, `billingState`, `billingPincode`, `billingCountry`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingPincode`, `shippingCountry`, `postingDate`) VALUES
(1, 1, 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', 'A 456 ABC Street', 'Noida', 'Uttar Pradesh', 201301, 'India', '2022-01-29 11:57:11'),
(2, 1, 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', 'D 32 Bihari Puram Bye Pass Road', 'Aligarh', 'Uttar Pradesh', 202001, 'India', '2022-01-29 12:01:03'),
(3, 4, 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', 'H 4556 XYZ Aparment', 'Ghaziabad', 'UP', 201017, 'India', '2022-03-05 07:43:52'),
(4, 7, 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', 'H 456 XYZ Apartment', 'Ghaziabad', 'UP', 201017, 'India', '2022-03-06 12:49:36'),
(5, 8, 'sundernagar', 'jsr', 'jharkhand', 832107, 'india', 'sundernagar', 'jsr', 'jharkhand', 832107, 'india', '2023-05-21 04:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productQty` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userID`, `productId`, `productQty`, `postingDate`) VALUES
(14, 4, 22, 1, '2022-03-05 09:01:49'),
(15, 4, 18, 1, '2022-03-05 09:06:30'),
(16, 4, 16, 1, '2022-03-05 09:07:08'),
(23, 8, 31, 1, '2023-06-01 05:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`, `createdBy`) VALUES
(4, 'Electronics', 'Electronic Products', '2017-01-24 19:19:32', '2022-01-12 06:34:18', 1),
(5, 'Furniture', 'test', '2017-01-24 19:19:54', '2022-01-12 06:34:23', 1),
(6, 'Fashion', 'Fashion', '2017-02-20 19:18:52', '2022-01-12 06:34:24', 1),
(12, 'Smartphones', 'smartphones', '2023-05-30 07:09:52', NULL, 1),
(14, 'Toys', 'Toys for kids', '2023-05-30 07:39:58', NULL, 1),
(15, 'Watches', 'Smartwatches and Analog Watches', '2023-05-30 07:45:37', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `txnType` varchar(200) DEFAULT NULL,
  `txnNumber` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(120) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderNumber`, `userId`, `addressId`, `totalAmount`, `txnType`, `txnNumber`, `orderStatus`, `orderDate`) VALUES
(2, 949442910, 1, 2, 23849.00, 'e-Wallet', 'DHJG785678', 'Packed', '2022-01-30 07:57:56'),
(3, 394232787, 1, 1, 50109.00, 'Internet Banking', '5435345', 'Delivered', '2022-01-30 16:57:11'),
(4, 954986689, 4, 3, 1790.00, 'Internet Banking', 'YHFF45456456', 'Cancelled', '2022-03-05 07:44:05'),
(5, 616492938, 4, 3, 4229.00, 'e-Wallet', 'PAYTM743653', 'Cancelled', '2022-03-05 08:42:31'),
(6, 146060168, 7, 4, 10999.00, 'e-Wallet', 'TGH728364', 'Dispatched', '2022-03-06 12:50:46'),
(7, 490487501, 8, 5, 379.00, 'Cash on Delivery', '', NULL, '2023-05-21 07:56:01'),
(8, 869929797, 8, 5, 240.00, 'Cash on Delivery', '', NULL, '2023-05-25 18:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetails`
--

CREATE TABLE `ordersdetails` (
  `id` int(11) NOT NULL,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordersdetails`
--

INSERT INTO `ordersdetails` (`id`, `orderNumber`, `userId`, `productId`, `quantity`, `orderDate`, `orderStatus`) VALUES
(1, 949442910, 1, 14, 1, '2022-01-30 07:57:56', NULL),
(2, 949442910, 1, 16, 2, '2022-01-30 07:57:56', NULL),
(3, 949442910, 1, 19, 1, '2022-01-30 07:57:56', NULL),
(4, 394232787, 1, 14, 2, '2022-01-30 16:57:11', NULL),
(5, 394232787, 1, 20, 1, '2022-01-30 16:57:11', NULL),
(6, 954986689, 4, 25, 1, '2022-03-05 07:44:05', NULL),
(7, 616492938, 4, 22, 1, '2022-03-05 08:42:31', NULL),
(8, 616492938, 4, 20, 1, '2022-03-05 08:42:31', NULL),
(10, 146060168, 7, 12, 1, '2022-03-06 12:50:47', NULL),
(11, 490487501, 8, 19, 1, '2023-05-21 07:56:01', NULL),
(12, 869929797, 8, 16, 1, '2023-05-25 18:03:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `actionBy` int(3) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `canceledBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `actionBy`, `postingDate`, `canceledBy`) VALUES
(1, 3, 'Packed', 'Products Has been Packed.', 1, '2022-02-06 05:23:10', NULL),
(2, 3, 'Dispatched', 'Products Dispatched.', 1, '2022-02-06 05:28:29', NULL),
(3, 3, 'In Transit', 'InTransit\r\n', 1, '2022-02-06 05:40:22', NULL),
(4, 3, 'Out For Delivery', 'Delivery man out for delivery.', 1, '2022-02-06 05:40:50', NULL),
(5, 3, 'Delivered', 'The order has been successfully delivered', 1, '2022-02-06 05:41:40', NULL),
(6, 2, 'Packed', 'Items Packed. Ready for Dispatched.', 1, '2022-02-06 05:52:46', NULL),
(7, 4, 'Packed', 'Product is Packed. Ready for dispatch.', 1, '2022-03-05 07:46:11', NULL),
(8, 4, 'Dispatched', 'Order is Disparched.', 1, '2022-03-05 07:47:32', NULL),
(9, 4, 'Cancelled', 'I want to cancel my order', NULL, '2022-03-05 08:29:49', 'User'),
(11, 5, 'Cancelled', 'The order is canceled. Products Out of Stock', 1, '2022-03-05 08:45:54', ' Admin'),
(12, 6, 'Packed', 'Order is Packed Waiting for dispatch.', 1, '2022-03-06 12:52:00', NULL),
(13, 6, 'Dispatched', 'Order is dispacthed.', 1, '2022-03-06 12:52:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productPriceBeforeDiscount` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `addedBy` int(11) DEFAULT NULL,
  `lastUpdatedBy` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `addedBy`, `lastUpdatedBy`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900.00, 0.00, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', 'cc661de12faf4a3b20a811c738dec6e6.jpg', 'fab56d7abeace039dc095046e21b3af8.jpg', 'micromax main image.jpg', 1200.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-21 05:26:58', 1, 1),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', 36990.00, 39999.00, '16 GB ROM\r\n11.94 cm (4.7 inch) Retina HD Display\r\n12MP Rear Camera | 5MP Front Camera\r\nA9 Chip with 64-bit Architecture and M9 Motion Co-processor', '0279fcde79af83758676b8c23c2f3e61jpeg', '60faa390cfa0b8e00d6ccf6a61f956f4jpeg', '99ea3b71f143a7df51e0b38fa28e20b4jpeg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:55:11', 1, 1),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', 9999.00, 0.00, '4 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n15.21 cm (5.99 inch) HD+ Display\r\n16MP + 2MP | 8MP Front Camera\r\n3760 mAh Battery', '2b3227340f77869b8cfdc3de8f9f4a88.jpg', 'ecb3c8181c59fa158cb2eeb8aa8c817e.jpg', 'lenovo-k6-power-k33a42-3.jpeg', 45.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-21 05:55:41', 1, 1),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999.00, 12999.00, '3 GB RAM | 32 GB ROM | Expandable Upto 128 GB\r\n13.97 cm (5.5 inch) Full HD Display\r\n13MP Rear Camera | 8MP Front Camera\r\n3500 mAh Li-Ion Polymer Battery\r\nMediatek Helio P10 64-bit Octa Core 1.8GHz Processor', 'eafcc2c2d016548c4ed6b284abba5466jpeg', '83736ea781b5c072733f1488e0db0060jpeg', '884904feaeb27cede8ec34a57b210043jpeg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:51:59', 1, 1),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', 6999.00, 7199.00, '3 GB RAM | 16 GB ROM | Expandable Upto 32 GB\r\n13.97 cm (5.5 inch) HD Display\r\n13MP Rear Camera | 5MP Front Camera\r\n2500 mAh Battery\r\nMT6735 Processor', '34abf79f2f0edf560a910da82ba99c3fjpeg', 'fefe2058ae6ba18ff5f86ac6187c9a9bjpeg', 'c88cfbe1837395e753b08665a9e5e5ecjpeg', 35.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:50:39', 1, 1),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490.00, 7999.00, '1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB\r\n12.7 cm (5 inch) HD Display\r\n8MP Rear Camera | 5MP Front Camera\r\n2600 mAh Li-Ion Battery\r\nExynos 3475 Quad Core 1.3GHz Processor', '32e9830eefa1c269bbb9a3234b9e5c7fjpeg', 'ee2ce923b7cd502fad72ceee7741f158jpeg', '04600344e7e729c7c1b26a27497b3634jpeg', 20.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:48:00', 1, 1),
(8, 4, 4, 'OPPO A57', 'OPPO', 14990.00, 15999.00, '3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n13.21 cm (5.2 inch) HD Display\r\n13MP Rear Camera | 16MP Front Camera\r\n2900 mAh Battery\r\nQualcomm Snapdragon 435 Octa Core 1.4GHz Processor', 'd4bb34d928ebe040f15f5a09485e1f7fjpeg', '58a739c3fdd9fb12934266be34d532e6jpeg', '7a9edb9edb6a8bc07076acd4930397cejpeg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:46:12', 1, 1),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259.00, 0.00, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', '7e345e9d13ce94464bacc12b07f59a14jpeg', 'e642e68e69c4fbd0d18d2ff362fb6a6djpeg', '9355557990f8d6997a0f7265f518d0aajpeg', 10.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:44:50', 1, 1),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990.00, 21999.00, 'Processor: intel pentium quad-core processor n4200 (2 mb L2 cache, 1.50 ghz, up to 2.6 ghz with intel burst technology, ddr3l 1600 mhz, 6 w)\r\nOperating system: this is a linux based laptop. requires separate purchase and installation of operating system software (like windows), not included in the box. Refer to acer website for drivers\r\nDisplay: 15.6\" hd 1366 x 768 resolution, high-brightness acer cine crystal tm led backlit tft lcd\r\nMemory and storage: 4gb ddr3 ram upgradeable upto 8gb ram with intel hd 620 integrated graphics storage: 1tb hdd 5400 rpm\r\nDesign and battery: laptop weight 2.4kg 24.6mm | lithium 6 cell battery upto 6.5 hours\r\nWarranty: this laptop comes with 1 year domestic onsite and (itw) international traveler warranty from acer covering manufacturing defects and not coverning physical damage\r\nLinux | in the box: laptop with included battery, charger, user guide and manuals\r\nPorts and cd drive: 2 usb2.0 | 1 USB 3.0 | 1 hdmi | 4-in-1 card reader (sd,sdhC,sdxc,mmc) | combo audio and microphone jack | with ethernet (rj-45) port ian port | with dvdrw 8x-drive', '6e0ef9575326db6a182ab34f87dadaec.jpg', '66c0d69dd9f8050b6cd9d9aa34765e89.jpg', '55019dcd8b5655409b62109b62749775.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:43:18', 1, 1),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41990.00, 42999.00, 'Processor: Intel Core i5-7440HQ (2.8 GHz base clock, up to 3.4 GHz max boost clock, 6 MB L3 cache, 4 cores)\r\nDisplay: 15.6-inch FHD (1920 x 1080), Slim, anti-glare, 300 nits\r\nMemory & Storage: 16 GB DDR4 SDRAM (2 x 8 GB) | 240 GB PCIe NVMe M.2 SSD\r\nGraphics : Integrated Intel HD Graphics 630\r\nPre-Installed: MS Office 2016 and Windows 10 pro', '8378c2c096fbc807cccd54b16e093d0d.jpg', 'fff8d95ba1b19847668486d6f8d04538.jpg', 'b7266e309c2d53dd3908fcff666ba638.jpg', 0.00, 'Out of Stock', '2022-01-18 06:03:28', '2022-01-23 09:49:13', 1, 1),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990.00, 24999.00, 'Free upgrade to Windows 11 when available* Disclaimer-*The Windows 11 upgrade will be delivered late 2021 into 2022. Specific timing varies by device. Certain features require specific hardware.\r\nProcessor: 11th Gen Intel Tiger Lake Core i5-1135G7 | Speed: 2.4 GHz (Base) - 4.2 GHz (Max) | 4 Cores | 8MB Cache\r\nOS: Pre-Loaded Windows 10 Home with Lifetime Validity\r\nPre-Installed: MS Office Home and Student 2019\r\nMemory and Storage: 16GB RAM DDR4-3200 | 512 GB SSD\r\nGraphics: Integrated Intel Iris Xe Graphics\r\nDisplay: 14\" 2.2K Display (2240x1400) | Brightness: 300 nits | Anti-Glare | IPS Technology | 100% sRGB\r\nDesign: 1.59 cm Thin and 1.38 kg Light | Aluminium Material Top | Backlit Keyboard\r\nBattery Life: 56.5Wh | Upto 8 Hours | Rapid Charge (Up to 80% in 1 Hour)\r\nCamera (Built in): HD 720p (1.0MP) IR enabled Camera | Fixed Focus | Integrated Dual Array Microphone', '8f35abc6d345c30454ddce5a5f10736e.jpg', 'a093c171bdd68ac4a5dd28fead103aa2.jpg', 'd5fc3ab0393930859635a827a558c8f6.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-03-06 17:16:25', 1, 2),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205.00, 250.00, '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">The Wimpy Kid Do -It- Yourself Book</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;\">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'b52418634c8a5538f9cff77f2ce111cbjpeg', 'cda0c29e55d96691f8e2dbc6b4325c72jpeg', 'a3c12367513e2d4d1a443bab1972ec25jpeg', 50.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:37:02', 1, 1),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240.00, 299.00, 'Publisher  :  Scholastic; Latest edition (1 December 2015)\r\nLanguage  :  English\r\nPaperback  :  176 pages\r\nISBN-10  :  9351032086\r\nISBN-13 :  978-9351032083\r\nReading age : 8 - 12 years\r\nItem Weight : 650 g\r\nDimensions :  20.3 x 25.4 x 4.7 cm', 'a4b7b614c7d8fa82f72c697d564a1b4c.jpg', '21c4682c8f68721da024af206d2104a1.jpg', 'f3d55538574ea1e67309c4e32f44d58a.jpg', 30.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:40:55', 1, 1),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566.00, 35100.00, 'Product Dimensions: Length (82 in / 208 cm), Width (75 in / 190 cm), Height ( 35 in / 90 cm)\r\nMaterial: High grade Eurpoean standard E2 engineered wood - Particle board with pre-laminate, Finish: Matte Wood Grain, Color: Dark Wenge\r\nBed Size: King, Recommended Mattress Size: 72x78 inches, Box Storage\r\nCare Instructions: Wipe it clean with a dry cloth. Do not use water. Wipe any spills immediately\r\nAssembly Required: The product requires carpenter assembly and will be provided by the seller', '6382f5c231b2791b55721abe458c5c44.jpg', 'f9c7bc022c6eb91fc10d1e2f24c7ba14.jpg', '80e0a10726722049c1912b53fa146d1e.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:33:42', 1, 1),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523.00, 7199.00, 'Good quality metal structure for strong & more steadiness easy to clean maintenance free with long lasting powder coating paint\r\nWell designed Indian furniture brand to occupy exact space of your modern bedroom & enrich your bedroom lifestyle\r\nProduct Dimension: Length : (81 CM) Width : (50.5 CM) Height : (36 CM) ; Recommended Mattress Size:78 X 30 Inches\r\n3 years warrantee make you enjoy all your desires to use our products peacefully & comfortably\r\nEasy to attached and detached products first time free assembling\r\n3 Years Warranty, Manufacturing Defects Only\r\nInstallation Will be Provided By Seller Only', 'b34e6df10d47dd78f64041f7429bafbf.jpg', 'ce86bedea4d77aab6dbe7b7d05d071db.jpg', '29097235e9d77261cd21fbd53e45bb4c.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 08:31:00', 1, 1),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379.00, 499.00, '<ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Colour: White, White</li><li class=\"_2-riNZ\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Outer Material: Denim</li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\"><br></div></li></ul>', 'cba78e01e90c4a3359fc5415b2c47a49.jpg', '5f46cc183d9b101218307e9f51b3404d.jpg', '64255c337c37f2570960fd5b7a3111a4.jpg', 45.00, 'In Stock', '2022-01-18 06:03:28', '2022-03-06 17:20:16', 1, 2),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes (Blue)', 'Adidas', 4129.00, 5001.00, 'Color\r\nBlue\r\nOuter material\r\nSynthetic Leather\r\nModel name\r\nMESSI 16.3 TF\r\nIdeal for\r\nMen\r\nOccasion\r\nSports\r\nSecondary color\r\nSilver\r\nClosure\r\nLace-Ups\r\nWeight\r\n200 g (per single Shoe) - Weight of the product may vary depending on size.', 'cc661de12faf4a3b20a811c738dec6e6.jpg', 'baa34a39e35461e2e3986555b11e262e.jpg', '4d329eba2178c06e6bc6311a30eb6ed6.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-23 09:30:55', 1, 1),
(22, 3, 8, 'Free Comic Book Day 2018: Avengers/Captain America', 'Cover Art', 100.00, 120.00, 'Free Comic Book Day 2018 is your perfect chance to dive into the Marvel Universe! With a story from Jason Aaron and art by Sara Pichelli, the Marvel FCBD title debuting this May features stories that set the stage for an epic new direction for the Avengers in the Marvel Universe. Plus, a Captain America story from Ta-Nehisi Coates and Leinil Francis Yu leading into their upcoming Captain America series!', '61uoAZqd3NL.jpg', '61uoAZqd3NL.jpg', '61uoAZqd3NL.jpg', 0.00, 'In Stock', '2022-01-18 06:03:28', '2022-01-18 06:17:10', 1, NULL),
(25, 4, 13, 'Havells Co zio Quartz Room Heater - 800 Watt (White, Blue)', 'Havells', 1790.00, 2390.00, 'About this item\r\nCozio comes with 2 Quartz heating tubes providing more warmth\r\nFront grill for safety\r\nSafety tip over switch\r\nTwo heat setting - 400 Watt & 800 Watt\r\nHaving carry handle for easy portability\r\nIncluded Components: 1 N Main Unit & 1 N Instruction Manual', 'b0024f15985d0b863d57e425edc6a6ab.jpg', 'ad3151dcf77c457058ca4c0ed98a3afc.jpg', '73437ea47cce0a3ad71e52a21e16a042.jpg', 0.00, 'In Stock', '2022-01-18 06:57:15', NULL, 1, NULL),
(26, 15, 15, 'boAt Xtend Smartwatch with Alexa Built-in, 1.69” HD Display, Multiple Watch Faces, Stress Monitor, Heart & SpO2 Monitoring, 14 Sports Modes, Sleep Monitor, 5 ATM & 7 Days Battery(Charcoal Black)', 'boAt', 3499.00, 3999.00, 'Alexa- Alexa built-in Voice Assistant that sets reminders, alarms and answers questions from weather forecasts to live cricket scores at your command! Volume Control for Music: Yes\r\nScreen Size- ;1.69\" big square colour LCD display with a round dial features complete capacitive touch experience to let you take control, effortlessly. Always on display:No, Peak Brightness 500 Nits\r\nWatch Faces- Multiple watch faces with customizable options to match your OOTD, every day!\r\nBrightness- The ambient light display allows automatic adjustment of brightness on the watch, suited to your environment\r\nHR & SpO2- The watch comes with a stress monitor that reads your HR to indicate stress levels.It also monitors your heart rate and SpO2 (blood oxygen levels) to keep a tab on your overall health.', '341f47beb5f5ccffcfe7c644f53d94c0.jpg', '849e8059fe79eaa6e4c0960a6c6d0ce8.jpg', '07b495cff3b4e8801cec5c33ae189d4e.jpg', 50.00, 'In Stock', '2023-05-30 07:49:26', NULL, 1, NULL),
(27, 15, 15, 'Fire-Boltt Phoenix Smart Watch with Bluetooth Calling 1.3\",120+ Sports Modes, 240 * 240 PX High Res with SpO2, Heart Rate Monitoring & IP67 Rating (Black)', 'Fire-Boltt', 2599.00, 2999.00, '?High Resolution Display?- Comes with a 1.3\" TFT Color Full Touch Screen and a 240*240 Pixel High Resolution this watch is covered to flaunt the sleek and stylish look always with 260 NITS Peak Brightness\r\nThe watch will work on a single charge for about 7 days (without Bluetooth calling) and about 4 Days with Bluetooth calling.\r\nCharging Specs - The watch needs to be charged for 3 hours to reach 100%. The charger should be a 3.7V to 5V adapter or any laptop output. For a bare minimum of 20% charge the watch needs to be charged for about 30-40 mins', '40c70f5147726132482514a552ab7330.jpg', '4f2a54dac0b487af1f4039323d88b954.jpg', '929a77efbd8ae09e9c4cb4092381c374.jpg', 30.00, 'In Stock', '2023-05-30 07:51:45', NULL, 1, NULL),
(28, 15, 15, 'Fastrack Reflex Vox Smartwatch|Alexa Built-in|Bright HD Display|Upto 10 Days Battery|5 ATM Water Resistance|Multiple Sports Modes|100+ Watchfaces|24x7 HRM|Sp02|Stress Monitor|Camera & Music Control', 'Fastrack', 3999.00, 4599.00, '[Large HD Display] 1.69\" Large Display Screen with premium touch and controls\r\n[Alexa Built-in] Alexa built in voice assistant to set reminders, alarms, add items to shopping list at your command\r\n[Long Battery Life] Super Long 10 days battery life to enjoy all the watch features without any worry\r\n[Complete Health Suite] With 24 X7 Heart rate monitor, SPO2 (Blood Oxygen Level ) Tracker and Menstrual tracker to keep a check on your period cycle\r\n[Stress & Sleep Monitoring] Let the watch keep a check on your stress levels and sleep health with active stress and sleep monitor\r\n[Multiple Watch Faces] Exciting 100+ Unique Watch faces to give your watch a new look everyday', 'ad63c5ec077f14ab6ec57a34eed0beb9.jpg', 'b2b7fe27ef2fc5329da6754fa2ed89da.jpg', 'cb501e18067f079d8af8e901476d9694.jpg', 50.00, 'In Stock', '2023-05-30 07:53:23', NULL, 1, NULL),
(29, 15, 15, 'Noise ColorFit Ultra 3 Bluetooth Calling Smart Watch with Biggest 1.96\" AMOLED Display, Premium Metallic Build, Functional Crown, Gesture Control with Metallic Strap (Jet Black: Elite Edition)', 'Noise', 1999.00, 2599.00, '1.96” (4.9 cm) AMOLED display - See life unfold on a bigger canvas.\r\n7-day battery life (2 days with calling) - Become unstoppable with a watch that powers up completely after only 2 hours of charging.\r\nNoiseFit app - Track your activity and stay on top of your fitness goals with the NoiseFit app. Complete challenges, compete with friends and earn exclusive offers and rewards.\r\nEquipped with MEMS Microphone for calling clarity.\r\nFeatures to love: - Advanced Bluetooth calling powered by Tru SyncTM for crystal clear calling. - Functional crown for effortless navigation. - Always On Display for easy accessibility.\r\nWhat’s in the box - smartwatch, charger, warranty card, user manual, toolkit for strap size adjustment (for Elite edition watches only)\r\nThe watch is not a replacement for a medical device. The readings can have error margins.\r\n', 'ac4335695e74e99c0cbd4fba163f81ee.jpg', 'd403f623ef2e367157d029cbb352b98c.jpg', 'df43954dcb1161cbc24fc9c61f334f5c.jpg', 0.00, 'In Stock', '2023-05-30 07:54:54', NULL, 1, NULL),
(30, 15, 15, 'realme Smart Watch S with 3.30 cm (1.3\") TFT-LCD Touchscreen, 15 Days Battery Life, SpO2 & Heart Rate Monitoring, IP68 Water Resistance, Black', 'Realme', 2499.00, 2999.00, 'Premium look and high durability with Aluminum Alloy case & Corning Gorilla Glass 3, 7kg Tension Resistant;3.3cm (1.3 inch) TFT-LCD Touchscreen with Auto-Brightness adjustment. Adjustable length : 164-208mm\r\n360x360 pixels resolution with up to 600 nits Brightness;Continous Heart Rate Monitor & Blood Oxygen (SpO2) Monitor.\r\nSmart Notifications - displays incoming call alerts and other notifications on your wrist;Smart Controls - Controls your music and clicks pictures on-the-go.\r\nIP68 Water Resistant with 16 Sport Modes;Fast Charging - Charge 2 hours and enjoy up to 15-days Battery Runtime; Magnetic Charging Base for Hassle-free Charging;1 Year Manufacturer Warranty\r\nBand Material Type: Silicone; Wireless Communication Technology: Bluetooth; Included Components: Charger; Human Interface Input: Touch Screen; Connectivity Technology: Wireless; Material Type: Metal', 'b0aed2cc55c52739d4b357992123a1e1.jpg', 'ad37f6f38c9b3cd6ed517f753b003c81.jpg', '374507a675ac1c4956629a0a64281b95.jpg', 50.00, 'In Stock', '2023-05-30 08:00:21', NULL, 1, NULL),
(31, 15, 15, 'OnePlus Nord Watch with 1.78” AMOLED Display, 60 Hz Refresh Rate, 105 Fitness Modes, 10 Days Battery, SPO2, Heart Rate, Stress Monitor, Women Health Tracker & Multiple Watch Faces [Deep Blue]', 'OnePlus', 1799.00, 1999.00, '?1.78\" AMOLED display?500nit peak brightness & 368*448 resolution with 326 PPI. The display content of the screen can be clearly seen even under strong sunlight.\r\n?60 Hz Refresh Rate?Fast & Smooth Experience with 60Hz smoothest smart watch refresh rate & minimalist round 2.5D. Reduces motion blur and makes action feel smoother, can make the picture appear sharper, and can make smartwatches feel more responsive and speedy.\r\n?N Health App Integration?: Download this mobile application on your smartphone & connect with your Nord Smartwatch. You can easily check insights of your health stats. ?105 fitness modes with 2 automatically detect modes?Choose your own exercise mode from a long list including Yoga, Meditation, Cricket & various others.', '8bbbf295adf2f076965aeb0c96291628.jpg', '75119c8ebba52d364a34ab18f8029d31.jpg', 'fbed3f256921bbfa82805855a144e47a.jpg', 0.00, 'In Stock', '2023-05-30 08:01:44', NULL, 1, NULL),
(32, 15, 15, 'Apple Watch Ultra [GPS + Cellular 49 mm] smart watch w/Rugged Titanium Case & Orange Alpine Loop - Small. Fitness Tracker, Precision GPS, Action Button, Extra-Long BatteryLife, Brighter Retina Display', 'Apple', 7699.00, 79999.00, 'HY APPLE WATCH ULTRA — Rugged and capable, built to meet the demands of endurance athletes, outdoor adventurers and water sports enthusiasts — with a specialised strap for each. Up to 36 hours of battery life, plus all the Apple Watch features that help you stay healthy, safe and connected.\r\nEXTREMELY RUGGED, INCREDIBLY CAPABLE — 49-millimetre corrosion-resistant titanium case. Larger Digital Crown and more accessible buttons. 100-metre water resistance. Customisable Action button for instant physical control over a variety of functions.', '589a83bacec099e969929a42d3f9d46f.jpg', '2206742f7ecd51e06de5bd9af06721ed.jpg', 'a51b9ed1221cbcc5723c5bdd3390bce4.jpg', 0.00, 'In Stock', '2023-05-30 08:02:53', NULL, 1, NULL),
(33, 12, 17, 'realme narzo 50i Prime (Dark Blue 4GB RAM+64GB Storage) Octa-core Processor | 5000 mAh Battery', 'Realme', 17999.00, 19999.00, 'Powerful Unisoc T612 processor for smooth day to day performance |Superb performance with an AnTuTu Benchmark Score of 214, 150 | Power efficient 12nm Process with Octa-core CPU to make your daily tasks easier\r\nDisplay: 6.5 inch HD+ display with 400nits of brightness brings a full screen display and vibrant colors to make every ounce of the experience exciting.\r\n8MP back camera for crisp and clear shots and 5MP front camera picture perfect selfies\r\n5000mAh Massive Battery with 10W fast charging support. The 10W fast charger is included in the box.\r\n4 GB RAM LPDDR4X Fast memory | 64 GB ROM UFS 2.2 | External storage is Expandable Up to 1TB', 'e653d97af4026c5ed0cb61fe5c96f619.jpg', 'c6d4c29f9ffea9598d2560e62f5c8780.jpg', 'de140022f8ab97e5b34eb4f2dadb3007.jpg', 50.00, 'In Stock', '2023-05-30 16:34:02', '2023-05-30 16:46:35', 1, 1),
(34, 12, 17, 'OnePlus 10R 5G (Sierra Black, 8GB RAM, 128GB Storage, 80W SuperVOOC)', 'OnePlus', 31999.00, 33499.00, 'Camera: 50MP Main Camera with Sony IMX766 and 2MP Macro Camera with Dual LED Flash; 16MP Front (Selfie) Camera with Sony IMX471\r\nCamera Features: Nightscape2.0, Super Macro, UltraShot HDR, Smart Scene Recognition, Portrait mode, Pro mode, Panorama, Tilt-shift mode, Focus Peaking, Filters, Video Nightscape, Video HDR, Video Portrait Timelapse, Hyperlapse Mode\r\nDisplay: 6.7 Inches; 120 Hz IRIS Display; Resolution: 2400 X 1080 pixels 394 ppi; Aspect Ratio: 20:9\r\nDisplay Features: Hyper Touch Mode, Reading Mode, Night Mode, Eye Comfort Mode, Auto brightness\r\nOperating System: OxygenOS based on Android 12, Processor: MTK D8100 Max\r\nBattery & Charging: 5000 mAh with 80W SuperVOOC\r\nIn-Display Fingerprint Sensor', '7b747d47ad07dd55067ce12756e223d0.jpg', 'a358abc82e93519996581c0a4966a1ab.jpg', 'b259f5204f31d3515fa5dd08a1ac4d75.jpg', 30.00, 'In Stock', '2023-05-30 16:36:32', NULL, 1, NULL),
(35, 12, 17, 'Redmi Note 12 Pro+ 5G (Arctic White, 8GB RAM, 256GB Storage)', 'Redmi', 23499.00, 24999.00, '8 GB RAM | 256 GB ROM\r\n16.94 cm (6.67 inch) Full HD+ Display\r\n200MP + 8MP + 2MP | 16MP Front Camera\r\n5000 mAh Lithium Polymer Battery\r\nMediatek Dimensity 1080 Processor', 'f46febbaaefdbb0159c3c17e9298d693.jpg', '4f8b0ecfc2067a393d070bd114fd09df.jpg', '69bc8ffdb67591740a80bed9b7e3f1e8.jpg', 50.00, 'In Stock', '2023-05-30 16:48:20', NULL, 1, NULL),
(36, 12, 17, 'Nothing Phone 1 5G White 8GB RAM 256GB ROM | 6.55 inch 120Hz OLED Display | 50MP + 50MP Rear | 16MP Front Camera | Glyph Interface | Qualcomn Snapdragon 778G+ Processor', 'Nothing', 36999.00, 39999.00, '8 GB RAM | 256 GB ROM;16.64 cm (6.55 inch) Full HD+ Display\r\n50MP + 50MP | 16MP Front Camera; Qualcomm Snapdragon 778G+ Processor\r\nForm Factor: Smartphone', '4005da83fbab757e8cb7a114d965ade3.jpg', '69bcbb38c436a19d3e7f15c965e44420.jpg', 'feca3cd781e88bb087f3be9dfebcee92.jpg', 0.00, 'In Stock', '2023-05-30 16:49:47', NULL, 1, NULL),
(37, 12, 17, 'Xiaomi 13 Pro (Ceramic Black, 12GB RAM 256GB Storage) | Leica Professional 50MP Triple Camera | Biggest Camera Sensor 1\" IMX989 | SD 8 Gen 2', 'Xiaomi', 55599.00, 58999.00, '50MP Leica professional optics helps in capture images in great detail. The largest camera sensor on a smartphone - Sony IMX989 1 inch sensor with 3.2 ?m large pixels captures brighter images even in extreme lowlight. The 50MP Telephoto-Macro(75mm Leica portrait) and 50MP Ultra-wide lens enables you to capture in different perspectives. Xiaomi 13 Pro can supports 8K video recording and also can record in Dolby Vision for a professional cinematography experience. The high resolution 32MP front camera comes with smart FoV switching\r\nThe 6.73 inch 2K 120Hz E6 AMOLED display with a peak brightness of 1900nits meets the most demanding needs and provides the best viewing experience. The 10bit LTPO 3.0 display is Dolby Vision & HDR10+ compliant. It is protected by Corning Gorilla Glass Victus\r\nThe flagship Snapdragon 8 Gen 2, 4nm processor is designed to provide groundbreaking performance. The processor has 37% improved multi-core CPU performance over the previous generation. The processor is coupled with faster UFS 4.0 Storage and LPDDR5X RAM for extreme performance. The super-big 3400mm² vapour chamber helps in keeping the phone temperatures in check even at peak performance\r\nThe 120W in-box HyperCharger coupled with Xiaomi Surge charging chipset can fully charge the massive 4820mAh battery in 19 minutes. The battery lasts longer with the optimizations by Xiaomi battery management shipset. The phone also supports upto 50W of Wireless Turbo charging & wireless reverse charging\r\n3D Bio ceramic back design made from medical grade materials | Corning Gorilla Glass Victus protection on the front', '9d8d80f34941359f1e5e0f28dab5a1e1.jpg', '627a1b39bba2f25b94a1b57a07bdfd36.jpg', '11ef6311f4571db38c6c4ca42344acc0.jpg', 0.00, 'In Stock', '2023-05-30 16:51:16', NULL, 1, NULL),
(38, 12, 17, 'Apple iPhone 14 (128 GB) - Blue', 'Apple', 87999.00, 89999.00, '15.40 cm (6.1-inch) Super Retina XDR display\r\nAdvanced camera system for better photos in any light\r\nCinematic mode now in 4K Dolby Vision up to 30 fps\r\nAction mode for smooth, steady, handheld videos\r\nVital safety technology — Crash Detection calls for help when you can’t\r\nAll-day battery life and up to 20 hours of video playback\r\nIndustry-leading durability features with Ceramic Shield and water resistance', '67c2cb17a1e1e800bae54329903083c5.jpg', 'd58645b5c694d43a1d9259bdbb3184fc.jpg', '6adfab76000218d27284a02f631c39dd.jpg', 0.00, 'In Stock', '2023-05-30 16:52:17', NULL, 1, NULL),
(39, 12, 17, 'Google Pixel 7 Pro (Hazel, 128 GB) (12 GB RAM)', 'Google', 76999.00, 79999.00, 'Display Type: Amoled; Human Interface Input: Touch Screen', '2ce7915d6d0e00f9a31f65829c112716.jpg', 'ff0cef992d7a293ffdacdb9d2882a155.jpg', 'f4ed4d3f8c0403d800c7224b696fe8c1.jpg', 0.00, 'In Stock', '2023-05-30 16:53:24', NULL, 1, NULL),
(40, 12, 17, 'Samsung Galaxy S21 FE 5G Smartphone Olive', 'Samsung', 42599.00, 45999.00, 'Pro-grade Camera with AI Single Take, Portrait Mode, Night Mode and 30X Space zoom. Dual Recording: Film in both wide and selfie angles at the same time | 12MP F1.8 Main Camera (Dual Pixel AF & OIS) + 12MP UltraWide Camera (123° FOV) + 8MP Telephoto Camera (3x Optic Zoom, 30X Space Zoom, OIS) | 32 MP F2.2 Front Camera\r\n16.28cm (6.4-inch) Dynamic AMOLED 2X Display with120Hz Refresh rate for Smooth scrolling. Intelligent Eye Comfort Shield, New 19.5:9 Screen Ratio with thinner bezel, 1080x2340 (FHD+) Resolution', '15388f08b0b85cd7bd1b332d590b5938.jpg', '9401684cc0fde31aec5002754525fc84.jpg', '5417948a763116fbac1dc8e66109440f.jpg', 0.00, 'In Stock', '2023-05-30 16:54:51', NULL, 1, NULL),
(41, 5, 9, 'Furniseworlds Sheesham Wood King Size Poster Bed Wooden Double Bed Cot Bed Furniture for Bedroom Home and Hotel (Honey Finish)', 'Furniseworlds', 45999.00, 47999.00, 'Wooden Bed Dimension: Length (84 Inch), Width (76 Inch), Height ( 75 Inch); Double Bed Material: Sheesham Wood|Color: Honey Finish|Style: Modern<Br>\r\nElegant And Vintage Design Of The Wooden Bed Makes It Well Match With Many Home Decoration.<Br>\r\nThe Full Size Bed Has Been One Of The Most Essential And Integral Part Of The Bedroom Furniture.<Br>\r\nThis Cot Bed Requires Basic Self Assembly At Customers End And Comes With Self Assembly Instructions Along With Necessary Accessories.<Br>\r\nCare Instructions: Wipe With Dry Cloth; Assembly Instructions: Diy', '7e1f38569220c8b00fdf9baf3e5922b2.jpg', 'd74c87647970b9bf34042755d68c53b5.jpg', '1c098b9f1325a71a6ddcbb30b20c6b74.jpg', 0.00, 'In Stock', '2023-05-30 16:59:57', NULL, 1, NULL),
(42, 5, 10, 'Fine Wood Art Wing Chair for Living Room Bedroom High Back Arm Chair Cushioned Lounge Chair Single Seater Sofa |Luxury Rest Chair Arm Chair (Yellow)', 'Wood Art', 25999.00, 29999.00, 'This chair is for those who want super luxuary comfort.;The structure of the rest chair wing chair is made in hard solid wood, Moreover the legs are beautiful shaped and carved in Teak wood<br>\r\nThe wing chair in your living room furniture can be moved and placed at any place as desired. You must move it carefully when moving to avoid any misshandling. It can bbe used as hall way chair, balcony chair, reading chair, fireplace chair, living room chair, wing chair, arm chair, Living room furniture, Couch, Sofa etc;The chair do not need any assembly. It will be packed in corrogated sheet and wooden crate so that it can reach you safely.<br>\r\nSpecification General Frame : pink Solid Wood |Upholstery : Cotton+Poly Fabric | Leg Material : Teak Finsh Wooden Leg | Foam : PU Foam;The structure of the rest chair wing chair grandpa chair is made in hard solid wood, Moreover the legs are beautiful shaped and carved in Teak wood.<br>\r\nIs Assembly Required: True; Size Name: One Seater; Assembly Instructions: Already Assembled', 'c5ad4f421ee4130861c0631b7caecd23.jpg', 'bfb435c5d319aee9782953505669b3b0.jpg', 'd39911101c26dca4eba4dd54d77b7f83.jpg', 0.00, 'In Stock', '2023-05-30 17:19:10', NULL, 1, NULL),
(43, 5, 19, '@home By Nilkamal Walton Engineered Wood TV Unit with Shelving Storage TV Unit (Walnut) | 1 Year Warranty', 'Nilkamal', 42999.00, 45999.00, 'Product Dimension: (L)178cm X (W)41.5cm X (H)165cm|Product Weight:54.9Kg\r\nPrimary Material: Engineered Wood (Particle Board)\r\nRecommended TV Size : 43 inchs|Box Shelf and open shelves storage\r\nWarranty:1 Year Warranty on Manufacturing Defects\r\nAssembly Required: The product requires carpenter assembly and will be provided by the seller', '57cdaff05279cf6235c5550913f4c391.jpg', 'baa2a915d528db50c77e5d227ee1c96d.jpg', 'cd9d498446deb8905f6821e1883a70d7.jpg', 0.00, 'In Stock', '2023-05-30 17:20:48', NULL, 1, NULL),
(44, 14, 20, 'LEGO Speed Champions Pagani Utopia 76915 Building Toy Set (249 Pieces)', 'Lego', 2799.00, 2999.00, 'Pagani hypercar toy – LEGO Speed Champions Pagani Utopia (76915) replica model for kids and passionate car fans to collect, build and display\r\n1 minifigure – The car toy comes with a driver minifigure with helmet and wig to place in the cockpit and play out high-speed adventures on the road\r\nAuthentic details – The model includes details from the real-life limited-edition hypercar: central 4-pipe exhaust, swooping bodywork, wide front grille, wheel arches and engine beneath glass\r\nPlay-and-display LEGO hypercar – This authentic Pagani Utopia model offers a fun building experience, before it can be proudly displayed or used to enjoy thrilling racing action\r\nLEGO gift – Give this premium 249-piece Speed Champions buildable model as a birthday present or Christmas gift to vehicle fans aged 9+ or lovers of Italian hypercars', '40c419ba0acb0cf1adda320e1719fc3c.jpg', 'a78f1f2b5b8a1f3231d2c421ab32322b.jpg', '9f210400f82b900ce0bfddbe81ea23b2.jpg', 0.00, 'In Stock', '2023-05-30 17:32:36', NULL, 1, NULL),
(45, 14, 20, 'ToysBuddy Cubes 3x3 High Speed Sticker Less Magic Puzzle Cube Game Toy', 'ToysBuddy', 799.00, 999.00, 'improves your concentration improves your hand eye co preservationists problem solving skills Improves creativity & imagination skills\r\nToysBuddy makes toys that are entertaining and safe. All toys are EN71 certified which is defined by stringent European standards and hence devoid of banned phthalates\r\nSpeedup your solving time without any effort and bring you the best turning feeling in advance. Easy turning and smooth play\r\nCubes are known to develop cognitive and problem-solving skills among kids. It betters their eye-hand coordination\r\nThe anti-stick design can prevent the cube viscosity, make the cube solve smoothly optimized big round corner - optimized parts of the round corner pieces,', 'f56b960175d3d87fa6701db24da6e31a.jpg', '9b8dd63c20b08c562f92a4c6d59c8ef7.jpg', 'feb5f012ca67c12ea8b32190642465ec.jpg', 50.00, 'In Stock', '2023-05-30 17:35:13', '2023-05-30 17:36:58', 1, 1),
(46, 14, 20, 'CADDLE & TOES Toys for 3-12 Year Old Boys, Kids Selfie Camera for Boys, Children Digital Video Toddler Camera, Christmas Birthday Festival Gift for Boys Age 3 4 5 6 7 8 9 (Pink)', 'Caddle', 3599.00, 3999.00, '??Clearer Moment Recorded & Multi-Function Upgraded? Equipped with auto Focus, 20.0 Mega pixels(Clearer than most sellers) and 1080P Video. Greatly improved the definition of photos . Catch the wonderful joy moment for boys or girls. With Big head sticker shooting, children can take photos with frames and special effects, leave some hilarious photos with family or friends.\r\n?Upgraded Selfie Camera Design? Upgraded to dual-camera configuration, Easy to take selfies. Just open the switch key to enjoy the fun of taking photos. Include a portable lanyard hang, easy to carry and moving. Includes a video recorder and voice recorder for more creative ways to play.\r\n?Toddler Shockproof and Safe Material? our digital kids video camera is made of high-grade and eco-friendly materials, non-toxic & attractive design, durable, withstands drops. It is very cute, small and light weight,Perfect size for little hands to operate.\r\n??Powerful Battery Life? Built-in 850mAh large-capacity battery that works for 1-3 hours after charging enough. The automatic shutdown function can be selected in 1 minute, 3 minutes, or 5 minutes mode. can store more than 2300 photos, keep on recording happy moments of the childhood of your children.', 'fc67c1d1e55407bdfb6270175193168f.jpg', '281cfffef54d89f2a2b3503009cb3f39.jpg', 'dba0b28aa0e05ce13489314404375bff.jpg', 0.00, 'In Stock', '2023-05-30 17:38:44', NULL, 1, NULL),
(47, 6, 21, 'Allen Solly Men T-Shirt', 'Allen Solly', 599.00, 799.00, 'Care Instructions: Wash with mild detergent, do not bleach, dry in shade\r\nOccasion : Casual\r\nMaterial : 60% Cotton and 40% Polyester\r\nNeck : Polo Neck; Pattern : Solid\r\nSleeve Type: Half Sleeve; Closure Type: Button; Collar Style: Band Collar; Material Composition: 60% Cotton, 40% Polyester', '0d219675a5f153d7bd33883f0e1326e9.jpg', '3edaf7ad090f7ad9817b8033e738ae25.jpg', '63ff220d4f159ee905253b1e3f629db0.jpg', 50.00, 'In Stock', '2023-05-30 17:43:53', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategoryName`, `creationDate`, `updationDate`, `createdBy`) VALUES
(2, 4, 'Led Television', '2017-01-26 16:24:52', '0000-00-00 00:00:00', 1),
(3, 4, 'Television', '2017-01-26 16:29:09', '0000-00-00 00:00:00', 1),
(6, 4, 'Laptops', '2017-02-04 04:13:00', '0000-00-00 00:00:00', 1),
(8, 3, 'Comics', '2017-02-04 04:13:54', '0000-00-00 00:00:00', 1),
(9, 5, 'Beds', '2017-02-04 04:36:45', '0000-00-00 00:00:00', 1),
(10, 5, 'Sofas', '2017-02-04 04:37:02', '0000-00-00 00:00:00', 1),
(11, 5, 'Dining Tables', '2017-02-04 04:37:51', '0000-00-00 00:00:00', 1),
(12, 6, 'Men Footwears', '2017-03-10 20:12:59', '0000-00-00 00:00:00', 1),
(15, 15, 'Smartwatches', '2023-05-30 07:46:17', NULL, 1),
(16, 15, 'Analog Watches', '2023-05-30 07:46:36', NULL, 1),
(17, 12, 'Mobile', '2023-05-30 16:32:43', NULL, 1),
(18, 5, 'Cupboard', '2023-05-30 16:57:45', NULL, 1),
(19, 5, 'Shelf', '2023-05-30 16:58:21', NULL, 1),
(20, 14, 'Kids', '2023-05-30 17:25:57', NULL, 1),
(21, 6, 'Men', '2023-05-30 17:41:59', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNumber` bigint(12) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`, `contactNumber`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 45231025890, '2022-01-24 16:21:18', '2022-02-06 08:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar Singh', 'anuj.lpu1@gmail.com', 1259874230, 'f925916e2754e5e03f75dd58a5733251', '2022-02-04 19:30:50', '2022-02-06 06:57:20'),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '2021-03-15 17:21:22', '2022-02-06 06:57:25'),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '2021-04-29 09:30:32', '2022-02-06 06:57:30'),
(4, 'John Doe', 'john@gmail.com', 1234567890, '5c428d8875d2948607f3e3fe134d71b4', '2022-01-29 07:42:12', '2022-03-05 10:20:04'),
(7, 'Amit kumar Singh', 'amitk@gmail.com', 1425879212, 'f925916e2754e5e03f75dd58a5733251', '2022-03-06 12:48:33', '2022-03-06 12:49:01'),
(8, 'shiv', 'shiv@gmail.com', 2135468795, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-21 04:01:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 1, 14, '2022-01-29 10:11:38'),
(4, 1, 13, '2022-01-29 10:28:44'),
(10, 8, 17, '2023-05-21 07:55:31'),
(11, 8, 32, '2023-06-01 05:32:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userrrid` (`userId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uiid` (`userID`),
  ADD KEY `piddd` (`productId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidddd` (`userId`),
  ADD KEY `addressid` (`addressId`),
  ADD KEY `orderNumber` (`orderNumber`);

--
-- Indexes for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidd` (`orderNumber`),
  ADD KEY `useridd` (`userId`),
  ADD KEY `productiddd` (`productId`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderidddddd` (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catidddd` (`category`),
  ADD KEY `subCategory` (`subCategory`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catid` (`categoryid`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usseridddd` (`userId`),
  ADD KEY `ppiidd` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ordersdetails`
--
ALTER TABLE `ordersdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
