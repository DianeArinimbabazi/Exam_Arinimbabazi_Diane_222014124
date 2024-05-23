-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 09:57 AM
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
-- Database: `business_plan_builder_tool`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`attachment_id`, `plan_id`, `section_id`, `file_name`, `created_at`) VALUES
(1, 2, 21, 'business_plan.pdf', '2024-04-29 22:00:00'),
(2, 3, 22, 'financial_projections.pdf', '2024-04-29 22:00:00'),
(3, 4, 23, 'proposal.pdf', '2024-04-29 22:00:00'),
(4, 5, 24, 'attachment5.pdf', '2024-04-29 22:00:00'),
(5, 3, 21, 'business_plan.xxl', '2024-04-30 22:00:00'),
(7, 5, 24, 'file4.pdf', '2024-04-29 22:00:00'),
(8, 4, 23, 'attachment6.word', '2024-05-07 22:00:00'),
(9, 2, 22, 'file7', '2024-05-09 22:00:00'),
(10, 5, 21, 'appointments.pdf', '2024-05-24 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `business_plans`
--

CREATE TABLE `business_plans` (
  `plan_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_plans`
--

INSERT INTO `business_plans` (`plan_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'business plan 1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Business Plan 2', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(3, 'Business Plan 3', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(4, 'Business Plan 4', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(5, 'Business Plan 5', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(6, 'business plan 6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'business plan 7', '2024-05-07 22:00:00', '2024-05-07 22:00:00'),
(8, 'business plan 8', '2024-04-29 22:00:00', '2024-05-17 22:00:00'),
(9, 'business plan 9', '2024-05-15 22:00:00', '2024-06-05 22:00:00'),
(10, 'business plan 10', '2024-05-29 22:00:00', '2024-06-03 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `collaborators`
--

CREATE TABLE `collaborators` (
  `collaboration_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collaborators`
--

INSERT INTO `collaborators` (`collaboration_id`, `plan_id`, `role`, `created_at`) VALUES
(1, 2, 'viewer', '2024-04-29 22:00:00'),
(2, 3, 'editor', '2024-04-29 22:00:00'),
(3, 4, 'viewer', '2024-04-29 22:00:00'),
(4, 2, 'planner', '0000-00-00 00:00:00'),
(5, 5, 'editor', '2024-04-29 22:00:00'),
(7, 3, 'reader', '2024-05-07 22:00:00'),
(10, 5, 'controller', '2024-05-15 22:00:00'),
(23, 3, 'supervisor', '2024-04-30 22:00:00'),
(32, 4, 'manager', '2024-05-23 22:00:00'),
(60, 5, 'traveller', '2024-05-06 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `plan_id`, `section_id`, `comment_text`, `created_at`) VALUES
(1, 2, 22, 'comment for user 3', '2024-05-07 22:00:00'),
(2, 3, 23, 'comment for user 4', '2024-05-28 22:00:00'),
(3, 2, 21, 'Comment for user 2, plan 2, section 21', '2024-05-01 12:14:27'),
(4, 3, 22, 'Comment for user 3, plan 3, section 22', '2024-05-01 12:14:38'),
(5, 4, 23, 'Comment for user 4, plan 4, section 23', '2024-05-01 12:14:51'),
(6, 5, 24, 'Comment for user 5, plan 5, section 24', '2024-05-01 12:15:01'),
(7, 2, 24, 'comment for user 5', '2024-04-30 22:00:00'),
(8, 3, 23, 'comment for user 6', '2024-05-07 22:00:00'),
(9, 5, 21, 'comment for user 7', '2024-05-15 22:00:00'),
(10, 4, 21, 'comment for user 8', '2024-05-28 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `plan_id`, `section_id`, `rating`, `created_at`) VALUES
(1, 2, 22, 4, '2024-05-07 22:00:00'),
(2, 3, 23, 5, '2024-05-01 12:28:49'),
(3, 4, 24, 4, '2024-05-01 12:28:49'),
(4, 2, 22, 3, '2024-04-29 22:00:00'),
(5, 3, 24, 5, '2024-05-01 12:31:01'),
(7, 5, 23, 9, '2024-05-27 22:00:00'),
(8, 5, 23, 34, '2024-04-29 22:00:00'),
(9, 4, 21, 100, '2024-05-07 22:00:00'),
(10, 30, 22, 10, '0000-00-00 00:00:00'),
(11, 5, 21, 200, '2024-05-29 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `goal_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `target_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`goal_id`, `plan_id`, `description`, `target_date`, `status`, `created_at`) VALUES
(1, 2, 'Launch new product line', '2024-10-01', 'In progress', '2024-05-01 12:27:58'),
(2, 2, 'Expand into new markets', '2025-03-01', 'Not started', '2024-05-01 12:27:58'),
(3, 3, 'Secure funding for project', '2024-07-01', 'Completed', '2024-05-01 12:27:58'),
(4, 4, 'Business Professional', '2024-05-08', 'Creative Exploration', '0000-00-00 00:00:00'),
(5, 3, 'Creative Artist', '2024-05-16', 'Web Designer', '2024-05-06 22:00:00'),
(6, 4, 'Technology Enthusiast', '2024-05-29', 'in progress', '2024-06-05 22:00:00'),
(7, 3, 'Healthcare Professional', '2024-05-25', 'completed', '2024-06-04 22:00:00'),
(8, 5, ' Educator', '2024-06-05', 'in progress', '2024-05-27 22:00:00'),
(9, 5, 'Fitness Enthusiast', '0000-00-00', 'in progress', '2024-05-13 22:00:00'),
(10, 3, 'Scientist', '2024-05-01', 'started', '2024-04-30 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `order_index` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `plan_id`, `title`, `order_index`, `created_at`) VALUES
(7, 2, 'commercial service', 2, '2024-05-22 22:00:00'),
(21, 2, 'Market Analysis', 2, '2024-04-29 22:00:00'),
(22, 3, 'Financial Projections', 3, '2024-04-29 22:00:00'),
(23, 4, 'Marketing Strategy', 4, '2024-04-29 22:00:00'),
(24, 5, 'Operational Plan', 5, '2024-04-29 22:00:00'),
(25, 5, 'organizational plan', 6, '0000-00-00 00:00:00'),
(26, 2, 'urbanization', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `plan_id`, `section_id`, `description`, `due_date`, `created_at`) VALUES
(1, 2, 21, 'Complete task for plan 2, section 21', '2024-05-10', '2024-05-01 12:24:32'),
(2, 3, 22, 'Complete task for plan 3, section 22', '2024-05-05', '2024-05-01 12:24:42'),
(3, 4, 23, 'Complete task for plan 4, section 23', '2024-05-15', '2024-05-01 12:24:52'),
(4, 5, 24, 'Complete task for plan 5, section 24', '2024-05-12', '2024-05-01 12:25:00'),
(5, 2, 21, 'started task for plan 1', '2024-05-08', '2024-05-23 22:00:00'),
(6, 3, 22, 'Creative Artist', '2024-05-15', '2024-05-15 22:00:00'),
(7, 3, 23, ' Business Professional', '2024-05-08', '2024-05-09 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `template_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`template_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'creative art', 'Business Professional', '2024-04-30 22:00:00', '2024-04-30 22:00:00'),
(2, 'Detailed Business Plan', 'A comprehensive business plan template', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(3, 'Startup Business Plan', 'A business plan template for startups', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(4, 'Financial Business Plan', 'A business plan focused on financial aspects', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(5, 'Sales Business Plan', 'A business plan focusing on sales strategies', '2024-04-29 22:00:00', '2024-04-29 22:00:00'),
(6, 'business man', 'Creative Artist', '2024-05-08 22:00:00', '2024-05-05 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `activation_code` varchar(50) DEFAULT NULL,
  `is_activated` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `telephone`, `password`, `creationdate`, `activation_code`, `is_activated`) VALUES
(1, 'Diane', 'Arinimbabazi', 'me', 'arinidiannah@gmail.com', '0787666117', '$2y$10$pP7AwAMwI/tOgUdUDUADx.df1BYbDMgqjPTQpyg7DmQjB4zEabP/q', '2024-05-20 14:49:14', '123456', 0),
(4, 'Me', 'Mine', 'Dinox', 'Danox@gmail.com', '0787666117', '$2y$10$sMXH/WMlWe1yGqxX8J9jE.YzGjtwOXmi31uJBzb4zhhyKlYNtOBM2', '2024-05-22 14:44:18', '12', 0),
(7, 'Mama', 'Papa', 'more', 'Mama@gmail.com', '0786161265', '$2y$10$3P2D3HdmjsBnQFxzbGtRPOw023OZC3pNem55VMYB592f2Ca8/geom', '2024-05-22 14:45:51', '1234', 0),
(8, 'Arinimbabazi', 'Diane', 'Diane', 'ArinimbabaziDiane@gmail.com', '0782484514', '$2y$10$Wcz5EcqRcSTjUyhj7SUyDOFusfI0AzTj0.BdftKmlsNeMuXH1XHnG', '2024-05-23 07:55:05', '11223344', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`attachment_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `business_plans`
--
ALTER TABLE `business_plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`collaboration_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goal_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `business_plans`
--
ALTER TABLE `business_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `collaborators`
--
ALTER TABLE `collaborators`
  MODIFY `collaboration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `goal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `business_plans` (`plan_id`),
  ADD CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `business_plans` (`plan_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `business_plans` (`plan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
