/*
SQLyog Community
MySQL - 8.0.42-0ubuntu0.24.04.2 : Database - bookingappdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `bookingappdb`;

/*Table structure for table `activity_logs` */

DROP TABLE IF EXISTS `activity_logs`;

CREATE TABLE `activity_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `booking_id` int unsigned DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `booking_id` (`booking_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=96;

/*Data for the table `activity_logs` */

insert  into `activity_logs`(`id`,`user_id`,`booking_id`,`action`,`description`,`ip_address`,`created_at`) values 
(1,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:13:11'),
(2,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:15:16'),
(3,3,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:15:57'),
(4,3,1,'create_booking','Created new booking: 20260127996D','127.0.0.1','2026-01-27 21:18:03'),
(5,3,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:18:32'),
(6,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:18:39'),
(7,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:23:57'),
(8,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:24:09'),
(9,2,1,'approve_division','Division head approved booking','127.0.0.1','2026-01-27 21:25:19'),
(10,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:25:43'),
(11,3,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:26:00'),
(12,3,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:26:07'),
(13,5,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:26:22'),
(14,5,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:27:07'),
(15,4,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:27:12'),
(16,4,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:27:36'),
(17,6,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:28:18'),
(18,6,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:28:24'),
(19,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:28:33'),
(20,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:28:42'),
(21,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:28:51'),
(22,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:29:11'),
(23,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:29:21'),
(24,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:29:28'),
(25,3,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:30:01'),
(26,3,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:30:27'),
(27,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:30:35'),
(28,1,1,'approve_ga','GA approved booking','127.0.0.1','2026-01-27 21:30:54'),
(29,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:31:51'),
(30,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:32:02'),
(31,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:32:28'),
(32,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:33:35'),
(33,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:36:10'),
(34,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:48:30'),
(35,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:48:36'),
(36,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:48:51'),
(37,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 21:58:20'),
(38,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 21:58:35'),
(39,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 22:19:58'),
(40,2,NULL,'login','User logged in','127.0.0.1','2026-01-27 22:20:10'),
(41,2,NULL,'logout','User logged out','127.0.0.1','2026-01-27 22:20:15'),
(42,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 22:20:22'),
(43,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 23:14:07'),
(44,1,NULL,'login','User logged in','127.0.0.1','2026-01-27 23:14:22'),
(45,1,NULL,'logout','User logged out','127.0.0.1','2026-01-27 23:37:21'),
(46,6,NULL,'login','User logged in','127.0.0.1','2026-01-27 23:37:51'),
(47,6,NULL,'logout','User logged out','127.0.0.1','2026-01-28 00:14:19'),
(48,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 00:14:34'),
(49,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 00:30:54'),
(50,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 00:31:40'),
(51,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 00:50:26'),
(52,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 00:50:51'),
(53,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 01:42:11'),
(54,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 01:43:23'),
(55,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 01:58:32'),
(56,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 02:11:41'),
(57,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 02:28:51'),
(58,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 02:37:30'),
(59,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 02:37:44'),
(60,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 02:37:55'),
(61,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 02:57:55'),
(62,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 02:58:10'),
(63,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 03:14:46'),
(64,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 14:32:32'),
(65,4,2,'create_booking','Created new booking: 2026012867BD','127.0.0.1','2026-01-28 14:35:31'),
(66,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 14:43:03'),
(67,2,NULL,'login','User logged in','127.0.0.1','2026-01-28 14:43:25'),
(68,2,2,'approve_division','Division head approved booking','127.0.0.1','2026-01-28 14:44:30'),
(69,2,NULL,'logout','User logged out','127.0.0.1','2026-01-28 14:51:09'),
(70,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 14:51:24'),
(71,1,2,'approve_ga','GA approved booking','127.0.0.1','2026-01-28 14:51:46'),
(72,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 14:56:35'),
(73,4,NULL,'login','User logged in','127.0.0.1','2026-01-28 14:57:01'),
(74,4,3,'create_booking','Created new booking: 2026012837F6','127.0.0.1','2026-01-28 15:00:59'),
(75,4,NULL,'logout','User logged out','127.0.0.1','2026-01-28 15:02:47'),
(76,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 15:03:16'),
(77,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 15:03:45'),
(78,2,NULL,'login','User logged in','127.0.0.1','2026-01-28 15:04:48'),
(79,2,3,'approve_division','Division head approved booking','127.0.0.1','2026-01-28 15:05:51'),
(80,2,NULL,'logout','User logged out','127.0.0.1','2026-01-28 15:07:18'),
(81,1,NULL,'login','User logged in','127.0.0.1','2026-01-28 15:07:45'),
(82,1,3,'approve_ga','GA approved booking','127.0.0.1','2026-01-28 15:08:12'),
(83,1,NULL,'logout','User logged out','127.0.0.1','2026-01-28 15:47:22'),
(84,4,NULL,'login','User logged in','127.0.0.1','2026-02-09 11:16:17'),
(85,4,NULL,'logout','User logged out','127.0.0.1','2026-02-09 11:17:34'),
(86,4,NULL,'login','User logged in','127.0.0.1','2026-02-09 17:41:29'),
(87,4,NULL,'logout','User logged out','127.0.0.1','2026-02-09 17:47:01'),
(88,4,NULL,'login','User logged in','127.0.0.1','2026-02-09 17:59:14'),
(89,4,NULL,'logout','User logged out','127.0.0.1','2026-02-09 18:02:15'),
(90,4,NULL,'login','User logged in','127.0.0.1','2026-02-11 20:39:08'),
(91,4,NULL,'logout','User logged out','127.0.0.1','2026-02-11 20:49:56'),
(92,1,NULL,'login','User logged in','127.0.0.1','2026-02-11 20:55:45'),
(93,1,NULL,'logout','User logged out','127.0.0.1','2026-02-11 21:04:17'),
(94,1,NULL,'login','User logged in','127.0.0.1','2026-02-11 21:05:56'),
(95,1,NULL,'logout','User logged out','127.0.0.1','2026-02-11 21:09:13');

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(20) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `division_id` int unsigned NOT NULL,
  `booking_type` enum('room','vehicle') NOT NULL,
  `room_id` int unsigned DEFAULT NULL,
  `vehicle_id` int unsigned DEFAULT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `purpose` text NOT NULL,
  `participants_count` int DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL COMMENT 'For vehicle booking',
  `status` enum('pending_division','pending_ga','approved','rejected') NOT NULL DEFAULT 'pending_division',
  `division_approval_by` int unsigned DEFAULT NULL,
  `division_approval_at` datetime DEFAULT NULL,
  `division_approval_notes` text,
  `ga_approval_by` int unsigned DEFAULT NULL,
  `ga_approval_at` datetime DEFAULT NULL,
  `ga_approval_notes` text,
  `rejection_reason` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_code` (`booking_code`),
  KEY `user_id` (`user_id`),
  KEY `division_id` (`division_id`),
  KEY `room_id` (`room_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `booking_date` (`booking_date`),
  KEY `status` (`status`),
  KEY `fk_bookings_div_approver` (`division_approval_by`),
  KEY `fk_bookings_ga_approver` (`ga_approval_by`),
  KEY `idx_bookings_lookup` (`booking_type`,`booking_date`,`status`),
  KEY `idx_bookings_approval` (`status`,`division_id`),
  CONSTRAINT `fk_bookings_div_approver` FOREIGN KEY (`division_approval_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_bookings_division` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bookings_ga_approver` FOREIGN KEY (`ga_approval_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_bookings_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bookings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bookings_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4;

/*Data for the table `bookings` */

insert  into `bookings`(`id`,`booking_code`,`user_id`,`division_id`,`booking_type`,`room_id`,`vehicle_id`,`booking_date`,`start_time`,`end_time`,`purpose`,`participants_count`,`destination`,`status`,`division_approval_by`,`division_approval_at`,`division_approval_notes`,`ga_approval_by`,`ga_approval_at`,`ga_approval_notes`,`rejection_reason`,`created_at`,`updated_at`) values 
(1,'20260127996D',3,2,'room',1,NULL,'2026-01-28','11:21:00','13:20:00','miting eproc satu',12,'','approved',2,'2026-01-27 21:25:19','tolong sediakan makanan dan minuman',1,'2026-01-27 21:30:54','',NULL,'2026-01-27 21:18:03','2026-01-27 21:30:54'),
(2,'2026012867BD',4,2,'room',3,NULL,'2026-01-30','08:10:00','09:50:00','miting siap',10,'','approved',2,'2026-01-28 14:44:30','ok tl sesuai ketentuan',1,'2026-01-28 14:51:43','ok lanjut',NULL,'2026-01-28 14:35:31','2026-01-28 14:51:43'),
(3,'2026012837F6',4,2,'vehicle',NULL,2,'2026-02-02','11:30:00','13:30:00','rapat dengan BOD dan pemprov',0,'hotel novotel','approved',2,'2026-01-28 15:05:47','jangan lama2 perginya kalu bisa lebih cepat pulang',1,'2026-01-28 15:08:09','ok',NULL,'2026-01-28 15:00:55','2026-01-28 15:08:09');

/*Table structure for table `divisions` */

DROP TABLE IF EXISTS `divisions`;

CREATE TABLE `divisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13;

/*Data for the table `divisions` */

insert  into `divisions`(`id`,`name`,`code`,`is_active`,`created_at`) values 
(1,'SDM, UMUM dan Aset','DIVUM',1,'2026-01-27 20:31:51'),
(2,'SBU Teknologi','UTIK',1,'2026-01-27 20:31:51'),
(3,'Keuangan dan Akuntansi','DKA',1,'2026-01-27 20:31:51'),
(4,'Pengembangan Bisnis','UPPA',1,'2026-01-27 20:31:51'),
(5,'Pertanahan dan Hukum','DPH',1,'2026-01-27 20:31:51'),
(6,'Satuan Pengawasan Internal','SPI',1,'2026-01-27 20:31:51'),
(7,'Perencanaan dan Pengembangan','UPP',1,'2026-01-27 20:31:51'),
(8,'Manajemen Risiko','MANRIS',1,'2026-01-27 20:31:51'),
(9,'Sekretaris Perusahaan','SEKPER',1,'2026-01-27 20:31:51'),
(10,'SBU FPSA','FPSA',1,'2026-01-28 00:27:37'),
(11,'SBU Kawasan','SBUK',1,'2026-01-28 00:28:08'),
(12,'SBU Apartemen','SBUA',1,'2026-01-28 00:28:29');

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  `capacity` int NOT NULL,
  `facilities` text COMMENT 'JSON array of facilities',
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7;

/*Data for the table `rooms` */

insert  into `rooms`(`id`,`name`,`location`,`capacity`,`facilities`,`description`,`image`,`is_active`,`created_at`,`updated_at`) values 
(1,'Ruang Meeting Udin Abimanyu','Lantai 3, Gedung Sarana Jaya Pusat',10,'[\"TV Screen\", \"Whiteboard\", \"AC\", \"WiFi\"]','uang Meeting Udin Abimanyu Lantai 3 Gedung Sarana Jaya Pusat',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:06:41'),
(2,'Ruang Meeting Syamsir Iskandar','Lantai 4, Gedung Sarana Jaya Pusat',14,'[\"TV Screen\", \"Whiteboard\", \"AC\", \"WiFi\"]','Ruang Meeting Syamsir Iskandar Lantai 4 Gedung Sarana Jaya Pusat',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:06:50'),
(3,'Ruang Rapat Iman Soenaryo','Lantai 4, Gedung Sarana Jaya Pusat',8,'[\"TV Screen\", \"Whiteboard\", \"AC\", \"WiFi\"]','Ruang Rapat Iman Soenaryo lantai 4 Gedung Sarana Jaya Pusat (ex-Depan Divisi Hukum)',NULL,0,'2026-01-27 20:31:51','2026-02-11 20:56:49'),
(4,'Ruang Rapat Thamrin Djamain','Lantai 4, Gedung Sarana Jaya Pusat',6,'[\"TV Screen\", \"AC\"]','Ruang Rapat Thamrin Djamain lantai 4 Gedung Sarana Jaya Pusat(ex-Komite Dewas)',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:11:23'),
(5,'Ruang Rapat Tebyan Amari','Lantai 4, Gedung Sarana Jaya Pusat',8,'[\"Whiteboard\", \"AC\", \"WiFi\"]','Ruang Rapat Tebyan Amari Lantai 4 Gedung Sarana Jaya Pusat (Depan Receiptionist)',NULL,1,'2026-01-27 20:31:51','2026-01-27 22:44:39'),
(6,'Aula Hari Sandjojo','Lantai 4, Gedung Sarana Jaya Pusat',50,'[\"TV Screen\", \"Sound System\",\"Projector\",\"AC\"]','Aula Hari Sandjojo Lantai 4 Gedung Sarana Jaya Pusat (Aula Karpet Merah)',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:13:20');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int unsigned DEFAULT NULL,
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('employee','head_division','admin_ga') NOT NULL DEFAULT 'employee',
  `phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `division_id` (`division_id`),
  CONSTRAINT `fk_users_division` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 ;

/*Data for the table `users` */

insert  into `users`(`id`,`division_id`,`employee_id`,`name`,`email`,`password`,`role`,`phone`,`is_active`,`created_at`,`updated_at`) values 
(1,NULL,'GA001','Admin DIVUM','mirzawargajakarta@gmail.com','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','admin_ga','081234567890',1,'2026-01-27 20:31:51','2026-02-11 20:55:28'),
(2,2,'IT001','Bodro Bahwono','mirzarivai@gmail.com','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','head_division','081234567891',1,'2026-01-27 20:31:51','2026-01-29 11:23:16'),
(3,2,'IT002','Syahrul Sidik','syahrul.sidik@sarana-jaya.co.id','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','employee','081234567892',1,'2026-01-27 20:31:51','2026-01-29 11:23:17'),
(4,2,'IT003','Ahmad Mirza','ahmad.mirza@sarana-jaya.co.id','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','employee','081234567893',1,'2026-01-27 20:31:51','2026-01-29 11:23:18'),
(5,1,'HR001','Faried','faried@sarana-jaya.co.id','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','head_division','081234567894',1,'2026-01-27 20:31:51','2026-01-29 11:23:19'),
(6,1,'HR002','Muammar','ammar@sarana-jaya.co.id','$2y$10$t50gt3hBmnR7QstWcWbv3.3J4Vb7pu1tbwr/GWJ3itjcc3gtz43ua','employee','081234567895',1,'2026-01-27 20:31:51','2026-01-29 11:23:20');

/*Table structure for table `vehicles` */

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Sedan, SUV, MPV, etc',
  `capacity` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `driver_phone` varchar(20) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plate` (`license_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=13 ;

/*Data for the table `vehicles` */

insert  into `vehicles`(`id`,`name`,`license_plate`,`type`,`capacity`,`description`,`driver_name`,`driver_phone`,`image`,`is_active`,`created_at`,`updated_at`) values 
(1,'Mitsubishi Expander','B 2131 PFY','MPV',7,'Expander Hitam Dengan Plat Ganjil','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-27 23:56:34'),
(2,'Mitsubishi Expander','B 2694 PFX','MPV',7,'Expander Hitam Dengan Plat Genap','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-27 23:59:23'),
(3,'Mitsubishi Expander','B 2133 PFY','MPV',7,'Expander Hitam Plat Ganjil','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-27 23:59:25'),
(4,'SUZUKI Carry','B 9195 PAB','Pickup',3,'Mobil Bak Terbuka Plat Ganjil','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:17:20'),
(5,'Honda VARIO','B 3802 PCA','Motor',2,'Motor Matic Vario warna hitam','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-28 00:01:35'),
(6,'Honda VARIO','B 3808 PCA','Motor',2,'Motor Matic Vario warna hitam','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-27 23:04:22'),
(7,'Yamaha VEGA R','B 6648 PIU','Motor',2,'Motor Bebek Vega R warna merah','driver anonym','08123456789',NULL,1,'2026-01-27 20:31:51','2026-01-27 23:04:22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
