/*
SQLyog Trial v13.2.1 (64 bit)
MySQL - 8.0.37 : Database - api_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`api_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `api_db`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int NOT NULL,
  `account_number` int NOT NULL,
  `account_title` varchar(64) NOT NULL,
  `iban` varchar(64) DEFAULT NULL,
  `branch` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `account` */

/*Table structure for table `account_statement` */

DROP TABLE IF EXISTS `account_statement`;

CREATE TABLE `account_statement` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `current_balance` decimal(10,2) NOT NULL,
  `debit_amount` decimal(10,2) DEFAULT NULL,
  `credit_amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `account_statement` */

/*Table structure for table `activity_log` */

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` int NOT NULL,
  `text_log` varchar(255) DEFAULT NULL,
  `error_code` varchar(255) DEFAULT NULL,
  `response_code` varchar(255) DEFAULT NULL,
  `chatbot_response` varchar(255) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_request` varchar(255) DEFAULT NULL,
  `stampdate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `activity_log` */

/*Table structure for table `auto` */

DROP TABLE IF EXISTS `auto`;

CREATE TABLE `auto` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `engine_size` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `expected_delivery_day` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auto` */

/*Table structure for table `auto_loan` */

DROP TABLE IF EXISTS `auto_loan`;

CREATE TABLE `auto_loan` (
  `id` int NOT NULL,
  `auto_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `down_payment` decimal(10,2) NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `active` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `principal_amount` decimal(10,2) DEFAULT NULL,
  `tenure` int DEFAULT NULL,
  `insurance_rate` decimal(10,2) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auto_loan` */

/*Table structure for table `bot_conversation` */

DROP TABLE IF EXISTS `bot_conversation`;

CREATE TABLE `bot_conversation` (
  `id` int NOT NULL,
  `conversation_type` varchar(255) DEFAULT NULL,
  `whatsapp_bot_script` varchar(255) DEFAULT NULL,
  `opt_1` varchar(255) DEFAULT NULL,
  `opt_2` varchar(255) DEFAULT NULL,
  `opt_3` varchar(255) DEFAULT NULL,
  `opt_4` varchar(255) DEFAULT NULL,
  `opt_1_res` varchar(255) DEFAULT NULL,
  `opt_2_res` varchar(255) DEFAULT NULL,
  `opt_3_res` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `active` int DEFAULT NULL,
  `amount` float NOT NULL,
  `customer_id` int DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `maturity_date` datetime(6) DEFAULT NULL,
  `rate` float NOT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `tdr_id` int DEFAULT NULL,
  `tdr_number` int DEFAULT NULL,
  `zakat_examption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bot_conversation` */

insert  into `bot_conversation`(`id`,`conversation_type`,`whatsapp_bot_script`,`opt_1`,`opt_2`,`opt_3`,`opt_4`,`opt_1_res`,`opt_2_res`,`opt_3_res`,`remarks`,`account_id`,`active`,`amount`,`customer_id`,`instruction`,`maturity_date`,`rate`,`tax`,`tdr_id`,`tdr_number`,`zakat_examption`) values 
(1,'Introduction Message','Hi (XXXX)! My name is Alfie','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(2,'Introduction Pitch','hope you are doing well, I am here to help you for your investments,do you want to continue?','Yes','No','','','3','4','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(3,'Option 1 Response','May I know how much you save per month ?','Customer Input','','','','5','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(4,'Option 2 Response','No issue we wish you a very good day !','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(5,'Option 1 Response','Considering your monthly savings of xxxxx you can invest in :','Multiply your savings','Own your dream Car','Not Intrested','','6','','','Based on customer input Values result will be populated i.e. Any value <150,000 will only show TDR else Both',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(6,'Option 1 Response','Considering your XXX savings how much do you want to invest to get Max return.','Customer Input','','','','','','','TDR Module',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(7,'Option 1 Response','At what payment frequency you want to invest','Monthly ','At Maturity','','','8','8','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(8,'','Based on the formulla Monthlty table will populate with return amount for 3 Months,6 Months,1 Year','','','','','','','','Customer can choose any of the options',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(9,'Option 1,2 or 3 Response','Based on your savings, frequency & tenure selection your return would be XXX','3 Months','6 Months','1 Year','Not Intrested','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(10,'Option Response based on Customer input','Please confirm your TDR booking for (X Tenure) with return off saving (XXX)  ','Yes','No','Not Intrested','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(11,'Success Response','Congratulations your TDR has been booked. Happy Savings! :) ','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(12,'Own Your Dream Car Module ','Since your montly savings are off XXXXX, you are eligible to own your dream car on easily installments','Yes','','','','5','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(13,'Option 1 Response','Cars','Option selection','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(14,'Option 1 Response','kindly let me know to own your (Car Name) you wish to own on how many years of installment plans?','Two Years','Five Years','Seven Years','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(15,'Option Response based on Customer input','Based on the formulla Monthlty table will populate with return amount for 2 years, 5 Years and Seven Years calculation will Populate ','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(16,'Option 1,2 or 3 Response','Based on your car selection &  installment plan tenure selection your monthly Instalment will be (XXX)','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(17,'Option Response based on Customer input','Please confirm your Car  booking for (X Tenure) with monthly Instalment of  (XXX)  ','Yes','No','Not Intrested','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),
(18,'Success Response','Congratulations your dream car has been booked and your first installment is deducted.Our representative will connect with you soon ! Happy Drive! :) ','','','','','','','','',NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL);

/*Table structure for table `bot_conversion` */

DROP TABLE IF EXISTS `bot_conversion`;

CREATE TABLE `bot_conversion` (
  `id` int NOT NULL,
  `conversation_type` varchar(255) DEFAULT NULL,
  `opt_1` varchar(255) DEFAULT NULL,
  `opt_1_res` varchar(255) DEFAULT NULL,
  `opt_2` varchar(255) DEFAULT NULL,
  `opt_2_res` varchar(255) DEFAULT NULL,
  `opt_3` varchar(255) DEFAULT NULL,
  `opt_3_res` varchar(255) DEFAULT NULL,
  `opt_4` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `whatsapp_bot_script` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `bot_conversion` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cnic` varchar(255) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `age` varchar(255) DEFAULT NULL,
  `account_number` varchar(64) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `loginname` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salary` int NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `mobile_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`cnic`,`mobile_number`,`age`,`account_number`,`gender`,`email`,`loginname`,`password`,`salary`,`account_no`,`login_name`,`mobile_no`,`mobile_`) values 
