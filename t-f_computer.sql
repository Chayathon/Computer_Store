-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2023 at 11:10 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t-f_computer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs_address`
--

CREATE TABLE `cs_address` (
  `a_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `a_name` varchar(100) NOT NULL,
  `a_phone` varchar(10) NOT NULL,
  `a_sub` text NOT NULL,
  `a_district` varchar(100) NOT NULL,
  `a_province` varchar(100) NOT NULL,
  `a_zip` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_address`
--

INSERT INTO `cs_address` (`a_id`, `u_id`, `a_name`, `a_phone`, `a_sub`, `a_district`, `a_province`, `a_zip`) VALUES
(1, 2, 'นิรวรรณ บุญทูป', '0928606427', '87 ม.5 ถ.สุวรรณศร ต.โคกแย้', 'หนองแค', 'สระบุรี', '18230'),
(2, 2, 'ชยธร เติมพิพัฒน์พงศ์', '0957079861', '253/11  ม.รุ่งเรือง  ถ.เทศบาล 4  ต.ปากเพรียว', 'เมืองสระบุรี', 'สระบุรี', '18000');

-- --------------------------------------------------------

--
-- Table structure for table `cs_ordered`
--

CREATE TABLE `cs_ordered` (
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `o_product` varchar(100) NOT NULL,
  `o_price` float NOT NULL,
  `o_amount` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `o_bank` varchar(5) NOT NULL,
  `o_date` varchar(100) NOT NULL,
  `o_slip` varchar(100) NOT NULL,
  `o_status` varchar(100) NOT NULL,
  `parcel_number` varchar(50) NOT NULL,
  `ref` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_ordered`
--

INSERT INTO `cs_ordered` (`o_id`, `u_id`, `a_id`, `o_product`, `o_price`, `o_amount`, `total_price`, `o_bank`, `o_date`, `o_slip`, `o_status`, `parcel_number`, `ref`) VALUES
(4, 2, 1, 'Asus ROG Zephyrus G14 GA401QC-HZ045TS', 36990, 1, 36990, 'kbank', '2021-09-28', '1(11981).jpg', 'Waiting for order confirmation', '-', '20210928112316'),
(5, 5, 5, 'Asus TUF Gaming F17 FX706HC-HX003T', 32900, 1, 32900, 'scb', '2021-09-28', '1(11981).jpg', 'Waiting for order confirmation', '-', '20210928113343'),
(6, 2, 1, 'Asus ROG Zephyrus G14 GA401QC-HZ045TS', 36990, 1, 36990, 'scb', '2021-11-30', '1(11981).jpg', 'Waiting for order confirmation', '-', '20211130073206'),
(7, 4, 4, 'Asus ROG Zephyrus G14 GA401QC-HZ045TS', 36990, 2, 73980, 'scb', '2021-11-30', '1(11981).jpg', 'Waiting for order confirmation', '-', '20211130075854');

-- --------------------------------------------------------

--
-- Table structure for table `cs_product`
--

