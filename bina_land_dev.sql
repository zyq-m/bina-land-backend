-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2024 at 03:36 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bina_land_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  `sqft` float NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `country` varchar(255) NOT NULL,
  `map` json DEFAULT NULL,
  `image` json DEFAULT NULL,
  `video` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `price`, `description`, `sqft`, `address`, `city`, `state`, `zip`, `country`, `map`, `image`, `video`) VALUES
('101061202741821456', 'Bungalow', '502508.00', NULL, 456, '611 S Main Street', 'Setia Alam', 'Selangor', '24303-8816', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"14470 Etha Drives East Gerda\"}', '[{\"src\": \"https://cdn.rnudah.com/images/plain/976b441dbedda1633897208a79bf57a7-2878312216341339567.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/5cac8083aaa8294033a55162259fe304-2878312217405803603.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/e48e75dce45901a95821f15138d1cd12-2878312216076439593.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/d327245259357c4c321363943698a730-2878312189924265043.jpg\"}]', NULL),
('101061202741821457', 'Bungalow', '680219.00', NULL, 582, '958 Bashirian Fall', 'Puchong', 'Selangor', '87072-9755', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"9848 Kihn Track Mobile\"}', '[{\"src\": \"https://cdn.rnudah.com/images/plain/45cf9a0d1faab0a8bd25d1a70bb967ea-2851497852545906833.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/3e7e5fbe5d60343cd83a3eb2fcf41ffe-2851497849693583505.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/3c01917e6c9fff9ced82392a1c52fa9d-2851497841640126609.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/45ac76ddd29beb25c3828c0f0a5558c8-2851497825432746129.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/ca16ad0f47e4ff47ef04b91e3d1c567b-2851497851354658961.jpg\"}]', NULL),
('101061202741821458', 'Bungalow', '297890.00', NULL, 457, '10979 Howard Road', 'Cheras', 'Selangor', '84111', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"2823 Pedro Crescent Port Maximillia\"}', '[{\"src\": \"https://my1-cdn.pgimgs.com/listing/33416907/UPHO.197132782.V800/Bayan-Lepas-Sungai-Tiram-Double-Storey-Bungalow-Penang-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/33416907/UPHO.168670471.V800/Bayan-Lepas-Sungai-Tiram-Double-Storey-Bungalow-Penang-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/33416907/UPHO.168670562.V800/Bayan-Lepas-Sungai-Tiram-Double-Storey-Bungalow-Penang-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/33416907/UPHO.168670590.V800/Bayan-Lepas-Sungai-Tiram-Double-Storey-Bungalow-Penang-Island-Malaysia.jpg\"}]', NULL),
('101061202741821459', 'Codominium', '77419.00', NULL, 153, '85253 Walter Cliff', 'Rawang', 'Selangor', '13926', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"200 6th Street North Gunner\"}', '[{\"src\": \"https://my1-cdn.pgimgs.com/listing/37726049/UPHO.210061245.V800/Aurora-Residence-Lake-Side-City-Puchong-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/37726049/UPHO.210061328.V800/Aurora-Residence-Lake-Side-City-Puchong-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/37726049/UPHO.210061359.V800/Aurora-Residence-Lake-Side-City-Puchong-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/37726049/UPHO.210061376.V800/Aurora-Residence-Lake-Side-City-Puchong-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/37726049/UPHO.210061376.V800/Aurora-Residence-Lake-Side-City-Puchong-Malaysia.jpg\"}]', NULL),
('101061202741821460', 'Bungalow', '95739.00', NULL, 660, '1610 Turner Station', 'Sungai Petani', 'Kedah', '11238', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"58270 Earl Square Altenwerthton\"}', '[{\"src\": \"https://my1-cdn.pgimgs.com/listing/41803405/UPHO.250885424.V800/The-Peak-Residences-Timor-Laut-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41803405/UPHO.250885424.V800/The-Peak-Residences-Timor-Laut-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41803405/UPHO.250885430.V800/The-Peak-Residences-Timor-Laut-Island-Malaysia.jpg\"}, {\"src\": \"hhttps://my1-cdn.pgimgs.com/listing/41803405/UPHO.250885428.V800/The-Peak-Residences-Timor-Laut-Island-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41803405/UPHO.250885432.V800/The-Peak-Residences-Timor-Laut-Island-Malaysia.jpg\"}]', NULL),
('101061202741821461', 'Duplex', '60169.00', NULL, 391, '40132 Stephany Flat', 'Muar', 'Johor', '39358', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"82293 Schaden Viaduct Folsom\"}', '[{\"src\": \"https://my1-cdn.pgimgs.com/listing/41684489/UPHO.249615028.V800/The-Nomad-SuCasa-KL-City-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41684489/UPHO.249615028.V800/The-Nomad-SuCasa-KL-City-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41684489/UPHO.249615022.V800/The-Nomad-SuCasa-KL-City-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41684489/UPHO.249615023.V800/The-Nomad-SuCasa-KL-City-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/41684489/UPHO.249615020.V800/The-Nomad-SuCasa-KL-City-Malaysia.jpg\"}]', NULL),
('101061202741821462', 'Bungalow', '4574309.00', NULL, 749, '4816 Wiley Skyway', 'Kemaman', 'Terengganu', '30449', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"343 Torp Green Port Rollinmouth\"}', '[{\"src\": \"https://my1-cdn.pgimgs.com/listing/42059847/UPHO.253655711.V800/Aster-Hill-Sri-Petaling-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/42059847/UPHO.253655688.V800/Aster-Hill-Sri-Petaling-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/42059847/UPHO.253655693.V800/Aster-Hill-Sri-Petaling-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/42059847/UPHO.253655697.V800/Aster-Hill-Sri-Petaling-Malaysia.jpg\"}, {\"src\": \"https://my1-cdn.pgimgs.com/listing/42059847/UPHO.253655690.V800/Aster-Hill-Sri-Petaling-Malaysia.jpg\"}]', NULL),
('101061202741821463', 'Codominium', '50662.00', NULL, 345, '92932 Effertz Trace', 'Dungun', 'Terengganu', '60156', 'Malaysia', '{\"embedId\": \"\", \"direction\": \"97892 Lucio Cape Karlboro\"}', '[{\"src\": \"https://cdn.rnudah.com/images/plain/8d933b8a89723996d72d2017b7072270-2880922095783064893.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/a556096c41df9def362977b2b60cb1c3-2880922096319192041.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/a556096c41df9def362977b2b60cb1c3-2880922096319192041.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/86f773730d567bb9ebbe8827b0383807-2880922093316683069.jpg\"}, {\"src\": \"https://cdn.rnudah.com/images/plain/c32728df2f36014a31f500b32f6f3d0b-2880922096056196141.jpg\"}]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `first_name`, `last_name`, `password`, `role_id`) VALUES
('haziq.musa02@gmail.com', 'Haziq', 'Musa', '$2b$12$ajrhoL8jyCi3b6SGOliPa.E.YBtWbvEsOD/zrCauEFdZGM63DwzPi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `property_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `property_id` (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
