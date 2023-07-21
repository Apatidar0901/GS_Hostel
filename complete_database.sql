CREATE TABLE `Application` ( 
    `Application_id` int(100) NOT NULL, 
    `Student_id` varchar(255) NOT NULL, 
    `Hostel_id` int(10) NOT NULL, 
    `Application_status` tinyint(1) DEFAULT NULL, 
    `Room_No` int(10) DEFAULT NULL, 
    `Message` varchar(255) DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Hostel` (
    `Hostel_id` int(10) NOT NULL,
    `Hostel_name` varchar(255) NOT NULL,
    `No_of_rooms` varchar(255) DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Hostel` (`Hostel_id`, `Hostel_name`, `No_of_rooms`) VALUES 
(1, 'BH1', '400'), 
(2, 'BH2', '400'),
(3, 'BH3', '400'), 
(4, 'BH4', '400');

CREATE TABLE `Message` ( 
    `msg_id` int(10) NOT NULL,
    `sender_id` varchar(255) DEFAULT NULL, 
    `receiver_id` varchar(255) DEFAULT NULL, 
    `hostel_id` int(10) DEFAULT NULL, 
    `subject_h` varchar(255) DEFAULT NULL, 
    `message` varchar(255) DEFAULT NULL, 
    `msg_date` varchar(255) DEFAULT NULL, 
    `msg_time` varchar(255) DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Room` ( 
    `Room_id` int(10) NOT NULL, 
    `Hostel_id` int(10) NOT NULL, 
    `Room_No` int(10) NOT NULL, 
    `ALLocated` tinyint (1) DEFAULT '0' 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Student` ( 
    `Student_id` varchar(255) NOT NULL, 
    `Fname` varchar(255) NOT NULL, 
    `Lname` varchar(255) NOT NULL,
    `Mob_no` varchar(255) NOT NULL,
    `Dept` varchar(255) NOT NULL, 
    `Year_of_study` varchar(255) NOT NULL,
    `Pwd` Longtext NOT NULL, 
    `Hostel_id` int(10) DEFAULT NULL,
    `Room_id` int(10) DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Application`
    ADD PRIMARY KEY (`Application_id`),
    ADD KEY `Student_id` (`Student_id`),
    ADD KEY `Hostel_id` (`Hostel_id`);

ALTER TABLE `Hostel`
    ADD PRIMARY KEY (`Hostel_id`);
    
ALTER TABLE `Message`
    ADD PRIMARY KEY (`msg_id`),
    ADD KEY `hostel_id` (`hostel_id`);


ALTER TABLE `Room`
    ADD PRIMARY KEY (`Room_id`), 
    ADD KEY `Hostel_id` (`Hostel_id`);

ALTER TABLE `Student`
    ADD PRIMARY KEY (`Student_id`), 
    ADD KEY `Hostel_id` (`Hostel_id`), 
    ADD KEY `Room_id` (`Room_id`);

ALTER TABLE `Application`
    MODIFY `Application_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `Hostel`
    MODIFY `Hostel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `Message` 
    MODIFY `msg_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `Room` 
    MODIFY `Room_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `Application` 
    ADD CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`student_id`), 
    ADD CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`hostel_id`);

ALTER TABLE `Message` 
    ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `Hostel` (`hostel_id`);

ALTER TABLE `Room`
    ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`hostel_id`);

ALTER TABLE `Student` 
    ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`hostel_id`),
    ADD CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `Room` (`room_id`);