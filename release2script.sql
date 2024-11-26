-- Drop existing tables in the correct order to avoid foreign key constraints
DROP TABLE IF EXISTS `tasksV3`;                        
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `collaborators`;
DROP TABLE IF EXISTS `personal_board`;
DROP TABLE IF EXISTS `board`;
DROP TABLE IF EXISTS `usersLocal`;

-- Create users table
CREATE TABLE `usersLocal` (
  `owner_id` VARCHAR(36) NOT NULL PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `role` ENUM('LECTURER', 'STAFF', 'STUDENT') DEFAULT 'STUDENT',
  `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create board table with auto-incrementing board_id
CREATE TABLE `board` (
  `board_id` varchar(10) NOT NULL PRIMARY KEY,
  `board_name` VARCHAR(120) NOT NULL,
  `owner_id` VARCHAR(36) NOT NULL,
  `visibility` ENUM('PUBLIC','PRIVATE') DEFAULT 'PRIVATE',
  `created_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`owner_id`) REFERENCES `usersLocal`(`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Complete the personal_board table
CREATE TABLE `personal_board`(
  `shared_id` INT NOT NULL AUTO_INCREMENT,
  `board_id` VARCHAR(10) NOT NULL,
  `owner_id` CHAR(36) NOT NULL,
  `access_right` ENUM('READ','WRITE') NOT NULL DEFAULT 'READ',
  `added_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`shared_id`, `board_id`, `owner_id`),
  INDEX `fk_personal_board_users_idx` (`owner_id`),
  INDEX `fk_personal_board_boards_idx` (`board_id`),
  CONSTRAINT `fk_personal_board_users`
    FOREIGN KEY (`owner_id`) REFERENCES `usersLocal` (`owner_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personal_board_boards`
    FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create status table
CREATE TABLE `status` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `status_name` VARCHAR(100) NOT NULL,
  `status_description` VARCHAR(200),
  `color` VARCHAR(30) DEFAULT '#ffffff',
  `board_id` VARCHAR(10) NOT NULL,
  FOREIGN KEY (`board_id`) REFERENCES `board`(`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create tasksV3 table
CREATE TABLE `tasksV3` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `task_title` VARCHAR(100) NOT NULL,
  `task_description` VARCHAR(500) DEFAULT NULL,
  `task_assignees` TINYTEXT DEFAULT NULL,
  `task_status_id` INT,
  `created_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `board_id` varchar(10) NOT NULL,
  FOREIGN KEY (`task_status_id`) REFERENCES `status`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`board_id`) REFERENCES `board`(`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create collaborators table
CREATE TABLE `collaborators` (
  `collab_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `board_id` VARCHAR(10) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `access_right` ENUM('READ', 'WRITE') NOT NULL DEFAULT 'READ',
  `added_on` DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`board_id`) REFERENCES `board`(`board_id`),
  FOREIGN KEY (`user_id`) REFERENCES `usersLocal`(`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add trigger to add default statuses
DELIMITER //

CREATE TRIGGER `add_default_statuses` AFTER INSERT ON `board`
FOR EACH ROW
BEGIN
  INSERT INTO `status` (`status_name`, `status_description`, `board_id`)
  VALUES 
    ('No Status', 'A status has not been assigned', NEW.board_id),
    ('To Do', 'The task is included in the project', NEW.board_id),
    ('Doing', 'The task is being worked on', NEW.board_id),
    ('Done', 'The task has been completed', NEW.board_id);
END //

DELIMITER ;

COMMIT;



