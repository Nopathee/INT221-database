DROP TABLE IF EXISTS `tasksV2`;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `status` (
`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
`statusName` VARCHAR(50) NOT NULL UNIQUE,
`statusDescription` VARCHAR(200) ,
`created_on` datetime DEFAULT CURRENT_TIMESTAMP,
`updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tasksV2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_title` varchar(100) NOT NULL,
  `task_description` varchar(500) DEFAULT NULL,
  `task_assignees` tinytext DEFAULT NULL,
  `task_status_id` int, 
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`task_status_id`) REFERENCES `status`(`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_title` varchar(100) NOT NULL,
  `task_description` varchar(500) DEFAULT NULL,
  `task_assignees` tinytext DEFAULT NULL,
  `task_status` enum('NO_STATUS','TO_DO','DOING','DONE') DEFAULT 'NO_STATUS',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `status` (`statusName`, `statusDescription`)
VALUES 
( 'No Status', 'The default status'),
( 'To Do', null),
( 'Doing', 'Being worked on'),
( 'Done', 'Finished');

INSERT INTO `tasksV2` (`task_title`, `task_description`, `task_assignees`, `task_status_id`, `created_on`, `updated_on`)
VALUES 
('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
'Assignees1Assignees2Assignees3',
1, 
'2024-04-22 09:00:00',
'2024-04-22 09:00:00'),
('Repository', '', '', 2, 
'2024-04-22 09:05:00',
'2024-04-22 14:00:00'),
('ดาต้าเบส', 'ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)', 3, 
'2024-04-22 09:10:00',
'2024-04-25 00:00:00'),
('_Infrastructure_', '_Setup containers_', 'ไก่งวง กับ เพนกวิน', 4, 
'2024-04-22 09:15:00',
'2024-04-22 10:00:00');

INSERT INTO `tasks` VALUES (
1,'TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
'Assignees1Assignees2Assignees3',
'NO_STATUS',
'2024-04-22 09:00:00',
'2024-04-22 09:00:00'),
(2,'Repository','','',
'TO_DO','2024-04-22 09:05:00',
'2024-04-22 14:00:00'),
(3,'ดาต้าเบส','ສ້າງຖານຂໍ້ມູນ',
'あなた、彼、彼女 (私ではありません)',
'DOING','2024-04-22 09:10:00',
'2024-04-25 00:00:00'),
(4,'_Infrastructure_',
'_Setup containers_',
'ไก่งวง กับ เพนกวิน','DONE',
'2024-04-22 09:15:00',
'2024-04-22 10:00:00');

commit;

