-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2019 at 10:37 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_increase` ()  MODIFIES SQL DATA
UPDATE products SET price = 0.1*price$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_product_details` (INOUT `pname` VARCHAR(30))  READS SQL DATA
SELECT id, name , price FROM

products where products.name=pname$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_totsale` (IN `name` VARCHAR(55))  READS SQL DATA
SELECT COUNT(id) FROM sales WHERE

id = (SELECT id FROM products WHERE products.name = name )$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(17, 13, 10, 2),
(19, 14, 1, 1),
(23, 14, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Recomended', 'Recomended'),
(2, 'Glasses', 'Glasses'),
(3, 'Sunglasses', 'Sunglasses');

-- --------------------------------------------------------

--
-- Table structure for table `checkout amount`
--

CREATE TABLE `checkout amount` (
  `users_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 13, 3, 2),
(17, 13, 1, 3),
(18, 10, 13, 3),
(19, 11, 2, 4),
(20, 12, 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` varchar(55) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `user_id`, `sales_id`) VALUES
('PAY-2c9875978234749823n749c723c74n9', 13, 78),
('PAY-92n7c984739c4394c723n47c29374', 11, 13),
('PAY-92n7c9847h12nyx91nyxe98c29374', 9, 16),
('PAY-c687236b9n2634297cn49369', 13, 100);

-- --------------------------------------------------------

--
-- Table structure for table `new_product`
--

CREATE TABLE `new_product` (
  `pid` int(11) DEFAULT NULL,
  `pname` varchar(55) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_product`
--

INSERT INTO `new_product` (`pid`, `pname`, `updated_date`, `price`) VALUES
(333, 'no', '2019-08-06', 999),
(20, 'thisisanexample', '2019-08-05', 877);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(1, 1, 'photo glass', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Recomended_1', 8.99, 'photography glasses.jpg', '2019-11-03', 6),
(2, 3, 'hex glasses', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Recomended_2', 7.990000000000001, 'sun geometric left.jpg', '2019-11-03', 5),
(3, 1, 'colourful square', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Recomended_3', 5.990000000000001, 'square left.jpg', '2019-11-03', 1),
(4, 2, 'thick uncle glasses', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_1', 3.9900000000000007, 'thick glasses.jpg', '2019-11-03', 1),
(5, 2, 'semi sunglasses', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_2', 3.39, 'low shade.jpg', '2019-10-08', 1),
(6, 2, 'rimless normal', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_3', 4.4999, 'rimless-left.jpg', '2019-10-09', 1),
(7, 2, 'rimless pink round', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_4', 6.190000000000001, 'round left.jpg', '2019-10-09', 3),
(8, 2, 'cateye ', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_5', 5.4999, 'cateye-left.jpg', '2019-10-09', 1),
(9, 2, 'browline', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Glasses_6', 5.9999, 'browline-left.jpg', '2019-10-08', 3),
(10, 3, 'aviator ', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Sunglasses_1', 5.9999, 'aviator left.jpg', '2019-10-19', 1),
(11, 2, 'sun cateye ', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Sunglasses_2', 4.899800000000001, 'sun cateye left.jpg', '2019-11-03', 3),
(12, 2, 'double support silver ', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.', 'Sunglasses_3', 7.499900000000001, 'sun aviator 2.jpg', '2019-11-03', 4),
(14, 2, 'reflective driving glasses', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Sunglasses_4', 8.999900000000002, 'sun rectangle left.jpg', '2019-11-03', 1),
(15, 2, 'sunny round sunglasses', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'Sunglasses_5', 9.999900000000002, 'sun round left.jpg', '2019-11-03', 2),
(16, 2, 'you gotta be crazy for choosing these mate', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 6.499900000000001, 'sun square left.jpg', '2019-11-03', 1),
(17, 3, 'g', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 0.49990000000000007, 'g.jpg', '2019-10-08', 16),
(18, 3, 'h', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 0.7999, 'h.jpg', '2019-10-08', 3),
(19, 3, 'i', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 0.9999000000000001, 'i.jpg', '2018-05-10', 1),
(20, 3, 'thisisanexample', 'iwufhi wcwnyiuvwyicwnvfyiuvnwevw', 'na', 87.7, 'x.jpg', '2019-08-05', 1),
(27, 1, 'k', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 15.990000000000002, 'k.jpg', '2018-07-09', 9),
(28, 4, 'l', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 8.290000000000001, 'l.jpg', '2019-10-08', 1),
(29, 4, 'm', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'na', 8.8999, 'm.jpg', '2019-10-08', 1),
(333, 3, 'no', 'Those fashion designers are just crazy; but aren\'t we all? Comfort is very important to me. I think people live better in big houses and in big clothes. I do not have one theme for each season, I just try to make beautiful clothes all year round. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I think it\'s the responsibility of a designer to try to break rules and barriers.\r\nIn order to be irreplaceable one must always be different. I am convinced that you don\'t need to spend a fortune to look like a million. Fashion moves so quickly that, unless you have a strong point of view, you can lose integrity. It is difficult to talk about fashion in the abstract, without a human body before my eyes, without drawings, without a choice of fabric - without a practical or visual reality. I was the first person to have a punk rock hairstyle.\r\nWomen are women, and hurray for that. You can\'t just buy things for the label - it\'s ridiculous. Men don\'t want another man to look at their woman because they don\'t know how to handle it. I love you if you love me. It\'s useless to send models out on the runway to cry.\r\nI didn\'t consider myself a fashion designer at all at the time of punk. I was just using fashion as a way to express my resistance and to be rebellious. I came from the country, and by the time I got to London, I considered myself to be very stupid. It was my ambition to understand the world I live in. First I made a dress because I was pregnant and I wanted to be the most beautiful pregnant woman. Then I made a sweater because I wanted to have one that wasn\'t like anyone else\'s. Fashion is a very stressful place to work because of the demands of doing the shows - no one expects a writer to produce two books a year on the dot - but it\'s also a very toxic place to work. My job is to bring out in people what they wouldn\'t dare do themselves. I truly believe that philanthropy and commerce can work together.', 'new', 9.990000000000002, 'photography glasses.jpg', '2019-08-06', 3);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `trg_cart_delete` AFTER DELETE ON `products` FOR EACH ROW delete from cart where cart.product_id= old.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_launch` AFTER INSERT ON `products` FOR EACH ROW INSERT INTO new_product
SET
pid=new.id,
pname=new.name,
price=new.price,
updated_date=new.date_view
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(5, 13, 'PAY-y2837c6n82976n798263n9c7826893', '2018-06-11'),
(6, 12, 'PAY-djkncjcnjcnujbrvjbvkj', '2019-11-23'),
(9, 13, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10'),
(11, 13, 'PAY-923N74R9823N7498237978', '2018-09-01'),
(12, 9, 'PAY-19849812734983498712E2139491N7', '2018-04-11'),
(13, 11, 'PAY-92n7c984739c4394c723n47c29374', '2019-06-05'),
(16, 9, 'PAY-92n7c9847h12nyx91nyxe98c29374', '2019-03-05'),
(78, 13, 'PAY-2c9875978234749823n749c723c74n9', '1999-06-08'),
(100, 13, 'PAY-c687236b9n2634297cn49369', '2019-07-01');

--
-- Triggers `sales`
--
DELIMITER $$
CREATE TRIGGER `trg_invoice` AFTER INSERT ON `sales` FOR EACH ROW INSERT INTO invoice
SET
id= new.pay_id,
user_id=new.user_id,

sales_id=new.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Rajiv', 'admin', '', '', '', 1, '2018-05-01'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'male2.png', 1, '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'female3.jpg', 1, '2018-07-09'),
(13, 'rajiv@r.com', '$2y$10$0Z6xaR9OGELW1OBEPLxYWuowAiyf8VsQPkmiwo5gKM/2q4SX2bEjG', 0, 'rajiv', 'r', 'nowhere  ', '', '', 1, '2019-10-08'),
(14, 'emailrajiv.r@gmail.com', '$2y$10$yX2Es4Dj6e1PEbJpJWmL4.bQsd3f/pWy9un4bkJX5wXOm.tiojsxC', 0, 'adith', 'r', 'i\'m everywhere ', '', '', 1, '2019-10-08'),
(15, 'riya@ch.com', '$2y$10$cNTeweN9fUv7NNKeoCyWFuiJI20ZS3fuaAQ1WxUAKnFehmPRZL3LG', 0, 'riya', 'ch', '', '', '', 1, '2019-10-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
