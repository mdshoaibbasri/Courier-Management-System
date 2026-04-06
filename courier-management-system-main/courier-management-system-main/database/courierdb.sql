-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2020 at 11:41 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courierdb`
--




CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pnumber` int(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);



  INSERT INTO `admin` (`a_id`, `email`, `name`, `pnumber`) VALUES
(1, 'admin1@gmail.com', 'GEETHA', 9675845623),
(2, 'admin2@gmail.com', 'MAHESHA', 7234566785),
(3, 'admin3@gmail.com', 'PRAKASH', 8345678932),
(4, 'admin4@gmail.com', 'KUMAR', 9456789845),
(5, 'admin5@gmail.com', 'THARUN', 9845567898);






CREATE TABLE `adlogin` (
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `a_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



ALTER TABLE `adlogin`
  ADD PRIMARY KEY `a_id` (`a_id`),
  ADD KEY `password` (`password`) ;

ALTER TABLE `adlogin`
  ADD CONSTRAINT `adlogin_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `admin` (`a_id`),
  ADD CONSTRAINT `adlogin_ibfk_2` FOREIGN KEY (`email`) REFERENCES `admin` (`email`);


  INSERT INTO `adlogin` (`email`, `password`, `a_id`) VALUES
('admin1@gmail.com', '12345', 1),
('admin2@gmail.com', '23456', 2),
('admin3@gmail.com', '34567', 3),
('admin4@gmail.com', '45678', 4),
('admin5@gmail.com', '56789', 5);




CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pnumber` int(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `email` (`email`);


INSERT INTO `users` (`u_id`, `email`, `name`, `pnumber`) VALUES
(1, 'rakshith@gmail.com', 'Rakshith', 7760096234),
(2, 'pooja@gmail.com', 'Pooja', 9147483647),
(3, 'ravi@gmail.com', 'Ravi', 9247483647),
(4, 'lakshmi@gmail.com', 'Lakshmi', 9347483647),
(5, 'varun@gmail.com', 'Varun', 9447483647),
(6, 'rohan@gmail.com', 'Rohan', 9547483647),
(7, 'noel@gmail.com', 'Noel', 9647483647);







CREATE TABLE `login` (
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `login`
  ADD PRIMARY KEY `u_id` (`u_id`),
  ADD KEY `password` (`password`) ;


ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE;

  INSERT INTO `login` (`email`, `password`, `u_id`) VALUES
('rakshith@gmail.com', '12345', 1),
('pooja@gmail.com', '23456', 2),
('ravi@gmail.com', '34567', 3),
('lakshmi@gmail.com', '45678', 4),
('varun@gmail.com', '56789', 5),
('rohan@gmail.com', '67890', 6),
('noel@gmail.com', '01234', 7);


ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

  
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;








CREATE TABLE `courier` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `semail` varchar(50) DEFAULT NULL,
  `remail` varchar(50) DEFAULT NULL,
  `sname` varchar(50) DEFAULT NULL,
  `rname` varchar(50) DEFAULT NULL,
  `sphone` varchar(20) DEFAULT NULL,
  `rphone` varchar(20) DEFAULT NULL,
  `saddress` varchar(50) DEFAULT NULL,
  `raddress` varchar(50) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `billno` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `courier`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `billno` (`billno`),
  ADD KEY `u_id` (`u_id`);


  ALTER TABLE `courier`
  ADD CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE;

  ALTER TABLE `courier`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;




  INSERT INTO `courier` (`c_id`, `u_id`, `semail`, `remail`, `sname`, `rname`, `sphone`, `rphone`, `saddress`, `raddress`, `weight`, `billno`, `image`, `date`) VALUES
(100, 1, 'rakshith@gmail.com', 'ravi@gmail.com', 'Rakshith', 'Ravi', '7760096234', '9665266529', 'Dairy circle,Hassan,Karnataka', 'Boys hostel GECH', 2, 1000, 'choci.jpg', '2023-12-06'),
(101, 4, 'lakshmi@gmail.com', 'pooja@gmail.com', 'Lakshmi', 'Pooja', '9347483647', '06362786223', 'Dairy Circle,Hassan,Karnataka', 'Girls hostel GECH', 1, 1001, 'clothes.png', '2024-02-12');








CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `msg` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  

ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`);

 ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


INSERT INTO `contacts` (`id`,`email`,`subject`,`msg`) VALUES
(1,'rakshith@gmail.com','service','super fast service');




 
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
