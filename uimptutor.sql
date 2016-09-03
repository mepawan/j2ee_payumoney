-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2016 at 11:36 AM
-- Server version: 5.6.28-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uimptutor`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
`id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `image`, `created_time`) VALUES
(1, 'Temp Course 01', '<ul class="a03_sub">\r\n            <li>Word Powers of 3000 Words</li>\r\n            <li>One to One , &amp; Group Discussions</li>\r\n            <li>Doubts Busting and Thorough Revision</li>\r\n            <li>Interview Preparations</li>\r\n            <li>Confidence Building &amp; Presentations</li>\r\n            </ul>', 'course1.png', '2016-08-24 13:37:47'),
(2, 'Paramedical Sciences', 'Collaborating with the Ministry of Finance and Government of India initiative of the National Skill Development Corporation, Apollo MedSkills has espoused pioneering teaching methodologies to make healthcare education more practically relevant. The key area of focus is on imparting job specific skills that will make the Indian healthcare professional a part of the much sought after global labour force.\r\n\r\nAt Apollo Medskills, there are diverse up-skilling courses for healthcare professionals and skilling courses for school and university students.', 'course2.png', '2016-08-24 13:43:36'),
(3, 'Web Design', 'This programme giving a wonderful chance to enter in web designing profession. students learn to design rich,interactive websites and also to host and maintain websites .this cover almost everything, which is necessary from planning a web page through design to upload.', 'course3.png', '2016-08-24 13:43:36'),
(4, 'Diploma in Robotics', '<strong>Diploma in Robotics </strong>\r\nis an undergraduate Robotics Engineering course. As far robotics is concerned it is a branch of technology that deals with the design, construction, operation, structural disposition, manufacture and application of robots. Robotics is an exciting area of computer-controlled technology. Robotics is related to the sciences of electronics, engineering, mechanics, and software. Generally, the duration of Bachelor of Engineering in Robotics is four years. In today’s life the importance of robot is enhancing day by day in industrial life and other spheres. So career scopes are many for the candidates after its completion.', 'course4.png', '2016-08-24 13:45:25'),
(5, 'Adobe Photoshop', 'Adobe Photoshop is a complex graphics and image editing software and paint program.  Chances are, you''ve heard of Photoshop frequently in the past even if this will be the very first time that you use the program.  Adobe''s Photoshop program has become a mainstay with graphics designers, professional photographers, and even hobbyists to edit graphics as well as create and manipulate images.  It''s fun to use, and it can turn the most amateur photographer to a professional with just a few clicks of the mouse.', 'course5.png', '2016-08-24 13:49:17'),
(6, 'Digital Marketing', 'Learn conceptual understanding with practical implementation on live projects by industry experts.\r\n\r\nLearn how to get the web pages ranking in major search engines like Google, Yahoo and Bing etc.', 'course6.png', '2016-08-24 13:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(150) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `created_time`) VALUES
(1, 'Ravendra patel', 'pawan1085', 'pawan.developers@gmail.com', '02580258', '2016-08-24 15:35:18'),
(10, 'Ravendra patel', 'ocadmin', 'adfdfa@gff.vom', '123123', '2016-08-26 15:06:16'),
(11, ' Ravendra patel ', ' ocadminq', ' fdsfs@gddc.om ', '123123', '2016-08-26 15:50:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
