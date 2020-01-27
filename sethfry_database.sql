CREATE SCHEMA IF NOT EXISTS `SETHFRY`;

    CREATE TABLE IF NOT EXISTS `SETHFRY`.`CUSTOMER` (
	`SSN` INT NOT NULL,
    `NAME` VARCHAR(45) DEFAULT NULL,
    `PHONE` VARCHAR(45) DEFAULT NULL,
    `EMAIL` VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (`SSN`))
    ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    CREATE TABLE IF NOT EXISTS `SETHFRY`.`EMPLOYEE` (
    `EmpID` INT NOT NULL,
    `firstName` VARCHAR(45) DEFAULT NULL,
    `lastName` VARCHAR(45) DEFAULT NULL,
    `title` VARCHAR(45) DEFAULT NULL,
    `years` VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (`EmpID`)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    CREATE TABLE IF NOT EXISTS `SETHFRY`.`ORDER` (
    `OrderNo` INT NOT NULL,
    `Date` VARCHAR(45) DEFAULT NULL,
    `SSN` INT DEFAULT NULL,
    PRIMARY KEY( `OrderNo`),
    KEY `SSN_idx` (`SSN`),
    CONSTRAINT `SSN` 
    FOREIGN KEY (`SSN`)
    REFERENCES `CUSTOMER`(`SSN`)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
    
    CREATE TABLE IF NOT EXISTS `SETHFRY`.`VENDOR` (
    `VID` INT NOT NULL,
	`VendorName` VARCHAR(45) DEFAULT NULL,
    `phone` VARCHAR(45) DEFAULT NULL,
    `email` VARCHAR(45) DEFAULT NULL,
    `size` VARCHAR(45) DEFAULT NULL,
    `EmpID` INT DEFAULT NULL,
    Primary Key(`VID`),
    KEY `EmpID_idx` (`EmpID`),
    CONSTRAINT `EmpID` 
    FOREIGN KEY (`EmpID`) 
    REFERENCES `EMPLOYEE`(`EmpID`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
	CREATE TABLE IF NOT EXISTS `SETHFRY`.`ITEM` (
    `SKU` INT NOT NULL,
    `ItemName` VARCHAR(45) DEFAULT NULL,
    `Price` VARCHAR(45) DEFAULT NULL,
    `VID` INT DEFAULT NULL,
    Primary Key(`SKU`),
    KEY `VID_idx` (`VID`),
    CONSTRAINT `VID` FOREIGN KEY (`VID`) REFERENCES `VENDOR` (`VID`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    CREATE TABLE IF NOT EXISTS `SETHFRY`.`ORDER_ITEM` (
    `OrderNumber` INT NOT NULL,
    `SKU` INT NOT NULL,
    PRIMARY KEY (`OrderNumber`, `SKU`),
    INDEX `OrderNumber_idx` (`OrderNumber`),
    CONSTRAINT `OrderNumber`
    FOREIGN KEY (`OrderNumber`)
	REFERENCES `Order`(`OrderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `SKU`
    FOREIGN KEY (`SKU`)
    REFERENCES `ITEM` (`SKU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    

    CREATE TABLE IF NOT EXISTS `SETHFRY`.`ORDER_EMP` (
    `OID` INT NOT NULL,
    `EID` INT NOT NULL,
    PRIMARY KEY (`OID`,`EID`),
    INDEX `OID_idx` (`OID`),
    CONSTRAINT `OID`
    FOREIGN KEY (`OID`)
    REFERENCES `ORDER` (`OrderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `EID`
    FOREIGN KEY (`EID`)
    REFERENCES `EMPLOYEE` (`EmpID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    INSERT INTO `CUSTOMER` (`SSN`,`NAME`,`PHONE`,`EMAIL`) 
	VALUES (123456789, "Ian Mcman", "1234567891", "IanMcman@job.com");
    
     INSERT INTO `CUSTOMER` (`SSN`,`NAME`,`PHONE`,`EMAIL`) 
	VALUES (123456788, "Camy Cargill ", "1234567890", "CamyGargill@job.com");
    
     INSERT INTO `CUSTOMER` (`SSN`,`NAME`,`PHONE`,`EMAIL`) 
	VALUES (123456787, "Cam Barnes", "1234567897", "CamBarnes@job.com");
    
     INSERT INTO `CUSTOMER` (`SSN`,`NAME`,`PHONE`,`EMAIL`) 
	VALUES (123456779, "Blake Krc", "1234567896", "BlakeKrc@job.com");
    
     INSERT INTO `CUSTOMER` (`SSN`,`NAME`,`PHONE`,`EMAIL`) 
	VALUES (123456769, "Ospry Aspen", "1234567881", "OspryAspen@job.com");
    
     INSERT INTO `EMPLOYEE` (`EmpID`,`firstName`,`lastName`,`title`, `years`) 
	VALUES (1, "Luke", "Skywalker", "Soldier", "6");
    
    INSERT INTO `EMPLOYEE` (`EmpID`,`firstName`,`lastName`,`title`, `years`) 
	VALUES (2, "Leia", "Skywalker", "Princess", "8");
    
    INSERT INTO `EMPLOYEE` (`EmpID`,`firstName`,`lastName`,`title`, `years`) 
	VALUES (3, "Han", "Solo", "Pilot", "9");
    
    INSERT INTO `EMPLOYEE` (`EmpID`,`firstName`,`lastName`,`title`, `years`) 
	VALUES (4, "Chewbacca", "Kashyyk", "Smuggler", "100");
    
    INSERT INTO `EMPLOYEE` (`EmpID`,`firstName`,`lastName`,`title`, `years`) 
	VALUES (5, "Anikan", "Skywalker", "Dark Lord", "25");
    
    INSERT INTO `ORDER` (`OrderNo`, `DATE`,`SSN`)
    VALUES (1,"1/1/2019",123456789);
    
    INSERT INTO `ORDER` (`OrderNo`, `DATE`, `SSN`)
	VALUES (2,"2/2/2019",123456789);
    
    INSERT INTO `ORDER` (`OrderNo`, `DATE`, `SSN`)
	VALUES (3,"3/3/2019",123456789);
    
    INSERT INTO `ORDER` (`OrderNo`, `DATE`, `SSN`)
	VALUES (4,"4/4/2019",123456789);
    
    INSERT INTO `ORDER` (`OrderNo`, `DATE`, `SSN`)
	VALUES (5,"5/5/2019",123456789);
    
    INSERT INTO `VENDOR` (`VID`,`VendorName`,`phone`,`email`,`size`,`EmpID`)
    VALUES (1,"truckster","1111111111", "truckersters@gmail.com", "Small", 1);
    
    INSERT INTO `VENDOR` (`VID`,`VendorName`,`phone`,`email`,`size`,`EmpID`)
    VALUES (2,"boatster", "222222222","Boatster@gmail.com", "medium", 2);
    
     INSERT INTO `VENDOR` (`VID`,`VendorName`,`phone`,`email`,`size`,`EmpID`)
    VALUES (3,"planester", "3333333333", "planster@gmail.com", "large", 3);
    
     INSERT INTO `VENDOR` (`VID`,`VendorName`,`phone`,`email`,`size`,`EmpID`)
    VALUES (4, "Premium Fuels", "4444444444", "PremiumFuels@gmail.com", "small",4);
    
     INSERT INTO `VENDOR` (`VID`,`VendorName`,`phone`,`email`,`size`,`EmpID`)
    VALUES(5, "Food Man", "5555555555", "FOODMAN@gmail.com","small", 5);
    
    INSERT INTO `ITEM` (`SKU`, `ItemName`, `Price`, `VID`)
    VALUES (1,"pizza","3.40",5);
    
     INSERT INTO `ITEM` (`SKU`, `ItemName`, `Price`, `VID`)
    VALUES (2,"gas","2.53",4);
    
       INSERT INTO `ITEM` (`SKU`, `ItemName`, `Price`, `VID`)
    VALUES (3,"Fusalage","70000",3);
    
       INSERT INTO `ITEM` (`SKU`, `ItemName`, `Price`, `VID`)
    VALUES (4,"Speed Heist Boat","40000",2);
    
       INSERT INTO `ITEM` (`SKU`, `ItemName`, `Price`, `VID`)
    VALUES (5,"Speed Heist Truck","35000",1);
    
    INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`)
    VALUES (2,1);
    
    INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`)
    VALUES (3,2);
    
    INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`)
    VALUES (1,3);
    
    INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`)
    VALUES (4,5);
    
    INSERT INTO `ORDER_ITEM` (`OrderNumber`, `SKU`)
    VALUES (5,4);
    
    INSERT INTO `ORDER_EMP` (`OID`, `EID`)
    VALUES (1,2);
    
     INSERT INTO `ORDER_EMP` (`OID`, `EID`)
    VALUES (2,1);
    
     INSERT INTO `ORDER_EMP` (`OID`, `EID`)
    VALUES (3,4);
    
     INSERT INTO `ORDER_EMP` (`OID`, `EID`)
    VALUES (4,3);
    
     INSERT INTO `ORDER_EMP` (`OID`, `EID`)
    VALUES (5,5);
    