(1,'Kashan','4210111111111`','3321111111','24','40011212121121','Male','kashan@gmail.com','KASHAN123','pakistan123',20000,NULL,NULL,NULL,NULL),
(2,'kashan','4210116828888','0332123123','10','4210101','male','kashan@gmail.com','KASHAN','121212',25000,NULL,NULL,NULL,NULL);

/*Table structure for table `customerchatlog` */

DROP TABLE IF EXISTS `customerchatlog`;

CREATE TABLE `customerchatlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stampdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `chatbot_response` varchar(255) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_request` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customerchatlog` */

insert  into `customerchatlog`(`id`,`stampdate`,`chatbot_response`,`customer_id`,`customer_request`) values 
(1,'2024-05-23 16:30:21','Fine',1,'Hello How are you'),
(2,'2024-05-23 16:25:58','Not Fine',1,'Hello How are you');

/*Table structure for table `payment_schedule` */

DROP TABLE IF EXISTS `payment_schedule`;

CREATE TABLE `payment_schedule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `auto_loan_id` int NOT NULL,
  `monthly_installment` decimal(10,2) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `installment_number` int DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `payment_schedule` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`) values 
(1,'TDR','A term deposit is a fixed investment where a sum of money is deposited with a financial institution for a predetermined period, earning a fixed interest rate. Funds cannot be withdrawn without penalty until the maturity date, providing stable returns and capital preservation.'),
(2,'Auto Loan','A car loan is a type of financing provided by banks or lenders to help individuals purchase a vehicle, typically requiring regular installment payments over a fixed term. The loan is secured by the vehicle itself, with the possibility of repossession if payments are not made according to the agreed terms.');

/*Table structure for table `tdr` */

DROP TABLE IF EXISTS `tdr`;

CREATE TABLE `tdr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tenure` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `rate` float NOT NULL,
  `monthly_payout` varchar(255) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tdr` */

insert  into `tdr`(`id`,`product_id`,`name`,`tenure`,`active`,`rate`,`monthly_payout`,`add_date`,`edit_date`) values 
(1,1,'TDR','1 year','active',20.5,'No','2024-05-18 10:29:40',NULL),
(2,1,'TDR','6 Months','active',19.5,'No','2024-05-18 10:29:40',NULL),
(3,1,'TDR','1 Month','active',18.5,'Yes','2024-05-18 10:29:40',NULL);

/*Table structure for table `tdr_booking` */

DROP TABLE IF EXISTS `tdr_booking`;

CREATE TABLE `tdr_booking` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tdr_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `tdr_number` int NOT NULL,
  `account_id` int NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `maturity_date` datetime DEFAULT NULL,
  `active` int DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `rate` float NOT NULL,
  `amount` float NOT NULL,
  `zakat_examption` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tdr_booking` */

insert  into `tdr_booking`(`id`,`tdr_id`,`customer_id`,`tdr_number`,`account_id`,`add_date`,`edit_date`,`maturity_date`,`active`,`instruction`,`rate`,`amount`,`zakat_examption`,`tax`) values 
(1,123,123,123,123,NULL,NULL,'2024-05-30 05:00:00',1,'Rollover',19.9,5000.5,'Yes','5'),
(2,123,123,123,123,NULL,NULL,'2024-05-30 05:00:00',1,'Rollover',19.9,5000.5,'Yes','5');

/*Table structure for table `tdr_booking_copy1` */

DROP TABLE IF EXISTS `tdr_booking_copy1`;

CREATE TABLE `tdr_booking_copy1` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tdr_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `tdr_number` int NOT NULL,
  `account_id` int NOT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `maturity_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `instruction` enum('Rollover','Encash Maturity','Rollover Principal + Profit') DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `zakat_examption` enum('Yes','No') DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tdr_booking_copy1` */

/*Table structure for table `tdrbooking` */

DROP TABLE IF EXISTS `tdrbooking`;

CREATE TABLE `tdrbooking` (
  `id` int NOT NULL,
  `account_id` int DEFAULT NULL,
  `active` int DEFAULT NULL,
  `amount` float NOT NULL,
  `customer_id` int DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `maturity_date` datetime(6) DEFAULT NULL,
  `rate` float NOT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `tdr_id` int DEFAULT NULL,
  `tdr_number` int DEFAULT NULL,
  `zakat_examption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tdrbooking` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
