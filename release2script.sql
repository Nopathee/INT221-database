-- Drop existing tables if they exist to start fresh
DROP TABLE IF EXISTS `tasksV2`;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `board`;
DROP TABLE IF EXISTS `users`;

-- Create users table
CREATE TABLE `users` (
  `oid` VARCHAR(36) NOT NULL PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `role` ENUM('LECTURER', 'STAFF', 'STUDENT') DEFAULT 'STUDENT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create board table
CREATE TABLE `board` (
  `board_id` VARCHAR(10) NOT NULL PRIMARY KEY, -- Nano ID with length 10
  `owner_id` VARCHAR(36) NOT NULL,
  FOREIGN KEY (`owner_id`) REFERENCES `users`(`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create status table
CREATE TABLE `status` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `status_name` VARCHAR(100) NOT NULL,
  `status_description` VARCHAR(200),
  `color` VARCHAR(30) DEFAULT '#ffffff',
  `created_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `board_id` VARCHAR(10) NOT NULL,
  FOREIGN KEY (`board_id`) REFERENCES `board`(`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create tasksV2 table
CREATE TABLE `tasksV2` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `task_title` VARCHAR(100) NOT NULL,
  `task_description` VARCHAR(500) DEFAULT NULL,
  `task_assignees` TINYTEXT DEFAULT NULL,
  `task_status_id` INT,
  `created_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `board_id` VARCHAR(10) NOT NULL,
  FOREIGN KEY (`task_status_id`) REFERENCES `status`(`id`),
  FOREIGN KEY (`board_id`) REFERENCES `board`(`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Grant select permissions to authuser for users table
GRANT SELECT ON `users` TO 'authuser'; 

COMMIT;
