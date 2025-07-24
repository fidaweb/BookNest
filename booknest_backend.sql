-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2025 at 10:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booknest`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `session` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `session`) VALUES
(1, 'admin@gmail.com', '12Ov525I88ZAY', 'qwref456');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `author_id`, `image_url`, `content`, `created_on`, `title`) VALUES
(8, 6, '../assets/images/scifi.jpg', ' Reading more books isn\'t just about finishing books quickly; it\'s about\r\n        making reading a habit. The more you read, the more you learn. Here are\r\n        a few tips that can help you incorporate more books into your daily\r\n        routine. Start with books you enjoy, set a goal for daily reading, and\r\n        try to eliminate distractions like social media when reading. Also,\r\n        creating a dedicated reading time can help you maintain consistency.', '2025-07-13 23:16:57', 'aa'),
(9, 6, '../assets/images/scifi.jpg', ' Reading more books isn\'t just about finishing books quickly; it\'s about\r\n        making reading a habit. The more you read, the more you learn. Here are\r\n        a few tips that can help you incorporate more books into your daily\r\n        routine. Start with books you enjoy, set a goal for daily reading, and\r\n        try to eliminate distractions like social media when reading. Also,\r\n        creating a dedicated reading time can help you maintain consistency.', '2025-07-13 23:23:06', 'a1'),
(10, 6, '../assets/images/scifi.jpg', 'r (cond-mat new, recent, search) Disordered Systems and Neural Networks; Materials Science; Mesoscale and Nanoscale Physics; Other Condensed Matter; Quantum Gases; Soft Condensed Matter; Statistical Mechanics; Strongly Correlated Electrons; Superconductivity\r\nGeneral Relativity and Quantum Cosmology (gr-qc new, recent, search)\r\nHigh Energy Physics - Experiment (hep-ex new, recent, search)\r\nHigh Energy Physics - Lattice (hep-lat new, recent, search)\r\nHigh Energy Physics - Phenomenology (hep-ph new, recent, search)\r\nHigh Energy Physics - Theory (hep-th new, recent, search)\r\nMathematical Physics (math-ph new, recent, search)\r\nNonlinear Sciences (nlin new, recent, search)\r\nincludes: Adaptation and Self-Organizing Systems; Cellular Automata and Lattice Gases; Chaotic Dynamics; Exactly Solvable and Integrable Systems; Pattern Formation and Solitons\r\nNuclear Experiment (nucl-ex new, recent, search)\r\nNuclear Theory (nucl-th new, recent, search)\r\nPhysics (physics new, recent, search) ', '2025-07-13 23:23:11', 'a2'),
(11, 6, '../assets/images/scifi.jpg', 'aaaaaa ', '2025-07-13 23:23:17', 'a3'),
(12, 6, 'eeeee', 'eeee', '2025-07-14 13:53:26', 'ee');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` text DEFAULT NULL,
  `Book_Title` text DEFAULT NULL,
  `Book_Author` text DEFAULT NULL,
  `Year_Of_Publication` text DEFAULT NULL,
  `Publisher` text DEFAULT NULL,
  `Image_URL_S` text DEFAULT NULL,
  `Image_URL_M` text DEFAULT NULL,
  `Image_URL_L` text DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `Category` text DEFAULT NULL,
  `id` int(11) NOT NULL,
  `description` text NOT NULL DEFAULT 'This is good book, a very nice description.',
  `book_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `Book_Title`, `Book_Author`, `Year_Of_Publication`, `Publisher`, `Image_URL_S`, `Image_URL_M`, `Image_URL_L`, `PRICE`, `Category`, `id`, `description`, `book_url`) VALUES
('0195153448', 'Classical Mythology', 'Mark P. O. Morford', '2002', 'Oxford University Press', 'http://images.amazon.com/images/P/0195153448.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0195153448.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0195153448.01.LZZZZZZZ.jpg', 80, 'kids', 1, 'This is good book, a very nice description.', ''),
('0002005018', 'Clara Callan', 'Richard Bruce Wright', '2001', 'HarperFlamingo Canada', 'http://images.amazon.com/images/P/0002005018.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0002005018.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0002005018.01.LZZZZZZZ.jpg', 110, 'fiction', 2, 'This is good book, a very nice description.', ''),
('0060973129', 'Decision in Normandy', 'Carlo D\'Este', '1991', 'HarperPerennial', 'http://images.amazon.com/images/P/0060973129.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060973129.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060973129.01.LZZZZZZZ.jpg', 80, 'kids', 3, 'This is good book, a very nice description.', ''),
('0374157065', 'Flu: The Story of the Great Influenza Pandemic of 1918 and the Search for the Virus That Caused It', 'Gina Bari Kolata', '1999', 'Farrar Straus Giroux', 'http://images.amazon.com/images/P/0374157065.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0374157065.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0374157065.01.LZZZZZZZ.jpg', 110, 'kids', 4, 'This is good book, a very nice description.', ''),
('0393045218', 'The Mummies of Urumchi', 'E. J. W. Barber', '1999', 'W. W. Norton &amp; Company', 'http://images.amazon.com/images/P/0393045218.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0393045218.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0393045218.01.LZZZZZZZ.jpg', 30, 'fiction', 5, 'This is good book, a very nice description.', ''),
('0399135782', 'The Kitchen God\'s Wife', 'Amy Tan', '1991', 'Putnam Pub Group', 'http://images.amazon.com/images/P/0399135782.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0399135782.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0399135782.01.LZZZZZZZ.jpg', 30, 'fiction', 6, 'This is good book, a very nice description.', ''),
('0425176428', 'What If?: The World\'s Foremost Military Historians Imagine What Might Have Been', 'Robert Cowley', '2000', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/0425176428.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0425176428.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0425176428.01.LZZZZZZZ.jpg', 50, 'hist_pol', 7, 'This is good book, a very nice description.', ''),
('0671870432', 'PLEADING GUILTY', 'Scott Turow', '1993', 'Audioworks', 'http://images.amazon.com/images/P/0671870432.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671870432.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671870432.01.LZZZZZZZ.jpg', 30, 'education', 8, 'This is good book, a very nice description.', ''),
('0679425608', 'Under the Black Flag: The Romance and the Reality of Life Among the Pirates', 'David Cordingly', '1996', 'Random House', 'http://images.amazon.com/images/P/0679425608.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679425608.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679425608.01.LZZZZZZZ.jpg', 80, 'education', 9, 'This is good book, a very nice description.', ''),
('074322678X', 'Where You\'ll Find Me: And Other Stories', 'Ann Beattie', '2002', 'Scribner', 'http://images.amazon.com/images/P/074322678X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/074322678X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/074322678X.01.LZZZZZZZ.jpg', 100, 'hist_pol', 10, 'This is good book, a very nice description.', ''),
('0771074670', 'Nights Below Station Street', 'David Adams Richards', '1988', 'Emblem Editions', 'http://images.amazon.com/images/P/0771074670.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0771074670.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0771074670.01.LZZZZZZZ.jpg', 80, 'kids', 11, 'This is good book, a very nice description.', ''),
('080652121X', 'Hitler\'s Secret Bankers: The Myth of Swiss Neutrality During the Holocaust', 'Adam Lebor', '2000', 'Citadel Press', 'http://images.amazon.com/images/P/080652121X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/080652121X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/080652121X.01.LZZZZZZZ.jpg', 30, 'education', 12, 'This is good book, a very nice description.', ''),
('0887841740', 'The Middle Stories', 'Sheila Heti', '2004', 'House of Anansi Press', 'http://images.amazon.com/images/P/0887841740.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0887841740.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0887841740.01.LZZZZZZZ.jpg', 80, 'education', 13, 'This is good book, a very nice description.', ''),
('1552041778', 'Jane Doe', 'R. J. Kaiser', '1999', 'Mira Books', 'http://images.amazon.com/images/P/1552041778.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1552041778.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1552041778.01.LZZZZZZZ.jpg', 100, 'education', 14, 'This is good book, a very nice description.', ''),
('1558746218', 'A Second Chicken Soup for the Woman\'s Soul (Chicken Soup for the Soul Series)', 'Jack Canfield', '1998', 'Health Communications', 'http://images.amazon.com/images/P/1558746218.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1558746218.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1558746218.01.LZZZZZZZ.jpg', 110, 'kids', 15, 'This is good book, a very nice description.', ''),
('1567407781', 'The Witchfinder (Amos Walker Mystery Series)', 'Loren D. Estleman', '1998', 'Brilliance Audio - Trade', 'http://images.amazon.com/images/P/1567407781.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1567407781.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1567407781.01.LZZZZZZZ.jpg', 80, 'education', 16, 'This is good book, a very nice description.', ''),
('1575663937', 'More Cunning Than Man: A Social History of Rats and Man', 'Robert Hendrickson', '1999', 'Kensington Publishing Corp.', 'http://images.amazon.com/images/P/1575663937.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1575663937.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1575663937.01.LZZZZZZZ.jpg', 30, 'fiction', 17, 'This is good book, a very nice description.', ''),
('1881320189', 'Goodbye to the Buttermilk Sky', 'Julia Oliver', '1994', 'River City Pub', 'http://images.amazon.com/images/P/1881320189.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1881320189.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1881320189.01.LZZZZZZZ.jpg', 30, 'fiction', 18, 'This is good book, a very nice description.', ''),
('0440234743', 'The Testament', 'John Grisham', '1999', 'Dell', 'http://images.amazon.com/images/P/0440234743.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440234743.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440234743.01.LZZZZZZZ.jpg', 100, 'kids', 19, 'This is good book, a very nice description.', ''),
('0452264464', 'Beloved (Plume Contemporary Fiction)', 'Toni Morrison', '1994', 'Plume', 'http://images.amazon.com/images/P/0452264464.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0452264464.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0452264464.01.LZZZZZZZ.jpg', 110, 'fiction', 20, 'This is good book, a very nice description.', ''),
('0609804618', 'Our Dumb Century: The Onion Presents 100 Years of Headlines from America\'s Finest News Source', 'The Onion', '1999', 'Three Rivers Press', 'http://images.amazon.com/images/P/0609804618.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0609804618.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0609804618.01.LZZZZZZZ.jpg', 50, 'hist_pol', 21, 'This is good book, a very nice description.', ''),
('1841721522', 'New Vegetarian: Bold and Beautiful Recipes for Every Occasion', 'Celia Brooks Brown', '2001', 'Ryland Peters &amp; Small Ltd', 'http://images.amazon.com/images/P/1841721522.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1841721522.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1841721522.01.LZZZZZZZ.jpg', 50, 'kids', 22, 'This is good book, a very nice description.', ''),
('1879384493', 'If I\'d Known Then What I Know Now: Why Not Learn from the Mistakes of Others? : You Can\'t Afford to Make Them All Yourself', 'J. R. Parrish', '2003', 'Cypress House', 'http://images.amazon.com/images/P/1879384493.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1879384493.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1879384493.01.LZZZZZZZ.jpg', 110, 'education', 23, 'This is good book, a very nice description.', ''),
('0061076031', 'Mary-Kate &amp; Ashley Switching Goals (Mary-Kate and Ashley Starring in)', 'Mary-Kate &amp; Ashley Olsen', '2000', 'HarperEntertainment', 'http://images.amazon.com/images/P/0061076031.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061076031.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061076031.01.LZZZZZZZ.jpg', 50, 'kids', 24, 'This is good book, a very nice description.', ''),
('0439095026', 'Tell Me This Isn\'t Happening', 'Robynn Clairday', '1999', 'Scholastic', 'http://images.amazon.com/images/P/0439095026.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0439095026.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0439095026.01.LZZZZZZZ.jpg', 80, 'fiction', 25, 'This is good book, a very nice description.', ''),
('0689821166', 'Flood : Mississippi 1927', 'Kathleen Duey', '1998', 'Aladdin', 'http://images.amazon.com/images/P/0689821166.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0689821166.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0689821166.01.LZZZZZZZ.jpg', 100, 'kids', 26, 'This is good book, a very nice description.', ''),
('0971880107', 'Wild Animus', 'Rich Shapero', '2004', 'Too Far', 'http://images.amazon.com/images/P/0971880107.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0971880107.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0971880107.01.LZZZZZZZ.jpg', 100, 'education', 27, 'This is good book, a very nice description.', ''),
('0345402871', 'Airframe', 'Michael Crichton', '1997', 'Ballantine Books', 'http://images.amazon.com/images/P/0345402871.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345402871.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345402871.01.LZZZZZZZ.jpg', 80, 'hist_pol', 28, 'This is good book, a very nice description.', ''),
('0345417623', 'Timeline', 'MICHAEL CRICHTON', '2000', 'Ballantine Books', 'http://images.amazon.com/images/P/0345417623.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345417623.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345417623.01.LZZZZZZZ.jpg', 50, 'education', 29, 'This is good book, a very nice description.', ''),
('0684823802', 'OUT OF THE SILENT PLANET', 'C.S. Lewis', '1996', 'Scribner', 'http://images.amazon.com/images/P/0684823802.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0684823802.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0684823802.01.LZZZZZZZ.jpg', 110, 'education', 30, 'This is good book, a very nice description.', ''),
('0375759778', 'Prague : A Novel', 'ARTHUR PHILLIPS', '2003', 'Random House Trade Paperbacks', 'http://images.amazon.com/images/P/0375759778.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375759778.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375759778.01.LZZZZZZZ.jpg', 100, 'kids', 31, 'This is good book, a very nice description.', ''),
('0425163091', 'Chocolate Jesus', 'Stephan Jaramillo', '1998', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/0425163091.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0425163091.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0425163091.01.LZZZZZZZ.jpg', 110, 'hist_pol', 32, 'This is good book, a very nice description.', ''),
('3442353866', 'Der Fluch der Kaiserin. Ein Richter- Di- Roman.', 'Eleanor Cooney', '2001', 'Goldmann', 'http://images.amazon.com/images/P/3442353866.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3442353866.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3442353866.01.LZZZZZZZ.jpg', 80, 'fiction', 33, 'This is good book, a very nice description.', ''),
('3442410665', 'Sturmzeit. Roman.', 'Charlotte Link', '1991', 'Goldmann', 'http://images.amazon.com/images/P/3442410665.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3442410665.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3442410665.01.LZZZZZZZ.jpg', 50, 'fiction', 34, 'This is good book, a very nice description.', ''),
('3442446937', 'Tage der Unschuld.', 'Richard North Patterson', '2000', 'Goldmann', 'http://images.amazon.com/images/P/3442446937.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3442446937.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3442446937.01.LZZZZZZZ.jpg', 30, 'hist_pol', 35, 'This is good book, a very nice description.', ''),
('0375406328', 'Lying Awake', 'Mark Salzman', '2000', 'Alfred A. Knopf', 'http://images.amazon.com/images/P/0375406328.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375406328.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375406328.01.LZZZZZZZ.jpg', 80, 'fiction', 36, 'This is good book, a very nice description.', ''),
('0446310786', 'To Kill a Mockingbird', 'Harper Lee', '1988', 'Little Brown &amp; Company', 'http://images.amazon.com/images/P/0446310786.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446310786.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446310786.01.LZZZZZZZ.jpg', 50, 'kids', 37, 'This is good book, a very nice description.', ''),
('0449005615', 'Seabiscuit: An American Legend', 'LAURA HILLENBRAND', '2002', 'Ballantine Books', 'http://images.amazon.com/images/P/0449005615.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0449005615.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0449005615.01.LZZZZZZZ.jpg', 100, 'hist_pol', 38, 'This is good book, a very nice description.', ''),
('0060168013', 'Pigs in Heaven', 'Barbara Kingsolver', '1993', 'Harpercollins', 'http://images.amazon.com/images/P/0060168013.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060168013.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060168013.01.LZZZZZZZ.jpg', 80, 'hist_pol', 39, 'This is good book, a very nice description.', ''),
('038078243X', 'Miss Zukas and the Raven\'s Dance', 'Jo Dereske', '1996', 'Avon', 'http://images.amazon.com/images/P/038078243X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/038078243X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/038078243X.01.LZZZZZZZ.jpg', 50, 'fiction', 40, 'This is good book, a very nice description.', ''),
('055321215X', 'Pride and Prejudice', 'Jane Austen', '1983', 'Bantam', 'http://images.amazon.com/images/P/055321215X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/055321215X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/055321215X.01.LZZZZZZZ.jpg', 80, 'kids', 41, 'This is good book, a very nice description.', ''),
('067176537X', 'The Therapeutic Touch: How to Use Your Hands to Help or to Heal', 'Dolores Krieger', '1979', 'Fireside', 'http://images.amazon.com/images/P/067176537X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/067176537X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/067176537X.01.LZZZZZZZ.jpg', 110, 'education', 42, 'This is good book, a very nice description.', ''),
('0061099686', 'Downtown', 'Anne Rivers Siddons', '1995', 'HarperTorch', 'http://images.amazon.com/images/P/0061099686.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061099686.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061099686.01.LZZZZZZZ.jpg', 80, 'fiction', 43, 'This is good book, a very nice description.', ''),
('0553582909', 'Icebound', 'Dean R. Koontz', '2000', 'Bantam Books', 'http://images.amazon.com/images/P/0553582909.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553582909.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553582909.01.LZZZZZZZ.jpg', 110, 'hist_pol', 44, 'This is good book, a very nice description.', ''),
('0671888587', 'I\'ll Be Seeing You', 'Mary Higgins Clark', '1994', 'Pocket', 'http://images.amazon.com/images/P/0671888587.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671888587.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671888587.01.LZZZZZZZ.jpg', 80, 'fiction', 45, 'This is good book, a very nice description.', ''),
('0553582747', 'From the Corner of His Eye', 'Dean Koontz', '2001', 'Bantam Books', 'http://images.amazon.com/images/P/0553582747.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553582747.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553582747.01.LZZZZZZZ.jpg', 110, 'hist_pol', 46, 'This is good book, a very nice description.', ''),
('0425182908', 'Isle of Dogs', 'Patricia Cornwell', '2002', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/0425182908.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0425182908.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0425182908.01.LZZZZZZZ.jpg', 50, 'hist_pol', 47, 'This is good book, a very nice description.', ''),
('042518630X', 'Purity in Death', 'J.D. Robb', '2002', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/042518630X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/042518630X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/042518630X.01.LZZZZZZZ.jpg', 50, 'hist_pol', 48, 'This is good book, a very nice description.', ''),
('0440223571', 'This Year It Will Be Different: And Other Stories', 'Maeve Binchy', '1997', 'Dell', 'http://images.amazon.com/images/P/0440223571.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440223571.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440223571.01.LZZZZZZZ.jpg', 50, 'fiction', 49, 'This is good book, a very nice description.', ''),
('0812523873', 'Proxies', 'Laura J. Mixon', '1999', 'Tor Books', 'http://images.amazon.com/images/P/0812523873.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0812523873.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0812523873.01.LZZZZZZZ.jpg', 30, 'fiction', 50, 'This is good book, a very nice description.', ''),
('0842342702', 'Left Behind: A Novel of the Earth\'s Last Days (Left Behind #1)', 'Tim Lahaye', '2000', 'Tyndale House Publishers', 'http://images.amazon.com/images/P/0842342702.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0842342702.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0842342702.01.LZZZZZZZ.jpg', 80, 'kids', 51, 'This is good book, a very nice description.', ''),
('0440225701', 'The Street Lawyer', 'JOHN GRISHAM', '1999', 'Dell', 'http://images.amazon.com/images/P/0440225701.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440225701.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440225701.01.LZZZZZZZ.jpg', 100, 'fiction', 52, 'This is good book, a very nice description.', ''),
('0060914068', 'Love, Medicine and Miracles', 'M.D. Bernie S. Siegel', '1988', 'HarperCollins Publishers', 'http://images.amazon.com/images/P/0060914068.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060914068.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060914068.01.LZZZZZZZ.jpg', 100, 'kids', 53, 'This is good book, a very nice description.', ''),
('0156047624', 'All the King\'s Men', 'Robert Penn Warren', '1982', 'Harvest Books', 'http://images.amazon.com/images/P/0156047624.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0156047624.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0156047624.01.LZZZZZZZ.jpg', 80, 'education', 54, 'This is good book, a very nice description.', ''),
('0245542957', 'Pacific Northwest', 'Hans Johannes Hoefer', '1985', 'Chambers Harrap Publishers Ltd', 'http://images.amazon.com/images/P/0245542957.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0245542957.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0245542957.01.LZZZZZZZ.jpg', 100, 'hist_pol', 55, 'This is good book, a very nice description.', ''),
('0380715899', 'A Soldier of the Great War', 'Mark Helprin', '1992', 'Avon Books', 'http://images.amazon.com/images/P/0380715899.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380715899.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380715899.01.LZZZZZZZ.jpg', 80, 'education', 56, 'This is good book, a very nice description.', ''),
('0553280333', 'Getting Well Again', 'O. Carol Simonton Md', '1992', 'Bantam', 'http://images.amazon.com/images/P/0553280333.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553280333.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553280333.01.LZZZZZZZ.jpg', 80, 'kids', 57, 'This is good book, a very nice description.', ''),
('0961769947', 'Northwest Wines and Wineries', 'Chuck Hill', '1993', 'Speed Graphics', 'http://images.amazon.com/images/P/0961769947.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0961769947.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0961769947.01.LZZZZZZZ.jpg', 30, 'education', 58, 'This is good book, a very nice description.', ''),
('0964778319', 'An Atmosphere of Eternity: Stories of India', 'David Iglehart', '2002', 'Sunflower Press', 'http://images.amazon.com/images/P/0964778319.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0964778319.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0964778319.01.LZZZZZZZ.jpg', 50, 'hist_pol', 59, 'This is good book, a very nice description.', ''),
('0671623249', 'LONESOME DOVE', 'Larry McMurtry', '1986', 'Pocket', 'http://images.amazon.com/images/P/0671623249.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671623249.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671623249.01.LZZZZZZZ.jpg', 50, 'hist_pol', 60, 'This is good book, a very nice description.', ''),
('0679810307', 'Shabanu: Daughter of the Wind (Border Trilogy)', 'SUZANNE FISHER STAPLES', '1991', 'Laurel Leaf', 'http://images.amazon.com/images/P/0679810307.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679810307.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679810307.01.LZZZZZZZ.jpg', 110, 'hist_pol', 61, 'This is good book, a very nice description.', ''),
('0679865691', 'Haveli (Laurel Leaf Books)', 'SUZANNE FISHER STAPLES', '1995', 'Laurel Leaf', 'http://images.amazon.com/images/P/0679865691.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679865691.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679865691.01.LZZZZZZZ.jpg', 110, 'hist_pol', 62, 'This is good book, a very nice description.', ''),
('2070423204', 'Lieux dits', 'Michel Tournier', '2002', 'Gallimard', 'http://images.amazon.com/images/P/2070423204.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/2070423204.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/2070423204.01.LZZZZZZZ.jpg', 80, 'education', 63, 'This is good book, a very nice description.', ''),
('0345260317', 'The Dragons of Eden: Speculations on the Evolution of Human Intelligence', 'Carl Sagan', '1978', 'Ballantine Books', 'http://images.amazon.com/images/P/0345260317.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345260317.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345260317.01.LZZZZZZZ.jpg', 50, 'fiction', 64, 'This is good book, a very nice description.', ''),
('0394743741', 'The yawning heights', 'Aleksandr Zinoviev', '1980', 'Random House', 'http://images.amazon.com/images/P/0394743741.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0394743741.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0394743741.01.LZZZZZZZ.jpg', 30, 'hist_pol', 65, 'This is good book, a very nice description.', ''),
('042511774X', 'Breathing Lessons', 'Anne Tyler', '1994', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/042511774X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/042511774X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/042511774X.01.LZZZZZZZ.jpg', 30, 'education', 66, 'This is good book, a very nice description.', ''),
('0804106304', 'The Joy Luck Club', 'Amy Tan', '1994', 'Prentice Hall (K-12)', 'http://images.amazon.com/images/P/0804106304.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0804106304.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0804106304.01.LZZZZZZZ.jpg', 50, 'hist_pol', 67, 'This is good book, a very nice description.', ''),
('1853262404', 'Heart of Darkness (Wordsworth Collection)', 'Joseph Conrad', '1998', 'NTC/Contemporary Publishing Company', 'http://images.amazon.com/images/P/1853262404.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1853262404.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1853262404.01.LZZZZZZZ.jpg', 30, 'fiction', 68, 'This is good book, a very nice description.', ''),
('0312970242', 'The Angel Is Near', 'Deepak Chopra', '2000', 'St. Martin\'s Press', 'http://images.amazon.com/images/P/0312970242.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312970242.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312970242.01.LZZZZZZZ.jpg', 80, 'kids', 69, 'This is good book, a very nice description.', ''),
('1853260053', 'Tess of the D\'Urbervilles (Wordsworth Classics)', 'Thomas Hardy', '1997', 'NTC/Contemporary Publishing Company', 'http://images.amazon.com/images/P/1853260053.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1853260053.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1853260053.01.LZZZZZZZ.jpg', 110, 'education', 70, 'This is good book, a very nice description.', ''),
('1414035004', 'The Adventures of Drew and Ellie: The Magical Dress', 'Charles Noland', '2003', '1stBooks Library', 'http://images.amazon.com/images/P/1414035004.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1414035004.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1414035004.01.LZZZZZZZ.jpg', 100, 'hist_pol', 71, 'This is good book, a very nice description.', ''),
('0060938412', 'The Accidental Virgin', 'Valerie Frankel', '2003', 'Avon Trade', 'http://images.amazon.com/images/P/0060938412.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060938412.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060938412.01.LZZZZZZZ.jpg', 50, 'kids', 72, 'This is good book, a very nice description.', ''),
('0140067477', 'The Tao of Pooh', 'Benjamin Hoff', '1983', 'Penguin Books', 'http://images.amazon.com/images/P/0140067477.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0140067477.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0140067477.01.LZZZZZZZ.jpg', 80, 'education', 73, 'This is good book, a very nice description.', ''),
('0345465083', 'Seabiscuit', 'LAURA HILLENBRAND', '2003', 'Ballantine Books', 'http://images.amazon.com/images/P/0345465083.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345465083.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345465083.01.LZZZZZZZ.jpg', 100, 'hist_pol', 74, 'This is good book, a very nice description.', ''),
('0451625889', 'The Prince', 'Niccolo Machiavelli', '1952', 'Signet Book', 'http://images.amazon.com/images/P/0451625889.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451625889.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451625889.01.LZZZZZZZ.jpg', 80, 'education', 75, 'This is good book, a very nice description.', ''),
('1558531025', 'Life\'s Little Instruction Book (Life\'s Little Instruction Books (Paperback))', 'H. Jackson Brown', '1991', 'Thomas Nelson', 'http://images.amazon.com/images/P/1558531025.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1558531025.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1558531025.01.LZZZZZZZ.jpg', 30, 'education', 76, 'This is good book, a very nice description.', ''),
('0441783589', 'Starship Troopers', 'Robert A. Heinlein', '1987', 'Ace Books', 'http://images.amazon.com/images/P/0441783589.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0441783589.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0441783589.01.LZZZZZZZ.jpg', 50, 'kids', 77, 'This is good book, a very nice description.', ''),
('0394895894', 'The Ruby in the Smoke (Sally Lockhart Trilogy, Book 1)', 'PHILIP PULLMAN', '1988', 'Laurel Leaf', 'http://images.amazon.com/images/P/0394895894.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0394895894.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0394895894.01.LZZZZZZZ.jpg', 50, 'kids', 78, 'This is good book, a very nice description.', ''),
('1569871213', 'Black Beauty (Illustrated Classics)', 'Anna Sewell', '1995', 'Landoll', 'http://images.amazon.com/images/P/1569871213.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1569871213.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1569871213.01.LZZZZZZZ.jpg', 50, 'fiction', 79, 'This is good book, a very nice description.', ''),
('0375410538', 'Anil\'s Ghost', 'MICHAEL ONDAATJE', '2000', 'Knopf', 'http://images.amazon.com/images/P/0375410538.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375410538.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375410538.01.LZZZZZZZ.jpg', 100, 'fiction', 80, 'This is good book, a very nice description.', ''),
('0966986105', 'Prescription for Terror', 'Sandra Levy Ceren', '1999', 'Andrew Scott Publishers', 'http://images.amazon.com/images/P/0966986105.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0966986105.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0966986105.01.LZZZZZZZ.jpg', 110, 'kids', 81, 'This is good book, a very nice description.', ''),
('087113375X', 'Modern Manners: An Etiquette Book for Rude People', 'P.J. O\'Rourke', '1990', 'Atlantic Monthly Press', 'http://images.amazon.com/images/P/087113375X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/087113375X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/087113375X.01.LZZZZZZZ.jpg', 110, 'hist_pol', 82, 'This is good book, a very nice description.', ''),
('0340767936', 'Turning Thirty', 'Mike Gayle', '2000', 'Hodder &amp; Stoughton General Division', 'http://images.amazon.com/images/P/0340767936.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0340767936.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0340767936.01.LZZZZZZZ.jpg', 110, 'fiction', 83, 'This is good book, a very nice description.', ''),
('0743403843', 'Decipher', 'Stel Pavlou', '2002', 'Simon &amp; Schuster (Trade Division)', 'http://images.amazon.com/images/P/0743403843.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0743403843.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0743403843.01.LZZZZZZZ.jpg', 100, 'hist_pol', 84, 'This is good book, a very nice description.', ''),
('0060930365', 'My First Cousin Once Removed: Money, Madness, and the Family of Robert Lowell', 'Sarah Payne Stuart', '1999', 'Perennial', 'http://images.amazon.com/images/P/0060930365.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060930365.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060930365.01.LZZZZZZZ.jpg', 50, 'hist_pol', 85, 'This is good book, a very nice description.', ''),
('0060177586', 'Standing Firm: A Vice-Presidential Memoir', 'Dan Quayle', '1994', 'Harpercollins', 'http://images.amazon.com/images/P/0060177586.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060177586.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060177586.01.LZZZZZZZ.jpg', 110, 'hist_pol', 86, 'This is good book, a very nice description.', ''),
('0071416331', 'Team Bush : Leadership Lessons from the Bush White House', 'Donald F. Kettl', '2003', 'McGraw-Hill', 'http://images.amazon.com/images/P/0071416331.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0071416331.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0071416331.01.LZZZZZZZ.jpg', 80, 'education', 87, 'This is good book, a very nice description.', ''),
('0375509038', 'The Right Man : The Surprise Presidency of George W. Bush', 'DAVID FRUM', '2003', 'Random House', 'http://images.amazon.com/images/P/0375509038.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375509038.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375509038.01.LZZZZZZZ.jpg', 110, 'hist_pol', 88, 'This is good book, a very nice description.', ''),
('0553062042', 'Daybreakers Louis Lamour Collection', 'Louis Lamour', '1981', 'Bantam Doubleday Dell', 'http://images.amazon.com/images/P/0553062042.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553062042.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553062042.01.LZZZZZZZ.jpg', 80, 'education', 89, 'This is good book, a very nice description.', ''),
('0316769487', 'The Catcher in the Rye', 'J.D. Salinger', '1991', 'Little, Brown', 'http://images.amazon.com/images/P/0316769487.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316769487.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316769487.01.LZZZZZZZ.jpg', 110, 'fiction', 90, 'This is good book, a very nice description.', ''),
('8445071408', 'El Senor De Los Anillos: LA Comunidad Del Anillo (Lord of the Rings (Spanish))', 'J. R. R. Tolkien', '2001', 'Minotauro', 'http://images.amazon.com/images/P/8445071408.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8445071408.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8445071408.01.LZZZZZZZ.jpg', 30, 'kids', 91, 'This is good book, a very nice description.', ''),
('8445071769', 'El Senor De Los Anillos: Las DOS Torres (Lord of the Rings (Paperback))', 'J. R. R. Tolkien', '2001', 'Minotauro', 'http://images.amazon.com/images/P/8445071769.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8445071769.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8445071769.01.LZZZZZZZ.jpg', 50, 'hist_pol', 92, 'This is good book, a very nice description.', ''),
('8445071777', 'El Senor De Los Anillos: El Retorno Del Rey (Tolkien, J. R. R. Lord of the Rings. 3.)', 'J. R. R. Tolkien', '2001', 'Distribooks', 'http://images.amazon.com/images/P/8445071777.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8445071777.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8445071777.01.LZZZZZZZ.jpg', 30, 'hist_pol', 93, 'This is good book, a very nice description.', ''),
('0679429220', 'Midnight in the Garden of Good and Evil: A Savannah Story', 'John Berendt', '1994', 'Random House', 'http://images.amazon.com/images/P/0679429220.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679429220.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679429220.01.LZZZZZZZ.jpg', 110, 'hist_pol', 94, 'This is good book, a very nice description.', ''),
('0671867156', 'Pretend You Don\'t See Her', 'Mary Higgins Clark', '1998', 'Pocket', 'http://images.amazon.com/images/P/0671867156.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671867156.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671867156.01.LZZZZZZZ.jpg', 110, 'hist_pol', 95, 'This is good book, a very nice description.', ''),
('0312252617', 'Fast Women', 'Jennifer Crusie', '2001', 'St. Martin\'s Press', 'http://images.amazon.com/images/P/0312252617.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312252617.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312252617.01.LZZZZZZZ.jpg', 30, 'fiction', 96, 'This is good book, a very nice description.', ''),
('0312261594', 'Female Intelligence', 'Jane Heller', '2001', 'St. Martin\'s Press', 'http://images.amazon.com/images/P/0312261594.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312261594.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312261594.01.LZZZZZZZ.jpg', 100, 'hist_pol', 97, 'This is good book, a very nice description.', ''),
('0316748641', 'Pasquale\'s Nose: Idle Days in an Italian Town', 'Michael Rips', '2002', 'Back Bay Books', 'http://images.amazon.com/images/P/0316748641.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316748641.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316748641.01.LZZZZZZZ.jpg', 110, 'education', 98, 'This is good book, a very nice description.', ''),
('0316973742', 'The Gospel of Judas: A Novel', 'Simon Mawer', '2002', 'Back Bay Books', 'http://images.amazon.com/images/P/0316973742.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316973742.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316973742.01.LZZZZZZZ.jpg', 110, 'fiction', 99, 'This is good book, a very nice description.', ''),
('0385235941', 'Prize Stories, 1987: The O\'Henry Awards', 'William Abrahams', '1987', 'Doubleday Books', 'http://images.amazon.com/images/P/0385235941.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385235941.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385235941.01.LZZZZZZZ.jpg', 110, 'kids', 100, 'This is good book, a very nice description.', ''),
('0446677450', 'Rich Dad, Poor Dad: What the Rich Teach Their Kids About Money--That the Poor and Middle Class Do Not!', 'Robert T. Kiyosaki', '2000', 'Warner Books', 'http://images.amazon.com/images/P/0446677450.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446677450.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446677450.01.LZZZZZZZ.jpg', 30, 'education', 101, 'This is good book, a very nice description.', ''),
('0451166892', 'The Pillars of the Earth', 'Ken Follett', '1996', 'Signet Book', 'http://images.amazon.com/images/P/0451166892.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451166892.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451166892.01.LZZZZZZZ.jpg', 30, 'education', 102, 'This is good book, a very nice description.', ''),
('0553347594', 'McDonald\'s: Behind the Arches', 'John F. Love', '1995', 'Bantam', 'http://images.amazon.com/images/P/0553347594.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553347594.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553347594.01.LZZZZZZZ.jpg', 100, 'hist_pol', 103, 'This is good book, a very nice description.', ''),
('0671621009', 'Creating Wealth : Retire in Ten Years Using Allen\'s Seven Principles of Wealth!', 'Robert G. Allen', '1986', 'Fireside', 'http://images.amazon.com/images/P/0671621009.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671621009.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671621009.01.LZZZZZZZ.jpg', 50, 'kids', 104, 'This is good book, a very nice description.', ''),
('067976397X', 'Corelli\'s Mandolin : A Novel', 'LOUIS DE BERNIERES', '1995', 'Vintage', 'http://images.amazon.com/images/P/067976397X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/067976397X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/067976397X.01.LZZZZZZZ.jpg', 30, 'hist_pol', 105, 'This is good book, a very nice description.', ''),
('0684822733', 'Love, Miracles, and Animal Healing : A heartwarming look at the spiritual bond between animals and humans', 'Pam Proctor', '1996', 'Fireside', 'http://images.amazon.com/images/P/0684822733.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0684822733.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0684822733.01.LZZZZZZZ.jpg', 50, 'fiction', 106, 'This is good book, a very nice description.', ''),
('0786868716', 'The Five People You Meet in Heaven', 'Mitch Albom', '2003', 'Hyperion', 'http://images.amazon.com/images/P/0786868716.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0786868716.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0786868716.01.LZZZZZZZ.jpg', 30, 'hist_pol', 107, 'This is good book, a very nice description.', ''),
('8472238822', 'Tu Nombre Escrito En El Agua (La Sonrisa Vertical)', 'Irene Gonzalez Frei', '2002', 'Tusquets', 'http://images.amazon.com/images/P/8472238822.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8472238822.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8472238822.01.LZZZZZZZ.jpg', 50, 'kids', 108, 'This is good book, a very nice description.', ''),
('0671864769', 'Relics (Star Trek: The Next Generation)', 'Michael Jan Friedman', '1992', 'Star Trek', 'http://images.amazon.com/images/P/0671864769.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671864769.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671864769.01.LZZZZZZZ.jpg', 110, 'fiction', 109, 'This is good book, a very nice description.', ''),
('0671521519', 'Bless The Beasts And Children : Bless The Beasts And Children', 'Glendon Swarthout', '1995', 'Pocket', 'http://images.amazon.com/images/P/0671521519.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671521519.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671521519.01.LZZZZZZZ.jpg', 110, 'fiction', 110, 'This is good book, a very nice description.', ''),
('0440222303', 'The Touch of Your Shadow, the Whisper of Your Name (Babylon 5, Book 5)', 'Neal Barrett Jr.', '1996', 'Dell', 'http://images.amazon.com/images/P/0440222303.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440222303.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440222303.01.LZZZZZZZ.jpg', 30, 'education', 111, 'This is good book, a very nice description.', ''),
('0312953453', 'Blood Oath', 'David Morrell', '1994', 'St. Martin\'s Press', 'http://images.amazon.com/images/P/0312953453.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312953453.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312953453.01.LZZZZZZZ.jpg', 110, 'kids', 112, 'This is good book, a very nice description.', ''),
('0446608653', 'The Alibi', 'Sandra Brown', '2000', 'Warner Books', 'http://images.amazon.com/images/P/0446608653.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446608653.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446608653.01.LZZZZZZZ.jpg', 50, 'education', 113, 'This is good book, a very nice description.', ''),
('0446612545', 'The Beach House', 'James Patterson', '2003', 'Warner Books', 'http://images.amazon.com/images/P/0446612545.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446612545.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446612545.01.LZZZZZZZ.jpg', 80, 'hist_pol', 114, 'This is good book, a very nice description.', ''),
('0446612618', 'A Kiss Remembered', 'Sandra Brown', '2003', 'Warner Books', 'http://images.amazon.com/images/P/0446612618.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446612618.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446612618.01.LZZZZZZZ.jpg', 100, 'education', 115, 'This is good book, a very nice description.', ''),
('0451208080', 'The Short Forever', 'Stuart Woods', '2003', 'Signet Book', 'http://images.amazon.com/images/P/0451208080.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451208080.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451208080.01.LZZZZZZZ.jpg', 50, 'fiction', 116, 'This is good book, a very nice description.', ''),
('0553584383', 'Dead Aim', 'IRIS JOHANSEN', '2004', 'Bantam Books', 'http://images.amazon.com/images/P/0553584383.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553584383.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553584383.01.LZZZZZZZ.jpg', 100, 'fiction', 117, 'This is good book, a very nice description.', ''),
('0671027360', 'Angels &amp; Demons', 'Dan Brown', '2001', 'Pocket Star', 'http://images.amazon.com/images/P/0671027360.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671027360.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671027360.01.LZZZZZZZ.jpg', 110, 'kids', 118, 'This is good book, a very nice description.', ''),
('0812575954', 'The Deal', 'Joe Hutsko', '2000', 'Tor Books (Mm)', 'http://images.amazon.com/images/P/0812575954.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0812575954.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0812575954.01.LZZZZZZZ.jpg', 30, 'kids', 119, 'This is good book, a very nice description.', ''),
('0316735736', 'All He Ever Wanted: A Novel', 'Anita Shreve', '2004', 'Back Bay Books', 'http://images.amazon.com/images/P/0316735736.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316735736.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316735736.01.LZZZZZZZ.jpg', 100, 'fiction', 120, 'This is good book, a very nice description.', ''),
('0743439740', 'Every Breath You Take : A True Story of Obsession, Revenge, and Murder', 'Ann Rule', '2002', 'Pocket', 'http://images.amazon.com/images/P/0743439740.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0743439740.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0743439740.01.LZZZZZZZ.jpg', 80, 'kids', 121, 'This is good book, a very nice description.', ''),
('0345372700', 'If I Ever Get Back to Georgia, I\'m Gonna Nail My Feet to the Ground', 'LEWIS GRIZZARD', '1991', 'Ballantine Books', 'http://images.amazon.com/images/P/0345372700.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345372700.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345372700.01.LZZZZZZZ.jpg', 100, 'kids', 122, 'This is good book, a very nice description.', ''),
('0380619458', 'The Mosquito Coast', 'Paul Theroux', '1990', 'Harper Mass Market Paperbacks (Mm)', 'http://images.amazon.com/images/P/0380619458.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380619458.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380619458.01.LZZZZZZZ.jpg', 100, 'kids', 123, 'This is good book, a very nice description.', ''),
('0446325805', 'If Love Were Oil, I\'d Be About a Quart Low', 'Lewis Grizzard', '1994', 'Warner Books (Mm)', 'http://images.amazon.com/images/P/0446325805.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446325805.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446325805.01.LZZZZZZZ.jpg', 30, 'education', 124, 'This is good book, a very nice description.', ''),
('0451406923', 'Goodbye, My Little Ones: The True Story of a Murderous Mother and Five Innocent Victims', 'Charles Hickey', '1996', 'Onyx Books', 'http://images.amazon.com/images/P/0451406923.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451406923.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451406923.01.LZZZZZZZ.jpg', 110, 'education', 125, 'This is good book, a very nice description.', ''),
('0671042858', 'The Girl Who Loved Tom Gordon', 'Stephen King', '2000', 'Pocket', 'http://images.amazon.com/images/P/0671042858.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671042858.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671042858.01.LZZZZZZZ.jpg', 30, 'hist_pol', 126, 'This is good book, a very nice description.', ''),
('0743249992', 'Bringing Down the House: The Inside Story of Six M.I.T. Students Who Took Vegas for Millions', 'Ben Mezrich', '2003', 'Free Press', 'http://images.amazon.com/images/P/0743249992.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0743249992.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0743249992.01.LZZZZZZZ.jpg', 110, 'education', 127, 'This is good book, a very nice description.', ''),
('0840734530', 'The Oneprince (The Redaemian Chronicles, Book 1)', 'Bill Hand', '1992', 'Thomas Nelson Inc', 'http://images.amazon.com/images/P/0840734530.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0840734530.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0840734530.01.LZZZZZZZ.jpg', 80, 'education', 128, 'This is good book, a very nice description.', ''),
('0425184226', 'The Sum of All Fears', 'Tom Clancy', '2002', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/0425184226.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0425184226.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0425184226.01.LZZZZZZZ.jpg', 80, 'education', 129, 'This is good book, a very nice description.', ''),
('0375500766', 'Care Packages : Letters to Christopher Reeve from Strangers and Other Friends', 'DANA REEVE', '1999', 'Random House', 'http://images.amazon.com/images/P/0375500766.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375500766.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375500766.01.LZZZZZZZ.jpg', 80, 'fiction', 130, 'This is good book, a very nice description.', ''),
('9724119378', 'O Deus Das Pequenas Coisas', 'Roy', '1998', 'Edicoes Asa', 'http://images.amazon.com/images/P/9724119378.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/9724119378.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/9724119378.01.LZZZZZZZ.jpg', 80, 'fiction', 131, 'This is good book, a very nice description.', ''),
('0451205197', 'Lady in Green/Minor Indiscretions (Signet Regency Romance)', 'Barbara Metzger', '2002', 'Signet Book', 'http://images.amazon.com/images/P/0451205197.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451205197.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451205197.01.LZZZZZZZ.jpg', 100, 'education', 132, 'This is good book, a very nice description.', ''),
('0060929790', 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', '1998', 'Perennial', 'http://images.amazon.com/images/P/0060929790.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060929790.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060929790.01.LZZZZZZZ.jpg', 110, 'kids', 133, 'This is good book, a very nice description.', ''),
('0060976845', 'Little Altars Everywhere: A Novel', 'Rebecca Wells', '1996', 'Perennial', 'http://images.amazon.com/images/P/0060976845.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060976845.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060976845.01.LZZZZZZZ.jpg', 30, 'hist_pol', 134, 'This is good book, a very nice description.', ''),
('0061099325', 'Coyote Waits (Joe Leaphorn/Jim Chee Novels)', 'Tony Hillerman', '1992', 'HarperTorch', 'http://images.amazon.com/images/P/0061099325.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061099325.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061099325.01.LZZZZZZZ.jpg', 50, 'fiction', 135, 'This is good book, a very nice description.', ''),
('0671004573', 'Before I Say Good-Bye', 'Mary Higgins Clark', '2001', 'Pocket', 'http://images.amazon.com/images/P/0671004573.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671004573.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671004573.01.LZZZZZZZ.jpg', 80, 'kids', 136, 'This is good book, a very nice description.', ''),
('0446601640', 'Slow Waltz in Cedar Bend', 'Robert James Waller', '1994', 'Warner Books', 'http://images.amazon.com/images/P/0446601640.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446601640.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446601640.01.LZZZZZZZ.jpg', 110, 'hist_pol', 137, 'This is good book, a very nice description.', '');
INSERT INTO `books` (`ISBN`, `Book_Title`, `Book_Author`, `Year_Of_Publication`, `Publisher`, `Image_URL_S`, `Image_URL_M`, `Image_URL_L`, `PRICE`, `Category`, `id`, `description`, `book_url`) VALUES
('0330484516', 'Twenty Minute Retreats: Revive Your Spirits in Just Minutes a Day (A Pan Self-discovery Title)', 'Rachel Harris', '2001', 'Pan Macmillan', 'http://images.amazon.com/images/P/0330484516.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0330484516.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0330484516.01.LZZZZZZZ.jpg', 110, 'fiction', 138, 'This is good book, a very nice description.', ''),
('038572179X', 'Atonement : A Novel', 'IAN MCEWAN', '2003', 'Anchor', 'http://images.amazon.com/images/P/038572179X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/038572179X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/038572179X.01.LZZZZZZZ.jpg', 100, 'education', 139, 'This is good book, a very nice description.', ''),
('0393020371', 'Next: The Future Just Happened', 'Michael Lewis', '2001', 'W.W. Norton &amp; Company', 'http://images.amazon.com/images/P/0393020371.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0393020371.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0393020371.01.LZZZZZZZ.jpg', 100, 'kids', 140, 'This is good book, a very nice description.', ''),
('1900850303', 'The Angelic Darkness', 'Richard Zimler', '1999', 'Arcadia Books', 'http://images.amazon.com/images/P/1900850303.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1900850303.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1900850303.01.LZZZZZZZ.jpg', 110, 'hist_pol', 141, 'This is good book, a very nice description.', ''),
('1903019699', 'The Soulbane Stratagem', 'Norman Jetmundsen', '2000', 'John Hunt Publishing, Ltd.', 'http://images.amazon.com/images/P/1903019699.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1903019699.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1903019699.01.LZZZZZZZ.jpg', 80, 'fiction', 142, 'This is good book, a very nice description.', ''),
('0345425294', 'Gangster', 'Lorenzo Carcaterra', '2002', 'Fawcett Books', 'http://images.amazon.com/images/P/0345425294.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345425294.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345425294.01.LZZZZZZZ.jpg', 100, 'education', 143, 'This is good book, a very nice description.', ''),
('0451410319', 'Hush', 'Anne Frasier', '2002', 'Onyx Books', 'http://images.amazon.com/images/P/0451410319.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451410319.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451410319.01.LZZZZZZZ.jpg', 50, 'fiction', 144, 'This is good book, a very nice description.', ''),
('0553583468', 'Whisper of Evil (Hooper, Kay. Evil Trilogy.)', 'Kay Hooper', '2002', 'Bantam Books', 'http://images.amazon.com/images/P/0553583468.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553583468.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553583468.01.LZZZZZZZ.jpg', 30, 'kids', 145, 'This is good book, a very nice description.', ''),
('8420639133', 'Temor y Temblor', 'Soren Kierkegaard', '2001', 'Alianza', 'http://images.amazon.com/images/P/8420639133.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8420639133.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8420639133.01.LZZZZZZZ.jpg', 80, 'fiction', 146, 'This is good book, a very nice description.', ''),
('8476409419', 'Estudios sobre el amor', 'Jose Ortega Y Gaset', '2001', 'Downtown Book Center', 'http://images.amazon.com/images/P/8476409419.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/8476409419.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/8476409419.01.LZZZZZZZ.jpg', 50, 'fiction', 147, 'This is good book, a very nice description.', ''),
('0380778556', 'Rebecca', 'Daphne Du Maurier', '1994', 'Avon', 'http://images.amazon.com/images/P/0380778556.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380778556.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380778556.01.LZZZZZZZ.jpg', 30, 'hist_pol', 148, 'This is good book, a very nice description.', ''),
('0451525221', 'Scarlet Letter', 'Nathaniel Hawthorne', '1993', 'Signet Book', 'http://images.amazon.com/images/P/0451525221.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451525221.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451525221.01.LZZZZZZZ.jpg', 110, 'hist_pol', 149, 'This is good book, a very nice description.', ''),
('0002740230', 'Keep It Simple: And Get More Out of Life', 'Nick Page', '1999', 'Trafalgar Square', 'http://images.amazon.com/images/P/0002740230.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0002740230.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0002740230.01.LZZZZZZZ.jpg', 30, 'education', 150, 'This is good book, a very nice description.', ''),
('0385336772', 'Diary of a Mad Mom-To-Be', 'Laura Wolf', '2003', 'Delta', 'http://images.amazon.com/images/P/0385336772.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385336772.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385336772.01.LZZZZZZZ.jpg', 80, 'kids', 151, 'This is good book, a very nice description.', ''),
('0440949424', 'Locked in Time (Laurel Leaf Books)', 'LOIS DUNCAN', '1986', 'Laure Leaf', 'http://images.amazon.com/images/P/0440949424.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440949424.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440949424.01.LZZZZZZZ.jpg', 100, 'hist_pol', 152, 'This is good book, a very nice description.', ''),
('0505524996', 'Contact', 'Susan Grant', '2002', 'Love Spell', 'http://images.amazon.com/images/P/0505524996.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0505524996.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0505524996.01.LZZZZZZZ.jpg', 80, 'hist_pol', 153, 'This is good book, a very nice description.', ''),
('0140252800', 'The Brimstone Wedding', 'Barbara Vine', '1997', 'Penguin Books Ltd', 'http://images.amazon.com/images/P/0140252800.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0140252800.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0140252800.01.LZZZZZZZ.jpg', 80, 'education', 154, 'This is good book, a very nice description.', ''),
('0451452755', 'The Catswold Portal', 'Shirley Rousseau Murphy', '1993', 'Roc', 'http://images.amazon.com/images/P/0451452755.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451452755.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451452755.01.LZZZZZZZ.jpg', 80, 'kids', 155, 'This is good book, a very nice description.', ''),
('0812575482', 'Through Wolf\'s Eyes (Wolf)', 'Jane Lindskold', '2002', 'Tor Fantasy', 'http://images.amazon.com/images/P/0812575482.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0812575482.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0812575482.01.LZZZZZZZ.jpg', 110, 'hist_pol', 156, 'This is good book, a very nice description.', ''),
('044651747X', 'Puerto Vallarta Squeeze', 'Robert James Waller', '1995', 'Warner Books', 'http://images.amazon.com/images/P/044651747X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/044651747X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/044651747X.01.LZZZZZZZ.jpg', 80, 'hist_pol', 157, 'This is good book, a very nice description.', ''),
('0060801263', 'Tree Grows In Brooklyn', 'Betty Smith', '1988', 'Harpercollins Publisher', 'http://images.amazon.com/images/P/0060801263.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060801263.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060801263.01.LZZZZZZZ.jpg', 100, 'kids', 158, 'This is good book, a very nice description.', ''),
('0061030147', 'Cybill Disobedience: How I Survived Beauty Pageants, Elvis, Sex, Bruce Willis, Lies, Marriage, Motherhood, Hollywood, and the Irrepressible Urge to Say What I Think', 'Cybill Shepherd', '2001', 'Avon Books', 'http://images.amazon.com/images/P/0061030147.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061030147.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061030147.01.LZZZZZZZ.jpg', 110, 'education', 159, 'This is good book, a very nice description.', ''),
('0140250964', 'Snow Angels', 'Stewart O\'Nan', '1995', 'Penguin Books', 'http://images.amazon.com/images/P/0140250964.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0140250964.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0140250964.01.LZZZZZZZ.jpg', 110, 'education', 160, 'This is good book, a very nice description.', ''),
('0446527165', 'Wish You Well', 'David Baldacci', '2000', 'Warner Books', 'http://images.amazon.com/images/P/0446527165.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446527165.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446527165.01.LZZZZZZZ.jpg', 50, 'kids', 161, 'This is good book, a very nice description.', ''),
('0671461494', 'The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams', '1982', 'Pocket', 'http://images.amazon.com/images/P/0671461494.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671461494.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671461494.01.LZZZZZZZ.jpg', 50, 'hist_pol', 162, 'This is good book, a very nice description.', ''),
('0385337639', 'Crow Lake (Today Show Book Club #7)', 'Mary Lawson', '2003', 'Delta', 'http://images.amazon.com/images/P/0385337639.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385337639.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385337639.01.LZZZZZZZ.jpg', 80, 'kids', 163, 'This is good book, a very nice description.', ''),
('039575514X', 'My Antonia', 'Willa Cather', '1995', 'Mariner Books', 'http://images.amazon.com/images/P/039575514X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/039575514X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/039575514X.01.LZZZZZZZ.jpg', 110, 'education', 164, 'This is good book, a very nice description.', ''),
('0451206673', 'Pen Pals', 'Olivia Goldsmith', '2002', 'Signet Book', 'http://images.amazon.com/images/P/0451206673.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451206673.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451206673.01.LZZZZZZZ.jpg', 80, 'education', 165, 'This is good book, a very nice description.', ''),
('0330332775', 'Bridget Jones\'s Diary', 'Helen Fielding', '1997', 'Picador (UK)', 'http://images.amazon.com/images/P/0330332775.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0330332775.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0330332775.01.LZZZZZZZ.jpg', 100, 'education', 166, 'This is good book, a very nice description.', ''),
('0486284735', 'Pride and Prejudice (Dover Thrift Editions)', 'Jane Austen', '1995', 'Dover Publications', 'http://images.amazon.com/images/P/0486284735.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0486284735.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0486284735.01.LZZZZZZZ.jpg', 110, 'hist_pol', 167, 'This is good book, a very nice description.', ''),
('0671021745', 'EYE ON CRIME: HARDY BOYS #153', 'Franklin W. Dixon', '1998', 'Aladdin', 'http://images.amazon.com/images/P/0671021745.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671021745.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671021745.01.LZZZZZZZ.jpg', 50, 'fiction', 168, 'This is good book, a very nice description.', ''),
('0671047612', 'Skin And Bones', 'Franklin W. Dixon', '2000', 'Aladdin', 'http://images.amazon.com/images/P/0671047612.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671047612.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671047612.01.LZZZZZZZ.jpg', 80, 'fiction', 169, 'This is good book, a very nice description.', ''),
('0671504282', 'LAW OF THE JUNGLE (HARDY BOYS CASE FILE 105) : LAW OF THE JUNGLE (Hardy Boys, The)', 'Franklin W. Dixon', '1995', 'Simon Pulse', 'http://images.amazon.com/images/P/0671504282.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671504282.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671504282.01.LZZZZZZZ.jpg', 30, 'hist_pol', 170, 'This is good book, a very nice description.', ''),
('0399138684', 'The Cat Who Came to Breakfast (Cat Who... (Hardcover))', 'Lilian Jackson Braun', '1994', 'Putnam Pub Group', 'http://images.amazon.com/images/P/0399138684.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0399138684.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0399138684.01.LZZZZZZZ.jpg', 30, 'hist_pol', 171, 'This is good book, a very nice description.', ''),
('0785263292', 'If Singleness Is a Gift, What\'s the Return Policy?', 'Holly Virden', '2003', 'Nelson Books', 'http://images.amazon.com/images/P/0785263292.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0785263292.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0785263292.01.LZZZZZZZ.jpg', 50, 'fiction', 172, 'This is good book, a very nice description.', ''),
('0830714014', 'Always Daddy\'s Girl: Understanding Your Father\'s Impact on Who You Are', 'H. Norman Wright', '1989', 'Regal Books', 'http://images.amazon.com/images/P/0830714014.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0830714014.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0830714014.01.LZZZZZZZ.jpg', 30, 'kids', 173, 'This is good book, a very nice description.', ''),
('0345354931', 'Night Mare (Xanth Novels (Paperback))', 'Piers Anthony', '1990', 'Del Rey Books', 'http://images.amazon.com/images/P/0345354931.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345354931.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345354931.01.LZZZZZZZ.jpg', 100, 'kids', 174, 'This is good book, a very nice description.', ''),
('0553278223', 'The Martian Chronicles', 'RAY BRADBURY', '1984', 'Spectra', 'http://images.amazon.com/images/P/0553278223.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553278223.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553278223.01.LZZZZZZZ.jpg', 100, 'hist_pol', 175, 'This is good book, a very nice description.', ''),
('3150000335', 'Kabale Und Liebe', 'Schiller', '0', 'Philipp Reclam, Jun Verlag GmbH', 'http://images.amazon.com/images/P/3150000335.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3150000335.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3150000335.01.LZZZZZZZ.jpg', 80, 'education', 176, 'This is good book, a very nice description.', ''),
('3257208626', 'Fahrenheit 451', 'Ray Bradbury', '1994', 'Distribooks Inc', 'http://images.amazon.com/images/P/3257208626.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3257208626.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3257208626.01.LZZZZZZZ.jpg', 30, 'education', 177, 'This is good book, a very nice description.', ''),
('3257233051', 'Veronika Deschliesst Zu Sterben / Vernika Decides to Die', 'Paolo Coelho', '2002', 'Distribooks', 'http://images.amazon.com/images/P/3257233051.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3257233051.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3257233051.01.LZZZZZZZ.jpg', 110, 'hist_pol', 178, 'This is good book, a very nice description.', ''),
('342311360X', 'Die Liebe in Den Zelten', 'Gabriel Garcia Marquez', '0', 'Deutscher Taschenbuch Verlag (DTV)', 'http://images.amazon.com/images/P/342311360X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/342311360X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/342311360X.01.LZZZZZZZ.jpg', 30, 'kids', 179, 'This is good book, a very nice description.', ''),
('3423116714', 'Die Klone der Joanna May. Roman.', 'Fay Weldon', '1993', 'Dtv', 'http://images.amazon.com/images/P/3423116714.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3423116714.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3423116714.01.LZZZZZZZ.jpg', 110, 'fiction', 180, 'This is good book, a very nice description.', ''),
('3423241489', 'Ist mein Hintern wirklich so dick? Tagebuch einer empfindsamen Frau.', 'Arabella Weir', '1998', 'Dtv', 'http://images.amazon.com/images/P/3423241489.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3423241489.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3423241489.01.LZZZZZZZ.jpg', 50, 'hist_pol', 181, 'This is good book, a very nice description.', ''),
('3426605686', 'Haifischfrauen.', 'Kiana Davenport', '1996', 'Droemersche Verlagsanstalt Th. Knaur Nachf., GmbH &amp; Co.', 'http://images.amazon.com/images/P/3426605686.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3426605686.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3426605686.01.LZZZZZZZ.jpg', 30, 'education', 182, 'This is good book, a very nice description.', ''),
('3453212150', 'Die Cappuccino- Jahre. Aus dem Tagebuch des Adrian Mole.', 'Sue Townsend', '2002', 'Heyne', 'http://images.amazon.com/images/P/3453212150.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3453212150.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3453212150.01.LZZZZZZZ.jpg', 50, 'fiction', 183, 'This is good book, a very nice description.', ''),
('3462021095', 'Schwarzer Tee mit drei Stück Zucker', 'Renan Demirkan', '1991', 'Kiepenheuer &amp; Witsch', 'http://images.amazon.com/images/P/3462021095.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3462021095.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3462021095.01.LZZZZZZZ.jpg', 80, 'kids', 184, 'This is good book, a very nice description.', ''),
('3498020862', 'Die Korrekturen.', 'Jonathan Franzen', '2002', 'Rowohlt, Reinbek', 'http://images.amazon.com/images/P/3498020862.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3498020862.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3498020862.01.LZZZZZZZ.jpg', 80, 'hist_pol', 185, 'This is good book, a very nice description.', ''),
('3499151502', 'Hebt den Dachbalken hoch, Zimmerleute / Seymour wird vorgestellt.', 'Jerome D. Salinger', '1998', 'Rowohlt Tb.', 'http://images.amazon.com/images/P/3499151502.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/3499151502.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/3499151502.01.LZZZZZZZ.jpg', 80, 'education', 186, 'This is good book, a very nice description.', ''),
('0060977493', 'The God of Small Things', 'Arundhati Roy', '1998', 'Perennial', 'http://images.amazon.com/images/P/0060977493.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060977493.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060977493.01.LZZZZZZZ.jpg', 100, 'education', 187, 'This is good book, a very nice description.', ''),
('0312872682', 'The James Dean Affair: A Neil Gulliver &amp; Stevie Marriner Novel', 'Robert S. Levinson', '2000', 'St Martins Pr', 'http://images.amazon.com/images/P/0312872682.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312872682.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312872682.01.LZZZZZZZ.jpg', 50, 'fiction', 188, 'This is good book, a very nice description.', ''),
('0316602906', 'The Big Bad Wolf: A Novel', 'James Patterson', '2003', 'Little, Brown', 'http://images.amazon.com/images/P/0316602906.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316602906.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316602906.01.LZZZZZZZ.jpg', 80, 'kids', 189, 'This is good book, a very nice description.', ''),
('0316693006', 'Four Blind Mice', 'James Patterson', '2002', 'Little, Brown', 'http://images.amazon.com/images/P/0316693006.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316693006.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316693006.01.LZZZZZZZ.jpg', 50, 'fiction', 190, 'This is good book, a very nice description.', ''),
('0345311396', 'Private Screening', 'Richard North Patterson', '1994', 'Ballantine Books', 'http://images.amazon.com/images/P/0345311396.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345311396.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345311396.01.LZZZZZZZ.jpg', 100, 'hist_pol', 191, 'This is good book, a very nice description.', ''),
('0345378490', 'Congo', 'Michael Crichton', '1995', 'Ballantine Books', 'http://images.amazon.com/images/P/0345378490.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345378490.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345378490.01.LZZZZZZZ.jpg', 80, 'hist_pol', 192, 'This is good book, a very nice description.', ''),
('0345404793', 'Protect and Defend', 'Richard North Patterson', '2001', 'Ballantine Books', 'http://images.amazon.com/images/P/0345404793.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345404793.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345404793.01.LZZZZZZZ.jpg', 50, 'education', 193, 'This is good book, a very nice description.', ''),
('0345433173', 'The Tall Pine Polka', 'Lorna Landvik', '1999', 'Ballantine Books', 'http://images.amazon.com/images/P/0345433173.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345433173.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345433173.01.LZZZZZZZ.jpg', 50, 'hist_pol', 194, 'This is good book, a very nice description.', ''),
('0375400117', 'Memoirs of a Geisha', 'Arthur Golden', '1997', 'Alfred A. Knopf', 'http://images.amazon.com/images/P/0375400117.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375400117.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375400117.01.LZZZZZZZ.jpg', 100, 'kids', 195, 'This is good book, a very nice description.', ''),
('0375705856', 'Plainsong (Vintage Contemporaries)', 'KENT HARUF', '2000', 'Vintage', 'http://images.amazon.com/images/P/0375705856.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375705856.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375705856.01.LZZZZZZZ.jpg', 80, 'kids', 196, 'This is good book, a very nice description.', ''),
('0380717018', 'Body of Evidence (Kay Scarpetta Mysteries (Paperback))', 'Patricia D. Cornwell', '1992', 'Avon', 'http://images.amazon.com/images/P/0380717018.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380717018.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380717018.01.LZZZZZZZ.jpg', 30, 'fiction', 197, 'This is good book, a very nice description.', ''),
('0380718332', 'All That Remains (Kay Scarpetta Mysteries (Paperback))', 'Patricia D. Cornwell', '1993', 'Avon', 'http://images.amazon.com/images/P/0380718332.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380718332.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380718332.01.LZZZZZZZ.jpg', 110, 'fiction', 198, 'This is good book, a very nice description.', ''),
('0380754509', 'The Case of the Lost Look-Alike (An Avon Camelot Book)', 'Carol J. Farley', '1988', 'Avon Books', 'http://images.amazon.com/images/P/0380754509.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380754509.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380754509.01.LZZZZZZZ.jpg', 110, 'hist_pol', 199, 'This is good book, a very nice description.', ''),
('038076654X', 'Petals on the River', 'Kathleen E. Woodiwiss', '1997', 'Avon Trade', 'http://images.amazon.com/images/P/038076654X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/038076654X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/038076654X.01.LZZZZZZZ.jpg', 100, 'fiction', 200, 'This is good book, a very nice description.', ''),
('0380807866', 'The Elusive Flame', 'Kathleen E. Woodiwiss', '1999', 'Avon', 'http://images.amazon.com/images/P/0380807866.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380807866.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380807866.01.LZZZZZZZ.jpg', 50, 'kids', 201, 'This is good book, a very nice description.', ''),
('0385316895', 'Legacy of Silence', 'Belva Plain', '1998', 'Bantam Dell Pub Group', 'http://images.amazon.com/images/P/0385316895.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385316895.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385316895.01.LZZZZZZZ.jpg', 100, 'kids', 202, 'This is good book, a very nice description.', ''),
('0385497466', 'The Brethren', 'JOHN GRISHAM', '2000', 'Doubleday', 'http://images.amazon.com/images/P/0385497466.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385497466.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385497466.01.LZZZZZZZ.jpg', 50, 'hist_pol', 203, 'This is good book, a very nice description.', ''),
('0385508042', 'The King of Torts', 'John Grisham', '2003', 'Doubleday Books', 'http://images.amazon.com/images/P/0385508042.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385508042.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385508042.01.LZZZZZZZ.jpg', 50, 'hist_pol', 204, 'This is good book, a very nice description.', ''),
('0385509456', 'The Curious Incident of the Dog in the Night-Time : A Novel', 'MARK HADDON', '2003', 'Doubleday', 'http://images.amazon.com/images/P/0385509456.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385509456.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385509456.01.LZZZZZZZ.jpg', 100, 'kids', 205, 'This is good book, a very nice description.', ''),
('0385511612', 'Bleachers', 'John Grisham', '2003', 'Doubleday', 'http://images.amazon.com/images/P/0385511612.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385511612.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385511612.01.LZZZZZZZ.jpg', 100, 'education', 206, 'This is good book, a very nice description.', ''),
('0385730586', 'Sisterhood of the Traveling Pants', 'ANN BRASHARES', '2003', 'Delacorte Books for Young Readers', 'http://images.amazon.com/images/P/0385730586.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385730586.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385730586.01.LZZZZZZZ.jpg', 80, 'hist_pol', 207, 'This is good book, a very nice description.', ''),
('0425164403', 'Only Love (Magical Love)', 'Erich Segal', '1998', 'Berkley Publishing Group', 'http://images.amazon.com/images/P/0425164403.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0425164403.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0425164403.01.LZZZZZZZ.jpg', 80, 'hist_pol', 208, 'This is good book, a very nice description.', ''),
('0440234964', 'All or Nothing (Wheeler Large Print Books)', 'Elizabeth Adler', '2000', 'Island', 'http://images.amazon.com/images/P/0440234964.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440234964.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440234964.01.LZZZZZZZ.jpg', 80, 'hist_pol', 209, 'This is good book, a very nice description.', ''),
('0446605484', 'Roses Are Red (Alex Cross Novels)', 'James Patterson', '2001', 'Warner Vision', 'http://images.amazon.com/images/P/0446605484.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446605484.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446605484.01.LZZZZZZZ.jpg', 30, 'fiction', 210, 'This is good book, a very nice description.', ''),
('0446610399', 'The Rescue', 'Nicholas Sparks', '2001', 'Warner Books', 'http://images.amazon.com/images/P/0446610399.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0446610399.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0446610399.01.LZZZZZZZ.jpg', 50, 'fiction', 211, 'This is good book, a very nice description.', ''),
('0449006522', 'Manhattan Hunt Club', 'JOHN SAUL', '2002', 'Ballantine Books', 'http://images.amazon.com/images/P/0449006522.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0449006522.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0449006522.01.LZZZZZZZ.jpg', 110, 'hist_pol', 212, 'This is good book, a very nice description.', ''),
('0449911004', 'Patty Jane\'s House of Curl (Ballantine Reader\'s Circle)', 'LORNA LANDVIK', '1996', 'Ballantine Books', 'http://images.amazon.com/images/P/0449911004.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0449911004.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0449911004.01.LZZZZZZZ.jpg', 50, 'fiction', 213, 'This is good book, a very nice description.', ''),
('0451162072', 'Pet Sematary', 'Stephen King', '1994', 'Signet Book', 'http://images.amazon.com/images/P/0451162072.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451162072.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451162072.01.LZZZZZZZ.jpg', 80, 'education', 214, 'This is good book, a very nice description.', ''),
('0451186648', 'Silent Snow', 'Steve Thayer', '2000', 'Signet Book', 'http://images.amazon.com/images/P/0451186648.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451186648.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451186648.01.LZZZZZZZ.jpg', 50, 'fiction', 215, 'This is good book, a very nice description.', ''),
('0452282152', 'Girl with a Pearl Earring', 'Tracy Chevalier', '2001', 'Plume Books', 'http://images.amazon.com/images/P/0452282152.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0452282152.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0452282152.01.LZZZZZZZ.jpg', 110, 'hist_pol', 216, 'This is good book, a very nice description.', ''),
('051513290X', 'Summer of Storms', 'Judith Kelman', '2002', 'Jove Books', 'http://images.amazon.com/images/P/051513290X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/051513290X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/051513290X.01.LZZZZZZZ.jpg', 30, 'education', 217, 'This is good book, a very nice description.', ''),
('0553580388', 'The Patient', 'Michael Palmer', '2001', 'Bantam Books', 'http://images.amazon.com/images/P/0553580388.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553580388.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553580388.01.LZZZZZZZ.jpg', 50, 'hist_pol', 218, 'This is good book, a very nice description.', ''),
('0590598848', 'Demona\'s Revenge (Gargoyles, No. 2)', 'Francine Hughes', '1995', 'Scholastic', 'http://images.amazon.com/images/P/0590598848.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0590598848.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0590598848.01.LZZZZZZZ.jpg', 110, 'education', 219, 'This is good book, a very nice description.', ''),
('0590629719', 'Clifford\'s Sports Day', 'Norman Bridwell', '1996', 'Scholastic', 'http://images.amazon.com/images/P/0590629719.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0590629719.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0590629719.01.LZZZZZZZ.jpg', 110, 'education', 220, 'This is good book, a very nice description.', ''),
('0671023616', 'Postmortem (Kay Scarpetta Mysteries (Paperback))', 'Patricia Cornwell', '1998', 'Pocket', 'http://images.amazon.com/images/P/0671023616.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671023616.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671023616.01.LZZZZZZZ.jpg', 30, 'education', 221, 'This is good book, a very nice description.', ''),
('0671027387', 'Deception Point', 'Dan Brown', '2002', 'Pocket', 'http://images.amazon.com/images/P/0671027387.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671027387.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671027387.01.LZZZZZZZ.jpg', 50, 'education', 222, 'This is good book, a very nice description.', ''),
('0684848783', 'Tis : A Memoir', 'Frank McCourt', '1999', 'Scribner', 'http://images.amazon.com/images/P/0684848783.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0684848783.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0684848783.01.LZZZZZZZ.jpg', 50, 'education', 223, 'This is good book, a very nice description.', ''),
('0743486226', 'Angels &amp; Demons', 'Dan Brown', '2003', 'Atria', 'http://images.amazon.com/images/P/0743486226.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0743486226.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0743486226.01.LZZZZZZZ.jpg', 110, 'education', 224, 'This is good book, a very nice description.', ''),
('0786863986', 'A Monk Swimming', 'Malachy McCourt', '1998', 'Hyperion', 'http://images.amazon.com/images/P/0786863986.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0786863986.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0786863986.01.LZZZZZZZ.jpg', 80, 'education', 225, 'This is good book, a very nice description.', ''),
('0803251718', 'Crazy Horse', 'Mari Sandoz', '1961', 'University of Nebraska Press', 'http://images.amazon.com/images/P/0803251718.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0803251718.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0803251718.01.LZZZZZZZ.jpg', 80, 'education', 226, 'This is good book, a very nice description.', ''),
('0804117934', 'The Silent Cry (William Monk Novels (Paperback))', 'Anne Perry', '1998', 'Ivy Books', 'http://images.amazon.com/images/P/0804117934.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0804117934.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0804117934.01.LZZZZZZZ.jpg', 80, 'fiction', 227, 'This is good book, a very nice description.', ''),
('140003180X', 'The Kalahari Typing School for Men (No. 1 Ladies\' Detective Agency)', 'ALEXANDER MCCALL SMITH', '2004', 'Anchor', 'http://images.amazon.com/images/P/140003180X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/140003180X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/140003180X.01.LZZZZZZZ.jpg', 80, 'hist_pol', 228, 'This is good book, a very nice description.', ''),
('155874262X', 'Chicken Soup for the Soul (Chicken Soup for the Soul)', 'Jack Canfield', '1993', 'Health Communications', 'http://images.amazon.com/images/P/155874262X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/155874262X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/155874262X.01.LZZZZZZZ.jpg', 30, 'hist_pol', 229, 'This is good book, a very nice description.', ''),
('0060987103', 'Wicked: The Life and Times of the Wicked Witch of the West', 'Gregory Maguire', '1996', 'Regan Books', 'http://images.amazon.com/images/P/0060987103.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060987103.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060987103.01.LZZZZZZZ.jpg', 110, 'hist_pol', 230, 'This is good book, a very nice description.', ''),
('0151008116', 'Life of Pi', 'Yann Martel', '2002', 'Harcourt', 'http://images.amazon.com/images/P/0151008116.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0151008116.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0151008116.01.LZZZZZZZ.jpg', 100, 'education', 231, 'This is good book, a very nice description.', ''),
('0375704965', 'A Judgement in Stone', 'Ruth Rendell', '2000', 'Vintage Books USA', 'http://images.amazon.com/images/P/0375704965.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375704965.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375704965.01.LZZZZZZZ.jpg', 110, 'hist_pol', 232, 'This is good book, a very nice description.', ''),
('0525947647', 'Lies and the Lying Liars Who Tell Them: A Fair and Balanced Look at the Right', 'Al Franken', '2003', 'Dutton Books', 'http://images.amazon.com/images/P/0525947647.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0525947647.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0525947647.01.LZZZZZZZ.jpg', 50, 'hist_pol', 233, 'This is good book, a very nice description.', ''),
('0804111359', 'Secret History', 'DONNA TARTT', '1993', 'Ballantine Books', 'http://images.amazon.com/images/P/0804111359.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0804111359.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0804111359.01.LZZZZZZZ.jpg', 50, 'education', 234, 'This is good book, a very nice description.', ''),
('1558744150', 'Chicken Soup for the Woman\'s Soul (Chicken Soup for the Soul Series (Paper))', 'Jack Canfield', '1996', 'Health Communications', 'http://images.amazon.com/images/P/1558744150.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1558744150.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1558744150.01.LZZZZZZZ.jpg', 100, 'hist_pol', 235, 'This is good book, a very nice description.', ''),
('0435272683', 'Great Expectations (Heinemann Guided Readers)', 'John Milne', '1995', 'Delta Systems', 'http://images.amazon.com/images/P/0435272683.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0435272683.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0435272683.01.LZZZZZZZ.jpg', 80, 'hist_pol', 236, 'This is good book, a very nice description.', ''),
('0316782505', 'The Weight of Water', 'Anita Shreve', '2001', 'Little, Brown', 'http://images.amazon.com/images/P/0316782505.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0316782505.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0316782505.01.LZZZZZZZ.jpg', 50, 'hist_pol', 237, 'This is good book, a very nice description.', ''),
('006102063X', 'Moving Pictures (Discworld Novels (Paperback))', 'Terry Pratchett', '2002', 'HarperTorch', 'http://images.amazon.com/images/P/006102063X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/006102063X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/006102063X.01.LZZZZZZZ.jpg', 50, 'education', 238, 'This is good book, a very nice description.', ''),
('0060013117', 'Night Watch', 'Terry Pratchett', '2002', 'HarperCollins', 'http://images.amazon.com/images/P/0060013117.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060013117.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060013117.01.LZZZZZZZ.jpg', 110, 'education', 239, 'This is good book, a very nice description.', ''),
('0060199563', 'Thief of Time', 'Terry Pratchett', '2001', 'HarperCollins Publishers', 'http://images.amazon.com/images/P/0060199563.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060199563.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060199563.01.LZZZZZZZ.jpg', 100, 'education', 240, 'This is good book, a very nice description.', ''),
('006052779X', 'Charlotte\'s Web Book and Charm (Charming Classics)', 'E. B. White', '2003', 'HarperFestival', 'http://images.amazon.com/images/P/006052779X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/006052779X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/006052779X.01.LZZZZZZZ.jpg', 50, 'education', 241, 'This is good book, a very nice description.', ''),
('0060563079', 'Peter Pan: The Original Story (Peter Pan)', 'J. M. Barrie', '2003', 'HarperFestival', 'http://images.amazon.com/images/P/0060563079.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060563079.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060563079.01.LZZZZZZZ.jpg', 50, 'hist_pol', 242, 'This is good book, a very nice description.', ''),
('0060809027', 'My Friend Flicka', 'Mary O\'Hara', '1988', 'Perennial', 'http://images.amazon.com/images/P/0060809027.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060809027.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060809027.01.LZZZZZZZ.jpg', 30, 'education', 243, 'This is good book, a very nice description.', ''),
('0061040967', 'The Last Hero : A Discworld Fable (Discworld Novels (Hardcover))', 'Terry Pratchett', '2001', 'HarperCollins', 'http://images.amazon.com/images/P/0061040967.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061040967.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061040967.01.LZZZZZZZ.jpg', 30, 'kids', 244, 'This is good book, a very nice description.', ''),
('0061050474', 'Jingo: A Discworld Novel (Discworld Series/Terry Pratchett)', 'Terry Pratchett', '1998', 'HarperPrism', 'http://images.amazon.com/images/P/0061050474.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061050474.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061050474.01.LZZZZZZZ.jpg', 30, 'education', 245, 'This is good book, a very nice description.', ''),
('0061052515', 'Maskerade: A Novel of Discworld (Pratchett, Terry. Discworld Series (New York, N.Y.).)', 'Terry Pratchett', '1997', 'HarperPrism', 'http://images.amazon.com/images/P/0061052515.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061052515.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061052515.01.LZZZZZZZ.jpg', 100, 'education', 246, 'This is good book, a very nice description.', ''),
('0061052523', 'Interesting Times: A Novel of Discworld', 'Terry Pratchett', '1997', 'Harpercollins', 'http://images.amazon.com/images/P/0061052523.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0061052523.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0061052523.01.LZZZZZZZ.jpg', 100, 'kids', 247, 'This is good book, a very nice description.', ''),
('0064472264', 'On the Bright Side, I\'m Now the Girlfriend of a Sex God: Further Confessions of Georgia Nicolson', 'Louise Rennison', '2002', 'HarperTempest', 'http://images.amazon.com/images/P/0064472264.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0064472264.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0064472264.01.LZZZZZZZ.jpg', 80, 'hist_pol', 248, 'This is good book, a very nice description.', ''),
('0140620664', 'Mansfield Park (Penguin Popular Classics)', 'Jane Austen', '1994', 'Penguin Books Ltd', 'http://images.amazon.com/images/P/0140620664.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0140620664.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0140620664.01.LZZZZZZZ.jpg', 30, 'fiction', 249, 'This is good book, a very nice description.', ''),
('0312148267', 'The Wind in the Willows', 'Kenneth Grahame', '1996', 'St. Martin\'s Press', 'http://images.amazon.com/images/P/0312148267.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312148267.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312148267.01.LZZZZZZZ.jpg', 50, 'fiction', 250, 'This is good book, a very nice description.', ''),
('0312156960', 'The Winter King: A Novel of Arthur (The Warlord Chronicles: I)', 'Bernard Cornwell', '1997', 'St. Martin\'s Griffin', 'http://images.amazon.com/images/P/0312156960.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312156960.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312156960.01.LZZZZZZZ.jpg', 30, 'education', 251, 'This is good book, a very nice description.', ''),
('0312890044', 'Moonheart (Newford)', 'Charles de Lint', '1994', 'Orb Books', 'http://images.amazon.com/images/P/0312890044.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0312890044.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0312890044.01.LZZZZZZZ.jpg', 50, 'education', 252, 'This is good book, a very nice description.', ''),
('034543191X', 'The King of Elfland\'s Daughter (Del Rey Impact)', 'Edward John Moreton Drax Plunkett Dunsany', '1999', 'Del Rey Books', 'http://images.amazon.com/images/P/034543191X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/034543191X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/034543191X.01.LZZZZZZZ.jpg', 80, 'kids', 253, 'This is good book, a very nice description.', ''),
('0373836023', 'Powder and Patch', 'Georgette Heyer', '2004', 'Harlequin', 'http://images.amazon.com/images/P/0373836023.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0373836023.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0373836023.01.LZZZZZZZ.jpg', 110, 'education', 254, 'This is good book, a very nice description.', ''),
('0375751513', 'The Picture of Dorian Gray (Modern Library (Paperback))', 'OSCAR WILDE', '1998', 'Modern Library', 'http://images.amazon.com/images/P/0375751513.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375751513.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375751513.01.LZZZZZZZ.jpg', 110, 'kids', 255, 'This is good book, a very nice description.', ''),
('0375801677', 'The Iron Giant', 'Ted Hughes', '1999', 'Knopf Books for Young Readers', 'http://images.amazon.com/images/P/0375801677.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375801677.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375801677.01.LZZZZZZZ.jpg', 80, 'kids', 256, 'This is good book, a very nice description.', ''),
('0375814248', 'James and the Giant Peach', 'ROALD DAHL', '2002', 'Knopf Books for Young Readers', 'http://images.amazon.com/images/P/0375814248.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375814248.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375814248.01.LZZZZZZZ.jpg', 80, 'education', 257, 'This is good book, a very nice description.', ''),
('0375823352', 'The Amber Spyglass (His Dark Materials, Book 3)', 'PHILIP PULLMAN', '2002', 'Knopf Books for Young Readers', 'http://images.amazon.com/images/P/0375823352.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375823352.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375823352.01.LZZZZZZZ.jpg', 30, 'education', 258, 'This is good book, a very nice description.', ''),
('037582345X', 'The Golden Compass (His Dark Materials, Book 1)', 'PHILIP PULLMAN', '2002', 'Knopf Books for Young Readers', 'http://images.amazon.com/images/P/037582345X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/037582345X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/037582345X.01.LZZZZZZZ.jpg', 30, 'fiction', 259, 'This is good book, a very nice description.', ''),
('0375823468', 'The Subtle Knife (His Dark Materials, Book 2)', 'PHILIP PULLMAN', '2002', 'Knopf Books for Young Readers', 'http://images.amazon.com/images/P/0375823468.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375823468.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375823468.01.LZZZZZZZ.jpg', 100, 'fiction', 260, 'This is good book, a very nice description.', ''),
('0380730448', 'The Adrian Mole Diaries : The Secret Diary of Adrian Mole, Aged 13 3/4 : The Growing Pains of Adrian Mole', 'Sue Townsend', '1997', 'Perennial', 'http://images.amazon.com/images/P/0380730448.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380730448.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380730448.01.LZZZZZZZ.jpg', 80, 'education', 261, 'This is good book, a very nice description.', ''),
('0380973839', 'Martian Chronicles', 'Ray Bradbury', '1997', 'William Morrow', 'http://images.amazon.com/images/P/0380973839.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0380973839.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0380973839.01.LZZZZZZZ.jpg', 110, 'fiction', 262, 'This is good book, a very nice description.', ''),
('0385327773', 'The Great God Pan', 'Donna Jo Napoli', '2003', 'Wendy Lamb Books', 'http://images.amazon.com/images/P/0385327773.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0385327773.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0385327773.01.LZZZZZZZ.jpg', 100, 'hist_pol', 263, 'This is good book, a very nice description.', ''),
('0394586239', 'Possession: A Romance', 'A. S. Byatt', '1990', 'Random House Inc', 'http://images.amazon.com/images/P/0394586239.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0394586239.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0394586239.01.LZZZZZZZ.jpg', 30, 'education', 264, 'This is good book, a very nice description.', ''),
('0439510112', 'Born Confused', 'Tanuja Desai Hidier', '2003', 'Push', 'http://images.amazon.com/images/P/0439510112.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0439510112.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0439510112.01.LZZZZZZZ.jpg', 30, 'fiction', 265, 'This is good book, a very nice description.', ''),
('0440241413', 'Confessions of a Shopaholic', 'SOPHIE KINSELLA', '2003', 'Dell', 'http://images.amazon.com/images/P/0440241413.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440241413.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440241413.01.LZZZZZZZ.jpg', 50, 'fiction', 266, 'This is good book, a very nice description.', ''),
('0451409256', 'Making Minty Malone', 'Isabel Wolff', '2000', 'Onyx Books', 'http://images.amazon.com/images/P/0451409256.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451409256.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451409256.01.LZZZZZZZ.jpg', 110, 'kids', 267, 'This is good book, a very nice description.', ''),
('0451523415', 'Little Women (Signet Classic)', 'Louisa May Alcott', '1988', 'Signet Classics', 'http://images.amazon.com/images/P/0451523415.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451523415.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451523415.01.LZZZZZZZ.jpg', 50, 'kids', 268, 'This is good book, a very nice description.', ''),
('0451526279', 'Emma (Signet Classics (Paperback))', 'Jane Austen', '1996', 'Signet Classics', 'http://images.amazon.com/images/P/0451526279.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451526279.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451526279.01.LZZZZZZZ.jpg', 100, 'hist_pol', 269, 'This is good book, a very nice description.', ''),
('0451526341', 'Animal Farm', 'George Orwell', '2004', 'Signet', 'http://images.amazon.com/images/P/0451526341.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0451526341.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0451526341.01.LZZZZZZZ.jpg', 100, 'hist_pol', 270, 'This is good book, a very nice description.', ''),
('0486415864', 'Great Expectations (Dover Thrift Editions)', 'Charles Dickens', '2001', 'Dover Publications', 'http://images.amazon.com/images/P/0486415864.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0486415864.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0486415864.01.LZZZZZZZ.jpg', 80, 'kids', 271, 'This is good book, a very nice description.', ''),
('0553280589', 'Eva Luna', 'Isabel Allende', '1989', 'Bantam Books', 'http://images.amazon.com/images/P/0553280589.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553280589.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553280589.01.LZZZZZZZ.jpg', 50, 'fiction', 272, 'This is good book, a very nice description.', ''),
('0571197639', 'Poisonwood Bible Edition Uk', 'Barbara Kingsolver', '0', 'Faber Faber Inc', 'http://images.amazon.com/images/P/0571197639.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0571197639.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0571197639.01.LZZZZZZZ.jpg', 110, 'hist_pol', 273, 'This is good book, a very nice description.', ''),
('0670035262', 'The Green Man : Tales from the Mythic Forest', 'Ellen Datlow', '2002', 'Viking Juvenile', 'http://images.amazon.com/images/P/0670035262.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0670035262.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0670035262.01.LZZZZZZZ.jpg', 80, 'hist_pol', 274, 'This is good book, a very nice description.', ''),
('0679423079', 'Nicholas Nickleby (Everyman\'s Library)', 'Charles Dickens', '1993', 'Alfred A. Knopf', 'http://images.amazon.com/images/P/0679423079.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679423079.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679423079.01.LZZZZZZZ.jpg', 100, 'hist_pol', 275, 'This is good book, a very nice description.', '');
INSERT INTO `books` (`ISBN`, `Book_Title`, `Book_Author`, `Year_Of_Publication`, `Publisher`, `Image_URL_S`, `Image_URL_M`, `Image_URL_L`, `PRICE`, `Category`, `id`, `description`, `book_url`) VALUES
('0679751343', 'Angels &amp; Insects : Two Novellas', 'A.S. BYATT', '1994', 'Vintage', 'http://images.amazon.com/images/P/0679751343.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0679751343.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0679751343.01.LZZZZZZZ.jpg', 50, 'education', 276, 'This is good book, a very nice description.', ''),
('0684833395', 'Catch 22', 'Joseph Heller', '1996', 'Simon &amp; Schuster', 'http://images.amazon.com/images/P/0684833395.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0684833395.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0684833395.01.LZZZZZZZ.jpg', 110, 'fiction', 277, 'This is good book, a very nice description.', ''),
('0743245024', 'The Forsyte Saga : The Man of Property and In Chancery', 'John Galsworthy', '2002', 'Touchstone', 'http://images.amazon.com/images/P/0743245024.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0743245024.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0743245024.01.LZZZZZZZ.jpg', 80, 'education', 278, 'This is good book, a very nice description.', ''),
('0749748001', 'The Enchanted Wood', 'Enid Blyton', '2002', 'Egmont Childrens Books', 'http://images.amazon.com/images/P/0749748001.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0749748001.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0749748001.01.LZZZZZZZ.jpg', 80, 'education', 279, 'This is good book, a very nice description.', ''),
('0749748028', 'The Folk of the Faraway Tree', 'Enid Blyton', '2002', 'Egmont Childrens Books', 'http://images.amazon.com/images/P/0749748028.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0749748028.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0749748028.01.LZZZZZZZ.jpg', 30, 'fiction', 280, 'This is good book, a very nice description.', ''),
('0963094424', 'Angels and Visitations: A Miscellany', 'Neil Gaiman', '1993', 'Dreamhaven Books', 'http://images.amazon.com/images/P/0963094424.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0963094424.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0963094424.01.LZZZZZZZ.jpg', 30, 'education', 281, 'This is good book, a very nice description.', ''),
('1401201172', 'League of Extraordinary Gentlemen, Vol. 2 (Comic)', 'Alan Moore', '2003', 'DC Comics', 'http://images.amazon.com/images/P/1401201172.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1401201172.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1401201172.01.LZZZZZZZ.jpg', 110, 'education', 282, 'This is good book, a very nice description.', ''),
('1563892278', 'Preludes and Nocturnes (Sandman, Book 1)', 'Neil Gaiman', '1998', 'DC Comics', 'http://images.amazon.com/images/P/1563892278.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1563892278.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1563892278.01.LZZZZZZZ.jpg', 100, 'hist_pol', 283, 'This is good book, a very nice description.', ''),
('1563898586', 'The League of Extraordinary Gentlemen, Vol. 1', 'Alan Moore', '2002', 'DC Comics', 'http://images.amazon.com/images/P/1563898586.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1563898586.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1563898586.01.LZZZZZZZ.jpg', 80, 'fiction', 284, 'This is good book, a very nice description.', ''),
('156971620X', 'Harlequin Valentine', 'Neil Gaiman', '2002', 'Dark Horse Comics', 'http://images.amazon.com/images/P/156971620X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/156971620X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/156971620X.01.LZZZZZZZ.jpg', 100, 'education', 285, 'This is good book, a very nice description.', ''),
('1592571301', 'Alpha Teach Yourself American Sign Language in 24 Hours (Alpha Teach Yourself in 24 Hours)', 'Trudy Suggs', '2003', 'Alpha Books', 'http://images.amazon.com/images/P/1592571301.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1592571301.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1592571301.01.LZZZZZZZ.jpg', 110, 'education', 286, 'This is good book, a very nice description.', ''),
('0374270325', 'A Man in Full', 'Tom Wolfe', '1998', 'Farrar Straus &amp; Giroux', 'http://images.amazon.com/images/P/0374270325.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0374270325.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0374270325.01.LZZZZZZZ.jpg', 110, 'hist_pol', 287, 'This is good book, a very nice description.', ''),
('0375719180', 'The Miracle Life of Edgar Mint: A Novel', 'Brady Udall', '2002', 'Vintage Books USA', 'http://images.amazon.com/images/P/0375719180.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0375719180.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0375719180.01.LZZZZZZZ.jpg', 30, 'education', 288, 'This is good book, a very nice description.', ''),
('0440235502', 'October Sky: A Memoir', 'Homer Hickam', '1999', 'Dell', 'http://images.amazon.com/images/P/0440235502.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0440235502.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0440235502.01.LZZZZZZZ.jpg', 80, 'kids', 289, 'This is good book, a very nice description.', ''),
('044023722X', 'A Painted House', 'John Grisham', '2001', 'Dell Publishing Company', 'http://images.amazon.com/images/P/044023722X.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/044023722X.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/044023722X.01.LZZZZZZZ.jpg', 100, 'kids', 290, 'This is good book, a very nice description.', ''),
('1573225487', 'The Romance Reader', 'Pearl Abraham', '1996', 'Riverhead Books', 'http://images.amazon.com/images/P/1573225487.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1573225487.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1573225487.01.LZZZZZZZ.jpg', 80, 'fiction', 291, 'This is good book, a very nice description.', ''),
('1853260673', 'Far from the Madding Crowd (Wordsworth Classics)', 'Thomas Hardy', '1997', 'NTC/Contemporary Publishing Company', 'http://images.amazon.com/images/P/1853260673.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/1853260673.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/1853260673.01.LZZZZZZZ.jpg', 110, 'kids', 292, 'This is good book, a very nice description.', ''),
('0060977477', 'The Perfect Storm : A True Story of Men Against the Sea', 'Sebastian Junger', '1999', 'Perennial', 'http://images.amazon.com/images/P/0060977477.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0060977477.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0060977477.01.LZZZZZZZ.jpg', 50, 'kids', 293, 'This is good book, a very nice description.', ''),
('0345391691', 'The Battle for God', 'Karen Armstrong', '2001', 'Ballantine Books', 'http://images.amazon.com/images/P/0345391691.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0345391691.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0345391691.01.LZZZZZZZ.jpg', 80, 'kids', 294, 'This is good book, a very nice description.', ''),
('0520011171', 'Sappho: A New Translation', 'Mary Barnard', '1958', 'University of California Press', 'http://images.amazon.com/images/P/0520011171.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0520011171.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0520011171.01.LZZZZZZZ.jpg', 80, 'education', 295, 'This is good book, a very nice description.', ''),
('0553278746', 'The Postman (Bantam Classics)', 'David Brin', '1990', 'Spectra Books', 'http://images.amazon.com/images/P/0553278746.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0553278746.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0553278746.01.LZZZZZZZ.jpg', 80, 'fiction', 296, 'This is good book, a very nice description.', ''),
('0670856045', 'The Tortilla Curtain', 'T. Coraghessan Boyle', '1995', 'Viking Books', 'http://images.amazon.com/images/P/0670856045.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0670856045.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0670856045.01.LZZZZZZZ.jpg', 110, 'kids', 297, 'This is good book, a very nice description.', ''),
('0872200760', 'Symposium', 'Paul Woodruff', '1989', 'Hackett Pub Co Inc', 'http://images.amazon.com/images/P/0872200760.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0872200760.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0872200760.01.LZZZZZZZ.jpg', 30, 'fiction', 298, 'This is good book, a very nice description.', ''),
('0937858994', 'The What\'s Happening to My Body? Book for Boys: A Growing Up Guide for Parents and Sons', 'Lynda Madaras', '1987', 'W W Norton &amp; Co', 'http://images.amazon.com/images/P/0937858994.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0937858994.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0937858994.01.LZZZZZZZ.jpg', 30, 'hist_pol', 299, 'This is good book, a very nice description.', ''),
('0671649949', 'OBJECT AFFECTION', 'Stephen McCauley', '1988', 'Washington Square Press', 'http://images.amazon.com/images/P/0671649949.01.THUMBZZZ.jpg', 'http://images.amazon.com/images/P/0671649949.01.MZZZZZZZ.jpg', 'http://images.amazon.com/images/P/0671649949.01.LZZZZZZZ.jpg', 30, 'fiction', 300, 'This is good book, a very nice description.', ''),
('[value-1]', 'aaa', 'jjj', '[value-4]', '[value-5]', '[value-6]', '[value-7]', 'http://images.amazon.com/images/P/0195153448.01.LZZZZZZZ.jpg', 30, '', 302, 'very nice description', '');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chat_id`, `community_id`, `user_id`, `message`, `sent_at`) VALUES
(7, 1, 4, 'HELLO', '2025-07-12 20:34:27'),
(8, 1, 5, 'hello', '2025-07-12 20:39:29'),
(9, 1, 4, 'hello', '2025-07-12 21:23:03'),
(10, 1, 4, 'hello2', '2025-07-12 21:35:28'),
(11, 1, 4, 'aaaaa', '2025-07-13 12:05:33'),
(12, 1, 6, 'kkkk', '2025-07-14 09:04:00'),
(13, 1, 6, 'lll', '2025-07-14 09:09:31'),
(14, 1, 6, 'aaaa', '2025-07-14 09:10:15'),
(15, 1, 6, 'qqqqqqqq', '2025-07-14 13:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `community_id` int(250) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `name` text NOT NULL,
  `image_url` text NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`community_id`, `description`, `name`, `image_url`, `category`) VALUES
