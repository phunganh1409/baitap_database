/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `Food`;
CREATE TABLE `Food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foodName` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `typeId` int NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `Food_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `TypeFood` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `LikeRate`;
CREATE TABLE `LikeRate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `resId` int NOT NULL,
  `dateLike` datetime NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `resId` (`resId`),
  CONSTRAINT `LikeRate_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `LikeRate_ibfk_2` FOREIGN KEY (`resId`) REFERENCES `Restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `foodId` int NOT NULL,
  `amout` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arrSubId` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderId`),
  KEY `foodId` (`foodId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`foodId`) REFERENCES `Food` (`id`),
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Restaurant`;
CREATE TABLE `Restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resName` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ReteRestaurant`;
CREATE TABLE `ReteRestaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `resId` int NOT NULL,
  `amount` int NOT NULL,
  `dateRate` datetime NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `resId` (`resId`),
  CONSTRAINT `ReteRestaurant_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `ReteRestaurant_ibfk_2` FOREIGN KEY (`resId`) REFERENCES `Restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `Roles`;
CREATE TABLE `Roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `SubFood`;
CREATE TABLE `SubFood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subName` varchar(255) DEFAULT NULL,
  `subPrice` float NOT NULL,
  `foodId` int NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `SubFood_ibfk_1` FOREIGN KEY (`foodId`) REFERENCES `Food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `TypeFood`;
CREATE TABLE `TypeFood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Food` (`id`, `foodName`, `image`, `price`, `description`, `typeId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'Phở Bò', 'pho_bo.jpg', 5.99, 'Món phở truyền thống', 1, 0, 0, '2025-03-21 12:57:24', '2025-03-21 12:57:24', '2025-03-21 12:57:24');
INSERT INTO `Food` (`id`, `foodName`, `image`, `price`, `description`, `typeId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'Pizza Margherita', 'pizza.jpg', 8.5, 'Pizza Ý chính thống', 2, 0, 0, '2025-03-21 12:57:24', '2025-03-21 12:57:24', '2025-03-21 12:57:24');
INSERT INTO `Food` (`id`, `foodName`, `image`, `price`, `description`, `typeId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 'Sushi Cá Hồi', 'sushi.jpg', 12, 'Sushi Nhật tươi ngon', 3, 0, 0, '2025-03-21 12:57:24', '2025-03-21 12:57:24', '2025-03-21 12:57:24');

INSERT INTO `LikeRate` (`id`, `userId`, `resId`, `dateLike`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 1, 1, '2025-03-20 10:00:00', 0, 0, '2025-03-21 13:01:54', '2025-03-21 13:01:54', '2025-03-21 13:01:54');
INSERT INTO `LikeRate` (`id`, `userId`, `resId`, `dateLike`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 2, 1, '2025-03-21 12:00:00', 0, 0, '2025-03-21 13:01:54', '2025-03-21 13:01:54', '2025-03-21 13:01:54');
INSERT INTO `LikeRate` (`id`, `userId`, `resId`, `dateLike`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 1, 2, '2025-03-22 15:30:00', 0, 0, '2025-03-21 13:01:54', '2025-03-21 13:01:54', '2025-03-21 13:01:54');
INSERT INTO `LikeRate` (`id`, `userId`, `resId`, `dateLike`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 3, 3, '2025-03-23 16:45:00', 0, 0, '2025-03-21 13:01:54', '2025-03-21 13:01:54', '2025-03-21 13:01:54'),
(5, 1, 1, '2025-03-20 10:00:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(6, 2, 1, '2025-03-21 12:00:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(7, 1, 2, '2025-03-22 15:30:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(8, 2, 5, '2025-03-23 16:45:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(9, 3, 2, '2025-03-23 16:45:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(10, 3, 5, '2025-03-23 12:45:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(11, 4, 4, '2025-03-23 14:25:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(12, 4, 1, '2025-03-23 13:35:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(13, 3, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 13:08:07', '2025-03-21 13:08:07', '2025-03-21 13:08:07'),
(14, 1, 1, '2025-03-20 10:00:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(15, 2, 1, '2025-03-21 12:00:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(16, 1, 2, '2025-03-22 15:30:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(17, 2, 5, '2025-03-23 16:45:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(18, 3, 2, '2025-03-23 16:45:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(19, 3, 5, '2025-03-23 12:45:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(20, 4, 4, '2025-03-23 14:25:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(21, 4, 1, '2025-03-23 13:35:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(22, 5, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(23, 2, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(24, 3, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(25, 5, 2, '2025-03-23 15:15:00', 0, 0, '2025-03-21 13:43:19', '2025-03-21 13:43:19', '2025-03-21 13:43:19'),
(26, 2, 1, '2025-03-21 12:00:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(27, 2, 5, '2025-03-23 16:45:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(28, 3, 2, '2025-03-23 16:45:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(29, 3, 5, '2025-03-23 12:45:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(30, 4, 4, '2025-03-23 14:25:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(31, 4, 1, '2025-03-23 13:35:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(32, 5, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(33, 2, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(34, 3, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(35, 5, 2, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:55:46', '2025-03-21 14:55:46', '2025-03-21 14:55:46'),
(36, 1, 1, '2025-03-20 10:00:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(37, 2, 1, '2025-03-21 12:00:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(38, 1, 2, '2025-03-22 15:30:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(39, 2, 5, '2025-03-23 16:45:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(40, 3, 2, '2025-03-23 16:45:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(41, 3, 5, '2025-03-23 12:45:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(42, 4, 4, '2025-03-23 14:25:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(43, 4, 1, '2025-03-23 13:35:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(44, 5, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(45, 2, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(46, 3, 1, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30'),
(47, 5, 2, '2025-03-23 15:15:00', 0, 0, '2025-03-21 14:56:30', '2025-03-21 14:56:30', '2025-03-21 14:56:30');

INSERT INTO `Order` (`orderId`, `userId`, `foodId`, `amout`, `code`, `arrSubId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 1, 1, 2, 'ORD123', '1,3', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28');
INSERT INTO `Order` (`orderId`, `userId`, `foodId`, `amout`, `code`, `arrSubId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 2, 2, 1, 'ORD124', '2', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28');
INSERT INTO `Order` (`orderId`, `userId`, `foodId`, `amout`, `code`, `arrSubId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 3, 3, 3, 'ORD125', '1', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28');
INSERT INTO `Order` (`orderId`, `userId`, `foodId`, `amout`, `code`, `arrSubId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 3, 2, 1, 'ORD124', '3', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28'),
(5, 1, 2, 1, 'ORD124', '2', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28'),
(6, 2, 1, 1, 'ORD124', '2', 0, 0, '2025-03-21 14:15:28', '2025-03-21 14:15:28', '2025-03-21 14:15:28'),
(7, 1, 1, 2, 'ORD123', '1,3', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(8, 2, 2, 1, 'ORD124', '2', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(9, 3, 3, 3, 'ORD125', '1', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(10, 3, 2, 1, 'ORD121', '3', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(11, 1, 2, 1, 'ORD123', '2', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(12, 2, 1, 1, 'ORD122', '2', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02'),
(13, 3, 3, 3, 'ORD125', '1', 0, 0, '2025-03-21 14:21:02', '2025-03-21 14:21:02', '2025-03-21 14:21:02');

INSERT INTO `Restaurant` (`id`, `resName`, `image`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'Nha Hang 1', ' Hinh Anh 1', 'Dep', 0, 0, '2025-03-21 12:02:11', '2025-03-21 12:02:11', '2025-03-21 12:02:11');
INSERT INTO `Restaurant` (`id`, `resName`, `image`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'Nha Hang 2', ' Hinh Anh 2', 'Dep', 0, 0, '2025-03-21 12:02:11', '2025-03-21 12:02:11', '2025-03-21 12:02:11');
INSERT INTO `Restaurant` (`id`, `resName`, `image`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 'Nha Hang 3', ' Hinh Anh 3', 'Dep', 0, 0, '2025-03-21 12:02:11', '2025-03-21 12:02:11', '2025-03-21 12:02:11');
INSERT INTO `Restaurant` (`id`, `resName`, `image`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 'Nha Hang 4', ' Hinh Anh 4', 'Dep', 0, 0, '2025-03-21 12:02:11', '2025-03-21 12:02:11', '2025-03-21 12:02:11'),
(5, 'Nha Hang 5', ' Hinh Anh 5', 'Dep', 0, 0, '2025-03-21 12:02:11', '2025-03-21 12:02:11', '2025-03-21 12:02:11');

INSERT INTO `ReteRestaurant` (`id`, `userId`, `resId`, `amount`, `dateRate`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 2, 1, 4, '2025-03-20 18:30:00', 0, 0, '2025-03-21 13:04:45', '2025-03-21 13:04:45', '2025-03-21 13:04:45');
INSERT INTO `ReteRestaurant` (`id`, `userId`, `resId`, `amount`, `dateRate`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 1, 3, 3, '2025-03-20 19:30:00', 0, 0, '2025-03-21 13:04:45', '2025-03-21 13:04:45', '2025-03-21 13:04:45');
INSERT INTO `ReteRestaurant` (`id`, `userId`, `resId`, `amount`, `dateRate`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 3, 4, 5, '2025-03-20 20:30:00', 0, 0, '2025-03-21 13:04:45', '2025-03-21 13:04:45', '2025-03-21 13:04:45');
INSERT INTO `ReteRestaurant` (`id`, `userId`, `resId`, `amount`, `dateRate`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 4, 2, 3, '2025-03-20 22:30:00', 0, 0, '2025-03-21 13:04:45', '2025-03-21 13:04:45', '2025-03-21 13:04:45');

INSERT INTO `Roles` (`id`, `name`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'ROLE_ ADMIN', 'Quản trị hệ thống', 0, 0, '2025-03-21 12:09:51', '2025-03-21 12:09:51', '2025-03-21 12:09:51');
INSERT INTO `Roles` (`id`, `name`, `description`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'ROLE_ USER', 'Người dùng hệ thống', 0, 0, '2025-03-21 12:09:51', '2025-03-21 12:09:51', '2025-03-21 12:09:51');


INSERT INTO `SubFood` (`id`, `subName`, `subPrice`, `foodId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'Thêm trứng', 1, 1, 0, 0, '2025-03-21 12:58:28', '2025-03-21 12:58:28', '2025-03-21 12:58:28');
INSERT INTO `SubFood` (`id`, `subName`, `subPrice`, `foodId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'Thêm phô mai', 1.5, 2, 0, 0, '2025-03-21 12:58:28', '2025-03-21 12:58:28', '2025-03-21 12:58:28');
INSERT INTO `SubFood` (`id`, `subName`, `subPrice`, `foodId`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 'Thêm gừng ngâm', 0.5, 3, 0, 0, '2025-03-21 12:58:28', '2025-03-21 12:58:28', '2025-03-21 12:58:28');

INSERT INTO `TypeFood` (`id`, `typeName`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'Món Việt', 0, 0, '2025-03-21 12:57:15', '2025-03-21 12:57:15', '2025-03-21 12:57:15');
INSERT INTO `TypeFood` (`id`, `typeName`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'Món Âu', 0, 0, '2025-03-21 12:57:15', '2025-03-21 12:57:15', '2025-03-21 12:57:15');
INSERT INTO `TypeFood` (`id`, `typeName`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 'Món Nhật', 0, 0, '2025-03-21 12:57:15', '2025-03-21 12:57:15', '2025-03-21 12:57:15');
INSERT INTO `TypeFood` (`id`, `typeName`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 'Món Hàn', 0, 0, '2025-03-21 12:57:15', '2025-03-21 12:57:15', '2025-03-21 12:57:15'),
(5, 'Món Trung', 0, 0, '2025-03-21 12:57:15', '2025-03-21 12:57:15', '2025-03-21 12:57:15');

INSERT INTO `User` (`id`, `fullName`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(1, 'Khach A', 'khachA@gmail.com', '1234', 0, 0, '2025-03-21 11:58:20', '2025-03-21 11:58:20', '2025-03-21 11:58:20');
INSERT INTO `User` (`id`, `fullName`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(2, 'Khach B', 'khachB@gmail.com', '1234', 0, 0, '2025-03-21 11:58:20', '2025-03-21 11:58:20', '2025-03-21 11:58:20');
INSERT INTO `User` (`id`, `fullName`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(3, 'Khach C', 'khachC@gmail.com', '1234', 0, 0, '2025-03-21 11:58:20', '2025-03-21 11:58:20', '2025-03-21 11:58:20');
INSERT INTO `User` (`id`, `fullName`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createdAt`, `updateAt`) VALUES
(4, 'Khach D', 'khachD@gmail.com', '1234', 0, 0, '2025-03-21 11:58:20', '2025-03-21 11:58:20', '2025-03-21 11:58:20'),
(5, 'Khach E', 'khachE@gmail.com', '1234', 0, 0, '2025-03-21 11:58:20', '2025-03-21 11:58:20', '2025-03-21 11:58:20');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;