CREATE TABLE `cs_product` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `t_id` int(11) NOT NULL,
  `p_detail` varchar(500) NOT NULL,
  `p_price` float NOT NULL,
  `p_amount` int(11) NOT NULL,
  `p_view` int(11) NOT NULL,
  `p_img` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_product`
--

INSERT INTO `cs_product` (`p_id`, `p_name`, `t_id`, `p_detail`, `p_price`, `p_amount`, `p_view`, `p_img`) VALUES
(1, 'Asus ROG Zephyrus G14 GA401QC-HZ045TS', 1, 'Processor : AMD Ryzen 7 5800HS (2.8GHz up to 4.4GHz)<br>\r\nGraphics : NVIDIA GeForce RTX 3050 (4GB GDDR6)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), IPS, 144Hz, 100% sRGB<br>\r\nMain Memory : 16GB DDR4 Onboard memory<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019\r\n', 36990, 95, 24, 'p_img1336680066.webp'),
(2, 'Asus TUF Gaming F17 FX706HC-HX003T', 1, 'Processor : Intel Core i5-11400H (2.7GHZ up to 4.5GHz)<br>\r\nGraphics : NVIDIA GeForce RTX 3050 (4GB GDDR6)<br>\r\nDisplay Screen : 17.3\" 1920x1080 (FHD), IPS, 144Hz<br>\r\nMain Memory : 8GB DDR4 2933MHz<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + 1-month trial for new Microsoft 365 customers.', 32900, 93, 11, 'p_img1119052792.webp'),
(3, 'Asus Zenbook 14 UX425EA-KI501TS', 1, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), IPS, 60Hz, 100% sRGB<br>\r\nMain Memory : 8GB LPDDR4X Onboard memory<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home&Student 2019', 28990, 10, 3, 'p_img1904442401.webp'),
(4, 'Asus X515JA-BR100T', 1, 'Processor : Intel Core i3-1005G1 (1.2GHz up to 3.4GHz)<br>\r\nGraphics : Intel UHD Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 15.6\" 1366x768 (HD), TN, 60Hz<br>\r\nMain Memory : 4GB DDR4 Onboard<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit)', 14490, 5, 1, 'p_img815249874.webp'),
(5, 'Acer Swift SF314-511-745J/T001', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), IPS, 60Hz,100% sRGB color gamut<br>\r\nMain Memory : 8GB LPDDR4X Onboard memory<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 29900, 93, 0, 'p_img390661226.webp'),
(6, 'Acer Swift SFX14-41G-R059/T002', 1, 'Processor : AMD Ryzen 5 5500U (2.1GHz up to 4.0GHz)<br>\r\nGraphics : NVIDIA GeForce GTX 1650 (4GB GDDR6)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), IPS, 60Hz, 72% NTSC color gamut<br>\r\nMain Memory : 8GB LPDDR4X<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 27900, 100, 0, 'p_img20122026.webp'),
(7, 'Acer TravelMate TMP214-52-57HA/T00H', 1, 'Processor : Intel Core i5-10210U (6M Cache, 1.60 GHz up to 4.20 GHz)<br>\r\nGraphics : Intel UHD Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), IPS, 60Hz, TFT, LCD<br>\r\nMain Memory : 8GB DDR4<br>\r\nStorage : 256GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Pro (64-bit)', 24400, 100, 0, 'p_img1438619778.webp'),
(8, 'Acer Aspire A315-58-74EL/T001', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 15.6\" 1920x1080 (FHD) Acer ComfyView<br>\r\nMain Memory : 8GB DDR4 Onboard memory<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 22900, 100, 1, 'p_img1441602949.webp'),
(9, 'MSI GE66 Raider 11UG-268TH', 1, 'Processor : Intel Core i7-11800H (2.3GHz up to 4.6GHz)<br>\r\nGraphics : NVIDIA GeForce RTX 3070 (8GB GDDR6)<br>\r\nDisplay Screen : 15.6\"\" 2560x1440 (QHD), IPS, 165Hz, DCI-P3 100% typical<br>\r\nMain Memory : 32GB (16GB x2) DDR4 3200MHz<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 78900, 100, 0, 'p_img1448205331.webp'),
(10, 'MSI Katana GF66 11UE-054TH', 1, 'Processor : Intel Core i7-11800H (2.3GHz up to 4.6GHz)<br>\r\nGraphics : NVIDIA GeForce RTX 3060 (6GB GDDR6)<br>\r\nDisplay Screen : 15.6\" 1920x1080 (FHD), IPS, 144Hz, 45%NTSC<br>\r\nMain Memory : 16GB (8GB x2) DDR4 3200MHz<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 48900, 100, 0, 'p_img1159925029.webp'),
(11, 'Notebook MSI Creator Z16 A11UET-034TH', 1, 'Processor : Intel Core i7-11800H (2.3GHz up to 4.6GHz)<br>\r\nGraphics : NVIDIA GeForce RTX 3060 Max-Q (6GB GDDR6)<br>\r\nDisplay Screen : 16.0\" 2560x1600 (QHD+), IPS, 120Hz, Touch-Screen<br>\r\nMain Memory : 32GB (16GBx2) DDR4 3200MHz<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 79900, 100, 0, 'p_img343168402.webp'),
(12, 'Notebook HP Spectre X360 13-aw2528TU', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz Up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 13.3\" 1920x1080 (FHD), IPS, 60Hz, Touch Screen<br>\r\nMain Memory : 16GB LPDDR4 3200MHz Onboard memory<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD + 32GB Optane memory<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 56900, 100, 0, 'p_img117438686.webp'),
(13, 'Notebook HP Envy 13-ba1527TU', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 13.3\" 1920x1080 (FHD), IPS, 60Hz, Touchscreen<br>\r\nMain Memory : 16GB DDR4 Onboard memory<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019\r\n', 40900, 100, 0, 'p_img686678800.webp'),
(14, 'Notebook HP Pavilion 15-eg0518TU', 1, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 15.6\" 1920x1080 (FHD), IPS, 60Hz, micro-edge<br>\r\nMain Memory : 16GB (8GB x2) DDR4 3200MHz<br>\r\nStorage : 1TB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home&Student 2019', 29900, 100, 0, 'p_img2020406992.webp'),
(15, 'Notebook Lenovo Yoga Slim7 14ITL5 82BH005PTA', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920 x 1080 (FHD), IPS, 60Hz, Touchscreen<br>\r\nMain Memory : 16GB DDR4 3200MHz Onboard memory<br>\r\nStorage : 1TB PCIe NVMe M.2 2280 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home&Student 2019\r\n', 40900, 100, 0, 'p_img315039277.webp'),
(16, 'Notebook Lenovo IdeaPad 5 Pro 16ACH6 82L50098TA', 1, 'Processor : AMD Ryzen 7 5800H (3.2GHz up to 4.4GHz)<br>\r\nGraphics : NVIDIA GeForce GTX 1650 (4GB GDDR6)<br>\r\nDisplay Screen : 16.0\" 2560x1600 (WQXGA), IPS, 120Hz, 100% sRGB<br>\r\nMain Memory : 16GB DDR4 3200MHz Onboard memory<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home&Student 2019\r\n', 33900, 100, 0, 'p_img1616368085.webp'),
(17, 'Notebook Lenovo ThinkBook 15 Gen2 20RWA046TA', 1, 'Processor : Intel Core i5-10210U (1.6GHz up to 4.2GHz)<br>\r\nGraphics : Intel UHD Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 15.6\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB DDR4 2666MHz Onboard memory<br>\r\nStorage : 256GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Pro (64-bit) + Microsoft Office Home & Student 2019\r\n', 28900, 100, 0, 'p_img1753979408.webp'),
(18, 'Notebook DELL XPS 9310-W5673200PTHW10', 1, 'Processor : Intel Core i7-1185G7 (3.0GHz up to 4.8GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 13.4\", 3840 x 2400 (UHD+), WVA, 60Hz, Touch<br>\r\nMain Memory : 16GB LPDDR4X Onboard memory<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home&Student 2019\r\n', 77900, 100, 0, 'p_img1947276691.webp'),
(19, 'Notebook DELL Latitude 3420-SNS3420006', 1, 'Processor : Intel Core i7-1165G7 (2.8GHz up to 4.7GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), TN, 60Hz<br>\r\nMain Memory : 16GB (16GB x1) DDR4 3200MHz<br>\r\nStorage : 512GB PCIe NVMe Class 35 SSD<br>\r\nOS : Windows 10 Pro (64-bit)\r\n', 40900, 100, 0, 'p_img120097704.webp'),
(20, 'Notebook DELLl Inspiron 5410-W5662141004THW10', 1, 'Processor : Intel Core i5-11300H (3.1GHz up to 4.4GHz)<br>\r\nGraphics : Intel Iris Xe Graphics (Integrated Graphics)<br>\r\nDisplay Screen : 14.0\" 1920x1080 (FHD), WVA Display, 60Hz<br>\r\nMain Memory : 8GB DDR4 3200MHz<br>\r\nStorage : 512GB PCIe NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019\r\n', 29690, 100, 0, 'p_img1806297912.webp'),
(21, 'Desktop Asus S500SC-511400011TS (PF02K-M04280)', 2, 'Processor : Intel Core i5-11400 (2.6 GHz up to 4.4 GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 730<br>\r\nMain Memory : 8GB DDR4 U-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home and Student 2019', 20990, 100, 2, 'p_img1910515405.webp'),
(22, 'Desktop Asus U500MA-R5600G005TS (90PF02F2-M08710)', 2, 'Processor : AMD Ryzen 5 5600G (3.9GHz up to 4.4GHz)<br>\r\nGraphics : Integrated Graphics : Radeon Graphics<br>\r\nMain Memory : 8GB DDR4 U-DIMM<br>\r\nStorage : 512GB SSD M.2 NVMe PCIe 3.0<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 19990, 100, 2, 'p_img2131091167.webp'),
(23, 'Desktop Asus D3401SFF-I59400032R (PF01W3-M19050)', 2, 'Processor : Intel Core i5-9400 (2.9GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 630<br>\r\nMain Memory : 8GB DDR4 U-DIMM<br>\r\nStorage : 1TB SATA 7200RPM 3.5\"\" HDD<br>\r\nOS : Windows 10 Pro (64-bit)\r\n', 18990, 100, 3, 'p_img372157521.webp'),
(24, 'Desktop Asus S500SC-310105004TS (PF02K-M04240)', 2, 'Processor : Intel Core i3-10105 (3.7 GHz Up to 4.4 GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Intel 630<br>\r\nMain Memory : 8GB DDR4 U-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home and Student 2019\r\n', 17990, 100, 0, 'p_img1756490172.webp'),
(25, 'Desktop Acer Aspire TC-1660-1148G0T00MGi/T002', 2, 'Processor : Intel Core i5-11400 (2.6 GHz up to 4.4 GHz)<br>\r\nGraphics : NVIDIA GeForce GTX 1650 (4GB GDDR5)<br>\r\nMain Memory : 8GB DDR4 3200<br>\r\nStorage : 512GB SSD M.2 NVME<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 25900, 100, 0, 'p_img1994418766.webp'),
(26, 'Desktop Acer Aspire TC-1660-1148G0TMi/T00D', 2, 'Processor : Intel Core i5-11400 (2.6 GHz up to 4.4 GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 730<br>\r\nMain Memory : 8GB DDR4 3200<br>\r\nStorage : 512GB SSD M.2 NVME<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019\r\n', 19900, 100, 0, 'p_img2111165528.webp'),
(27, 'Desktop Acer Aspire TC-1660-1144G1T0Mi/T004', 2, 'Processor : Intel Core i5-11400 (2.6 GHz up to 4.4 GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 730<br>\r\nMain Memory : 4GB DDR4 3200<br>\r\nStorage : 1TB HDD 3.5-inch 7200 RPM<br>\r\nOS : EShell', 16400, 100, 0, 'p_img1214646641.webp'),
(28, 'Desktop Acer Aspire TC-1660-1018G1T0Mi/T003', 2, 'Processor : Intel Core i3-10105 (3.7 GHz Up to 4.4 GHz)<br>\r\nGraphics : Integrated Graphics : UHD Intel 630<br>\r\nMain Memory : 8GB DDR4 3200<br>\r\nStorage : 1TB HDD 3.5-inch 7200 RPM<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 15400, 100, 0, 'p_img1729925333.webp'),
(29, 'Desktop MSI PRO DP21 11M-017TH', 2, 'Processor : Intel Core i7-11700 (2.5GHz up to 4.9GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 750<br>\r\nMain Memory : 8GB (8GBx1) U-DIMM DDR4<br>\r\nStorage : 256GB M.2 PCIe SSD, 1TB 2.5\" HDD<br>\r\nOS : Windows 10 Home (64 bit)', 30900, 100, 0, 'p_img1315889182.webp'),
(30, 'Desktop MSI PRO DP21 11M-031TH', 2, 'Processor : Intel Core i3-10105 (3.7GHz up to 4.4GHz)<br>\r\nGraphics : Integrated Graphics : UHD Intel 630<br>\r\nMain Memory : 8GB (8GBx1) U-DIMM DDR4<br>\r\nStorage : 1TB 2.5\" HDD<br>\r\nOS : Windows 10 Home (64-bit)\r\n', 17900, 100, 0, 'p_img165288144.webp'),
(31, 'Desktop MSI PRO DP21 11M-021TH', 2, 'Processor : Intel Pentium Gold G6405 (4.1GHz)<br>\r\nGraphics : Integrated Graphics : UHD Intel 610<br>\r\nMain Memory : 4GB (4GBx1) U-DIMM DDR4<br>\r\nStorage : 128G SATA SSD<br>\r\nOS : Windows 10 Pro (64-bit)\r\n', 12900, 100, 2, 'p_img2053137429.webp'),
(32, 'Desktop Lenovo ThinkStation P340 (30DHS0WD00)', 2, 'Processor : Intel Core i7-10700 (2.9GHz up to 4.8GHz)<br>\r\nGraphics : NVIDIA Quadro P400 2GB<br>\r\nMain Memory : 8GB (1x8GB) UDIMM DDR4-2933 non-ECC<br>\r\nStorage : 1 x 2TB HDD 7200rpm 3.5\" SATA6Gb/s<br>\r\nOS : DOS\r\n', 24500, 100, 0, 'p_img205842371.webp'),
(33, 'Desktop Lenovo ThinkCentre M75s (11JDS01K00)', 2, 'Processor : AMD Ryzen 7 Pro 3700 (3.6GHz up to 4.4GHz)<br>\r\nGraphics : AMD Radeon 520 Low Profile (2GB GDDR5)<br>\r\nMain Memory : 8GB (1x8GB) DDR4 3200MHz UDIMM<br>\r\nStorage : 512GB SSD M.2 2242 NVMe<br>\r\nOS : DOS', 20900, 100, 0, 'p_img688282416.webp'),
(34, 'Desktop Lenovo IdeaCentre IC5 (90Q3002VTA)', 2, 'Processor : AMD Ryzen 3 4300G (3.8GHz up to 4.0GHz)<br>\r\nGraphics : Integrated : AMD Radeon Graphics<br>\r\nMain Memory : 4GB DDR4 3200MHz UDIMM<br>\r\nStorage : 1TB Hard Drive<br>\r\nOS : Windows 10 Home (64-bit)', 13900, 100, 0, 'p_img519760167.webp'),
(35, 'Desktop HP Pavilion TP01-2012d (4C9R8PA#AKL)', 2, 'Processor : Intel Core i5-11400F (2.6GHz up to 4.4GHz)<br>\r\nGraphics : NVIDIA Geforce GTX1650 Super (4GB GDDR6)<br>\r\nMain Memory : 8GB (1x8GB) DDR4 2933MHz<br>\r\nStorage : 256GB SSD NVMe + 1TB 7200 rpm<br>\r\nOS : Windows 10 Home (64-bit)', 27400, 100, 1, 'p_img75532252.webp'),
(36, 'Desktop HP S01-pF1011d (4C9S4PA#AKL)', 2, 'Processor : Intel Core i3-10105 (3.7GHz Up to 4.4GHz)<br>\r\nGraphics : NVIDIA GeForce GT 1030 (2GB GDDR5)<br>\r\nMain Memory : 8GB (1x8GB) DDR4 2666<br>\r\nStorage : 128 GB SSD PCIe + 1TB HDD 7200rpm<br>\r\nOS : Windows 10 Home (64-bit)', 19900, 100, 1, 'p_img655912780.webp'),
(37, 'Desktop HP ProDesk 400 G7MT (42V62PA#AKL)', 2, 'Processor : Intel Core i3-10100 (3.6GHz up to 4.3GHz)<br>\r\nGraphics : Integrated : Intel UHD Graphics 630<br>\r\nMain Memory : 4GB (1x4GB) DDR4 2666 DIMM<br>\r\nStorage : 1TB 7200RPM SATA-6G 3.5\"<br>\r\nOS : Windows 10 Home (64-bit)', 13900, 100, 0, 'p_img1931420310.webp'),
(38, 'Desktop PC DELL Vostro V3888-W26818705BTHCOM', 2, 'Processor : Intel Core i7-10700 (2.9GHZ up to 4.8GHz)<br>\r\nGraphics : Integrated : Intel UHD Graphics 630<br>\r\nMain Memory : 8GB DDR4, 2666MHz<br>\r\nStorage : 512GB M.2 PCIe NVMe Solid State Drive<br>\r\nOS : Window 10 Home (64-bit) + Microsoft Office Home & Student 2019', 27400, 100, 0, 'p_img678236012.webp'),
(39, 'Desktop PC DELL Optiplex 3080SFF-SNS38SF004', 2, 'Processor : Intel Core i5-10500 (3.1GHz up to 4.5GHz)<br>\r\nGraphics : Integrated Graphics<br>\r\nMain Memory : 8GB DDR4 2666MHz<br>\r\nStorage : 1TB HDD 7200rpm<br>\r\nOS : Window 10 Pro (64-bit)', 22500, 100, 0, 'p_img974418761.webp'),
(40, 'Desktop PC DELL Micro Optiplex 3080-SNS38MC005', 2, 'Processor : Intel Core i5-10500T (2.3GHZ up to 3.8GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics 630<br>\r\nMain Memory : 8GB (1x8GB) 2666MHz DDR4 Non-ECC<br>\r\nStorage : 256GB M.2 PCIe SSD NVMe  + 1TB 2.5\" 7200rpm Hard Disk Drive<br>\r\nOS : Ubuntu (Linux)', 20900, 100, 0, 'p_img214644931.webp'),
(41, 'AIO Asus V241EAK-BA019TS', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Integrated Graphic : Intel Iris Xe<br>\r\nDisplay Screen : 23.8\", 1920x1080 (FHD), IPS, 60Hz, 100% sRGB<br>\r\nMain Memory : 16GB DDR4 SO-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home and Student 2019', 27990, 100, 4, 'p_img1312630753.webp'),
(42, 'AIO Asus M5401WUAK-WA032TS', 3, 'Processor : AMD Ryzen 5 5500U (2.1GHz up to 4.0GHz)<br>\r\nGraphics : Integrated Graphics : AMD Radeon Graphics<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz, 100% sRGB<br>\r\nMain Memory : 16GB DDR4 SO-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home and Student 2019', 27990, 100, 3, 'p_img1603426056.webp'),
(43, 'AIO Asus V241EAK-BA016TS', 3, 'Processor : intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphic : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\", 1920x1080 (FHD), IPS, 60Hz, 100% sRGB<br>\r\nMain Memory : 8GB DDR4 SO-DIMM<br>\r\nStorage : 512 GB PCIe/NVMe M.2 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Office Home & Student 2019', 22990, 100, 2, 'p_img1571149.webp'),
(44, 'AIO Asus M3200WUAK-BA012TS', 3, 'Processor : AMD Ryzen 3 5300U (2.6GHz up to 3.8GHz)<br>\r\nGraphics : Integrated Graphic : AMD Radeon Graphics<br>\r\nDisplay Screen : 21.5\" 1920x1080 (FHD), IPS, 60Hz, 100% RGB<br>\r\nMain Memory : 8GB DDR4 SO-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 21990, 100, 0, 'p_img1682801221.jpg'),
(45, 'AIO Asus M3200WUAK-BA028T', 3, 'Processor : AMD Ryzen 3 5300U (2.6GHz up to 3.8GHz)<br>\r\nGraphics : Integrated Graphic : AMD Radeon Graphics<br>\r\nDisplay Screen : 21.5\" 1920x1080 (FHD), IPS, 60Hz, 100% RGB<br>\r\nMain Memory : 8GB DDR4 SO-DIMM<br>\r\nStorage : 512GB M.2 NVMe PCIe 3.0 SSD<br>\r\nOS : Windows 10 Home (64-bit)', 18990, 100, 0, 'p_img682501480.webp'),
(46, 'AIO Acer Aspire C27-1655-1138G0T27MGi/T001', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : NVIDIA GeForce MX 330 (2GB GDDR5)<br>\r\nDisplay Screen : 27.0\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB DDR4<br>\r\nStorage : 512GB M.2 PCIe NVMe SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 28900, 100, 0, 'p_img1955824410.webp'),
(47, 'AIO Acer Aspire C24-1651-1138G0T23MGi/T001', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : NVIDIA GeForce MX450 (2 GB GDDR6)<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, Touch screen, 60Hz<br>\r\nMain Memory : 8GB DDR4 soDIMM<br>\r\nStorage : 512GB M.2 PCIe NVMe SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 28900, 100, 0, 'p_img1308441782.webp'),
(48, 'AIO Acer Aspire C24-1650-1138G0T23Mi/T006', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Integrated Graphic : Intel Iris Xe<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB DDR4  SO-DIMM 2666MHz<br>\r\nStorage : 512GB M.2 PCIe NVMe SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 25900, 100, 0, 'p_img795262710.webp'),
(49, 'AIO Acer Aspire C24-1650-1114G1T23Mi/T003', 3, 'Processor : intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphic : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 32GB<br>\r\nStorage : 1TB HDD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 18900, 100, 0, 'p_img1552741165.webp'),
(50, 'AIO MSI Modern AM241P 11M-245TH', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Integrated Graphics : Intel Iris Xe<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB (1x8GB) DDR4 SO-DIMM<br>\r\nStorage : 256G M.2 PCIe SSD<br>\r\nOS : Window 10 Home (64-bit)', 27400, 100, 0, 'p_img336876274.webp'),
(51, 'AIO Lenovo IdeaCentre AIO3 24ITL6 (F0G0005WTA)', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : NVIDIA GeForce MX450 (2GB GDDR6)<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB (2x4GB) SO-DIMM DDR4-3200<br>\r\nStorage : 512GB SSD M.2 2242 PCIe NVMe<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 27400, 100, 0, 'p_img1991214018.webp'),
(52, 'AIO Lenovo IdeaCentre AIO 3 24ITL6 (F0G000EGTA)', 3, 'Processor : Intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB (2x4GB) SO-DIMM DDR4-3200<br>\r\nStorage : 256GB SSD M.2 2242 PCIe NVMe<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 20900, 100, 0, 'p_img867664001.webp'),
(53, 'AIO Lenovo IdeaCentre AIO3 24ITL6 (F0G00060TA)', 3, 'Processor : Intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphic : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 8GB (2x4GB) DDR4-3200 SO-DIMM<br>\r\nStorage : 256GB SSD M.2 2242 PCIe NVMe<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft Office Home & Student 2019', 19900, 100, 0, 'p_img191037355.webp'),
(54, 'AIO Lenovo IdeaCentre AIO 3 24ITL6 (F0G000EHTA)', 3, 'Processor : Intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphics : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz<br>\r\nMain Memory : 4GB (1x4GB) SO-DIMM DDR4 3200<br>\r\nStorage : 256GB SSD M.2 2242 PCIe NVMe<br>\r\nOS : Windows 10 Home (64-bit)', 18900, 100, 0, 'p_img134486302.webp'),
(55, 'AIO HP 24-df1036d (4C9Q6PA#AKL)', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Integrated Graphics : Intel Iris Xe<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz, 72% NTSC<br>\r\nMain Memory : 8GB (1x8GB) DDR4 3200MHz<br>\r\nStorage : 1TB Hard Drive 7200 rpm<br>\r\nOS : Windows 10 Home (64-bit) + Office Home and Student 2019', 24900, 100, 0, 'p_img1533408717.webp'),
(56, 'AIO HP 24-df1037d (4C9Q7PA#AKL)', 3, 'Processor : Intel Core i3-1125G4 (2.0GHZ up to 3.7GHz)<br>\r\nGraphics : NVIDIA GeForce MX330 2GB GDDR5<br>\r\nDisplay Screen : 23.8\" 1920x1080 (FHD), IPS, 60Hz, 72% NTSC<br>\r\nMain Memory : 8GB (1x8GB) DDR4 3200MHz<br>\r\nStorage : 1TB Hard Drive 7200 rpm<br>\r\nOS : Windows 10 Home (64-bit) + Office Home and Student 2019', 23900, 100, 0, 'p_img103819575.webp'),
(57, 'AIO HP 22-df1023d (4C9F5PA#AKL)', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : Integrated Graphic : Intel Iris Xe<br>\r\nDisplay Screen : 21.5\" 1920x1080 (FHD) IPS, 60Hz<br>\r\nMain Memory : 8GB (1x8GB) DDR4 3200<br>\r\nStorage : 1TB Hard Drive 7200 rpm<br>\r\nOS : Windows 10 Home (64-bit)', 22900, 100, 0, 'p_img1549294904.webp'),
(58, 'AIO HP 22-df1027d (4C9F9PA#AKL)', 3, 'Processor : Intel Core i3-1125G4 (2.0GHZ up to 3.7GHz)<br>\r\nGraphics : Integrated Graphic : Intel UHD Graphics<br>\r\nDisplay Screen : 21.5\" 1920x1080 (FHD) IPS, 60Hz<br>\r\nMain Memory : 4GB (1x4GB) DDR4 3200<br>\r\nStorage : 1TB Hard Drive 7200 rpm<br>\r\nOS : Windows 10 Home (64-bit)', 18900, 100, 0, 'p_img12292460.webp'),
(59, 'AIO DELL Inspiron 5400-W266155600THW10', 3, 'Processor : Intel Core i5-1135G7 (2.4GHz up to 4.2GHz)<br>\r\nGraphics : NVIDIA GeForce MX330 (2GB GDDR5)<br>\r\nDisplay Screen : 23.8\", 1920 x 1080 (FHD), 60Hz<br>\r\nMain Memory : 8GB DDR4 2666MHz<br>\r\nStorage : 256GB M.2 PCIe NVMe SSD + 1TB 5400 rpm 2.5\"<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft® Office Home & Student 2019', 31900, 100, 0, 'p_img928176039.webp'),
(60, 'AIO DELL Inspiron 5400-W266155100THHS', 3, 'Processor : Intel Core i3-1115G4 (3.0GHz up to 4.1GHz)<br>\r\nGraphics : Integrated Graphic : Intel UHD Graphics<br>\r\nDisplay Screen : 23.8\", 1920 x 1080 (FHD), 60Hz<br>\r\nMain Memory : 8GB DDR4 2666MHz<br>\r\nStorage : 256GB M.2 PCIe NVMe SSD<br>\r\nOS : Windows 10 Home (64-bit) + Microsoft® Office Home & Student 2019', 22990, 100, 0, 'p_img78403148.webp'),
(61, 'Monitor 31.5\" PHILIPS 328E1CA/67 (VA, HDMI, DP)', 4, 'Screen Size : 31.5\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 3840 x 2160<br>\r\nRefresh Rate : 60Hz<br>\r\nAspect Ratio : 16:9', 12490, 100, 1, 'p_img779593570.webp'),
(62, 'Monitor 32\" SAMSUNG ODYSSEY LC32G55TQWEXXT (VA, HDMI, DP )', 4, 'Screen Size : 32\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 10900, 100, 0, 'p_img1025021580.webp'),
(63, 'Monitor 31.5\" SAMSUNG LC32T550FDEXXT (VA, DP, HDMI, SPK)', 4, 'Screen Size : 32\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 75Hz<br>\r\nAspect Ratio : 16:9', 9900, 100, 0, 'p_img1588558695.webp'),
(64, 'Monitor 31.5\" MSI Optix G32C4 (VA, HDMI, DP)', 4, 'Screen Size : 31.5\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 165Hz<br>\r\nAspect Ratio : 16:9', 8990, 100, 0, 'p_img1616686324.webp'),
(65, 'Monitor 31.5\" AOC Q32V3S/WS (IPS, HDMI, DP)', 4, 'Screen Size : 31.5\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 75Hz<br>\r\nAspect Ratio : 16:9', 8690, 100, 0, 'p_img600888566.webp'),
(66, 'Monitor 28\" ACER Nitro XV282KKvbmiipruzx (IPS, DP, HDMI, USB-C, SPK)', 4, 'Screen Size : 28\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 3840 x 2160<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 22900, 100, 0, 'p_img1509691190.webp'),
(67, 'Monitor 27\" DELL U2720Q (IPS, DP, HDMI, USB-C)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 3840 x 2160<br>\r\nRefresh Rate : 60Hz<br>\r\nAspect Ratio : 16:9', 22500, 100, 0, 'p_img931188800.webp'),
(68, 'Monitor 27\" MSI Optix MAG274QRF-QD (IPS, HDMI, DP, USB-C)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 165Hz<br>\r\nAspect Ratio : 16:9', 16900, 100, 0, 'p_img840274927.webp'),
(69, 'Monitor 27\" ASUS TUF VG27AQL1A (IPS, HDMI, DP, USB, SPK)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 170Hz<br>\r\nAspect Ratio : 16:9', 14290, 100, 0, 'p_img1106800120.webp'),
(70, 'Monitor 27\" LG 27GL850-B (IPS, DP, HDMI)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 12590, 100, 0, 'p_img390612382.webp'),
(71, 'Monitor 28\" AOC U28P2U/67 (IPS, DP, HDMI)', 4, 'Screen Size : 28\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 3840 x 2160<br>\r\nRefresh Rate : 60Hz<br>\r\nAspect Ratio : 16:9', 11200, 100, 0, 'p_img1898621925.webp'),
(72, 'Monitor 27\" SAMSUNG ODYSSEY LC27G55TQWEXXT (VA, DP, HDMI)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 2560 x 1440<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 9900, 100, 0, 'p_img1217952332.webp'),
(73, 'Monitor 27\" GIGABYTE G27FC (VA, HDMI, DP)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 165Hz<br>\r\nAspect Ratio : 16:9', 9090, 100, 0, 'p_img2014042874.webp'),
(74, 'Monitor 27\" PHILIPS 271E1D/67 (IPS, VGA, HDMI, DP)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 75Hz<br>\r\nAspect Ratio : 16:9', 6250, 100, 0, 'p_img2086334646.webp'),
(75, 'Monitor 27\" LENOVO D27-30 (VA VGA, HDMI)', 4, 'Screen Size : 27\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 75Hz<br>\r\nAspect Ratio : 16:9', 5900, 100, 0, 'p_img920564567.jpg'),
(76, 'Monitor 24.5\" ASUS ROG SWIFT PG259QN (IPS, HDMI, DP, USB)', 4, 'Screen Size : 24.5\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 360Hz<br>\r\nAspect Ratio : 16:9', 30900, 100, 0, 'p_img276677880.webp'),
(77, 'Monitor 24\" ACER Concept D CM2241Wbmiiprzx (IPS, DP, USB, HDMI)', 4, 'Screen Size : 24\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 1920 x 1200<br>\r\nRefresh Rate : 75Hz<br>\r\nAspect Ratio : 16:10', 9900, 100, 1, 'p_img1574133067.webp'),
(78, 'Monitor 23.6\" MSI G24C4 (VA, DP, HDMI)', 4, 'Screen Size : 23.6\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 6250, 100, 0, 'p_img1161280765.webp'),
(79, 'Monitor 23.8\" AOC G2490VX (VA, DP, HDMI)', 4, 'Screen Size : 23.8\"<br>\r\nPanel Type : VA<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 144Hz<br>\r\nAspect Ratio : 16:9', 5890, 100, 0, 'p_img1684175662.webp'),
(80, 'Monitor 24\" SAMSUNG LS24AM506NEXXT', 4, 'Screen Size : 24\"<br>\r\nPanel Type : IPS<br>\r\nMaximum Resolution : 1920 x 1080<br>\r\nRefresh Rate : 60Hz<br>\r\nAspect Ratio : 16:9', 5590, 100, 0, 'p_img262387886.webp'),
(81, 'MAINBOARD (AM4) ASUS PRIME A320M-A', 5, 'Socket : AM4<br>\r\nChipset : AMD A320<br>\r\nOperating System Support : Windows® 10 64-bit', 2050, 100, 2, 'p_img49101829.webp'),
(82, 'MAINBOARD (AM4) ASUS PRIME A520M-K', 5, 'Socket : AM4<br>\r\nChipset : AMD A520<br>\r\nOperating System Support : Windows® 10 64-bit', 2050, 100, 0, 'p_img56895844.webp'),
(83, 'MAINBOARD (AM4) ASROCK B450 GAMING-ITX/AC', 5, 'Socket : AM4<br>\r\nChipset : AMD B450<br>\r\nOperating System Support : Windows® 10 64-bit', 3530, 100, 0, 'p_img341061105.webp'),
(84, 'MAINBOARD (AM4) GIGABYTE B550 AORUS PRO AC', 5, 'Socket : AM4<br>\r\nChipset : AMD B550<br>\r\nOperating System Support : Windows® 10 64-bit', 5890, 100, 0, 'p_img1573874445.webp'),
(85, 'MAINBOARD (AM4) MSI MPG X570 GAMING PLUS', 5, 'Socket : AM4<br>\r\nChipset : AMD X570<br>\r\nOperating System Support : Windows® 10 64-bit', 5660, 100, 0, 'p_img1307646742.webp'),
(86, 'MAINBOARD (AM4) GIGABYTE X570S GAMING X', 5, 'Socket : AM4<br>\r\nChipset : AMD X570<br>\r\nOperating System Support : Windows® 10 64-bit', 6290, 100, 0, 'p_img1171558490.webp'),
(87, 'MAINBOARD (sTRX4) GIGABYTE AORUS TRX40 MASTER', 5, 'Socket : sTRX4<br>\r\nChipset : AMD TRX40<br>\r\nOperating System Support : Windows® 10 64-bit', 17900, 99, 0, 'p_img707782471.webp'),
(88, 'MAINBOARD (sWRX8) ASUS PRO-WS-WRX80-SAGE-SE-WIF', 5, 'Socket : sWRX8<br>\r\nChipset : AMD WRX80<br>\r\nOperating System Support : N/A', 38900, 100, 0, 'p_img1387619543.webp'),
(89, 'MAINBOARD (1200) ASROCK B560M STEEL LEGEND', 5, 'Socket : 1200<br>\r\nChipset : Intel B560<br>\r\nOperating System Support : Windows® 10 64-bit', 4290, 100, 1, 'p_img1264583149.webp'),
(90, 'MAINBOARD (1200) ASUS ROG STIRX B560-F GAMING WIFI', 5, 'Socket : 1200<br>\r\nChipset : Intel B560<br>\r\nOperating System Support : Windows® 10 64-bit', 6690, 100, 0, 'p_img371829410.webp'),
(91, 'MAINBOARD (1200) GIGABYTE H410M H V3', 5, 'Socket : 1200<br>\r\nChipset : Intel H510<br>\r\nOperating System Support : Windows® 10 64-bit', 2230, 100, 0, 'p_img231111227.webp'),
(92, 'MAINBOARD (1200) GIGABYTE H410M S2 V3', 5, 'Socket : 1200<br>\r\nChipset : Intel H510<br>\r\nOperating System Support : Windows® 10 64-bit\r\n', 2020, 100, 0, 'p_img380316560.webp'),
(93, 'MAINBOARD (1200) MSI H510M PRO', 5, 'Socket : 1200<br>\r\nChipset : Intel H510<br>\r\nOperating System Support : Windows® 10 64-bit', 2830, 100, 0, 'p_img1436339782.webp'),
(94, 'MAINBOARD (1200) ASUS H510M-K', 5, 'Socket : 1200<br>\r\nChipset : Intel H510<br>\r\nOperating System Support : Windows® 10 64-bit', 2250, 100, 0, 'p_img165387871.webp'),
(95, 'MAINBOARD (1200) ASROCK H570 STEEL LEGEND', 5, 'Socket : 1200<br>\r\nChipset : Intel H570<br>\r\nOperating System Support : Windows® 10 64-bit', 4790, 100, 0, 'p_img107955282.webp'),
(96, 'MAINBOARD (1200) ASROCK H570 PHANTOM GAMING 4', 5, 'Socket : 1200<br>\r\nChipset : Intel H570<br>\r\nOperating System Support : Windows® 10 64-bit', 3890, 100, 0, 'p_img1256727113.webp'),
(97, 'MAINBOARD (1200) MSI MEG Z490 GODLIKE', 5, 'Socket : 1200<br>\r\nChipset : Intel Z490<br>\r\nOperating System Support : Windows® 10 64-bit', 26500, 100, 0, 'p_img600286493.webp'),
(98, 'MAINBOARD (1200) GIGABYTE Z490I AORUS ULTRA', 5, 'Socket : 1200<br>\r\nChipset : Intel Z490<br>\r\nOperating System Support : Windows® 10 64-bit', 6590, 100, 0, 'p_img990069359.webp'),
(99, 'MAINBOARD (1200) MSI MEG Z590 GODLIKE', 5, 'Socket : 1200<br>\r\nChipset : Intel Z590<br>\r\nOperating System Support : Windows® 10 64-bit', 32900, 100, 1, 'p_img1318843188.webp'),
(100, 'MAINBOARD (1200) ASUS ROG MAXIMUS XIII APEX', 5, 'Socket : 1200<br>\r\nChipset : Intel Z590<br>\r\nOperating System Support : Windows® 10 64-bit', 17900, 100, 0, 'p_img1099166224.webp'),
(101, 'CPU AMD sWRX8 RYZEN THREADRIPPER PRO 3995WX', 6, 'Socket : sWRX8<br>\r\n# of Cores : 64<br>\r\n# of Threads : 128<br>\r\nFrequency : 2.7 GHz<br>\r\nTurbo Frequency : 4.2 GHz<br>\r\nIntegrated graphics : None', 189000, 100, 7, 'p_img1416155607.webp'),
(102, 'CPU AMD sWRX8 RYZEN THREADRIPPER PRO 3975WX', 6, 'Socket : sWRX8<br>\r\n# of Cores : 32<br>\r\n# of Threads : 64<br>\r\nFrequency : 3.5GHz<br>\r\nTurbo Frequency : 4.2GHz<br>\r\nIntegrated graphics : None', 94900, 100, 4, 'p_img1546929849.webp'),
(103, 'CPU AMD sTRX4 RYZEN THREADRIPPER 3990X', 6, 'Socket : sTRX4<br>\r\n# of Cores : 64<br>\r\n# of Threads : 128<br>\r\nFrequency : 2.9 GHz<br>\r\nTurbo Frequency : 4.5 GHz<br>\r\nIntegrated graphics : None', 136500, 99, 0, 'p_img1540177133.webp'),
(104, 'CPU AMD sTRX4 RYZEN THREADRIPPER 3970X', 6, 'Socket : sTRX4<br>\r\n# of Cores : 32<br>\r\n# of Threads : 64<br>\r\nFrequency : 3.7 GHz<br>\r\nTurbo Frequency : 4.5 GHz<br>\r\nIntegrated graphics : None', 68500, 100, 0, 'p_img199895321.webp'),
(105, 'CPU AMD sTRX4 RYZEN THREADRIPPER 3960X', 6, 'Socket : sTRX4<br>\r\n# of Cores : 24<br>\r\n# of Threads : 48<br>\r\nFrequency : 3.8 GHz<br>\r\nTurbo Frequency : 4.5 GHz<br>\r\nIntegrated graphics : None', 48500, 100, 0, 'p_img485866192.webp'),
(106, 'CPU AMD AM4 RYZEN9 5950X', 6, 'Socket : AM4<br>\r\n# of Cores : 16<br>\r\n# of Threads : 32<br>\r\nFrequency : 3.4 GHz<br>\r\nTurbo Frequency : 4.9 GHz<br>\r\nIntegrated graphics : None', 28600, 100, 2, 'p_img1582256834.webp'),
(107, 'CPU AMD AM4 RYZEN9 5900X', 6, 'Socket : AM4<br>\r\n# of Cores : 12<br>\r\n# of Threads : 24<br>\r\nFrequency : 3.7 GHz<br>\r\nTurbo Frequency : 4.8 GHz<br>\r\nIntegrated graphics : None', 18900, 100, 3, 'p_img2066860619.webp'),
(108, 'CPU AMD AM4 RYZEN7 5800X', 6, 'Socket : AM4<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 3.8 GHz<br>\r\nTurbo Frequency : 4.7 GHz<br>\r\nIntegrated graphics : None', 15500, 100, 1, 'p_img1523584222.webp'),
(109, 'CPU AMD AM4 RYZEN7 5700G', 6, 'Socket : AM4<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 3.8 GHz<br>\r\nTurbo Frequency : 4.6 GHz<br>\r\nIntegrated graphics : AMD Radeon Graphics', 14400, 100, 0, 'p_img2009383717.webp'),
(110, 'CPU AMD AM4 RYZEN5 5600X', 6, 'Socket : AM4<br>\r\n# of Cores : 6<br>\r\n# of Threads : 12<br>\r\nFrequency : 3.7 GHz<br>\r\nTurbo Frequency : 4.6 GHz<br>\r\nIntegrated graphics : None', 9900, 100, 0, 'p_img894288865.webp'),
(111, 'CPU AMD AM4 RYZEN5 5600G', 6, 'Socket : AM4<br>\r\n# of Cores : 6<br>\r\n# of Threads : 12<br>\r\nFrequency : 3.9 GHz<br>\r\nTurbo Frequency : 4.4 GHz<br>\r\nIntegrated graphics : AMD Radeon Graphics', 9900, 100, 0, 'p_img1142510200.webp'),
(112, 'CPU INTEL CORE I9 - 11900K LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 3.5 GHz<br>\r\nTurbo Frequency : 5.3 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 750', 20805, 100, 2, 'p_img1270157943.webp'),
(113, 'CPU INTEL CORE I9 - 11900 LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 2.5 GHz<br>\r\nTurbo Frequency : 5.2 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 750', 16750, 100, 5, 'p_img523413843.webp'),
(114, 'CPU INTEL CORE I7 - 10700KA LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 3.8 GHz<br>\r\nTurbo Frequency : 5.1 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 630', 12900, 100, 0, 'p_img1386435558.webp'),
(115, 'CPU INTEL CORE I7 - 10700K LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 3.8 GHz<br>\r\nTurbo Frequency : 5.1 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 630', 12900, 100, 0, 'p_img1352901068.webp'),
(116, 'CPU INTEL CORE I7 - 10700 LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 2.9 GHz<br>\r\nTurbo Frequency : 4.8 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 630', 11350, 100, 0, 'p_img1489024496.webp'),
(117, 'CPU INTEL CORE I7 - 10700F LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 8<br>\r\n# of Threads : 16<br>\r\nFrequency : 2.9 GHz<br>\r\nTurbo Frequency : 4.8 GHz<br>\r\nIntegrated graphics : None', 10200, 100, 0, 'p_img810296385.webp'),
(118, 'CPU INTEL CORE I5 - 11600KF LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 6<br>\r\n# of Threads : 12<br>\r\nFrequency : 3.9 GHz<br>\r\nTurbo Frequency : 4.9 GHz<br>\r\nIntegrated graphics : None', 9490, 100, 0, 'p_img35325348.webp'),
(119, 'CPU INTEL CORE I5 - 11400 LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 6<br>\r\n# of Threads : 12<br>\r\nFrequency : 2.6 GHz<br>\r\nTurbo Frequency : 4.4 GHz<br>\r\nIntegrated graphics : Intel UHD Graphics 730', 7890, 100, 0, 'p_img244226859.webp'),
(120, 'CPU INTEL CORE I3 - 10105F LGA 1200', 6, 'Socket : 1200<br>\r\n# of Cores : 4<br>\r\n# of Threads : 8<br>\r\nFrequency : 3.7 GHz<br>\r\nTurbo Frequency : 4.4 GHz<br>\r\nIntegrated graphics : None', 3190, 100, 0, 'p_img219189891.webp'),
(121, 'VGA INNO3D GEFORCE RTX 3080 ICHILL X4 - 10GB GDDR6 LHR VERSION', 7, 'Memory Size : 10GB<br>\r\nMemory Type : GDDR6X<br>\r\nMemory Interface : 320-bit<br>\r\nBus Interface : PCI Express 4.0 x16<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 1 Port (HDMI 2.1)', 48900, 99, 2, 'p_img195946579.webp'),
(122, 'VGA GIGABYTE GEFORCE RTX 3070 GAMING OC - 8GB GDDR6 REV2.0 LHR VERSION', 7, 'Memory Size : 8GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 256-bit<br>\r\nBus Interface : PCI Express 4.0 x16<br>\r\nDisplayPort : 2 Ports (DP 1.4a)<br>\r\nHDMI : 2 Ports (HDMI 2.1)', 39900, 100, 0, 'p_img1454767661.webp'),
(123, 'VGA ASUS GEFORCE RTX 3060 TI DUAL O8G V2 OC - 8GB GDDR6', 7, 'Memory Size : 8GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 256-bit<br>\r\nBus Interface : PCI Express 4.0<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 2 Ports (HDMI 2.1)', 36900, 100, 0, 'p_img741275284.webp'),
(124, 'VGA GIGABYTE GEFORCE RTX 3060 TI GAMING OC - 8GB GDDR6 REV.2.0', 7, 'Memory Size : 8GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 256-bit<br>\r\nBus Interface : PCI Express 4.0 x16<br>\r\nDisplayPort : 2 Ports (DP 1.4a)<br>\r\nHDMI : 2 Ports (HDMI 2.1)', 35900, 100, 0, 'p_img158495687.webp'),
(125, 'VGA INNO3D GEFORCE RTX 3060 TI ICHILL X3 RED - 8GB GDDR6', 7, 'Memory Size : 8GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 256-bit<br>\r\nBus Interface : PCI Express 4.0<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 1 Port (HDMI 2.1)', 34900, 100, 0, 'p_img430194412.webp'),
(126, 'VGA GIGABYTE GEFORCE RTX 3060 AORUS ELITE - 12GB GDDR6 REV.2.0 LHR VERSION', 7, 'Memory Size : 12GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 192-bit<br>\r\nBus Interface : PCI Express 4.0 x16<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 2 Ports (HDMI 2.1)', 30900, 100, 0, 'p_img809661798.webp'),
(127, 'VGA ASUS GEFORCE RTX 3060 KO O12G V2 GAMING - 12GB GDDR6 LHR VERSION', 7, 'Memory Size : 12GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 192-bit<br>\r\nBus Interface : PCI Express 4.0<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 2 Ports (HDMI 2.1)', 29900, 100, 0, 'p_img805493987.webp'),
(128, 'VGA INNO3D GEFORCE RTX 3060 TWIN X2 OC - 12GB GDDR6 LHR VERSION', 7, 'Memory Size : 12GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 192-bit<br>\r\nBus Interface : PCI Express 4.0 x16<br>\r\nDisplayPort : 3 Ports (DP 1.4a)<br>\r\nHDMI : 1 Port (HDMI 2.1)', 27900, 100, 0, 'p_img818389690.webp'),
(129, 'VGA GIGABYTE GEFORCE GTX 1660 TI GAMING OC - 6GB GDDR6', 7, 'Memory Size : 6GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 192-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : 3 Ports (DP 1.4)<br>\r\nHDMI : 1 Port (HDMI 2.0b)', 18900, 100, 0, 'p_img1632132119.webp'),
(130, 'VGA GIGABYTE GEFORCE GTX 1650 SUPER OC - 4GB GDDR6', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : 1 Port (DP 1.4)<br>\r\nHDMI : 1 Port (HDMI 2.0b)<br>\r\nDVI : 1 Port', 16900, 100, 0, 'p_img47888506.webp'),
(131, 'VGA ASUS GEFORCE GTX 1650 TUF 04G-P - 4GB GDDR6', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0<br>\r\nDisplayPort : 1 Port (DP 1.4)<br>\r\nHDMI : 1 Port (HDMI 2.0b)<br>\r\nDVI : 1 Port', 13500, 100, 0, 'p_img1230037106.jpg'),
(132, 'VGA GIGABYTE GRFORCE GTX 1650 OC - 4GB GDDR6 REV.2.0', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : 1 Port (DP 1.4)<br>\r\nHDMI : 1 Port (HDMI 2.0b)<br>\r\nDVI : 1 Port', 13500, 100, 0, 'p_img625022792.webp'),
(133, 'VGA ASUS GEFORCE GTX 1050 TI CERBERUS O4G - 4GB DDR5', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR5<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0<br>\r\nDisplayPort : 1 Port<br>\r\nHDMI : 1 Port<br>\r\nDVI : 1 Port', 10900, 100, 0, 'p_img77153276.webp'),
(134, 'VGA GIGABYTE NVIDIA QUADRO P2200 - 5GB DDR5', 7, 'Memory Size : 5GB<br>\r\nMemory Type : GDDR5<br>\r\nMemory Interface : 160-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : 4 Ports (DP 1.4)', 14900, 100, 0, 'p_img1726986655.webp'),
(135, 'VGA LEADTEK NVIDIA QUADRO P2200 - 5GB DDR5', 7, 'Memory Size : 5GB<br>\r\nMemory Type : GDDR5x<br>\r\nMemory Interface : 160-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : 4 Ports (DP 1.4)', 14000, 100, 0, 'p_img1701801888.webp'),
(136, 'VGA LEADTEK NVIDIA QUADRO T1000 - 4GB DDR6', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : None<br>\r\nHDMI : None', 12900, 100, 0, 'p_img1212346141.webp'),
(137, 'VGA LEADTEK NVIDIA QUADRO P1000 - 4GB DDR5', 7, 'Memory Size : 4GB<br>\r\nMemory Type : GDDR5<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : None<br>\r\nHDMI : None', 11900, 100, 0, 'p_img891354984.webp'),
(138, 'VGA LEADTEK NVIDIA QUADRO P620 - 2GB DDR5', 7, 'Memory Size : 2GB<br>\r\nMemory Type : GDDR5<br>\r\nMemory Interface : 128-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : None<br>\r\nHDMI : None', 5790, 100, 0, 'p_img2141853621.webp'),
(139, 'VGA LEADTEK NVIDIA QUADRO T400 - 4GB DDR6', 7, 'Memory Size : 2GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 64-bit<br>\r\nBus Interface : PCI Express 3.0 x16<br>\r\nDisplayPort : None<br>\r\nHDMI : None', 4490, 100, 0, 'p_img216730871.webp'),
(140, 'VGA POWER COLOUR RADEON RX 6700XT HELLHOUND - 12GB GDDR6', 7, 'Memory Size : 12GB<br>\r\nMemory Type : GDDR6<br>\r\nMemory Interface : 192-bit<br>\r\nBus Interface : PCI Express 4.0<br>\r\nDisplayPort : 3 Ports (DP 1.4)<br>\r\nHDMI : 1 Port (HDMI 2.1)', 32900, 100, 0, 'p_img382110112.webp'),
(141, 'RAM DDR4(4500)16GB (8GBX2) TEAM XTREEM BLACK', 8, 'Memory Size : 16GB. (8GBx2)<br>\r\nMemory Type : DDR4<br>\r\nBUS : 4500 MHz', 9560, 100, 1, 'p_img1840489897.jpg'),
(142, 'RAM DDR4(3600) 64GB (32GBX2) THERMALTAKE TOUGHRAM', 8, 'Memory Size : 64GB (32GBx2)<br>\r\nMemory Type : DDR4<br>\r\nBUS : 3600 MHz', 17890, 100, 0, 'p_img919806352.webp'),
(143, 'RAM DDR4(3200) 32GB (16GBX2) CORSAIR VENGEANCE RGB PRO SL BLACK', 8, 'Memory Size : 32GB (16GBx2)<br>\r\nMemory Type : DDR4<br>\r\nBUS : 3200MHz', 7650, 100, 0, 'p_img1505589745.webp'),
(144, 'RAM DDR4(2666) 32GB (16GBX2) KINGSTON FURY BEAST RGB', 8, 'Memory Size : 32GB (16GBx2)<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2666 MHz', 6090, 100, 0, 'p_img2026865387.webp'),
(145, 'RAM DDR4(2400) 8GB BLACKBERRY MAXIMUS', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2400 MHz', 1500, 100, 0, 'p_img1622994067.webp'),
(146, 'RAM DDR4(2133) 8GB BLACKBERRY MAXIMUS', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2133 MHz', 1500, 100, 0, 'p_img698604936.webp'),
(147, 'RAM DDR3L(1600) 8GB BLACKBERRY 16 CHIP', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3L<br>\r\nBUS : 1600', 1285, 100, 1, 'p_img1118826374.jpg'),
(148, 'RAM DDR3(1600) 8GB KINGSTON VALUE RAM', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1600 MHz', 2080, 100, 0, 'p_img1286216574.webp'),
(149, 'RAM DDR3(1333) 8GB BLACKBERRY 16 CHIP', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1333 MHz', 1240, 100, 0, 'p_img158260455.webp'),
(150, 'RAM DDR3(1066) 2GB BLACKBERRY 16 CHIP', 8, 'Memory Size : 2GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1066 MHz', 465, 100, 0, 'p_img150023063.webp'),
(151, 'RAM DDR4(3200, NB) 32GB TEAM ZEUS', 8, 'Memory Size : 32GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 3200 MHz (NB)', 5500, 100, 1, 'p_img1003111605.webp'),
(152, 'RAM DDR4(3200, NB) 16GB KINGSTON VALUE RAM', 8, 'Memory Size : 16GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 3200 MHz (NB)', 3050, 100, 2, 'p_img331087169.webp'),
(153, 'RAM DDR4(2666, NB) 16GB KINGSTON FURY IMPACT', 8, 'Memory Size : 16GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2666 MHz (NB)', 2970, 100, 0, 'p_img990479671.webp'),
(154, 'RAM DDR4(2666, NB) 8GB CORSAIR VENGEANCE', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2666 MHz (NB)', 1670, 100, 0, 'p_img1503149293.webp'),
(155, 'RAM DDR4(2400, NB) 8GB BLACKBERRY 8CHIP', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2400 MHz (NB)', 1440, 100, 0, 'p_img503960637.webp'),
(156, 'RAM DDR4(2133, NB) 8GB BLACKBERRY 8 CHIP', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR4<br>\r\nBUS : 2133 MHz (NB)', 1400, 100, 0, 'p_img1003623698.webp'),
(157, 'RAM DDR3L(1600, NB) 8GB HYNIX 16 CHIP', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3L<br>\r\nBUS : 1600 MHz (NB)', 1140, 100, 0, 'p_img42125186.webp'),
(158, 'RAM DDR3(1600, NB) 8GB CORSAIR VENGEANCE', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1600 MHz (NB)', 1810, 100, 0, 'p_img604937363.webp'),
(159, 'RAM DDR3(1333, NB) 8GB KINGSTON VALUE RAM', 8, 'Memory Size : 8GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1333 MHz (NB)', 2120, 100, 0, 'p_img1120554504.webp'),
(160, 'RAM DDR3(1066, NB) 2GB BLACKBERRY 16 CHIP', 8, 'Memory Size : 2GB<br>\r\nMemory Type : DDR3<br>\r\nBUS : 1066 MHz (NB)', 465, 100, 0, 'p_img2093272605.jpg'),
(161, '4 TB SSD M.2 PCIE 4.0 CORSAIR MP600 CORE', 9, 'Capacity : 4TB<br>\r\nInterface : PCIe Gen 4.0 x4, NVMe<br>\r\nSequential Read : Up to 4,950MB/s<br>\r\nSequential Write : Up to 3,950MB/s<br>\r\nForm Factor : M.2 2280', 24500, 100, 1, 'p_img161733769.webp'),
(162, '1 TB SSD M.2 PCIE 4.0 SEAGATE FIRECUDA 520', 9, 'Capacity : 1TB<br>\r\nInterface : PCIe Gen4 x4, NVMe 1.3<br>\r\nSequential Read : Up to 5,000 MB/s<br>\r\nSequential Write : Up to 4,400 MB/s<br>\r\nForm Factor : M.2 2280', 7390, 100, 0, 'p_img740185846.webp'),
(163, '500 GB SSD M.2 PCIE 4.0 SAMSUNG 980 PRO', 9, 'Capacity : 500GB<br>\r\nInterface : PCIe Gen 4.0 x4, NVMe 1.3c<br>\r\nSequential Read : Up to 6,900 MB/s<br>\r\nSequential Write : Up to 5,000 MB/s<br>\r\nForm Factor : M.2 2280', 4680, 100, 0, 'p_img1283391780.webp'),
(164, '250 GB SSD M.2 PCIE SAMSUNG 970 EVO PLUS', 9, 'Capacity : 250GB<br>\r\nInterface : PCIe Gen 3.0 x 4, NVMe 1.3<br>\r\nSequential Read : Up to 3,500 MB/s<br>\r\nSequential Write : Up to 2,300 MB/s<br>\r\nForm Factor : M.2 2280', 1910, 100, 0, 'p_img832435088.webp'),
(165, '128 GB SSD M.2 PCIE KINGMAX', 9, 'Capacity : 128GB<br>\r\nInterface : PCIe Gen3 x4, NVMe 1.3<br>\r\nSequential Read : Up to 1,800 MB/s<br>\r\nSequential Write : Up to 550 MB/s<br>\r\nForm Factor : M.2 2280', 910, 100, 0, 'p_img1202178025.webp'),
(166, '1 TB SSD M.2 WD BLUE', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III 6Gb/s<br>\r\nSequential Read : Up to 560 MB/s<br>\r\nSequential Write : Up to 530 MB/s<br>\r\nForm Factor : M.2 2280', 3760, 100, 0, 'p_img319349630.jpg'),
(167, '240 GB SSD M.2 WD GREEN', 9, 'Capacity : 240GB<br>\r\nInterface : SATA III 6Gb/s<br>\r\nSequential Read : Up to 545 MB/s<br>\r\nSequential Write : N/A<br>\r\nForm Factor : M.2 2280', 1180, 100, 0, 'p_img182794359.webp'),
(168, '1 TB SSD SATA SAMSUNG 870 EVO', 9, 'Capacity : 1TB<br>\r\nInterface : SATA 6 Gb/s<br>\r\nSequential Read : Up to 560 MB/s<br>\r\nSequential Write : Up to 530 MB/s<br>\r\nForm Factor : 2.5\"', 4890, 100, 0, 'p_img1717001817.webp'),
(169, '512 GB SSD SATA APACER AS350', 9, 'Capacity : 512GB<br>\r\nInterface : SATA III 6Gb/s<br>\r\nSequential Read : Up to 560MB/s<br>\r\nSequential Write : Up to 540MB/s<br>\r\nForm Factor : 2.5\"', 2020, 100, 0, 'p_img1708696743.webp'),
(170, '256 GB SSD SATA LEXAR NS100', 9, 'Capacity : 256GB<br>\r\nInterface : SATA III (6Gb/s)<br>\r\nSequential Read : Up to 520 MB/s<br>\r\nSequential Write : Up to 440 MB/s<br>\r\nForm Factor : 2.5\"', 1110, 100, 0, 'p_img1151245726.webp'),
(171, '12 TB HDD CCTV WD PURPLE', 9, 'Capacity : 12TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : 245 MB/s<br>\r\nRotational Speed : 7200 RPM<br>\r\nForm Factor : 3.5\"', 12950, 100, 0, 'p_img501312042.webp'),
(172, '6 TB HDD SEAGATE IRONWOLF', 9, 'Capacity : 6TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : 190MB/s<br>\r\nRotational Speed : 5400 RPM<br>\r\nForm Factor : 3.5\"', 6350, 100, 0, 'p_img600637015.webp'),
(173, '4 TB HDD TOSHIBA N300 NAS', 9, 'Capacity : 4 TB<br>\r\nInterface : SATA 6.0 Gbit/s<br>\r\nTransfer Rate : 204 MB/s<br>\r\nRotational Speed : 7200 RPM<br>\r\nForm Factor : 3.5\"', 3770, 100, 0, 'p_img393044102.webp'),
(174, '2 TB HDD WD BLACK', 9, 'Capacity : 2TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : N/A<br>\r\nRotational Speed : 7200RPM<br>\r\nForm Factor : 3.5\"', 3950, 100, 0, 'p_img752155030.webp'),
(175, '1 TB HDD SEAGATE IRONWOLF', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : 180MB/s<br>\r\nRotational Speed : 5900RPM<br>\r\nForm Factor : 3.5\"', 1930, 100, 0, 'p_img1606057711.webp'),
(176, '1 TB HDD (NOTEBOOK) SEAGATE BARRACUDA PRO', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : 160 MB/s<br>\r\nRotational Speed : 7200 RPM<br>\r\nForm Factor : 2.5\"', 1950, 100, 0, 'p_img76302120.webp');
INSERT INTO `cs_product` (`p_id`, `p_name`, `t_id`, `p_detail`, `p_price`, `p_amount`, `p_view`, `p_img`) VALUES
(177, '1 TB HDD (NOTEBOOK) WD BLUE', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : N/A<br>\r\nRotational Speed : 5400 RPM<br>\r\nForm Factor : 2.5\"', 1490, 100, 1, 'p_img1387691054.webp'),
(178, '1 TB HDD (NOTEBOOK) SEAGATE BARRACUDA', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : 140 MB/s<br>\r\nRotational Speed : 5400 RPM<br>\r\nForm Factor : 2.5\"', 1410, 100, 0, 'p_img422540718.webp'),
(179, '1 TB HDD (NOTEBOOK) TOSHIBA L200', 9, 'Capacity : 1TB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : N/A<br>\r\nRotational Speed : 5400 RPM<br>\r\nForm Factor : 2.5\"', 1350, 100, 0, 'p_img833734891.webp'),
(180, '500 GB HDD (NOTEBOOK) SEAGATE', 9, 'Capacity : 500GB<br>\r\nInterface : SATA III<br>\r\nTransfer Rate : N/A<br>\r\nRotational Speed : 5400 RPM<br>\r\nForm Factor : 2.5\"', 850, 100, 0, 'p_img1531120072.jpg'),
(181, 'Power Supply (80+ Titanium) 1600W CORSAIR AX1600i', 10, 'Power Capacity : 1600W<br>\r\nInput Voltage : 100-240V<br>\r\nInput Current : N/A<br>\r\nInput Frequency Range : N/A<br>\r\nCertification : 80 PLUS Titanium<br>\r\nModular : Full Modular', 17990, 100, 0, 'p_img1854306819.webp'),
(182, 'Power Supply (80+ Platinum) 1200W GIGABYTE AORUS P1200W', 10, 'Power Capacity : 1200W<br>\r\nInput Voltage : 100-240 Vac (Full Range)<br>\r\nInput Current : 15-7.5A<br>\r\nInput Frequency Range : 60-50Hz<br>\r\nCertification : 80 PLUS Platinum<br>\r\nModular : Full Modular', 11990, 100, 2, 'p_img1295268810.webp'),
(183, 'Power Supply (80+ Gold) 1500W SILVERSTONE SST-ST1500-GS', 10, 'Power Capacity : 850W<br>\r\nInput Voltage : 100-240Vac<br>\r\nInput Current : N/A<br>\r\nInput Frequency Range : N/A<br>\r\nCertification : 80 PLUS GOLD<br>\r\nModular : Full Modular', 8590, 100, 0, 'p_img936185709.webp'),
(184, 'Power Supply (80+ Gold) 750W GIGABYTE AORUS P750W', 10, 'Power Capacity : 750W<br>\r\nInput Voltage : 100-240 Vac (full range)<br>\r\nInput Current : 10A<br>\r\nInput Frequency Range : 47-63 Hz<br>\r\nCertification : 80 PLUS GOLD<br>\r\nModular : Full Modular', 4390, 100, 0, 'p_img84177306.webp'),
(185, 'Power Supply (80+ Gold) 750W ASUS ROG STRIX 750G', 10, 'Power Capacity : 750W<br>\r\nInput Voltage : 100-240Vac<br>\r\nInput Current : N/A<br>\r\nInput Frequency Range : N/A<br>\r\nCertification : 80 PLUS GOLD<br>\r\nModular : Full Modular', 4390, 100, 0, 'p_img289383498.webp'),
(186, 'Power Supply (80+ Silver) 500W ITSONAS DARK FOREST DF-FX500', 10, 'Power Capacity : 500W<br>\r\nInput Voltage : 200 - 240V<br>\r\nInput Current : 5A<br>\r\nInput Frequency Range : 47 - 63Hz<br>\r\nCertification : 80 PLUS SILVER<br>\r\nModular : Full Modular', 2590, 100, 0, 'p_img1400464205.webp'),
(187, 'Power Supply (80+ Bronze) 750W THERMALTAKE SMART BM2', 10, 'Power Capacity : 750W<br>\r\nInput Voltage : 100V-240V<br>\r\nInput Current : 10A<br>\r\nInput Frequency Range : 47Hz -63Hz<br>\r\nCertification : 80 PLUS BRONZE<br>\r\nModular : Semi Modular', 2850, 100, 0, 'p_img1976623191.webp'),
(188, 'Power Supply (80+ Bronze) 750W COOLER MASTER MASTERWATT', 10, 'Power Capacity : 750W<br>\r\nInput Voltage : 100-240Vac<br>\r\nInput Current : 10-5A<br>\r\nInput Frequency Range : 50-60Hz<br>\r\nCertification : 80 PLUS BRONZE<br>\r\nModular : Semi Modular', 2620, 100, 0, 'p_img1584669547.webp'),
(189, 'Power Supply (80+ Bronze) 650W CORSAIR CX650F RGB Black', 10, 'Power Capacity : 650W<br>\r\nInput Voltage : 100 - 240V<br>\r\nInput Current : 10A - 5A<br>\r\nInput Frequency Range : 47Hz - 63Hz<br>\r\nCertification : 80 PLUS BRONZE<br>\r\nModular : Full Modular', 3590, 100, 0, 'p_img365885568.webp'),
(190, 'Power Supply (80+ Bronze) 700W ITSONAS AURORA ARGB', 10, 'Power Capacity : 700W<br>\r\nInput Voltage : 220 ~ 240V<br>\r\nInput Current : 8 ~ 10 Amps<br>\r\nInput Frequency Range : 47 ~ 63 Hz<br>\r\nCertification : 80 Plus Bronze<br>\r\nModular : Full Modular', 2150, 100, 0, 'p_img438126790.webp'),
(191, 'Power Supply (80+ Bronze) 550W ANTEC NEO ECO', 10, 'Power Capacity : 550W<br>\r\nInput Voltage : 100VAC - 240VAC ~ ±10%<br>\r\nInput Current : N/A<br>\r\nInput Frequency Range : 47Hz - 63Hz<br>\r\nCertification : 80 PLUS BRONZE<br>\r\nModular : Semi Modular', 1790, 100, 0, 'p_img237158813.webp'),
(192, 'Power Supply (80+ Bronze) 550W CORSAIR CV550', 10, 'Power Capacity : 550W<br>\r\nInput Voltage : 100 - 240V<br>\r\nInput Current : 10A - 5A<br>\r\nInput Frequency Range : 47Hz - 63Hz<br>\r\nCertification : 80 PLUS BRONZE<br>\r\nModular : Non Modular', 1690, 100, 0, 'p_img1641594871.webp'),
(193, 'Power Supply (80+ White) 700W THERMALTAKE SMART RGB', 10, 'Power Capacity : 700W<br>\r\nInput Voltage : 100Vac - 240Vac<br>\r\nInput Current : 12A max<br>\r\nInput Frequency Range : 50 Hz - 60 Hz<br>\r\nCertification : 80 PLUS WHITE<br>\r\nModular : Non Modular', 2190, 100, 0, 'p_img1538061075.webp'),
(194, 'Power Supply (80+ White) 700W ZALMAN MEGAMAX ZM700-TXII', 10, 'Power Capacity : 700W<br>\r\nInput Voltage : 200-240VAC<br>\r\nInput Current : 6A<br>\r\nInput Frequency Range : 50-60Hz<br>\r\nCertification : 80 PLUS WHITE<br>\r\nModular : Non Modular', 1790, 100, 0, 'p_img636633532.webp'),
(195, 'Power Supply (80+ White) 550W THERMALTAKE TR2 S', 10, 'Power Capacity : 550W<br>\r\nInput Voltage : 230 Vac<br>\r\nInput Current : 7A max<br>\r\nInput Frequency Range : 50 Hz - 60 Hz<br>\r\nCertification : 80 PLUS WHITE<br>\r\nModular : Non Modular', 1590, 100, 0, 'p_img1193629626.webp'),
(196, 'Power Supply (80+ White) 500W SILVERSTONE ST50F-ES230', 10, 'Power Capacity : 500W<br>\r\nInput Voltage : 180V~264V<br>\r\nInput Current : N/A<br>\r\nInput Frequency Range : 47Hz ~ 63Hz<br>\r\nCertification : 80 PLUS WHITE<br>\r\nModular : Non Modular', 1290, 100, 0, 'p_img650690477.webp'),
(197, 'Power Supply (FULL) 650W NUBWO NPS-020', 10, 'Power Capacity : 650W<br>\r\nInput Voltage : 186 - 240Vac<br>\r\nInput Current : 12 - 6A<br>\r\nInput Frequency Range : 50 - 60Hz<br>\r\nCertification : N/A<br>\r\nModular : Non Modular', 850, 100, 0, 'p_img1077503483.webp'),
(198, 'Power Supply 620W TSUNAMI RED STORM', 10, 'Power Capacity : 620W<br>\r\nInput Voltage : 100V ~ 240V<br>\r\nInput Current : 8~10 Amps<br>\r\nInput Frequency Range : 50~60 Hz<br>\r\nCertification : N/A<br>\r\nModular : Non Modular', 820, 100, 0, 'p_img399506921.webp'),
(199, 'Mini Power Supply (80+ Gold) 850W COOLER MASTER V850 SFX', 10, 'Power Capacity : 850W<br>\r\nInput Voltage : 90-264V<br>\r\nInput Current : 12-6A<br>\r\nInput Frequency Range : 47-63Hz<br>\r\nCertification : 80 PLUS Gold<br>\r\nModular : Full Modular', 4590, 100, 0, 'p_img1750847459.jpg'),
(200, 'Mini Power Supply 450W DTECH PW053', 10, 'Power Capacity : 450W<br>\r\nInput Voltage : 220V<br>\r\nInput Current : 3.5A<br>\r\nInput Frequency Range : 50Hz<br>\r\nCertification : N/A<br>\r\nModular : Non Modular', 490, 100, 0, 'p_img239161729.webp'),
(201, 'ATX CASE (NP) VIKINGS B5', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 2.0 x 2, HD Audio & Mic<br>\r\nFan : Side : 120mm x 1 (ARGB 2 หน้า)<br>\r\nDimension : (W x D x H) : 17.60 x 40.00 x 41.00 cm<br>\r\nNet Weight : 2.80 KG', 570, 100, 1, 'p_img230396098.webp'),
(202, 'ATX CASE (NP) CUBIC RHINO', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 2.0 x 2, Audio x 1, MIC x 1<br>\r\nFan : Rear : 80mm x 1<br>\r\nDimension : (W x D x H) : 17.40 x 37.50 x 41.00 cm<br>\r\nNet Weight : 2.50 KG', 540, 100, 0, 'p_img818741572.webp'),
(203, 'ATX CASE (NP) ITSONAS STARRY ARGB', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 2.0 x 2, USB 3.0 x 1, HD Audio & Mic<br>\r\nFan : PSU Shroud : 120mm x 2 (ARGB), Rear : 120mm x 1 (ARGB)<br>\r\nDimension : (W x D x H) : 21.00 x 41.50 x 45.40 cm<br>\r\nNet Weight : 4.95 KG', 1570, 100, 0, 'p_img1279993798.webp'),
(204, 'ATX CASE (NP) NUBWO NPC-325 RISKER', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : Front : 120mm x 1, Rear : 120mm x 1<br>\r\nFan : (W x D x H) : Front : 120mm x 1, Rear : 120mm x 1<br>\r\nDimension : (W x D x H) : 19.00 x 39.00 x 44.00 cm<br>\r\nNet Weight : 3.90 KG', 1090, 100, 0, 'p_img1527756288.webp'),
(205, 'ATX CASE (NP) TSUNAMI PROTECTOR TITAN', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 2, Audio & Mic<br>\r\nFan : Front : 120mm x 3<br>\r\nDimension : (W x D x H) : 30.00 x 75.50 x 60.00 cm<br>\r\nNet Weight : 12.05 KG', 3490, 100, 0, 'p_img626695175.webp'),
(206, 'ATX CASE (NP) TSUNAMI PROTECTOR BUMBLEBEE ARGB', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 1<br>\r\nFan : Front : 120mm x 3 (Ablaze ARGB), Rear : 120mm x 1 (Ablaze ARGB)<br>\r\nDimension : (W x D x H) : 30.00 x 68.00 x 40.00 cm<br>\r\nNet Weight : 11.00 KG', 2490, 100, 0, 'p_img407481292.webp'),
(207, 'ATX CASE (NP) COOLERMASTER SL600M', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.1 Type C x 1, USB 3.0 Type A x 2, USB 2.0 Type A x 2, Audio In / Out : 1 x 3.5mm<br>\r\nFan : Bottom : 200mm x 2 (Speed: 400~800RPM / Connector: 4Pin)<br>\r\nDimension : (W x D x H) : 24.20 x 54.40 x 57.30 cm<br>\r\nNet Weight : 13.40 KG', 6390, 100, 0, 'p_img903108754.webp'),
(208, 'ATX CASE (NP) AEROCOOL GLADIATOR DUO', 11, 'Mainboard Support : ATX / Micro ATX / Mini-ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 2, HD Audio & Mic<br>\r\nFan : Top : 120mm x 2 (ARGB Fan), Rear : 120mm x 1 (ARGB Fan)<br>\r\nDimension : (W x D x H) : 21.00 x 40.40 x 51.90 cm<br>\r\nNet Weight : 5.75 KG', 1990, 100, 0, 'p_img358559462.webp'),
(209, 'ATX CASE (NP) ANTEC DP502 FLUX', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 2, MIC/Audio<br>\r\nFan : Front : 120mm x 3, Rear : 120mm x 1, PSU Shroud : 120mm x 1 (Reverse Fan)<br>\r\nDimension : (W x D x H) : 22.00 x 46.30 x 48.60 cm<br>\r\nNet Weight : 7.55 KG', 2550, 100, 0, 'p_img2071884903.webp'),
(210, 'ATX CASE (NP) CORSAIR ICUE 7000X RGB TG', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 4, USB 3.1 Type-C x 1, Headphone/Mic Combo Jack<br>\r\nFan : Front : 140mm x 3 (RGB), Rear : 140mm x 1 (RGB)<br>\r\nDimension : (W x D x H) : 24.80 x 55.00 x 60.00 cm<br>\r\nNet Weight : 19.80 KG', 9690, 100, 0, 'p_img343410265.webp'),
(211, 'ATX CASE (NP) GIGABYTE AORUS C300 GLASS', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : HDMI x 1, USB 3.1 Gen2 Type-C x 1, USB 3.0 x 2, Audio In & Out (Supports AC97 / HD Audio)<br>\r\nFan : Front : 120mm x 1, Rear : 120mm x 1<br>\r\nDimension : (W x D x H) : 21.10 x 45.80 x 46.90 cm<br>\r\nNet Weight : 8.00 KG', 2890, 100, 0, 'p_img1442222457.webp'),
(212, 'ATX CASE (NP) MONTECH AIR X', 11, 'Mainboard Support : E-ATX / ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 2.0 x 1, USB 3.0 x 2, MIC x 1, Audio x 1<br>\r\nFan : Front : 200mm x 2 (ARGB Fan), Rear : 120mm x 1 (ARGB Fan)<br>\r\nDimension : (W x D x H) : 21.00 x 42.50 x 45.80 cm<br>\r\nNet Weight : 7.10 KG', 1790, 100, 0, 'p_img1578930090.webp'),
(213, 'ATX CASE (NP) NZXT H510 ELITE', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.1 Gen 2 Type-C x 1, USB 3.2 Gen 1 Type-A x 1, Headset Audio Jack x 1<br>\r\nFan : Front : 140mm x 2 (ARGB), Rear : 120mm x 1<br>\r\nDimension : (W x D x H) : 21.00 x 42.80 x 46.00 cm<br>\r\nNet Weight : 7.50 KG', 5690, 100, 0, 'p_img2084357973.webp'),
(214, 'ATX CASE (NP) NZXT H510', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.1 Gen 2 Type-C x 1, USB 3.1 Gen 1 Type-A x 1, Headset audio Jack x  1<br>\r\nFan : Top : 120mm x 1, Rear : 120mm x 1<br>\r\nDimension : (W x D x H) : 21.00 x 42.80 x 46.00 cm<br>\r\nNet Weight : 6.60 KG', 2690, 100, 0, 'p_img1210151862.webp'),
(215, 'ATX CASE (NP) SILVERSTONE FARA V1M PRO', 11, 'Mainboard Support : Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 2, USB 2.0 x 2, Audio x 1, MIC x 1<br>\r\nFan : Front : 120mm x 1 (ARGB Fan), Rear : 120mm x 1 (Black Fan)<br>\r\nDimension : (W x D x H) : 21.00 x 39.40 x 43.50 cm<br>\r\nNet Weight : 5.47 KG', 1750, 100, 0, 'p_img428875312.webp'),
(216, 'ATX CASE (NP) THERMALTAKE DIVIDER 500 TG ARGB', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.2 (Gen 2) Type-C x 1, USB 3.0 x 2, HD Audio<br>\r\nFan : Front : 120mm x 3 (ARGB), Rear : 120mm x 1<br>\r\nDimension : (W x D x H) : 23.00 x 46.60 x 53.00 cm<br>\r\nNet Weight : 10.60 KG', 4690, 100, 0, 'p_img1766100643.webp'),
(217, 'ATX CASE (NP) VERMAX WINDWALK', 11, 'Mainboard Support : ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.0 x 1, USB 1.0 x 2, Audio in/out<br>\r\nFan : Front : 120mm x 3 (ARGB), Rear : 120mm x 1 (ARGB)<br>\r\nDimension : (W x D x H) : 21.00 x 46.00 x 34.50 cm<br>\r\nNet Weight : 5.10 KG', 1690, 100, 0, 'p_img67394457.webp'),
(218, 'MINI-ITX CASE (NP) ASUS ROG Z11', 11, 'Mainboard Support : Mini ITX / Mini-DTX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.2 Gen 2 Type-C x 1, USB 3.2 Gen 1 TYPE A x 2, USB 2.0 TYPE A x 2, Headphone / Microphone x 1<br>\r\nFan : Top : 140mm x 2, Bottom : 140mm x 1<br>\r\nDimension : (W x D x H) : 19.40 x 38.60 x 53.10 cm<br>\r\nNet Weight : 8.73 KG', 9490, 100, 0, 'p_img1641249716.webp'),
(219, 'mATX CASE (NP) THERMALTAKE AHT200', 11, 'Mainboard Support : Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : USB 3.1 (Gen 2) Type C x 1, USB 3.0 x 2, HD Audio x 1<br>\r\nFan : None<br>\r\nDimension : (W x D x H) : 28.20 x 55.15 x 44.42 cm<br>\r\nNet Weight : 10.80 KG', 4390, 100, 0, 'p_img155459737.webp'),
(220, 'E-ATX CASE (NP) ASUS ROG STRIX HELIOS GUNDAM', 11, 'Mainboard Support : E-ATX / ATX / Micro ATX / Mini ITX<br>\r\nPower Supply : No Power<br>\r\nFront I/O Port : Headphone x 1, Microphone x 1, USB 3.1 Gen1 x 4, USB 3.1 Gen2 Type C x 1<br>\r\nFan : Front : 140mm x 3, Rear : 140mm x 1<br>\r\nDimension : (W x D x H) : 25.00 x 56.50 x 59.10 cm<br>\r\nNet Weight : 18.00 KG', 12460, 100, 0, 'p_img2006163091.webp'),
(221, 'WIRELESS MOUSE RAZER LANCEHEAD', 12, 'Interface : Wireless USB<br>\r\nResolution : 16,000 DPI', 4690, 100, 1, 'p_img76431517.webp'),
(222, 'MOUSE ASUS ROG CHAKRAM CORE', 12, 'Interface : USB<br>\r\nResolution : 100-16,000 DPI<br>\r\nButtons : 9 (5 + 4 in digital joystick mode)', 2990, 100, 0, 'p_img2044103206.webp'),
(223, 'MOUSE STEELSERIES RIVAL 650', 12, 'Interface : USB Wireless Transmitter<br>\r\nResolution : 100 - 12,000DPI<br>\r\nButtons : 7 Buttons<br>\r\nCable Length : 2M', 3990, 100, 1, 'p_img2071567812.webp'),
(224, 'USB MOUSE HP (M220)', 12, 'Interface : USB<br>\r\nResolution : 500/1000/1500/2000/2500 DPI<br>\r\nButtons : 7 Buttons', 350, 100, 0, 'p_img2013285007.webp'),
(225, 'MULTI MODE MOUSE LOGITECH MX ANYWHERE 3', 12, 'Interface : Bluetooth, USB Wireless 2.4 GHz<br>\r\nResolution : 200- 4000 DPI<br>\r\nButtons : 6 Buttons', 2490, 100, 0, 'p_img1652248533.webp'),
(226, 'USB MOUSE HP (G100)', 12, 'Interface : USB<br>\r\nResolution : 1000, 1600, 3200, 6400 DPI<br>\r\nButtons : 4 Buttons<br>\r\nCable Length : 1.8M', 260, 100, 0, 'p_img905725994.webp'),
(227, 'WACOM INTUOS PRO M, BLUETOOTH (PTH-660/K0-CX)', 12, 'Tablet Size : 338 x 219 x 8 mm. / 13.2 x 8.5 x 0.3 inch<br>\r\nActive Area : 224 x 148 mm. / 8.7 x 5.8 inch<br>\r\nInterface : USB, Bluetooth Classic<br>\r\nButtons : 8 Buttons', 13000, 100, 0, 'p_img667335552.webp'),
(228, 'PEN MOUSE GENIUS (EASYPEN I405X)', 12, 'Active Area : 4\" x 5.5\"<br>\r\nInterface : USB', 1290, 100, 1, 'p_img296634580.webp'),
(229, 'KEYBOARD RAZER BLACKWIDOW V3 TENKEYLESS GREEN SWITCH (TH)', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 87 Keys<br>\r\nKey Switches : Green Mechanical Switch', 2990, 100, 0, 'p_img1443602846.webp'),
(230, 'KEYBOARD CORSAIR K60 PRO (TH)', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 104 Keys<br>\r\nKey Switches : CHERRY® VIOLA', 3290, 100, 0, 'p_img818146248.webp'),
(231, 'KEYBOARD STEELSERIES APEX 7 (TH)', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 104 Keys<br>\r\nKey Switches : Red Switches', 5290, 100, 0, 'p_img561038884.webp'),
(232, 'USB Keyboard LOGITECH (K120)', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 104 key<br>\r\nCable Length : 1.5M', 280, 100, 1, 'p_img1331577940.webp'),
(233, 'USB Keyboard MD-TECH (KB-674)', 12, 'Interface : USB 2.0<br>\r\nKeys Windows Layout : 104 Keys<br>\r\nKey Switches : RUBBER<br>\r\nCable Length : 1.45M', 150, 100, 0, 'p_img1771180097.webp'),
(234, 'PAD STEELSERIES PRISM CLOTH M SIZE', 12, 'Material : Micro-woven cloth + RGB LEDs<br>\r\nSpecial Features : 16.8 Million RGB Color Options<br>\r\nPackage Dimension : (W x D x H) : 4.00 x 36.60 x 29.00 cm<br>\r\nGross Weight : 0.06 KG', 1390, 100, 0, 'p_img2028699166.webp'),
(235, 'PAD CORSAIR MM800 POLARIS CLOTH RGB', 12, 'Material : Plastic<br>\r\nDimension : (W x D x H) : 35.00 x 26.00 x 0.50 cm<br>\r\nNet Weight : 0.00 KG', 2190, 100, 0, 'p_img509444659.webp'),
(236, 'PAD SIGNO E-SPORT MT330 AREAS-3 SPEED GAMING', 12, 'Material : Microfiber Weave Fabric<br>\r\nSpecial Features : Anti-Slip Rubber Base, Waterproof Resistant<br>\r\nDimension : (W x D x H) : 90.00 x 40.00 x 0.30 cm<br>\r\nNet Weight : 0.63 KG', 290, 100, 0, 'p_img774818842.webp'),
(237, 'PAD FANTECH MP902 SPEED GAMING', 12, 'Dimension : (W x D x H) : 90.00 x 30.00 x 0.30 cm<br>\r\nNet Weight : 0.00 KG', 200, 100, 0, 'p_img1937872051.webp'),
(238, '3 IN 1 BOXSET RAZER LEVEL UP BUNDLE (CYNOSA LITE + GIGANTUS V2 + VIPER MINI)', 12, 'KB Interface : USB<br>\r\nKB Keys Windows Layouts : 104<br>\r\nKB Cable Length : 1.8M<br>\r\nMouse Interface : USB<br>\r\nMouse Buttons : 6 Buttons<br>\r\nMouse High Resolution : 8500 DPI<br>\r\nMouse Cable Length : 1.8M<br>\r\nMouse Pad Dimension (WxDxH) : 360 x 275 x 3 mm', 2090, 100, 1, 'p_img1487392032.webp'),
(239, '2 IN 1 BOXSET COOLER MASTER MASTERSET MS110 RGB', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 104 Keys', 1390, 100, 1, 'p_img1700253093.webp'),
(240, '(2in1) USB LOGITECH (MK200) Black', 12, 'Interface : USB<br>\r\nKeys Windows Layout : 104 Keys', 510, 100, 0, 'p_img990044000.webp'),
(241, '(2.0) FANTECH (GS-202) USB Black', 13, 'Type : USB 2.0 Gaming Speaker<br>\r\nChannels : Stereo<br>\r\nInterface : 3.5mm + USB<br>\r\nDriver : 45mm<br>\r\nCable Length : 1.2m62', 450, 100, 1, 'p_img224104199.webp'),
(242, '(2.0) LENOVO SOUND BAR L101 White', 13, 'Output Power (RMS) : 6W<br>\r\nFrequency : 25Hz-25KHz<br>\r\nConnector type : AUX 3.5mm / USB<br>\r\nPower Supply : 5V<br>\r\nBattery : 1300mAh', 390, 100, 0, 'p_img262293292.webp'),
(243, '(2.0) GENIUS (SP-HF180) USB Black', 13, 'Output Power (RMS) : 6W<br>\r\nFrequency : 150Hz-20KHz<br>\r\nSensitivity : 450 +/ 100 mv<br>\r\nConnector type : USB / AUX 3.5', 290, 100, 0, 'p_img469069079.webp'),
(244, '(2.0) OKER (SP-568) USB Pink', 13, 'Output Power (RMS) : 3W x 2<br>\r\nFrequency : 25Hz-20KHz<br>\r\nSensitivity : 40dB<br>\r\nConnector type : AUX 3.5mm / USB<br>\r\nPower Supply : 5VDC', 220, 100, 2, 'p_img1028513521.webp'),
(245, '(2.0) FANTECH RUMBLE (GS204) BLUETOOTH RGB', 13, 'Output Power (RMS) : 3W x 2<br>\r\nFrequency : 130-20,000Hz<br>\r\nBluetooth : Yes<br>\r\nConnector type : AUX 3.5mm / USB', 990, 100, 0, 'p_img1997147360.webp'),
(246, '(1.0) JBL CHARGE 4 BLUETOOTH Black', 13, 'Output Power (RMS) : 30W<br>\r\nFrequency : 60Hz–20kHz<br>\r\nConnector type : USB-C<br>\r\nPower Supply : 5V/2A<br>\r\nBattery : Lithium-ion Polymer 27Wh', 6590, 100, 0, 'p_img1645599136.webp'),
(247, 'HEADSET (7.1) RAZER BLACKSHARK V2 + USB SOUND CARD', 13, 'Frequency : 12Hz – 28kHz<br>\r\nSensitivity : 100dBSPL/mW, 1kHz<br>\r\nMicrophone : 100Hz – 10kHz<br>\r\nConnector type : Analog 3.5mm with USB sound card<br>\r\nCable Length : 1.8m / 5.91ft.', 3590, 100, 0, 'p_img2037436036.webp'),
(248, 'HEADSET (7.1) STEELSERIES ARCTIS PRO (BLACK)', 13, 'Frequency : 10–40,000 Hz<br>\r\nSensitivity : 102 dB SPL<br>\r\nMicrophone : Retractable Boom<br>\r\nConnector type : USB', 6490, 100, 1, 'p_img1513799103.webp'),
(249, 'HEADSET (7.1) CORSAIR HS60 PRO STEREO (HAPTIC)', 13, 'Frequency : 20Hz - 20 kHz<br>\r\nSensitivity : 111dB (+/-3dB)<br>\r\nMicrophone : Unidirectional noise cancelling<br>\r\nConnector type : USB<br>\r\nCable Length : 1.8m', 3890, 100, 0, 'p_img1488470973.webp'),
(250, 'HEADSET (2.1) HYPERX CLOUD ORBIT S', 13, 'Frequency : 10Hz-50KHz<br>\r\nMicrophone : Electret condenser microphone Uni-directional<br>\r\nConnector type : USB<br>\r\nCable Length : USB Type C', 9990, 100, 0, 'p_img699596833.webp'),
(251, 'HeadSet HP (H500) Gold', 13, 'Frequency : 20Hz - 20KHz<br>\r\nMicrophone : Noise-canceling microphone<br>\r\nConnector type : 1 x 3.5mm, 1 x USB<br>\r\nCable Length : 2.15m', 810, 100, 0, 'p_img1711752768.webp'),
(252, 'HeadSet MARVO (HG8936) Pink', 13, 'Frequency : 20Hz-20KHz<br>\r\nSensitivity : 108dB ±3dB<br>\r\nMicrophone : Omnidirectional<br>\r\nConnector type : 2 x AUX 3.5mm / USB<br>\r\nCable Length : 2.1m', 399, 100, 0, 'p_img1474651381.webp'),
(253, 'Headphone Wireless JBL (Tune 700BT) White', 13, 'Frequency : 20Hz-20kHz<br>\r\nSensitivity : 100dB<br>\r\nMicrophone : Yes<br>\r\nConnector type : Bluetooth 4.2', 2990, 100, 0, 'p_img1077194082.webp'),
(254, 'Headphone Bluetooth OKER (BT-1625) Black', 13, 'Frequency : 20Hz - 20KHz<br>\r\nSensitivity : 108dB +/-3dB<br>\r\nMicrophone : Yes<br>\r\nConnector type : Bluetooth 5.0<br>\r\nBattery : 250mAH', 360, 100, 0, 'p_img394121605.webp'),
(255, 'MICROPHONE HYPERX QUADCAST', 13, 'Frequency : 20Hz–20kHz<br>\r\nSensitivity : -36dB (1V/Pa at 1kHz)<br>\r\nConnector type : USB Cable Length 2m<br>\r\nFeature : Headphone Output', 4390, 100, 0, 'p_img85397840.webp'),
(256, 'MICROPHONE NUBWO X300 CYPHER', 13, 'Frequency : 20hz-20Khz<br>\r\nConnector type : USB Type A to Type-C<br>\r\nFeature : Sample Rate 96 Khz, Bit Rate 24 bit', 2390, 100, 0, 'p_img685917183.webp'),
(257, 'MICROPHONE FANTECH LEVIOSA-MCX01', 13, 'Frequency : 20Hz-20kHz<br>\r\nSensitivity : -38dB±3dB<br>\r\nConnector type : USB<br>\r\nFeature : Compatibility', 1290, 100, 0, 'p_img692343350.webp'),
(258, 'USB MicroPhone Condenser OKER MIC-2021 Black', 13, 'Frequency : 30Hz-20kHz<br>\r\nS/N Ratio : 70 dB<br>\r\nConnector type : USB<br>\r\nFeature : Polar pattern : Cardioid (Heart-shaped), Volume adjustment & mute keys, RGB', 890, 100, 0, 'p_img1278581568.webp'),
(259, 'USB MicroPhone NUBWO (M32) Black', 13, 'Sensitivity : -34dB ± 3dB<br>\r\nConnector type : USB<br>\r\nFeature : Microphone Directivity : Omni Direction, 7 colors and RGB Lighting<br>\r\nCable : PVC 1.5M', 259, 100, 0, 'p_img1826621196.webp'),
(260, 'USB MicroPhone Condenser EGA (TYPE-MC4) Black', 13, 'Frequency : 20Hz-20KHz<br>\r\nSensitivity : -38dB +3dB<br>\r\nConnector type : USB', 825, 100, 0, 'p_img187644482.webp');

-- --------------------------------------------------------

--
-- Table structure for table `cs_type`
--

CREATE TABLE `cs_type` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_type`
--

