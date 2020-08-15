-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2020 at 03:55 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `parent_table` enum('todo','ticket','messages','comment','other') DEFAULT 'other',
  `item_id` enum('todo_title','ticket_id','comment_id','message_id','unlisted') DEFAULT 'unlisted',
  `todo_title` varchar(255) DEFAULT NULL,
  `todo_creator` int(11) DEFAULT NULL,
  `todo_create_date` varchar(40) DEFAULT NULL,
  `todo_important` tinyint(1) DEFAULT NULL,
  `todo_finished` tinyint(1) DEFAULT NULL,
  `todo_details` varchar(255) DEFAULT NULL,
  `ticket_creator` int(11) DEFAULT NULL,
  `ticket_supid` int(11) DEFAULT NULL,
  `ticet_maintenance_record_id` int(11) DEFAULT NULL,
  `ticket_device_id` int(11) DEFAULT NULL,
  `ticket_date_create` varchar(30) DEFAULT NULL,
  `comment_ticket_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `comment_image` text,
  `comment_userid` int(11) DEFAULT NULL,
  `comment_date` varchar(40) DEFAULT NULL,
  `commment_ticket_title` varchar(255) DEFAULT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_body` text,
  `message_image` text,
  `message_sender_id` int(11) DEFAULT NULL,
  `message_reciver_id` int(11) DEFAULT NULL,
  `empty` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table for backup comments, todo, tickets, message data ';

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL COMMENT 'update/comment id',
  `ticket_id` int(11) NOT NULL COMMENT 'which ticket this comment for ',
  `content` text NOT NULL COMMENT 'content',
  `image` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` text NOT NULL,
  `ticket_title` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `ticket_id`, `content`, `image`, `user_id`, `date`, `ticket_title`) VALUES
(1, 1, 'We send the device to be fixed today', '', 2, '1/15/2020', 'CPU Issue');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(70) DEFAULT NULL,
  `sub_location` varchar(40) DEFAULT NULL,
  `image` text,
  `resigned` varchar(3) NOT NULL COMMENT 'yes/no',
  `devices_count` int(2) DEFAULT NULL COMMENT 'employee can get no divces',
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `location`, `sub_location`, `image`, `resigned`, `devices_count`, `creator_id`) VALUES
(1, 'Mahmoud Hegazi', 'EEC group sheraton main', 'floor 1', '/images/profile.jpg', 'no', 1, 1),
(2, 'Ahmed (supervisor) ', 'EEC group sheraton main', 'floor1', '/images/fb.jpg', 'no', 0, 1),
(3, 'Madonna', 'EEG Group Main shertaon', 'floor 1', '/images/girl.jpg', 'no', 1, 1),
(4, 'shawky', 'EEG Group Main shertaon', 'floor1', '/images/shwky.jpg', 'no', 2, 1),
(5, 'Petter ', 'EEC group main ', 'floor 1', '/images/fb.jpg', 'no', 1, 3),
(6, 'mazen', 'EEC group sub location ', 'bulding4', '/images/fb.jpg', 'no', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL COMMENT 'device for this recored',
  `supplier_id` int(255) DEFAULT NULL COMMENT 'supplier_id',
  `creator_id` int(11) NOT NULL,
  `price` varchar(25) DEFAULT NULL,
  `last_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `device_id`, `supplier_id`, `creator_id`, `price`, `last_employee_id`) VALUES
(2, 6, 1, 3, '600', 6),
(3, 7, 2, 3, '300', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(20) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `image` text NOT NULL,
  `sender_id` int(11) NOT NULL,
  `reciver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `subject`, `body`, `image`, `sender_id`, `reciver_id`) VALUES
(1, 'Hello World', 'Welcome this my First Message For you Hello', '', 1, 3),
(2, 'Second Message', 'Hello My friend are you ready for meeting', '/images/laptop.jpg', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `reciver_id` int(11) NOT NULL,
  `icon` varchar(600) NOT NULL,
  `title` enum('new_message','create_ticket','delete_ticket','added_device','closed_ticket','comment_add','user_created','user_removed','new_maintenance','image_updated','blocked_messages') NOT NULL,
  `header` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `reciver_id`, `icon`, `title`, `header`) VALUES
(1, 'You Have Got, New Message from Mahmoud Hegazy', 3, '/images/rsz_new_message.jpg', 'new_message', 'New Message'),
(2, 'You Have Got, New Message from Mahmoud Hegazy', 10, '/images/rsz_new_message.jpg', 'new_message', 'New Message');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL COMMENT 'supplier_id',
  `name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `sup_image` text COMMENT 'if no images uploaded upload default value',
  `sup_history` text,
  `extra_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tables contains suppliers info';

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `name`, `mobile`, `sup_image`, `sup_history`, `extra_data`) VALUES
(1, 'Petter ', '01113722390', '/images/fb.jpg', 'Our top supplier desktop, he is cute and funny supplier, high price ', 'don\'t call him at morning'),
(2, 'Hend', '0123456789', '/images/girl.png', 'She Provide us with laptops, new only', 'send what\'s up message only');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `maintenance_record_id` int(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date_create` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `creator_id`, `sup_id`, `maintenance_record_id`, `device_id`, `date_create`) VALUES
(1, 3, 1, 2, 7, '7/15/2020');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `create_date` varchar(25) NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `details` varchar(255) NOT NULL DEFAULT 'No details..'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `title`, `creator_id`, `create_date`, `important`, `finished`, `details`) VALUES
(1, 'Make coffee', 1, '5:16 AM 8-15-2020', 0, 0, 'No details..'),
(2, 'Check emails', 3, '2:16 AM 8-15-2020', 0, 0, 'No details..'),
(3, 'Create My First App', 1, '5:16 AM 8-13-2020', 0, 1, 'Create admin system to mange Devices and recourse '),
(4, 'Get feedback on design', 2, '5:16 AM 8-15-2020', 0, 0, 'No details..');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(45) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `website` varchar(30) DEFAULT NULL,
  `image` text NOT NULL,
  `isadmin` int(1) DEFAULT NULL,
  `password` varchar(62) NOT NULL,
  `tickets_count` varchar(11) DEFAULT NULL COMMENT 'number_of_users_tickets',
  `myid` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `system_owner` tinyint(1) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `website`, `image`, `isadmin`, `password`, `tickets_count`, `myid`, `username`, `system_owner`, `comments_count`) VALUES