(1, 'Very Interesting Community', 'Com1', '../assets/images/scifi.jpg', 'sci-fi');

-- --------------------------------------------------------

--
-- Table structure for table `community_members`
--

CREATE TABLE `community_members` (
  `community_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `community_members`
--

INSERT INTO `community_members` (`community_id`, `user_id`) VALUES
(1, 4),
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `bought_at` datetime NOT NULL,
  `payment_id` text NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`user_id`, `book_id`, `bought_at`, `payment_id`, `price`) VALUES
(4, 1, '2025-07-12 18:08:48', 'd86c9795ff92680ae0d224c335fb962d', 80),
(4, 4, '2025-07-12 18:08:48', 'd86c9795ff92680ae0d224c335fb962d', 110),
(4, 5, '2025-07-12 18:08:48', 'd86c9795ff92680ae0d224c335fb962d', 30),
(5, 7, '2025-07-12 20:42:13', 'c7045418ac9251a3008ced3ee74d8b87', 50),
(5, 28, '2025-07-12 20:42:13', 'c7045418ac9251a3008ced3ee74d8b87', 80),
(4, 1, '2025-07-13 13:52:52', '2baa3d8debc14f2b1eb464f6e0eded22', 80),
(4, 4, '2025-07-13 13:52:52', '2baa3d8debc14f2b1eb464f6e0eded22', 110),
(4, 5, '2025-07-13 13:52:52', '2baa3d8debc14f2b1eb464f6e0eded22', 30),
(4, 50, '2025-07-13 13:52:52', '2baa3d8debc14f2b1eb464f6e0eded22', 30),
(4, 1, '2025-07-13 13:55:53', 'f75221cc58a6da83ea0a132f6c121e45', 80),
(4, 4, '2025-07-13 13:55:53', 'f75221cc58a6da83ea0a132f6c121e45', 110),
(4, 5, '2025-07-13 13:55:53', 'f75221cc58a6da83ea0a132f6c121e45', 30),
(4, 50, '2025-07-13 13:55:53', 'f75221cc58a6da83ea0a132f6c121e45', 30),
(4, 1, '2025-07-13 13:56:36', '51908ec2383865b0a77866c9bbdec98e', 80),
(4, 4, '2025-07-13 13:56:36', '51908ec2383865b0a77866c9bbdec98e', 110),
(4, 5, '2025-07-13 13:56:36', '51908ec2383865b0a77866c9bbdec98e', 30),
(4, 50, '2025-07-13 13:56:36', '51908ec2383865b0a77866c9bbdec98e', 30),
(6, 1, '2025-07-14 07:33:46', '5ac2a0df768a763afdb262bbf995b6a9', 80),
(6, 4, '2025-07-14 07:33:46', '5ac2a0df768a763afdb262bbf995b6a9', 110),
(6, 5, '2025-07-14 07:33:46', '5ac2a0df768a763afdb262bbf995b6a9', 30),
(6, 50, '2025-07-14 07:33:46', '5ac2a0df768a763afdb262bbf995b6a9', 30),
(6, 1, '2025-07-14 13:44:40', '963ac0c5d1dc31287cec7ec8cfa88ceb', 80),
(6, 5, '2025-07-14 13:44:40', '963ac0c5d1dc31287cec7ec8cfa88ceb', 30),
(6, 50, '2025-07-14 13:44:40', '963ac0c5d1dc31287cec7ec8cfa88ceb', 30),
(6, 1, '2025-07-14 13:44:40', '963ac0c5d1dc31287cec7ec8cfa88ceb', 80),
(6, 14, '2025-07-14 13:44:40', '963ac0c5d1dc31287cec7ec8cfa88ceb', 100);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionid` varchar(128) DEFAULT NULL,
  `user_id` int(250) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessionid`, `user_id`, `created_at`, `expires_at`) VALUES
('8f1cd9c13bf55bfe20e660dcc5b66fc5', 4, '2025-07-11 14:05:43', '2025-07-14 14:05:43'),
('c7f541031e4014c662b2761a562ae4ac', 4, '2025-07-11 14:10:28', '2025-07-14 14:10:28'),
('97250d76c25af600cd05170f03d8b61d', 4, '2025-07-11 14:11:57', '2025-07-14 14:11:57'),
('b47c908fb61ea586c1fd6717a4264e08', 4, '2025-07-11 14:13:23', '2025-07-14 14:13:23'),
('2b4ff388c9f27233257bcf7be6586e6f', 4, '2025-07-11 14:14:07', '2025-07-14 14:14:07'),
('750a025b3a219e1bcc34068aa914c487', 4, '2025-07-11 14:28:47', '2025-07-14 14:28:47'),
('1f511caa22dba5fc276cb89cc940c240', 4, '2025-07-11 14:29:49', '2025-07-14 14:29:49'),
('0da43bb54d99c9614bc96d8a0a1df8f0', 4, '2025-07-11 14:33:42', '2025-07-14 14:33:42'),
('0f047d178b6e1414d714586fd7a0f30a', 4, '2025-07-11 14:37:05', '2025-07-14 14:37:05'),
('b363417b9f9f556aa768521f9984a7fe', 4, '2025-07-11 14:38:43', '2025-07-14 14:38:43'),
('35ff9f46b3300f8754db1a5c6fecc39b', 5, '2025-07-12 20:38:02', '2025-07-15 20:38:02'),
('8c3d93f842ec5cbdd913a6750d2f4d53', 5, '2025-07-12 20:38:17', '2025-07-15 20:38:17'),
('qwref456', 6, '2025-07-12 23:14:27', '2025-07-15 23:14:27'),
('qwref456', 6, '2025-07-12 23:16:05', '2025-07-15 23:16:05'),
('qwref456', 6, '2025-07-12 23:31:17', '2025-07-15 23:31:17'),
('772ca21032e01bfedd7a82b9548b4f91', 4, '2025-07-13 00:19:35', '2025-07-16 00:19:35'),
('54128a458b1d1186c3696d7faeaa60ed', 4, '2025-07-13 10:32:24', '2025-07-16 10:32:24'),
('175e8345607d4821d7f4f7a6dfdb5b59', 4, '2025-07-13 10:50:49', '2025-07-16 10:50:49'),
('e87e0972886a82f203828a213aaa85f4', 4, '2025-07-13 11:22:33', '2025-07-16 11:22:33'),
('194c7b3aa95a1318ca98c1ff9730ab8e', 4, '2025-07-13 11:28:29', '2025-07-16 11:28:29'),
('4be5d95c99d38f436400f1e3604c5e9a', 4, '2025-07-13 11:54:44', '2025-07-16 11:54:44'),
('e754cec05894c1e3295e4d757e8fea6d', 4, '2025-07-13 13:27:30', '2025-07-16 13:27:30'),
('a21eba16b83800d85d485df92c956fa1', 4, '2025-07-13 13:46:32', '2025-07-16 13:46:32'),
('7560a9b7d4f2b788afda011d7fed456c', 4, '2025-07-13 18:41:25', '2025-07-16 18:41:25'),
('qwref456', 6, '2025-07-13 20:29:24', '2025-07-16 20:29:24'),
('qwref456', 6, '2025-07-14 00:22:23', '2025-07-17 00:22:23'),
('qwref456', 6, '2025-07-14 08:16:26', '2025-07-17 08:16:26'),
('qwref456', 6, '2025-07-14 08:23:21', '2025-07-17 08:23:21'),
('qwref456', 6, '2025-07-14 08:48:35', '2025-07-17 08:48:35'),
('qwref456', 6, '2025-07-14 08:49:48', '2025-07-17 08:49:48'),
('qwref456', 6, '2025-07-14 08:53:03', '2025-07-17 08:53:03'),
('qwref456', 6, '2025-07-14 08:54:08', '2025-07-17 08:54:08'),
('qwref456', 6, '2025-07-14 08:55:58', '2025-07-17 08:55:58'),
('4be14942cf0176531a812181aec1e6ab', 4, '2025-07-14 10:55:11', '2025-07-17 10:55:11'),
('504a8eaf2408f8d71b2903c0c15b5443', 4, '2025-07-14 10:57:21', '2025-07-17 10:57:21'),
('qwref456', 6, '2025-07-14 10:58:03', '2025-07-17 10:58:03'),
('qwref456', 6, '2025-07-14 13:25:00', '2025-07-17 13:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(250) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `Phone`) VALUES
(4, 'Fida Ullah', 'fida@gmail.com', '12/BIoCnd9NLE', '01712345678'),
(5, 'john', 'fida2@gmail.com', '126VuLEKiqvY.', '01712345678'),
(6, 'admin', 'admin@gmail.com', '12Ov525I88ZAY', '01712345678'),
(9, 'newone', 'new1@gmail.com', '12e9bVxJGgy/o', '01712345678'),
(17, 'newone', 'new2@gmail.com', '12e9bVxJGgy/o', '01712345678'),
(19, 'newthree', 'new3@gmail.com', '12a1IxiwEeUh.', '01712345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `community_id` (`community_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`community_id`);

--
-- Indexes for table `community_members`
--
ALTER TABLE `community_members`
  ADD PRIMARY KEY (`community_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `community_id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `community_members`
--
ALTER TABLE `community_members`
  ADD CONSTRAINT `community_members_ibfk_1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`community_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
