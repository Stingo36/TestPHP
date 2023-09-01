-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2023 at 06:56 AM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `movie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `type`, `value`, `movie_id`) VALUES
(5, 'Language', 'English', 3),
(6, 'Genre', 'Science Fiction', 3),
(7, 'Language', 'hindi', 4),
(8, 'Genre', 'Action', 4),
(9, 'Language', 'English', 5),
(10, 'Genre', 'Science Fiction', 5),
(11, 'Language', 'Hindi', 6),
(12, 'Genre', 'Animation', 6),
(13, 'Language', 'English', 7),
(14, 'Genre', 'action', 7),
(15, 'Language', 'English', 8),
(16, 'Genre', 'Drama', 8),
(17, 'Language', 'English', 9),
(18, 'Genre', 'Drama', 9),
(19, 'Language', 'English', 10),
(20, 'Genre', 'Crime', 10),
(21, 'Language', 'English', 11),
(22, 'Genre', 'Drama', 11),
(23, 'Language', 'English', 12),
(24, 'Genre', 'Drama', 12),
(25, 'Language', 'french', 13),
(26, 'Genre', 'Action', 13),
(27, 'Language', 'hindi', 14),
(28, 'Genre', 'Drama', 14),
(29, 'Language', 'hindi', 15),
(30, 'Genre', 'Adventure', 15);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `movie_length_minutes` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `featured_image`, `movie_length_minutes`, `release_date`) VALUES
(3, 'Avatar', 'A movie set in the future on a distant planet', NULL, 162, '2009-12-18'),
(4, 'The Avengers', 'Superheroes team up to save the world', NULL, 143, '2012-05-04'),
(5, 'Inception', 'A thief enters people\'s dreams to steal their secrets', NULL, 148, '2010-07-16'),
(6, 'Toy Story', 'Toys come to life when humans aren\'t around', NULL, 81, '1995-11-22'),
(7, 'The Lion King', 'A young lion prince flees his kingdom', NULL, 88, '1994-06-24'),
(8, 'Finding Nemo', 'A clownfish searches for his missing son', NULL, 100, '2003-05-30'),
(9, 'Forrest Gump', 'A man experiences many historical events', NULL, 142, '1994-07-06'),
(10, 'The Matrix', 'A computer hacker discovers a dystopian reality', NULL, 136, '1999-03-31'),
(11, 'The Shawshank Redemption', 'Two imprisoned men bond over several years', NULL, 142, '1994-09-23'),
(12, 'Pulp Fiction', 'Various interconnected stories in the criminal underworld', NULL, 154, '1994-09-10'),
(13, 'The Dark Knight', 'Batman faces off against the Joker', NULL, 152, '2008-07-18'),
(14, 'Fight Club', 'An insomniac forms an underground fight club', NULL, 139, '1999-10-15'),
(15, 'The Lord of the Rings: The Fellowship of the Ring', 'A hobbit goes on a journey to destroy a ring', NULL, 178, '2001-12-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
