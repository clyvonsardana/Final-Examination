-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 05:43 PM
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
-- Database: `meams1`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('PRESENT','LATE','ABSENT') DEFAULT NULL,
  `time_marked` time DEFAULT NULL,
  `actual_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `schedule_id`, `date`, `status`, `time_marked`, `actual_time`) VALUES
(3, 'EMP002', 14, '2025-11-12', 'ABSENT', '11:49:45', NULL),
(4, 'EMP002', 10, '2025-11-12', 'PRESENT', '13:00:51', NULL),
(5, 'EMP001', 15, '2025-11-12', 'PRESENT', '15:00:28', NULL),
(6, 'EMP001', 8, '2025-11-14', 'PRESENT', '10:00:15', NULL),
(7, 'EMP002', 14, '2025-11-14', 'ABSENT', '11:52:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `email`, `department`) VALUES
('EMP001', 'Clydle Yvonne D. Sardana', 'sclydleyvonne@gmail.com', 'IT'),
('EMP002', 'domingo mequiso', 'migz_domerz@gmail.com', 'IE'),
('EMP003', 'Kate Jillian Yntig', 'k_jilyntig@gmail.com', 'Education');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `building` varchar(100) NOT NULL,
  `floor` int(11) NOT NULL,
  `availability` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_name`, `capacity`, `room_type`, `building`, `floor`, `availability`) VALUES
(2, 'M001', 'ITLAB', 50, 'laboratory', 'M-Building', 2, 'Available'),
(3, 'M002', 'IELAB', 50, 'laboratory', 'M-Building', 1, 'Available'),
(4, 'S200', 'S201', 50, 'classroom', 'S-Building', 2, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `employee_id` varchar(10) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `employee_id`, `subject_id`, `start_time`, `end_time`, `day`, `time_start`, `time_end`, `room_id`, `day_of_week`) VALUES
(8, 'EMP001', 6, '10:00:00', '11:00:00', 'MWF', NULL, NULL, NULL, NULL),
(10, 'EMP002', 7, '13:00:00', '14:30:00', 'TTH', NULL, NULL, NULL, NULL),
(11, 'EMP001', 9, '14:30:00', '16:00:00', 'TTH', NULL, NULL, NULL, NULL),
(14, 'EMP002', 8, '11:00:00', '00:00:00', 'MWF', NULL, NULL, NULL, NULL),
(15, 'EMP001', 10, '15:00:00', '16:00:00', 'MWF', NULL, NULL, NULL, NULL),
(16, 'EMP002', 11, '16:00:00', '17:00:00', 'MWF', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(100) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `class_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `room_name`, `room`, `class_date`) VALUES
(6, 'intro. to computing', NULL, 'ITLAB', NULL),
(7, 'Advanced Math', NULL, 'IELAB', NULL),
(8, 'Mathematics in the Modern World', NULL, 'IELAB', NULL),
(9, 'Human Computer Interaction', NULL, 'ITLAB', NULL),
(10, 'Multimedia', NULL, 'ITLAB', NULL),
(11, 'Probability and Statistics', NULL, 'S201', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(6, 'admin', 'librarylightwood@gmail.com', '$2y$10$qf7e76yQaP8I9Er4dd5GCehg5PMSpKeonokg6TSMtTLOUYKjzDEzG'),
(7, 'admin', 'carolinesardania_13@yahoo.com', '$2y$10$JxNSoZT0XsTvUy6yWMF7gOf0t5LXt2YmLz7X8gXfPyrLFrKsUHtwW')
(10, 'school checker', 'jossey_88@gmail.com', '$2y$10$XHKngkr7CD4mQbZscvWti.PGyJd9pFWXVlbMhVipvxfmE6LPIuHz.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