('Mahmoud Hegazi', 'fire_archer2@yahoo.com', 'https:2wenos.co', '/images/fb.jpg', 1, 'mahmoud123', '0', 1, 102030, 1, 0),
('Ahmed (supervisor) ', 'ahmed@gmail.com', 'ahmed.com', '/images/fb.jp', 1, 'ahmed123', '0', 2, 101213, 0, 0),
('madonna', 'madonna@gmail.com', 'madonna.wordpress.com', '/images/girl.png', 1, 'madonna123', '0', 3, 121212, 0, 0),
('shawky', 'shawky@gmail.com', 'shawky.wordpress.com', '/images/shwky.jpg', 1, 'shwky123', '0', 10, 141414, 0, 0),
('michel', 'michel@gmail.com', 'michel.wordpress.com', '/images/fb.jpg', 1, 'michel123', '0', 12, 151515, 0, 0),
('mahmoud', 'mahmoud@gmail.com', 'mahmoud.wordpres.com', '/images/fb.jpg', 1, '7oda123', '0', 13, 161616, 0, 0),
('romany', 'roma@gamil.com', 'roma.me', '/images/fb.jpg', 1, 'romany123', '0', 14, 191919, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `workstation`
--

CREATE TABLE `workstation` (
  `id` int(25) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1= desktop/ 2 = laptop/ 3 = other',
  `service_tag` varchar(50) NOT NULL,
  `manufacture` varchar(50) DEFAULT NULL COMMENT 'model',
  `purchased_date` varchar(25) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  `history` text NOT NULL,
  `status` varchar(11) NOT NULL COMMENT 'new or old',
  `images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='all devices';

--
-- Dumping data for table `workstation`
--

INSERT INTO `workstation` (`id`, `type`, `service_tag`, `manufacture`, `purchased_date`, `supplier_id`, `price`, `history`, `status`, `images`) VALUES
(2, 2, 'BnbJMQF', 'IOS', '3/5/2018', 2, '28.100', 'RAM 16, HD, Screen 4 gig HD, keyboard professional, processor i5', 'new', '/images/mac1.jpg'),
(3, 2, 'HNKzIQA', 'Lenovo', '8/4/2020', 2, '12.255', 'RAM 8, HD, Screen 4 gig HD, keyboard professional, processor i17 ', 'old', '/images/laptop'),
(4, 1, 'JKbAAMQa', 'IOS', '4/4/2020', 1, '28.100', 'RAM 8, HD, Screen 4 gig HD, keyboard professional, processor i15', 'new', '/images/desktop.jpg'),
(5, 1, 'JKbFFMQa', 'HP', '8/25/2020', 1, '18.500', 'RAM 9, HD, Screen 4 gig HD, keyboard professional, processor i15', 'new', '/images/desktop.jpg'),
(6, 2, 'DebFJbNQ', 'HP', '4/15/2020', 2, '14.000', 'RAM 2, HD, Screen 4 gig HD, keyboard professional, processor i17', 'new', '/images/mac1.jpg'),
(7, 1, 'ZeAFJbNF', 'Dell', '3/12/2020', 1, '4.000', 'RAM 24, HD, Screen 8HD, keyboard professional, processor i17', 'old', '/images/desktop.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `comment_ibfk_2` (`user_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `last_employee_id` (`last_employee_id`),
  ADD KEY `maintenance_ibfk_1` (`creator_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `reciver_id` (`reciver_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reciver_id` (`reciver_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `maintenance_record_id` (`maintenance_record_id`),
  ADD KEY `ticket_ibfk_1` (`creator_id`),
  ADD KEY `sup_id` (`sup_id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`myid`);

--
-- Indexes for table `workstation`
--
ALTER TABLE `workstation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'update/comment id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'supplier_id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `myid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `workstation`
--
ALTER TABLE `workstation`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`myid`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`myid`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`myid`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `maintenance_ibfk_4` FOREIGN KEY (`device_id`) REFERENCES `workstation` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_5` FOREIGN KEY (`last_employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`myid`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`myid`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`myid`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`myid`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `workstation` (`id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`maintenance_record_id`) REFERENCES `maintenance` (`id`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`sup_id`) REFERENCES `suppliers` (`sup_id`);

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`myid`);

--
-- Constraints for table `workstation`
--
ALTER TABLE `workstation`
  ADD CONSTRAINT `workstation_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