INSERT INTO `cs_type` (`t_id`, `t_name`) VALUES
(1, 'Notebook'),
(2, 'Desktop PC'),
(3, 'All-In-One PC'),
(4, 'Monitor'),
(5, 'Mainboard'),
(6, 'CPU'),
(7, 'Graphic Card'),
(8, 'RAM'),
(9, 'SSD / HDD'),
(10, 'Power Supply'),
(11, 'Case'),
(12, 'Mouse / Keyboard / Pad'),
(13, 'Speaker / Headset / Mic');

-- --------------------------------------------------------

--
-- Table structure for table `cs_user`
--

CREATE TABLE `cs_user` (
  `u_id` int(11) NOT NULL,
  `u_user` varchar(100) NOT NULL,
  `u_pass` varchar(100) NOT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_status` varchar(6) NOT NULL,
  `u_otp` mediumint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_user`
--

INSERT INTO `cs_user` (`u_id`, `u_user`, `u_pass`, `u_email`, `u_status`, `u_otp`) VALUES
(1, 'Admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin@gmail.com', 'admin', 0),
(2, 'Member', '81dc9bdb52d04dc20036dbd8313ed055', 'member@gmail.com', 'member', 0),
(3, 'Chayathon', 'd3786ec2413a8cd9413bfcb24be95a73', 'gusgus157903@gmail.com', 'member', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_address`
--
ALTER TABLE `cs_address`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `cs_ordered`
--
ALTER TABLE `cs_ordered`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `cs_product`
--
ALTER TABLE `cs_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `cs_type`
--
ALTER TABLE `cs_type`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `cs_user`
--
ALTER TABLE `cs_user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs_address`
--
ALTER TABLE `cs_address`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cs_ordered`
--
ALTER TABLE `cs_ordered`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cs_product`
--
ALTER TABLE `cs_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `cs_type`
--
ALTER TABLE `cs_type`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cs_user`
--
ALTER TABLE `cs_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
