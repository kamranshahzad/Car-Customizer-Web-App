/*
MySQL Data Transfer
Source Host: localhost
Source Database: addoncars_new
Target Host: localhost
Target Database: addoncars_new
Date: 4/21/2011 9:01:11 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for acl_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `acl_dashboard`;
CREATE TABLE `acl_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for acl_permissions
-- ----------------------------
DROP TABLE IF EXISTS `acl_permissions`;
CREATE TABLE `acl_permissions` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `permission` longtext NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for acl_resources
-- ----------------------------
DROP TABLE IF EXISTS `acl_resources`;
CREATE TABLE `acl_resources` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) NOT NULL,
  `actions` longtext NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for acl_roles
-- ----------------------------
DROP TABLE IF EXISTS `acl_roles`;
CREATE TABLE `acl_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `iscp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for backgrounds
-- ----------------------------
DROP TABLE IF EXISTS `backgrounds`;
CREATE TABLE `backgrounds` (
  `background_id` int(11) NOT NULL AUTO_INCREMENT,
  `bg_name` varchar(255) NOT NULL,
  `bg_image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`background_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for canves_backgrounds
-- ----------------------------
DROP TABLE IF EXISTS `canves_backgrounds`;
CREATE TABLE `canves_backgrounds` (
  `canves_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `background_id` int(11) NOT NULL,
  `coordinates` longtext NOT NULL,
  PRIMARY KEY (`canves_id`)
) ENGINE=MyISAM AUTO_INCREMENT=654 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `interior_colors_id` int(11) NOT NULL,
  `exterior_colors_id` int(11) NOT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=MyISAM AUTO_INCREMENT=653 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for commisions
-- ----------------------------
DROP TABLE IF EXISTS `commisions`;
CREATE TABLE `commisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'p',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deal_accessories
-- ----------------------------
DROP TABLE IF EXISTS `deal_accessories`;
CREATE TABLE `deal_accessories` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `part_type` varchar(100) NOT NULL,
  `part_id` int(11) NOT NULL,
  `isset` varchar(50) NOT NULL,
  `purchase` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deal_details
-- ----------------------------
DROP TABLE IF EXISTS `deal_details`;
CREATE TABLE `deal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `sp_first_name` varchar(50) DEFAULT NULL,
  `sp_last_name` varchar(50) DEFAULT NULL,
  `c_first_name` varchar(50) DEFAULT NULL,
  `c_last_name` varchar(50) DEFAULT NULL,
  `c_email` varchar(80) DEFAULT NULL,
  `c_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deal_status
-- ----------------------------
DROP TABLE IF EXISTS `deal_status`;
CREATE TABLE `deal_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deal_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `pending_datetime` datetime DEFAULT NULL,
  `open_datetime` datetime DEFAULT NULL,
  `complete_datetime` datetime DEFAULT NULL,
  `finalized_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deals
-- ----------------------------
DROP TABLE IF EXISTS `deals`;
CREATE TABLE `deals` (
  `deal_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `uname` varchar(50) NOT NULL,
  PRIMARY KEY (`deal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for exterior_colors
-- ----------------------------
DROP TABLE IF EXISTS `exterior_colors`;
CREATE TABLE `exterior_colors` (
  `exterior_colors_id` int(11) NOT NULL AUTO_INCREMENT,
  `trim_id` int(11) NOT NULL,
  `color_label` varchar(255) NOT NULL,
  `color_code` varchar(255) NOT NULL,
  PRIMARY KEY (`exterior_colors_id`)
) ENGINE=MyISAM AUTO_INCREMENT=502 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for install
-- ----------------------------
DROP TABLE IF EXISTS `install`;
CREATE TABLE `install` (
  `install_id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `complete` int(11) NOT NULL DEFAULT '0',
  `iDate` datetime NOT NULL,
  PRIMARY KEY (`install_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for installation_parts
-- ----------------------------
DROP TABLE IF EXISTS `installation_parts`;
CREATE TABLE `installation_parts` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `install_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `installer_id` int(11) NOT NULL DEFAULT '0',
  `isdone` int(11) NOT NULL DEFAULT '0',
  `ptime` int(11) NOT NULL,
  `pdate` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for interior_colors
-- ----------------------------
DROP TABLE IF EXISTS `interior_colors`;
CREATE TABLE `interior_colors` (
  `interior_colors_id` int(11) NOT NULL AUTO_INCREMENT,
  `trim_id` int(11) NOT NULL,
  `color_label` varchar(255) NOT NULL,
  `color_image` varchar(255) NOT NULL,
  PRIMARY KEY (`interior_colors_id`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(25) NOT NULL,
  `deal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for makes
-- ----------------------------
DROP TABLE IF EXISTS `makes`;
CREATE TABLE `makes` (
  `make_id` int(11) NOT NULL AUTO_INCREMENT,
  `make_name` varchar(255) NOT NULL,
  `make_des` varchar(255) NOT NULL,
  `make_icon` varchar(255) NOT NULL,
  PRIMARY KEY (`make_id`),
  KEY `mid` (`make_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for models
-- ----------------------------
DROP TABLE IF EXISTS `models`;
CREATE TABLE `models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `make_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `model_image` varchar(255) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `des` varchar(200) DEFAULT NULL,
  `dates` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '0',
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_assets
-- ----------------------------
DROP TABLE IF EXISTS `part_assets`;
CREATE TABLE `part_assets` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL,
  `FrontView` varchar(255) NOT NULL,
  `RearView` varchar(255) NOT NULL,
  `InteriorView` varchar(255) NOT NULL,
  `OtherView` varchar(255) NOT NULL,
  `FVIEW` varchar(255) NOT NULL,
  `RVIEW` varchar(255) NOT NULL,
  `IVIEW` varchar(255) NOT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_categories
-- ----------------------------
DROP TABLE IF EXISTS `part_categories`;
CREATE TABLE `part_categories` (
  `part_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_type_id` int(11) NOT NULL,
  `part_category_name` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `t` varchar(10) NOT NULL DEFAULT 'p',
  PRIMARY KEY (`part_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_dimentions
-- ----------------------------
DROP TABLE IF EXISTS `part_dimentions`;
CREATE TABLE `part_dimentions` (
  `dimentions_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL,
  `FrontView` text NOT NULL,
  `RearView` text NOT NULL,
  `InteriorView` text NOT NULL,
  `OtherView` text NOT NULL,
  `FVIEW` text NOT NULL,
  `RVIEW` text NOT NULL,
  `IVIEW` text NOT NULL,
  PRIMARY KEY (`dimentions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `part_manufacturer`;
CREATE TABLE `part_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) NOT NULL,
  `notes` text,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_sets
-- ----------------------------
DROP TABLE IF EXISTS `part_sets`;
CREATE TABLE `part_sets` (
  `part_id` int(11) NOT NULL,
  `set_ids` varchar(255) NOT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for part_types
-- ----------------------------
DROP TABLE IF EXISTS `part_types`;
CREATE TABLE `part_types` (
  `part_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_type_name` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`part_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for parts
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `part_category_id` int(11) NOT NULL,
  `effected` int(11) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `part_manufacturer` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `part_icon` varchar(255) NOT NULL,
  `part_price` float NOT NULL,
  `montly_price` float NOT NULL,
  `is_set` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`part_id`)
) ENGINE=MyISAM AUTO_INCREMENT=337 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for swapper
-- ----------------------------
DROP TABLE IF EXISTS `swapper`;
CREATE TABLE `swapper` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `swap_text` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for trim
-- ----------------------------
DROP TABLE IF EXISTS `trim`;
CREATE TABLE `trim` (
  `trim_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `trim_name` varchar(255) NOT NULL,
  PRIMARY KEY (`trim_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_backgrounds
-- ----------------------------
DROP TABLE IF EXISTS `user_backgrounds`;
CREATE TABLE `user_backgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `background_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_defaults
-- ----------------------------
DROP TABLE IF EXISTS `user_defaults`;
CREATE TABLE `user_defaults` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `background_id` int(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_details
-- ----------------------------
DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '_blank',
  `address` varchar(200) NOT NULL DEFAULT '_blank',
  `city` varchar(100) NOT NULL DEFAULT '_blank',
  `state` varchar(100) NOT NULL DEFAULT '_blank',
  `zip` varchar(50) NOT NULL DEFAULT '_blank',
  `phone` varchar(100) NOT NULL DEFAULT '_blank',
  `web_url` varchar(100) NOT NULL DEFAULT '_blank',
  `logo_img` varchar(255) NOT NULL DEFAULT '_blank',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_part_categories
-- ----------------------------
DROP TABLE IF EXISTS `user_part_categories`;
CREATE TABLE `user_part_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `part_category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_part_manufactures
-- ----------------------------
DROP TABLE IF EXISTS `user_part_manufactures`;
CREATE TABLE `user_part_manufactures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL DEFAULT 'NULL',
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_part_types
-- ----------------------------
DROP TABLE IF EXISTS `user_part_types`;
CREATE TABLE `user_part_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `part_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_parts
-- ----------------------------
DROP TABLE IF EXISTS `user_parts`;
CREATE TABLE `user_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `part_type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `part_price` varchar(100) NOT NULL,
  `monthly_price` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_wheel_types
-- ----------------------------
DROP TABLE IF EXISTS `user_wheel_types`;
CREATE TABLE `user_wheel_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `wheel_type_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL DEFAULT '0',
  `uname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(35) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for variable
-- ----------------------------
DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `trim_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `front_big_img` varchar(255) NOT NULL,
  `rear_big_img` varchar(255) NOT NULL,
  `interior_big_img` varchar(255) NOT NULL,
  `front_small_img` varchar(255) NOT NULL,
  `rear_small_img` varchar(255) NOT NULL,
  `interior_small_img` varchar(255) NOT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=670 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wheel_assets
-- ----------------------------
DROP TABLE IF EXISTS `wheel_assets`;
CREATE TABLE `wheel_assets` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `wheel_id` int(11) NOT NULL,
  `FrontView` varchar(255) NOT NULL,
  `RearView` varchar(255) NOT NULL,
  `InteriorView` varchar(255) NOT NULL,
  `OtherView` varchar(255) NOT NULL,
  `FVIEW` varchar(255) NOT NULL,
  `RVIEW` varchar(255) NOT NULL,
  `IVIEW` varchar(255) NOT NULL,
  PRIMARY KEY (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wheel_dimentions
-- ----------------------------
DROP TABLE IF EXISTS `wheel_dimentions`;
CREATE TABLE `wheel_dimentions` (
  `dimentions_id` int(11) NOT NULL AUTO_INCREMENT,
  `wheel_id` int(11) NOT NULL,
  `FrontView` text NOT NULL,
  `RearView` text NOT NULL,
  `InteriorView` text NOT NULL,
  `OtherView` text NOT NULL,
  `FVIEW` text NOT NULL,
  `RVIEW` text NOT NULL,
  `IVIEW` text NOT NULL,
  PRIMARY KEY (`dimentions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wheel_types
-- ----------------------------
DROP TABLE IF EXISTS `wheel_types`;
CREATE TABLE `wheel_types` (
  `wheel_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_category_id` int(11) NOT NULL,
  `wheel_type_name` varchar(255) NOT NULL,
  `des` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`wheel_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wheels
-- ----------------------------
DROP TABLE IF EXISTS `wheels`;
CREATE TABLE `wheels` (
  `wheel_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `wheel_type_id` int(11) NOT NULL,
  `effected` int(11) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `part_manufacturer` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `part_icon` varchar(255) NOT NULL,
  `part_price` float NOT NULL,
  `montly_price` float NOT NULL,
  PRIMARY KEY (`wheel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for years
-- ----------------------------
DROP TABLE IF EXISTS `years`;
CREATE TABLE `years` (
  `year_id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `des` varchar(255) NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Procedure structure for CreateAccessory
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateAccessory`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `CreateAccessory`(PartID INTEGER ,PartType VARCHAR(100) , PartLbl VARCHAR(100) , SKU VARCHAR(100) , Description VARCHAR(150), PartPrice1 Float , PartPrice2 Float)
BEGIN
	DECLARE UserId INTEGER;
	DECLARE no_more_rows BOOLEAN;
	DECLARE num INTEGER;
	DECLARE userTblCur  CURSOR FOR SELECT uid FROM users;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN userTblCur;

	loop_cur_res: LOOP
        	FETCH   userTblCur  INTO  UserId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	-- INSERT INTO dealer_parts  VALUES (NULL , PartID  , uid , PartType ,  PartLbl , SKU , 0 , Description , PartPrice1 , PartPrice2 );
        INSERT INTO dealer_parts  VALUES (NULL , 20  , UserId  , PartType ,  PartLbl , SKU , 0 , Description , PartPrice1 , PartPrice2 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE userTblCur;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for CreateUserP
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateUserP`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `CreateUserP`(  UserID INTEGER )
BEGIN
	DECLARE PartID INTEGER;
	DECLARE PartLbl VARCHAR(150);
	DECLARE SKUNo VARCHAR (100);
	DECLARE Des VARCHAR(150);
	DECLARE PartPrice1 FLOAT;
	DECLARE PartPrice2 FLOAT;
	DECLARE no_more_rows BOOLEAN;
	DECLARE num INTEGER;
	DECLARE PartTblCur CURSOR FOR SELECT part_id,part_name,description,sku,part_price,montly_price FROM parts;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN PartTblCur;

	loop_cur_res: LOOP
        	FETCH   PartTblCur INTO  PartID,PartLbl,Des,SKUNo,PartPrice1,PartPrice2;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO dealer_parts  VALUES (NULL , PartID  , UserID  ,'p' ,  PartLbl , SKUNo ,0, Des  , PartPrice1 , PartPrice2 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE PartTblCur;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for CreateUserW
-- ----------------------------
DROP PROCEDURE IF EXISTS `CreateUserW`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `CreateUserW`(  UserID INTEGER )
BEGIN
	DECLARE WheelID INTEGER;
	DECLARE PartLbl VARCHAR(150);
	DECLARE SKUNo VARCHAR (100);
	DECLARE Des VARCHAR(150);
	DECLARE PartPrice1 FLOAT;
	DECLARE PartPrice2 FLOAT;
	DECLARE no_more_rows BOOLEAN;
	DECLARE num INTEGER;
	DECLARE WheelTblCur CURSOR FOR SELECT wheel_id,part_name,description,sku,part_price,montly_price FROM wheels;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN WheelTblCur;

	loop_cur_res: LOOP
        	FETCH   WheelTblCur INTO  WheelID,PartLbl,Des,SKUNo,PartPrice1,PartPrice2;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO dealer_parts  VALUES (NULL , WheelID  , UserID  ,'w' ,  PartLbl , SKUNo ,0, Des  , PartPrice1 , PartPrice2 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE WheelTblCur;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for InsertBackgrounds
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertBackgrounds`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `InsertBackgrounds`( Uid INTEGER )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE bgId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT background_id FROM backgrounds;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO bgId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_backgrounds VALUES ( NULL , bgId , Uid , 1 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for InsertUserDefaults
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertUserDefaults`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `InsertUserDefaults`( uid INTEGER )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE bgId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT value FROM variable WHERE name = 'default_background';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO bgId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_defaults VALUES ( NULL , uid , bgId , '_blank'  );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for InsertUserDetails
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertUserDetails`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `InsertUserDetails`(uid INTEGER)
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE dealerIcon VARCHAR(200);
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT value FROM variable WHERE name = 'dealerIcon';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO dealerIcon;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_details VALUES ( NULL , uid , '_blank' , '_blank' , '_blank' , '_blank', '_blank' , '_blank' , '_blank' , dealerIcon );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for InstallParts
-- ----------------------------
DROP PROCEDURE IF EXISTS `InstallParts`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `InstallParts`(installId INTEGER , dealId INTEGER)
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE partId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT part_id FROM deal_accessories WHERE deal_id = dealId;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO partId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO installation_parts VALUES ( NULL , installId , partId , 0 , 0 , 0  , Now() );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserPartCateogies
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserPartCateogies`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserPartCateogies`( Uid INTEGER )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE CatId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT part_category_id FROM part_categories;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO  CatId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_part_categories VALUES (NULL , Uid , CatId  , 0  );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserPartManufacturer
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserPartManufacturer`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserPartManufacturer`( Uid INTEGER )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE MId INTEGER;
	DECLARE Note VARCHAR(200);
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT manufacturer_id,notes FROM part_manufacturer;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO Mid,Note;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_part_manufactures VALUES (NULL , Uid , MId  , Note , 0  );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserParts
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserParts`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserParts`( Uid INTEGER , PartType VARCHAR(100) )
BEGIN
	DECLARE u_name VARCHAR(100);
	DECLARE no_more_rows BOOLEAN;
	DECLARE PartId INTEGER;
	DECLARE Price1 FLOAT;
	DECLARE Price2 FLOAT;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT part_id,part_price,montly_price FROM parts;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH   worker INTO  PartId,Price1,Price2;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_parts  VALUES (NULL , Uid , PartId ,PartType , 0 ,Price1 , Price2 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserPartTypes
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserPartTypes`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserPartTypes`(Uid INTEGER)
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE TypeId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT part_type_id FROM part_types;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO  TypeId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_part_types VALUES (NULL , Uid , TypeId  , 0  );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserWheels
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserWheels`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserWheels`( Uid INTEGER , PartType VARCHAR(100) )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE WheelId INTEGER;
	DECLARE Price1 FLOAT;
	DECLARE Price2 FLOAT;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT wheel_id,part_price,montly_price FROM wheels;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH   worker INTO  WheelId,Price1,Price2;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_parts  VALUES (NULL , Uid , WheelId ,PartType , 0 ,Price1 , Price2 );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UserWheelTypes
-- ----------------------------
DROP PROCEDURE IF EXISTS `UserWheelTypes`;
DELIMITER ;;
CREATE DEFINER=`kamran`@`localhost` PROCEDURE `UserWheelTypes`( Uid INTEGER )
BEGIN
	DECLARE no_more_rows BOOLEAN;
	DECLARE WtypeId INTEGER;
	DECLARE num INTEGER;
	DECLARE worker CURSOR FOR SELECT wheel_type_id FROM wheel_types;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	OPEN worker;
	loop_cur_res: LOOP
        	FETCH  worker INTO WtypeId;

        IF no_more_rows THEN
            LEAVE loop_cur_res;
        END IF;

	INSERT INTO user_wheel_types VALUES (NULL , Uid , WtypeId , 0  );
	-- record the line number
        SET num = num+1;

	END LOOP loop_cur_res;
	CLOSE worker;
END;;
DELIMITER ;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `acl_dashboard` VALUES ('1', 'cms', '{\"name\":\"cms\",\"title\":\"Content Management\",\"options\":{\"listpages\":{\"title\":\"Content Pages\",\"icon\":\"content-management.png\"},\"listnews\":{\"title\":\"News & Updates\",\"icon\":\"news-icons.png\"}},\"tasks\":{\"CMS\":{\"listpages\":\"Display Content Pages\",\"modifypages\":\"Modify Pages\"},\"NEWS/UPDATES\":{\"listnews\":\"Display Content News\",\"createnews\":\"Create News\",\"modifynews\":\"Modify News\",\"removenews\":\"Remove News\",\"statusnews\":\"Enable & Disable News\"}}}');
INSERT INTO `acl_dashboard` VALUES ('4', 'deal', '{\"name\":\"deal\",\"title\":\"Deal Management\",\"options\":{\"listdeals\":{\"title\":\"Deal Management\",\"icon\":\"deals.png\"},\"listcommisions\":{\"title\":\"Commisions\",\"icon\":\"exclusion.png\"},\"listorders\":{\"title\":\"Orders\",\"icon\":\"orders-icon.png\"},\"listinvoice\":{\"title\":\"Invoice\",\"icon\":\"invoice-icon.png\"}},\"tasks\":{\"Deals\":{\"listdeals\":\"Display Deals\",\"searchdeal\":\"Search Deals\",\"statusdeal\":\"Enable/Disable Deals\",\"removedeal\":\"Remove Deals\"},\"Commisions\":{\"listcommisions\":\"Display Commsion\",\"modifycommisions\":\"Modify Deal Commisions\"},\"Orders\":{\"listorders\":\"Display Orders\",\"modifyorder\":\"Modify Orders\"},\"Invoice\":{\"listinvoice\":\"Display Invoices\",\"viewinvoice\":\"View Invoice\"}}}');
INSERT INTO `acl_dashboard` VALUES ('3', 'users', '{\"name\":\"users\",\"title\":\"User Management\",\"options\":{\"displayusers\":{\"title\":\"Users\",\"icon\":\"user-icon.png\"},\"displayrole\":{\"title\":\"Roles\",\"icon\":\"roles-icon.png\"},\"listpermissions\":{\"title\":\"Permissions\",\"icon\":\"permissions-icon.png\"},\"listuserdefaults\":{\"title\":\"Account Defaults\",\"icon\":\"user-defaults.png\"},\"listuserdetails\":{\"title\":\"Account Details\",\"icon\":\"user-details.png\"},\"myaccount\":{\"title\":\"My Account\",\"icon\":\"user-settings.png\"}},\"tasks\":{\"Users\":{\"displayusers\":\"Display Users\",\"createuser\":\"Create Users\",\"statususer\":\"Enable/Disable Users\",\"modifyuser\":\"Modify User\",\"removeuser\":\"Remove Users\"},\"Roles\":{\"displayrole\":\"Display Roles\",\"createrole\":\"Create Role\",\"modifyrole\":\"Modify Role\",\"removerole\":\"Remove Role\"},\"Permissions\":{\"listpermissions\":\"List Permissions\"}}}');
INSERT INTO `acl_dashboard` VALUES ('5', 'vehicles', '{\"name\":\"vehicles\",\"title\":\"Vehicle Management\",\"options\":{\"listvehicles\":{\"title\":\"Vehicles\",\"icon\":\"model_year_icon.png\"},\"listmakes\":{\"title\":\"Makes\",\"icon\":\"make.png\"},\"listmakeyears\":{\"title\":\"Years\",\"icon\":\"years-icon.png\"},\"listmodels\":{\"title\":\"Vehicle Models\",\"icon\":\"models.png\"},\"listmodeltrims\":{\"title\":\"Model Trims\",\"icon\":\"model_year_icon.png\"},\"listexteriorcolor\":{\"title\":\"Exterior Color\",\"icon\":\"partlist_icon.png\"},\"listinteriorcolor\":{\"title\":\"Interior Color\",\"icon\":\"partlist_icon.png\"},\"listparttypes\":{\"title\":\"Part Types\",\"icon\":\"vehicle_sale.png\"},\"listpartcategories\":{\"title\":\"Part Categories\",\"icon\":\"user-settings.png\"},\"listwheelsize\":{\"title\":\"Wheel Sizes\",\"icon\":\"wheel-icon.png\"},\"listwheelcategories\":{\"title\":\"Wheel Categories\",\"icon\":\"wheel-cat-icon.png\"},\"listpartmanufacturer\":{\"title\":\"Part Manufactuers\",\"icon\":\"manufacturer.png\"},\"listparts\":{\"title\":\"Vehicle Parts\",\"icon\":\"vehicle-accessories.png\"}},\"tasks\":{\"Vehicles\":{\"listvehicles\":\"Display Vehicles\",\"createvehicles\":\"Add vehicles\",\"modifyvehicles\":\"Modify Vehciles\",\"removevehicles\":\"Remove Vehciles\"},\"Makes\":{\"listmakes\":\"Display Makes\",\"createmakes\":\"Add Makes\",\"modifymakes\":\"Modify Makes\",\"removemakes\":\"Remove Makes\"},\"Years\":{\"listmakeyears\":\"List Years\",\"createmakeyears\":\"Add Model Year\",\"modifymakeyears\":\"Modify Model Year\",\"removemakeyears\":\"Remove Model Year\"},\"Models\":{\"listmodels\":\"List Models\",\"createmodels\":\"Add Models\",\"modifymodels\":\"Modifu Models\",\"removemodels\":\"Remove Models\"},\"Trims\":{\"listmodeltrims\":\"List Trims\",\"createmodeltrims\":\"Add Model Trims\",\"modifymodeltrims\":\"Modify Model Trims\",\"removemodeltrims\":\"Remove Model Trims\"},\"Interior Color\":{\"listinteriorcolor\":\"List Interior Colors\",\"createinteriorcolor\":\"Add Interior Color\",\"modifyinteriorcolor\":\"Modify Interior Color\",\"removeinteriorcolor\":\"Remove Interior Color\"},\"Exterior Color\":{\"listexteriorcolor\":\"List Exterior Colors\",\"createexteriorcolor\":\"Create Exterior Colors\",\"modifyexteriorcolor\":\"Modify Exterior Colors\",\"removeexteriorcolor\":\"Remove Exteior Colors\"},\"Part Type\":{\"listparttypes\":\"Display Part Types\",\"modifyparttypes\":\"Modify Part Type\"},\"Part Categories\":{\"listpartcategories\":\"List Part Categories\",\"createpartcategories\":\"Add Part Categories\",\"modifypartcategories\":\"Modify Part Categories\",\"removepartcategories\":\"Remove Part Categories\",\"statuspartcategories\":\"Enable/Disable Part Categories\"},\"Wheel Sizes\":{\"listwheelsize\":\"List Wheel Sizes\",\"createwheelsize\":\"Create Wheel Sizes\",\"modifywheelsize\":\"Modify Wheel Sizes\",\"removewheelsize\":\"Remove Wheel Sizes\",\"statuswheelsize\":\"Enable/Disable Wheel Sizes\"},\"Wheel Categories\":{\"listwheelcategories\":\"List Wheel Categories\",\"createwheelcategories\":\"Add Wheel Categories\",\"modifywheelcategories\":\"Modify Wheel Categories\",\"removewheelcategories\":\"Remove Wheel Categories\",\"statuswheelcategories\":\"Enable/Disable Wheel Categories\"},\"Part Manufacturers\":{\"listpartmanufacturer\":\"List Manufacturer\",\"createpartmanufacturer\":\"Add Part Manufacturer\",\"modifypartmanufacturer\":\"Modify Part Manufacturer\",\"removepartmanufacturer\":\"Remove Part Manufacturer\",\"statuspartmanufacturer\":\"Enable/Disable Part Manufacturers\"},\"Parts\":{\"listparts\":\"List Parts\",\"createparts\":\"Add Parts\",\"modifyparts\":\"Modify Parts\",\"removeparts\":\"Remove Parts\",\"statusparts\":\"Enable/Disable Parts\"}}}');
INSERT INTO `acl_dashboard` VALUES ('6', 'technicals', '{\"name\":\"technicals\",\"title\":\"Technicals Department\",\"options\":{\"listinstalldeals\":{\"title\":\"Parts Installtion Manager\",\"icon\":\"technical_icon.png\"}},\"tasks\":{\"Parts Installation\":{\"listinstalldeals\":\"Display Whole Deals\",\"listparts\":\"View Parts\",\"viewpartsdetail\":\"View Parts Details\",\"installparts\":\"Install Parts\",\"uninstallparts\":\"Un-install Parts\",\"allpendinginstalltions\":\"Display All Pending Installtion Deals \",\"allcompleteinstallations\":\"Display all completed Installation Deals\",\"completeinstalldeal\":\"Complete Installation Deal\",\"searchinstalldeals\":\"Search Installation Deal\"}}}');
INSERT INTO `acl_dashboard` VALUES ('8', 'settings', '{\"name\":\"settings\",\"title\":\"Settings\",\"options\":{\"listvariables\":{\"title\":\"System Variables\",\"icon\":\"user-icon.png\"},\"listemailtemplate\":{\"title\":\"Email Templates\",\"icon\":\"email-icon.png\"},\"listbackground\":{\"title\":\"Canves Backgrounds\",\"icon\":\"background-icon.png\"},\"listcoordinate\":{\"title\":\"Canves Coordinates\",\"icon\":\"coordinates-icon.png\"}},\"tasks\":{\"Variables\":{\"listvariables\":\"Display Variables\",\"addvariable\":\"Add Variable\",\"modifyvariable\":\"Modify Variable\",\"removevariable\":\"Remove Variable\"},\"Email Templates\":{\"listemailtemplate\":\"Display Email Templates\",\"modifyemailtemplate\":\"Modify Email Templates\"},\"Canves Backgrounds\":{\"listbackground\":\"Display Backgrounds\",\"createbackground\":\"Add Background\",\"modifybackground\":\"Modify Background\",\"removebackground\":\"Remove Background\"},\"Canves Coordinates\":{\"listcoordinate\":\"Display Canves Coordinates\",\"modifycoordinate\":\"Modify Coordinates\"}}}');
INSERT INTO `acl_dashboard` VALUES ('9', 'reports', '{\"name\":\"reports\",\"title\":\"Reports\",\"options\":{\"liststatistices\":{\"title\":\"Statistices\",\"icon\":\"stat-report.png\"},\"dealerperformance\":{\"title\":\"Dealer Performance\",\"icon\":\"performance-icon.png\"},\"salesperformance\":{\"title\":\"Sales Performance\",\"icon\":\"sales-icon.png\"},\"profitablity\":{\"title\":\"Profitablity\",\"icon\":\"profit_icon.png\"},\"parts\":{\"title\":\"Accessories\",\"icon\":\"parts-icon.png\"},\"modelyears\":{\"title\":\"Model/Years\",\"icon\":\"model-year-icon.png\"},\"deals\":{\"title\":\"Deals\",\"icon\":\"reporte.png\"},\"vehicles\":{\"title\":\"Vehicle\",\"icon\":\"vehicle_sale.png\"},\"users\":{\"title\":\"Users\",\"icon\":\"user-reports.png\"}},\"tasks\":{\"Statistices\":{\"liststatistices\":\"View Vehicle Statistices\",\"exportstatistices\":\"Export Statistices Report \"},\"Dealer Performance\":{\"dealerperformance\":\"View Dealer Performance Statistices Report\",\"exportdealerperformance\":\"Export Dealer Performance Report \"},\"Sales Performance\":{\"salesperformance\":\"View Sales Performance Report\",\"exportsalesperformance\":\"Export Sales Proformance Report \"},\"Profitablity\":{\"profitablity\":\"View Profitablity Report\",\"exportprofitablity\":\"Export Profitablity Report \"},\"Parts\":{\"parts\":\"View Accessories Report\",\"exportparts\":\"Export Accessories Report \"},\"Model/Years\":{\"modelyears\":\"View Model/Years Report\",\"exportmodelyears\":\"Export Model/Years Report \"},\"Deals\":{\"deals\":\"View Deals Report\",\"exportdeals\":\"Export Deals Report \"},\"Vehicles\":{\"vehicles\":\"Display Vehicle Statistices\",\"exportvehicles\":\"Export Vehicles Report \"},\"Users\":{\"users\":\"Display Vehicle Statistices\",\"exportusers\":\"Export Users Report \"}}}');
INSERT INTO `acl_permissions` VALUES ('1', '4', '5', '[\"index\",\"aboutus\",\"contactus\",\"login\",\"presentation\"]');
INSERT INTO `acl_permissions` VALUES ('2', '4', '1', '[\"index\"]');
INSERT INTO `acl_permissions` VALUES ('3', '4', '14', '[\"index\"]');
INSERT INTO `acl_permissions` VALUES ('4', '3', '11', '[\"displayusers\",\"createuser\",\"statususer\",\"modifyuser\",\"removeuser\"]');
INSERT INTO `acl_permissions` VALUES ('11', '3', '3', '[\"listdeals\",\"searchdeal\",\"statusdeal\",\"removedeal\",\"listcommisions\",\"modifycommisions\",\"listorders\",\"modifyorder\",\"listinvoice\",\"viewinvoice\"]');
INSERT INTO `acl_permissions` VALUES ('8', '5', '10', '[\"listinstalldeals\",\"listparts\",\"viewpartsdetail\",\"installparts\",\"uninstallparts\",\"allpendinginstalltions\",\"allcompleteinstallations\",\"completeinstalldeal\",\"searchinstalldeals\"]');
INSERT INTO `acl_permissions` VALUES ('7', '3', '9', '[\"listbackground\",\"createbackground\",\"modifybackground\",\"removebackground\"]');
INSERT INTO `acl_permissions` VALUES ('10', '3', '8', '[]');
INSERT INTO `acl_permissions` VALUES ('9', '3', '12', '[]');
INSERT INTO `acl_permissions` VALUES ('12', '3', '10', '[\"listinstalldeals\",\"listparts\",\"viewpartsdetail\",\"installparts\",\"uninstallparts\"]');
INSERT INTO `acl_permissions` VALUES ('13', '5', '12', '[\"listparts\"]');
INSERT INTO `acl_permissions` VALUES ('14', '6', '3', '[\"listcommisions\",\"modifycommisions\",\"listorders\",\"modifyorder\",\"listinvoice\",\"viewinvoice\"]');
INSERT INTO `acl_resources` VALUES ('1', 'admin', '[\"index\",\"main\",\"logout\"]');
INSERT INTO `acl_resources` VALUES ('2', 'cms', '[\"listpages\",\"modifypages\",\"listnews\",\"createnews\",\"modifynews\",\"removenews\",\"statusnews\"]');
INSERT INTO `acl_resources` VALUES ('3', 'deal', '[\"listdeals\",\"listdealdetails\",\"viewdealaccessories\",\"removedealaccessories\",\"searchdeal\",\"statusdeal\",\"removedeal\",\"listcommisions\",\"modifycommisions\",\"listorders\",\"modifyorder\",\"listinvoice\",\"viewinvoice\"]');
INSERT INTO `acl_resources` VALUES ('4', 'error', '[\"error\",\"noauth\"]');
INSERT INTO `acl_resources` VALUES ('5', 'index', '[\"index\",\"aboutus\",\"contactus\",\"logout\",\"login\"]');
INSERT INTO `acl_resources` VALUES ('6', 'orders', '[\"listorders\"]');
INSERT INTO `acl_resources` VALUES ('7', 'parts', '[\"listparts\"]');
INSERT INTO `acl_resources` VALUES ('8', 'reports', '[\"liststatistices\",\"exportstatistices\",\"dealerperformance\",\"exportdealerperformance\",\"salesperformance\",\"exportsalesperformance\",\"profitablity\",\"exportprofitablity\",\"parts\",\"exportparts\",\"modelyears\",\"exportmodelyears\",\"deals\",\"exportdeals\",\"vehicles\",\"exportvehicles\",\"users\",\"exportusers\"]');
INSERT INTO `acl_resources` VALUES ('9', 'settings', '[\"listvariables\",\"modifyvariable\",\"addvariable\",\"removevariable\",\"listemailtemplate\",\"modifyemailtemplate\",\"listbackground\",\"createbackground\",\"modifybackground\",\"removebackground\",\"listcoordinate\",\"modifycoordinate\"]');
INSERT INTO `acl_resources` VALUES ('10', 'technicals', '[\"listinstalldeals\",\"listparts\",\"viewpartsdetail\",\"installparts\",\"uninstallparts\",\"allpendinginstalltions\",\"allcompleteinstallations\",\"completeinstalldeal\",\"searchinstalldeals\"]');
INSERT INTO `acl_resources` VALUES ('11', 'users', '[\"index\",\"displayusers\",\"createuser\",\"statususer\",\"modifyuser\",\"removeuser\",\"displayrole\",\"createrole\",\"modifyrole\",\"removerole\",\"prebuildpermissions\",\"listpermissions\",\"listuserdefaults\",\"listuserdetails\",\"logoutuser\",\"myaccount\"]');
INSERT INTO `acl_resources` VALUES ('12', 'vehicles', '[\"listvehicles\",\"createvehicles\",\"modifyvehicles\",\"removevehicles\",\"listmakes\",\"createmakes\",\"modifymakes\",\"removemakes\",\"listmakeyears\",\"createmakeyears\",\"modifymakeyears\",\"removemakeyears\",\"listmodels\",\"createmodels\",\"modifymodels\",\"removemodels\",\"listmodeltrims\",\"createmodeltrims\",\"modifymodeltrims\",\"removemodeltrims\",\"listexteriorcolor\",\"createexteriorcolor\",\"modifyexteriorcolor\",\"removeexteriorcolor\",\"listinteriorcolor\",\"createinteriorcolor\",\"modifyinteriorcolor\",\"removeinteriorcolor\",\"listparttypes\",\"modifyparttypes\",\"listpartcategories\",\"createpartcategories\",\"modifypartcategories\",\"removepartcategories\",\"statuspartcategories\",\"listwheelsize\",\"createwheelsize\",\"modifywheelsize\",\"removewheelsize\",\"statuswheelsize\",\"listwheelcategories\",\"createwheelcategories\",\"modifywheelcategories\",\"removewheelcategories\",\"statuswheelcategories\",\"listpartmanufacturer\",\"createpartmanufacturer\",\"modifypartmanufacturer\",\"removepartmanufacturer\",\"statuspartmanufacturer\",\"listparts\",\"createparts\",\"modifyparts\",\"removeparts\",\"statusparts\"]');
INSERT INTO `acl_resources` VALUES ('13', 'worker', '[\"prebuildpermissions\"]');
INSERT INTO `acl_resources` VALUES ('14', 'presentation', '[\"index\",\"start\",\"makes\",\"models\",\"colors\",\"vehicle\",\"logout\"]');
INSERT INTO `acl_roles` VALUES ('1', 'administrator', 'Full access acount , administrator have complete access to handle the web application ... ', '1');
INSERT INTO `acl_roles` VALUES ('2', 'admin', 'This will taka care of whole system', '1');
INSERT INTO `acl_roles` VALUES ('3', 'dealer', 'Dealer role Text Description will come here', '1');
INSERT INTO `acl_roles` VALUES ('4', 'guest', 'general user of the website', '0');
INSERT INTO `acl_roles` VALUES ('5', 'technical', 'This will install parts of all completed deals', '1');
INSERT INTO `acl_roles` VALUES ('6', 'accounts', 'This will take care of Invoice and orders of complete deals', '1');
INSERT INTO `acl_roles` VALUES ('7', 'sales person', 'This will create the deals for customers', '0');
INSERT INTO `backgrounds` VALUES ('2', 'Parking City', '73767-bg01.png', '0');
INSERT INTO `backgrounds` VALUES ('8', 'Pakistani Roads', '59411-25267-bg02.png', '0');
INSERT INTO `canves_backgrounds` VALUES ('4', '20', '9', '[{\"CRVIEWX\":281,\"SRVIEWY\":271,\"CRVIEWY\":257,\"SIVIEWX\":31,\"CIVIEWX\":252,\"SIVIEWY\":399,\"SFVIEWX\":28,\"CIVIEWY\":103,\"CFVIEWX\":291.25,\"SFVIEWY\":138,\"CFVIEWY\":247,\"SRVIEWX\":30}]');
INSERT INTO `canves_backgrounds` VALUES ('5', '21', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('6', '22', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('7', '23', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('8', '24', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('9', '25', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('10', '26', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('11', '27', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('12', '28', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('13', '29', '8', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('607', '623', '2', '[{\"CRVIEWX\":306.55,\"SRVIEWY\":282.15,\"CRVIEWY\":269.7,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":319.6,\"SFVIEWY\":145.7,\"CFVIEWY\":277.25,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('14', '30', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('15', '31', '2', '[{\"SFVIEWX\":34.85,\"SIVIEWX\":31.1,\"CRVIEWX\":322.75,\"SIVIEWY\":402.35,\"CFVIEWX\":308.5,\"CIVIEWY\":101.15,\"SFVIEWY\":147.2,\"SRVIEWY\":282.95,\"CRVIEWY\":278.5,\"SRVIEWX\":35.75,\"CFVIEWY\":263.25,\"CIVIEWX\":257.15}]');
INSERT INTO `canves_backgrounds` VALUES ('16', '32', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('17', '33', '2', '[{\"CRVIEWX\":330.25,\"SRVIEWY\":286.75,\"CRVIEWY\":285.5,\"SIVIEWX\":29,\"CIVIEWX\":256,\"SIVIEWY\":400,\"SFVIEWX\":33.5,\"CIVIEWY\":101,\"CFVIEWX\":314.75,\"SFVIEWY\":151,\"CFVIEWY\":271,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('18', '34', '2', '[{\"CRVIEWX\":327.8,\"SRVIEWY\":314.05,\"CRVIEWY\":321.1,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":179.15,\"CFVIEWY\":309.4,\"SRVIEWX\":31.05}]');
INSERT INTO `canves_backgrounds` VALUES ('19', '35', '2', '[{\"CRVIEWX\":332.55,\"SRVIEWY\":315.2,\"CRVIEWY\":325.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":326.65,\"SFVIEWY\":181.5,\"CFVIEWY\":317.6,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('20', '36', '2', '[{\"CRVIEWX\":323.1,\"SRVIEWY\":312.95,\"CRVIEWY\":335.15,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":38.1,\"CIVIEWY\":130,\"CFVIEWX\":323.1,\"SFVIEWY\":177.95,\"CFVIEWY\":314.05,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('21', '37', '2', '[{\"CRVIEWX\":323.15,\"SRVIEWY\":312.9,\"CRVIEWY\":331.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":330.15,\"SFVIEWY\":179.1,\"CFVIEWY\":310.55,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('22', '38', '2', '[{\"CRVIEWX\":324.3,\"SRVIEWY\":316.4,\"CRVIEWY\":334,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":332.55,\"SFVIEWY\":177.95,\"CFVIEWY\":312.9,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('23', '39', '2', '[{\"CRVIEWX\":321.95,\"SRVIEWY\":312.9,\"CRVIEWY\":331.65,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":326.65,\"SFVIEWY\":179.15,\"CFVIEWY\":314.1,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('24', '40', '2', '[{\"CRVIEWX\":332.5,\"SRVIEWY\":316.45,\"CRVIEWY\":331.65,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":180.35,\"CFVIEWY\":311.7,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('25', '41', '2', '[{\"CRVIEWX\":334.85,\"SRVIEWY\":315.25,\"CRVIEWY\":324.65,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":326.65,\"SFVIEWY\":180.3,\"CFVIEWY\":312.85,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('26', '42', '2', '[{\"CRVIEWX\":326.65,\"SRVIEWY\":310.55,\"CRVIEWY\":326.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":314.9,\"SFVIEWY\":179.15,\"CFVIEWY\":307.05,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('27', '43', '2', '[{\"CRVIEWX\":333.7,\"SRVIEWY\":312.9,\"CRVIEWY\":331.7,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":326.65,\"SFVIEWY\":177.95,\"CFVIEWY\":310.55,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('28', '44', '2', '[{\"CRVIEWX\":336.05,\"SRVIEWY\":310.55,\"CRVIEWY\":330.5,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":325.45,\"SFVIEWY\":180.35,\"CFVIEWY\":315.2,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('29', '45', '2', '[{\"CRVIEWX\":327.8,\"SRVIEWY\":309.4,\"CRVIEWY\":327,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":327.8,\"SFVIEWY\":179.15,\"CFVIEWY\":310.55,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('30', '46', '2', '[{\"CRVIEWX\":343.1,\"SRVIEWY\":311.7,\"CRVIEWY\":330.5,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":324.3,\"SFVIEWY\":179.15,\"CFVIEWY\":304.7,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('31', '47', '2', '[{\"CRVIEWX\":343.05,\"SRVIEWY\":311.7,\"CRVIEWY\":331.65,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":324.3,\"SFVIEWY\":179.15,\"CFVIEWY\":309.4,\"SRVIEWX\":31.05}]');
INSERT INTO `canves_backgrounds` VALUES ('32', '48', '2', '[{\"CRVIEWX\":327.8,\"SRVIEWY\":315.2,\"CRVIEWY\":329.3,\"SIVIEWX\":29.9,\"CIVIEWX\":255.7,\"SIVIEWY\":431.05,\"SFVIEWX\":32.25,\"CIVIEWY\":131.35,\"CFVIEWX\":324.3,\"SFVIEWY\":180.35,\"CFVIEWY\":317.55,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('33', '49', '2', '[{\"CRVIEWX\":329,\"SRVIEWY\":310.55,\"CRVIEWY\":330.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":314.9,\"SFVIEWY\":179.15,\"CFVIEWY\":310.55,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('34', '50', '2', '[{\"CRVIEWX\":340.7,\"SRVIEWY\":315.25,\"CRVIEWY\":324.65,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":180.35,\"CFVIEWY\":310.5,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('35', '51', '2', '[{\"CRVIEWX\":325.5,\"SRVIEWY\":311.75,\"CRVIEWY\":328.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":336.05,\"SFVIEWY\":177.95,\"CFVIEWY\":315.25,\"SRVIEWX\":31.1}]');
INSERT INTO `canves_backgrounds` VALUES ('36', '52', '2', '[{\"CRVIEWX\":340.75,\"SRVIEWY\":314.05,\"CRVIEWY\":329.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":182.65,\"CFVIEWY\":315.2,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('37', '53', '2', '[{\"CRVIEWX\":333.7,\"SRVIEWY\":311.7,\"CRVIEWY\":328.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":180.35,\"CFVIEWY\":311.7,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('38', '54', '2', '[{\"CRVIEWX\":325.5,\"SRVIEWY\":312.9,\"CRVIEWY\":325.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":316.1,\"SFVIEWY\":177.95,\"CFVIEWY\":315.25,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('39', '55', '2', '[{\"CRVIEWX\":327.85,\"SRVIEWY\":315.2,\"CRVIEWY\":319.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":180.3,\"CFVIEWY\":314.1,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('40', '56', '2', '[{\"CRVIEWX\":329,\"SRVIEWY\":314.1,\"CRVIEWY\":317.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":39.3,\"CIVIEWY\":130,\"CFVIEWX\":332.5,\"SFVIEWY\":179.15,\"CFVIEWY\":310.55,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('41', '57', '2', '[{\"CRVIEWX\":324.3,\"SRVIEWY\":311.75,\"CRVIEWY\":325.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":325.5,\"SFVIEWY\":179.15,\"CFVIEWY\":312.9,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('42', '58', '2', '[{\"CRVIEWX\":324.3,\"SRVIEWY\":315.25,\"CRVIEWY\":328.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":320.75,\"SFVIEWY\":182.65,\"CFVIEWY\":312.9,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('43', '59', '2', '[{\"CRVIEWX\":320.75,\"SRVIEWY\":314.05,\"CRVIEWY\":323.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":38.1,\"CIVIEWY\":130,\"CFVIEWX\":314.9,\"SFVIEWY\":179.15,\"CFVIEWY\":312.9,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('44', '60', '2', '[{\"CRVIEWX\":318.4,\"SRVIEWY\":311.75,\"CRVIEWY\":335.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":325.5,\"SFVIEWY\":178,\"CFVIEWY\":314.05,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('45', '61', '2', '[{\"CRVIEWX\":334.85,\"SRVIEWY\":312.9,\"CRVIEWY\":334,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":318.45,\"SFVIEWY\":180.3,\"CFVIEWY\":316.4,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('46', '62', '2', '[{\"CRVIEWX\":322,\"SRVIEWY\":316.4,\"CRVIEWY\":332.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":317.3,\"SFVIEWY\":180.3,\"CFVIEWY\":312.9,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('47', '63', '2', '[{\"CRVIEWX\":333.7,\"SRVIEWY\":314.05,\"CRVIEWY\":328.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":323.1,\"SFVIEWY\":182.65,\"CFVIEWY\":316.4,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('48', '64', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":314.05,\"CRVIEWY\":325.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":179.1,\"CFVIEWY\":311.7,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('49', '65', '2', '[{\"CRVIEWX\":336.05,\"SRVIEWY\":312.9,\"CRVIEWY\":325.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.25,\"CIVIEWY\":130,\"CFVIEWX\":316.1,\"SFVIEWY\":179.1,\"CFVIEWY\":312.9,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('50', '66', '2', '[{\"CRVIEWX\":336.05,\"SRVIEWY\":312.9,\"CRVIEWY\":327,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":340.7,\"SFVIEWY\":179.15,\"CFVIEWY\":311.7,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('51', '67', '2', '[{\"SRVIEWY\":281.5,\"CFVIEWY\":274.5,\"CRVIEWY\":266.2,\"SFVIEWX\":33.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SFVIEWY\":146.45,\"SIVIEWY\":400,\"CIVIEWY\":101.95,\"SRVIEWX\":35.15,\"CFVIEWX\":313.6,\"CRVIEWX\":311.45}]');
INSERT INTO `canves_backgrounds` VALUES ('52', '68', '2', '[{\"CRVIEWX\":323.1,\"SRVIEWY\":285.5,\"CRVIEWY\":272.2,\"SIVIEWX\":29,\"CIVIEWX\":256,\"SIVIEWY\":401.4,\"SFVIEWX\":35.8,\"CIVIEWY\":101.5,\"CFVIEWX\":326.05,\"SFVIEWY\":150.85,\"CFVIEWY\":279.8,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('53', '69', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":283.5,\"CRVIEWY\":276.65,\"SIVIEWX\":28.95,\"CIVIEWX\":255.05,\"SIVIEWY\":401.45,\"SFVIEWX\":33.4,\"CIVIEWY\":102.4,\"CFVIEWX\":325.05,\"SFVIEWY\":150.8,\"CFVIEWY\":272.7,\"SRVIEWX\":34.35}]');
INSERT INTO `canves_backgrounds` VALUES ('54', '70', '2', '[{\"CRVIEWX\":306.65,\"SRVIEWY\":284.2,\"CRVIEWY\":264.9,\"SIVIEWX\":27.95,\"CIVIEWX\":256,\"SIVIEWY\":400.45,\"SFVIEWX\":33.9,\"CIVIEWY\":103.4,\"CFVIEWX\":311,\"SFVIEWY\":149.85,\"CFVIEWY\":272.15,\"SRVIEWX\":35.35}]');
INSERT INTO `canves_backgrounds` VALUES ('55', '71', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":316.4,\"CRVIEWY\":308.2,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":302,\"SFVIEWY\":178,\"CFVIEWY\":315.25,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('56', '72', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":310.55,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":38.1,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.1,\"CFVIEWY\":316.45,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('57', '73', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":314.1,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":179.15,\"CFVIEWY\":312.9,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('58', '74', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":309.35,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":179.15,\"CFVIEWY\":311.7,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('59', '75', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":314.05,\"CRVIEWY\":304.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":316.1,\"SFVIEWY\":179.15,\"CFVIEWY\":308.2,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('60', '76', '2', '[{\"CRVIEWX\":299.65,\"SRVIEWY\":312.9,\"CRVIEWY\":307.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":179.15,\"CFVIEWY\":314.1,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('61', '77', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":314.05,\"CRVIEWY\":307,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":317.3,\"SFVIEWY\":177.95,\"CFVIEWY\":312.9,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('62', '78', '2', '[{\"CRVIEWX\":317.3,\"SRVIEWY\":312.85,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":179.15,\"CFVIEWY\":308.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('63', '79', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":309.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":178,\"CFVIEWY\":312.9,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('64', '80', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":312.9,\"CRVIEWY\":317.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":317.3,\"SFVIEWY\":178,\"CFVIEWY\":311.75,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('65', '81', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.15,\"CFVIEWY\":322.3,\"SRVIEWX\":38.15}]');
INSERT INTO `canves_backgrounds` VALUES ('66', '82', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":310.55,\"CRVIEWY\":302.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":177.95,\"CFVIEWY\":304.65,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('67', '83', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":314.1,\"CRVIEWY\":302.35,\"SIVIEWX\":30,\"CIVIEWX\":0,\"SIVIEWY\":431,\"SFVIEWX\":32.25,\"CIVIEWY\":0,\"CFVIEWX\":304.35,\"SFVIEWY\":177.95,\"CFVIEWY\":311.7,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('68', '84', '2', '[{\"CRVIEWX\":304.4,\"SRVIEWY\":311.75,\"CRVIEWY\":309.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":176.75,\"CFVIEWY\":315.25,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('69', '85', '2', '[{\"CRVIEWX\":299.65,\"SRVIEWY\":312.9,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":177.95,\"CFVIEWY\":315.2,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('70', '86', '2', '[{\"CRVIEWX\":300.85,\"SRVIEWY\":311.75,\"CRVIEWY\":307,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":299.65,\"SFVIEWY\":180.35,\"CFVIEWY\":312.9,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('71', '87', '2', '[{\"CRVIEWX\":305.5,\"SRVIEWY\":312.9,\"CRVIEWY\":307,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":304.4,\"SFVIEWY\":179.1,\"CFVIEWY\":314.05,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('72', '88', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":314.1,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":314.95,\"SFVIEWY\":176.8,\"CFVIEWY\":316.4,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('73', '89', '2', '[{\"CRVIEWX\":296.15,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":179.1,\"CFVIEWY\":319.95,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('74', '90', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":314.1,\"CRVIEWY\":304.65,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":178,\"CFVIEWY\":303.5,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('75', '91', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":307.05,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":318.45,\"SFVIEWY\":179.1,\"CFVIEWY\":305.9,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('76', '92', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":311.7,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":178,\"CFVIEWY\":314.05,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('77', '93', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":312.9,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":179.15,\"CFVIEWY\":315.2,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('78', '94', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":315.2,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":180.3,\"CFVIEWY\":315.25,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('79', '95', '2', '[{\"CRVIEWX\":304.4,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":177.95,\"CFVIEWY\":309.4,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('80', '96', '2', '[{\"CRVIEWX\":298.5,\"SRVIEWY\":311.75,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":179.15,\"CFVIEWY\":303.5,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('81', '97', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":316.4,\"CRVIEWY\":323.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":313.8,\"SFVIEWY\":180.3,\"CFVIEWY\":304.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('82', '98', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":312.9,\"CRVIEWY\":319.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":310.2,\"SFVIEWY\":178,\"CFVIEWY\":307,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('83', '99', '2', '[{\"CRVIEWX\":297.3,\"SRVIEWY\":315.25,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('84', '100', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":311.7,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":180.3,\"CFVIEWY\":305.85,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('85', '101', '2', '[{\"CRVIEWX\":298.5,\"SRVIEWY\":316.4,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":180.3,\"CFVIEWY\":301.2,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('86', '102', '2', '[{\"CRVIEWX\":319.65,\"SRVIEWY\":311.75,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":179.15,\"CFVIEWY\":304.65,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('87', '103', '2', '[{\"CRVIEWX\":317.25,\"SRVIEWY\":312.9,\"CRVIEWY\":324.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":179.15,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('88', '104', '2', '[{\"CRVIEWX\":300.85,\"SRVIEWY\":310.55,\"CRVIEWY\":326.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":178,\"CFVIEWY\":302.3,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('89', '105', '2', '[{\"CRVIEWX\":304.4,\"SRVIEWY\":311.7,\"CRVIEWY\":318.8,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":179.15,\"CFVIEWY\":302.3,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('90', '106', '2', '[{\"CRVIEWX\":302.05,\"SRVIEWY\":311.7,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":179.15,\"CFVIEWY\":307,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('91', '107', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":314.05,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.15,\"CFVIEWY\":303.55,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('92', '108', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":315.25,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":180.3,\"CFVIEWY\":308.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('93', '109', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('94', '110', '2', '[{\"CRVIEWX\":302,\"SRVIEWY\":309.4,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":177.95,\"CFVIEWY\":308.2,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('95', '111', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":316.4,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":180.3,\"CFVIEWY\":304.65,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('96', '112', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":177.95,\"CFVIEWY\":307,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('97', '113', '2', '[{\"CRVIEWX\":319.65,\"SRVIEWY\":312.9,\"CRVIEWY\":322.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":177.95,\"CFVIEWY\":308.2,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('98', '114', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":314.05,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":179.15,\"CFVIEWY\":308.2,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('99', '115', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":314.05,\"CRVIEWY\":322.3,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":32.25,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":180.3,\"CFVIEWY\":308.15,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('100', '116', '2', '[{\"CRVIEWX\":312.6,\"SRVIEWY\":315.25,\"CRVIEWY\":318.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":181.45,\"CFVIEWY\":310.5,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('101', '117', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":314.1,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":180.35,\"CFVIEWY\":307.05,\"SRVIEWX\":32.25}]');
INSERT INTO `canves_backgrounds` VALUES ('102', '118', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":316.45,\"CRVIEWY\":322.3,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":180.35,\"CFVIEWY\":308.2,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('103', '119', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":300,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":311,\"SFVIEWY\":179,\"CFVIEWY\":291,\"SRVIEWX\":33}]');
INSERT INTO `canves_backgrounds` VALUES ('104', '120', '2', '[{\"CRVIEWX\":319.65,\"SRVIEWY\":312.9,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":314.95,\"SFVIEWY\":179.15,\"CFVIEWY\":308.2,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('105', '121', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.7,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":180.35,\"CFVIEWY\":307,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('106', '122', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.75,\"CRVIEWY\":318.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":177.95,\"CFVIEWY\":308.2,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('107', '123', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":317,\"CRVIEWY\":299,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":310,\"SFVIEWY\":178,\"CFVIEWY\":297,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('108', '124', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":311.7,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.25,\"CIVIEWY\":130,\"CFVIEWX\":312.55,\"SFVIEWY\":180.35,\"CFVIEWY\":309.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('109', '125', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":311.75,\"CRVIEWY\":319.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.15,\"CFVIEWY\":307,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('110', '126', '2', '[{\"CRVIEWX\":259.8,\"SRVIEWY\":312.9,\"CRVIEWY\":323.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":182.65,\"CFVIEWY\":308.2,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('111', '127', '2', '[{\"CRVIEWX\":316.7,\"SRVIEWY\":281.55,\"CRVIEWY\":275.4,\"SIVIEWX\":28.95,\"CIVIEWX\":255,\"SIVIEWY\":401.45,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":346.4,\"SFVIEWY\":146.4,\"CFVIEWY\":275.15,\"SRVIEWX\":35.1}]');
INSERT INTO `canves_backgrounds` VALUES ('112', '128', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":315.2,\"CRVIEWY\":317.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":179.15,\"CFVIEWY\":307,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('113', '129', '2', '[{\"CRVIEWX\":318.45,\"SRVIEWY\":317.6,\"CRVIEWY\":319.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":179.15,\"CFVIEWY\":307.05,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('114', '130', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":314.05,\"CRVIEWY\":322.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":179.1,\"CFVIEWY\":308.2,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('115', '131', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":314.05,\"CRVIEWY\":321.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":179.15,\"CFVIEWY\":309.35,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('116', '132', '2', '[{\"CRVIEWX\":300,\"SRVIEWY\":318,\"CRVIEWY\":284.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":278,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('117', '133', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":315.25,\"CRVIEWY\":319.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":178,\"CFVIEWY\":310.55,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('118', '134', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":316.45,\"CRVIEWY\":319.95,\"SIVIEWX\":29.9,\"CIVIEWX\":255,\"SIVIEWY\":431.05,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":179.15,\"CFVIEWY\":302.3,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('119', '135', '2', '[{\"CRVIEWX\":300,\"SRVIEWY\":313,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('120', '136', '2', '[{\"CRVIEWX\":299.25,\"SRVIEWY\":311,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":293,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('121', '137', '2', '[{\"CRVIEWX\":302.05,\"SRVIEWY\":314.05,\"CRVIEWY\":318.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":302,\"SFVIEWY\":180.3,\"CFVIEWY\":305.85,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('122', '138', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.75,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.75,\"SFVIEWY\":179.15,\"CFVIEWY\":309.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('123', '139', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":312.9,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":295,\"SFVIEWY\":180.3,\"CFVIEWY\":304.7,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('124', '140', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":316.45,\"CRVIEWY\":308.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.85,\"SFVIEWY\":180.35,\"CFVIEWY\":294.1,\"SRVIEWX\":39.25}]');
INSERT INTO `canves_backgrounds` VALUES ('125', '141', '2', '[{\"CRVIEWX\":316.05,\"SRVIEWY\":315.25,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":303.15,\"SFVIEWY\":180.3,\"CFVIEWY\":301.15,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('126', '142', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":315.25,\"CRVIEWY\":318.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":177.95,\"CFVIEWY\":304.7,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('127', '143', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":178,\"CFVIEWY\":290,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('128', '144', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":180.3,\"CFVIEWY\":298.85,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('129', '145', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":311.7,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":178,\"CFVIEWY\":301.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('130', '146', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":314.1,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":180.3,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('131', '147', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":312.95,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":180.3,\"CFVIEWY\":302.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('132', '148', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":312.9,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":176.8,\"CFVIEWY\":304.7,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('133', '149', '2', '[{\"CRVIEWX\":299,\"SRVIEWY\":313,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":175,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('134', '150', '2', '[{\"CRVIEWX\":317.3,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":177.95,\"CFVIEWY\":303.5,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('135', '151', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":313,\"CRVIEWY\":288,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":176,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('136', '152', '2', '[{\"CRVIEWX\":301,\"SRVIEWY\":313,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('137', '153', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":312,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('138', '154', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":311,\"CRVIEWY\":298,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":176,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('139', '155', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":310,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":175,\"CFVIEWY\":285,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('140', '156', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":176,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('141', '157', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":311.7,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('142', '158', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":314.1,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":303.5,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('143', '159', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":312.9,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.25,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":178,\"CFVIEWY\":304.7,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('144', '160', '2', '[{\"CRVIEWX\":320.8,\"SRVIEWY\":311.7,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":312.55,\"SFVIEWY\":179.15,\"CFVIEWY\":299.95,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('145', '161', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":315.25,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":312.6,\"SFVIEWY\":177.95,\"CFVIEWY\":299.95,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('146', '162', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.75,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":180.3,\"CFVIEWY\":301.15,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('147', '163', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":315.25,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":316.1,\"SFVIEWY\":180.3,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('148', '164', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":312.95,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":293.8,\"SFVIEWY\":180.35,\"CFVIEWY\":301.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('149', '165', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":311.7,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":312.55,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('150', '166', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":315.25,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":178,\"CFVIEWY\":301.15,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('151', '167', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":310.6,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":179.15,\"CFVIEWY\":304.7,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('152', '168', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.75,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":301.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('153', '169', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":312,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":317,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('154', '170', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":311,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":175,\"CFVIEWY\":290,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('155', '171', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":177,\"CFVIEWY\":286,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('156', '172', '2', '[{\"CRVIEWX\":297,\"SRVIEWY\":311,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":178,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('157', '173', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('158', '174', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('159', '175', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":308,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('160', '176', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":314,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":297,\"SRVIEWX\":39}]');
INSERT INTO `canves_backgrounds` VALUES ('161', '177', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":312,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('162', '178', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":313,\"CRVIEWY\":301,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":178,\"CFVIEWY\":301,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('163', '179', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.2,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('164', '180', '2', '[{\"CRVIEWX\":286,\"SRVIEWY\":315,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('165', '181', '2', '[{\"CRVIEWX\":317.25,\"SRVIEWY\":312.9,\"CRVIEWY\":317.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":180.3,\"CFVIEWY\":296.5,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('166', '182', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":312,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('167', '183', '2', '[{\"CRVIEWX\":318.45,\"SRVIEWY\":312.9,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":299.65,\"SFVIEWY\":179.15,\"CFVIEWY\":303.5,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('168', '184', '2', '[{\"CRVIEWX\":319.65,\"SRVIEWY\":312.9,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":38.1,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('169', '185', '2', '[{\"CRVIEWX\":324.3,\"SRVIEWY\":312.95,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":177.95,\"CFVIEWY\":296.45,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('170', '186', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":180.3,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('171', '187', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('172', '188', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":312.9,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":179.15,\"CFVIEWY\":301.15,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('173', '189', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('174', '190', '2', '[{\"CRVIEWX\":312.6,\"SRVIEWY\":311.75,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":325.45,\"SFVIEWY\":180.3,\"CFVIEWY\":300,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('175', '191', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('176', '192', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":310,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('177', '193', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":315.2,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.15,\"CFVIEWY\":302.3,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('178', '194', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":315.25,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":181.45,\"CFVIEWY\":297.65,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('179', '195', '2', '[{\"CRVIEWX\":285,\"SRVIEWY\":310,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('180', '196', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('181', '197', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":315,\"SFVIEWY\":178,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('182', '198', '2', '[{\"CRVIEWX\":298,\"SRVIEWY\":315,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":179,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('183', '199', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":311,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":315,\"SFVIEWY\":175,\"CFVIEWY\":290,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('184', '200', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":312,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('185', '201', '2', '[{\"CRVIEWX\":286,\"SRVIEWY\":315,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":176,\"CFVIEWY\":290,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('186', '202', '2', '[{\"CRVIEWX\":318.4,\"SRVIEWY\":314.05,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":179.1,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('187', '203', '2', '[{\"CRVIEWX\":307.95,\"SRVIEWY\":315.25,\"CRVIEWY\":314,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":177.95,\"CFVIEWY\":305.85,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('188', '204', '2', '[{\"CRVIEWX\":319.6,\"SRVIEWY\":311.7,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":180.3,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('189', '205', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":315.25,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":293.85,\"SFVIEWY\":181.5,\"CFVIEWY\":295.3,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('190', '206', '2', '[{\"CRVIEWX\":317.25,\"SRVIEWY\":314.1,\"CRVIEWY\":312.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":179.15,\"CFVIEWY\":301.15,\"SRVIEWX\":39.3}]');
INSERT INTO `canves_backgrounds` VALUES ('191', '207', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":316.4,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":320.8,\"SFVIEWY\":177.95,\"CFVIEWY\":298.85,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('192', '208', '2', '[{\"CRVIEWX\":305.5,\"SRVIEWY\":314.1,\"CRVIEWY\":301.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":180.3,\"CFVIEWY\":304.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('193', '209', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":312.9,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":302,\"SFVIEWY\":179.1,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('194', '210', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":314.1,\"CRVIEWY\":308.15,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":297.3,\"SFVIEWY\":179.15,\"CFVIEWY\":297.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('195', '211', '2', '[{\"CRVIEWX\":304.4,\"SRVIEWY\":315.25,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":317.25,\"SFVIEWY\":177.95,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('196', '212', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":315.25,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":303.15,\"SFVIEWY\":179.1,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('197', '213', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":312,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('198', '214', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":312.9,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":178,\"CFVIEWY\":298.8,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('199', '215', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":311,\"CRVIEWY\":288,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('200', '216', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":313,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":177,\"CFVIEWY\":286,\"SRVIEWX\":33}]');
INSERT INTO `canves_backgrounds` VALUES ('201', '217', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":311,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":177,\"CFVIEWY\":286,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('202', '218', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":313,\"CRVIEWY\":287,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('203', '219', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":317,\"SFVIEWY\":178,\"CFVIEWY\":286,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('204', '220', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":315,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":178,\"CFVIEWY\":283,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('205', '221', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":313,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('206', '222', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":310,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":312,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('207', '223', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":313,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('208', '224', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":310,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":285,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('209', '225', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":310,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":311,\"SFVIEWY\":177,\"CFVIEWY\":288,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('210', '226', '2', '[{\"CRVIEWX\":285,\"SRVIEWY\":312,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":178,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('211', '227', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":314,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":178,\"CFVIEWY\":290,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('212', '228', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('213', '229', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":311,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('214', '230', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.95,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":314.9,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('215', '231', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":312.9,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('216', '232', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":312.9,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":295,\"SFVIEWY\":177.95,\"CFVIEWY\":300,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('217', '233', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":314.1,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":295,\"SFVIEWY\":179.15,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('218', '234', '2', '[{\"CRVIEWX\":296.2,\"SRVIEWY\":315.25,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":292.6,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('219', '235', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":315.25,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":286.8,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('220', '236', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":314.1,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":289.15,\"SFVIEWY\":177.95,\"CFVIEWY\":301.2,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('221', '237', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":311.7,\"CRVIEWY\":308.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":181.45,\"CFVIEWY\":295.3,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('222', '238', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":316.45,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('223', '239', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":312.9,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":296.45,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('224', '240', '2', '[{\"CRVIEWX\":307.95,\"SRVIEWY\":311.7,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":179.15,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('225', '241', '2', '[{\"CRVIEWX\":309.1,\"SRVIEWY\":312.9,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.4,\"SFVIEWY\":180.3,\"CFVIEWY\":298.85,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('226', '242', '2', '[{\"SRVIEWX\":35,\"CFVIEWX\":297,\"CRVIEWX\":299,\"SRVIEWY\":287,\"CFVIEWY\":253,\"CRVIEWY\":268,\"SFVIEWX\":37,\"SIVIEWX\":29,\"CIVIEWX\":255,\"SFVIEWY\":151,\"SIVIEWY\":400,\"CIVIEWY\":102}]');
INSERT INTO `canves_backgrounds` VALUES ('227', '243', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":309,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":313,\"SFVIEWY\":176,\"CFVIEWY\":290,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('228', '244', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":314,\"CRVIEWY\":288,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":176,\"CFVIEWY\":286,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('229', '245', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":315,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":177,\"CFVIEWY\":284,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('230', '246', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":314,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('231', '247', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":179,\"CFVIEWY\":285,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('232', '248', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('233', '249', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":314,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":178,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('234', '250', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":314,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":178,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('235', '251', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":311,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('236', '252', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":312,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":178,\"CFVIEWY\":285,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('237', '253', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":310,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":315,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('238', '254', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":312,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":178,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('239', '255', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":314,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":178,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('240', '256', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":310,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":288,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('241', '257', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":283,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('242', '258', '2', '[{\"CRVIEWX\":283,\"SRVIEWY\":313,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":178,\"CFVIEWY\":281,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('243', '259', '2', '[{\"CRVIEWX\":286,\"SRVIEWY\":310,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":288,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('244', '260', '2', '[{\"CRVIEWX\":283,\"SRVIEWY\":310,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":176,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('245', '261', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":311,\"CRVIEWY\":298,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":176,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('246', '262', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":311.7,\"CRVIEWY\":308.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.85,\"SFVIEWY\":178,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('247', '263', '2', '[{\"CRVIEWX\":312.6,\"SRVIEWY\":312.9,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":304.4,\"SFVIEWY\":179.15,\"CFVIEWY\":301.15,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('248', '264', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":179.1,\"CFVIEWY\":298.85,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('249', '265', '2', '[{\"CRVIEWX\":313.8,\"SRVIEWY\":312.95,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":179.15,\"CFVIEWY\":298.85,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('250', '266', '2', '[{\"CRVIEWX\":305.5,\"SRVIEWY\":314.1,\"CRVIEWY\":309.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":299.65,\"SFVIEWY\":180.3,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('251', '267', '2', '[{\"CRVIEWX\":307.85,\"SRVIEWY\":314.1,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":297.3,\"SFVIEWY\":180.3,\"CFVIEWY\":297.6,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('252', '268', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":311,\"CRVIEWY\":287,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":176,\"CFVIEWY\":291,\"SRVIEWX\":33}]');
INSERT INTO `canves_backgrounds` VALUES ('253', '269', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":314,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":328,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('254', '270', '2', '[{\"CRVIEWX\":290,\"SRVIEWY\":314,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":175,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('255', '271', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":310,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":179,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('256', '272', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":312,\"CRVIEWY\":297,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('257', '273', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('258', '274', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":178,\"CFVIEWY\":287,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('259', '275', '2', '[{\"CRVIEWX\":298,\"SRVIEWY\":308,\"CRVIEWY\":290,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":176,\"CFVIEWY\":281,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('260', '276', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":313,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":178,\"CFVIEWY\":291,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('261', '277', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":315,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":292,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('262', '278', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":310,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('263', '279', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":312,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('264', '280', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":314.05,\"CRVIEWY\":312.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('265', '281', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":312.95,\"CRVIEWY\":309.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('266', '282', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":312.85,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":286.75,\"SFVIEWY\":179.15,\"CFVIEWY\":296.5,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('267', '283', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":312.9,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":311.4,\"SFVIEWY\":178,\"CFVIEWY\":302.3,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('268', '284', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":290.3,\"SFVIEWY\":179.15,\"CFVIEWY\":297.65,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('269', '285', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":177.95,\"CFVIEWY\":298.85,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('270', '286', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":312,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":176,\"CFVIEWY\":287,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('271', '287', '2', '[{\"CRVIEWX\":285,\"SRVIEWY\":313,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":177,\"CFVIEWY\":284,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('272', '288', '2', '[{\"CRVIEWX\":279.7,\"SRVIEWY\":311.7,\"CRVIEWY\":290.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":275.05,\"SFVIEWY\":177.95,\"CFVIEWY\":274.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('273', '289', '2', '[{\"CRVIEWX\":280.9,\"SRVIEWY\":314.05,\"CRVIEWY\":294.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":283.25,\"SFVIEWY\":178,\"CFVIEWY\":270.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('274', '290', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('275', '291', '2', '[{\"CRVIEWX\":282.1,\"SRVIEWY\":310.55,\"CRVIEWY\":292.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":277.4,\"SFVIEWY\":178,\"CFVIEWY\":270.65,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('276', '292', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":178,\"CFVIEWY\":286,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('277', '293', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":176,\"CFVIEWY\":284,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('278', '294', '2', '[{\"CRVIEWX\":279.75,\"SRVIEWY\":311.7,\"CRVIEWY\":285.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":275.05,\"SFVIEWY\":177.95,\"CFVIEWY\":273.05,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('279', '295', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":310,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":287,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('280', '296', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":314.1,\"CRVIEWY\":288.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":279.75,\"SFVIEWY\":177.95,\"CFVIEWY\":275.35,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('281', '297', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":311,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":324,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('282', '298', '2', '[{\"CRVIEWX\":297,\"SRVIEWY\":310,\"CRVIEWY\":296,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":176,\"CFVIEWY\":285,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('283', '299', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":310,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":176,\"CFVIEWY\":285,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('284', '300', '2', '[{\"CRVIEWX\":278.55,\"SRVIEWY\":312.9,\"CRVIEWY\":288.3,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":273.85,\"SFVIEWY\":179.1,\"CFVIEWY\":270.65,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('285', '301', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":312,\"CRVIEWY\":288,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":177,\"CFVIEWY\":285,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('286', '302', '2', '[{\"CRVIEWX\":282.05,\"SRVIEWY\":316.4,\"CRVIEWY\":290.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":283.25,\"SFVIEWY\":177.95,\"CFVIEWY\":271.85,\"SRVIEWX\":39.3}]');
INSERT INTO `canves_backgrounds` VALUES ('287', '303', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":177,\"CFVIEWY\":286,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('288', '304', '2', '[{\"CRVIEWX\":297,\"SRVIEWY\":311,\"CRVIEWY\":285,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":180,\"CFVIEWY\":289,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('289', '305', '2', '[{\"CRVIEWX\":293,\"SRVIEWY\":311,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":179,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('290', '306', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":313,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":319,\"SFVIEWY\":178,\"CFVIEWY\":284,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('291', '307', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":312,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":180,\"CFVIEWY\":286,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('292', '308', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":313,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('293', '309', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":312,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":178,\"CFVIEWY\":290,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('294', '310', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":312,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":176,\"CFVIEWY\":285,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('295', '311', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":312,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":178,\"CFVIEWY\":284,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('296', '312', '2', '[{\"CRVIEWX\":288,\"SRVIEWY\":312,\"CRVIEWY\":292,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":178,\"CFVIEWY\":286,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('297', '313', '2', '[{\"CRVIEWX\":297,\"SRVIEWY\":314,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":176,\"CFVIEWY\":286,\"SRVIEWX\":38}]');
INSERT INTO `canves_backgrounds` VALUES ('298', '314', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":176,\"CFVIEWY\":288,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('299', '315', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":313,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":179,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('300', '316', '2', '[{\"CRVIEWX\":283,\"SRVIEWY\":310,\"CRVIEWY\":289,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":288,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('301', '317', '2', '[{\"CRVIEWX\":292,\"SRVIEWY\":312,\"CRVIEWY\":295,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":178,\"CFVIEWY\":281,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('302', '318', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":311,\"CRVIEWY\":287,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":288,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('303', '319', '2', '[{\"CRVIEWX\":291,\"SRVIEWY\":313,\"CRVIEWY\":293,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":177,\"CFVIEWY\":290,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('304', '320', '2', '[{\"CRVIEWX\":289,\"SRVIEWY\":312,\"CRVIEWY\":291,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":289,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('305', '321', '2', '[{\"CRVIEWX\":287,\"SRVIEWY\":315,\"CRVIEWY\":287,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":177,\"CFVIEWY\":291,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('306', '322', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":313,\"CRVIEWY\":294,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":178,\"CFVIEWY\":287,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('307', '323', '2', '[{\"CRVIEWX\":295,\"SRVIEWY\":313,\"CRVIEWY\":307,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":177,\"CFVIEWY\":316,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('308', '324', '2', '[{\"CRVIEWX\":300,\"SRVIEWY\":314,\"CRVIEWY\":309,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":178,\"CFVIEWY\":316,\"SRVIEWX\":33}]');
INSERT INTO `canves_backgrounds` VALUES ('309', '325', '2', '[{\"CRVIEWX\":301,\"SRVIEWY\":311,\"CRVIEWY\":305,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":316,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('310', '326', '2', '[{\"CRVIEWX\":297,\"SRVIEWY\":310,\"CRVIEWY\":312,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":313,\"SFVIEWY\":179,\"CFVIEWY\":318,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('311', '327', '2', '[{\"CRVIEWX\":299,\"SRVIEWY\":314,\"CRVIEWY\":311,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":315,\"SFVIEWY\":178,\"CFVIEWY\":312,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('312', '328', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":314,\"CRVIEWY\":313,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":317,\"SFVIEWY\":177,\"CFVIEWY\":313,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('313', '329', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":314.1,\"CRVIEWY\":289.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":280.95,\"SFVIEWY\":178,\"CFVIEWY\":274.2,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('314', '330', '2', '[{\"CRVIEWX\":284.45,\"SRVIEWY\":312.9,\"CRVIEWY\":289.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":283.25,\"SFVIEWY\":179.15,\"CFVIEWY\":271.85,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('315', '331', '2', '[{\"CRVIEWX\":286.75,\"SRVIEWY\":312.9,\"CRVIEWY\":289.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":276.2,\"SFVIEWY\":178,\"CFVIEWY\":275.35,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('316', '332', '2', '[{\"CRVIEWX\":287.9,\"SRVIEWY\":311.75,\"CRVIEWY\":290.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":282.1,\"SFVIEWY\":179.15,\"CFVIEWY\":275.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('317', '333', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":310.55,\"CRVIEWY\":285.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":278.6,\"SFVIEWY\":179.15,\"CFVIEWY\":274.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('318', '334', '2', '[{\"CRVIEWX\":280.9,\"SRVIEWY\":311.7,\"CRVIEWY\":289.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":273.85,\"SFVIEWY\":177.95,\"CFVIEWY\":274.2,\"SRVIEWX\":33.4}]');
INSERT INTO `canves_backgrounds` VALUES ('319', '335', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":312.9,\"CRVIEWY\":288.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":283.25,\"SFVIEWY\":177.95,\"CFVIEWY\":273,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('320', '336', '2', '[{\"CRVIEWX\":287.95,\"SRVIEWY\":311.75,\"CRVIEWY\":289.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":273.9,\"SFVIEWY\":178,\"CFVIEWY\":273,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('321', '337', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('322', '338', '2', '[{\"CRVIEWX\":284.4,\"SRVIEWY\":312.9,\"CRVIEWY\":290.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":278.55,\"SFVIEWY\":176.8,\"CFVIEWY\":270.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('323', '339', '2', '[{\"CRVIEWX\":301,\"SRVIEWY\":312,\"CRVIEWY\":312,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":320,\"SFVIEWY\":177,\"CFVIEWY\":319,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('324', '340', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":310,\"CRVIEWY\":310,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36,\"CIVIEWY\":130,\"CFVIEWX\":313,\"SFVIEWY\":177,\"CFVIEWY\":319,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('325', '341', '2', '[{\"CRVIEWX\":284.45,\"SRVIEWY\":312.9,\"CRVIEWY\":287.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":277.4,\"SFVIEWY\":176.8,\"CFVIEWY\":273,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('326', '342', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":310.55,\"CRVIEWY\":289.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":272.7,\"SFVIEWY\":176.8,\"CFVIEWY\":273,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('327', '343', '2', '[{\"CRVIEWX\":289.1,\"SRVIEWY\":311.7,\"CRVIEWY\":290.6,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":278.55,\"SFVIEWY\":177.95,\"CFVIEWY\":273.05,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('328', '344', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":312,\"CRVIEWY\":304,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":179,\"CFVIEWY\":314,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('329', '345', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":314.1,\"CRVIEWY\":288.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":279.7,\"SFVIEWY\":179.15,\"CFVIEWY\":270.7,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('330', '346', '2', '[{\"CRVIEWX\":283.25,\"SRVIEWY\":311.7,\"CRVIEWY\":288.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":280.9,\"SFVIEWY\":179.15,\"CFVIEWY\":275.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('331', '347', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":312,\"CRVIEWY\":302,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":176,\"CFVIEWY\":316,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('332', '348', '2', '[{\"CRVIEWX\":279.7,\"SRVIEWY\":311.75,\"CRVIEWY\":291.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":280.9,\"SFVIEWY\":178,\"CFVIEWY\":274.15,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('333', '349', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":312,\"CRVIEWY\":310,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":178,\"CFVIEWY\":317,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('334', '350', '2', '[{\"CRVIEWX\":287.95,\"SRVIEWY\":311.75,\"CRVIEWY\":291.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":275.05,\"SFVIEWY\":177.95,\"CFVIEWY\":275.35,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('335', '351', '2', '[{\"CRVIEWX\":308,\"SRVIEWY\":312,\"CRVIEWY\":313,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":177,\"CFVIEWY\":314,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('336', '352', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":313,\"CRVIEWY\":308,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":317,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('337', '353', '2', '[{\"CRVIEWX\":304,\"SRVIEWY\":315,\"CRVIEWY\":309,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":178,\"CFVIEWY\":313,\"SRVIEWX\":33}]');
INSERT INTO `canves_backgrounds` VALUES ('338', '354', '2', '[{\"CRVIEWX\":294,\"SRVIEWY\":312,\"CRVIEWY\":302,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32,\"CIVIEWY\":130,\"CFVIEWX\":304,\"SFVIEWY\":176,\"CFVIEWY\":312,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('339', '355', '2', '[{\"CRVIEWX\":296,\"SRVIEWY\":313,\"CRVIEWY\":300,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":178,\"CFVIEWY\":309,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('340', '356', '2', '[{\"CRVIEWX\":303,\"SRVIEWY\":314,\"CRVIEWY\":306,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":177,\"CFVIEWY\":315,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('341', '357', '2', '[{\"CRVIEWX\":306,\"SRVIEWY\":313,\"CRVIEWY\":308,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":323,\"SFVIEWY\":177,\"CFVIEWY\":316,\"SRVIEWX\":36}]');
INSERT INTO `canves_backgrounds` VALUES ('342', '358', '2', '[{\"CRVIEWX\":318.45,\"SRVIEWY\":311.75,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('343', '359', '2', '[{\"CRVIEWX\":323.15,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":178,\"CFVIEWY\":294.1,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('344', '360', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":305.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":306.75,\"SFVIEWY\":179.15,\"CFVIEWY\":295.25,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('345', '361', '2', '[{\"CRVIEWX\":299,\"SRVIEWY\":310,\"CRVIEWY\":306,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":314,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('346', '362', '2', '[{\"CRVIEWX\":304,\"SRVIEWY\":314,\"CRVIEWY\":311,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":178,\"CFVIEWY\":313,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('347', '363', '2', '[{\"CRVIEWX\":327.85,\"SRVIEWY\":311.7,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":304.4,\"SFVIEWY\":176.8,\"CFVIEWY\":302.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('348', '364', '2', '[{\"CRVIEWX\":318.45,\"SRVIEWY\":311.75,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":178,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('349', '365', '2', '[{\"CRVIEWX\":308,\"SRVIEWY\":313,\"CRVIEWY\":312,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":179,\"CFVIEWY\":316,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('350', '366', '2', '[{\"CRVIEWX\":255,\"SRVIEWY\":311,\"CRVIEWY\":130,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":179,\"CFVIEWY\":317,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('351', '367', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":312.9,\"CRVIEWY\":307.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":178,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('352', '368', '2', '[{\"CRVIEWX\":322,\"SRVIEWY\":311.7,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":293.8,\"SFVIEWY\":178,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('353', '369', '2', '[{\"CRVIEWX\":320.8,\"SRVIEWY\":315.25,\"CRVIEWY\":316.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('354', '370', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":311.75,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":292.65,\"SFVIEWY\":176.8,\"CFVIEWY\":301.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('355', '371', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.15,\"CFVIEWY\":291.8,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('356', '372', '2', '[{\"CRVIEWX\":308,\"SRVIEWY\":314,\"CRVIEWY\":306,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":321,\"SFVIEWY\":177,\"CFVIEWY\":309,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('357', '373', '2', '[{\"CRVIEWX\":325.45,\"SRVIEWY\":310.6,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":177.95,\"CFVIEWY\":295.25,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('358', '374', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":312,\"CRVIEWY\":310,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":316,\"SFVIEWY\":178,\"CFVIEWY\":315,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('359', '375', '2', '[{\"CRVIEWX\":307.85,\"SRVIEWY\":312.9,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":179.1,\"CFVIEWY\":296.45,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('360', '376', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":318,\"CRVIEWY\":312,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":318,\"SFVIEWY\":177,\"CFVIEWY\":315,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('361', '377', '2', '[{\"CRVIEWX\":307,\"SRVIEWY\":314,\"CRVIEWY\":303,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":176,\"CFVIEWY\":315,\"SRVIEWX\":34}]');
INSERT INTO `canves_backgrounds` VALUES ('362', '378', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":313,\"CRVIEWY\":305,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":325,\"SFVIEWY\":177,\"CFVIEWY\":311,\"SRVIEWX\":32}]');
INSERT INTO `canves_backgrounds` VALUES ('363', '379', '2', '[{\"CRVIEWX\":304,\"SRVIEWY\":312,\"CRVIEWY\":306,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34,\"CIVIEWY\":130,\"CFVIEWX\":326,\"SFVIEWY\":175,\"CFVIEWY\":314,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('364', '380', '2', '[{\"CRVIEWX\":302.25,\"SRVIEWY\":313,\"CRVIEWY\":308.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":320.35,\"SFVIEWY\":177.15,\"CFVIEWY\":314.8,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('365', '381', '2', '[{\"CRVIEWX\":305.25,\"SRVIEWY\":315.1,\"CRVIEWY\":303.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":31.85,\"CIVIEWY\":130,\"CFVIEWX\":324.35,\"SFVIEWY\":178.15,\"CFVIEWY\":311.75,\"SRVIEWX\":35.95}]');
INSERT INTO `canves_backgrounds` VALUES ('366', '382', '2', '[{\"CRVIEWX\":322,\"SRVIEWY\":308.2,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":316.1,\"SFVIEWY\":179.1,\"CFVIEWY\":301.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('367', '383', '2', '[{\"CRVIEWX\":306.25,\"SRVIEWY\":310,\"CRVIEWY\":308.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":323.35,\"SFVIEWY\":178.1,\"CFVIEWY\":313.8,\"SRVIEWX\":33.9}]');
INSERT INTO `canves_backgrounds` VALUES ('368', '384', '2', '[{\"CRVIEWX\":306.25,\"SRVIEWY\":314.05,\"CRVIEWY\":306.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":324.35,\"SFVIEWY\":178.1,\"CFVIEWY\":313.75,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('369', '385', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":311.75,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":177.95,\"CFVIEWY\":300,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('370', '386', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('371', '387', '2', '[{\"CRVIEWX\":306,\"SRVIEWY\":313,\"CRVIEWY\":306,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35,\"CIVIEWY\":130,\"CFVIEWX\":322,\"SFVIEWY\":178,\"CFVIEWY\":317,\"SRVIEWX\":35}]');
INSERT INTO `canves_backgrounds` VALUES ('372', '388', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":311.7,\"CRVIEWY\":308.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":177.95,\"CFVIEWY\":296.45,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('373', '389', '2', '[{\"CRVIEWX\":314,\"SRVIEWY\":315,\"CRVIEWY\":312,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33,\"CIVIEWY\":130,\"CFVIEWX\":327,\"SFVIEWY\":177,\"CFVIEWY\":316,\"SRVIEWX\":37}]');
INSERT INTO `canves_backgrounds` VALUES ('374', '390', '2', '[{\"CRVIEWX\":312.6,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('375', '391', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":310.55,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('376', '392', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":309.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":179.1,\"CFVIEWY\":295.25,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('377', '393', '2', '[{\"CRVIEWX\":299.2,\"SRVIEWY\":310.75,\"CRVIEWY\":299,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":310,\"SFVIEWY\":176.85,\"CFVIEWY\":311.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('378', '394', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.75,\"CRVIEWY\":312.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('379', '395', '2', '[{\"CRVIEWX\":301.2,\"SRVIEWY\":312.75,\"CRVIEWY\":304.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":177.85,\"CFVIEWY\":308.85,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('380', '396', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.75,\"CRVIEWY\":312.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":323.15,\"SFVIEWY\":177.95,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('381', '397', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":309.8,\"CRVIEWY\":308.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":176.85,\"CFVIEWY\":310.8,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('382', '398', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('383', '399', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":310.8,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":326.75,\"SFVIEWY\":177.85,\"CFVIEWY\":317.65,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('384', '400', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":311.75,\"CRVIEWY\":308.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":176.85,\"CFVIEWY\":313.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('385', '401', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('386', '402', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":312.7,\"CRVIEWY\":308.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.85,\"CFVIEWY\":314.75,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('387', '403', '2', '[{\"CRVIEWX\":309.1,\"SRVIEWY\":311.7,\"CRVIEWY\":275.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":38.1,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":289.4,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('388', '404', '2', '[{\"CRVIEWX\":304.4,\"SRVIEWY\":311.75,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":177.95,\"CFVIEWY\":295.3,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('389', '405', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":305.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('390', '406', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":179.15,\"CFVIEWY\":297.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('391', '407', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":312.9,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":180.3,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('392', '408', '2', '[{\"CRVIEWX\":302.15,\"SRVIEWY\":311.75,\"CRVIEWY\":309.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":323.75,\"SFVIEWY\":177.85,\"CFVIEWY\":318.65,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('393', '409', '2', '[{\"CRVIEWX\":288.75,\"SRVIEWY\":312.35,\"CRVIEWY\":274.95,\"SIVIEWX\":28.95,\"CIVIEWX\":255,\"SIVIEWY\":433.1,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":306.75,\"SFVIEWY\":177.5,\"CFVIEWY\":286.2,\"SRVIEWX\":34.5}]');
INSERT INTO `canves_backgrounds` VALUES ('394', '410', '2', '[{\"CRVIEWX\":301.15,\"SRVIEWY\":311.75,\"CRVIEWY\":302.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.85,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.85,\"CFVIEWY\":315.7,\"SRVIEWX\":33.9}]');
INSERT INTO `canves_backgrounds` VALUES ('395', '411', '2', '[{\"CRVIEWX\":311.05,\"SRVIEWY\":313.75,\"CRVIEWY\":301.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":179.8,\"CFVIEWY\":314.7,\"SRVIEWX\":37.85}]');
INSERT INTO `canves_backgrounds` VALUES ('396', '412', '2', '[{\"CRVIEWX\":308.1,\"SRVIEWY\":311.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":324.75,\"SFVIEWY\":177.9,\"CFVIEWY\":314.7,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('397', '413', '2', '[{\"CRVIEWX\":301.2,\"SRVIEWY\":311.75,\"CRVIEWY\":309.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":175.85,\"CFVIEWY\":318.65,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('398', '414', '2', '[{\"CRVIEWX\":306.15,\"SRVIEWY\":313.7,\"CRVIEWY\":310.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":321.85,\"SFVIEWY\":176.9,\"CFVIEWY\":315.7,\"SRVIEWX\":36.8}]');
INSERT INTO `canves_backgrounds` VALUES ('399', '415', '2', '[{\"CRVIEWX\":310.05,\"SRVIEWY\":310.8,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":321.85,\"SFVIEWY\":177.85,\"CFVIEWY\":317.65,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('400', '416', '2', '[{\"CRVIEWX\":308.05,\"SRVIEWY\":311.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.85,\"CFVIEWY\":311.75,\"SRVIEWX\":36.8}]');
INSERT INTO `canves_backgrounds` VALUES ('401', '417', '2', '[{\"CRVIEWX\":304.1,\"SRVIEWY\":310.75,\"CRVIEWY\":307.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":322.85,\"SFVIEWY\":177.85,\"CFVIEWY\":317.65,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('402', '418', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":313.75,\"CRVIEWY\":310.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":177.85,\"CFVIEWY\":320.6,\"SRVIEWX\":35.9}]');
INSERT INTO `canves_backgrounds` VALUES ('403', '419', '2', '[{\"CRVIEWX\":311.05,\"SRVIEWY\":311.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":178.85,\"CFVIEWY\":319.65,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('404', '420', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":310.8,\"CRVIEWY\":309.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":325.8,\"SFVIEWY\":176.9,\"CFVIEWY\":315.7,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('405', '421', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":310.8,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":326.75,\"SFVIEWY\":176.85,\"CFVIEWY\":316.7,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('406', '422', '2', '[{\"CRVIEWX\":298.25,\"SRVIEWY\":311.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.9,\"CFVIEWY\":311.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('407', '423', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.75,\"CRVIEWY\":302.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.85,\"CIVIEWY\":130,\"CFVIEWX\":326.75,\"SFVIEWY\":177.85,\"CFVIEWY\":314.65,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('408', '424', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":311.75,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":325.75,\"SFVIEWY\":177.85,\"CFVIEWY\":311.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('409', '425', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":310.8,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":177.85,\"CFVIEWY\":313.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('410', '426', '2', '[{\"CRVIEWX\":308.05,\"SRVIEWY\":310.75,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":176.85,\"CFVIEWY\":318.65,\"SRVIEWX\":33.85}]');
INSERT INTO `canves_backgrounds` VALUES ('411', '427', '2', '[{\"CRVIEWX\":308.05,\"SRVIEWY\":311.75,\"CRVIEWY\":302.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":322.85,\"SFVIEWY\":178.8,\"CFVIEWY\":312.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('412', '428', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":312.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":324.8,\"SFVIEWY\":176.9,\"CFVIEWY\":315.7,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('413', '429', '2', '[{\"CRVIEWX\":313,\"SRVIEWY\":310.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":324.8,\"SFVIEWY\":175.85,\"CFVIEWY\":313.75,\"SRVIEWX\":33.85}]');
INSERT INTO `canves_backgrounds` VALUES ('414', '430', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":313.75,\"CRVIEWY\":302.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":318.85,\"SFVIEWY\":176.9,\"CFVIEWY\":305.85,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('415', '431', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":311.75,\"CRVIEWY\":308.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":316.9,\"SFVIEWY\":177.85,\"CFVIEWY\":314.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('416', '432', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":311.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":319.9,\"SFVIEWY\":175.85,\"CFVIEWY\":313.7,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('417', '433', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":309.8,\"CRVIEWY\":310.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":176.85,\"CFVIEWY\":313.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('418', '434', '2', '[{\"CRVIEWX\":311.05,\"SRVIEWY\":310.8,\"CRVIEWY\":308.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":175.9,\"CFVIEWY\":310.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('419', '435', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":308.8,\"CRVIEWY\":308.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":321.85,\"SFVIEWY\":176.9,\"CFVIEWY\":307.85,\"SRVIEWX\":37.8}]');
INSERT INTO `canves_backgrounds` VALUES ('420', '436', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":309.8,\"CRVIEWY\":307.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":313.95,\"SFVIEWY\":176.9,\"CFVIEWY\":310.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('421', '437', '2', '[{\"CRVIEWX\":300.2,\"SRVIEWY\":310.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":310.05,\"SFVIEWY\":177.85,\"CFVIEWY\":306.9,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('422', '438', '2', '[{\"CRVIEWX\":298.25,\"SRVIEWY\":310.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":314,\"SFVIEWY\":176.85,\"CFVIEWY\":309.8,\"SRVIEWX\":36.8}]');
INSERT INTO `canves_backgrounds` VALUES ('423', '439', '2', '[{\"CRVIEWX\":297.25,\"SRVIEWY\":310.75,\"CRVIEWY\":302.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":175.9,\"CFVIEWY\":311.75,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('428', '444', '2', '[{\"CRVIEWX\":305.6,\"SRVIEWY\":312.35,\"CRVIEWY\":275,\"SIVIEWX\":30.05,\"CIVIEWX\":255,\"SIVIEWY\":430.85,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":294.35,\"SFVIEWY\":178.65,\"CFVIEWY\":285.1,\"SRVIEWX\":32.3}]');
INSERT INTO `canves_backgrounds` VALUES ('425', '441', '2', '[{\"CRVIEWX\":302.2,\"SRVIEWY\":312.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":313.95,\"SFVIEWY\":176.85,\"CFVIEWY\":313.7,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('426', '442', '2', '[{\"CRVIEWX\":304.15,\"SRVIEWY\":312.7,\"CRVIEWY\":309.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":178.9,\"CFVIEWY\":313.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('427', '443', '2', '[{\"CRVIEWX\":312,\"SRVIEWY\":312.75,\"CRVIEWY\":305.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":178.85,\"CFVIEWY\":311.8,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('429', '445', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":310.75,\"CRVIEWY\":312.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":178.8,\"CFVIEWY\":310.8,\"SRVIEWX\":37.8}]');
INSERT INTO `canves_backgrounds` VALUES ('430', '446', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":310.75,\"CRVIEWY\":310.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":176.85,\"CFVIEWY\":310.8,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('431', '447', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":312.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":318.9,\"SFVIEWY\":177.8,\"CFVIEWY\":312.75,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('432', '448', '2', '[{\"CRVIEWX\":300.2,\"SRVIEWY\":310.75,\"CRVIEWY\":300.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":176.85,\"CFVIEWY\":310.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('433', '449', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":311.75,\"CRVIEWY\":310.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":176.85,\"CFVIEWY\":316.7,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('434', '450', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":310.75,\"CRVIEWY\":308.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":177.85,\"CFVIEWY\":313.75,\"SRVIEWX\":36.8}]');
INSERT INTO `canves_backgrounds` VALUES ('435', '451', '2', '[{\"CRVIEWX\":293.25,\"SRVIEWY\":311.25,\"CRVIEWY\":273.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":30,\"CIVIEWY\":130,\"CFVIEWX\":304.5,\"SFVIEWY\":172,\"CFVIEWY\":286.25,\"SRVIEWX\":22.2}]');
INSERT INTO `canves_backgrounds` VALUES ('436', '452', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":176.8,\"CFVIEWY\":296.45,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('437', '453', '2', '[{\"CRVIEWX\":302,\"SRVIEWY\":317.6,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":306.75,\"SFVIEWY\":177.95,\"CFVIEWY\":301.15,\"SRVIEWX\":33.45}]');
INSERT INTO `canves_backgrounds` VALUES ('438', '454', '2', '[{\"CRVIEWX\":313.8,\"SRVIEWY\":310.6,\"CRVIEWY\":314,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('439', '455', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":310.55,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":178,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('440', '456', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":310.8,\"CRVIEWY\":311.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":315.9,\"SFVIEWY\":176.85,\"CFVIEWY\":315.7,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('441', '457', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":310.55,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":294.95,\"SFVIEWY\":176.8,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('442', '458', '2', '[{\"CRVIEWX\":315.9,\"SRVIEWY\":309.8,\"CRVIEWY\":312.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":322.3,\"SFVIEWY\":176.9,\"CFVIEWY\":313.5,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('443', '459', '2', '[{\"CRVIEWX\":304.5,\"SRVIEWY\":311.25,\"CRVIEWY\":277.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":30,\"CIVIEWY\":130,\"CFVIEWX\":298.85,\"SFVIEWY\":172,\"CFVIEWY\":298.55,\"SRVIEWX\":32.3}]');
INSERT INTO `canves_backgrounds` VALUES ('444', '460', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":311.7,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":176.8,\"CFVIEWY\":299.95,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('445', '461', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":312.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":177.85,\"CFVIEWY\":309.8,\"SRVIEWX\":37.8}]');
INSERT INTO `canves_backgrounds` VALUES ('446', '462', '2', '[{\"CRVIEWX\":305.5,\"SRVIEWY\":310.6,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":178,\"CFVIEWY\":296.45,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('447', '463', '2', '[{\"CRVIEWX\":308.05,\"SRVIEWY\":312.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":316.95,\"SFVIEWY\":175.9,\"CFVIEWY\":315.7,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('448', '464', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":312.9,\"CRVIEWY\":305.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":178,\"CFVIEWY\":296.45,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('449', '465', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":315.25,\"CRVIEWY\":308.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":312.6,\"SFVIEWY\":179.15,\"CFVIEWY\":298.85,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('450', '466', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":311.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":176.85,\"CFVIEWY\":313.7,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('451', '467', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.7,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":176.8,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('452', '468', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":312.7,\"CRVIEWY\":310.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":177.85,\"CFVIEWY\":317.65,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('453', '469', '2', '[{\"CRVIEWX\":311.45,\"SRVIEWY\":311.7,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":178,\"CFVIEWY\":302.35,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('454', '470', '2', '[{\"CRVIEWX\":314.9,\"SRVIEWY\":314.05,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":310.25,\"SFVIEWY\":178,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('455', '471', '2', '[{\"CRVIEWX\":300.2,\"SRVIEWY\":308.8,\"CRVIEWY\":305.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":174.9,\"CFVIEWY\":309.75,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('456', '472', '2', '[{\"CRVIEWX\":297.35,\"SRVIEWY\":311.7,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":306.7,\"SFVIEWY\":177.95,\"CFVIEWY\":294.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('457', '473', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":312.75,\"CRVIEWY\":309.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":318.85,\"SFVIEWY\":175.9,\"CFVIEWY\":309.8,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('458', '474', '2', '[{\"CRVIEWX\":298.5,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":304.4,\"SFVIEWY\":178,\"CFVIEWY\":300,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('459', '475', '2', '[{\"CRVIEWX\":319.6,\"SRVIEWY\":310.55,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('460', '476', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":314.05,\"CRVIEWY\":308.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('461', '477', '2', '[{\"CRVIEWX\":309.1,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":176.8,\"CFVIEWY\":297.6,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('462', '478', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":314.05,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":180.35,\"CFVIEWY\":295.3,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('463', '479', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":176.8,\"CFVIEWY\":298.85,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('464', '480', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":311.75,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":313.75,\"SFVIEWY\":178,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('465', '481', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":312.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.85,\"CIVIEWY\":130,\"CFVIEWX\":319.9,\"SFVIEWY\":177.85,\"CFVIEWY\":312.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('466', '482', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":311.75,\"CRVIEWY\":309.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":180.3,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('467', '483', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":311.75,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":299.65,\"SFVIEWY\":179.1,\"CFVIEWY\":300,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('468', '484', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":310.55,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":307.85,\"SFVIEWY\":179.1,\"CFVIEWY\":301.15,\"SRVIEWX\":38.1}]');
INSERT INTO `canves_backgrounds` VALUES ('469', '485', '2', '[{\"CRVIEWX\":307.85,\"SRVIEWY\":311.7,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":299.65,\"SFVIEWY\":177.95,\"CFVIEWY\":300,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('470', '486', '2', '[{\"CRVIEWX\":301.2,\"SRVIEWY\":310.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":319.9,\"SFVIEWY\":177.85,\"CFVIEWY\":309.8,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('471', '487', '2', '[{\"CRVIEWX\":311.05,\"SRVIEWY\":313.75,\"CRVIEWY\":307.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.85,\"CFVIEWY\":311.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('472', '488', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":309.8,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":324.75,\"SFVIEWY\":178.85,\"CFVIEWY\":311.8,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('473', '489', '2', '[{\"CRVIEWX\":306.15,\"SRVIEWY\":310.8,\"CRVIEWY\":303.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":178.8,\"CFVIEWY\":311.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('474', '490', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":312.75,\"CRVIEWY\":301.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":177.9,\"CFVIEWY\":308.85,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('475', '491', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":309.8,\"CRVIEWY\":305.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":313,\"SFVIEWY\":176.85,\"CFVIEWY\":312.75,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('476', '492', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":310.8,\"CRVIEWY\":299,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":177.85,\"CFVIEWY\":311.75,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('477', '493', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":308.8,\"CRVIEWY\":299.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":316.9,\"SFVIEWY\":176.9,\"CFVIEWY\":306.85,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('478', '494', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":310.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":313.95,\"SFVIEWY\":176.9,\"CFVIEWY\":308.85,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('479', '495', '2', '[{\"CRVIEWX\":307.05,\"SRVIEWY\":309.8,\"CRVIEWY\":300.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":176.9,\"CFVIEWY\":317.7,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('480', '496', '2', '[{\"CRVIEWX\":302.15,\"SRVIEWY\":312.75,\"CRVIEWY\":307.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":318.9,\"SFVIEWY\":177.85,\"CFVIEWY\":313.75,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('481', '497', '2', '[{\"CRVIEWX\":306.1,\"SRVIEWY\":313.75,\"CRVIEWY\":310.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":176.9,\"CFVIEWY\":310.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('482', '498', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":314.7,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":176.85,\"CFVIEWY\":306.85,\"SRVIEWX\":35.9}]');
INSERT INTO `canves_backgrounds` VALUES ('483', '499', '2', '[{\"CRVIEWX\":310.05,\"SRVIEWY\":311.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":312.95,\"SFVIEWY\":175.9,\"CFVIEWY\":309.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('484', '500', '2', '[{\"CRVIEWX\":304.15,\"SRVIEWY\":313.75,\"CRVIEWY\":306.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":318.85,\"SFVIEWY\":176.9,\"CFVIEWY\":315.7,\"SRVIEWX\":35.9}]');
INSERT INTO `canves_backgrounds` VALUES ('485', '501', '2', '[{\"CRVIEWX\":312,\"SRVIEWY\":310.75,\"CRVIEWY\":307.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":178.85,\"CFVIEWY\":310.8,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('486', '502', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":309.8,\"CRVIEWY\":302.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.85,\"CFVIEWY\":314.7,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('487', '503', '2', '[{\"CRVIEWX\":304.15,\"SRVIEWY\":311.75,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":319.85,\"SFVIEWY\":177.85,\"CFVIEWY\":309.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('488', '504', '2', '[{\"CRVIEWX\":304.1,\"SRVIEWY\":314.7,\"CRVIEWY\":307.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":324.8,\"SFVIEWY\":176.9,\"CFVIEWY\":313.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('489', '505', '2', '[{\"CRVIEWX\":300.2,\"SRVIEWY\":314.7,\"CRVIEWY\":301.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.85,\"CIVIEWY\":130,\"CFVIEWX\":312.05,\"SFVIEWY\":176.85,\"CFVIEWY\":305.9,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('490', '506', '2', '[{\"CRVIEWX\":290.4,\"SRVIEWY\":313.75,\"CRVIEWY\":307.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":315.95,\"SFVIEWY\":177.9,\"CFVIEWY\":314.7,\"SRVIEWX\":33.9}]');
INSERT INTO `canves_backgrounds` VALUES ('491', '507', '2', '[{\"CRVIEWX\":297.3,\"SRVIEWY\":310.8,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":310,\"SFVIEWY\":176.9,\"CFVIEWY\":306.85,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('492', '508', '2', '[{\"CRVIEWX\":301.2,\"SRVIEWY\":310.8,\"CRVIEWY\":304.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":312.95,\"SFVIEWY\":177.9,\"CFVIEWY\":307.85,\"SRVIEWX\":33.85}]');
INSERT INTO `canves_backgrounds` VALUES ('493', '509', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":312.75,\"CRVIEWY\":302.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":318.9,\"SFVIEWY\":177.85,\"CFVIEWY\":316.7,\"SRVIEWX\":37.8}]');
INSERT INTO `canves_backgrounds` VALUES ('494', '510', '2', '[{\"CRVIEWX\":299.25,\"SRVIEWY\":308.8,\"CRVIEWY\":303.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":177.85,\"CFVIEWY\":314.7,\"SRVIEWX\":37.85}]');
INSERT INTO `canves_backgrounds` VALUES ('495', '511', '2', '[{\"CRVIEWX\":313,\"SRVIEWY\":308.8,\"CRVIEWY\":307.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":318.9,\"SFVIEWY\":175.9,\"CFVIEWY\":312.75,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('496', '512', '2', '[{\"CRVIEWX\":307.05,\"SRVIEWY\":311.75,\"CRVIEWY\":303.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":176.9,\"CFVIEWY\":311.75,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('497', '513', '2', '[{\"CRVIEWX\":306.15,\"SRVIEWY\":309.75,\"CRVIEWY\":301.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":174.9,\"CFVIEWY\":308.8,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('498', '514', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":308.8,\"CRVIEWY\":304.85,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":176.85,\"CFVIEWY\":313.7,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('499', '515', '2', '[{\"CRVIEWX\":307.1,\"SRVIEWY\":310.8,\"CRVIEWY\":309.8,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":177.85,\"CFVIEWY\":305.9,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('500', '516', '2', '[{\"CRVIEWX\":313.35,\"SRVIEWY\":283.6,\"CRVIEWY\":279.6,\"SIVIEWX\":29,\"CIVIEWX\":256.85,\"SIVIEWY\":400.05,\"SFVIEWX\":33.95,\"CIVIEWY\":101,\"CFVIEWX\":325.55,\"SFVIEWY\":148.8,\"CFVIEWY\":280.75,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('501', '517', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":312.75,\"CRVIEWY\":302.95,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":321.85,\"SFVIEWY\":175.9,\"CFVIEWY\":311.8,\"SRVIEWX\":35.9}]');
INSERT INTO `canves_backgrounds` VALUES ('502', '518', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":309.8,\"CRVIEWY\":302.9,\"SIVIEWX\":29.95,\"CIVIEWX\":255,\"SIVIEWY\":430.95,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":323.3,\"SFVIEWY\":177.85,\"CFVIEWY\":305.65,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('503', '519', '2', '[{\"CRVIEWX\":308.1,\"SRVIEWY\":282.3,\"CRVIEWY\":275.4,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":319.9,\"SFVIEWY\":148.4,\"CFVIEWY\":282.3,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('504', '520', '2', '[{\"CRVIEWX\":310.05,\"SRVIEWY\":281.25,\"CRVIEWY\":278.35,\"SIVIEWX\":30.95,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":318.9,\"SFVIEWY\":146.4,\"CFVIEWY\":283.3,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('505', '521', '2', '[{\"CRVIEWX\":255,\"SRVIEWY\":281.3,\"CRVIEWY\":130,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":312,\"SFVIEWY\":146.4,\"CFVIEWY\":279.35,\"SRVIEWX\":37.85}]');
INSERT INTO `canves_backgrounds` VALUES ('506', '522', '2', '[{\"CRVIEWX\":305.1,\"SRVIEWY\":281.3,\"CRVIEWY\":273.45,\"SIVIEWX\":29,\"CIVIEWX\":255,\"SIVIEWY\":401.45,\"SFVIEWX\":34.9,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":146.4,\"CFVIEWY\":279.3,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('507', '523', '2', '[{\"CRVIEWX\":307.05,\"SRVIEWY\":283.25,\"CRVIEWY\":278.35,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":400.5,\"SFVIEWX\":31.9,\"CIVIEWY\":130,\"CFVIEWX\":323.8,\"SFVIEWY\":146.4,\"CFVIEWY\":282.3,\"SRVIEWX\":33.9}]');
INSERT INTO `canves_backgrounds` VALUES ('508', '524', '2', '[{\"CRVIEWX\":312,\"SRVIEWY\":281.3,\"CRVIEWY\":281.3,\"SIVIEWX\":27,\"CIVIEWX\":255,\"SIVIEWY\":400.45,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":324.8,\"SFVIEWY\":147.4,\"CFVIEWY\":278.35,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('509', '525', '2', '[{\"CRVIEWX\":304.15,\"SRVIEWY\":280.3,\"CRVIEWY\":273.4,\"SIVIEWX\":27.95,\"CIVIEWX\":0,\"SIVIEWY\":399.5,\"SFVIEWX\":31.9,\"CIVIEWY\":0,\"CFVIEWX\":322.8,\"SFVIEWY\":148.35,\"CFVIEWY\":279.3,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('510', '526', '2', '[{\"CRVIEWX\":302.2,\"SRVIEWY\":283.25,\"CRVIEWY\":273.45,\"SIVIEWX\":28.95,\"CIVIEWX\":255,\"SIVIEWY\":401.45,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":317.9,\"SFVIEWY\":147.4,\"CFVIEWY\":277.35,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('511', '527', '2', '[{\"CRVIEWX\":311,\"SRVIEWY\":284.25,\"CRVIEWY\":278.35,\"SIVIEWX\":28.95,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":34.85,\"CIVIEWY\":130,\"CFVIEWX\":320.85,\"SFVIEWY\":147.4,\"CFVIEWY\":281.3,\"SRVIEWX\":37.8}]');
INSERT INTO `canves_backgrounds` VALUES ('512', '528', '2', '[{\"CRVIEWX\":312,\"SRVIEWY\":282.25,\"CRVIEWY\":275.4,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":317.9,\"SFVIEWY\":148.35,\"CFVIEWY\":281.3,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('513', '529', '2', '[{\"CRVIEWX\":304.15,\"SRVIEWY\":282.25,\"CRVIEWY\":269.5,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":400.45,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":325.75,\"SFVIEWY\":148.35,\"CFVIEWY\":282.3,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('514', '530', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":279.35,\"CRVIEWY\":277.4,\"SIVIEWX\":27.95,\"CIVIEWX\":255,\"SIVIEWY\":398.5,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":325.75,\"SFVIEWY\":148.4,\"CFVIEWY\":282.3,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('515', '531', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":282.3,\"CRVIEWY\":271.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":319.9,\"SFVIEWY\":146.4,\"CFVIEWY\":282.3,\"SRVIEWX\":34.85}]');
INSERT INTO `canves_backgrounds` VALUES ('516', '532', '2', '[{\"CRVIEWX\":305.15,\"SRVIEWY\":281.3,\"CRVIEWY\":276.4,\"SIVIEWX\":26,\"CIVIEWX\":255,\"SIVIEWY\":400.45,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":322.8,\"SFVIEWY\":148.4,\"CFVIEWY\":280.3,\"SRVIEWX\":34.9}]');
INSERT INTO `canves_backgrounds` VALUES ('517', '533', '2', '[{\"CRVIEWX\":303.15,\"SRVIEWY\":282.3,\"CRVIEWY\":275.4,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":33.85,\"CIVIEWY\":130,\"CFVIEWX\":321.8,\"SFVIEWY\":148.4,\"CFVIEWY\":281.3,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('518', '534', '2', '[{\"CRVIEWX\":306.15,\"SRVIEWY\":283.25,\"CRVIEWY\":278.35,\"SIVIEWX\":28,\"CIVIEWX\":255,\"SIVIEWY\":400.5,\"SFVIEWX\":32.9,\"CIVIEWY\":130,\"CFVIEWX\":317.9,\"SFVIEWY\":147.4,\"CFVIEWY\":282.25,\"SRVIEWX\":36.85}]');
INSERT INTO `canves_backgrounds` VALUES ('519', '535', '2', '[{\"CRVIEWX\":306.15,\"SRVIEWY\":283.25,\"CRVIEWY\":280.3,\"SIVIEWX\":27.95,\"CIVIEWX\":255,\"SIVIEWY\":399.5,\"SFVIEWX\":33.9,\"CIVIEWY\":130,\"CFVIEWX\":316.9,\"SFVIEWY\":147.4,\"CFVIEWY\":278.35,\"SRVIEWX\":35.85}]');
INSERT INTO `canves_backgrounds` VALUES ('520', '536', '2', '[{\"CRVIEWX\":302.75,\"SRVIEWY\":280.25,\"CRVIEWY\":271.6,\"SIVIEWX\":30,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":34.65,\"CIVIEWY\":101.9,\"CFVIEWX\":322.45,\"SFVIEWY\":147.65,\"CFVIEWY\":272.55,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('521', '537', '2', '[{\"CRVIEWX\":309.3,\"SRVIEWY\":281.25,\"CRVIEWY\":273.45,\"SIVIEWX\":29.95,\"CIVIEWX\":256.8,\"SIVIEWY\":401,\"SFVIEWX\":34.65,\"CIVIEWY\":101.9,\"CFVIEWX\":323.4,\"SFVIEWY\":146.7,\"CFVIEWY\":283.8,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('522', '538', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":283.05,\"CRVIEWY\":275.35,\"SIVIEWX\":30,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":100.95,\"CFVIEWX\":317.8,\"SFVIEWY\":147.6,\"CFVIEWY\":275.35,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('523', '539', '2', '[{\"CRVIEWX\":317.8,\"SRVIEWY\":284.05,\"CRVIEWY\":274.45,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401.95,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":322.45,\"SFVIEWY\":148.6,\"CFVIEWY\":275.4,\"SRVIEWX\":35.65}]');
INSERT INTO `canves_backgrounds` VALUES ('524', '540', '2', '[{\"CRVIEWX\":310.3,\"SRVIEWY\":284.05,\"CRVIEWY\":276.3,\"SIVIEWX\":29,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":34.65,\"CIVIEWY\":101,\"CFVIEWX\":322.45,\"SFVIEWY\":146.7,\"CFVIEWY\":274.4,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('525', '541', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":282.15,\"CRVIEWY\":277.2,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":324.3,\"SFVIEWY\":146.7,\"CFVIEWY\":280.05,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('526', '542', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":283.05,\"CRVIEWY\":277.25,\"SIVIEWX\":29,\"CIVIEWX\":255,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":102.9,\"CFVIEWX\":326.2,\"SFVIEWY\":148.55,\"CFVIEWY\":277.25,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('527', '543', '2', '[{\"CRVIEWX\":312.1,\"SRVIEWY\":281.2,\"CRVIEWY\":274.45,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":400.1,\"SFVIEWX\":33.75,\"CIVIEWY\":101,\"CFVIEWX\":322.5,\"SFVIEWY\":148.55,\"CFVIEWY\":283.8,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('528', '544', '2', '[{\"CRVIEWX\":298.1,\"SRVIEWY\":283.05,\"CRVIEWY\":266,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":399.15,\"SFVIEWX\":33.7,\"CIVIEWY\":102.85,\"CFVIEWX\":315.9,\"SFVIEWY\":147.6,\"CFVIEWY\":281.9,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('529', '545', '2', '[{\"CRVIEWX\":299.95,\"SRVIEWY\":280.25,\"CRVIEWY\":274.4,\"SIVIEWX\":28.1,\"CIVIEWX\":254.95,\"SIVIEWY\":399.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":315.9,\"SFVIEWY\":147.6,\"CFVIEWY\":276.3,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('530', '546', '2', '[{\"CRVIEWX\":298.1,\"SRVIEWY\":281.25,\"CRVIEWY\":267.85,\"SIVIEWX\":29,\"CIVIEWX\":256.8,\"SIVIEWY\":401.95,\"SFVIEWX\":33.7,\"CIVIEWY\":102.85,\"CFVIEWX\":316.8,\"SFVIEWY\":148.55,\"CFVIEWY\":276.3,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('531', '547', '2', '[{\"CRVIEWX\":297.15,\"SRVIEWY\":280.25,\"CRVIEWY\":274.4,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":316.85,\"SFVIEWY\":149.5,\"CFVIEWY\":277.2,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('532', '548', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":282.15,\"CRVIEWY\":274.45,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":329,\"SFVIEWY\":146.65,\"CFVIEWY\":279.1,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('533', '549', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":281.2,\"CRVIEWY\":276.3,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.95,\"CFVIEWX\":321.5,\"SFVIEWY\":147.6,\"CFVIEWY\":281.9,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('534', '550', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":281.2,\"CRVIEWY\":280.05,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":35.55,\"CIVIEWY\":101.9,\"CFVIEWX\":324.35,\"SFVIEWY\":146.7,\"CFVIEWY\":278.2,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('535', '551', '2', '[{\"CRVIEWX\":308.4,\"SRVIEWY\":282.15,\"CRVIEWY\":277.2,\"SIVIEWX\":29.95,\"CIVIEWX\":254.05,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":323.4,\"SFVIEWY\":148.6,\"CFVIEWY\":281.95,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('536', '552', '2', '[{\"CRVIEWX\":315.9,\"SRVIEWY\":285.9,\"CRVIEWY\":280.05,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":32.75,\"CIVIEWY\":101.9,\"CFVIEWX\":327.15,\"SFVIEWY\":148.6,\"CFVIEWY\":280.05,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('537', '553', '2', '[{\"CRVIEWX\":312.15,\"SRVIEWY\":282.1,\"CRVIEWY\":275.35,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":34.6,\"CIVIEWY\":101.9,\"CFVIEWX\":323.4,\"SFVIEWY\":147.6,\"CFVIEWY\":276.35,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('538', '554', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":283.1,\"CRVIEWY\":276.3,\"SIVIEWX\":30.9,\"CIVIEWX\":254,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":100.95,\"CFVIEWX\":318.7,\"SFVIEWY\":147.6,\"CFVIEWY\":276.25,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('539', '555', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":284,\"CRVIEWY\":279.1,\"SIVIEWX\":30,\"CIVIEWX\":255.85,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":325.3,\"SFVIEWY\":146.7,\"CFVIEWY\":280.05,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('540', '556', '2', '[{\"CRVIEWX\":311.25,\"SRVIEWY\":282.15,\"CRVIEWY\":279.1,\"SIVIEWX\":29,\"CIVIEWX\":254.95,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":323.35,\"SFVIEWY\":147.65,\"CFVIEWY\":280.05,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('541', '557', '2', '[{\"CRVIEWX\":312.15,\"SRVIEWY\":283.1,\"CRVIEWY\":274.4,\"SIVIEWX\":29,\"CIVIEWX\":254.05,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":101.95,\"CFVIEWX\":328.05,\"SFVIEWY\":147.65,\"CFVIEWY\":282.85,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('542', '558', '2', '[{\"CRVIEWX\":303.7,\"SRVIEWY\":283.05,\"CRVIEWY\":270.7,\"SIVIEWX\":29,\"CIVIEWX\":254.95,\"SIVIEWY\":401.95,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":325.25,\"SFVIEWY\":147.65,\"CFVIEWY\":281.9,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('543', '559', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":284.05,\"CRVIEWY\":278.2,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":399.1,\"SFVIEWX\":32.8,\"CIVIEWY\":101,\"CFVIEWX\":327.15,\"SFVIEWY\":146.65,\"CFVIEWY\":281.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('544', '560', '2', '[{\"CRVIEWX\":304.65,\"SRVIEWY\":281.25,\"CRVIEWY\":271.6,\"SIVIEWX\":29,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":31.85,\"CIVIEWY\":100.05,\"CFVIEWX\":321.5,\"SFVIEWY\":145.75,\"CFVIEWY\":275.35,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('545', '561', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":279.35,\"CRVIEWY\":270.7,\"SIVIEWX\":29,\"CIVIEWX\":256.8,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":101.9,\"CFVIEWX\":325.25,\"SFVIEWY\":146.7,\"CFVIEWY\":282.85,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('546', '562', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":282.15,\"CRVIEWY\":270.65,\"SIVIEWX\":30,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.9,\"CFVIEWX\":325.25,\"SFVIEWY\":147.6,\"CFVIEWY\":279.1,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('547', '563', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.7,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":178,\"CFVIEWY\":303.55,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('548', '564', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":280.3,\"CRVIEWY\":275.35,\"SIVIEWX\":30,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":33.75,\"CIVIEWY\":101.95,\"CFVIEWX\":327.15,\"SFVIEWY\":148.55,\"CFVIEWY\":280.05,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('549', '565', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":311.75,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":300,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('550', '566', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":281.2,\"CRVIEWY\":272.55,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":399.15,\"SFVIEWX\":32.8,\"CIVIEWY\":100.95,\"CFVIEWX\":325.25,\"SFVIEWY\":149.5,\"CFVIEWY\":277.25,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('551', '567', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":314.1,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.9,\"CIVIEWY\":130,\"CFVIEWX\":297.3,\"SFVIEWY\":180.3,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('552', '568', '2', '[{\"CRVIEWX\":310.3,\"SRVIEWY\":280.3,\"CRVIEWY\":269.75,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":399.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":318.7,\"SFVIEWY\":147.6,\"CFVIEWY\":276.3,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('553', '569', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":283.05,\"CRVIEWY\":272.55,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":32.8,\"CIVIEWY\":102.85,\"CFVIEWX\":329,\"SFVIEWY\":146.7,\"CFVIEWY\":279.1,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('554', '570', '2', '[{\"CRVIEWX\":309.35,\"SRVIEWY\":283.1,\"CRVIEWY\":275.35,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":324.35,\"SFVIEWY\":148.55,\"CFVIEWY\":277.25,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('555', '571', '2', '[{\"CRVIEWX\":309.35,\"SRVIEWY\":281.25,\"CRVIEWY\":274.45,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":32.75,\"CIVIEWY\":101.95,\"CFVIEWX\":323.45,\"SFVIEWY\":147.65,\"CFVIEWY\":277.25,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('556', '572', '2', '[{\"CRVIEWX\":309.35,\"SRVIEWY\":280.3,\"CRVIEWY\":268.8,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":34.65,\"CIVIEWY\":101.95,\"CFVIEWX\":328.1,\"SFVIEWY\":147.65,\"CFVIEWY\":280.05,\"SRVIEWX\":37.45}]');
INSERT INTO `canves_backgrounds` VALUES ('557', '573', '2', '[{\"CRVIEWX\":303.65,\"SRVIEWY\":282.15,\"CRVIEWY\":269.7,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":31.8,\"CIVIEWY\":101.95,\"CFVIEWX\":321.55,\"SFVIEWY\":145.75,\"CFVIEWY\":277.25,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('558', '574', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('559', '575', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":310.55,\"CRVIEWY\":309.35,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":302.05,\"SFVIEWY\":180.35,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('560', '576', '2', '[{\"CRVIEWX\":304.65,\"SRVIEWY\":283.1,\"CRVIEWY\":272.55,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":400.1,\"SFVIEWX\":32.8,\"CIVIEWY\":101.9,\"CFVIEWX\":323.35,\"SFVIEWY\":146.7,\"CFVIEWY\":280.05,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('561', '577', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":312.9,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":302,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('562', '578', '2', '[{\"CRVIEWX\":310.25,\"SRVIEWY\":310.55,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":309.1,\"SFVIEWY\":177.95,\"CFVIEWY\":301.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('563', '579', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":312.9,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('564', '580', '2', '[{\"CRVIEWX\":311.25,\"SRVIEWY\":280.3,\"CRVIEWY\":276.3,\"SIVIEWX\":29.05,\"CIVIEWX\":255.95,\"SIVIEWY\":399.1,\"SFVIEWX\":32.8,\"CIVIEWY\":100.05,\"CFVIEWX\":320.6,\"SFVIEWY\":147.65,\"CFVIEWY\":284.75,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('565', '581', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":310.55,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":179.1,\"CFVIEWY\":296.45,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('566', '582', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":281.2,\"CRVIEWY\":272.55,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":31.85,\"CIVIEWY\":101,\"CFVIEWX\":325.3,\"SFVIEWY\":146.7,\"CFVIEWY\":285.7,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('567', '583', '2', '[{\"CRVIEWX\":317.3,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":305.5,\"SFVIEWY\":176.8,\"CFVIEWY\":299.95,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('568', '584', '2', '[{\"CRVIEWX\":311.25,\"SRVIEWY\":282.2,\"CRVIEWY\":275.35,\"SIVIEWX\":28.1,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":32.8,\"CIVIEWY\":100.95,\"CFVIEWX\":324.35,\"SFVIEWY\":147.65,\"CFVIEWY\":276.3,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('569', '585', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":279.35,\"CRVIEWY\":266.95,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":401.95,\"SFVIEWX\":33.7,\"CIVIEWY\":100.05,\"CFVIEWX\":324.35,\"SFVIEWY\":146.7,\"CFVIEWY\":281.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('570', '586', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":282.15,\"CRVIEWY\":271.6,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":100.95,\"CFVIEWX\":314.05,\"SFVIEWY\":145.75,\"CFVIEWY\":280.1,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('571', '587', '2', '[{\"CRVIEWX\":313.1,\"SRVIEWY\":280.3,\"CRVIEWY\":274.4,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":402.9,\"SFVIEWX\":32.75,\"CIVIEWY\":102.85,\"CFVIEWX\":320.55,\"SFVIEWY\":148.6,\"CFVIEWY\":281.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('572', '588', '2', '[{\"CRVIEWX\":302.8,\"SRVIEWY\":282.15,\"CRVIEWY\":271.6,\"SIVIEWX\":29.05,\"CIVIEWX\":254,\"SIVIEWY\":401.95,\"SFVIEWX\":33.65,\"CIVIEWY\":101.9,\"CFVIEWX\":322.45,\"SFVIEWY\":146.7,\"CFVIEWY\":281.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('573', '589', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":283.1,\"CRVIEWY\":273.5,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":323.4,\"SFVIEWY\":146.65,\"CFVIEWY\":279.15,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('574', '590', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":283.1,\"CRVIEWY\":269.75,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":33.75,\"CIVIEWY\":101,\"CFVIEWX\":323.4,\"SFVIEWY\":146.7,\"CFVIEWY\":281,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('575', '591', '2', '[{\"CRVIEWX\":314.05,\"SRVIEWY\":282.2,\"CRVIEWY\":272.55,\"SIVIEWX\":29.05,\"CIVIEWX\":256.8,\"SIVIEWY\":402.85,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":325.3,\"SFVIEWY\":148.55,\"CFVIEWY\":276.3,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('576', '592', '2', '[{\"CRVIEWX\":308.4,\"SRVIEWY\":282.15,\"CRVIEWY\":277.2,\"SIVIEWX\":30.9,\"CIVIEWX\":255.9,\"SIVIEWY\":399.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":326.25,\"SFVIEWY\":146.65,\"CFVIEWY\":281,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('577', '593', '2', '[{\"CRVIEWX\":303.65,\"SRVIEWY\":283.05,\"CRVIEWY\":273.5,\"SIVIEWX\":29,\"CIVIEWX\":256.8,\"SIVIEWY\":399.1,\"SFVIEWX\":34.65,\"CIVIEWY\":101.95,\"CFVIEWX\":325.3,\"SFVIEWY\":146.65,\"CFVIEWY\":280.05,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('578', '594', '2', '[{\"CRVIEWX\":309.35,\"SRVIEWY\":280.3,\"CRVIEWY\":270.7,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101.9,\"CFVIEWX\":318.65,\"SFVIEWY\":146.7,\"CFVIEWY\":282.9,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('579', '595', '2', '[{\"CRVIEWX\":315.9,\"SRVIEWY\":282.15,\"CRVIEWY\":267.9,\"SIVIEWX\":28.1,\"CIVIEWX\":256.85,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":102.85,\"CFVIEWX\":329.05,\"SFVIEWY\":148.55,\"CFVIEWY\":278.2,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('580', '596', '2', '[{\"CRVIEWX\":312.15,\"SRVIEWY\":283.1,\"CRVIEWY\":273.45,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401.95,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":327.2,\"SFVIEWY\":147.6,\"CFVIEWY\":276.35,\"SRVIEWX\":34.7}]');
INSERT INTO `canves_backgrounds` VALUES ('581', '597', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":282.15,\"CRVIEWY\":277.25,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":32.75,\"CIVIEWY\":101.95,\"CFVIEWX\":326.2,\"SFVIEWY\":147.65,\"CFVIEWY\":282.9,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('582', '598', '2', '[{\"CRVIEWX\":305.6,\"SRVIEWY\":283.1,\"CRVIEWY\":277.2,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":324.35,\"SFVIEWY\":147.65,\"CFVIEWY\":283.85,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('583', '599', '2', '[{\"CRVIEWX\":309.35,\"SRVIEWY\":281.2,\"CRVIEWY\":275.4,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":32.8,\"CIVIEWY\":101.95,\"CFVIEWX\":314.95,\"SFVIEWY\":146.7,\"CFVIEWY\":278.2,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('584', '600', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":311.7,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.8,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":177.95,\"CFVIEWY\":302.35,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('585', '601', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":314.05,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":178,\"CFVIEWY\":298.8,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('586', '602', '2', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `canves_backgrounds` VALUES ('587', '603', '2', '[{\"CRVIEWX\":311.4,\"SRVIEWY\":310.55,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":36.95,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":179.15,\"CFVIEWY\":299.95,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('588', '604', '2', '[{\"CRVIEWX\":306.7,\"SRVIEWY\":312.9,\"CRVIEWY\":314.05,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":298.8,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('589', '605', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":311.7,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":310.2,\"SFVIEWY\":177.95,\"CFVIEWY\":302.35,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('590', '606', '2', '[{\"CRVIEWX\":303.7,\"SRVIEWY\":283.1,\"CRVIEWY\":268.8,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":318.7,\"SFVIEWY\":148.55,\"CFVIEWY\":277.25,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('591', '607', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":309.4,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('592', '608', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":310.55,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":176.8,\"CFVIEWY\":303.5,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('593', '609', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":312.9,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":304.35,\"SFVIEWY\":179.1,\"CFVIEWY\":301.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('594', '610', '2', '[{\"CRVIEWX\":299.65,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":312.6,\"SFVIEWY\":179.1,\"CFVIEWY\":301.15,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('595', '611', '2', '[{\"CRVIEWX\":300.85,\"SRVIEWY\":312.9,\"CRVIEWY\":312.9,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":311.45,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('596', '612', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":311.7,\"CRVIEWY\":314.1,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":297.35,\"SFVIEWY\":177.95,\"CFVIEWY\":300,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('597', '613', '2', '[{\"CRVIEWX\":302,\"SRVIEWY\":309.4,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.4,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":178,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('598', '614', '2', '[{\"CRVIEWX\":316.8,\"SRVIEWY\":282.1,\"CRVIEWY\":268.8,\"SIVIEWX\":29.05,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":34.65,\"CIVIEWY\":101,\"CFVIEWX\":324.35,\"SFVIEWY\":147.65,\"CFVIEWY\":269.75,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('599', '615', '2', '[{\"CRVIEWX\":312.15,\"SRVIEWY\":280.25,\"CRVIEWY\":271.6,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":400.05,\"SFVIEWX\":34.65,\"CIVIEWY\":101,\"CFVIEWX\":324.35,\"SFVIEWY\":146.65,\"CFVIEWY\":281.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('600', '616', '2', '[{\"CRVIEWX\":306.55,\"SRVIEWY\":281.25,\"CRVIEWY\":271.6,\"SIVIEWX\":29.95,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":326.25,\"SFVIEWY\":146.7,\"CFVIEWY\":281.95,\"SRVIEWX\":37.5}]');
INSERT INTO `canves_backgrounds` VALUES ('601', '617', '2', '[{\"CRVIEWX\":312.15,\"SRVIEWY\":281.2,\"CRVIEWY\":279.1,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.1,\"SFVIEWX\":32.8,\"CIVIEWY\":101,\"CFVIEWX\":324.35,\"SFVIEWY\":147.6,\"CFVIEWY\":273.5,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('602', '618', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":281.2,\"CRVIEWY\":275.4,\"SIVIEWX\":29,\"CIVIEWX\":254.95,\"SIVIEWY\":401,\"SFVIEWX\":32.75,\"CIVIEWY\":101,\"CFVIEWX\":319.6,\"SFVIEWY\":145.7,\"CFVIEWY\":281.95,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('603', '619', '2', '[{\"CRVIEWX\":309.3,\"SRVIEWY\":282.15,\"CRVIEWY\":278.15,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":399.1,\"SFVIEWX\":32.8,\"CIVIEWY\":101,\"CFVIEWX\":321.55,\"SFVIEWY\":146.7,\"CFVIEWY\":283.8,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('604', '620', '2', '[{\"CRVIEWX\":305.6,\"SRVIEWY\":281.2,\"CRVIEWY\":273.5,\"SIVIEWX\":29.95,\"CIVIEWX\":254.95,\"SIVIEWY\":399.15,\"SFVIEWX\":33.7,\"CIVIEWY\":100.05,\"CFVIEWX\":324.35,\"SFVIEWY\":146.65,\"CFVIEWY\":284.75,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('605', '621', '2', '[{\"CRVIEWX\":315.9,\"SRVIEWY\":279.35,\"CRVIEWY\":273.5,\"SIVIEWX\":30,\"CIVIEWX\":255.85,\"SIVIEWY\":400.05,\"SFVIEWX\":32.8,\"CIVIEWY\":100.05,\"CFVIEWX\":322.45,\"SFVIEWY\":145.75,\"CFVIEWY\":279.1,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('606', '622', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":282.15,\"CRVIEWY\":276.3,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":324.35,\"SFVIEWY\":147.65,\"CFVIEWY\":281.9,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('608', '624', '2', '[{\"CRVIEWX\":310.3,\"SRVIEWY\":283.1,\"CRVIEWY\":271.6,\"SIVIEWX\":29.95,\"CIVIEWX\":256.8,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":100.95,\"CFVIEWX\":324.35,\"SFVIEWY\":147.6,\"CFVIEWY\":282.85,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('609', '625', '2', '[{\"CRVIEWX\":299.05,\"SRVIEWY\":283.1,\"CRVIEWY\":266,\"SIVIEWX\":29,\"CIVIEWX\":255,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":314,\"SFVIEWY\":146.7,\"CFVIEWY\":269.75,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('610', '626', '2', '[{\"CRVIEWX\":295.25,\"SRVIEWY\":282.15,\"CRVIEWY\":270.7,\"SIVIEWX\":29.05,\"CIVIEWX\":254,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101,\"CFVIEWX\":310.3,\"SFVIEWY\":148.55,\"CFVIEWY\":270.7,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('611', '627', '2', '[{\"CRVIEWX\":295.3,\"SRVIEWY\":280.3,\"CRVIEWY\":266,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":401,\"SFVIEWX\":34.65,\"CIVIEWY\":101,\"CFVIEWX\":313.05,\"SFVIEWY\":146.7,\"CFVIEWY\":276.25,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('612', '628', '2', '[{\"CRVIEWX\":300.9,\"SRVIEWY\":282.15,\"CRVIEWY\":271.6,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":315.9,\"SFVIEWY\":148.55,\"CFVIEWY\":273.5,\"SRVIEWX\":35.55}]');
INSERT INTO `canves_backgrounds` VALUES ('613', '629', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":283.1,\"CRVIEWY\":274.4,\"SIVIEWX\":29.05,\"CIVIEWX\":256.85,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":320.6,\"SFVIEWY\":146.7,\"CFVIEWY\":275.35,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('614', '630', '2', '[{\"CRVIEWX\":298.1,\"SRVIEWY\":281.2,\"CRVIEWY\":273.45,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":100.95,\"CFVIEWX\":323.35,\"SFVIEWY\":146.7,\"CFVIEWY\":279.1,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('615', '631', '2', '[{\"CRVIEWX\":303.7,\"SRVIEWY\":282.15,\"CRVIEWY\":277.25,\"SIVIEWX\":30,\"CIVIEWX\":255.95,\"SIVIEWY\":401,\"SFVIEWX\":32.8,\"CIVIEWY\":101,\"CFVIEWX\":318.7,\"SFVIEWY\":147.65,\"CFVIEWY\":280.95,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('616', '632', '2', '[{\"CRVIEWX\":300.85,\"SRVIEWY\":280.3,\"CRVIEWY\":275.35,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":324.3,\"SFVIEWY\":147.65,\"CFVIEWY\":277.2,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('617', '633', '2', '[{\"CRVIEWX\":303.7,\"SRVIEWY\":282.15,\"CRVIEWY\":271.6,\"SIVIEWX\":29.95,\"CIVIEWX\":256.8,\"SIVIEWY\":400.05,\"SFVIEWX\":32.8,\"CIVIEWY\":101.95,\"CFVIEWX\":315.9,\"SFVIEWY\":149.5,\"CFVIEWY\":273.5,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('618', '634', '2', '[{\"CRVIEWX\":304.65,\"SRVIEWY\":282.15,\"CRVIEWY\":275.35,\"SIVIEWX\":29,\"CIVIEWX\":255,\"SIVIEWY\":401.9,\"SFVIEWX\":33.75,\"CIVIEWY\":101.95,\"CFVIEWX\":314.95,\"SFVIEWY\":146.7,\"CFVIEWY\":279.15,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('619', '635', '2', '[{\"CRVIEWX\":299.95,\"SRVIEWY\":282.15,\"CRVIEWY\":275.35,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.9,\"CFVIEWX\":314.95,\"SFVIEWY\":148.55,\"CFVIEWY\":276.3,\"SRVIEWX\":36.5}]');
INSERT INTO `canves_backgrounds` VALUES ('620', '636', '2', '[{\"CRVIEWX\":306.5,\"SRVIEWY\":282.15,\"CRVIEWY\":269.75,\"SIVIEWX\":29.05,\"CIVIEWX\":256.85,\"SIVIEWY\":400.1,\"SFVIEWX\":32.8,\"CIVIEWY\":101.95,\"CFVIEWX\":314.95,\"SFVIEWY\":147.6,\"CFVIEWY\":275.35,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('621', '637', '2', '[{\"CRVIEWX\":303.7,\"SRVIEWY\":282.15,\"CRVIEWY\":270.7,\"SIVIEWX\":29.95,\"CIVIEWX\":255.95,\"SIVIEWY\":399.15,\"SFVIEWX\":32.8,\"CIVIEWY\":101.95,\"CFVIEWX\":318.7,\"SFVIEWY\":147.65,\"CFVIEWY\":278.2,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('622', '638', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":282.15,\"CRVIEWY\":267.85,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":401,\"SFVIEWX\":33.7,\"CIVIEWY\":100.05,\"CFVIEWX\":314,\"SFVIEWY\":146.7,\"CFVIEWY\":276.3,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('623', '639', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":281.2,\"CRVIEWY\":273.5,\"SIVIEWX\":29.05,\"CIVIEWX\":256.8,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.9,\"CFVIEWX\":316.8,\"SFVIEWY\":148.55,\"CFVIEWY\":279.1,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('624', '640', '2', '[{\"CRVIEWX\":308.4,\"SRVIEWY\":283.1,\"CRVIEWY\":266.95,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.95,\"CFVIEWX\":319.65,\"SFVIEWY\":145.75,\"CFVIEWY\":273.5,\"SRVIEWX\":36.55}]');
INSERT INTO `canves_backgrounds` VALUES ('625', '641', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":281.2,\"CRVIEWY\":266.9,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":33.75,\"CIVIEWY\":101.95,\"CFVIEWX\":326.2,\"SFVIEWY\":147.65,\"CFVIEWY\":267.85,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('626', '642', '2', '[{\"CRVIEWX\":307.45,\"SRVIEWY\":280.3,\"CRVIEWY\":265.05,\"SIVIEWX\":29,\"CIVIEWX\":255.85,\"SIVIEWY\":401,\"SFVIEWX\":33.75,\"CIVIEWY\":101,\"CFVIEWX\":316.8,\"SFVIEWY\":146.65,\"CFVIEWY\":274.45,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('627', '643', '2', '[{\"CRVIEWX\":305.5,\"SRVIEWY\":309.4,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":306.75,\"SFVIEWY\":178,\"CFVIEWY\":296.5,\"SRVIEWX\":36.9}]');
INSERT INTO `canves_backgrounds` VALUES ('628', '644', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":310.55,\"CRVIEWY\":310.5,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":318.45,\"SFVIEWY\":179.15,\"CFVIEWY\":298.8,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('629', '645', '2', '[{\"CRVIEWX\":301.85,\"SRVIEWY\":281.2,\"CRVIEWY\":269.75,\"SIVIEWX\":29,\"CIVIEWX\":255.9,\"SIVIEWY\":400.1,\"SFVIEWX\":33.7,\"CIVIEWY\":101.95,\"CFVIEWX\":321.55,\"SFVIEWY\":147.6,\"CFVIEWY\":276.3,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('630', '646', '2', '[{\"CRVIEWX\":306.75,\"SRVIEWY\":310.55,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":33.45,\"CIVIEWY\":130,\"CFVIEWX\":307.9,\"SFVIEWY\":177.95,\"CFVIEWY\":302.35,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('631', '647', '2', '[{\"CRVIEWX\":313.75,\"SRVIEWY\":309.4,\"CRVIEWY\":310.55,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.55,\"CIVIEWY\":130,\"CFVIEWX\":300.85,\"SFVIEWY\":176.8,\"CFVIEWY\":301.2,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('632', '648', '2', '[{\"CRVIEWX\":316.1,\"SRVIEWY\":310.55,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":179.1,\"CFVIEWY\":299.95,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('633', '649', '2', '[{\"CRVIEWX\":302.8,\"SRVIEWY\":282.15,\"CRVIEWY\":266.9,\"SIVIEWX\":29.05,\"CIVIEWX\":255.9,\"SIVIEWY\":400.05,\"SFVIEWX\":34.65,\"CIVIEWY\":101.95,\"CFVIEWX\":322.45,\"SFVIEWY\":147.6,\"CFVIEWY\":270.7,\"SRVIEWX\":33.7}]');
INSERT INTO `canves_backgrounds` VALUES ('634', '650', '2', '[{\"CRVIEWX\":300.8,\"SRVIEWY\":312.9,\"CRVIEWY\":316.45,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":303.2,\"SFVIEWY\":177.95,\"CFVIEWY\":297.65,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('635', '651', '2', '[{\"CRVIEWX\":299.95,\"SRVIEWY\":283.05,\"CRVIEWY\":270.65,\"SIVIEWX\":29.05,\"CIVIEWX\":255.85,\"SIVIEWY\":399.15,\"SFVIEWX\":33.7,\"CIVIEWY\":100.95,\"CFVIEWX\":317.8,\"SFVIEWY\":148.6,\"CFVIEWY\":274.45,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('636', '652', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":311.7,\"CRVIEWY\":316.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":305.55,\"SFVIEWY\":179.15,\"CFVIEWY\":302.35,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('637', '653', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":312.9,\"CRVIEWY\":311.75,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":309.05,\"SFVIEWY\":176.8,\"CFVIEWY\":300,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('638', '654', '2', '[{\"CRVIEWX\":308.35,\"SRVIEWY\":282.15,\"CRVIEWY\":274.4,\"SIVIEWX\":29.05,\"CIVIEWX\":256.85,\"SIVIEWY\":401.95,\"SFVIEWX\":32.8,\"CIVIEWY\":101.9,\"CFVIEWX\":320.6,\"SFVIEWY\":146.7,\"CFVIEWY\":278.2,\"SRVIEWX\":34.65}]');
INSERT INTO `canves_backgrounds` VALUES ('639', '655', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":311.75,\"CRVIEWY\":315.25,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":302,\"SFVIEWY\":178,\"CFVIEWY\":300,\"SRVIEWX\":34.55}]');
INSERT INTO `canves_backgrounds` VALUES ('640', '656', '2', '[{\"CRVIEWX\":312.55,\"SRVIEWY\":311.75,\"CRVIEWY\":309.4,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":299.7,\"SFVIEWY\":176.8,\"CFVIEWY\":290.55,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('641', '657', '2', '[{\"CRVIEWX\":311.2,\"SRVIEWY\":283.1,\"CRVIEWY\":272.55,\"SIVIEWX\":29.05,\"CIVIEWX\":256.85,\"SIVIEWY\":400.05,\"SFVIEWX\":34.6,\"CIVIEWY\":101.95,\"CFVIEWX\":326.15,\"SFVIEWY\":147.6,\"CFVIEWY\":277.2,\"SRVIEWX\":35.6}]');
INSERT INTO `canves_backgrounds` VALUES ('642', '658', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":311.7,\"CRVIEWY\":315.2,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":35.75,\"CIVIEWY\":130,\"CFVIEWX\":298.5,\"SFVIEWY\":178,\"CFVIEWY\":304.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('643', '659', '2', '[{\"CRVIEWX\":309.05,\"SRVIEWY\":312.9,\"CRVIEWY\":311.7,\"SIVIEWX\":30,\"CIVIEWX\":255,\"SIVIEWY\":431,\"SFVIEWX\":34.6,\"CIVIEWY\":130,\"CFVIEWX\":296.15,\"SFVIEWY\":179.15,\"CFVIEWY\":300,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('644', '660', '2', '[{\"CRVIEWX\":309.3,\"SRVIEWY\":282.15,\"CRVIEWY\":268.8,\"SIVIEWX\":29,\"CIVIEWX\":256.85,\"SIVIEWY\":401,\"SFVIEWX\":33.75,\"CIVIEWY\":101,\"CFVIEWX\":321.5,\"SFVIEWY\":148.55,\"CFVIEWY\":278.15,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('645', '661', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":278.9,\"CRVIEWY\":281.2,\"SIVIEWX\":28.7,\"CIVIEWX\":255.1,\"SIVIEWY\":407.6,\"SFVIEWX\":33.4,\"CIVIEWY\":99.4,\"CFVIEWX\":304.35,\"SFVIEWY\":147.5,\"CFVIEWY\":263.6,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('646', '662', '2', '[{\"CRVIEWX\":314.95,\"SRVIEWY\":281.2,\"CRVIEWY\":288.3,\"SIVIEWX\":28.75,\"CIVIEWX\":255.1,\"SIVIEWY\":400.55,\"SFVIEWX\":34.6,\"CIVIEWY\":101.75,\"CFVIEWX\":316.1,\"SFVIEWY\":148.6,\"CFVIEWY\":269.5,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('647', '663', '2', '[{\"CRVIEWX\":305.55,\"SRVIEWY\":281.2,\"CRVIEWY\":278.9,\"SIVIEWX\":28.7,\"CIVIEWX\":256.25,\"SIVIEWY\":400.55,\"SFVIEWX\":35.75,\"CIVIEWY\":102.9,\"CFVIEWX\":298.5,\"SFVIEWY\":147.5,\"CFVIEWY\":269.5,\"SRVIEWX\":34.6}]');
INSERT INTO `canves_backgrounds` VALUES ('648', '664', '2', '[{\"CRVIEWX\":307.9,\"SRVIEWY\":280.05,\"CRVIEWY\":282.4,\"SIVIEWX\":29.9,\"CIVIEWX\":256.3,\"SIVIEWY\":399.4,\"SFVIEWX\":35.75,\"CIVIEWY\":101.75,\"CFVIEWX\":303.2,\"SFVIEWY\":148.65,\"CFVIEWY\":273,\"SRVIEWX\":35.75}]');
INSERT INTO `canves_backgrounds` VALUES ('649', '665', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":278.9,\"CRVIEWY\":282.4,\"SIVIEWX\":28.7,\"CIVIEWX\":255.1,\"SIVIEWY\":400.55,\"SFVIEWX\":34.6,\"CIVIEWY\":101.75,\"CFVIEWX\":304.4,\"SFVIEWY\":147.5,\"CFVIEWY\":269.45,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('650', '666', '2', '[{\"CRVIEWX\":304.35,\"SRVIEWY\":281.2,\"CRVIEWY\":283.55,\"SIVIEWX\":28.7,\"CIVIEWX\":256.3,\"SIVIEWY\":401.75,\"SFVIEWX\":33.45,\"CIVIEWY\":101.75,\"CFVIEWX\":305.55,\"SFVIEWY\":148.65,\"CFVIEWY\":268.35,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('651', '667', '2', '[{\"CRVIEWX\":302.05,\"SRVIEWY\":280.1,\"CRVIEWY\":282.4,\"SIVIEWX\":28.7,\"CIVIEWX\":255.1,\"SIVIEWY\":399.4,\"SFVIEWX\":35.75,\"CIVIEWY\":101.75,\"CFVIEWX\":303.2,\"SFVIEWY\":148.65,\"CFVIEWY\":270.65,\"SRVIEWX\":36.95}]');
INSERT INTO `canves_backgrounds` VALUES ('652', '668', '2', '[{\"CRVIEWX\":303.2,\"SRVIEWY\":283.55,\"CRVIEWY\":281.2,\"SIVIEWX\":29.9,\"CIVIEWX\":255.1,\"SIVIEWY\":401.75,\"SFVIEWX\":35.8,\"CIVIEWY\":102.9,\"CFVIEWX\":307.9,\"SFVIEWY\":147.5,\"CFVIEWY\":270.65,\"SRVIEWX\":35.8}]');
INSERT INTO `canves_backgrounds` VALUES ('653', '669', '2', '[{\"CRVIEWX\":310.2,\"SRVIEWY\":281.2,\"CRVIEWY\":283.6,\"SIVIEWX\":32.25,\"CIVIEWX\":258.6,\"SIVIEWY\":401.7,\"SFVIEWX\":36.9,\"CIVIEWY\":102.95,\"CFVIEWX\":303.2,\"SFVIEWY\":143.95,\"CFVIEWY\":271.8,\"SRVIEWX\":36.95}]');
INSERT INTO `colors` VALUES ('3', '1', '5');
INSERT INTO `colors` VALUES ('4', '4', '7');
INSERT INTO `colors` VALUES ('5', '5', '7');
INSERT INTO `colors` VALUES ('6', '4', '8');
INSERT INTO `colors` VALUES ('7', '5', '8');
INSERT INTO `colors` VALUES ('8', '4', '11');
INSERT INTO `colors` VALUES ('9', '5', '11');
INSERT INTO `colors` VALUES ('10', '4', '13');
INSERT INTO `colors` VALUES ('11', '5', '13');
INSERT INTO `colors` VALUES ('12', '4', '14');
INSERT INTO `colors` VALUES ('13', '5', '14');
INSERT INTO `colors` VALUES ('14', '4', '15');
INSERT INTO `colors` VALUES ('15', '5', '15');
INSERT INTO `colors` VALUES ('16', '6', '16');
INSERT INTO `colors` VALUES ('17', '7', '16');
INSERT INTO `colors` VALUES ('18', '6', '17');
INSERT INTO `colors` VALUES ('19', '7', '17');
INSERT INTO `colors` VALUES ('20', '6', '19');
INSERT INTO `colors` VALUES ('21', '7', '19');
INSERT INTO `colors` VALUES ('22', '6', '20');
INSERT INTO `colors` VALUES ('23', '7', '20');
INSERT INTO `colors` VALUES ('24', '6', '21');
INSERT INTO `colors` VALUES ('25', '7', '21');
INSERT INTO `colors` VALUES ('26', '6', '22');
INSERT INTO `colors` VALUES ('27', '7', '22');
INSERT INTO `colors` VALUES ('28', '8', '23');
INSERT INTO `colors` VALUES ('29', '9', '23');
INSERT INTO `colors` VALUES ('30', '8', '24');
INSERT INTO `colors` VALUES ('31', '9', '24');
INSERT INTO `colors` VALUES ('32', '8', '25');
INSERT INTO `colors` VALUES ('33', '9', '25');
INSERT INTO `colors` VALUES ('34', '8', '26');
INSERT INTO `colors` VALUES ('35', '9', '26');
INSERT INTO `colors` VALUES ('36', '8', '27');
INSERT INTO `colors` VALUES ('37', '9', '27');
INSERT INTO `colors` VALUES ('38', '8', '28');
INSERT INTO `colors` VALUES ('39', '9', '28');
INSERT INTO `colors` VALUES ('40', '10', '29');
INSERT INTO `colors` VALUES ('41', '11', '29');
INSERT INTO `colors` VALUES ('42', '10', '30');
INSERT INTO `colors` VALUES ('43', '11', '30');
INSERT INTO `colors` VALUES ('44', '10', '31');
INSERT INTO `colors` VALUES ('45', '11', '31');
INSERT INTO `colors` VALUES ('46', '10', '33');
INSERT INTO `colors` VALUES ('47', '11', '33');
INSERT INTO `colors` VALUES ('48', '10', '34');
INSERT INTO `colors` VALUES ('49', '11', '34');
INSERT INTO `colors` VALUES ('50', '12', '36');
INSERT INTO `colors` VALUES ('51', '13', '36');
INSERT INTO `colors` VALUES ('52', '12', '37');
INSERT INTO `colors` VALUES ('53', '13', '37');
INSERT INTO `colors` VALUES ('54', '12', '38');
INSERT INTO `colors` VALUES ('55', '13', '38');
INSERT INTO `colors` VALUES ('56', '13', '39');
INSERT INTO `colors` VALUES ('57', '12', '39');
INSERT INTO `colors` VALUES ('58', '12', '40');
INSERT INTO `colors` VALUES ('59', '13', '40');
INSERT INTO `colors` VALUES ('60', '12', '41');
INSERT INTO `colors` VALUES ('61', '13', '41');
INSERT INTO `colors` VALUES ('62', '12', '42');
INSERT INTO `colors` VALUES ('63', '13', '42');
INSERT INTO `colors` VALUES ('64', '14', '43');
INSERT INTO `colors` VALUES ('65', '15', '43');
INSERT INTO `colors` VALUES ('66', '14', '44');
INSERT INTO `colors` VALUES ('67', '15', '44');
INSERT INTO `colors` VALUES ('68', '14', '45');
INSERT INTO `colors` VALUES ('69', '15', '45');
INSERT INTO `colors` VALUES ('70', '14', '46');
INSERT INTO `colors` VALUES ('71', '15', '46');
INSERT INTO `colors` VALUES ('72', '14', '47');
INSERT INTO `colors` VALUES ('73', '15', '47');
INSERT INTO `colors` VALUES ('74', '14', '48');
INSERT INTO `colors` VALUES ('75', '15', '48');
INSERT INTO `colors` VALUES ('76', '14', '49');
INSERT INTO `colors` VALUES ('77', '15', '49');
INSERT INTO `colors` VALUES ('78', '46', '57');
INSERT INTO `colors` VALUES ('79', '47', '57');
INSERT INTO `colors` VALUES ('80', '48', '57');
INSERT INTO `colors` VALUES ('81', '49', '57');
INSERT INTO `colors` VALUES ('82', '50', '57');
INSERT INTO `colors` VALUES ('83', '51', '57');
INSERT INTO `colors` VALUES ('84', '52', '57');
INSERT INTO `colors` VALUES ('85', '53', '57');
INSERT INTO `colors` VALUES ('86', '54', '57');
INSERT INTO `colors` VALUES ('87', '55', '57');
INSERT INTO `colors` VALUES ('88', '56', '57');
INSERT INTO `colors` VALUES ('89', '57', '57');
INSERT INTO `colors` VALUES ('90', '46', '58');
INSERT INTO `colors` VALUES ('91', '47', '58');
INSERT INTO `colors` VALUES ('92', '48', '58');
INSERT INTO `colors` VALUES ('93', '49', '58');
INSERT INTO `colors` VALUES ('94', '50', '58');
INSERT INTO `colors` VALUES ('95', '51', '58');
INSERT INTO `colors` VALUES ('96', '52', '58');
INSERT INTO `colors` VALUES ('97', '53', '58');
INSERT INTO `colors` VALUES ('98', '54', '58');
INSERT INTO `colors` VALUES ('99', '55', '58');
INSERT INTO `colors` VALUES ('100', '56', '58');
INSERT INTO `colors` VALUES ('101', '57', '58');
INSERT INTO `colors` VALUES ('102', '118', '121');
INSERT INTO `colors` VALUES ('103', '46', '59');
INSERT INTO `colors` VALUES ('104', '47', '59');
INSERT INTO `colors` VALUES ('105', '48', '59');
INSERT INTO `colors` VALUES ('106', '119', '121');
INSERT INTO `colors` VALUES ('107', '49', '59');
INSERT INTO `colors` VALUES ('108', '50', '59');
INSERT INTO `colors` VALUES ('109', '51', '59');
INSERT INTO `colors` VALUES ('110', '118', '122');
INSERT INTO `colors` VALUES ('111', '52', '59');
INSERT INTO `colors` VALUES ('112', '53', '59');
INSERT INTO `colors` VALUES ('113', '54', '59');
INSERT INTO `colors` VALUES ('114', '55', '59');
INSERT INTO `colors` VALUES ('115', '119', '122');
INSERT INTO `colors` VALUES ('116', '56', '59');
INSERT INTO `colors` VALUES ('117', '57', '59');
INSERT INTO `colors` VALUES ('118', '118', '123');
INSERT INTO `colors` VALUES ('119', '119', '123');
INSERT INTO `colors` VALUES ('120', '46', '60');
INSERT INTO `colors` VALUES ('121', '47', '60');
INSERT INTO `colors` VALUES ('122', '48', '60');
INSERT INTO `colors` VALUES ('123', '49', '60');
INSERT INTO `colors` VALUES ('124', '50', '60');
INSERT INTO `colors` VALUES ('125', '51', '60');
INSERT INTO `colors` VALUES ('126', '118', '124');
INSERT INTO `colors` VALUES ('127', '52', '60');
INSERT INTO `colors` VALUES ('128', '53', '60');
INSERT INTO `colors` VALUES ('129', '54', '60');
INSERT INTO `colors` VALUES ('130', '55', '60');
INSERT INTO `colors` VALUES ('131', '56', '60');
INSERT INTO `colors` VALUES ('132', '119', '124');
INSERT INTO `colors` VALUES ('133', '57', '60');
INSERT INTO `colors` VALUES ('134', '118', '126');
INSERT INTO `colors` VALUES ('135', '119', '126');
INSERT INTO `colors` VALUES ('136', '118', '127');
INSERT INTO `colors` VALUES ('137', '119', '127');
INSERT INTO `colors` VALUES ('138', '118', '128');
INSERT INTO `colors` VALUES ('139', '119', '128');
INSERT INTO `colors` VALUES ('140', '46', '61');
INSERT INTO `colors` VALUES ('141', '47', '61');
INSERT INTO `colors` VALUES ('142', '48', '61');
INSERT INTO `colors` VALUES ('143', '49', '61');
INSERT INTO `colors` VALUES ('144', '50', '61');
INSERT INTO `colors` VALUES ('145', '51', '61');
INSERT INTO `colors` VALUES ('146', '52', '61');
INSERT INTO `colors` VALUES ('147', '53', '61');
INSERT INTO `colors` VALUES ('148', '54', '61');
INSERT INTO `colors` VALUES ('149', '55', '61');
INSERT INTO `colors` VALUES ('150', '56', '61');
INSERT INTO `colors` VALUES ('151', '57', '61');
INSERT INTO `colors` VALUES ('152', '121', '129');
INSERT INTO `colors` VALUES ('153', '122', '129');
INSERT INTO `colors` VALUES ('154', '123', '129');
INSERT INTO `colors` VALUES ('155', '121', '130');
INSERT INTO `colors` VALUES ('156', '122', '130');
INSERT INTO `colors` VALUES ('157', '123', '130');
INSERT INTO `colors` VALUES ('158', '121', '131');
INSERT INTO `colors` VALUES ('159', '122', '131');
INSERT INTO `colors` VALUES ('160', '123', '131');
INSERT INTO `colors` VALUES ('161', '121', '132');
INSERT INTO `colors` VALUES ('162', '46', '62');
INSERT INTO `colors` VALUES ('163', '122', '132');
INSERT INTO `colors` VALUES ('164', '47', '62');
INSERT INTO `colors` VALUES ('165', '123', '132');
INSERT INTO `colors` VALUES ('166', '48', '62');
INSERT INTO `colors` VALUES ('167', '49', '62');
INSERT INTO `colors` VALUES ('168', '50', '62');
INSERT INTO `colors` VALUES ('169', '51', '62');
INSERT INTO `colors` VALUES ('170', '52', '62');
INSERT INTO `colors` VALUES ('171', '53', '62');
INSERT INTO `colors` VALUES ('172', '54', '62');
INSERT INTO `colors` VALUES ('173', '55', '62');
INSERT INTO `colors` VALUES ('174', '121', '133');
INSERT INTO `colors` VALUES ('175', '122', '133');
INSERT INTO `colors` VALUES ('176', '56', '62');
INSERT INTO `colors` VALUES ('177', '57', '62');
INSERT INTO `colors` VALUES ('178', '123', '133');
INSERT INTO `colors` VALUES ('179', '121', '134');
INSERT INTO `colors` VALUES ('180', '122', '134');
INSERT INTO `colors` VALUES ('181', '123', '134');
INSERT INTO `colors` VALUES ('182', '121', '135');
INSERT INTO `colors` VALUES ('183', '122', '135');
INSERT INTO `colors` VALUES ('184', '123', '135');
INSERT INTO `colors` VALUES ('185', '46', '63');
INSERT INTO `colors` VALUES ('186', '47', '63');
INSERT INTO `colors` VALUES ('187', '48', '63');
INSERT INTO `colors` VALUES ('188', '49', '63');
INSERT INTO `colors` VALUES ('189', '50', '63');
INSERT INTO `colors` VALUES ('190', '51', '63');
INSERT INTO `colors` VALUES ('191', '52', '63');
INSERT INTO `colors` VALUES ('192', '53', '63');
INSERT INTO `colors` VALUES ('193', '54', '63');
INSERT INTO `colors` VALUES ('194', '55', '63');
INSERT INTO `colors` VALUES ('195', '56', '63');
INSERT INTO `colors` VALUES ('196', '124', '136');
INSERT INTO `colors` VALUES ('197', '57', '63');
INSERT INTO `colors` VALUES ('198', '125', '136');
INSERT INTO `colors` VALUES ('199', '126', '136');
INSERT INTO `colors` VALUES ('200', '127', '136');
INSERT INTO `colors` VALUES ('201', '124', '137');
INSERT INTO `colors` VALUES ('202', '125', '137');
INSERT INTO `colors` VALUES ('203', '126', '137');
INSERT INTO `colors` VALUES ('204', '127', '137');
INSERT INTO `colors` VALUES ('205', '124', '138');
INSERT INTO `colors` VALUES ('206', '125', '138');
INSERT INTO `colors` VALUES ('207', '126', '138');
INSERT INTO `colors` VALUES ('208', '127', '138');
INSERT INTO `colors` VALUES ('209', '124', '139');
INSERT INTO `colors` VALUES ('210', '125', '139');
INSERT INTO `colors` VALUES ('211', '126', '139');
INSERT INTO `colors` VALUES ('212', '127', '139');
INSERT INTO `colors` VALUES ('213', '46', '64');
INSERT INTO `colors` VALUES ('214', '47', '64');
INSERT INTO `colors` VALUES ('215', '48', '64');
INSERT INTO `colors` VALUES ('216', '49', '64');
INSERT INTO `colors` VALUES ('217', '50', '64');
INSERT INTO `colors` VALUES ('218', '51', '64');
INSERT INTO `colors` VALUES ('219', '52', '64');
INSERT INTO `colors` VALUES ('220', '53', '64');
INSERT INTO `colors` VALUES ('221', '54', '64');
INSERT INTO `colors` VALUES ('222', '55', '64');
INSERT INTO `colors` VALUES ('223', '56', '64');
INSERT INTO `colors` VALUES ('224', '57', '64');
INSERT INTO `colors` VALUES ('225', '124', '140');
INSERT INTO `colors` VALUES ('226', '125', '140');
INSERT INTO `colors` VALUES ('227', '126', '140');
INSERT INTO `colors` VALUES ('228', '127', '140');
INSERT INTO `colors` VALUES ('229', '124', '141');
INSERT INTO `colors` VALUES ('230', '125', '141');
INSERT INTO `colors` VALUES ('231', '126', '141');
INSERT INTO `colors` VALUES ('232', '127', '141');
INSERT INTO `colors` VALUES ('233', '125', '142');
INSERT INTO `colors` VALUES ('234', '126', '142');
INSERT INTO `colors` VALUES ('235', '124', '142');
INSERT INTO `colors` VALUES ('236', '127', '142');
INSERT INTO `colors` VALUES ('237', '129', '143');
INSERT INTO `colors` VALUES ('238', '130', '143');
INSERT INTO `colors` VALUES ('239', '131', '143');
INSERT INTO `colors` VALUES ('240', '132', '143');
INSERT INTO `colors` VALUES ('241', '129', '144');
INSERT INTO `colors` VALUES ('242', '130', '144');
INSERT INTO `colors` VALUES ('243', '131', '144');
INSERT INTO `colors` VALUES ('244', '132', '144');
INSERT INTO `colors` VALUES ('245', '46', '65');
INSERT INTO `colors` VALUES ('246', '47', '65');
INSERT INTO `colors` VALUES ('247', '48', '65');
INSERT INTO `colors` VALUES ('248', '49', '65');
INSERT INTO `colors` VALUES ('249', '50', '65');
INSERT INTO `colors` VALUES ('250', '51', '65');
INSERT INTO `colors` VALUES ('251', '129', '145');
INSERT INTO `colors` VALUES ('252', '130', '145');
INSERT INTO `colors` VALUES ('253', '131', '145');
INSERT INTO `colors` VALUES ('254', '132', '145');
INSERT INTO `colors` VALUES ('255', '129', '146');
INSERT INTO `colors` VALUES ('256', '130', '146');
INSERT INTO `colors` VALUES ('257', '131', '146');
INSERT INTO `colors` VALUES ('258', '132', '146');
INSERT INTO `colors` VALUES ('259', '129', '147');
INSERT INTO `colors` VALUES ('260', '130', '147');
INSERT INTO `colors` VALUES ('261', '131', '147');
INSERT INTO `colors` VALUES ('262', '132', '147');
INSERT INTO `colors` VALUES ('263', '52', '65');
INSERT INTO `colors` VALUES ('264', '53', '65');
INSERT INTO `colors` VALUES ('265', '54', '65');
INSERT INTO `colors` VALUES ('266', '55', '65');
INSERT INTO `colors` VALUES ('267', '56', '65');
INSERT INTO `colors` VALUES ('268', '57', '65');
INSERT INTO `colors` VALUES ('269', '129', '148');
INSERT INTO `colors` VALUES ('270', '130', '148');
INSERT INTO `colors` VALUES ('271', '46', '66');
INSERT INTO `colors` VALUES ('272', '47', '66');
INSERT INTO `colors` VALUES ('273', '48', '66');
INSERT INTO `colors` VALUES ('274', '48', '68');
INSERT INTO `colors` VALUES ('275', '131', '148');
INSERT INTO `colors` VALUES ('276', '132', '148');
INSERT INTO `colors` VALUES ('277', '49', '66');
INSERT INTO `colors` VALUES ('278', '129', '149');
INSERT INTO `colors` VALUES ('279', '50', '66');
INSERT INTO `colors` VALUES ('280', '130', '149');
INSERT INTO `colors` VALUES ('281', '131', '149');
INSERT INTO `colors` VALUES ('282', '132', '149');
INSERT INTO `colors` VALUES ('283', '51', '66');
INSERT INTO `colors` VALUES ('284', '133', '150');
INSERT INTO `colors` VALUES ('285', '52', '66');
INSERT INTO `colors` VALUES ('286', '134', '150');
INSERT INTO `colors` VALUES ('287', '135', '150');
INSERT INTO `colors` VALUES ('288', '133', '151');
INSERT INTO `colors` VALUES ('289', '134', '151');
INSERT INTO `colors` VALUES ('290', '135', '151');
INSERT INTO `colors` VALUES ('291', '133', '152');
INSERT INTO `colors` VALUES ('292', '134', '152');
INSERT INTO `colors` VALUES ('293', '135', '152');
INSERT INTO `colors` VALUES ('294', '133', '153');
INSERT INTO `colors` VALUES ('295', '134', '153');
INSERT INTO `colors` VALUES ('296', '135', '153');
INSERT INTO `colors` VALUES ('297', '133', '154');
INSERT INTO `colors` VALUES ('298', '134', '154');
INSERT INTO `colors` VALUES ('299', '135', '154');
INSERT INTO `colors` VALUES ('300', '133', '155');
INSERT INTO `colors` VALUES ('301', '134', '155');
INSERT INTO `colors` VALUES ('302', '135', '155');
INSERT INTO `colors` VALUES ('303', '133', '156');
INSERT INTO `colors` VALUES ('304', '134', '156');
INSERT INTO `colors` VALUES ('305', '135', '156');
INSERT INTO `colors` VALUES ('306', '136', '157');
INSERT INTO `colors` VALUES ('307', '137', '157');
INSERT INTO `colors` VALUES ('308', '136', '158');
INSERT INTO `colors` VALUES ('309', '137', '158');
INSERT INTO `colors` VALUES ('310', '136', '159');
INSERT INTO `colors` VALUES ('311', '137', '159');
INSERT INTO `colors` VALUES ('312', '53', '66');
INSERT INTO `colors` VALUES ('313', '54', '66');
INSERT INTO `colors` VALUES ('314', '55', '66');
INSERT INTO `colors` VALUES ('315', '56', '66');
INSERT INTO `colors` VALUES ('316', '57', '66');
INSERT INTO `colors` VALUES ('317', '46', '68');
INSERT INTO `colors` VALUES ('318', '47', '68');
INSERT INTO `colors` VALUES ('319', '49', '68');
INSERT INTO `colors` VALUES ('320', '49', '68');
INSERT INTO `colors` VALUES ('321', '50', '68');
INSERT INTO `colors` VALUES ('322', '136', '160');
INSERT INTO `colors` VALUES ('323', '137', '160');
INSERT INTO `colors` VALUES ('324', '51', '68');
INSERT INTO `colors` VALUES ('325', '52', '68');
INSERT INTO `colors` VALUES ('326', '53', '68');
INSERT INTO `colors` VALUES ('327', '136', '161');
INSERT INTO `colors` VALUES ('328', '54', '68');
INSERT INTO `colors` VALUES ('329', '55', '68');
INSERT INTO `colors` VALUES ('330', '137', '161');
INSERT INTO `colors` VALUES ('331', '56', '68');
INSERT INTO `colors` VALUES ('332', '136', '162');
INSERT INTO `colors` VALUES ('333', '57', '68');
INSERT INTO `colors` VALUES ('334', '137', '162');
INSERT INTO `colors` VALUES ('335', '136', '163');
INSERT INTO `colors` VALUES ('336', '137', '163');
INSERT INTO `colors` VALUES ('337', '136', '164');
INSERT INTO `colors` VALUES ('338', '137', '164');
INSERT INTO `colors` VALUES ('339', '136', '165');
INSERT INTO `colors` VALUES ('340', '137', '165');
INSERT INTO `colors` VALUES ('341', '58', '69');
INSERT INTO `colors` VALUES ('342', '59', '69');
INSERT INTO `colors` VALUES ('343', '60', '69');
INSERT INTO `colors` VALUES ('344', '138', '166');
INSERT INTO `colors` VALUES ('345', '139', '166');
INSERT INTO `colors` VALUES ('346', '61', '69');
INSERT INTO `colors` VALUES ('347', '62', '69');
INSERT INTO `colors` VALUES ('348', '138', '167');
INSERT INTO `colors` VALUES ('349', '139', '167');
INSERT INTO `colors` VALUES ('350', '63', '69');
INSERT INTO `colors` VALUES ('351', '64', '69');
INSERT INTO `colors` VALUES ('352', '65', '69');
INSERT INTO `colors` VALUES ('353', '66', '69');
INSERT INTO `colors` VALUES ('354', '67', '69');
INSERT INTO `colors` VALUES ('355', '138', '168');
INSERT INTO `colors` VALUES ('356', '68', '69');
INSERT INTO `colors` VALUES ('357', '139', '168');
INSERT INTO `colors` VALUES ('358', '69', '69');
INSERT INTO `colors` VALUES ('359', '138', '169');
INSERT INTO `colors` VALUES ('360', '139', '169');
INSERT INTO `colors` VALUES ('361', '138', '170');
INSERT INTO `colors` VALUES ('362', '139', '170');
INSERT INTO `colors` VALUES ('363', '136', '496');
INSERT INTO `colors` VALUES ('364', '137', '496');
INSERT INTO `colors` VALUES ('365', '58', '70');
INSERT INTO `colors` VALUES ('366', '138', '171');
INSERT INTO `colors` VALUES ('367', '139', '171');
INSERT INTO `colors` VALUES ('368', '59', '70');
INSERT INTO `colors` VALUES ('369', '60', '70');
INSERT INTO `colors` VALUES ('370', '138', '172');
INSERT INTO `colors` VALUES ('371', '58', '71');
INSERT INTO `colors` VALUES ('372', '139', '172');
INSERT INTO `colors` VALUES ('373', '59', '71');
INSERT INTO `colors` VALUES ('374', '60', '71');
INSERT INTO `colors` VALUES ('375', '61', '71');
INSERT INTO `colors` VALUES ('376', '138', '173');
INSERT INTO `colors` VALUES ('377', '62', '71');
INSERT INTO `colors` VALUES ('378', '139', '173');
INSERT INTO `colors` VALUES ('379', '63', '71');
INSERT INTO `colors` VALUES ('380', '138', '174');
INSERT INTO `colors` VALUES ('381', '64', '71');
INSERT INTO `colors` VALUES ('382', '139', '174');
INSERT INTO `colors` VALUES ('383', '138', '497');
INSERT INTO `colors` VALUES ('384', '65', '71');
INSERT INTO `colors` VALUES ('385', '139', '497');
INSERT INTO `colors` VALUES ('386', '207', '348');
INSERT INTO `colors` VALUES ('387', '66', '71');
INSERT INTO `colors` VALUES ('388', '67', '71');
INSERT INTO `colors` VALUES ('389', '68', '71');
INSERT INTO `colors` VALUES ('390', '69', '71');
INSERT INTO `colors` VALUES ('391', '140', '175');
INSERT INTO `colors` VALUES ('392', '208', '348');
INSERT INTO `colors` VALUES ('393', '141', '175');
INSERT INTO `colors` VALUES ('394', '142', '175');
INSERT INTO `colors` VALUES ('395', '143', '175');
INSERT INTO `colors` VALUES ('396', '140', '176');
INSERT INTO `colors` VALUES ('397', '141', '176');
INSERT INTO `colors` VALUES ('398', '142', '176');
INSERT INTO `colors` VALUES ('399', '143', '176');
INSERT INTO `colors` VALUES ('400', '140', '177');
INSERT INTO `colors` VALUES ('401', '141', '177');
INSERT INTO `colors` VALUES ('402', '142', '177');
INSERT INTO `colors` VALUES ('403', '143', '177');
INSERT INTO `colors` VALUES ('404', '140', '178');
INSERT INTO `colors` VALUES ('405', '141', '178');
INSERT INTO `colors` VALUES ('406', '142', '178');
INSERT INTO `colors` VALUES ('407', '143', '178');
INSERT INTO `colors` VALUES ('408', '140', '179');
INSERT INTO `colors` VALUES ('409', '141', '179');
INSERT INTO `colors` VALUES ('410', '142', '179');
INSERT INTO `colors` VALUES ('411', '143', '179');
INSERT INTO `colors` VALUES ('412', '140', '180');
INSERT INTO `colors` VALUES ('413', '141', '180');
INSERT INTO `colors` VALUES ('414', '142', '180');
INSERT INTO `colors` VALUES ('415', '143', '180');
INSERT INTO `colors` VALUES ('416', '140', '181');
INSERT INTO `colors` VALUES ('417', '141', '181');
INSERT INTO `colors` VALUES ('418', '142', '181');
INSERT INTO `colors` VALUES ('419', '143', '181');
INSERT INTO `colors` VALUES ('420', '140', '182');
INSERT INTO `colors` VALUES ('421', '141', '182');
INSERT INTO `colors` VALUES ('422', '142', '182');
INSERT INTO `colors` VALUES ('427', '207', '349');
INSERT INTO `colors` VALUES ('424', '143', '182');
INSERT INTO `colors` VALUES ('425', '140', '183');
INSERT INTO `colors` VALUES ('426', '141', '183');
INSERT INTO `colors` VALUES ('428', '142', '183');
INSERT INTO `colors` VALUES ('429', '143', '183');
INSERT INTO `colors` VALUES ('430', '140', '184');
INSERT INTO `colors` VALUES ('431', '141', '184');
INSERT INTO `colors` VALUES ('432', '142', '184');
INSERT INTO `colors` VALUES ('433', '143', '184');
INSERT INTO `colors` VALUES ('434', '208', '349');
INSERT INTO `colors` VALUES ('435', '58', '72');
INSERT INTO `colors` VALUES ('436', '59', '72');
INSERT INTO `colors` VALUES ('437', '60', '72');
INSERT INTO `colors` VALUES ('438', '61', '72');
INSERT INTO `colors` VALUES ('439', '144', '185');
INSERT INTO `colors` VALUES ('440', '62', '72');
INSERT INTO `colors` VALUES ('441', '145', '185');
INSERT INTO `colors` VALUES ('442', '207', '350');
INSERT INTO `colors` VALUES ('443', '63', '72');
INSERT INTO `colors` VALUES ('444', '146', '185');
INSERT INTO `colors` VALUES ('445', '64', '72');
INSERT INTO `colors` VALUES ('446', '147', '185');
INSERT INTO `colors` VALUES ('447', '65', '72');
INSERT INTO `colors` VALUES ('448', '66', '72');
INSERT INTO `colors` VALUES ('449', '144', '186');
INSERT INTO `colors` VALUES ('450', '67', '72');
INSERT INTO `colors` VALUES ('451', '145', '186');
INSERT INTO `colors` VALUES ('452', '68', '72');
INSERT INTO `colors` VALUES ('453', '69', '72');
INSERT INTO `colors` VALUES ('454', '146', '186');
INSERT INTO `colors` VALUES ('455', '58', '73');
INSERT INTO `colors` VALUES ('456', '147', '186');
INSERT INTO `colors` VALUES ('457', '59', '73');
INSERT INTO `colors` VALUES ('458', '60', '73');
INSERT INTO `colors` VALUES ('459', '61', '73');
INSERT INTO `colors` VALUES ('460', '62', '73');
INSERT INTO `colors` VALUES ('461', '63', '73');
INSERT INTO `colors` VALUES ('462', '64', '73');
INSERT INTO `colors` VALUES ('463', '65', '73');
INSERT INTO `colors` VALUES ('464', '144', '187');
INSERT INTO `colors` VALUES ('465', '66', '73');
INSERT INTO `colors` VALUES ('466', '67', '73');
INSERT INTO `colors` VALUES ('467', '68', '73');
INSERT INTO `colors` VALUES ('468', '69', '73');
INSERT INTO `colors` VALUES ('469', '145', '187');
INSERT INTO `colors` VALUES ('470', '146', '187');
INSERT INTO `colors` VALUES ('471', '147', '187');
INSERT INTO `colors` VALUES ('472', '144', '188');
INSERT INTO `colors` VALUES ('473', '145', '188');
INSERT INTO `colors` VALUES ('474', '146', '188');
INSERT INTO `colors` VALUES ('475', '147', '188');
INSERT INTO `colors` VALUES ('476', '144', '189');
INSERT INTO `colors` VALUES ('477', '145', '189');
INSERT INTO `colors` VALUES ('478', '146', '189');
INSERT INTO `colors` VALUES ('479', '147', '189');
INSERT INTO `colors` VALUES ('480', '144', '190');
INSERT INTO `colors` VALUES ('481', '145', '190');
INSERT INTO `colors` VALUES ('482', '146', '190');
INSERT INTO `colors` VALUES ('483', '147', '190');
INSERT INTO `colors` VALUES ('484', '144', '191');
INSERT INTO `colors` VALUES ('485', '145', '191');
INSERT INTO `colors` VALUES ('486', '146', '191');
INSERT INTO `colors` VALUES ('487', '147', '191');
INSERT INTO `colors` VALUES ('488', '144', '192');
INSERT INTO `colors` VALUES ('489', '145', '192');
INSERT INTO `colors` VALUES ('490', '146', '192');
INSERT INTO `colors` VALUES ('491', '147', '192');
INSERT INTO `colors` VALUES ('492', '144', '193');
INSERT INTO `colors` VALUES ('493', '145', '193');
INSERT INTO `colors` VALUES ('494', '146', '193');
INSERT INTO `colors` VALUES ('495', '147', '193');
INSERT INTO `colors` VALUES ('496', '145', '498');
INSERT INTO `colors` VALUES ('497', '146', '498');
INSERT INTO `colors` VALUES ('498', '147', '498');
INSERT INTO `colors` VALUES ('499', '148', '194');
INSERT INTO `colors` VALUES ('500', '149', '194');
INSERT INTO `colors` VALUES ('501', '150', '194');
INSERT INTO `colors` VALUES ('502', '151', '194');
INSERT INTO `colors` VALUES ('503', '148', '195');
INSERT INTO `colors` VALUES ('504', '149', '195');
INSERT INTO `colors` VALUES ('505', '150', '195');
INSERT INTO `colors` VALUES ('506', '151', '195');
INSERT INTO `colors` VALUES ('507', '148', '197');
INSERT INTO `colors` VALUES ('508', '149', '197');
INSERT INTO `colors` VALUES ('509', '150', '197');
INSERT INTO `colors` VALUES ('510', '151', '197');
INSERT INTO `colors` VALUES ('511', '148', '198');
INSERT INTO `colors` VALUES ('512', '149', '198');
INSERT INTO `colors` VALUES ('513', '150', '198');
INSERT INTO `colors` VALUES ('514', '151', '198');
INSERT INTO `colors` VALUES ('515', '148', '199');
INSERT INTO `colors` VALUES ('516', '149', '199');
INSERT INTO `colors` VALUES ('517', '150', '199');
INSERT INTO `colors` VALUES ('518', '151', '199');
INSERT INTO `colors` VALUES ('519', '148', '200');
INSERT INTO `colors` VALUES ('520', '149', '200');
INSERT INTO `colors` VALUES ('521', '150', '200');
INSERT INTO `colors` VALUES ('522', '151', '200');
INSERT INTO `colors` VALUES ('523', '148', '201');
INSERT INTO `colors` VALUES ('524', '149', '201');
INSERT INTO `colors` VALUES ('525', '150', '201');
INSERT INTO `colors` VALUES ('526', '151', '201');
INSERT INTO `colors` VALUES ('527', '148', '202');
INSERT INTO `colors` VALUES ('528', '149', '202');
INSERT INTO `colors` VALUES ('529', '150', '202');
INSERT INTO `colors` VALUES ('530', '151', '202');
INSERT INTO `colors` VALUES ('531', '148', '203');
INSERT INTO `colors` VALUES ('532', '149', '203');
INSERT INTO `colors` VALUES ('533', '150', '203');
INSERT INTO `colors` VALUES ('534', '151', '203');
INSERT INTO `colors` VALUES ('535', '148', '499');
INSERT INTO `colors` VALUES ('536', '149', '499');
INSERT INTO `colors` VALUES ('537', '150', '499');
INSERT INTO `colors` VALUES ('538', '151', '499');
INSERT INTO `colors` VALUES ('539', '152', '204');
INSERT INTO `colors` VALUES ('540', '153', '204');
INSERT INTO `colors` VALUES ('541', '152', '205');
INSERT INTO `colors` VALUES ('542', '153', '205');
INSERT INTO `colors` VALUES ('543', '152', '206');
INSERT INTO `colors` VALUES ('544', '153', '206');
INSERT INTO `colors` VALUES ('545', '152', '207');
INSERT INTO `colors` VALUES ('546', '61', '70');
INSERT INTO `colors` VALUES ('547', '153', '207');
INSERT INTO `colors` VALUES ('548', '62', '70');
INSERT INTO `colors` VALUES ('549', '152', '208');
INSERT INTO `colors` VALUES ('550', '63', '70');
INSERT INTO `colors` VALUES ('551', '153', '208');
INSERT INTO `colors` VALUES ('552', '152', '209');
INSERT INTO `colors` VALUES ('553', '153', '209');
INSERT INTO `colors` VALUES ('554', '152', '210');
INSERT INTO `colors` VALUES ('555', '153', '210');
INSERT INTO `colors` VALUES ('556', '152', '211');
INSERT INTO `colors` VALUES ('557', '153', '211');
INSERT INTO `colors` VALUES ('558', '64', '70');
INSERT INTO `colors` VALUES ('559', '152', '212');
INSERT INTO `colors` VALUES ('560', '65', '70');
INSERT INTO `colors` VALUES ('561', '66', '70');
INSERT INTO `colors` VALUES ('562', '67', '70');
INSERT INTO `colors` VALUES ('563', '153', '212');
INSERT INTO `colors` VALUES ('564', '68', '70');
INSERT INTO `colors` VALUES ('565', '152', '500');
INSERT INTO `colors` VALUES ('566', '69', '70');
INSERT INTO `colors` VALUES ('567', '153', '500');
INSERT INTO `colors` VALUES ('568', '154', '213');
INSERT INTO `colors` VALUES ('569', '155', '213');
INSERT INTO `colors` VALUES ('570', '156', '213');
INSERT INTO `colors` VALUES ('571', '157', '213');
INSERT INTO `colors` VALUES ('572', '154', '214');
INSERT INTO `colors` VALUES ('573', '155', '214');
INSERT INTO `colors` VALUES ('574', '156', '214');
INSERT INTO `colors` VALUES ('575', '157', '214');
INSERT INTO `colors` VALUES ('576', '154', '215');
INSERT INTO `colors` VALUES ('577', '155', '215');
INSERT INTO `colors` VALUES ('578', '156', '215');
INSERT INTO `colors` VALUES ('579', '157', '215');
INSERT INTO `colors` VALUES ('580', '154', '216');
INSERT INTO `colors` VALUES ('581', '155', '216');
INSERT INTO `colors` VALUES ('582', '156', '216');
INSERT INTO `colors` VALUES ('583', '58', '74');
INSERT INTO `colors` VALUES ('584', '59', '74');
INSERT INTO `colors` VALUES ('585', '157', '216');
INSERT INTO `colors` VALUES ('586', '60', '74');
INSERT INTO `colors` VALUES ('587', '61', '74');
INSERT INTO `colors` VALUES ('588', '62', '74');
INSERT INTO `colors` VALUES ('589', '154', '217');
INSERT INTO `colors` VALUES ('590', '63', '74');
INSERT INTO `colors` VALUES ('591', '64', '74');
INSERT INTO `colors` VALUES ('592', '65', '74');
INSERT INTO `colors` VALUES ('593', '66', '74');
INSERT INTO `colors` VALUES ('594', '67', '74');
INSERT INTO `colors` VALUES ('595', '68', '74');
INSERT INTO `colors` VALUES ('596', '69', '74');
INSERT INTO `colors` VALUES ('597', '155', '217');
INSERT INTO `colors` VALUES ('598', '156', '217');
INSERT INTO `colors` VALUES ('599', '157', '217');
INSERT INTO `colors` VALUES ('600', '154', '218');
INSERT INTO `colors` VALUES ('601', '155', '218');
INSERT INTO `colors` VALUES ('602', '156', '218');
INSERT INTO `colors` VALUES ('603', '157', '218');
INSERT INTO `colors` VALUES ('604', '154', '219');
INSERT INTO `colors` VALUES ('605', '155', '219');
INSERT INTO `colors` VALUES ('606', '156', '219');
INSERT INTO `colors` VALUES ('607', '157', '219');
INSERT INTO `colors` VALUES ('608', '154', '220');
INSERT INTO `colors` VALUES ('609', '155', '220');
INSERT INTO `colors` VALUES ('610', '156', '220');
INSERT INTO `colors` VALUES ('611', '157', '220');
INSERT INTO `colors` VALUES ('612', '154', '221');
INSERT INTO `colors` VALUES ('613', '155', '221');
INSERT INTO `colors` VALUES ('614', '156', '221');
INSERT INTO `colors` VALUES ('615', '157', '221');
INSERT INTO `colors` VALUES ('616', '154', '501');
INSERT INTO `colors` VALUES ('617', '155', '501');
INSERT INTO `colors` VALUES ('618', '156', '501');
INSERT INTO `colors` VALUES ('619', '157', '501');
INSERT INTO `colors` VALUES ('620', '158', '222');
INSERT INTO `colors` VALUES ('621', '159', '222');
INSERT INTO `colors` VALUES ('622', '158', '223');
INSERT INTO `colors` VALUES ('623', '159', '223');
INSERT INTO `colors` VALUES ('624', '158', '224');
INSERT INTO `colors` VALUES ('625', '159', '224');
INSERT INTO `colors` VALUES ('626', '58', '75');
INSERT INTO `colors` VALUES ('627', '59', '75');
INSERT INTO `colors` VALUES ('628', '158', '225');
INSERT INTO `colors` VALUES ('629', '60', '75');
INSERT INTO `colors` VALUES ('630', '61', '75');
INSERT INTO `colors` VALUES ('631', '62', '75');
INSERT INTO `colors` VALUES ('632', '159', '225');
INSERT INTO `colors` VALUES ('633', '63', '75');
INSERT INTO `colors` VALUES ('634', '158', '226');
INSERT INTO `colors` VALUES ('635', '64', '75');
INSERT INTO `colors` VALUES ('636', '65', '75');
INSERT INTO `colors` VALUES ('637', '159', '226');
INSERT INTO `colors` VALUES ('638', '66', '75');
INSERT INTO `colors` VALUES ('639', '67', '75');
INSERT INTO `colors` VALUES ('640', '158', '233');
INSERT INTO `colors` VALUES ('641', '68', '75');
INSERT INTO `colors` VALUES ('642', '69', '75');
INSERT INTO `colors` VALUES ('643', '159', '233');
INSERT INTO `colors` VALUES ('644', '58', '76');
INSERT INTO `colors` VALUES ('645', '59', '76');
INSERT INTO `colors` VALUES ('646', '60', '76');
INSERT INTO `colors` VALUES ('647', '61', '76');
INSERT INTO `colors` VALUES ('648', '62', '76');
INSERT INTO `colors` VALUES ('649', '63', '76');
INSERT INTO `colors` VALUES ('650', '64', '76');
INSERT INTO `colors` VALUES ('651', '65', '76');
INSERT INTO `colors` VALUES ('652', '66', '76');
INSERT INTO `commisions` VALUES ('1', '6', '9', 'p');
INSERT INTO `commisions` VALUES ('2', '7', '0', 'p');
INSERT INTO `commisions` VALUES ('3', '8', '0', 'p');
INSERT INTO `commisions` VALUES ('4', '9', '0', 'p');
INSERT INTO `commisions` VALUES ('5', '10', '0', 'p');
INSERT INTO `commisions` VALUES ('6', '11', '10', 'p');
INSERT INTO `commisions` VALUES ('7', '1', '0', 'p');
INSERT INTO `commisions` VALUES ('8', '2', '0', 'p');
INSERT INTO `commisions` VALUES ('9', '3', '0', 'p');
INSERT INTO `commisions` VALUES ('10', '4', '0', 'p');
INSERT INTO `commisions` VALUES ('11', '5', '0', 'p');
INSERT INTO `commisions` VALUES ('12', '6', '0', 'p');
INSERT INTO `commisions` VALUES ('13', '7', '0', 'p');
INSERT INTO `deal_accessories` VALUES ('1', '1', 'p', '4', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('2', '1', 'p', '8', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('3', '1', 'p', '16', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('6', '1', 'p', '30', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('5', '1', 'p', '18', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('7', '2', 'p', '5', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('8', '2', 'p', '1', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('9', '2', 'p', '10', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('10', '2', 'p', '17', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('11', '2', 'p', '6', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('12', '2', 'p', '25', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('13', '2', 'p', '29', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('26', '0', 'w', '1', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('15', '4', 'p', '5', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('16', '4', 'p', '1', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('17', '4', 'p', '2', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('18', '4', 'p', '3', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('19', '4', 'p', '4', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('20', '4', 'p', '10', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('21', '4', 'p', '14', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('22', '4', 'p', '6', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('23', '4', 'p', '21', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('24', '4', 'p', '25', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('25', '4', 'p', '27', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('28', '0', 'w', '2', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('29', '0', 'w', '25', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('33', '0', 'p', '225', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('32', '0', 'w', '26', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('34', '0', 'p', '226', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('35', '0', 'p', '227', 'N', '0');
INSERT INTO `deal_accessories` VALUES ('36', '0', 'p', '228', 'N', '0');
INSERT INTO `deal_details` VALUES ('1', '1', null, 'Shahzad', 'Mughal', 'Mughal', 'asdasd', 'asd');
INSERT INTO `deal_details` VALUES ('2', '2', null, 'asdasd', '', '', '', '');
INSERT INTO `deal_details` VALUES ('3', '3', null, 'asdasd', '', '', '', '');
INSERT INTO `deal_details` VALUES ('4', '4', null, 'Shahzad', 'asd', 'asd', 'asd', 'asd');
INSERT INTO `deal_details` VALUES ('5', '5', null, 'asdasd', 'asd', 'asd', 'asd', 'asd');
INSERT INTO `deal_details` VALUES ('6', '6', null, 'asd', '', '', '', '');
INSERT INTO `deal_details` VALUES ('7', '7', null, 'Shahzad', '', '', '', '');
INSERT INTO `deal_status` VALUES ('1', '1', '1', '2011-04-19 12:55:46', '2011-04-19 13:54:23', null, null);
INSERT INTO `deal_status` VALUES ('2', '2', '0', '2011-04-19 13:55:16', null, null, null);
INSERT INTO `deal_status` VALUES ('3', '3', '0', '2011-04-19 16:20:26', null, null, null);
INSERT INTO `deal_status` VALUES ('4', '4', '4', '2011-04-19 17:20:42', '2011-04-19 17:47:18', '2011-04-19 17:47:19', '2011-04-19 17:47:21');
INSERT INTO `deal_status` VALUES ('5', '5', '0', '2011-04-19 17:59:31', null, null, null);
INSERT INTO `deal_status` VALUES ('6', '6', '0', '2011-04-20 11:08:39', null, null, null);
INSERT INTO `deal_status` VALUES ('7', '7', '0', '2011-04-20 12:12:43', null, null, null);
INSERT INTO `deals` VALUES ('1', '1', '7', '21', 'cash', '');
INSERT INTO `deals` VALUES ('2', '1', '785', '21', 'cash', '');
INSERT INTO `deals` VALUES ('3', '1', 'Testings', '21', 'cash', '');
INSERT INTO `deals` VALUES ('4', '1', '78854', '21', 'cash', '');
INSERT INTO `deals` VALUES ('5', '1', 'red', '29', 'cash', '');
INSERT INTO `deals` VALUES ('6', '1', 'asdasdasd', '21', 'cash', '');
INSERT INTO `deals` VALUES ('7', '1', 'Mines', '29', 'cash', '');
INSERT INTO `exterior_colors` VALUES ('2', '1', 'Belize Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('3', '1', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('4', '1', 'Polished Metal Metallic', '0x707070');
INSERT INTO `exterior_colors` VALUES ('5', '1', 'San Marino Red', '0xac1a07');
INSERT INTO `exterior_colors` VALUES ('6', '1', 'T Pink', '0xff33cc');
INSERT INTO `exterior_colors` VALUES ('7', '9', 'Alabaster Silver Metallic', '0xd8d8db');
INSERT INTO `exterior_colors` VALUES ('8', '9', 'Belize Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('11', '9', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('14', '9', 'San Marino Red', '0xac1a07');
INSERT INTO `exterior_colors` VALUES ('13', '9', 'Polished Metal Metallic', '0x707070');
INSERT INTO `exterior_colors` VALUES ('15', '9', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('16', '10', 'Alabaster Silver Metallic', '0xd8d8db');
INSERT INTO `exterior_colors` VALUES ('17', '10', 'Belize Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('19', '10', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('20', '10', 'Polished Metal Metallic', '0x707070 ');
INSERT INTO `exterior_colors` VALUES ('21', '10', 'San Marino Red', '0xac1a07');
INSERT INTO `exterior_colors` VALUES ('22', '10', 'Taffeta White', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('23', '11', 'Alabaster Silver Metallic', '0xd8d8db');
INSERT INTO `exterior_colors` VALUES ('24', '11', 'Belize Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('25', '11', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('26', '11', 'Polished Metal Metallic', '0x707070');
INSERT INTO `exterior_colors` VALUES ('27', '11', 'San Marino Red', '0xac1a07');
INSERT INTO `exterior_colors` VALUES ('28', '11', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('29', '12', 'Alabaster Silver Metallic', '0xd8d8db');
INSERT INTO `exterior_colors` VALUES ('30', '12', 'Belize Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('31', '12', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('32', '12', 'Polished Metal Metallic', '0x707070');
INSERT INTO `exterior_colors` VALUES ('33', '12', 'San Marino Red', '0xac1a07');
INSERT INTO `exterior_colors` VALUES ('34', '12', 'Taffeta White', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('36', '13', 'Alabaster Silver Metallic', '0xcac9c9');
INSERT INTO `exterior_colors` VALUES ('37', '13', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('38', '13', 'Glacier Blue Metallic', '0x697481 ');
INSERT INTO `exterior_colors` VALUES ('39', '13', 'Opal Sage Metallic', '0x596c6a');
INSERT INTO `exterior_colors` VALUES ('40', '13', 'Polished Metal Metallic', '0x494c53 ');
INSERT INTO `exterior_colors` VALUES ('41', '13', 'Tango Red Pearl', '0x870215');
INSERT INTO `exterior_colors` VALUES ('42', '13', 'White Diamond Pearl', '0xfaf6eb');
INSERT INTO `exterior_colors` VALUES ('43', '15', 'Alabaster Silver Metallic', '0xcac9c9');
INSERT INTO `exterior_colors` VALUES ('44', '15', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('45', '15', 'Glacier Blue Metallic', '0x697481');
INSERT INTO `exterior_colors` VALUES ('46', '15', 'Opal Sage Metallic', '0x596c6a ');
INSERT INTO `exterior_colors` VALUES ('47', '15', 'Polished Metal Metallic', '0x494c53 ');
INSERT INTO `exterior_colors` VALUES ('48', '15', 'Tango Red Pearl', '0x870215');
INSERT INTO `exterior_colors` VALUES ('49', '15', '	White Diamond Pearl', '0xfaf6eb ');
INSERT INTO `exterior_colors` VALUES ('50', '68', 'Alabaster Silver Metallic', '0xcac9c9');
INSERT INTO `exterior_colors` VALUES ('51', '68', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('52', '68', 'Glacier Blue Metallic', '0x697481');
INSERT INTO `exterior_colors` VALUES ('53', '68', 'Opal Sage Metallic', '0x596c6a');
INSERT INTO `exterior_colors` VALUES ('54', '68', 'Polished Metal Metallic', '0x494c53');
INSERT INTO `exterior_colors` VALUES ('55', '68', 'Tango Red Pearl', '0x870215');
INSERT INTO `exterior_colors` VALUES ('56', '68', 'White Diamond Pearl', '0xfaf6eb');
INSERT INTO `exterior_colors` VALUES ('57', '16', '	Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('58', '16', 'Bali Blue Pearl', '0x001d59');
INSERT INTO `exterior_colors` VALUES ('59', '16', 'Basque Red Pearl', '0x210b0c');
INSERT INTO `exterior_colors` VALUES ('60', '16', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('61', '16', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('62', '16', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('63', '16', 'Mystic Green Metallic', '0x666d54');
INSERT INTO `exterior_colors` VALUES ('64', '16', 'Polished Metal Metallic', '0x454545');
INSERT INTO `exterior_colors` VALUES ('65', '16', 'Royal Blue Pearl', '0x1b1e38');
INSERT INTO `exterior_colors` VALUES ('66', '16', 'Taffeta White', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('68', '16', ' White Diamond Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('69', '17', 'Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('70', '17', 'Bali Blue Pearl', '0x001d59');
INSERT INTO `exterior_colors` VALUES ('71', '17', 'Basque Red Pearl', '0x210b0c ');
INSERT INTO `exterior_colors` VALUES ('72', '17', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('73', '17', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('74', '17', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('75', '17', 'Mystic Green Metallic', '0x666d54');
INSERT INTO `exterior_colors` VALUES ('76', '17', 'Polished Metal Metallic', '0x454545');
INSERT INTO `exterior_colors` VALUES ('77', '17', 'Royal Blue Pearl', '0x1b1e38');
INSERT INTO `exterior_colors` VALUES ('78', '17', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('79', '17', 'White Diamond Pearl', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('80', '18', 'Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('81', '18', 'Bali Blue Pearl', '0x001d59 ');
INSERT INTO `exterior_colors` VALUES ('82', '18', 'Basque Red Pearl', '0x210b0c');
INSERT INTO `exterior_colors` VALUES ('83', '18', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('84', '18', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('85', '18', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('86', '18', '	Mystic Green Metallic ', '0x666d54');
INSERT INTO `exterior_colors` VALUES ('87', '18', '	Polished Metal Metallic', '0x454545');
INSERT INTO `exterior_colors` VALUES ('88', '18', 'Royal Blue Pearl', '0x1b1e38');
INSERT INTO `exterior_colors` VALUES ('89', '18', '	Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('90', '18', 'White Diamond Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('91', '19', 'Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('92', '19', 'Bali Blue Pearl', '0x001d59');
INSERT INTO `exterior_colors` VALUES ('93', '19', 'Basque Red Pearl', '0x210b0c');
INSERT INTO `exterior_colors` VALUES ('94', '19', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('95', '19', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('96', '19', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('97', '19', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('98', '19', 'Mystic Green Metallic', '0x666d54');
INSERT INTO `exterior_colors` VALUES ('99', '19', 'Polished Metal Metallic ', '0x454545');
INSERT INTO `exterior_colors` VALUES ('100', '20', 'Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('101', '20', 'Bali Blue Pearl', '0x001d59');
INSERT INTO `exterior_colors` VALUES ('102', '20', 'Basque Red Pearl', '0x210b0c');
INSERT INTO `exterior_colors` VALUES ('103', '20', 'Bold Beige Metallic', '0x8a8066');
INSERT INTO `exterior_colors` VALUES ('104', '20', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('105', '20', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('106', '20', 'Mystic Green Metallic', '0x666d54');
INSERT INTO `exterior_colors` VALUES ('107', '20', 'Polished Metal Metallic', '0x454545 ');
INSERT INTO `exterior_colors` VALUES ('108', '20', 'Royal Blue Pearl', '0x1b1e38');
INSERT INTO `exterior_colors` VALUES ('109', '20', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('110', '21', 'Alabaster Silver Metallic', '0xbdbdbd');
INSERT INTO `exterior_colors` VALUES ('111', '21', 'Bali Blue Pearl', '0x001d59 ');
INSERT INTO `exterior_colors` VALUES ('112', '21', 'Basque Red Pearl', '0x210b0c');
INSERT INTO `exterior_colors` VALUES ('113', '21', 'Bold Beige Metallic', '0x8a8066 ');
INSERT INTO `exterior_colors` VALUES ('114', '21', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('115', '21', 'Dark Cherry Pearl', '0x420f07');
INSERT INTO `exterior_colors` VALUES ('116', '21', 'Mystic Green Metallic', '0x666d54 ');
INSERT INTO `exterior_colors` VALUES ('117', '21', 'Polished Metal Metallic', '0x454545');
INSERT INTO `exterior_colors` VALUES ('118', '21', 'Royal Blue Pearl', '0x1b1e38');
INSERT INTO `exterior_colors` VALUES ('119', '21', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('121', '22', 'Alabaster Silver Metallic', '0xb2b3b3');
INSERT INTO `exterior_colors` VALUES ('122', '22', 'Atomic Blue Metallic', '0x144487');
INSERT INTO `exterior_colors` VALUES ('123', '22', 'Crystal Black Pearl ', '0x000000');
INSERT INTO `exterior_colors` VALUES ('124', '22', 'Polished Metal Metallic', '0x3d3f46');
INSERT INTO `exterior_colors` VALUES ('126', '22', 'Rallye Red ', '0xad0009');
INSERT INTO `exterior_colors` VALUES ('127', '22', 'Royal Blue Pearl', '0x000334');
INSERT INTO `exterior_colors` VALUES ('128', '22', 'Taffeta White', '0xf8f8f8');
INSERT INTO `exterior_colors` VALUES ('129', '23', 'Alabaster Silver Metallic', '0xb2b3b3');
INSERT INTO `exterior_colors` VALUES ('130', '23', 'Atomic Blue Metallic', '0x144487');
INSERT INTO `exterior_colors` VALUES ('131', '23', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('132', '23', 'Polished Metal Metallic', '0x3d3f46 ');
INSERT INTO `exterior_colors` VALUES ('133', '23', 'Rallye Red', '0xad0009 ');
INSERT INTO `exterior_colors` VALUES ('134', '23', 'Royal Blue Pearl', '0x000334');
INSERT INTO `exterior_colors` VALUES ('135', '23', 'Taffeta White', '0xf8f8f8 ');
INSERT INTO `exterior_colors` VALUES ('136', '24', 'Alabaster Silver Metallic', '0xb2b3b3 ');
INSERT INTO `exterior_colors` VALUES ('137', '24', 'Atomic Blue Metallic', '0x144487');
INSERT INTO `exterior_colors` VALUES ('138', '24', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('139', '24', 'Polished Metal Metallic', '0x3d3f46 ');
INSERT INTO `exterior_colors` VALUES ('140', '24', 'Rallye Red', '0xad0009');
INSERT INTO `exterior_colors` VALUES ('141', '24', 'Royal Blue Pearl', '0x000334');
INSERT INTO `exterior_colors` VALUES ('142', '24', 'Taffeta White', '0xf8f8f8');
INSERT INTO `exterior_colors` VALUES ('143', '25', 'Alabaster Silver Metallic', '0xb2b3b3');
INSERT INTO `exterior_colors` VALUES ('144', '25', 'Atomic Blue Metallic', '0x144487');
INSERT INTO `exterior_colors` VALUES ('145', '25', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('146', '25', 'Polished Metal Metallic', '0x3d3f46');
INSERT INTO `exterior_colors` VALUES ('147', '25', 'Rallye Red', '0xad0009');
INSERT INTO `exterior_colors` VALUES ('148', '25', 'Royal Blue Pearl', '0x000334');
INSERT INTO `exterior_colors` VALUES ('149', '25', 'Taffeta White', '0xf8f8f8');
INSERT INTO `exterior_colors` VALUES ('150', '26', 'Alabaster Silver Metallic', '0xb2b3b3');
INSERT INTO `exterior_colors` VALUES ('151', '26', 'Atomic Blue Metallic', '0x144487 ');
INSERT INTO `exterior_colors` VALUES ('152', '26', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('153', '26', 'Polished Metal Metallic', '0x3d3f46 ');
INSERT INTO `exterior_colors` VALUES ('154', '26', 'Rallye Red', '0xad0009');
INSERT INTO `exterior_colors` VALUES ('155', '26', 'Royal Blue Pearl', '0x000334');
INSERT INTO `exterior_colors` VALUES ('156', '26', 'Taffeta White', '0xf8f8f8 ');
INSERT INTO `exterior_colors` VALUES ('157', '27', 'Alabaster Silver Metallic', '0xe5e5ea ');
INSERT INTO `exterior_colors` VALUES ('158', '27', 'Atomic Blue Metallic', '0x3479b0 ');
INSERT INTO `exterior_colors` VALUES ('159', '27', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('160', '27', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('161', '27', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('162', '27', 'Royal Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('163', '27', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('164', '27', 'Tango Red Pearl', '0x5a040f ');
INSERT INTO `exterior_colors` VALUES ('165', '27', 'Urban Titanium Metallic', '0x4a4342');
INSERT INTO `exterior_colors` VALUES ('166', '28', 'Alabaster Silver Metallic', '0xe5e5ea');
INSERT INTO `exterior_colors` VALUES ('167', '28', 'Atomic Blue Metallic', '0x3479b0 ');
INSERT INTO `exterior_colors` VALUES ('168', '28', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('169', '28', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('170', '28', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('171', '28', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('172', '28', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('173', '28', 'Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('174', '28', 'Urban Titanium Metallic', '0x4a4342 ');
INSERT INTO `exterior_colors` VALUES ('175', '29', 'Alabaster Silver Metallic', '0xe5e5ea');
INSERT INTO `exterior_colors` VALUES ('176', '29', 'Atomic Blue Metallic', '0x3479b0');
INSERT INTO `exterior_colors` VALUES ('177', '29', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('178', '29', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('179', '29', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('180', '29', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('181', '29', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('182', '29', 'Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('183', '29', 'Urban Titanium Metallic', '0x4a4342');
INSERT INTO `exterior_colors` VALUES ('184', '29', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('185', '30', 'Alabaster Silver Metallic', '0xe5e5ea ');
INSERT INTO `exterior_colors` VALUES ('186', '30', 'Atomic Blue Metallic', '0x3479b0 ');
INSERT INTO `exterior_colors` VALUES ('187', '30', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('188', '30', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('189', '30', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('190', '30', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('191', '30', 'Spectrum White Pearl', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('192', '30', 'Tango Red Pearl', '0x5a040f ');
INSERT INTO `exterior_colors` VALUES ('193', '30', 'Urban Titanium Metallic', '0x4a4342');
INSERT INTO `exterior_colors` VALUES ('194', '31', 'Alabaster Silver Metallic', '0xe5e5ea ');
INSERT INTO `exterior_colors` VALUES ('195', '31', 'Atomic Blue Metallic', '0x3479b0');
INSERT INTO `exterior_colors` VALUES ('197', '31', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('198', '31', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('199', '31', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('200', '31', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('201', '31', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('202', '31', 'Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('203', '31', 'Urban Titanium Metallic', '0x4a4342 ');
INSERT INTO `exterior_colors` VALUES ('204', '32', 'Alabaster Silver Metallic', '0xe5e5ea');
INSERT INTO `exterior_colors` VALUES ('205', '32', 'Atomic Blue Metallic', '0x3479b0');
INSERT INTO `exterior_colors` VALUES ('206', '32', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('207', '32', 'Magnetic Pearl', '0x404653 ');
INSERT INTO `exterior_colors` VALUES ('208', '32', 'Polished Metal Metallic', '0x757575 ');
INSERT INTO `exterior_colors` VALUES ('209', '32', 'Royal Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('210', '32', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('211', '32', 'Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('212', '32', 'Urban Titanium Metallic', '0x4a4342');
INSERT INTO `exterior_colors` VALUES ('213', '33', 'Alabaster Silver Metallic', '0xe5e5ea');
INSERT INTO `exterior_colors` VALUES ('214', '33', 'Atomic Blue Metallic', '0x3479b0');
INSERT INTO `exterior_colors` VALUES ('215', '33', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('216', '33', 'Magnetic Pearl', '0x404653 ');
INSERT INTO `exterior_colors` VALUES ('217', '33', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('218', '33', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('219', '33', 'Spectrum White Pearl', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('220', '33', '	Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('221', '33', 'Urban Titanium Metallic', '0x4a4342 ');
INSERT INTO `exterior_colors` VALUES ('222', '34', 'Alabaster Silver Metallic', '0xe5e5ea ');
INSERT INTO `exterior_colors` VALUES ('223', '34', 'Atomic Blue Metallic', '0x3479b0');
INSERT INTO `exterior_colors` VALUES ('224', '34', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('225', '34', 'Magnetic Pearl', '0x404653');
INSERT INTO `exterior_colors` VALUES ('226', '34', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('234', '35', 'Alabaster Silver Metallic ', '0xe5e5ea');
INSERT INTO `exterior_colors` VALUES ('233', '34', 'Urban Titanium Metallic', '0x4a4342 ');
INSERT INTO `exterior_colors` VALUES ('229', '34', 'Royal Blue Pearl', '0x1f2a5e ');
INSERT INTO `exterior_colors` VALUES ('230', '34', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('231', '34', 'Tango Red Pearl', '0x5a040f ');
INSERT INTO `exterior_colors` VALUES ('235', '35', 'Atomic Blue Metallic', '0x3479b0 ');
INSERT INTO `exterior_colors` VALUES ('236', '35', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('237', '35', 'Magnetic Pearl', '0x404653 ');
INSERT INTO `exterior_colors` VALUES ('238', '35', 'Polished Metal Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('239', '35', 'Royal Blue Pearl', '0x1f2a5e');
INSERT INTO `exterior_colors` VALUES ('240', '35', 'Spectrum White Pearl', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('241', '35', 'Tango Red Pearl', '0x5a040f');
INSERT INTO `exterior_colors` VALUES ('242', '35', 'Urban Titanium Metallic', '0x4a4342 ');
INSERT INTO `exterior_colors` VALUES ('243', '36', 'Alabaster Silver Metallic', '0xbcbcbc ');
INSERT INTO `exterior_colors` VALUES ('244', '36', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('245', '36', 'Glacier Blue Metallic', '0x7e8895');
INSERT INTO `exterior_colors` VALUES ('246', '36', 'Opal Sage Metallic ', '0x4a5d59');
INSERT INTO `exterior_colors` VALUES ('247', '36', 'Polished Metal Metallic', '0x333846 ');
INSERT INTO `exterior_colors` VALUES ('248', '36', 'Taffeta White', '0xffffff ');
INSERT INTO `exterior_colors` VALUES ('249', '36', 'Royal Blue Pearl', '0x070f35 ');
INSERT INTO `exterior_colors` VALUES ('250', '36', 'Tango Red Pearl', '0x7b0010 ');
INSERT INTO `exterior_colors` VALUES ('251', '36', '	Urban Titanium Metallic', '0x525256 ');
INSERT INTO `exterior_colors` VALUES ('252', '37', 'Alabaster Silver Metallic', '0xbcbcbc');
INSERT INTO `exterior_colors` VALUES ('253', '37', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('254', '37', 'Glacier Blue Metallic', '0x7e8895 ');
INSERT INTO `exterior_colors` VALUES ('255', '37', 'Opal Sage Metallic', '0x4a5d59');
INSERT INTO `exterior_colors` VALUES ('256', '37', 'Polished Metal Metallic', '0x333846 ');
INSERT INTO `exterior_colors` VALUES ('257', '37', 'Royal Blue Pearl', '0x070f35');
INSERT INTO `exterior_colors` VALUES ('258', '37', 'Taffeta White', '0xffffff ');
INSERT INTO `exterior_colors` VALUES ('259', '37', 'Tango Red Pearl', '0x7b0010 ');
INSERT INTO `exterior_colors` VALUES ('261', '37', 'Urban Titanium Metallic', '0x525256 ');
INSERT INTO `exterior_colors` VALUES ('262', '38', 'Alabaster Silver Metallic ', '0xbcbcbc');
INSERT INTO `exterior_colors` VALUES ('263', '38', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('264', '38', 'Glacier Blue Metallic', '0x7e8895');
INSERT INTO `exterior_colors` VALUES ('265', '38', 'Opal Sage Metallic ', '0x4a5d59		');
INSERT INTO `exterior_colors` VALUES ('266', '38', 'Royal Blue Pearl', '0x333846');
INSERT INTO `exterior_colors` VALUES ('267', '38', 'Royal Blue Pearl', '0x070f35 ');
INSERT INTO `exterior_colors` VALUES ('268', '38', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('269', '38', 'Tango Red Pearl', '0x7b0010 ');
INSERT INTO `exterior_colors` VALUES ('271', '38', 'Urban Titanium Metallic', '0x525256 ');
INSERT INTO `exterior_colors` VALUES ('272', '39', '	Alabaster Silver Metallic', '0xbababa ');
INSERT INTO `exterior_colors` VALUES ('273', '39', 'Citrus Fire Metallic', '0x882c00 ');
INSERT INTO `exterior_colors` VALUES ('274', '39', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('275', '39', 'Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('276', '39', 'Polished Metal Metallic', '0x282a36 ');
INSERT INTO `exterior_colors` VALUES ('277', '39', 'Royal Blue Pearl', '0x010019 ');
INSERT INTO `exterior_colors` VALUES ('278', '39', 'Tango Red Pearl', '0x410001');
INSERT INTO `exterior_colors` VALUES ('279', '40', 'Alabaster Silver Metallic', '0xbababa');
INSERT INTO `exterior_colors` VALUES ('280', '40', 'Citrus Fire Metallic', '0x882c00 ');
INSERT INTO `exterior_colors` VALUES ('281', '40', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('282', '40', 'Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('283', '40', 'Polished Metal Metallic', '0x282a36 ');
INSERT INTO `exterior_colors` VALUES ('284', '40', 'Royal Blue Pearl', '0x010019 ');
INSERT INTO `exterior_colors` VALUES ('285', '40', 'Tango Red Pearl', '0x410001 ');
INSERT INTO `exterior_colors` VALUES ('286', '39', 'Tango Red Pearl', '0x410001');
INSERT INTO `exterior_colors` VALUES ('287', '41', 'Alabaster Silver Metallic', '0xbababa');
INSERT INTO `exterior_colors` VALUES ('288', '41', 'Citrus Fire Metallic', '0x882c00');
INSERT INTO `exterior_colors` VALUES ('289', '41', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('290', '41', 'Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('291', '41', 'Polished Metal Metallic', '0x282a36 ');
INSERT INTO `exterior_colors` VALUES ('292', '41', 'Royal Blue Pearl', '0x010019');
INSERT INTO `exterior_colors` VALUES ('293', '41', 'Tango Red Pearl', '0x410001');
INSERT INTO `exterior_colors` VALUES ('294', '42', 'Alabaster Silver Metallic', '0xbababa');
INSERT INTO `exterior_colors` VALUES ('295', '42', 'Citrus Fire Metallic', '0x882c00');
INSERT INTO `exterior_colors` VALUES ('296', '42', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('297', '42', 'Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('298', '42', 'Polished Metal Metallic', '0x282a36');
INSERT INTO `exterior_colors` VALUES ('299', '42', '	Royal Blue Pearl', '0x010019 ');
INSERT INTO `exterior_colors` VALUES ('300', '42', 'Tango Red Pearl', '0x410001');
INSERT INTO `exterior_colors` VALUES ('301', '43', 'Alabaster Silver Metallic', '0xbababa ');
INSERT INTO `exterior_colors` VALUES ('302', '43', 'Citrus Fire Metallic', '0x882c00 ');
INSERT INTO `exterior_colors` VALUES ('303', '43', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('304', '43', '	Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('305', '43', 'Polished Metal Metallic', '0x282a36');
INSERT INTO `exterior_colors` VALUES ('306', '43', 'Royal Blue Pearl', '0x010019');
INSERT INTO `exterior_colors` VALUES ('307', '43', 'Tango Red Pearl', '0x410001 ');
INSERT INTO `exterior_colors` VALUES ('308', '44', 'Alabaster Silver Metallic', '0xbababa');
INSERT INTO `exterior_colors` VALUES ('309', '44', 'Citrus Fire Metallic', '0x882c00 ');
INSERT INTO `exterior_colors` VALUES ('310', '44', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('311', '44', 'Omni Blue Pearl', '0xadbeb4 ');
INSERT INTO `exterior_colors` VALUES ('313', '44', 'Polished Metal Metallic', '0x282a36 ');
INSERT INTO `exterior_colors` VALUES ('314', '44', 'Royal Blue Pearl', '0x010019 ');
INSERT INTO `exterior_colors` VALUES ('315', '44', 'Tango Red Pearl', '0x410001 ');
INSERT INTO `exterior_colors` VALUES ('316', '45', 'Alabaster Silver Metallic', '0xbababa');
INSERT INTO `exterior_colors` VALUES ('317', '45', 'Citrus Fire Metallic', '0x882c00 ');
INSERT INTO `exterior_colors` VALUES ('318', '45', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('319', '45', 'Omni Blue Pearl', '0xadbeb4');
INSERT INTO `exterior_colors` VALUES ('320', '45', 'Polished Metal Metallic', '0x282a36 ');
INSERT INTO `exterior_colors` VALUES ('321', '45', 'Royal Blue Pearl', '0x010019 ');
INSERT INTO `exterior_colors` VALUES ('322', '45', 'Tango Red Pearl', '0x410001 ');
INSERT INTO `exterior_colors` VALUES ('323', '46', 'Blackberry Pearl', '0x140c1d');
INSERT INTO `exterior_colors` VALUES ('324', '46', '	Blue Sensation Pearl', '0x041167 ');
INSERT INTO `exterior_colors` VALUES ('325', '46', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('326', '46', 'Milano Red', '0xd50000 ');
INSERT INTO `exterior_colors` VALUES ('327', '46', 'Orange Revolution Metallic', '0xcd6412');
INSERT INTO `exterior_colors` VALUES ('328', '46', 'Storm Silver Metallic', '0x757575');
INSERT INTO `exterior_colors` VALUES ('329', '46', 'Taffeta White', '0xffffff ');
INSERT INTO `exterior_colors` VALUES ('330', '46', 'Tidewater Blue Metallic', '0x9ca5b4 ');
INSERT INTO `exterior_colors` VALUES ('331', '47', 'Blackberry Pearl', '0x140c1d ');
INSERT INTO `exterior_colors` VALUES ('332', '47', '	Blue Sensation Pearl', '0x041167');
INSERT INTO `exterior_colors` VALUES ('333', '47', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('334', '47', 'Milano Red', '0xd50000');
INSERT INTO `exterior_colors` VALUES ('335', '47', 'Orange Revolution Metallic', '0xcd6412 ');
INSERT INTO `exterior_colors` VALUES ('336', '47', 'Orange Revolution Metallic', '0xcd6412 ');
INSERT INTO `exterior_colors` VALUES ('337', '47', 'Storm Silver Metallic', '0x 757575');
INSERT INTO `exterior_colors` VALUES ('338', '47', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('339', '47', 'Tidewater Blue Metallic', '0x9ca5b4');
INSERT INTO `exterior_colors` VALUES ('340', '48', 'Blackberry Pearl', '0x140c1d');
INSERT INTO `exterior_colors` VALUES ('341', '48', 'Blue Sensation Pearl', '0x041167 ');
INSERT INTO `exterior_colors` VALUES ('342', '48', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('343', '48', 'Milano Red ', '0xd50000		');
INSERT INTO `exterior_colors` VALUES ('344', '48', 'Orange Revolution Metallic', '0xcd6412');
INSERT INTO `exterior_colors` VALUES ('345', '48', 'Storm Silver Metallic ', '0x757575');
INSERT INTO `exterior_colors` VALUES ('346', '48', 'Taffeta White', '0xffffff ');
INSERT INTO `exterior_colors` VALUES ('347', '48', 'Tidewater Blue Metallic', '0x9ca5b4 ');
INSERT INTO `exterior_colors` VALUES ('348', '49', 'Alabaster Silver Metallic', '0xd2d6e1');
INSERT INTO `exterior_colors` VALUES ('349', '49', 'Atomic Blue Metallic', '0x5c7db0 ');
INSERT INTO `exterior_colors` VALUES ('350', '49', 'Clear Sky Blue Metallic', '0x1577ab');
INSERT INTO `exterior_colors` VALUES ('351', '49', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('352', '49', 'Polished Metal Metallic', '0x5e6477 ');
INSERT INTO `exterior_colors` VALUES ('353', '49', 'Spectrum White Pearl', '0xfafdfd ');
INSERT INTO `exterior_colors` VALUES ('354', '49', 'Tango Red Pearl', '0x801820 ');
INSERT INTO `exterior_colors` VALUES ('355', '50', 'Alabaster Silver Metallic', '0xd2d6e1 ');
INSERT INTO `exterior_colors` VALUES ('356', '50', 'Atomic Blue Metallic', '0x5c7db0');
INSERT INTO `exterior_colors` VALUES ('357', '50', 'Clear Sky Blue Metallic ', '0x1577ab');
INSERT INTO `exterior_colors` VALUES ('358', '50', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('359', '50', 'Polished Metal Metallic', '0x5e6477');
INSERT INTO `exterior_colors` VALUES ('360', '50', 'Spectrum White Pearl', '0xfafdfd ');
INSERT INTO `exterior_colors` VALUES ('361', '50', 'Tango Red Pearl', '0x801820');
INSERT INTO `exterior_colors` VALUES ('362', '51', 'Alabaster Silver Metallic', '0xd2d6e1');
INSERT INTO `exterior_colors` VALUES ('363', '51', 'Atomic Blue Metallic', '0x5c7db0 ');
INSERT INTO `exterior_colors` VALUES ('364', '51', 'Clear Sky Blue Metallic', '0x1577ab ');
INSERT INTO `exterior_colors` VALUES ('365', '51', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('366', '51', 'Polished Metal Metallic', '0x5e6477');
INSERT INTO `exterior_colors` VALUES ('367', '51', 'Spectrum White Pearl', '0xfafdfd');
INSERT INTO `exterior_colors` VALUES ('368', '51', 'Tango Red Pearl', '0x801820 ');
INSERT INTO `exterior_colors` VALUES ('369', '52', ' Alabaster Silver Metallic', '0xcecece');
INSERT INTO `exterior_colors` VALUES ('370', '52', 'Baltic Blue Pearl', '0x040c1d');
INSERT INTO `exterior_colors` VALUES ('371', '52', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('372', '52', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('373', '52', 'Mocha Metallic', '0x86745c ');
INSERT INTO `exterior_colors` VALUES ('374', '52', 'Ocean Mist Metallic', '0x62666a ');
INSERT INTO `exterior_colors` VALUES ('375', '52', 'Polished Metal Metallic', '0x484e4e');
INSERT INTO `exterior_colors` VALUES ('376', '52', 'Slate Green Metallic', '0x6d7573');
INSERT INTO `exterior_colors` VALUES ('377', '52', 'Taffeta White', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('378', '53', 'Alabaster Silver Metallic', '0xcecece ');
INSERT INTO `exterior_colors` VALUES ('379', '53', 'Baltic Blue Pearl', '0x040c1d ');
INSERT INTO `exterior_colors` VALUES ('380', '53', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('381', '53', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('382', '53', 'Mocha Metallic', '0x86745c');
INSERT INTO `exterior_colors` VALUES ('383', '53', 'Ocean Mist Metallic', '0x62666a ');
INSERT INTO `exterior_colors` VALUES ('384', '53', ' Polished Metal Metallic', '0x484e4e');
INSERT INTO `exterior_colors` VALUES ('385', '53', 'Slate Green Metallic', '0x6d7573 ');
INSERT INTO `exterior_colors` VALUES ('386', '53', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('387', '54', 'Alabaster Silver Metallic', '0xcecece');
INSERT INTO `exterior_colors` VALUES ('388', '54', 'Baltic Blue Pearl', '0x040c1d');
INSERT INTO `exterior_colors` VALUES ('389', '54', 'Crystal Black Pearl ', '0x000000');
INSERT INTO `exterior_colors` VALUES ('390', '54', 'Dark Cherry Pearl', '0x270209');
INSERT INTO `exterior_colors` VALUES ('391', '54', 'Mocha Metallic', '0x86745c');
INSERT INTO `exterior_colors` VALUES ('392', '54', 'Ocean Mist Metallic', '0x62666a');
INSERT INTO `exterior_colors` VALUES ('393', '54', 'Polished Metal Metallic ', '0x62666a');
INSERT INTO `exterior_colors` VALUES ('394', '54', 'Slate Green Metallic', '0x484e4e');
INSERT INTO `exterior_colors` VALUES ('395', '54', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('396', '55', 'Alabaster Silver Metallic', '0xcecece');
INSERT INTO `exterior_colors` VALUES ('397', '55', 'Baltic Blue Pearl', '0x040c1d');
INSERT INTO `exterior_colors` VALUES ('398', '55', '	Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('399', '55', '	Dark Cherry Pearl', '0x270209');
INSERT INTO `exterior_colors` VALUES ('400', '55', 'Mocha Metallic', '0x86745c');
INSERT INTO `exterior_colors` VALUES ('401', '55', 'Ocean Mist Metallic', '0x62666a');
INSERT INTO `exterior_colors` VALUES ('402', '55', 'Polished Metal Metallic', '0x484e4e');
INSERT INTO `exterior_colors` VALUES ('403', '55', 'Slate Green Metallic', '0x6d7573');
INSERT INTO `exterior_colors` VALUES ('404', '55', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('405', '56', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('406', '56', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('407', '56', 'Crystal Black Pearl ', '0x000000		');
INSERT INTO `exterior_colors` VALUES ('408', '56', ' Dark Cherry Pearl', '0x270209');
INSERT INTO `exterior_colors` VALUES ('409', '56', 'Mocha Metallic', '0x524125 ');
INSERT INTO `exterior_colors` VALUES ('410', '56', 'Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('411', '56', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('412', '57', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('413', '57', 'Bali Blue Pearl', '0x 001342');
INSERT INTO `exterior_colors` VALUES ('414', '57', ' Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('415', '57', 'Dark Cherry Pearl', '0x270209');
INSERT INTO `exterior_colors` VALUES ('416', '57', ' Mocha Metallic', '0x524125');
INSERT INTO `exterior_colors` VALUES ('417', '57', 'Polished Metal Metallic', '0x676768 ');
INSERT INTO `exterior_colors` VALUES ('418', '57', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('419', '58', 'Alabaster Silver Metallic', '0xe6e6e6 ');
INSERT INTO `exterior_colors` VALUES ('420', '58', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('421', '58', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('422', '58', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('423', '58', 'Mocha Metallic', '0x524125 ');
INSERT INTO `exterior_colors` VALUES ('424', '58', 'Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('425', '58', 'Taffeta White', '0xfcfcfc ');
INSERT INTO `exterior_colors` VALUES ('426', '59', 'Alabaster Silver Metallic ', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('427', '59', 'Bali Blue Pearl', '0x001342 ');
INSERT INTO `exterior_colors` VALUES ('428', '59', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('429', '59', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('430', '59', 'Mocha Metallic', '0x 524125');
INSERT INTO `exterior_colors` VALUES ('431', '59', 'Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('432', '59', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('433', '61', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('434', '61', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('435', '61', '	Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('436', '61', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('439', '61', 'Mocha Metallic', '0x524125');
INSERT INTO `exterior_colors` VALUES ('440', '61', 'Polished Metal Metallic', '0x 676768');
INSERT INTO `exterior_colors` VALUES ('441', '61', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('442', '62', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('443', '62', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('444', '62', 'Crystal Black Pearl', '0x000000 ');
INSERT INTO `exterior_colors` VALUES ('445', '62', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('446', '62', 'Mocha Metallic', '0x524125 ');
INSERT INTO `exterior_colors` VALUES ('447', '62', '	Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('448', '62', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('449', '63', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('450', '63', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('452', '63', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('453', '63', 'Dark Cherry Pearl', '0x270209');
INSERT INTO `exterior_colors` VALUES ('454', '63', 'Mocha Metallic', '0x524125');
INSERT INTO `exterior_colors` VALUES ('455', '63', 'Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('456', '63', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('457', '64', 'Alabaster Silver Metallic', '0x8f949c');
INSERT INTO `exterior_colors` VALUES ('459', '64', 'Bali Blue Pearl', '0x000b21');
INSERT INTO `exterior_colors` VALUES ('460', '64', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('461', '64', 'Dark Cherry', '0x34000a');
INSERT INTO `exterior_colors` VALUES ('462', '64', 'Mocha Metallic', '0x897655 ');
INSERT INTO `exterior_colors` VALUES ('463', '64', 'Polished Metal Metallic', '0x575f74 ');
INSERT INTO `exterior_colors` VALUES ('464', '64', 'White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('465', '65', 'Alabaster Silver Metallic', '0x8f949c');
INSERT INTO `exterior_colors` VALUES ('466', '65', 'Bali Blue Pearl', '0x000b21');
INSERT INTO `exterior_colors` VALUES ('472', '65', 'Mocha Metallic', '0x897655');
INSERT INTO `exterior_colors` VALUES ('468', '65', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('469', '65', 'Dark Cherry', '0x34000a');
INSERT INTO `exterior_colors` VALUES ('473', '65', 'Polished Metal Metallic', '0x575f74');
INSERT INTO `exterior_colors` VALUES ('474', '65', 'White', '0xd7d7d7');
INSERT INTO `exterior_colors` VALUES ('475', '66', 'Alabaster Silver Metallic', '0x8f949c');
INSERT INTO `exterior_colors` VALUES ('476', '66', 'Bali Blue Pearl', '0x000b21 ');
INSERT INTO `exterior_colors` VALUES ('477', '66', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('478', '66', '	Dark Cherry', '0x34000a ');
INSERT INTO `exterior_colors` VALUES ('479', '66', 'Mocha Metallic', '0x897655');
INSERT INTO `exterior_colors` VALUES ('480', '66', '	Polished Metal Metallic', '0x575f74');
INSERT INTO `exterior_colors` VALUES ('481', '66', 'White', '0xd7d7d7');
INSERT INTO `exterior_colors` VALUES ('482', '67', 'Alabaster Silver Metallic', '0x8f949c');
INSERT INTO `exterior_colors` VALUES ('483', '67', 'Bali Blue Pearl', '0x000b21');
INSERT INTO `exterior_colors` VALUES ('484', '67', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('485', '67', 'Dark Cherry', '0x34000a');
INSERT INTO `exterior_colors` VALUES ('486', '67', 'Mocha Metallic', '0x897655');
INSERT INTO `exterior_colors` VALUES ('487', '67', 'Polished Metal Metallic', '0x575f74');
INSERT INTO `exterior_colors` VALUES ('488', '67', 'White', '0xd7d7d7');
INSERT INTO `exterior_colors` VALUES ('489', '60', 'Alabaster Silver Metallic', '0xe6e6e6');
INSERT INTO `exterior_colors` VALUES ('490', '60', 'Bali Blue Pearl', '0x001342');
INSERT INTO `exterior_colors` VALUES ('491', '60', 'Crystal Black Pearl', '0x000000');
INSERT INTO `exterior_colors` VALUES ('492', '60', 'Dark Cherry Pearl', '0x270209 ');
INSERT INTO `exterior_colors` VALUES ('493', '60', 'Mocha Metallic', '0x524125');
INSERT INTO `exterior_colors` VALUES ('494', '60', 'Polished Metal Metallic', '0x676768');
INSERT INTO `exterior_colors` VALUES ('495', '60', 'Taffeta White', '0xfcfcfc');
INSERT INTO `exterior_colors` VALUES ('496', '27', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('497', '28', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('498', '30', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('499', '31', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('500', '32', 'Taffeta White', '0xffffff');
INSERT INTO `exterior_colors` VALUES ('501', '33', 'Taffeta White', '0xffffff');
INSERT INTO `install` VALUES ('1', '3', '0', '2011-04-15 17:30:18');
INSERT INTO `install` VALUES ('2', '11', '0', '2011-04-19 12:18:24');
INSERT INTO `install` VALUES ('3', '4', '0', '2011-04-19 17:47:23');
INSERT INTO `installation_parts` VALUES ('1', '3', '5', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('2', '3', '1', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('3', '3', '2', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('4', '3', '3', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('5', '3', '4', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('6', '3', '10', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('7', '3', '14', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('8', '3', '6', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('9', '3', '21', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('10', '3', '25', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `installation_parts` VALUES ('11', '3', '27', '0', '0', '0', '2011-04-19 16:46:59');
INSERT INTO `interior_colors` VALUES ('1', '1', ' Black', '64404-pic-1.png');
INSERT INTO `interior_colors` VALUES ('2', '1', 'Ivorysss', '42798-pic-2.png');
INSERT INTO `interior_colors` VALUES ('4', '9', 'Black', '111292326351-black.png');
INSERT INTO `interior_colors` VALUES ('5', '9', 'Ivory', '101292326448-Ivory.png');
INSERT INTO `interior_colors` VALUES ('6', '10', 'Black', '571292399148-black.png');
INSERT INTO `interior_colors` VALUES ('7', '10', 'Ivory', '831292399176-Ivory.png');
INSERT INTO `interior_colors` VALUES ('8', '11', 'Black', '371292399236-black.png');
INSERT INTO `interior_colors` VALUES ('9', '11', 'Ivory', '881292399261-Ivory.png');
INSERT INTO `interior_colors` VALUES ('10', '12', 'Black', '421292399343-black.png');
INSERT INTO `interior_colors` VALUES ('11', '12', 'Ivory', '81292399363-Ivory.png');
INSERT INTO `interior_colors` VALUES ('12', '13', 'Black', '791292399438-Black.png');
INSERT INTO `interior_colors` VALUES ('13', '13', 'Ivory', '151292399482-Ivory.png');
INSERT INTO `interior_colors` VALUES ('14', '15', 'Black', '891292399709-Black.png');
INSERT INTO `interior_colors` VALUES ('15', '15', 'Ivory', '871292399729-Ivory.png');
INSERT INTO `interior_colors` VALUES ('16', '68', 'Black', '701292399791-Black.png');
INSERT INTO `interior_colors` VALUES ('17', '68', 'Ivory', '941292399808-Ivory.png');
INSERT INTO `interior_colors` VALUES ('46', '16', 'Black', '531292408774-Black.png');
INSERT INTO `interior_colors` VALUES ('47', '16', 'Black / Wood Trim', '901292408793-Black _ Wood Trim.png');
INSERT INTO `interior_colors` VALUES ('48', '16', 'Black / Wood Trim with nav', '271292408816-Black _ Wood Trim with nav.png');
INSERT INTO `interior_colors` VALUES ('49', '16', 'Black with Nav', '611292408836-Black with Nav.png');
INSERT INTO `interior_colors` VALUES ('50', '16', 'Gray', '381292408860-Gray.png');
INSERT INTO `interior_colors` VALUES ('51', '16', 'Gray / Wood Trim with nav', '921292408884-Gray _ Wood Trim with nav.png');
INSERT INTO `interior_colors` VALUES ('52', '16', 'Gray / Wood Trim', '711292408911-Gray _ Wood Trim.png');
INSERT INTO `interior_colors` VALUES ('53', '16', '	Gray with nav', '911292408935-Gray with nav.png');
INSERT INTO `interior_colors` VALUES ('58', '17', 'Black', '481292409215-base_black.png');
INSERT INTO `interior_colors` VALUES ('59', '17', 'Gray', '331292409250-base_gray2007121823957.png');
INSERT INTO `interior_colors` VALUES ('60', '17', 'Ivory', '421292409293-base_tan20071218231327.png');
INSERT INTO `interior_colors` VALUES ('61', '17', 'Black with Nav', '641292409352-nav_black20071218231221.png');
INSERT INTO `interior_colors` VALUES ('54', '16', 'Ivory', '401292408966-Ivory.png');
INSERT INTO `interior_colors` VALUES ('55', '16', '	Ivory / Wood Trim', '561292408986-Ivory _ Wood Trim.png');
INSERT INTO `interior_colors` VALUES ('56', '16', 'Ivory / Wood Trim with nav', '811292409017-Ivory _ Wood Trim with nav.png');
INSERT INTO `interior_colors` VALUES ('57', '16', '	Ivory with nav', '921292409039-Ivory with nav.png');
INSERT INTO `interior_colors` VALUES ('62', '17', 'Gray with nav', '151292409413-nav_gray20071218231020.png');
INSERT INTO `interior_colors` VALUES ('63', '17', 'Ivory with nav', '781292409483-nav_tan20071218231349.png');
INSERT INTO `interior_colors` VALUES ('64', '17', 'Black / Wood Trim with nav', '151292409533-nav_wood_black2007121823134.png');
INSERT INTO `interior_colors` VALUES ('65', '17', 'Gray / Wood Trim with nav', '731292409595-nav_wood_gray20071218231126.png');
INSERT INTO `interior_colors` VALUES ('66', '17', 'Ivory / Wood Trim with nav', '581292409942-nav_wood_tan20071218231447.png');
INSERT INTO `interior_colors` VALUES ('67', '17', 'Black / Wood Trim', '581292409976-wood_black.png');
INSERT INTO `interior_colors` VALUES ('68', '17', 'Gray / Wood Trim', '21292410017-wood_gray20071218231057.png');
INSERT INTO `interior_colors` VALUES ('69', '17', 'Ivory / Wood Trim', '931292410056-wood_tan20071218231422.png');
INSERT INTO `interior_colors` VALUES ('70', '18', 'Black', '641292410121-base_black.png');
INSERT INTO `interior_colors` VALUES ('71', '18', 'Gray', '181292410156-base_gray2007121823957.png');
INSERT INTO `interior_colors` VALUES ('72', '18', 'Ivory', '511292410327-base_tan20071218231327.png');
INSERT INTO `interior_colors` VALUES ('73', '18', 'Black with Nav', '951292410356-nav_black20071218231221.png');
INSERT INTO `interior_colors` VALUES ('74', '18', 'Gray with nav', '341292410390-nav_gray20071218231020.png');
INSERT INTO `interior_colors` VALUES ('75', '18', 'Ivory with nav', '521292410462-nav_tan20071218231349.png');
INSERT INTO `interior_colors` VALUES ('76', '18', '	Black / Wood Trim with nav', '131292411766-nav_wood_black2007121823134.png');
INSERT INTO `interior_colors` VALUES ('77', '18', 'Gray / Wood Trim with nav', '311292411816-nav_wood_gray20071218231126.png');
INSERT INTO `interior_colors` VALUES ('78', '18', 'Ivory / Wood Trim with nav', '531292411871-nav_wood_tan20071218231447.png');
INSERT INTO `interior_colors` VALUES ('79', '18', 'Black / Wood Trim', '181292411913-wood_black.png');
INSERT INTO `interior_colors` VALUES ('80', '18', 'Gray / Wood Trim', '531292412062-wood_gray20071218231057.png');
INSERT INTO `interior_colors` VALUES ('81', '18', '	Ivory / Wood Trim', '991292412080-wood_tan20071218231422.png');
INSERT INTO `interior_colors` VALUES ('82', '19', 'Black', '721292412578-base_black.png');
INSERT INTO `interior_colors` VALUES ('83', '19', 'Gray', '471292412638-base_gray2007121823957.png');
INSERT INTO `interior_colors` VALUES ('84', '19', 'Ivory', '241292412672-base_tan20071218231327.png');
INSERT INTO `interior_colors` VALUES ('85', '19', 'Black with Nav', '681292412704-nav_black20071218231221.png');
INSERT INTO `interior_colors` VALUES ('86', '19', 'Gray with nav', '421292412753-nav_gray20071218231020.png');
INSERT INTO `interior_colors` VALUES ('87', '19', 'Ivory with nav', '601292412795-nav_tan20071218231349.png');
INSERT INTO `interior_colors` VALUES ('88', '19', 'Black / Wood Trim with nav', '171292412823-nav_wood_black2007121823134.png');
INSERT INTO `interior_colors` VALUES ('89', '19', 'Gray / Wood Trim with nav', '501292412894-nav_wood_gray20071218231126.png');
INSERT INTO `interior_colors` VALUES ('90', '19', 'Ivory / Wood Trim with nav', '751292412955-nav_wood_tan20071218231447.png');
INSERT INTO `interior_colors` VALUES ('91', '19', 'Black / Wood Trim', '941292412996-wood_black.png');
INSERT INTO `interior_colors` VALUES ('92', '19', 'Gray / Wood Trim', '481292413044-wood_gray20071218231057.png');
INSERT INTO `interior_colors` VALUES ('93', '19', 'Ivory / Wood Trim', '61292413089-wood_tan20071218231422.png');
INSERT INTO `interior_colors` VALUES ('94', '20', 'Black', '251292413188-base_black20071218231149.png');
INSERT INTO `interior_colors` VALUES ('95', '20', 'Gray', '121292413208-base_gray2007121823957.png');
INSERT INTO `interior_colors` VALUES ('96', '20', 'Ivory', '851292413230-base_tan20071218231327.png');
INSERT INTO `interior_colors` VALUES ('97', '20', 'Black with Nav', '951292413264-nav_black20071218231221.png');
INSERT INTO `interior_colors` VALUES ('98', '20', 'Gray with nav', '641292413303-nav_gray20071218231020.png');
INSERT INTO `interior_colors` VALUES ('99', '20', 'Ivory with nav', '591292413436-nav_tan20071218231349.png');
INSERT INTO `interior_colors` VALUES ('100', '20', '	Black / Wood Trim with nav', '641292413458-nav_wood_black2007121823134.png');
INSERT INTO `interior_colors` VALUES ('101', '20', 'Gray / Wood Trim with nav', '951292413659-nav_wood_gray20071218231126.png');
INSERT INTO `interior_colors` VALUES ('102', '20', 'Ivory / Wood Trim with nav', '951292413694-nav_wood_tan20071218231447.png');
INSERT INTO `interior_colors` VALUES ('103', '20', 'Black / Wood Trim', '391292413757-wood_black20071218231244.png');
INSERT INTO `interior_colors` VALUES ('104', '20', 'Gray / Wood Trim 	', '321292413796-wood_gray20071218231057.png');
INSERT INTO `interior_colors` VALUES ('105', '20', 'Ivory / Wood Trim', '591292413859-wood_tan20071218231422.png');
INSERT INTO `interior_colors` VALUES ('106', '21', 'Black', '351292413939-base_black20071218231149.png');
INSERT INTO `interior_colors` VALUES ('107', '21', 'Gray', '441292413955-base_gray2007121823957.png');
INSERT INTO `interior_colors` VALUES ('108', '21', 'Ivory', '141292413993-base_tan20071218231327.png');
INSERT INTO `interior_colors` VALUES ('109', '21', 'Black with Nav', '821292415818-nav_black20071218231221.png');
INSERT INTO `interior_colors` VALUES ('110', '21', 'Gray with nav', '431292415871-nav_gray20071218231020.png');
INSERT INTO `interior_colors` VALUES ('111', '21', 'Ivory with nav', '441292415924-nav_tan20071218231349.png');
INSERT INTO `interior_colors` VALUES ('112', '21', 'Black / Wood Trim with nav', '291292416034-nav_wood_black2007121823134.png');
INSERT INTO `interior_colors` VALUES ('113', '21', 'Gray / Wood Trim with nav', '91292416054-nav_wood_gray20071218231126.png');
INSERT INTO `interior_colors` VALUES ('114', '21', 'Ivory / Wood Trim with nav', '331292416099-nav_wood_tan20071218231447.png');
INSERT INTO `interior_colors` VALUES ('115', '21', 'Black / Wood Trim', '871292416137-wood_black20071218231244.png');
INSERT INTO `interior_colors` VALUES ('116', '21', 'Gray / Wood Trim', '81292416182-wood_gray20071218231057.png');
INSERT INTO `interior_colors` VALUES ('117', '21', 'Ivory / Wood Trim', '351292416224-wood_tan20071218231422.png');
INSERT INTO `interior_colors` VALUES ('118', '22', 'Si Black ', '421292416332-Si Black200992595054.png');
INSERT INTO `interior_colors` VALUES ('119', '22', 'Si Black with Nav', '861292416357-Si Black with Nav20099259514.png');
INSERT INTO `interior_colors` VALUES ('121', '23', 'Black with Nav', '941292416549-Black with Nav2008129113045.png');
INSERT INTO `interior_colors` VALUES ('122', '23', 'Gray', '531292416648-Gray 2008129113012.png');
INSERT INTO `interior_colors` VALUES ('123', '23', 'Gray with Nav', '181292416825-Gray with Nav2008129113023.png');
INSERT INTO `interior_colors` VALUES ('124', '24', 'Black', '281292416900-Black2008129113034.png');
INSERT INTO `interior_colors` VALUES ('125', '24', 'Black with Nav', '481292416918-Black with Nav2008129113045.png');
INSERT INTO `interior_colors` VALUES ('126', '24', 'Gray', '151292416950-Gray 2008129113012.png');
INSERT INTO `interior_colors` VALUES ('127', '24', 'Gray with Nav', '391292416964-Gray with Nav2008129113023.png');
INSERT INTO `interior_colors` VALUES ('129', '25', 'Black', '941292417135-Black2008129113034.png');
INSERT INTO `interior_colors` VALUES ('130', '25', 'Black with Nav', '01292417206-Black with Nav2008129113045.png');
INSERT INTO `interior_colors` VALUES ('131', '25', 'Gray', '861292417235-Gray 2008129113012.png');
INSERT INTO `interior_colors` VALUES ('132', '25', 'Gray with Nav', '471292417252-Gray with Nav2008129113023.png');
INSERT INTO `interior_colors` VALUES ('133', '26', 'Black with Nav', '811292417315-Black with Nav2008129113045.png');
INSERT INTO `interior_colors` VALUES ('134', '26', 'Gray', '621292417420-Gray 2008129113012.png');
INSERT INTO `interior_colors` VALUES ('135', '26', 'Gray with Nav', '621292417434-Gray with Nav2008129113023.png');
INSERT INTO `interior_colors` VALUES ('136', '27', 'Gray', '211292419367-Gray.png');
INSERT INTO `interior_colors` VALUES ('137', '27', 'Gray with Nav', '281292419386-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('138', '28', 'Gray', '541292419469-Gray.png');
INSERT INTO `interior_colors` VALUES ('139', '28', 'Gray with Nav', '371292419491-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('140', '29', 'Beige', '311292475895-Beige.png');
INSERT INTO `interior_colors` VALUES ('141', '29', 'Beige with Nav', '951292475919-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('142', '29', 'Gray', '951292475948-Gray.png');
INSERT INTO `interior_colors` VALUES ('143', '29', 'Gray with Nav', '991292475973-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('144', '30', 'Beige', '121292476038-Beige.png');
INSERT INTO `interior_colors` VALUES ('145', '30', 'Beige with Nav', '391292476054-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('146', '30', 'Gray', '801292476074-Gray.png');
INSERT INTO `interior_colors` VALUES ('147', '30', 'Gray with Nav', '921292476086-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('148', '31', 'Beige', '181292476156-Beige.png');
INSERT INTO `interior_colors` VALUES ('149', '31', 'Beige with Nav', '401292476169-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('150', '31', 'Gray', '751292476185-Gray.png');
INSERT INTO `interior_colors` VALUES ('151', '31', 'Gray with Nav', '871292476197-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('152', '32', 'Beige', '911292476244-Beige.png');
INSERT INTO `interior_colors` VALUES ('153', '32', 'Beige with Nav', '41292476256-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('154', '33', 'Beige', '211292476333-Beige.png');
INSERT INTO `interior_colors` VALUES ('155', '33', 'Beige with Nav', '731292476347-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('156', '33', 'Gray', '151292476363-Gray.png');
INSERT INTO `interior_colors` VALUES ('157', '33', 'Gray with Nav', '541292476375-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('158', '34', 'Black', '721292476421-Black.png');
INSERT INTO `interior_colors` VALUES ('159', '34', 'Black with Nav', '361292476439-Black_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('160', '35', 'Beige', '301292476523-Beige.png');
INSERT INTO `interior_colors` VALUES ('161', '35', 'Beige with Nav', '351292476537-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('162', '35', 'Gray', '131292476628-Gray.png');
INSERT INTO `interior_colors` VALUES ('163', '35', 'Gray with Nav', '961292476641-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('164', '35', 'Si Black', '561292476715-Si_Black.png');
INSERT INTO `interior_colors` VALUES ('165', '35', 'si Black with Nav', '611292476730-Si_Black_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('166', '36', 'Black', '331292476801-Black.png');
INSERT INTO `interior_colors` VALUES ('167', '36', 'Gray', '341292476824-Gray.png');
INSERT INTO `interior_colors` VALUES ('168', '36', 'Ivory', '571292476834-Ivory.png');
INSERT INTO `interior_colors` VALUES ('169', '37', 'Black', '111292477047-Black.png');
INSERT INTO `interior_colors` VALUES ('170', '37', 'Gray', '631292477067-Gray.png');
INSERT INTO `interior_colors` VALUES ('171', '37', 'Ivory', '521292477146-Ivory.png');
INSERT INTO `interior_colors` VALUES ('172', '38', 'Black', '71292477243-Black.png');
INSERT INTO `interior_colors` VALUES ('173', '38', 'Gray', '591292477257-Gray.png');
INSERT INTO `interior_colors` VALUES ('174', '38', 'Ivory', '691292477267-Ivory.png');
INSERT INTO `interior_colors` VALUES ('175', '39', 'Gray', '841292477348-Gray.png');
INSERT INTO `interior_colors` VALUES ('176', '39', 'Gray with Nav', '181292477372-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('177', '39', 'Titanium/Black', '941292477396-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('178', '39', 'Titanium/Black with Nav', '201292477415-TitaniumBlack_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('179', '40', 'Gray', '811292477472-Gray.png');
INSERT INTO `interior_colors` VALUES ('180', '40', 'Gray with Nav', '891292477485-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('181', '40', 'Titanium/Black', '701292477499-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('182', '40', 'Titanium/Black with Nav', '101292477523-TitaniumBlack_ with_Nav.png');
INSERT INTO `interior_colors` VALUES ('183', '41', 'Gray', '271292477589-Gray.png');
INSERT INTO `interior_colors` VALUES ('184', '41', 'Gray with Nav', '901292477605-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('185', '41', 'Titanium/Black 	', '171292477621-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('186', '41', 'Titanium/Black with Nav', '491292477644-TitaniumBlack _with_Nav.png');
INSERT INTO `interior_colors` VALUES ('187', '42', 'Gray', '381292477696-Gray.png');
INSERT INTO `interior_colors` VALUES ('188', '42', 'Gray with Nav', '601292477710-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('189', '42', 'Titanium/Black', '131292477734-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('190', '42', '	Titanium/Black with Nav', '931292477754-TitaniumBlack_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('191', '43', 'Gray', '621292477808-Gray.png');
INSERT INTO `interior_colors` VALUES ('192', '43', 'Gray with Nav', '321292477825-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('193', '43', '	Titanium/Black with Nav', '811292477848-TitaniumBlack_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('194', '43', 'Titanium/Black 	', '971292477862-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('195', '44', 'Gray', '611292477984-Gray.png');
INSERT INTO `interior_colors` VALUES ('196', '44', 'Gray with Nav', '461292478097-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('197', '44', 'Titanium/Black 	', '111292478122-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('198', '44', 'Titanium/Black with Nav', '461292478146-TitaniumBlack_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('199', '45', 'Red/Black', '161292478217-RedBlack.png');
INSERT INTO `interior_colors` VALUES ('200', '45', 'Red/Black with Nav', '31292478246-RedBlack_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('201', '45', 'Titanium/Black 	', '291292478268-TitaniumBlack.png');
INSERT INTO `interior_colors` VALUES ('202', '45', 'Titanium/Black with Nav', '931292478286-TitaniumBlac_ with_Nav.png');
INSERT INTO `interior_colors` VALUES ('203', '46', 'Gray', '991292478384-gray_dashboard.png');
INSERT INTO `interior_colors` VALUES ('204', '47', 'Black', '771292478423-black_dashboard.png');
INSERT INTO `interior_colors` VALUES ('205', '48', 'Black', '591292478484-Black.png');
INSERT INTO `interior_colors` VALUES ('207', '49', 'Blue', '901292478614-blue.png');
INSERT INTO `interior_colors` VALUES ('208', '49', 'Gray', '691292478738-Gray.png');
INSERT INTO `interior_colors` VALUES ('209', '50', 'Blue', '221292478785-Blue.png');
INSERT INTO `interior_colors` VALUES ('210', '50', 'Gray', '311292478820-Grey.png');
INSERT INTO `interior_colors` VALUES ('211', '51', 'Blue', '251292478867-blue.png');
INSERT INTO `interior_colors` VALUES ('212', '51', 'Gray', '941292478886-Gray.png');
INSERT INTO `interior_colors` VALUES ('213', '52', 'Gray', '461292478980-Gray.png');
INSERT INTO `interior_colors` VALUES ('214', '52', 'Gray with Nav', '191292479125-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('215', '52', 'Ivory', '221292479145-Ivory.png');
INSERT INTO `interior_colors` VALUES ('216', '52', 'Ivory with Nav', '251292479167-Ivory_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('217', '52', 'Olive', '671292479183-Olive.png');
INSERT INTO `interior_colors` VALUES ('218', '52', 'Olive with Nav', '121292479196-Olive_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('219', '53', 'Gray', '21292479244-Gray.png');
INSERT INTO `interior_colors` VALUES ('220', '53', 'Gray with Nav', '41292479256-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('221', '53', 'Ivory', '561292479275-Ivory.png');
INSERT INTO `interior_colors` VALUES ('222', '53', 'Ivory with Nav', '841292479287-Ivory _with_Nav.png');
INSERT INTO `interior_colors` VALUES ('223', '53', 'Olive', '921292479302-Olive.png');
INSERT INTO `interior_colors` VALUES ('224', '53', 'Olive with Nav', '661292479313-Olive_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('225', '54', 'Gray', '641292479418-Gray.png');
INSERT INTO `interior_colors` VALUES ('226', '54', 'Gray with Nav', '401292479436-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('227', '54', 'Ivory', '891292479455-Ivory.png');
INSERT INTO `interior_colors` VALUES ('228', '54', 'Ivory with Nav', '171292479466-Ivory_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('229', '54', 'Olive', '311292479482-Olive.png');
INSERT INTO `interior_colors` VALUES ('230', '54', 'Olive with Nav', '951292479491-Olive_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('231', '55', 'Black', '481292479540-Black.png');
INSERT INTO `interior_colors` VALUES ('232', '55', 'Black with Nav', '81292479620-Black_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('233', '55', 'Gray', '321292479635-Gray.png');
INSERT INTO `interior_colors` VALUES ('234', '55', 'Gray with Nav', '91292479649-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('235', '55', 'Ivory', '731292479676-Ivory.png');
INSERT INTO `interior_colors` VALUES ('236', '55', 'Ivory with Nav', '951292479687-Ivory_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('237', '55', 'Olive', '661292479701-Olive.png');
INSERT INTO `interior_colors` VALUES ('238', '55', 'Olive with Nav', '61292479712-Olive_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('239', '56', 'Beige', '131292480339-Beige.png');
INSERT INTO `interior_colors` VALUES ('240', '56', 'Black', '301292480363-Black.png');
INSERT INTO `interior_colors` VALUES ('241', '56', 'Blue', '911292480381-Blue.png');
INSERT INTO `interior_colors` VALUES ('242', '56', 'Gray', '461292480409-Gray.png');
INSERT INTO `interior_colors` VALUES ('243', '57', 'Beige', '71292480514-Beige.png');
INSERT INTO `interior_colors` VALUES ('244', '57', 'Black', '671292480552-Black.png');
INSERT INTO `interior_colors` VALUES ('245', '57', 'blue', '311292480580-Blue.png');
INSERT INTO `interior_colors` VALUES ('246', '57', 'Gray', '741292480607-Gray.png');
INSERT INTO `interior_colors` VALUES ('247', '58', 'Beige', '881292480701-Beige.png');
INSERT INTO `interior_colors` VALUES ('248', '58', 'Black', '991292480719-Black.png');
INSERT INTO `interior_colors` VALUES ('249', '58', 'Blue', '411292480735-Blue.png');
INSERT INTO `interior_colors` VALUES ('250', '58', 'Gray', '861292480761-Gray.png');
INSERT INTO `interior_colors` VALUES ('251', '57', 'Beige', '71292480514-Beige.png');
INSERT INTO `interior_colors` VALUES ('252', '59', 'Black', '421292480851-Black_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('253', '59', 'Blue', '411292481163-Blue_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('254', '59', 'Gray', '621292481193-Gray.png');
INSERT INTO `interior_colors` VALUES ('255', '59', 'Beige', '911292481315-Gray_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('256', '60', 'Beige', '351292482414-Beige.png');
INSERT INTO `interior_colors` VALUES ('257', '60', 'Black', '381292482444-Black.png');
INSERT INTO `interior_colors` VALUES ('258', '60', 'Blue', '611292482458-Blue.png');
INSERT INTO `interior_colors` VALUES ('259', '60', 'Gray', '951292482593-Gray.png');
INSERT INTO `interior_colors` VALUES ('260', '61', 'Beige', '611292482652-Beige.png');
INSERT INTO `interior_colors` VALUES ('261', '61', 'Black', '01292482835-Black.png');
INSERT INTO `interior_colors` VALUES ('262', '61', 'Blue', '251292482850-Blue.png');
INSERT INTO `interior_colors` VALUES ('263', '61', 'Gray', '671292482863-Gray.png');
INSERT INTO `interior_colors` VALUES ('264', '62', 'Beige', '361292482934-Beige.png');
INSERT INTO `interior_colors` VALUES ('265', '62', 'Black', '631292482968-Black.png');
INSERT INTO `interior_colors` VALUES ('266', '62', 'Blue', '811292482983-Blue.png');
INSERT INTO `interior_colors` VALUES ('267', '62', 'Gray', '411292482998-Gray.png');
INSERT INTO `interior_colors` VALUES ('268', '63', 'Beige', '951292483052-Beige_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('269', '63', 'Black', '141292483087-Black_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('270', '63', 'Blue', '381292483218-Blue_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('271', '63', 'Gray', '791292483239-Gray_nav_dashboard.png');
INSERT INTO `interior_colors` VALUES ('272', '64', 'Beige', '291292483344-Beige.png');
INSERT INTO `interior_colors` VALUES ('273', '64', 'Black', '191292483362-Black.png');
INSERT INTO `interior_colors` VALUES ('274', '64', 'Gray', '701292483477-Gray.png');
INSERT INTO `interior_colors` VALUES ('275', '65', 'Beige', '631292483574-Beige.png');
INSERT INTO `interior_colors` VALUES ('276', '65', 'Black', '131292483594-Black.png');
INSERT INTO `interior_colors` VALUES ('277', '65', 'Gray', '911292483615-Gray.png');
INSERT INTO `interior_colors` VALUES ('278', '66', 'Beige', '131292483672-Beige_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('279', '66', 'Black', '591292483753-Black_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('280', '66', 'Gray', '691292483919-Gray_with_Nav.png');
INSERT INTO `interior_colors` VALUES ('281', '67', 'Beige', '61292483958-Beige.png');
INSERT INTO `interior_colors` VALUES ('282', '67', 'Black', '501292483975-Black.png');
INSERT INTO `interior_colors` VALUES ('284', '67', 'Gray', '411292484099-Gray.png');
INSERT INTO `interior_colors` VALUES ('285', '67', 'Gray', '411292484099-Gray.png');
INSERT INTO `invoices` VALUES ('1', '4DAD31F25B8D91303196146', '1');
INSERT INTO `invoices` VALUES ('2', '4DAD3FE4E11151303199716', '2');
INSERT INTO `invoices` VALUES ('3', '4DAD61EA319771303208426', '3');
INSERT INTO `invoices` VALUES ('4', '4DAD700A319771303212042', '4');
INSERT INTO `invoices` VALUES ('5', '4DAD79231E8491303214371', '5');
INSERT INTO `invoices` VALUES ('6', '4DAE6A57D97031303276119', '6');
INSERT INTO `invoices` VALUES ('7', '4DAE795B40D9B1303279963', '7');
INSERT INTO `makes` VALUES ('1', 'Honda', '', '53763-honda-top.png');
INSERT INTO `models` VALUES ('1', '1', '1', 'Accord Coupe', '68342-car-top.png');
INSERT INTO `models` VALUES ('2', '1', '1', 'Accord Sedan', '37219-Accord-Sedan.png');
INSERT INTO `models` VALUES ('3', '1', '1', 'Civic Coupe', '92536-Civic-Coupe.png');
INSERT INTO `models` VALUES ('4', '1', '1', 'Civic Sedan', '9209-Civic-Sedan.png');
INSERT INTO `models` VALUES ('5', '1', '1', 'CR-Vds', '31053-CR-V.png');
INSERT INTO `models` VALUES ('6', '1', '1', 'Element', '23884-Element.png');
INSERT INTO `models` VALUES ('7', '1', '1', 'Fit', '85662-Fit.png');
INSERT INTO `models` VALUES ('8', '1', '1', 'Odyssey', '53647-Odyssey.png');
INSERT INTO `models` VALUES ('9', '1', '1', 'Pilot', '30176-Pilot.png');
INSERT INTO `models` VALUES ('11', '1', '1', 'Accord Crosstour', '68312-hh.png');
INSERT INTO `models` VALUES ('12', '1', '1', 'Insight', '98013-llls.png');
INSERT INTO `models` VALUES ('23', '1', '3', 'Accord Coupe', '541292234790-Accord Coupe.png');
INSERT INTO `models` VALUES ('24', '1', '3', 'Accord Crosstour', '11292234882-Accord Crosstour.png');
INSERT INTO `models` VALUES ('25', '1', '3', 'Accord Sedan', '521292234909-Accord Sedan.png');
INSERT INTO `models` VALUES ('26', '1', '3', 'Civic Coupe', '141292234970-Civic Coupe.png');
INSERT INTO `models` VALUES ('27', '1', '3', 'Civic Sedan', '581292234995-Civic Sedan.png');
INSERT INTO `models` VALUES ('28', '1', '1', 'CR-V', '431292235018-CR-V.png');
INSERT INTO `models` VALUES ('29', '1', '3', 'CR-V', '981292235045-CR-V.png');
INSERT INTO `models` VALUES ('30', '1', '3', 'Element', '611292235067-Element.png');
INSERT INTO `models` VALUES ('31', '1', '3', 'Fit', '241292235089-Fit.png');
INSERT INTO `models` VALUES ('32', '1', '3', 'Insight', '561292235109-Insight.png');
INSERT INTO `models` VALUES ('33', '1', '3', 'Odyssey', '221292235131-Odyssey.png');
INSERT INTO `models` VALUES ('34', '1', '3', 'Pilot', '961292235160-Pilot.png');
INSERT INTO `models` VALUES ('35', '1', '1', 'Ridgeline', '411292235181-Ridgeline.png');
INSERT INTO `models` VALUES ('36', '1', '3', 'Ridgeline', '441292237810-Ridgeline.png');
INSERT INTO `news` VALUES ('1', 'Test News', 'Descripotion of news will come here', 'sdasd', '1');
INSERT INTO `news` VALUES ('2', 'New News will come here', 'asdfsdaf', '10/12/2011', '1');
INSERT INTO `news` VALUES ('3', 'asda da sd a sda sd ', 'adsfasdf', '', '0');
INSERT INTO `news` VALUES ('4', 'Dummy Text will placed here ......', 'asdasdasdad as', '', '0');
INSERT INTO `orders` VALUES ('1', '4', '5224', '0', '0', '2011-04-19 17:47:23');
INSERT INTO `part_assets` VALUES ('1', '1', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('2', '2', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('3', '3', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('4', '4', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('5', '5', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('6', '29', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('7', '30', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('8', '31', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('9', '32', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('10', '33', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('11', '57', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('12', '58', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('13', '59', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('14', '60', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('15', '61', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('16', '85', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('17', '86', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('18', '87', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('19', '88', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('20', '89', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('21', '113', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('22', '114', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('23', '115', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('24', '116', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('25', '117', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('26', '141', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('27', '142', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('28', '143', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('29', '144', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('30', '145', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('31', '169', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('32', '170', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('33', '171', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('34', '172', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('35', '173', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('36', '197', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('37', '198', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('38', '199', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('39', '200', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('40', '201', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('41', '225', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('42', '226', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('43', '227', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('44', '228', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('45', '229', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('46', '253', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('47', '254', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('48', '255', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('49', '256', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('50', '257', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('51', '281', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('52', '282', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('53', '283', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('54', '284', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('55', '285', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('56', '309', '431301835882-big.png', '_blank', '_blank', '_blank', '701301835927-small.png', '_blank', '_blank');
INSERT INTO `part_assets` VALUES ('57', '310', '_blank', '461301837212-big.png', '_blank', '_blank', '_blank', '781301837241-small.png', '_blank');
INSERT INTO `part_assets` VALUES ('58', '311', '601301841947-big-f.png', '931301841984-big-r.png', '_blank', '_blank', '311301841865-small-f.png', '71301841879-small-r.png', '_blank');
INSERT INTO `part_assets` VALUES ('59', '312', '641301904324-big_f.png', '631301904339-big_r.png', '_blank', '_blank', '61301904290-small_f.png', '391301904299-small_r.png', '_blank');
INSERT INTO `part_assets` VALUES ('60', '313', '161301913674-big_f.png', '861301913781-big_r.png', '_blank', '_blank', '491301913615-small_f.png', '861301913625-small_r.png', '_blank');
INSERT INTO `part_categories` VALUES ('1', '1', 'BodyKits', 'part description will come here asdasd', '0', 'p');
INSERT INTO `part_categories` VALUES ('3', '2', 'all', '', '0', 'w');
INSERT INTO `part_categories` VALUES ('4', '2', '15', '', '0', 'w');
INSERT INTO `part_categories` VALUES ('5', '2', '16', '', '0', 'w');
INSERT INTO `part_categories` VALUES ('6', '2', '17', '', '0', 'w');
INSERT INTO `part_categories` VALUES ('7', '2', 'Wheel Accessories', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('18', '1', 'Body Side Moldings', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('19', '1', 'Factory Exterior', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('20', '1', 'Front Bumpers', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('21', '1', 'Rear Bumpers', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('22', '1', 'Side Skirts', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('23', '1', 'Spoilers', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('24', '1', 'Window Tint', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('25', '3', 'Dash Kits', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('26', '3', 'Factory Interior', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('27', '3', 'Navigation', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('28', '3', 'Uphoistery', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('29', '3', 'Video', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('30', '4', 'Bluetooth', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('31', '4', 'Covers', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('32', '4', 'Dealer Packages', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('33', '4', 'Electronics', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('34', '4', 'Factory Performance', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('35', '3', 'Audio', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('36', '3', 'Floor Mats', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('37', '1', 'Grille Guards', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('38', '1', 'Grilles', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('39', '1', 'Hitch and Accessories', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('40', '1', 'Roof Racks and Cargo Carriers', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('41', '1', 'Step Bars', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('42', '1', 'Tonneau Covers and Bed Caps', '', '0', 'p');
INSERT INTO `part_categories` VALUES ('43', '2', '18', '', '0', 'w');
INSERT INTO `part_categories` VALUES ('44', '2', '19', '', '0', 'w');
INSERT INTO `part_dimentions` VALUES ('1', '1', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('2', '2', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('3', '3', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('4', '4', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('5', '5', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('6', '29', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('7', '30', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('8', '31', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('9', '32', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('10', '33', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('11', '57', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('12', '58', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('13', '59', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('14', '60', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('15', '61', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('16', '85', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('17', '86', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('18', '87', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('19', '88', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('20', '89', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('21', '113', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('22', '114', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('23', '115', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('24', '116', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('25', '117', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('26', '141', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('27', '142', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('28', '143', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('29', '144', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('30', '145', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('31', '169', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('32', '170', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('33', '171', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('34', '172', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('35', '173', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('36', '197', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('37', '198', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('38', '199', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('39', '200', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('40', '201', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('41', '225', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('42', '226', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('43', '227', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('44', '228', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('45', '229', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('46', '253', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('47', '254', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('48', '255', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('49', '256', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('50', '257', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('51', '281', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('52', '282', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('53', '283', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('54', '284', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('55', '285', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('56', '309', '[{\"dimentions\":{\"tx\":308,\"ty\":389,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"tx\":32,\"ty\":198,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_dimentions` VALUES ('57', '310', '_blank', '[{\"dimentions\":{\"a\":0.9957805871963501,\"b\":0,\"c\":0,\"tx\":525,\"ty\":368,\"d\":1}}]', '_blank', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":119,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('58', '311', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":607,\"ty\":393,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":360,\"ty\":405,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":156,\"ty\":199,\"d\":1}}]', '[{\"dimentions\":{\"a\":0.9992414116859436,\"b\":-0.03894728422164917,\"c\":0.03894728422164917,\"tx\":52,\"ty\":335,\"d\":0.9992414116859436}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('59', '312', '[{\"dimentions\":{\"tx\":418,\"ty\":275,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":382,\"ty\":289,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":76,\"ty\":153,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":57,\"ty\":287,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `part_dimentions` VALUES ('60', '313', '[{\"dimentions\":{\"tx\":615,\"ty\":368,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":366,\"ty\":378,\"a\":0.9976484775543213,\"b\":-0.06853856146335602,\"c\":-0.05616749823093414,\"d\":1.0062158107757568}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":164,\"ty\":191,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank');
INSERT INTO `part_manufacturer` VALUES ('1', 'Honda', 'asasd', '1');
INSERT INTO `part_manufacturer` VALUES ('2', 'Toyota', 'Test Description will work here....', '1');
INSERT INTO `part_manufacturer` VALUES ('3', 'Testings', 'asdasd', '1');
INSERT INTO `part_types` VALUES ('1', 'Exterior', '', '0');
INSERT INTO `part_types` VALUES ('2', 'Wheels', '', '0');
INSERT INTO `part_types` VALUES ('3', 'Interior', '', '0');
INSERT INTO `part_types` VALUES ('4', 'Others', '', '0');
INSERT INTO `parts` VALUES ('1', '21', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('2', '21', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('3', '21', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('4', '21', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('5', '21', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('6', '21', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('7', '21', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('8', '21', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('9', '21', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('10', '21', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('11', '21', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('12', '21', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('13', '21', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('14', '21', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('15', '21', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('16', '21', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('17', '21', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('18', '21', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('19', '21', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('20', '21', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('21', '21', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('22', '21', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('23', '21', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('24', '21', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('25', '21', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('26', '21', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('27', '21', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('28', '21', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('29', '22', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('30', '22', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('31', '22', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('32', '22', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('33', '22', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('34', '22', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('35', '22', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('36', '22', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('37', '22', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('38', '22', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('39', '22', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('40', '22', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('41', '22', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('42', '22', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('43', '22', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('44', '22', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('45', '22', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('46', '22', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('47', '22', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('48', '22', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('49', '22', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('50', '22', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('51', '22', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('52', '22', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('53', '22', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('54', '22', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('55', '22', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('56', '22', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('57', '23', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('58', '23', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('59', '23', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('60', '23', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('61', '23', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('62', '23', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('63', '23', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('64', '23', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('65', '23', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('66', '23', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('67', '23', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('68', '23', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('69', '23', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('70', '23', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('71', '23', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('72', '23', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('73', '23', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('74', '23', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('75', '23', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('76', '23', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('77', '23', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('78', '23', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('79', '23', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('80', '23', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('81', '23', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('82', '23', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('83', '23', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('84', '23', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('85', '24', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('86', '24', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('87', '24', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('88', '24', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('89', '24', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('90', '24', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('91', '24', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('92', '24', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('93', '24', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('94', '24', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('95', '24', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('96', '24', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('97', '24', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('98', '24', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('99', '24', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('100', '24', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('101', '24', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('102', '24', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('103', '24', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('104', '24', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('105', '24', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('106', '24', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('107', '24', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('108', '24', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('109', '24', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('110', '24', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('111', '24', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('112', '24', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('113', '25', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('114', '25', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('115', '25', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('116', '25', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('117', '25', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('118', '25', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('119', '25', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('120', '25', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('121', '25', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('122', '25', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('123', '25', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('124', '25', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('125', '25', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('126', '25', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('127', '25', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('128', '25', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('129', '25', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('130', '25', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('131', '25', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('132', '25', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('133', '25', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('134', '25', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('135', '25', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('136', '25', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('137', '25', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('138', '25', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('139', '25', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('140', '25', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('141', '26', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('142', '26', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('143', '26', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('144', '26', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('145', '26', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('146', '26', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('147', '26', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('148', '26', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('149', '26', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('150', '26', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('151', '26', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('152', '26', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('153', '26', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('154', '26', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('155', '26', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('156', '26', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('157', '26', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('158', '26', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('159', '26', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('160', '26', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('161', '26', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('162', '26', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('163', '26', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('164', '26', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('165', '26', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('166', '26', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('167', '26', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('168', '26', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('169', '27', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('170', '27', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('171', '27', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('172', '27', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('173', '27', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('174', '27', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('175', '27', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('176', '27', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('177', '27', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('178', '27', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('179', '27', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('180', '27', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('181', '27', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('182', '27', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('183', '27', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('184', '27', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('185', '27', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('186', '27', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('187', '27', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('188', '27', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('189', '27', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('190', '27', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('191', '27', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('192', '27', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('193', '27', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('194', '27', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('195', '27', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('196', '27', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('197', '28', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('198', '28', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('199', '28', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('200', '28', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('201', '28', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('202', '28', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('203', '28', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('204', '28', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('205', '28', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('206', '28', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('207', '28', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('208', '28', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('209', '28', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('210', '28', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('211', '28', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('212', '28', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('213', '28', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('214', '28', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('215', '28', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('216', '28', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('217', '28', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('218', '28', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('219', '28', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('220', '28', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('221', '28', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('222', '28', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('223', '28', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('224', '28', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('225', '29', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('226', '29', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('227', '29', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('228', '29', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('229', '29', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('230', '29', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('231', '29', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('232', '29', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('233', '29', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('234', '29', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('235', '29', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('236', '29', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('237', '29', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('238', '29', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('239', '29', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('240', '29', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('241', '29', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('242', '29', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('243', '29', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('244', '29', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('245', '29', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('246', '29', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('247', '29', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('248', '29', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('249', '29', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('250', '29', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('251', '29', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('252', '29', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('253', '30', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('254', '30', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('255', '30', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('256', '30', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('257', '30', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('258', '30', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('259', '30', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('260', '30', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('261', '30', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('262', '30', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('263', '30', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('264', '30', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('265', '30', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('266', '30', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('267', '30', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('268', '30', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('269', '30', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('270', '30', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('271', '30', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('272', '30', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('273', '30', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('274', '30', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('275', '30', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('276', '30', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('277', '30', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('278', '30', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('279', '30', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('280', '30', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('281', '31', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('282', '31', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('283', '31', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('284', '31', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('285', '31', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('286', '31', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('287', '31', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('288', '31', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('289', '31', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('290', '31', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('291', '31', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('292', '31', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('293', '31', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('294', '31', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('295', '31', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('296', '31', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('297', '31', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('298', '31', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('299', '31', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('300', '31', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('301', '31', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('302', '31', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('303', '31', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('304', '31', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('305', '31', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('306', '31', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('307', '31', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('308', '31', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `parts` VALUES ('309', '32', '20', '1', 'Front Bumper', 'Honda', 'Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,Dummy text will come here ,', '044554-ASDF', '1', '271301835861-icon.png', '785', '45', 'N');
INSERT INTO `parts` VALUES ('310', '32', '21', '1', 'Rear Bumper', 'Honda', 'Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .Dummy text will come here .\r', '0ASHH87-ASAD', '1', '331301837180-icon.png', '859.36', '55.22', 'N');
INSERT INTO `parts` VALUES ('311', '32', '22', '1', 'Side under spoiler', 'Toyota', 'Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .Dummy text will place here .\r', '02254-ASAS-4554', '1', '951301841798-icon.png', '365.36', '24.54', 'N');
INSERT INTO `parts` VALUES ('312', '32', '24', '1', 'Windows Tint', 'Toyota', 'Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .Dummy text .\r', '0445587-2254', '1', '161301904221-icon.png', '785.36', '36.87', 'N');
INSERT INTO `parts` VALUES ('313', '32', '18', '1', 'Body Side Modling', 'Toyota', 'Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .Dummy Text will come here .\r', 'AS33654-5587', '1', '671301913602-icon.png', '685.25', '25.84', 'N');
INSERT INTO `parts` VALUES ('314', '32', '29', '0', 'Test', 'test', 'asdasd', 'asd', '1', 'video-00254.png', '45', '45', 'N');
INSERT INTO `parts` VALUES ('315', '32', '26', '0', 'AD-NM', 'Honda', 'asdasdasdasd', '4545454-778544', '1', '151303196885-AD-NM.png', '152', '24', 'N');
INSERT INTO `parts` VALUES ('316', '32', '26', '0', 'ACT', 'Honda', 'Dummy Text Dummy Text Text will come here here het', '0225478-DFS-554', '1', '225487-act.png', '255', '34', 'N');
INSERT INTO `parts` VALUES ('317', '32', '26', '0', 'Cargo Net', 'Toyota', 'asd a sd a sd  as d as d', '033665444-4587', '1', '336987-cargo-net.png', '240', '12', 'N');
INSERT INTO `parts` VALUES ('318', '32', '26', '0', 'CHN', 'Honda', 'asdasda sd a sd a sd', '544788-478789', '0', '33669754-CHN.png', '364', '36', 'N');
INSERT INTO `parts` VALUES ('319', '32', '26', '0', 'Faid kit', 'Honda', 'Test Test Text', '033364578-AD66587', '1', '3369878-Faid-kit.png', '24', '2', 'N');
INSERT INTO `parts` VALUES ('320', '32', '26', '0', 'Floor mats', 'Toyota', 'asdasd as d as d asd', '336554789-454', '1', '554879-floor-mats.png', '35', '5', 'N');
INSERT INTO `parts` VALUES ('321', '32', '26', '0', 'Interior Illumination', 'Honda', 'asdas d as da sd  asd', '0336544-78854', '1', '5587-interior-illumination.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('322', '32', '26', '0', 'TTT', 'Toyota', 'asdasdasd', '3365478-4457', '1', '33652487-tt.png', '36', '5', 'N');
INSERT INTO `parts` VALUES ('323', '32', '28', '0', 'Front Seat', 'Honda', 'asdasd  asd  as dasd', '336587-445778', '1', '336587-seat.png', '600', '85', 'N');
INSERT INTO `parts` VALUES ('324', '32', '28', '0', 'Leather front Seats', 'Honda', 'asd as d a d a sd ', '332245788-45578', '1', '44587-leather_front.png', '1240', '125', 'N');
INSERT INTO `parts` VALUES ('325', '32', '31', '0', 'Car cover', 'Local', 'Test as d as d a sd as d', '66554789-55544', '1', '66547-car_cover.png', '665', '25', 'N');
INSERT INTO `parts` VALUES ('326', '32', '32', '0', 'ASPP.png', 'Test', 'asdasd  as dasdasd', '33665789-554KJ', '1', '336587-ASPP.png', '235', '25', 'N');
INSERT INTO `parts` VALUES ('327', '32', '32', '0', 'Custom Pinstrip', 'Test', 'asd a sd  asd  asdasd', '3366547789-336587', '1', '789632-custom-pinstrip.png', '365', '32', 'N');
INSERT INTO `parts` VALUES ('328', '32', '32', '0', 'Defnce GPS', 'Honda', 'asd as d as d as d  as  dasd', '336577889-22547887', '1', '33698-defnceGPS.png', '2545', '320', 'N');
INSERT INTO `parts` VALUES ('329', '32', '33', '0', 'Assist sensor', 'Honda', 'Des as  d asd  asd  asd ', '00355455-AS-554', '1', '32245-assist-sensor.png', '456', '24', 'N');
INSERT INTO `parts` VALUES ('330', '32', '33', '0', 'Alarm system', 'Honda', 'asd asd  asd  as da', '003665478-ASD-555478', '1', '336587-alarm-system.png', '364', '23', 'N');
INSERT INTO `parts` VALUES ('331', '32', '33', '0', 'Handfree', 'Honda', 'asdasd a sd ', '336654788', '1', '33687-handfree.png', '365', '42', 'N');
INSERT INTO `parts` VALUES ('332', '32', '33', '0', 'Start Light', 'Toyota', 'asd  as d asd  sd', '336587-6697454', '1', '336987-start-light.png', '369', '25', 'N');
INSERT INTO `parts` VALUES ('333', '32', '33', '0', 'RES', 'Honda', 'asd as d  as d asd', '336587-ASD-3668', '1', '336987-RES.png', '365', '54', 'N');
INSERT INTO `parts` VALUES ('334', '32', '33', '0', 'Remort start', 'Honda', 'asd as d a s d as d', '336587-45877', '1', '7784-remort-start.png', '336', '87', 'N');
INSERT INTO `parts` VALUES ('335', '32', '34', '0', 'Engin block heater', 'Honda', 'as d as d as d as d', '3368745-22541', '1', '9987-engin-block-heater.png', '364', '24', 'N');
INSERT INTO `parts` VALUES ('336', '32', '34', '0', 'Sport Suspension', 'Honda', 'ad a s as  as da', '3365874-554', '1', '336587-sport-suspension.png', '364', '25', 'N');
INSERT INTO `trim` VALUES ('1', '1', 'EX');
INSERT INTO `trim` VALUES ('2', '1', 'EX-L');
INSERT INTO `trim` VALUES ('3', '1', 'EX-L V8');
INSERT INTO `trim` VALUES ('4', '1', 'LX-S');
INSERT INTO `trim` VALUES ('8', '1', 'hemmo');
INSERT INTO `trim` VALUES ('9', '23', 'EX');
INSERT INTO `trim` VALUES ('10', '23', 'EX-L');
INSERT INTO `trim` VALUES ('11', '23', 'EX-L V6');
INSERT INTO `trim` VALUES ('12', '23', 'LX-S');
INSERT INTO `trim` VALUES ('13', '24', 'EX');
INSERT INTO `trim` VALUES ('16', '25', 'EX');
INSERT INTO `trim` VALUES ('15', '24', 'EX-L');
INSERT INTO `trim` VALUES ('17', '25', 'EX V6');
INSERT INTO `trim` VALUES ('18', '25', 'EX-L');
INSERT INTO `trim` VALUES ('19', '25', 'EX-L V6');
INSERT INTO `trim` VALUES ('20', '25', 'LX');
INSERT INTO `trim` VALUES ('21', '25', 'LX Premium');
INSERT INTO `trim` VALUES ('22', '26', 'Civic Si Coupe');
INSERT INTO `trim` VALUES ('23', '26', 'DX');
INSERT INTO `trim` VALUES ('24', '26', 'EX');
INSERT INTO `trim` VALUES ('25', '26', 'EX-L');
INSERT INTO `trim` VALUES ('26', '26', 'LX');
INSERT INTO `trim` VALUES ('27', '27', 'DX');
INSERT INTO `trim` VALUES ('28', '27', 'DX-VP');
INSERT INTO `trim` VALUES ('29', '27', 'EX');
INSERT INTO `trim` VALUES ('30', '27', 'EX-L');
INSERT INTO `trim` VALUES ('31', '27', 'GX NGV');
INSERT INTO `trim` VALUES ('32', '27', 'Hybrid');
INSERT INTO `trim` VALUES ('33', '27', 'LX');
INSERT INTO `trim` VALUES ('34', '27', 'LX-S');
INSERT INTO `trim` VALUES ('35', '27', 'Si');
INSERT INTO `trim` VALUES ('36', '29', 'EX');
INSERT INTO `trim` VALUES ('37', '29', 'EX-L');
INSERT INTO `trim` VALUES ('38', '29', 'LX');
INSERT INTO `trim` VALUES ('39', '30', '2WD EX (2.4L)');
INSERT INTO `trim` VALUES ('40', '30', '2WD EX with Honda Satellite-Linked Navigation System (2.4L)');
INSERT INTO `trim` VALUES ('41', '30', '2WD LX (2.4L)');
INSERT INTO `trim` VALUES ('42', '30', '4WD EX (2.4L)');
INSERT INTO `trim` VALUES ('43', '30', '4WD EX with Honda Satellite-Linked Navigation System (2.4L)');
INSERT INTO `trim` VALUES ('44', '30', '4WD LX (2.4L)');
INSERT INTO `trim` VALUES ('45', '30', 'SC (2.4L)');
INSERT INTO `trim` VALUES ('46', '31', 'Fit');
INSERT INTO `trim` VALUES ('47', '31', 'Fit Sport');
INSERT INTO `trim` VALUES ('48', '31', 'Fit Sport with Navigation');
INSERT INTO `trim` VALUES ('49', '32', 'EX');
INSERT INTO `trim` VALUES ('50', '32', 'EX Navigation');
INSERT INTO `trim` VALUES ('51', '32', 'LX');
INSERT INTO `trim` VALUES ('52', '33', 'EX');
INSERT INTO `trim` VALUES ('53', '33', 'EX-L');
INSERT INTO `trim` VALUES ('54', '33', 'LX');
INSERT INTO `trim` VALUES ('55', '33', 'Touring');
INSERT INTO `trim` VALUES ('56', '34', '2WD EX');
INSERT INTO `trim` VALUES ('57', '34', '2WD EX-L');
INSERT INTO `trim` VALUES ('58', '34', '2WD LX');
INSERT INTO `trim` VALUES ('59', '34', '2WD Touring');
INSERT INTO `trim` VALUES ('60', '34', '4WD EX');
INSERT INTO `trim` VALUES ('61', '34', '4WD EX-L');
INSERT INTO `trim` VALUES ('62', '34', '4WD LX');
INSERT INTO `trim` VALUES ('63', '34', '4WD Touring');
INSERT INTO `trim` VALUES ('64', '36', 'RT');
INSERT INTO `trim` VALUES ('65', '36', 'RTL');
INSERT INTO `trim` VALUES ('66', '36', 'RTL with Navigation');
INSERT INTO `trim` VALUES ('67', '36', 'RTS');
INSERT INTO `trim` VALUES ('68', '24', 'EX-L with Honda Satellite-Linked Navigation System');
INSERT INTO `user_backgrounds` VALUES ('4', '8', '14', '1');
INSERT INTO `user_backgrounds` VALUES ('3', '2', '14', '1');
INSERT INTO `user_defaults` VALUES ('8', '14', '2', '_blank');
INSERT INTO `user_details` VALUES ('8', '14', '_blank', '_blank', '_blank', '_blank', '_blank', '_blank', '_blank', 'dealers-logo.png');
INSERT INTO `user_part_categories` VALUES ('272', '14', '45', '0');
INSERT INTO `user_part_categories` VALUES ('271', '14', '44', '0');
INSERT INTO `user_part_categories` VALUES ('270', '14', '43', '0');
INSERT INTO `user_part_categories` VALUES ('269', '14', '42', '0');
INSERT INTO `user_part_categories` VALUES ('268', '14', '41', '0');
INSERT INTO `user_part_categories` VALUES ('267', '14', '40', '0');
INSERT INTO `user_part_categories` VALUES ('266', '14', '39', '0');
INSERT INTO `user_part_categories` VALUES ('265', '14', '38', '0');
INSERT INTO `user_part_categories` VALUES ('264', '14', '37', '0');
INSERT INTO `user_part_categories` VALUES ('263', '14', '36', '0');
INSERT INTO `user_part_categories` VALUES ('262', '14', '35', '0');
INSERT INTO `user_part_categories` VALUES ('261', '14', '34', '0');
INSERT INTO `user_part_categories` VALUES ('260', '14', '33', '0');
INSERT INTO `user_part_categories` VALUES ('259', '14', '32', '0');
INSERT INTO `user_part_categories` VALUES ('258', '14', '31', '0');
INSERT INTO `user_part_categories` VALUES ('257', '14', '30', '0');
INSERT INTO `user_part_categories` VALUES ('256', '14', '29', '0');
INSERT INTO `user_part_categories` VALUES ('255', '14', '28', '0');
INSERT INTO `user_part_categories` VALUES ('254', '14', '27', '0');
INSERT INTO `user_part_categories` VALUES ('253', '14', '26', '0');
INSERT INTO `user_part_categories` VALUES ('252', '14', '25', '0');
INSERT INTO `user_part_categories` VALUES ('251', '14', '24', '0');
INSERT INTO `user_part_categories` VALUES ('250', '14', '23', '0');
INSERT INTO `user_part_categories` VALUES ('249', '14', '22', '0');
INSERT INTO `user_part_categories` VALUES ('248', '14', '21', '0');
INSERT INTO `user_part_categories` VALUES ('247', '14', '20', '0');
INSERT INTO `user_part_categories` VALUES ('246', '14', '19', '0');
INSERT INTO `user_part_categories` VALUES ('245', '14', '18', '0');
INSERT INTO `user_part_categories` VALUES ('244', '14', '7', '0');
INSERT INTO `user_part_categories` VALUES ('243', '14', '6', '0');
INSERT INTO `user_part_categories` VALUES ('242', '14', '5', '0');
INSERT INTO `user_part_categories` VALUES ('241', '14', '4', '0');
INSERT INTO `user_part_categories` VALUES ('240', '14', '3', '0');
INSERT INTO `user_part_categories` VALUES ('239', '14', '1', '0');
INSERT INTO `user_part_manufactures` VALUES ('24', '14', '3', 'asdasd', '0');
INSERT INTO `user_part_manufactures` VALUES ('23', '14', '2', 'Test Description will work here....', '0');
INSERT INTO `user_part_manufactures` VALUES ('22', '14', '1', 'asasd', '0');
INSERT INTO `user_part_types` VALUES ('32', '14', '4', '0');
INSERT INTO `user_part_types` VALUES ('31', '14', '3', '0');
INSERT INTO `user_part_types` VALUES ('30', '14', '2', '0');
INSERT INTO `user_part_types` VALUES ('29', '14', '1', '0');
INSERT INTO `user_parts` VALUES ('48', '14', '6', 'p', '0', '45', '45');
INSERT INTO `user_parts` VALUES ('47', '14', '5', 'p', '0', '685.25', '25.8400001525879');
INSERT INTO `user_parts` VALUES ('46', '14', '4', 'p', '0', '785.359985351563', '36.8699989318848');
INSERT INTO `user_parts` VALUES ('45', '14', '3', 'p', '0', '365.359985351563', '24.5400009155273');
INSERT INTO `user_parts` VALUES ('43', '14', '1', 'p', '0', '785', '45');
INSERT INTO `user_parts` VALUES ('44', '14', '2', 'p', '0', '859.359985351563', '55.2200012207031');
INSERT INTO `user_wheel_types` VALUES ('288', '14', '18', '0');
INSERT INTO `user_wheel_types` VALUES ('287', '14', '17', '0');
INSERT INTO `user_wheel_types` VALUES ('286', '14', '16', '0');
INSERT INTO `user_wheel_types` VALUES ('285', '14', '15', '0');
INSERT INTO `user_wheel_types` VALUES ('284', '14', '14', '0');
INSERT INTO `user_wheel_types` VALUES ('283', '14', '13', '0');
INSERT INTO `user_wheel_types` VALUES ('282', '14', '12', '0');
INSERT INTO `user_wheel_types` VALUES ('281', '14', '11', '0');
INSERT INTO `user_wheel_types` VALUES ('280', '14', '10', '0');
INSERT INTO `user_wheel_types` VALUES ('279', '14', '9', '0');
INSERT INTO `user_wheel_types` VALUES ('278', '14', '8', '0');
INSERT INTO `user_wheel_types` VALUES ('277', '14', '7', '0');
INSERT INTO `user_wheel_types` VALUES ('276', '14', '6', '0');
INSERT INTO `user_wheel_types` VALUES ('275', '14', '5', '0');
INSERT INTO `user_wheel_types` VALUES ('274', '14', '4', '0');
INSERT INTO `user_wheel_types` VALUES ('273', '14', '3', '0');
INSERT INTO `user_wheel_types` VALUES ('272', '14', '2', '0');
INSERT INTO `user_wheel_types` VALUES ('271', '14', '1', '0');
INSERT INTO `user_wheel_types` VALUES ('270', '14', '18', '0');
INSERT INTO `user_wheel_types` VALUES ('269', '14', '17', '0');
INSERT INTO `user_wheel_types` VALUES ('268', '14', '16', '0');
INSERT INTO `user_wheel_types` VALUES ('267', '14', '15', '0');
INSERT INTO `user_wheel_types` VALUES ('266', '14', '14', '0');
INSERT INTO `user_wheel_types` VALUES ('265', '14', '13', '0');
INSERT INTO `user_wheel_types` VALUES ('264', '14', '12', '0');
INSERT INTO `user_wheel_types` VALUES ('263', '14', '11', '0');
INSERT INTO `user_wheel_types` VALUES ('262', '14', '10', '0');
INSERT INTO `user_wheel_types` VALUES ('261', '14', '9', '0');
INSERT INTO `user_wheel_types` VALUES ('260', '14', '8', '0');
INSERT INTO `user_wheel_types` VALUES ('259', '14', '7', '0');
INSERT INTO `user_wheel_types` VALUES ('258', '14', '6', '0');
INSERT INTO `user_wheel_types` VALUES ('257', '14', '5', '0');
INSERT INTO `user_wheel_types` VALUES ('256', '14', '4', '0');
INSERT INTO `user_wheel_types` VALUES ('255', '14', '3', '0');
INSERT INTO `user_wheel_types` VALUES ('254', '14', '2', '0');
INSERT INTO `user_wheel_types` VALUES ('253', '14', '1', '0');
INSERT INTO `users` VALUES ('1', '0', '0', 'admin', 'admin', 'admin@hotmail.com', '1', '1');
INSERT INTO `users` VALUES ('14', '1', '0', 'test', 'test', 'test@hotmail.com', '3', '1');
INSERT INTO `users` VALUES ('15', '14', '14', 'sale', 'sale', 'sale@hotmail.com', '7', '1');
INSERT INTO `users` VALUES ('16', '14', '14', 'abc', 'abc', 'abc@hotmail.com', '5', '1');
INSERT INTO `variable` VALUES ('default_background', '', '2');
INSERT INTO `variable` VALUES ('default_coordinates', 'coord', '[{\"SFVIEWY\":\"172\",\"SRVIEWY\":\"300\",\"CRVIEWY\":\"130\",\"SRVIEWX\":\"30\",\"CFVIEWY\":\"130\",\"CIVIEWX\":\"255\",\"SFVIEWX\":\"30\",\"SIVIEWX\":\"30\",\"CRVIEWX\":\"255\",\"SIVIEWY\":\"431\",\"CFVIEWX\":\"255\",\"CIVIEWY\":\"130\"}]');
INSERT INTO `variable` VALUES ('remote_config', 'remote', '[{\"smallviews\":\"public/assets/views/smallviews/\",\"hostDomain\":\"http://localhost/aoc/\",\"gateWay\":\"amfphp/gateway.php\",\"backgrounds\":\"public/assets/backgrounds/\",\"uploadScript\":\"upload-assets.php\",\"effected\":\"public/assets/parts/effected-imgs/\",\"icons\":\"public/assets/parts/icons/\",\"InteriorFiles\":\"public/assets/interiors/\",\"MakeFiles\":\"public/assets/makes/\",\"DealerLogoFiles\":\"public/assets/dealerlogo/\",\"ModelFiles\":\"public/assets/models/\",\"canvesviews\":\"public/assets/views/canvesviews/\"}]');
INSERT INTO `variable` VALUES ('email4newuser', 'mail', 'Email Text will come her...');
INSERT INTO `variable` VALUES ('email4blockuser', 'mail', 'Your account blocked due to Test Test Test');
INSERT INTO `variable` VALUES ('email4unblockuser', 'mail', 'Your account is Un-blocked now , you can use your account information');
INSERT INTO `variable` VALUES ('emailremoveuser', 'mail', 'You account permonantlty removed from addoncars ..');
INSERT INTO `variable` VALUES ('indexpage', 'cms', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).');
INSERT INTO `variable` VALUES ('aboutpage', 'cms', 'About us page text will come here');
INSERT INTO `variable` VALUES ('contactpage', 'cms', 'Contact Us Page Text will come here ... asdasdasd, Page Settings');
INSERT INTO `variable` VALUES ('dealerIcon', '', 'dealers-logo.png');
INSERT INTO `vehicles` VALUES ('20', '1', '3', 'BMW M5', '91769-front_big.png', '92102-rear_big.png', '70547-interior_big.png', '36108-front_small.png', '85989-rear_small.png', '46453-interior_small.png');
INSERT INTO `vehicles` VALUES ('21', '9', '4', 'Accord Cope', '31292487627-front_big.png', '221292487670-back_big.png', '31292487702-interior_big.png', '61292487581-front_small.png', '151292487595-back_small.png', '231292487608-interior_small.png');
INSERT INTO `vehicles` VALUES ('22', '9', '5', 'Accord Coupe', '411292825239-car-front.png', '151292825274-car-back.png', '01292826987-interior.png', '551292826261-car-front.png', '251292826277-car-back.png', '621292825206-interior.png');
INSERT INTO `vehicles` VALUES ('23', '9', '6', 'Accord Coupe', '51292830438-car-front.png', '991292830442-car-back.png', '531292830866-interior.png', '471292830412-car-front.png', '411292830417-car-back.png', '351292831165-interior.png');
INSERT INTO `vehicles` VALUES ('24', '9', '7', 'Accord Coupe', '901292831680-car-front.png', '271292831691-car-back.png', '331292831699-interior.png', '981292831657-car-front.png', '611292831664-car-back.png', '91292831665-interior.png');
INSERT INTO `vehicles` VALUES ('25', '9', '8', 'Accord Coupe', '241292832730-car-front.png', '311292832745-car-back.png', '31292832739-interior.png', '831292832708-car-front.png', '161292832711-car-back.png', '541292832712-interior.png');
INSERT INTO `vehicles` VALUES ('26', '9', '9', 'Accord Coupe', '21292833471-car-front.png', '431292833472-car-back.png', '451292833479-interior.png', '451292833444-car-front.png', '581292833449-car-back.png', '251292833453-interior.png');
INSERT INTO `vehicles` VALUES ('27', '9', '10', 'Accord Coupe', '731292835194-car-front.png', '51292835188-car-back.png', '371292835200-interior.png', '181292835168-car-front.png', '591292835166-car-back.png', '601292835171-interior.png');
INSERT INTO `vehicles` VALUES ('28', '9', '11', 'Accord Coupe', '601292840887-car-front.png', '581292840876-car-back.png', '851292840899-interior.png', '171292840836-car-front.png', '691292840851-car-back.png', '571292840855-interior.png');
INSERT INTO `vehicles` VALUES ('29', '9', '12', 'Accord Coupe', '481292841494-car-front.png', '821292841500-car-back.png', '531292841510-interior.png', '761292841473-car-front.png', '201292841480-car-back.png', '851292841481-interior.png');
INSERT INTO `vehicles` VALUES ('30', '9', '13', 'Accird Coupe', '51292848308-car-front.png', '81292848312-car-back.png', '21292848329-interior.png', '981292848289-car-front.png', '861292848292-car-back.png', '181292848295-interior.png');
INSERT INTO `vehicles` VALUES ('31', '9', '14', 'Accord Coupe', '151292849114-car-front.png', '521292849117-car-back.png', '581292849119-interior.png', '31292849098-car-front.png', '781292849095-car-back.png', '611292849102-interior.png');
INSERT INTO `vehicles` VALUES ('32', '9', '15', 'Accord coupe', '271292849787-car-front.png', '981292849791-car-back.png', '661292849797-interior.png', '921292849765-car-front.png', '61292849770-car-back.png', '771292849773-interior.png');
INSERT INTO `vehicles` VALUES ('33', '10', '16', 'Accord Coupe', '601292916481-car-front.png', '421292916483-car-back.png', '801292916487-interior.png', '471292916457-car-front.png', '621292916457-car-back.png', '921292916462-interior.png');
INSERT INTO `vehicles` VALUES ('34', '10', '17', 'Accord Coupe', '31292916659-car-front.png', '401292916664-car-back.png', '561292916666-interior.png', '951292916639-car-front.png', '811292916650-car-back.png', '51292916648-interior.png');
INSERT INTO `vehicles` VALUES ('35', '10', '18', 'Accord Coupe', '51292917214-car-front.png', '671292917208-car-back.png', '291292917556-inerior.png', '871292917155-car-front.png', '591292917153-car-back.png', '141292917158-interior.png');
INSERT INTO `vehicles` VALUES ('36', '10', '19', 'Accord Coupe', '521292917737-car-front.png', '271292917743-car-back.png', '201292917749-interior.png', '161292917715-car-front.png', '671292917720-car-back.png', '581292917722-interior.png');
INSERT INTO `vehicles` VALUES ('37', '10', '20', 'Accord Coupe', '181292918111-car-front.png', '151292918116-car-back.png', '571292918120-interior.png', '151292918096-car-front.png', '51292918097-car-back.png', '871292918100-interior.png');
INSERT INTO `vehicles` VALUES ('38', '10', '21', 'Accord Coupe', '721292918429-car-front.png', '971292918438-car-back.png', '911292918454-interior.png', '111292918410-car-front.png', '91292918419-car-back.png', '821292918417-interior.png');
INSERT INTO `vehicles` VALUES ('39', '10', '22', 'Accord Coupe', '751292918685-car-front.png', '741292918680-car-back.png', '561292918689-interior.png', '41292918636-car-front.png', '881292918641-car-back.png', '351292918645-interior.png');
INSERT INTO `vehicles` VALUES ('40', '10', '23', 'Accord Coupe', '381292919068-car-front.png', '391292919074-car-back.png', '571292919091-interior.png', '461292919034-car-front.png', '191292919042-car-back.png', '971292919047-interior.png');
INSERT INTO `vehicles` VALUES ('41', '10', '24', 'Accord Coupe', '911292919358-car-front.png', '241292919358-car-back.png', '221292919379-interior.png', '11292919323-car-front.png', '21292919329-car-back.png', '941292919328-interior.png');
INSERT INTO `vehicles` VALUES ('42', '10', '25', 'Accord Coupe', '971292920744-car-front.png', '821292920762-car-back.png', '101292920784-interior.png', '141292920720-car-front.png', '581292920719-car-back.png', '471292920721-interior.png');
INSERT INTO `vehicles` VALUES ('43', '10', '26', 'Accord Coupe', '321292921201-car-front.png', '201292921205-car-back.png', '251292921215-interior.png', '641292921160-car-front.png', '861292921166-car-back.png', '631292921170-interior.png');
INSERT INTO `vehicles` VALUES ('44', '10', '27', 'Accord Coupe', '421292921557-car-front.png', '511292921571-car-back.png', '811292921580-interior.png', '371292921543-car-front.png', '531292921542-car-back.png', '331292921545-interior.png');
INSERT INTO `vehicles` VALUES ('45', '11', '28', 'Accord Coup', '341292931469-car-front.png', '671292931484-car-back.png', '351292931481-interior.png', '291292931442-car-front.png', '661292931443-car-back.png', '161292931448-interior.png');
INSERT INTO `vehicles` VALUES ('46', '11', '29', 'Accord Coupe', '751292931703-front.png', '81292931711-rear.png', '861292931715-interior.png', '31292931688-front.png', '531292931689-rear.png', '421292931695-interior.png');
INSERT INTO `vehicles` VALUES ('47', '11', '30', 'Accord Coupe', '551292931927-car-front.png', '961292931921-car-back.png', '581292931947-interior.png', '71292931892-car-front.png', '551292931892-car-back.png', '251292931899-interior.png');
INSERT INTO `vehicles` VALUES ('48', '11', '31', 'Accord Coupe', '531292934340-front.png', '221292934313-rear.png', '121292934329-interior.png', '911292934291-front.png', '641292934297-rear.png', '691292934298-interior.png');
INSERT INTO `vehicles` VALUES ('49', '11', '32', 'Accord Coupe', '71292934879-car-front.png', '151292934859-car-back.png', '971292934893-interior.png', '101292934843-car-front.png', '241292934844-car-back.png', '711292934852-interior.png');
INSERT INTO `vehicles` VALUES ('50', '11', '33', 'Accord Coupe', '861292935167-front.png', '261292935172-rear.png', '161292935184-interior.png', '591292935153-front.png', '951292935160-rear.png', '201292935158-interior.png');
INSERT INTO `vehicles` VALUES ('51', '11', '34', 'Accord Coupe', '771292935380-car-front.png', '341292935386-car-back.png', '691292935396-interior.png', '121292935356-car-front.png', '861292935362-car-back.png', '961292935362-interior.png');
INSERT INTO `vehicles` VALUES ('52', '11', '35', 'Accord Coupe', '51292935572-front.png', '651292935580-rear.png', '851292935593-interior.png', '931292935556-front.png', '331292935550-rear.png', '401292935559-interior.png');
INSERT INTO `vehicles` VALUES ('53', '11', '36', 'Accord Coupe', '01292936597-car-front.png', '361292936606-car-back.png', '271292936611-interior.png', '841292936602-car-front.png', '311292936583-car-back.png', '181292936589-interior.png');
INSERT INTO `vehicles` VALUES ('54', '11', '37', 'Accord Coupe', '921292936960-car-front.png', '671292936967-car-back.png', '261292936980-interior.png', '631292936941-car-front.png', '691292936945-car-back.png', '711292936947-interior.png');
INSERT INTO `vehicles` VALUES ('55', '11', '38', 'Accord Coupe', '771292937217-car-front.png', '401292937222-car-back.png', '121292937235-interior.png', '241292937214-car-front.png', '251292937201-car-back.png', '821292937203-interior.png');
INSERT INTO `vehicles` VALUES ('56', '11', '39', 'Accord Coupe', '971292937424-front.png', '671292937438-rear.png', '541292937443-interior.png', '401292937395-front.png', '281292937399-rear.png', '361292937408-interior.png');
INSERT INTO `vehicles` VALUES ('57', '12', '40', 'Accord Coupe', '731293003891-car-front.png', '821293003895-car-back.png', '701293003914-interior.png', '391293003853-car-front.png', '961293003859-car-back.png', '611293003862-interior.png');
INSERT INTO `vehicles` VALUES ('58', '12', '41', 'Accord Coupe', '671293004054-Front.png', '161293004056-car-back.png', '911293004064-interior.png', '831293004026-Front.png', '741293004035-car-back.png', '921293004037-interior.png');
INSERT INTO `vehicles` VALUES ('59', '12', '42', 'Accord Coupe', '241293004183-car-front.png', '981293004180-car-back.png', '351293004184-interior.png', '451293004158-car-front.png', '151293004164-car-back.png', '451293004165-interior.png');
INSERT INTO `vehicles` VALUES ('60', '12', '43', 'Accord Coupe', '881293004294-car-front.png', '751293004296-car-back.png', '861293004303-interior.png', '261293004275-car-front.png', '131293004280-car-back.png', '561293004281-interior.png');
INSERT INTO `vehicles` VALUES ('61', '12', '44', 'Accord Coupe', '991293004431-car-front.png', '991293004435-car-back.png', '391293004438-interior.png', '11293004408-car-front.png', '101293004411-car-back.png', '501293004413-interior.png');
INSERT INTO `vehicles` VALUES ('62', '12', '45', 'Accord Coupe', '931293004719-car-front.png', '541293004723-car-back.png', '821293004731-interior.png', '11293004706-car-front.png', '91293004707-car-back.png', '141293004710-interior.png');
INSERT INTO `vehicles` VALUES ('63', '12', '46', 'Accord Coupe', '551293017412-car-front.png', '981293017410-car-back.png', '111293017418-interior.png', '01293017390-car-front.png', '31293017395-car-back.png', '731293017396-interior.png');
INSERT INTO `vehicles` VALUES ('64', '12', '47', 'Accord Coupe', '181293017529-Front.png', '421293017533-car-back.png', '411293017539-interior.png', '731293017511-Front.png', '331293017519-car-back.png', '321293017519-interior.png');
INSERT INTO `vehicles` VALUES ('65', '12', '48', 'Accord Coupe', '431293017668-car-front.png', '801293017669-car-back.png', '211293017676-interior.png', '101293017654-car-front.png', '641293017659-car-back.png', '991293017660-interior.png');
INSERT INTO `vehicles` VALUES ('66', '12', '49', 'Accord Coupe', '771293018078-car-front.png', '21293018082-car-back.png', '601293018088-interior.png', '201293018059-car-front.png', '531293018063-car-back.png', '331293018071-interior.png');
INSERT INTO `vehicles` VALUES ('67', '13', '50', 'Accord Crosstour', '991293018405-font.png', '661293018409-rear.png', '111293018419-interior.png', '771293018393-font.png', '321293018395-rear.png', '31293018397-interior.png');
INSERT INTO `vehicles` VALUES ('68', '13', '51', 'Accord crosstour', '371293018609-font.png', '41293018614-rear.png', '261293018619-interior.png', '721293018594-font.png', '911293018598-rear.png', '01293018601-interior.png');
INSERT INTO `vehicles` VALUES ('69', '13', '52', 'Accord Crosstour', '131293018758-font.png', '561293018754-rear.png', '251293018761-interior.png', '371293018738-font.png', '401293018745-rear.png', '691293018744-interior.png');
INSERT INTO `vehicles` VALUES ('70', '13', '53', 'Accord crosstour', '151293020497-font.png', '821293020501-rear.png', '241293020516-interior.png', '341293020482-font.png', '391293020486-rear.png', '511293020490-interior.png');
INSERT INTO `vehicles` VALUES ('71', '13', '54', 'Accord Crosstour', '701293020833-font.png', '981293020834-rear.png', '501293020995-interior.png', '241293020705-font.png', '361293020709-rear.png', '111293020710-interior.png');
INSERT INTO `vehicles` VALUES ('72', '13', '55', 'Accord Crosstour', '131293021233-font.png', '261293021236-rear.png', '751293021249-interior.png', '651293021216-font.png', '231293021224-rear.png', '231293021226-interior.png');
INSERT INTO `vehicles` VALUES ('73', '13', '56', 'Accord Coupe', '751293022789-font.png', '161293022794-rear.png', '441293022842-interior.png', '671293022775-font.png', '661293022778-rear.png', '801293022782-interior.png');
INSERT INTO `vehicles` VALUES ('74', '13', '57', 'Accord Crosstour', '131293022652-font.png', '571293022656-rear.png', '571293022662-interior.png', '61293022633-font.png', '741293022637-rear.png', '301293022638-interior.png');
INSERT INTO `vehicles` VALUES ('75', '13', '58', 'Accord Crosstour', '891293023031-font.png', '351293023028-rear.png', '671293023036-interior.png', '511293023010-font.png', '801293023008-rear.png', '571293023012-interior.png');
INSERT INTO `vehicles` VALUES ('76', '13', '59', 'Accord Crosstour', '301293079939-font.png', '761293079929-rear.png', '351293080463-interior.png', '631293079908-font.png', '801293079913-rear.png', '361293079914-interior.png');
INSERT INTO `vehicles` VALUES ('77', '13', '60', 'Accord Crosstour', '431293080782-font.png', '981293080784-rear.png', '301293080791-interior.png', '281293080766-font.png', '191293080770-rear.png', '491293080771-interior.png');
INSERT INTO `vehicles` VALUES ('78', '13', '61', 'Accord Crosstour', '841293080988-font.png', '901293080990-rear.png', '751293081329-interior.png', '11293080972-font.png', '961293080977-rear.png', '791293080978-interior.png');
INSERT INTO `vehicles` VALUES ('79', '13', '62', 'Accord Crosstour', '821293081528-font.png', '81293081529-rear.png', '831293081539-interior.png', '11293081510-font.png', '301293081515-rear.png', '861293081516-interior.png');
INSERT INTO `vehicles` VALUES ('80', '13', '63', 'Accord Crosstour', '271293081810-font.png', '751293081812-rear.png', '121293081818-interior.png', '401293081783-font.png', '251293081789-rear.png', '511293081790-interior.png');
INSERT INTO `vehicles` VALUES ('81', '15', '64', 'Accord Crosstour', '861293085216-font.png', '551293085217-rear.png', '421293085228-interior.png', '791293085203-font.png', '221293085202-rear.png', '561293085204-interior.png');
INSERT INTO `vehicles` VALUES ('82', '15', '65', 'Accord Crosstour', '781293086036-font.png', '91293085808-rear.png', '811293085817-interior.png', '721293086039-font.png', '451293085763-rear.png', '381293085767-interior.png');
INSERT INTO `vehicles` VALUES ('83', '15', '66', 'Accord Crosstour', '741293086830-font.png', '601293086832-rear.png', '121293086852-interior.png', '511293086819-font.png', '431293086820-rear.png', '681293086824-interior.png');
INSERT INTO `vehicles` VALUES ('84', '15', '67', 'Accord Crosstour', '971293087486-font.png', '281293087491-rear.png', '521293087513-interior.png', '991293087474-font.png', '391293087478-rear.png', '21293087479-interior.png');
INSERT INTO `vehicles` VALUES ('85', '15', '68', 'Accord Crosstour', '281293099061-font.png', '841293099060-rear.png', '321293099067-interior.png', '901293099040-font.png', '291293099045-rear.png', '601293099047-interior.png');
INSERT INTO `vehicles` VALUES ('86', '15', '69', 'Accord Crosstour', '911293099342-font.png', '61293099349-rear.png', '151293099367-interior.png', '611293099324-font.png', '591293099331-rear.png', '361293099331-interior.png');
INSERT INTO `vehicles` VALUES ('87', '15', '70', 'Accord Crosstour', '201293099525-font.png', '761293099527-rear.png', '661293099540-interior.png', '501293099510-font.png', '391293099514-rear.png', '421293099519-interior.png');
INSERT INTO `vehicles` VALUES ('88', '15', '71', 'Accord Crosstour', '811293099682-font.png', '851293099684-rear.png', '951293099693-interior.png', '311293099664-font.png', '451293099668-rear.png', '691293099672-interior.png');
INSERT INTO `vehicles` VALUES ('89', '15', '72', 'Accord Crosstour', '531293101640-font.png', '211293101649-rear.png', '51293101682-interior.png', '771293101625-font.png', '301293101635-rear.png', '621293101632-interior.png');
INSERT INTO `vehicles` VALUES ('90', '15', '73', 'Accord Crosstour', '741293101851-font.png', '771293101856-rear.png', '961293101869-interior.png', '151293101844-font.png', '41293101854-rear.png', '31293101846-interior.png');
INSERT INTO `vehicles` VALUES ('91', '15', '74', 'Accord Crosstour', '161293101999-font.png', '11293101998-rear.png', '911293102004-interior.png', '981293101982-font.png', '691293101988-rear.png', '301293101989-interior.png');
INSERT INTO `vehicles` VALUES ('92', '15', '75', 'Accord Crosstour', '551293102118-font.png', '611293102123-rear.png', '241293102143-interior.png', '511293102107-font.png', '631293102108-rear.png', '331293102111-interior.png');
INSERT INTO `vehicles` VALUES ('93', '15', '76', 'Accord Crosstour', '901293102287-font.png', '551293102290-rear.png', '961293102297-interior.png', '121293102277-font.png', '331293102276-rear.png', '271293102281-interior.png');
INSERT INTO `vehicles` VALUES ('94', '15', '77', 'Accord Crosstour', '251293102423-font.png', '931293102426-rear.png', '261293102434-interior.png', '741293102409-font.png', '881293102413-rear.png', '811293102417-interior.png');
INSERT INTO `vehicles` VALUES ('95', '16', '78', 'Accord Sedan', '661293432172-car_front.png', '961293432169-back.png', '411293432178-interior.png', '781293432149-car_front.png', '111293432153-back.png', '701293432154-interior.png');
INSERT INTO `vehicles` VALUES ('96', '16', '79', 'Accord Sedan', '731293432321-car_front.png', '601293432318-back.png', '881293432326-interior.png', '381293432299-car_front.png', '561293432303-back.png', '721293432304-interior.png');
INSERT INTO `vehicles` VALUES ('97', '16', '80', 'Accord Sedan', '781293432491-car_front.png', '701293432485-back.png', '131293432499-interior.png', '681293432470-car_front.png', '751293432479-back.png', '971293432479-interior.png');
INSERT INTO `vehicles` VALUES ('98', '16', '81', 'Accord Sedan', '841293432607-car_front.png', '401293432622-back.png', '151293432624-interior.png', '691293432591-car_front.png', '601293432591-back.png', '971293432594-interior.png');
INSERT INTO `vehicles` VALUES ('99', '16', '82', 'Accord Sedan', '921293434866-car_front.png', '671293434866-back.png', '771293434872-interior.png', '551293434847-car_front.png', '81293434851-back.png', '831293434852-interior.png');
INSERT INTO `vehicles` VALUES ('100', '16', '83', 'Accord Sedan', '811293435022-car_front.png', '71293435021-back.png', '121293435038-interior.png', '551293434995-car_front.png', '371293434998-back.png', '821293435000-interior.png');
INSERT INTO `vehicles` VALUES ('101', '16', '84', 'Accord Sedan', '101293435165-car_front.png', '841293435173-back.png', '741293435171-interior.png', '301293435141-car_front.png', '31293435143-back.png', '461293435147-interior.png');
INSERT INTO `vehicles` VALUES ('102', '16', '85', 'Accord Sedan', '171293435306-car_front.png', '791293435307-back.png', '81293435315-interior.png', '861293435286-car_front.png', '391293435288-back.png', '131293435291-interior.png');
INSERT INTO `vehicles` VALUES ('103', '16', '86', 'Accord Sedan', '361293435653-car_front.png', '391293435659-back.png', '991293435676-interior.png', '961293435643-car_front.png', '101293435644-back.png', '351293435645-interior.png');
INSERT INTO `vehicles` VALUES ('104', '16', '87', 'Accord Sedan', '791293436106-car_front.png', '321293436132-back.png', '721293436153-interior.png', '161293436069-car_front.png', '521293436077-back.png', '431293436082-interior.png');
INSERT INTO `vehicles` VALUES ('105', '16', '88', 'Accord Sedan', '21293436334-car_front.png', '211293436351-back.png', '701293436382-interior.png', '201293436297-car_front.png', '171293436298-back.png', '241293436301-interior.png');
INSERT INTO `vehicles` VALUES ('106', '16', '89', 'Accord Sedan', '411293436525-car_front.png', '181293436533-back.png', '231293436541-interior.png', '321293436505-car_front.png', '51293436510-back.png', '741293436511-interior.png');
INSERT INTO `vehicles` VALUES ('107', '16', '90', 'Accord Sedan', '561293450255-car_front.png', '831293450259-back.png', '501293450265-interior.png', '691293450248-car_front.png', '861293450249-back.png', '981293450250-interior.png');
INSERT INTO `vehicles` VALUES ('108', '16', '91', 'Accord Sedan', '271293450434-car_front.png', '721293450438-back.png', '821293450444-interior.png', '661293450411-car_front.png', '151293450413-back.png', '871293450415-interior.png');
INSERT INTO `vehicles` VALUES ('109', '16', '92', 'Accord Sedan', '11293450756-car_front.png', '701293450760-back.png', '291293450767-interior.png', '81293450730-car_front.png', '421293450735-back.png', '451293450737-interior.png');
INSERT INTO `vehicles` VALUES ('110', '16', '93', 'Accord Sedan', '271293450847-car_front.png', '561293450849-back.png', '151293450857-interior.png', '21293450815-car_front.png', '551293450821-car_front.png', '671293450821-interior.png');
INSERT INTO `vehicles` VALUES ('111', '16', '94', 'Accord Sedan', '841293451086-car_front.png', '531293450996-back.png', '771293451094-interior.png', '601293451067-car_front.png', '371293451072-back.png', '21293451076-interior.png');
INSERT INTO `vehicles` VALUES ('112', '16', '95', 'Accord Sedan', '891293451242-car_front.png', '61293451249-back.png', '861293451260-interior.png', '601293451212-car_front.png', '111293451213-back.png', '561293451218-interior.png');
INSERT INTO `vehicles` VALUES ('113', '16', '96', 'Accord Sedan', '291293453167-car_front.png', '61293453175-back.png', '921293453176-interior.png', '751293453154-car_front.png', '221293453158-back.png', '861293453160-interior.png');
INSERT INTO `vehicles` VALUES ('114', '16', '97', 'Accord Sedan', '621293453574-car_front.png', '951293453581-back.png', '931293453588-interior.png', '991293453562-car_front.png', '801293453567-back.png', '551293453568-interior.png');
INSERT INTO `vehicles` VALUES ('115', '16', '98', 'Accord Sedan', '581293513944-car_front.png', '681293513950-back.png', '501293453803-interior.png', '451293513927-car_front.png', '311293513926-back.png', '791293513930-interior.png');
INSERT INTO `vehicles` VALUES ('116', '16', '99', 'Accord Sedan', '881293514148-car_front.png', '761293514160-back.png', '681293514163-interior.png', '391293514126-car_front.png', '591293514125-back.png', '851293514128-interior.png');
INSERT INTO `vehicles` VALUES ('117', '16', '100', 'Accord Sedan', '811293514583-car_front.png', '531293514586-back.png', '191293514601-interior.png', '371293514509-car_front.png', '541293514515-back.png', '501293514571-interior.png');
INSERT INTO `vehicles` VALUES ('118', '16', '101', 'Accord Sedan', '71293514751-car_front.png', '941293514752-back.png', '01293514758-interior.png', '681293514731-car_front.png', '911293514736-back.png', '861293514737-interior.png');
INSERT INTO `vehicles` VALUES ('119', '22', '102', 'Civic coupe', '231293522468-car_front.png', '31293522491-car_back.png', '331293522506-interior.png', '351293522444-car_front.png', '81293522447-car_back.png', '181293522451-interior.png');
INSERT INTO `vehicles` VALUES ('120', '16', '103', 'Accord Sedan', '681293522813-car_front.png', '921293522819-back.png', '951293522829-interior.png', '181293522795-car_front.png', '161293522798-back.png', '771293522796-interior.png');
INSERT INTO `vehicles` VALUES ('121', '16', '104', 'Accord Sedan', '671293523013-car_front.png', '791293523015-back.png', '661293523035-interior.png', '511293522998-car_front.png', '541293522993-back.png', '641293523001-interior.png');
INSERT INTO `vehicles` VALUES ('122', '16', '105', 'Accord Sedan', '81293523189-car_front.png', '41293523190-back.png', '871293523198-interior.png', '581293523166-car_front.png', '121293523172-back.png', '431293523179-interior.png');
INSERT INTO `vehicles` VALUES ('123', '22', '106', 'Civic coupe', '171293523518-car_front.png', '81293523524-car_back.png', '611293525235-interior.png', '811293523494-car_front.png', '431293523498-car_back.png', '361293524618-interior.png');
INSERT INTO `vehicles` VALUES ('124', '16', '107', 'Accord Sedan', '581293524236-car_front.png', '981293524247-back.png', '31293524268-interior.png', '221293524199-car_front.png', '741293524227-back.png', '491293524205-interior.png');
INSERT INTO `vehicles` VALUES ('125', '16', '108', 'Accord Sedan', '661293524625-car_front.png', '571293524618-back.png', '371293524656-interior.png', '271293524583-car_front.png', '421293524600-back.png', '641293524585-interior.png');
INSERT INTO `vehicles` VALUES ('126', '16', '109', 'Accord Sedan', '441293524812-car_front.png', '21293524834-back.png', '911293524850-interior.png', '331293524793-car_front.png', '551293524810-back.png', '131293524799-interior.png');
INSERT INTO `vehicles` VALUES ('127', '22', '110', 'Civic coupe', '661293602979-car_front.png', '791293602985-car_back.png', '751293602989-interior.png', '681293602959-car_front.png', '681293602967-car_back.png', '801293602970-interior.png');
INSERT INTO `vehicles` VALUES ('128', '16', '111', 'Accord Sedan', '821293525672-car_front.png', '341293525678-back.png', '201293525688-interior.png', '931293525652-car_front.png', '621293525657-back.png', '921293525658-interior.png');
INSERT INTO `vehicles` VALUES ('129', '16', '112', 'Accord Sedan', '701293525849-car_front.png', '161293525849-back.png', '61293525863-interior.png', '531293525827-car_front.png', '721293525831-back.png', '561293525831-interior.png');
INSERT INTO `vehicles` VALUES ('130', '16', '113', 'Accord Sedan', '191293526037-car_front.png', '231293526046-back.png', '661293526056-interior.png', '551293526021-car_front.png', '781293526035-back.png', '161293526024-interior.png');
INSERT INTO `vehicles` VALUES ('131', '16', '114', 'Accord Sedan', '351293526389-car_front.png', '381293526396-back.png', '401293526430-interior.png', '611293526369-car_front.png', '631293526377-back.png', '981293526380-interior.png');
INSERT INTO `vehicles` VALUES ('132', '22', '115', 'Civic coupe', '171293603171-car_front.png', '101293603180-car_back.png', '701293603182-interior.png', '221293603154-car_front.png', '191293603156-car_back.png', '211293603161-interior.png');
INSERT INTO `vehicles` VALUES ('133', '16', '116', 'Accord Sedan', '831293526571-car_front.png', '81293526576-back.png', '121293526599-interior.png', '451293526549-car_front.png', '291293526549-back.png', '491293526555-interior.png');
INSERT INTO `vehicles` VALUES ('134', '16', '117', 'Accord Sedan', '921293526719-car_front.png', '231293526730-back.png', '471293526729-interior.png', '441293526709-car_front.png', '231293526709-back.png', '771293526710-interior.png');
INSERT INTO `vehicles` VALUES ('135', '22', '118', 'Civic coupe', '501293603379-car_front.png', '901293603386-car_back.png', '351293603396-interior.png', '61293603363-car_front.png', '171293603366-car_back.png', '971293603371-interior.png');
INSERT INTO `vehicles` VALUES ('136', '22', '119', 'Civic coupe', '961293603563-car_front.png', '41293603565-car_back.png', '31293603570-interior.png', '431293603551-car_front.png', '321293603555-car_back.png', '611293603553-interior.png');
INSERT INTO `vehicles` VALUES ('137', '16', '120', 'Accord Sedan', '891293601439-car_front.png', '151293601439-back.png', '841293601448-interior.png', '831293601421-car_front.png', '321293601422-back.png', '661293601426-interior.png');
INSERT INTO `vehicles` VALUES ('138', '16', '121', 'Accord Sedan', '361293601581-car_front.png', '11293601584-back.png', '731293601597-interior.png', '371293601563-car_front.png', '981293601574-back.png', '771293601571-interior.png');
INSERT INTO `vehicles` VALUES ('139', '16', '122', 'Accord Sedan', '701293601703-car_front.png', '581293601706-back.png', '681293601720-interior.png', '791293601688-car_front.png', '451293601694-back.png', '821293601694-interior.png');
INSERT INTO `vehicles` VALUES ('140', '16', '123', 'Accord Sedan', '761293601830-car_front.png', '661293601834-back.png', '681293601842-interior.png', '961293601813-car_front.png', '651293601817-back.png', '381293601822-interior.png');
INSERT INTO `vehicles` VALUES ('141', '16', '124', 'Accord Sedan', '181293602109-car_front.png', '911293602119-back.png', '781293602145-interior.png', '691293602093-car_front.png', '31293602098-back.png', '931293602099-interior.png');
INSERT INTO `vehicles` VALUES ('142', '16', '125', 'Accord Sedan', '161293602374-car_front.png', '781293602385-back.png', '821293602389-interior.png', '241293602361-car_front.png', '741293602365-back.png', '911293602366-interior.png');
INSERT INTO `vehicles` VALUES ('143', '22', '126', 'civic coupe', '481293603733-car_front.png', '311293603750-car_back.png', '21293603743-interior.png', '141293603714-car_front.png', '361293603717-car_back.png', '581293603719-interior.png');
INSERT INTO `vehicles` VALUES ('144', '16', '127', 'Accord Sedan', '591293602540-car_front.png', '631293602543-back.png', '201293602549-interior.png', '831293602535-car_front.png', '741293602525-back.png', '81293602529-interior.png');
INSERT INTO `vehicles` VALUES ('145', '16', '128', 'Accord Sedan', '121293603633-car_front.png', '41293603654-back.png', '941293603651-interior.png', '481293603615-car_front.png', '621293603616-back.png', '781293603619-interior.png');
INSERT INTO `vehicles` VALUES ('146', '16', '129', 'Accord Sedan', '301293603765-car_front.png', '301293603772-back.png', '821293603778-interior.png', '221293603752-car_front.png', '321293603757-back.png', '711293603757-interior.png');
INSERT INTO `vehicles` VALUES ('147', '16', '130', 'Accord Sedan', '561293603888-car_front.png', '381293603886-back.png', '521293603895-interior.png', '261293603870-car_front.png', '891293603875-back.png', '351293603876-interior.png');
INSERT INTO `vehicles` VALUES ('148', '16', '131', 'Accord Sedan', '851293604034-car_front.png', '71293604035-back.png', '181293604048-interior.png', '271293604015-car_front.png', '231293604022-back.png', '821293604024-interior.png');
INSERT INTO `vehicles` VALUES ('149', '22', '132', 'Civic coupe', '201293604230-car_front.png', '291293604232-car_back.png', '391293604237-interior.png', '41293604218-car_front.png', '891293604219-car_back.png', '661293604219-interior.png');
INSERT INTO `vehicles` VALUES ('150', '16', '133', 'Accord Sedan', '151293604182-car_front.png', '151293604193-back.png', '271293604188-interior.png', '191293604167-car_front.png', '721293604169-back.png', '341293604172-interior.png');
INSERT INTO `vehicles` VALUES ('151', '22', '134', 'Civic coupe  red', '601293605075-car_front.png', '281293605079-car_back.png', '561293605085-interior.png', '91293605059-car_front.png', '251293605064-car_back.png', '281293605063-interior.png');
INSERT INTO `vehicles` VALUES ('152', '22', '135', 'Civic coupe red', '551293605192-car_front.png', '711293605198-car_back.png', '821293605206-interior.png', '901293605172-car_front.png', '481293605177-car_back.png', '421293605180-interior.png');
INSERT INTO `vehicles` VALUES ('153', '22', '136', 'Civic coupe', '371293606702-car_front.png', '421293606704-car_back.png', '381293606715-interior.png', '951293606667-car_front.png', '531293606682-car_back.png', '601293606685-interior.png');
INSERT INTO `vehicles` VALUES ('154', '22', '137', 'Civic coupe', '101293606826-car_front.png', '141293606840-car_back.png', '181293606838-interior.png', '731293606814-car_front.png', '881293606815-car_back.png', '131293606817-interior.png');
INSERT INTO `vehicles` VALUES ('155', '22', '138', 'Civic coupe', '931293607379-car_front.png', '131293607390-car_back.png', '981293607387-interior.png', '301293607362-car_front.png', '21293607364-car_back.png', '441293607368-interior.png');
INSERT INTO `vehicles` VALUES ('156', '22', '139', 'Civic coupe', '801293607480-car_front.png', '421293607490-car_back.png', '541293607493-interior.png', '221293607470-car_front.png', '811293607472-car_back.png', '551293607472-interior.png');
INSERT INTO `vehicles` VALUES ('157', '16', '140', 'Accord Sedan', '771293608060-car_front.png', '711293608058-back.png', '631293608065-interior.png', '891293608050-car_front.png', '321293608046-back.png', '281293608050-interior.png');
INSERT INTO `vehicles` VALUES ('158', '16', '141', 'Accord Sedan', '611293608191-car_front.png', '241293608184-back.png', '371293608195-interior.png', '891293608168-car_front.png', '341293608173-back.png', '561293608171-interior.png');
INSERT INTO `vehicles` VALUES ('159', '16', '142', 'Accord Sedan', '581293608302-car_front.png', '631293608305-back.png', '881293608310-interior.png', '341293608283-car_front.png', '71293608287-back.png', '271293608288-interior.png');
INSERT INTO `vehicles` VALUES ('160', '16', '143', 'Accord Sedan', '321293608415-car_front.png', '941293608421-back.png', '291293608430-interior.png', '531293608400-car_front.png', '671293608434-back.png', '41293608405-interior.png');
INSERT INTO `vehicles` VALUES ('161', '16', '144', 'Accord Sedan', '531293608558-car_front.png', '01293608558-back.png', '321293608579-interior.png', '881293608533-car_front.png', '991293608533-back.png', '331293608538-interior.png');
INSERT INTO `vehicles` VALUES ('162', '16', '145', 'Accord Sedan', '821293608687-car_front.png', '561293608692-back.png', '811293608702-interior.png', '961293608667-car_front.png', '141293608664-back.png', '311293608669-interior.png');
INSERT INTO `vehicles` VALUES ('163', '16', '146', 'Accord Sedan', '831293608815-car_front.png', '411293608818-back.png', '681293608825-interior.png', '701293608800-car_front.png', '831293608811-back.png', '491293608806-interior.png');
INSERT INTO `vehicles` VALUES ('164', '16', '147', 'Accord Sedan', '311293608950-car_front.png', '51293608953-back.png', '191293608961-interior.png', '901293608942-car_front.png', '891293608937-back.png', '731293608941-interior.png');
INSERT INTO `vehicles` VALUES ('165', '16', '148', 'Accord Sedan', '661293609056-car_front.png', '571293609059-back.png', '691293609070-interior.png', '811293609037-car_front.png', '111293609038-back.png', '781293609043-interior.png');
INSERT INTO `vehicles` VALUES ('166', '16', '149', 'Accord Sedan', '91293609288-car_front.png', '191293609297-back.png', '71293609316-interior.png', '201293609271-car_front.png', '181293609272-back.png', '81293609275-interior.png');
INSERT INTO `vehicles` VALUES ('167', '16', '150', 'Accord Sedan', '851293609515-car_front.png', '231293609515-back.png', '501293609527-interior.png', '551293609497-car_front.png', '161293609505-back.png', '151293609499-interior.png');
INSERT INTO `vehicles` VALUES ('168', '16', '151', 'Accord Sedan', '391293609626-car_front.png', '541293609630-back.png', '471293609638-interior.png', '261293609615-car_front.png', '731293609612-back.png', '121293609614-interior.png');
INSERT INTO `vehicles` VALUES ('169', '23', '152', 'Civic coupe', '701293610636-car_front.png', '281293610640-car_back.png', '751293610649-interior.png', '831293610621-car_front.png', '301293610625-car_back.png', '161293610625-interior.png');
INSERT INTO `vehicles` VALUES ('170', '23', '153', 'Civic coupe', '301293610765-car_front.png', '251293610757-car_back.png', '351293610769-interior.png', '301293610750-car_front.png', '941293610747-car_back.png', '141293610751-interior.png');
INSERT INTO `vehicles` VALUES ('171', '23', '154', 'Civic coupe', '271293610861-car_front.png', '551293610863-car_back.png', '751293610870-interior.png', '61293610844-car_front.png', '811293610848-car_back.png', '491293610854-interior.png');
INSERT INTO `vehicles` VALUES ('172', '23', '155', 'Civic coupe', '181293612275-car_front.png', '461293612278-car_back.png', '41293612287-interior.png', '91293612261-car_front.png', '461293612265-car_back.png', '741293612266-interior.png');
INSERT INTO `vehicles` VALUES ('173', '23', '156', 'Civic coupe', '861293612572-car_front.png', '871293612585-car_back.png', '481293612592-interior.png', '321293612548-car_front.png', '291293612552-car_back.png', '931293612554-interior.png');
INSERT INTO `vehicles` VALUES ('174', '23', '157', 'Civic coupe', '71293612697-car_front.png', '181293612705-car_back.png', '11293612712-interior.png', '421293612685-car_front.png', '231293612686-car_back.png', '121293612687-interior.png');
INSERT INTO `vehicles` VALUES ('175', '23', '158', 'Civic coupe', '981293618269-car_front.png', '621293618273-car_back.png', '651293618281-interior.png', '611293618245-car_front.png', '341293618270-car_back.png', '471293618251-interior.png');
INSERT INTO `vehicles` VALUES ('176', '23', '159', 'Civic coupe', '471293618436-car_front.png', '131293618447-car_back.png', '61293618498-interior.png', '791293618417-car_front.png', '211293618419-car_back.png', '461293618425-interior.png');
INSERT INTO `vehicles` VALUES ('177', '23', '160', 'Civic coupe', '921293618686-car_front.png', '191293618692-car_back.png', '661293618706-interior.png', '631293618677-car_front.png', '881293618676-car_back.png', '81293618713-interior.png');
INSERT INTO `vehicles` VALUES ('178', '23', '161', 'Civic coupe', '61293621236-car_front.png', '711293621249-car_back.png', '121293621249-interior.png', '481293621226-car_front.png', '21293621228-car_back.png', '611293621231-interior.png');
INSERT INTO `vehicles` VALUES ('179', '16', '162', 'Accord Sedan', '931293621693-car_front.png', '911293621698-back.png', '351293621702-interior.png', '121293621680-car_front.png', '31293621684-back.png', '481293621685-interior.png');
INSERT INTO `vehicles` VALUES ('180', '23', '163', 'Civic coupe', '681293621755-car_front.png', '971293621764-car_back.png', '411293621777-interior.png', '691293621734-car_front.png', '731293621737-car_back.png', '41293621746-interior.png');
INSERT INTO `vehicles` VALUES ('181', '16', '164', 'Accord Sedan', '981293621849-car_front.png', '571293621852-back.png', '281293621861-interior.png', '671293621838-car_front.png', '71293621843-back.png', '161293621844-interior.png');
INSERT INTO `vehicles` VALUES ('182', '23', '165', 'Civic coupe', '221293621908-car_front.png', '821293621910-car_back.png', '611293621919-interior.png', '811293621894-car_front.png', '501293621894-car_back.png', '971293621899-interior.png');
INSERT INTO `vehicles` VALUES ('183', '16', '166', 'Accord Sedan', '211293621989-car_front.png', '691293621996-back.png', '941293622000-interior.png', '681293621976-car_front.png', '91293621981-back.png', '191293621982-interior.png');
INSERT INTO `vehicles` VALUES ('184', '16', '167', 'Accord Sedan', '651293622118-car_front.png', '931293622123-back.png', '781293622129-interior.png', '251293622111-car_front.png', '571293622109-back.png', '771293622112-interior.png');
INSERT INTO `vehicles` VALUES ('185', '16', '168', 'Accord Sedan', '371293622240-car_front.png', '551293622238-back.png', '131293622247-interior.png', '31293622216-car_front.png', '901293622220-back.png', '681293622219-interior.png');
INSERT INTO `vehicles` VALUES ('186', '16', '169', 'Accord Sedan', '191293622360-car_front.png', '811293622364-back.png', '731293622375-interior.png', '791293622350-car_front.png', '41293622349-back.png', '701293622353-interior.png');
INSERT INTO `vehicles` VALUES ('187', '16', '170', 'Accord Sedan', '271293622513-car_front.png', '851293622529-back.png', '61293622526-interior.png', '491293622494-car_front.png', '631293622498-back.png', '671293622510-interior.png');
INSERT INTO `vehicles` VALUES ('188', '16', '171', 'Accord Sedan', '591293622685-car_front.png', '511293622690-back.png', '881293622703-interior.png', '601293622659-car_front.png', '961293622665-back.png', '411293622670-interior.png');
INSERT INTO `vehicles` VALUES ('189', '16', '172', 'Accord Sedan', '111293622816-car_front.png', '461293622827-back.png', '391293622843-interior.png', '631293622799-car_front.png', '891293622809-back.png', '701293622807-interior.png');
INSERT INTO `vehicles` VALUES ('190', '16', '173', 'Accord Sedan', '181293623055-car_front.png', '141293623057-back.png', '211293623064-interior.png', '41293623031-car_front.png', '411293623037-back.png', '201293623048-interior.png');
INSERT INTO `vehicles` VALUES ('191', '23', '174', 'Civic coupe', '221293623411-car_front.png', '421293623419-car_back.png', '421293623428-interior.png', '141293623369-car_front.png', '491293623368-car_back.png', '441293623375-interior.png');
INSERT INTO `vehicles` VALUES ('192', '23', '175', 'Civic coupe', '171293623551-car_front.png', '591293623557-car_back.png', '941293623563-interior.png', '891293623541-car_front.png', '671293623541-car_back.png', '241293623544-interior.png');
INSERT INTO `vehicles` VALUES ('193', '16', '176', 'Accord Sedan', '751293623672-car_front.png', '111293623680-back.png', '691293623695-interior.png', '461293623659-car_front.png', '11293623663-back.png', '71293623668-interior.png');
INSERT INTO `vehicles` VALUES ('194', '16', '177', 'Accord Sedan', '61293623869-car_front.png', '881293623874-back.png', '171293623879-interior.png', '671293623849-car_front.png', '531293623853-back.png', '561293623854-interior.png');
INSERT INTO `vehicles` VALUES ('195', '23', '178', 'Civic coupe', '811293688808-car_front.png', '51293688808-car_back.png', '771293688815-interior.png', '241293688798-car_front.png', '131293688798-car_back.png', '711293688802-interior.png');
INSERT INTO `vehicles` VALUES ('196', '23', '179', 'Civic coupe', '331293688951-car_front.png', '71293688954-car_back.png', '521293688963-interior.png', '391293688940-car_front.png', '811293688944-car_back.png', '821293688945-interior.png');
INSERT INTO `vehicles` VALUES ('197', '23', '180', 'Civic coupe', '431293689051-car_front.png', '821293689057-car_back.png', '401293689065-interior.png', '571293689039-car_front.png', '841293689043-car_back.png', '571293689044-interior.png');
INSERT INTO `vehicles` VALUES ('198', '23', '181', 'Civic coupe', '101293689169-car_front.png', '791293689175-car_back.png', '811293689176-interior.png', '601293689155-car_front.png', '781293689159-car_back.png', '381293689160-interior.png');
INSERT INTO `vehicles` VALUES ('199', '23', '182', 'Civic coupe', '31293689284-car_front.png', '261293689271-car_back.png', '121293689289-interior.png', '411293689260-car_front.png', '151293689264-car_back.png', '641293689264-interior.png');
INSERT INTO `vehicles` VALUES ('200', '23', '183', 'Civic coupe', '681293689729-car_front.png', '671293689731-car_back.png', '641293689739-interior.png', '821293689712-car_front.png', '41293689716-car_back.png', '161293689716-interior.png');
INSERT INTO `vehicles` VALUES ('201', '23', '184', 'Civic coupe', '11293689910-car_front.png', '461293689868-car_back.png', '51293689874-interior.png', '241293689816-car_front.png', '171293689820-car_back.png', '951293689820-interior.png');
INSERT INTO `vehicles` VALUES ('202', '16', '185', 'Accord Sedan', '231293691914-car_front.png', '411293691913-back.png', '981293691922-interior.png', '911293691896-car_front.png', '551293691903-back.png', '901293691903-interior.png');
INSERT INTO `vehicles` VALUES ('203', '16', '186', 'Accord Sedan', '751293692028-car_front.png', '731293692034-back.png', '01293692048-interior.png', '11293692015-car_front.png', '821293692020-back.png', '761293692021-interior.png');
INSERT INTO `vehicles` VALUES ('204', '16', '187', 'Accord Sedan', '751293692518-car_front.png', '201293692520-back.png', '461293692530-interior.png', '631293692469-car_front.png', '431293692471-back.png', '971293692508-interior.png');
INSERT INTO `vehicles` VALUES ('205', '16', '188', 'Accord Sedan', '511293692907-car_front.png', '961293692915-back.png', '621293692920-interior.png', '91293692874-car_front.png', '101293692896-back.png', '241293692899-interior.png');
INSERT INTO `vehicles` VALUES ('206', '16', '189', 'Accord Sedan', '591293693153-car_front.png', '831293693156-back.png', '231293693162-interior.png', '501293693136-car_front.png', '701293693147-back.png', '81293693150-interior.png');
INSERT INTO `vehicles` VALUES ('207', '16', '190', 'Accord Sedan', '351293693558-car_front.png', '601293693562-back.png', '721293693566-interior.png', '71293693536-car_front.png', '151293693541-back.png', '421293693541-interior.png');
INSERT INTO `vehicles` VALUES ('208', '16', '191', 'Accord Sedan', '911293693704-car_front.png', '631293693707-back.png', '991293693713-interior.png', '241293693692-car_front.png', '711293693696-back.png', '251293693697-interior.png');
INSERT INTO `vehicles` VALUES ('209', '16', '192', 'Accord Sedan', '861293693837-car_front.png', '951293693841-back.png', '481293693852-interior.png', '761293693822-car_front.png', '51293693823-back.png', '211293693825-interior.png');
INSERT INTO `vehicles` VALUES ('210', '16', '193', 'Accord Sedan', '81293693970-car_front.png', '591293693968-back.png', '21293693981-interior.png', '331293693956-car_front.png', '441293693953-back.png', '31293693958-interior.png');
INSERT INTO `vehicles` VALUES ('211', '16', '194', 'Accord Sedan', '311293694334-car_front.png', '41293694342-back.png', '521293694352-interior.png', '711293694320-car_front.png', '911293694324-back.png', '291293694325-interior.png');
INSERT INTO `vehicles` VALUES ('212', '16', '195', 'Accord Sedan', '151293694626-car_front.png', '271293694633-back.png', '31293694635-interior.png', '511293694613-car_front.png', '471293694617-back.png', '201293694618-interior.png');
INSERT INTO `vehicles` VALUES ('213', '24', '196', 'Civic coupe', '41293694901-car_front.png', '601293694905-car_back.png', '01293694911-interior.png', '351293694887-car_front.png', '381293694890-car_back.png', '201293694889-interior.png');
INSERT INTO `vehicles` VALUES ('214', '16', '197', 'Accord Sedan', '721293694881-car_front.png', '411293694894-back.png', '321293694910-Interior.png', '31293694865-car_front.png', '371293694869-back.png', '41293694871-interior.png');
INSERT INTO `vehicles` VALUES ('215', '24', '198', 'Civic coupe', '651293694991-car_front.png', '611293694996-car_back.png', '11293694996-interior.png', '11293694980-car_front.png', '951293694982-car_back.png', '221293694984-interior.png');
INSERT INTO `vehicles` VALUES ('216', '24', '199', 'Civic coupe', '491293695084-car_front.png', '831293695091-car_back.png', '231293695095-interior.png', '431293695072-car_front.png', '91293695073-car_back.png', '511293695075-interior.png');
INSERT INTO `vehicles` VALUES ('217', '24', '200', 'Civic coupe', '681293695181-car_front.png', '791293695193-car_back.png', '291293695188-interior.png', '201293695168-car_front.png', '191293695169-car_back.png', '461293695171-interior.png');
INSERT INTO `vehicles` VALUES ('218', '24', '201', 'Civic coupe', '921293695292-car_front.png', '11293695295-car_back.png', '561293695302-interior.png', '101293695283-car_front.png', '161293695288-car_back.png', '171293695287-interior.png');
INSERT INTO `vehicles` VALUES ('219', '24', '202', 'Civic coupe', '681293695505-car_front.png', '811293695507-car_back.png', '711293695512-interior.png', '291293695494-car_front.png', '701293695498-car_back.png', '991293695499-interior.png');
INSERT INTO `vehicles` VALUES ('220', '24', '203', 'Civic coupe', '791293695604-car_front.png', '301293695608-car_back.png', '841293695615-interior.png', '821293695591-car_front.png', '431293695597-car_back.png', '471293695596-interior.png');
INSERT INTO `vehicles` VALUES ('221', '24', '204', 'Civic coupe', '101293695697-car_front.png', '681293695702-car_back.png', '121293695711-interior.png', '31293695686-car_front.png', '791293695689-car_back.png', '521293695690-interior.png');
INSERT INTO `vehicles` VALUES ('222', '24', '205', 'Civic coupe', '801293695791-car_front.png', '541293695790-car_back.png', '211293695795-interior.png', '171293695779-car_front.png', '351293695782-car_back.png', '791293695783-interior.png');
INSERT INTO `vehicles` VALUES ('223', '24', '206', 'Civic coupe', '851293695868-car_front.png', '641293695873-car_back.png', '551293695878-interior.png', '841293695859-car_front.png', '951293695862-car_back.png', '161293695863-interior.png');
INSERT INTO `vehicles` VALUES ('224', '24', '207', 'Civic coupe', '991293695953-car_front.png', '721293695955-car_back.png', '541293695959-interior.png', '741293695946-car_front.png', '361293695946-car_back.png', '981293695950-interior.png');
INSERT INTO `vehicles` VALUES ('225', '24', '208', 'Civic coupe', '301293696035-car_front.png', '701293696039-car_back.png', '861293696046-interior.png', '431293696026-car_front.png', '741293696030-car_back.png', '931293696032-interior.png');
INSERT INTO `vehicles` VALUES ('226', '24', '209', 'Civic coupe', '181293696127-car_front.png', '11293696131-car_back.png', '201293696134-interior.png', '961293696115-car_front.png', '731293696118-car_back.png', '951293696122-interior.png');
INSERT INTO `vehicles` VALUES ('227', '24', '210', 'Civic coupe', '561293696225-car_front.png', '341293696232-car_back.png', '601293696242-interior.png', '801293696211-car_front.png', '71293696215-car_back.png', '311293696216-interior.png');
INSERT INTO `vehicles` VALUES ('228', '24', '211', 'Civic coupe', '161293696313-car_front.png', '561293696323-car_back.png', '181293696323-interior.png', '291293696307-car_front.png', '201293696307-car_back.png', '501293696310-interior.png');
INSERT INTO `vehicles` VALUES ('229', '24', '212', 'Civic coupe', '961293696432-car_front.png', '681293696436-car_back.png', '591293696440-interior.png', '761293696419-car_front.png', '431293696422-car_back.png', '961293696423-interior.png');
INSERT INTO `vehicles` VALUES ('230', '16', '213', 'Accord Sedan', '681293703570-car_front.png', '261293703575-back.png', '11293703578-interior.png', '691293703550-car_front.png', '291293703554-back.png', '671293703555-interior.png');
INSERT INTO `vehicles` VALUES ('231', '16', '214', 'Accord Sedan', '681293703748-car_front.png', '781293703747-back.png', '141293703753-interior.png', '891293703735-car_front.png', '701293703734-back.png', '231293703735-interior.png');
INSERT INTO `vehicles` VALUES ('232', '16', '215', 'Accord Sedan', '141293703871-car_front.png', '01293703867-back.png', '81293703878-interior.png', '451293703849-car_front.png', '871293703853-back.png', '11293703854-interior.png');
INSERT INTO `vehicles` VALUES ('233', '16', '216', 'Accord Sedan', '221293703991-car_front.png', '861293703991-back.png', '891293703997-interior.png', '11293703971-car_front.png', '441293703974-back.png', '691293703975-interior.png');
INSERT INTO `vehicles` VALUES ('234', '16', '217', 'Accord Sedan', '811293704093-car_front.png', '831293704101-back.png', '901293704103-interior.png', '81293704078-car_front.png', '811293704079-back.png', '51293704082-interior.png');
INSERT INTO `vehicles` VALUES ('235', '16', '218', 'Accord Sedan', '891293704203-car_front.png', '741293704215-back.png', '341293704209-interior.png', '381293704193-car_front.png', '511293704193-back.png', '261293704195-interior.png');
INSERT INTO `vehicles` VALUES ('236', '16', '219', 'Accord Sedan', '21293704319-car_front.png', '411293704324-back.png', '61293704329-interior.png', '231293704306-car_front.png', '631293704311-back.png', '511293704311-interior.png');
INSERT INTO `vehicles` VALUES ('237', '16', '220', 'Accord Sedan', '241293704440-car_front.png', '191293704446-back.png', '201293704453-interior.png', '711293704428-car_front.png', '521293704432-back.png', '911293704433-interior.png');
INSERT INTO `vehicles` VALUES ('238', '16', '221', 'Accord Sedan', '231293704564-car_front.png', '881293704568-back.png', '781293704578-interior.png', '191293704547-car_front.png', '401293704548-back.png', '151293704555-interior.png');
INSERT INTO `vehicles` VALUES ('239', '16', '222', 'Accord Sedan', '771293704685-car_front.png', '451293704692-back.png', '51293704696-interior.png', '841293704672-car_front.png', '641293704678-back.png', '431293704684-interior.png');
INSERT INTO `vehicles` VALUES ('240', '16', '223', 'Accord Sedan', '331293704802-car_front.png', '901293704810-back.png', '491293704810-interior.png', '571293704790-car_front.png', '111293704792-back.png', '271293704794-interior.png');
INSERT INTO `vehicles` VALUES ('241', '16', '224', 'Accord sedan', '271293704939-car_front.png', '361293704942-back.png', '371293704947-interior.png', '731293704923-car_front.png', '361293704927-back.png', '321293704933-interior.png');
INSERT INTO `vehicles` VALUES ('242', '24', '225', 'Civic coupe', '111293705991-car_front.png', '481293705990-car_back.png', '241293705998-interior.png', '221293705975-car_front.png', '701293705974-car_back.png', '281293705978-interior.png');
INSERT INTO `vehicles` VALUES ('243', '24', '226', 'Civic coupe', '941293706087-car_front.png', '301293706094-car_back.png', '801293706100-interior.png', '401293706076-car_front.png', '261293706078-car_back.png', '131293706080-interior.png');
INSERT INTO `vehicles` VALUES ('244', '24', '227', 'Civic coupe', '961293706193-car_front.png', '771293706210-car_back.png', '591293706209-interior.png', '391293706182-car_front.png', '711293706187-car_back.png', '521293706184-interior.png');
INSERT INTO `vehicles` VALUES ('245', '24', '228', 'Civic coupe', '751293706310-car_front.png', '131293706295-car_back.png', '211293706310-interior.png', '111293706279-car_front.png', '161293706284-car_back.png', '251293706284-interior.png');
INSERT INTO `vehicles` VALUES ('246', '24', '229', 'Civic coupe', '741293706400-car_front.png', '551293706405-car_back.png', '861293706411-interior.png', '781293706385-car_front.png', '841293706387-car_back.png', '611293706390-interior.png');
INSERT INTO `vehicles` VALUES ('247', '24', '230', 'Civic coupe', '21293706497-car_front.png', '671293706506-car_back.png', '601293706514-interior.png', '161293706483-car_front.png', '61293706488-car_back.png', '61293706495-interior.png');
INSERT INTO `vehicles` VALUES ('248', '24', '231', 'Civic coupe', '61293706603-car_front.png', '821293706615-car_back.png', '271293706617-interior.png', '411293706590-car_front.png', '81293706594-car_back.png', '641293706595-interior.png');
INSERT INTO `vehicles` VALUES ('249', '24', '232', 'Civic coupe', '421293706704-car_front.png', '361293706714-car_back.png', '451293706713-interior.png', '781293706682-car_front.png', '461293706686-car_back.png', '131293706693-interior.png');
INSERT INTO `vehicles` VALUES ('250', '24', '233', 'Civic coupe', '381293706842-car_front.png', '941293706847-car_back.png', '131293706860-interior.png', '531293706827-car_front.png', '881293706830-car_back.png', '481293706834-interior.png');
INSERT INTO `vehicles` VALUES ('251', '24', '234', 'Civic coupe', '61293706955-car_front.png', '861293706958-car_back.png', '621293706965-interior.png', '431293706945-car_front.png', '741293706948-car_back.png', '601293706949-interior.png');
INSERT INTO `vehicles` VALUES ('252', '24', '235', 'Civic coupe', '861293707506-car_front.png', '401293707510-car_back.png', '991293707516-interior.png', '561293707496-car_front.png', '901293707500-car_back.png', '501293707501-interior.png');
INSERT INTO `vehicles` VALUES ('253', '24', '236', 'Civic coupe', '121293707621-car_front.png', '541293707626-car_back.png', '51293707638-interior.png', '171293707611-car_front.png', '481293707614-car_back.png', '381293707616-interior.png');
INSERT INTO `vehicles` VALUES ('254', '25', '237', 'Civic coupe', '741293710985-car_front.png', '451293710991-car_back.png', '121293710996-interior.png', '61293710974-car_front.png', '691293710985-car_back.png', '191293710976-interior.png');
INSERT INTO `vehicles` VALUES ('255', '25', '238', 'Civic coupe', '991293711090-car_front.png', '251293711088-car_back.png', '461293711095-interior.png', '591293711075-car_front.png', '691293711078-car_back.png', '821293711079-interior.png');
INSERT INTO `vehicles` VALUES ('256', '25', '239', 'Civic coupe', '31293711177-car_front.png', '981293711178-car_back.png', '231293711185-interior.png', '961293711161-car_front.png', '181293711167-car_back.png', '411293711168-interior.png');
INSERT INTO `vehicles` VALUES ('257', '25', '240', 'Civic coupe', '551293711297-car_front.png', '21293711279-car_back.png', '571293711289-interior.png', '91293711260-car_front.png', '961293711264-car_back.png', '241293711264-interior.png');
INSERT INTO `vehicles` VALUES ('258', '25', '241', 'Civic coupe', '581293711410-car_front.png', '181293711421-car_back.png', '471293711433-interior.png', '661293711400-car_front.png', '631293711395-car_back.png', '981293711396-interior.png');
INSERT INTO `vehicles` VALUES ('259', '25', '242', 'Civic coupe', '671293711524-car_front.png', '641293711524-car_back.png', '371293711529-interior.png', '381293711510-car_front.png', '501293711517-car_back.png', '991293711518-interior.png');
INSERT INTO `vehicles` VALUES ('260', '25', '243', 'civic coupe', '371293711844-car_front.png', '991293711847-car_back.png', '171293711855-interior.png', '941293711833-car_front.png', '791293711837-car_back.png', '711293711838-interior.png');
INSERT INTO `vehicles` VALUES ('261', '25', '244', 'Civic coupe', '331293711941-car_front.png', '431293711942-car_back.png', '751293711954-interior.png', '731293711926-car_front.png', '721293711930-car_back.png', '401293711933-interior.png');
INSERT INTO `vehicles` VALUES ('262', '16', '245', 'Accord Sedan', '401293712655-car_front.png', '61293712668-back.png', '211293712693-interior.png', '81293712640-car_front.png', '511293712642-back.png', '421293712643-interior.png');
INSERT INTO `vehicles` VALUES ('263', '16', '246', 'Accord Sedan', '391293713172-car_front.png', '301293713172-back.png', '151293713179-interior.png', '251293713128-car_front.png', '41293713144-back.png', '321293713135-interior.png');
INSERT INTO `vehicles` VALUES ('264', '16', '247', 'Accord Sedan', '661293713369-car_front.png', '721293713376-back.png', '811293713375-interior.png', '171293713352-car_front.png', '511293713356-back.png', '101293713360-interior.png');
INSERT INTO `vehicles` VALUES ('265', '16', '248', 'Accord Sedan', '241293713713-car_front.png', '381293713719-back.png', '651293713726-interior.png', '241293713697-car_front.png', '941293713701-back.png', '221293713703-interior.png');
INSERT INTO `vehicles` VALUES ('266', '16', '249', 'Accord Sedan', '971293713891-car_front.png', '951293713894-back.png', '491293713907-interior.png', '371293713875-car_front.png', '951293713876-back.png', '211293713877-interior.png');
INSERT INTO `vehicles` VALUES ('267', '16', '250', 'Accord Sedan', '841293714023-car_front.png', '381293714027-back.png', '511293714031-interior.png', '311293714008-car_front.png', '841293714009-back.png', '51293714012-interior.png');
INSERT INTO `vehicles` VALUES ('268', '25', '251', 'Civic coupe', '491293714277-car_front.png', '471293714275-car_back.png', '511293714283-interior.png', '511293714262-car_front.png', '791293714265-car_back.png', '151293714266-interior.png');
INSERT INTO `vehicles` VALUES ('269', '25', '252', 'Civic coupe', '171293714469-car_front.png', '391293714475-car_back.png', '331293714483-interior.png', '951293714460-car_front.png', '251293714463-car_back.png', '481293714464-interior.png');
INSERT INTO `vehicles` VALUES ('270', '25', '253', 'Civic coupe', '891293714562-car_front.png', '651293714568-car_back.png', '111293714584-interior.png', '531293714551-car_front.png', '201293714554-car_back.png', '701293714556-interior.png');
INSERT INTO `vehicles` VALUES ('271', '25', '254', 'Civic coupe', '731293714672-car_front.png', '81293714671-car_back.png', '701293714677-interior.png', '481293714663-car_front.png', '321293714666-car_back.png', '591293714664-interior.png');
INSERT INTO `vehicles` VALUES ('272', '25', '255', 'Civic coupe', '261293714854-car_front.png', '861293714858-car_back.png', '681293714865-interior.png', '221293714841-car_front.png', '421293714845-car_back.png', '551293714848-interior.png');
INSERT INTO `vehicles` VALUES ('273', '25', '256', 'Civic coupe', '371293714948-car_front.png', '331293714951-car_back.png', '931293714956-interior.png', '911293714936-car_front.png', '341293714940-car_back.png', '621293714941-interior.png');
INSERT INTO `vehicles` VALUES ('274', '25', '257', 'Civic coupe', '71293715046-car_front.png', '631293715050-car_back.png', '531293715054-interior.png', '231293715034-car_front.png', '961293715038-car_back.png', '781293715039-interior.png');
INSERT INTO `vehicles` VALUES ('275', '25', '258', 'Civic coupe', '821293715138-car_front.png', '521293715145-car_back.png', '231293715145-interior.png', '471293715127-car_front.png', '481293715131-car_back.png', '11293715132-interior.png');
INSERT INTO `vehicles` VALUES ('276', '25', '259', 'Civic coupe', '461294032103-car_front.png', '791294032099-car_back.png', '551294032109-interior.png', '971294032076-car_front.png', '391294032080-car_back.png', '231294032081-interior.png');
INSERT INTO `vehicles` VALUES ('277', '25', '260', 'Civic coupe', '491294032219-car_front.png', '941294032228-car_back.png', '101294032234-interior.png', '361294032206-car_front.png', '561294032207-car_back.png', '161294032210-interior.png');
INSERT INTO `vehicles` VALUES ('278', '25', '261', 'Civic coupe', '541294032343-car_front.png', '231294032347-car_back.png', '421294032351-interior.png', '641294032329-car_front.png', '471294032337-car_back.png', '861294032339-interior.png');
INSERT INTO `vehicles` VALUES ('279', '25', '262', 'Civic coupe', '461294032438-car_front.png', '631294032444-car_back.png', '861294032444-interior.png', '941294032425-car_front.png', '831294032429-car_back.png', '331294032430-interior.png');
INSERT INTO `vehicles` VALUES ('280', '16', '263', 'Accord Sedan', '401294033509-car_front.png', '841294033515-back.png', '451294033527-interior.png', '951294033490-car_front.png', '961294033492-back.png', '411294033494-interior.png');
INSERT INTO `vehicles` VALUES ('281', '16', '264', 'Accord Sedan', '111294033822-car_front.png', '911294033826-back.png', '801294033841-interior.png', '811294033807-car_front.png', '151294033815-back.png', '611294033820-interior.png');
INSERT INTO `vehicles` VALUES ('282', '16', '265', 'Accord Sedan', '111294033999-car_front.png', '481294034004-back.png', '81294034009-interior.png', '641294033985-car_front.png', '851294033989-back.png', '491294033992-interior.png');
INSERT INTO `vehicles` VALUES ('283', '16', '266', 'Accord Sedan', '61294034188-car_front.png', '321294034191-back.png', '341294034204-interior.png', '641294034160-car_front.png', '951294034161-back.png', '141294034165-interior.png');
INSERT INTO `vehicles` VALUES ('284', '16', '267', 'Accord Sedan', '51294034342-car_front.png', '851294034353-back.png', '11294034350-interior.png', '761294034330-car_front.png', '911294034334-back.png', '481294034334-interior.png');
INSERT INTO `vehicles` VALUES ('285', '16', '268', 'Accord Sedan', '431294034475-car_front.png', '381294034481-back.png', '151294034484-interior.png', '341294034466-car_front.png', '541294034465-back.png', '831294034468-interior.png');
INSERT INTO `vehicles` VALUES ('286', '25', '269', 'Civic coupe', '841294036430-car_front.png', '691294036436-car_back.png', '81294036443-interior.png', '971294036377-car_front.png', '841294036389-car_back.png', '921294036399-interior.png');
INSERT INTO `vehicles` VALUES ('287', '25', '270', 'Civic coupe', '431294049453-car_front.png', '681294049466-car_back.png', '321294049501-interior.png', '461294049391-car_front.png', '21294049389-car_back.png', '571294049393-interior.png');
INSERT INTO `vehicles` VALUES ('288', '16', '271', 'Accord Sedan', '701294050130-car_front.png', '581294050125-back.png', '841294050134-interior.png', '491294050097-car_front.png', '141294050107-back.png', '331294050107-interior.png');
INSERT INTO `vehicles` VALUES ('289', '16', '272', 'Accord Sedan', '161294050367-car_front.png', '761294050379-back.png', '881294050386-interior.png', '451294050343-car_front.png', '631294050347-back.png', '391294050349-interior.png');
INSERT INTO `vehicles` VALUES ('290', '16', '273', 'Accord Sedan', '841294050809-car_front.png', '81294050856-back.png', '171294050862-interior.png', '661294050771-car_front.png', '361294050775-back.png', '311294050789-interior.png');
INSERT INTO `vehicles` VALUES ('291', '16', '274', 'Accord Sedan', '531294051930-car_front.png', '731294051936-back.png', '411294051944-interior.png', '781294051830-car_front.png', '741294051834-back.png', '681294051835-interior.png');
INSERT INTO `vehicles` VALUES ('292', '25', '275', 'Civic coupe', '661294052055-car_front.png', '581294052060-car_back.png', '301294052085-interior.png', '921294051958-car_front.png', '431294051982-car_back.png', '191294052000-interior.png');
INSERT INTO `vehicles` VALUES ('293', '25', '276', 'Civic coupe', '821294053562-car_front.png', '931294053578-car_back.png', '91294053604-interior.png', '821294053547-car_front.png', '591294053553-car_back.png', '321294053556-interior.png');
INSERT INTO `vehicles` VALUES ('294', '16', '277', 'Accord Sedan', '741294054295-car_front.png', '511294054305-back.png', '411294054326-interior.png', '61294054257-car_front.png', '251294054265-back.png', '831294054270-interior.png');
INSERT INTO `vehicles` VALUES ('295', '25', '278', 'Civic coupe', '541294054867-car_front.png', '131294054873-car_back.png', '781294054888-interior.png', '671294054854-car_front.png', '231294054856-car_back.png', '181294054862-interior.png');
INSERT INTO `vehicles` VALUES ('296', '16', '279', 'Accord Sedan', '871294054891-car_front.png', '731294054886-back.png', '431294054895-interior.png', '371294054862-car_front.png', '421294054867-back.png', '721294054868-interior.png');
INSERT INTO `vehicles` VALUES ('297', '25', '280', 'Civic coupe', '401294055073-car_front.png', '101294055078-car_back.png', '491294055098-interior.png', '651294055064-car_front.png', '801294055067-car_back.png', '401294055070-interior.png');
INSERT INTO `vehicles` VALUES ('298', '25', '281', 'Civic coupe', '711294055259-car_front.png', '61294055271-car_back.png', '941294055280-interior.png', '241294055248-car_front.png', '321294055249-car_back.png', '241294055253-interior.png');
INSERT INTO `vehicles` VALUES ('299', '25', '282', 'Civic coupe', '391294055416-car_front.png', '981294055420-car_back.png', '781294055425-interior.png', '151294055405-car_front.png', '361294055406-car_back.png', '641294055411-interior.png');
INSERT INTO `vehicles` VALUES ('300', '16', '283', 'Accord Sedan', '471294055513-car_front.png', '321294055490-back.png', '601294055540-interior.png', '421294055446-car_front.png', '291294055451-back.png', '181294055455-interior.png');
INSERT INTO `vehicles` VALUES ('301', '26', '284', 'Civic coupe', '241294055603-car_front.png', '311294055606-car_back.png', '341294055611-interior.png', '931294055577-car_front.png', '821294055584-car_back.png', '851294055588-interior.png');
INSERT INTO `vehicles` VALUES ('302', '16', '285', 'Accord Sedan', '961294055715-car_front.png', '301294055736-back.png', '571294055737-interior.png', '681294055677-car_front.png', '371294055683-back.png', '681294055689-interior.png');
INSERT INTO `vehicles` VALUES ('303', '26', '286', 'Civic coupe', '91294058071-car_front.png', '551294058075-car_back.png', '211294058085-interior.png', '131294058061-car_front.png', '71294058060-car_back.png', '261294058066-interior.png');
INSERT INTO `vehicles` VALUES ('304', '26', '287', 'Civic coupe', '471294058944-car_front.png', '581294058948-car_back.png', '511294058958-interior.png', '71294058925-car_front.png', '91294058931-car_back.png', '381294058935-interior.png');
INSERT INTO `vehicles` VALUES ('305', '26', '288', 'Civic coupe', '631294059119-car_front.png', '111294059127-car_back.png', '651294059133-interior.png', '141294059104-car_front.png', '271294059119-car_back.png', '471294059106-interior.png');
INSERT INTO `vehicles` VALUES ('306', '26', '289', 'Civic coupe', '491294059440-car_front.png', '321294059443-car_back.png', '01294059449-interior.png', '821294059424-car_front.png', '141294059429-car_back.png', '711294059432-interior.png');
INSERT INTO `vehicles` VALUES ('307', '26', '290', 'Civic coupe', '101294060272-car_front.png', '791294060277-car_back.png', '841294060285-interior.png', '941294060256-car_front.png', '811294060263-car_back.png', '21294060266-interior.png');
INSERT INTO `vehicles` VALUES ('308', '26', '291', 'Civic coupe', '681294060403-car_front.png', '181294060407-car_back.png', '981294060413-interior.png', '901294060391-car_front.png', '211294060394-car_back.png', '361294060399-interior.png');
INSERT INTO `vehicles` VALUES ('309', '26', '292', 'Civic coupe', '811294060627-car_front.png', '31294060631-car_back.png', '301294060637-interior.png', '11294060612-car_front.png', '341294060615-car_back.png', '11294060621-interior.png');
INSERT INTO `vehicles` VALUES ('310', '26', '293', 'Civic coupe', '01294060727-car_front.png', '391294060729-car_back.png', '131294060734-interior.png', '681294060714-car_front.png', '871294060716-car_back.png', '901294060722-interior.png');
INSERT INTO `vehicles` VALUES ('311', '26', '294', 'Civic coupe', '961294060862-car_front.png', '31294060866-car_back.png', '521294060873-interior.png', '881294060850-car_front.png', '181294060854-car_back.png', '461294060856-interior.png');
INSERT INTO `vehicles` VALUES ('312', '26', '295', 'Civic coupe', '771294060971-car_front.png', '951294060977-car_back.png', '501294060980-interior.png', '381294060958-car_front.png', '551294060962-car_back.png', '361294060964-interior.png');
INSERT INTO `vehicles` VALUES ('313', '26', '296', 'Civic coupe', '201294061094-car_front.png', '641294061096-car_back.png', '831294061099-interior.png', '751294061081-car_front.png', '231294061085-car_back.png', '191294061087-interior.png');
INSERT INTO `vehicles` VALUES ('314', '26', '297', 'Civic coupe', '471294061195-car_front.png', '101294061199-car_back.png', '221294061203-interior.png', '201294061184-car_front.png', '251294061188-car_back.png', '391294061190-interior.png');
INSERT INTO `vehicles` VALUES ('315', '26', '298', 'Civic coupe', '341294061278-car_front.png', '751294061281-car_back.png', '361294061286-interior.png', '981294061265-car_front.png', '731294061269-car_back.png', '231294061271-interior.png');
INSERT INTO `vehicles` VALUES ('316', '26', '299', 'Civic coupe', '621294061361-car_front.png', '631294061364-car_back.png', '131294061368-interior.png', '331294061350-car_front.png', '811294061354-car_back.png', '321294061355-interior.png');
INSERT INTO `vehicles` VALUES ('317', '26', '300', 'Civic coupe', '151294061552-car_front.png', '981294061551-car_back.png', '921294061555-interior.png', '341294061432-car_front.png', '161294061435-car_back.png', '731294061437-interior.png');
INSERT INTO `vehicles` VALUES ('318', '26', '301', 'Civic coupe', '691294061638-car_front.png', '981294061641-car_back.png', '321294061646-interior.png', '451294061624-car_front.png', '891294061629-car_back.png', '881294061632-interior.png');
INSERT INTO `vehicles` VALUES ('319', '26', '302', 'Civic coupe', '801294061725-car_front.png', '521294061728-car_back.png', '311294061733-interior.png', '631294061713-car_front.png', '161294061717-car_back.png', '61294061719-interior.png');
INSERT INTO `vehicles` VALUES ('320', '26', '303', 'Civic coupe', '291294061807-car_front.png', '791294061810-car_back.png', '931294061815-interior.png', '81294061796-car_front.png', '711294061797-car_back.png', '181294061803-interior.png');
INSERT INTO `vehicles` VALUES ('321', '26', '304', 'Civic coupe', '01294061888-car_front.png', '571294061891-car_back.png', '341294061896-interior.png', '721294061876-car_front.png', '561294061878-car_back.png', '21294061884-interior.png');
INSERT INTO `vehicles` VALUES ('322', '26', '305', 'Civic coupe', '531294061969-car_front.png', '851294061971-car_back.png', '491294061976-interior.png', '261294061957-car_front.png', '671294061960-car_back.png', '971294061966-interior.png');
INSERT INTO `vehicles` VALUES ('323', '27', '306', 'civic sedan', '291294062127-front.png', '611294062130-back.png', '811294062134-interior.png', '101294062117-front.png', '241294062121-back.png', '21294062122-interior.png');
INSERT INTO `vehicles` VALUES ('324', '27', '307', 'Civic coupe', '511294062211-front.png', '831294062216-back.png', '611294062222-interior.png', '251294062201-front.png', '961294062204-back.png', '631294062206-interior.png');
INSERT INTO `vehicles` VALUES ('325', '27', '308', 'Civic sedan', '351294062303-front.png', '621294062306-back.png', '251294062310-interior.png', '61294062292-front.png', '251294062296-back.png', '851294062297-interior.png');
INSERT INTO `vehicles` VALUES ('326', '27', '309', 'Civic sedan', '551294062390-front.png', '581294062393-back.png', '311294062397-interior.png', '991294062380-front.png', '361294062383-back.png', '691294062384-interior.png');
INSERT INTO `vehicles` VALUES ('327', '27', '310', 'Civic sedan', '21294062472-front.png', '611294062475-back.png', '481294062479-interior.png', '651294062462-front.png', '351294062465-back.png', '111294062466-interior.png');
INSERT INTO `vehicles` VALUES ('328', '27', '311', 'Civic sedan', '491294062569-front.png', '981294062574-back.png', '771294062575-interior.png', '551294062559-front.png', '841294062562-back.png', '521294062564-interior.png');
INSERT INTO `vehicles` VALUES ('329', '16', '312', 'Accord Sedan', '861294115925-car_front.png', '581294115926-back.png', '361294115934-interior.png', '251294115915-car_front.png', '371294115913-back.png', '501294115917-interior.png');
INSERT INTO `vehicles` VALUES ('330', '16', '313', 'Accord Sedan', '621294116987-car_front.png', '991294116989-back.png', '441294117031-interior.png', '821294116975-car_front.png', '21294116979-back.png', '521294116981-interior.png');
INSERT INTO `vehicles` VALUES ('331', '16', '314', 'Accord Sedan', '261294117333-car_front.png', '601294117361-back.png', '661294117369-interior.png', '811294117312-car_front.png', '321294117313-back.png', '921294117330-interior.png');
INSERT INTO `vehicles` VALUES ('332', '16', '315', 'Accord Sedan', '221294117560-car_front.png', '211294117563-back.png', '811294117595-interior.png', '321294117535-car_front.png', '901294117537-back.png', '581294117543-interior.png');
INSERT INTO `vehicles` VALUES ('333', '16', '316', 'Accord Sedan', '91294118097-car_front.png', '741294118103-back.png', '971294118111-interior.png', '571294118081-car_front.png', '881294118085-back.png', '611294118090-interior.png');
INSERT INTO `vehicles` VALUES ('334', '16', '317', 'Accord Sedan', '901294119907-car_front.png', '151294119917-back.png', '531294119919-interior.png', '341294119884-car_front.png', '921294119890-back.png', '491294119896-interior.png');
INSERT INTO `vehicles` VALUES ('335', '16', '318', 'Accord Sedan', '181294120522-car_front.png', '201294120532-back.png', '171294120542-interior.png', '211294120503-car_front.png', '561294120506-back.png', '901294120512-interior.png');
INSERT INTO `vehicles` VALUES ('336', '16', '319', 'Accord Sedan', '121294120940-car_front.png', '121294120947-back.png', '11294121540-interior.png', '991294121138-car_front.png', '931294121142-back.png', '321294121150-interior.png');
INSERT INTO `vehicles` VALUES ('337', '16', '320', 'Accord Sedan', '441294120817-car_front.png', '71294120827-back.png', '571294120842-interior.png', '381294120800-car_front.png', '871294120807-back.png', '431294120811-interior.png');
INSERT INTO `vehicles` VALUES ('338', '16', '321', 'Accord Sedan', '301294122005-car_front.png', '491294122019-back.png', '191294122032-interior.png', '311294121946-car_front.png', '521294121952-back.png', '181294121997-interior.png');
INSERT INTO `vehicles` VALUES ('339', '27', '322', 'Civic sedan', '221294122007-front.png', '291294122038-back.png', '931294122031-interior.png', '91294121988-front.png', '391294121989-back.png', '301294121995-interior.png');
INSERT INTO `vehicles` VALUES ('340', '27', '323', 'Civic sedan', '561294122386-front.png', '721294122391-back.png', '361294122400-interior.png', '561294122375-front.png', '231294122379-back.png', '121294122380-interior.png');
INSERT INTO `vehicles` VALUES ('341', '16', '324', 'Accord Sedan', '211294122629-car_front.png', '301294122630-back.png', '31294122638-interior.png', '211294122609-car_front.png', '691294122608-back.png', '681294122616-interior.png');
INSERT INTO `vehicles` VALUES ('342', '16', '325', 'Accord Sedan', '911294123130-car_front.png', '321294123137-back.png', '731294123156-interior.png', '251294123104-car_front.png', '221294123108-back.png', '811294123112-interior.png');
INSERT INTO `vehicles` VALUES ('343', '16', '326', 'Accord Sedan', '331294123337-car_front.png', '641294123344-back.png', '641294123350-interior.png', '841294123315-car_front.png', '321294123319-back.png', '121294123335-interior.png');
INSERT INTO `vehicles` VALUES ('344', '27', '327', 'Civic sedan', '51294123364-front.png', '161294123371-back.png', '841294123391-interior.png', '721294123345-front.png', '991294123351-back.png', '201294123358-interior.png');
INSERT INTO `vehicles` VALUES ('345', '16', '328', 'Accord Sedan', '231294123489-car_front.png', '291294123489-back.png', '91294123495-interior.png', '831294123475-car_front.png', '151294123479-back.png', '921294123481-interior.png');
INSERT INTO `vehicles` VALUES ('346', '16', '329', 'Accord Sedan', '171294123647-car_front.png', '151294123654-back.png', '231294123667-interior.png', '791294123621-car_front.png', '641294123626-back.png', '941294123626-interior.png');
INSERT INTO `vehicles` VALUES ('347', '27', '330', 'Civic sedan', '671294123690-front.png', '411294123697-back.png', '651294123712-interior.png', '51294123666-front.png', '171294123672-back.png', '411294123677-interior.png');
INSERT INTO `vehicles` VALUES ('348', '16', '331', 'Accord Sedan', '71294123932-car_front.png', '301294123928-back.png', '181294123938-interior.png', '21294123917-car_front.png', '61294123915-back.png', '411294123919-interior.png');
INSERT INTO `vehicles` VALUES ('349', '27', '332', 'Civic sedan', '871294123998-front.png', '721294124013-back.png', '481294124024-interior.png', '501294123981-front.png', '361294123987-back.png', '801294123990-interior.png');
INSERT INTO `vehicles` VALUES ('350', '16', '333', 'Accord Sedan', '11294124596-car_front.png', '681294124626-back.png', '921294124613-interiior.png', '441294124583-car_front.png', '431294124588-back.png', '711294124589-interior.png');
INSERT INTO `vehicles` VALUES ('351', '27', '334', 'Civic sedan', '821294125357-front.png', '121294125360-back.png', '301294125366-interior.png', '311294125331-front.png', '951294125336-back.png', '861294125346-interior.png');
INSERT INTO `vehicles` VALUES ('352', '27', '335', 'Civic sedan', '671294126895-front.png', '911294126906-back.png', '391294126912-interior.png', '621294126885-front.png', '711294126879-back.png', '981294126894-interior.png');
INSERT INTO `vehicles` VALUES ('353', '27', '336', 'Civic sedan', '881294128280-front.png', '741294128282-back.png', '91294128285-interior.png', '911294127141-front.png', '821294127140-back.png', '151294127170-interior.png');
INSERT INTO `vehicles` VALUES ('354', '27', '337', 'Civic sedan', '21294129320-front.png', '521294129340-back.png', '541294129348-interior.png', '271294129292-front.png', '551294129299-back.png', '451294129305-interior.png');
INSERT INTO `vehicles` VALUES ('355', '27', '338', 'Civic sedan', '401294129458-front.png', '541294129464-back.png', '531294129489-interior.png', '421294129445-front.png', '691294129450-back.png', '231294129452-interior.png');
INSERT INTO `vehicles` VALUES ('356', '27', '339', 'Civic sedan', '571294129607-front.png', '451294129616-back.png', '911294129621-interior.png', '761294129584-front.png', '661294129592-back.png', '711294129599-interior.png');
INSERT INTO `vehicles` VALUES ('357', '27', '340', 'Civic sedan', '71294129736-front.png', '711294129745-back.png', '271294129755-interior.png', '601294129718-front.png', '981294129720-back.png', '251294129725-interior.png');
INSERT INTO `vehicles` VALUES ('358', '17', '341', 'Accord Sedan', '711294141020-car_front.png', '251294141022-back.png', '411294141027-interior.png', '531294141004-car_front.png', '661294141011-back.png', '431294141015-interior.png');
INSERT INTO `vehicles` VALUES ('359', '17', '342', 'Accord Sedan', '511294141190-car_front.png', '731294141187-back.png', '501294141197-interior.png', '881294141165-car_front.png', '641294141169-back.png', '351294141173-interior.png');
INSERT INTO `vehicles` VALUES ('360', '17', '343', 'Accord Sedan', '191294141682-car_front.png', '281294141688-back.png', '371294141704-interior.png', '881294141669-car_front.png', '631294141673-back.png', '721294141675-interior.png');
INSERT INTO `vehicles` VALUES ('361', '28', '344', 'Civic sedan', '31294142019-front.png', '911294142026-back.png', '831294142029-interior.png', '261294142006-front.png', '921294142011-back.png', '381294142013-interior.png');
INSERT INTO `vehicles` VALUES ('362', '28', '345', 'Civic coupe', '11294142115-front.png', '791294142121-back.png', '411294142125-interior.png', '381294142102-front.png', '911294142107-back.png', '811294142108-interior.png');
INSERT INTO `vehicles` VALUES ('363', '17', '346', 'Accord Sedan', '731294142486-car_front.png', '401294142489-back.png', '201294142491-interior.png', '871294142472-car_front.png', '501294142476-back.png', '651294142480-interior.png');
INSERT INTO `vehicles` VALUES ('364', '17', '347', 'Accord Sedan', '221294142666-car_front.png', '741294142672-back.png', '71294142676-interior.png', '231294142652-car_front.png', '441294142655-back.png', '241294142660-interior.png');
INSERT INTO `vehicles` VALUES ('365', '28', '348', 'Civic sedan', '381294142691-front.png', '951294142691-back.png', '501294142698-interior.png', '751294142675-front.png', '131294142677-back.png', '781294142680-interior.png');
INSERT INTO `vehicles` VALUES ('366', '28', '349', 'Civic coupe', '271294142782-front.png', '431294142795-back.png', '941294142811-interior.png', '801294142769-front.png', '211294142777-back.png', '111294142776-interior.png');
INSERT INTO `vehicles` VALUES ('367', '17', '350', 'Accord Sedan', '561294142810-car_front.png', '521294142800-back.png', '821294142822-interior.png', '391294142783-car_front.png', '81294142788-back.png', '21294142786-interior.png');
INSERT INTO `vehicles` VALUES ('368', '17', '351', 'Accord Sedan', '711294143077-car_front.png', '831294143080-back.png', '491294143083-interior.png', '821294143065-car_front.png', '881294143072-back.png', '781294143071-interior.png');
INSERT INTO `vehicles` VALUES ('369', '17', '352', 'Accord Sedan', '351294143317-car_front.png', '401294143324-back.png', '791294143331-interior.png', '401294143302-car_front.png', '41294143307-back.png', '211294143308-interior.png');
INSERT INTO `vehicles` VALUES ('370', '17', '353', 'Accord Sedan', '41294143511-car_front.png', '651294143520-back.png', '781294143519-interior.png', '01294143498-car_front.png', '81294143507-back.png', '731294143508-interior.png');
INSERT INTO `vehicles` VALUES ('371', '17', '354', 'Accord Sedan', '221294143679-car_front.png', '721294143692-back.png', '341294143699-interior.png', '821294143664-car_front.png', '381294143669-back.png', '551294143670-interior.png');
INSERT INTO `vehicles` VALUES ('372', '28', '355', 'Civic sedan', '591294144241-front.png', '141294144239-back.png', '741294144250-interior.png', '11294144222-front.png', '511294144227-back.png', '181294144228-interior.png');
INSERT INTO `vehicles` VALUES ('373', '17', '356', 'Accord Sedan', '721294144223-car_front.png', '881294144239-back.png', '601294144236-interior.png', '371294144207-car_front.png', '911294144210-back.png', '741294144212-interior.png');
INSERT INTO `vehicles` VALUES ('374', '28', '357', 'Civic sedan', '921294144384-front.png', '801294144389-back.png', '541294144393-interior.png', '211294144369-front.png', '681294144377-back.png', '821294144378-interior.png');
INSERT INTO `vehicles` VALUES ('375', '17', '358', 'Accord Sedan', '761294144432-car_front.png', '131294144434-back.png', '51294144450-interior.png', '241294144417-car_front.png', '221294144421-back.png', '771294144425-interior.png');
INSERT INTO `vehicles` VALUES ('376', '28', '359', 'Civic sedan', '541294144502-front.png', '761294144501-back.png', '141294144509-interior.png', '881294144467-front.png', '921294144471-back.png', '991294144475-interior.png');
INSERT INTO `vehicles` VALUES ('377', '28', '360', 'Civic sedan', '251294144650-front.png', '111294144644-back.png', '761294144651-interior.png', '811294144615-front.png', '51294144621-back.png', '51294144622-interior.png');
INSERT INTO `vehicles` VALUES ('378', '28', '361', 'Civic sedan', '871294144886-front.png', '731294144888-back.png', '91294144893-interior.png', '541294144873-front.png', '821294144877-back.png', '51294144882-interior.png');
INSERT INTO `vehicles` VALUES ('379', '28', '362', 'Civic sedan', '831294144985-front.png', '381294144988-back.png', '661294144992-interior.png', '381294144974-front.png', '831294144975-back.png', '771294144978-interior.png');
INSERT INTO `vehicles` VALUES ('380', '27', '363', 'Civic sedan', '171294207242-front.png', '481294207258-back.png', '131294207290-interior.png', '121294207208-front.png', '51294207215-back.png', '621294207219-interior.png');
INSERT INTO `vehicles` VALUES ('381', '27', '364', 'Civic sedan', '951294207606-front.png', '771294207607-back.png', '141294207619-interior.png', '181294207569-front.png', '121294207575-back.png', '161294207599-interior.png');
INSERT INTO `vehicles` VALUES ('382', '17', '365', 'Accord Sedan', '461294208676-car_front.png', '481294208701-back.png', '401294208695-interior.png', '361294208658-car_front.png', '531294208663-back.png', '661294208670-interior.png');
INSERT INTO `vehicles` VALUES ('383', '28', '366', 'Civic sedan', '81294208906-front.png', '11294208915-back.png', '461294208939-interior.png', '861294208837-front.png', '521294208878-back.png', '151294208886-interior.png');
INSERT INTO `vehicles` VALUES ('384', '28', '367', 'Civic sedan', '871294209247-front.png', '51294209247-back.png', '871294209255-interior.png', '551294209226-front.png', '911294209218-back.png', '271294209220-interior.png');
INSERT INTO `vehicles` VALUES ('385', '17', '368', 'Accord Sedan', '681294209658-car_front.png', '151294209664-back.png', '981294209677-interior.png', '251294209646-car_front.png', '691294209649-back.png', '821294209653-interior.png');
INSERT INTO `vehicles` VALUES ('386', '17', '369', 'Accord Sedan', '511294209823-car_front.png', '351294209827-back.png', '271294209877-interior.png', '821294209813-car_front.png', '611294209817-back.png', '51294209818-interior.png');
INSERT INTO `vehicles` VALUES ('387', '28', '370', 'Civic sedan', '771294217092-front.png', '601294217094-back.png', '571294217118-interior.png', '461294217054-front.png', '921294217060-back.png', '271294217317-interior.png');
INSERT INTO `vehicles` VALUES ('388', '17', '371', 'Accord Sedan', '211294217271-car_front.png', '431294216806-back.png', '441294216838-interior.png', '321294216735-car_front.png', '731294216739-back.png', '361294216747-interior.png');
INSERT INTO `vehicles` VALUES ('389', '28', '372', 'Civic sedan', '761294217481-front.png', '211294217470-back.png', '171294217502-interior.png', '611294217433-front.png', '261294217447-back.png', '931294217453-interior.png');
INSERT INTO `vehicles` VALUES ('390', '17', '373', 'Accord Sedan', '731294217445-car_front.png', '191294217454-back.png', '551294217495-interior.png', '801294217413-car_front.png', '921294217426-back.png', '61294217419-interior.png');
INSERT INTO `vehicles` VALUES ('391', '17', '374', 'Accord Sedan', '61294222289-car_front.png', '311294222289-back.png', '981294222299-interior.png', '461294222234-car_front.png', '921294222272-back.png', '81294222281-interior.png');
INSERT INTO `vehicles` VALUES ('392', '17', '375', 'Accord Sedan', '731294222403-car_front.png', '691294222408-back.png', '641294222415-interior.png', '521294222389-car_front.png', '771294222408-back.png', '581294222397-interior.png');
INSERT INTO `vehicles` VALUES ('393', '28', '376', 'Civic sedan', '751294222711-front.png', '561294222715-back.png', '201294222723-interior.png', '891294222699-front.png', '441294222699-back.png', '561294222705-interior.png');
INSERT INTO `vehicles` VALUES ('394', '17', '377', 'Accord Sedan', '701294222792-car_front.png', '591294222796-back.png', '691294222802-interior.png', '771294222768-car_front.png', '371294222773-back.png', '751294222774-interior.png');
INSERT INTO `vehicles` VALUES ('395', '28', '378', 'Civic sedan', '651294222831-front.png', '591294222835-back.png', '941294222841-interior.png', '431294222819-front.png', '111294222820-back.png', '321294222823-interior.png');
INSERT INTO `vehicles` VALUES ('396', '17', '379', 'Accord Sedan', '391294222931-car_front.png', '641294222934-back.png', '611294222940-interior.png', '481294222919-car_front.png', '241294222920-back.png', '01294222921-interior.png');
INSERT INTO `vehicles` VALUES ('397', '28', '380', 'Civic sedan', '861294223051-front.png', '851294223058-back.png', '391294223066-interior.png', '491294223038-front.png', '371294223043-back.png', '171294223044-interior.png');
INSERT INTO `vehicles` VALUES ('398', '17', '381', 'Accord Sedan', '151294223067-car_front.png', '941294223079-back.png', '371294223079-interior.png', '411294223054-car_front.png', '941294223057-back.png', '571294223059-interior.png');
INSERT INTO `vehicles` VALUES ('399', '28', '382', 'Civic sedan', '401294223189-front.png', '751294223206-back.png', '891294223209-interior.png', '661294223176-front.png', '341294223179-back.png', '751294223184-interior.png');
INSERT INTO `vehicles` VALUES ('400', '28', '383', 'Civic sedan', '771294223424-front.png', '301294223428-back.png', '41294223434-interior.png', '51294223409-front.png', '731294223413-back.png', '131294223416-interior.png');
INSERT INTO `vehicles` VALUES ('401', '17', '384', 'Accord Sedan', '471294223408-car_front.png', '311294223413-back.png', '521294223415-interior.png', '151294223393-car_front.png', '271294223396-back.png', '321294223397-interior.png');
INSERT INTO `vehicles` VALUES ('402', '28', '385', 'Civic sedan', '541294223683-front.png', '861294223686-back.png', '31294223690-interior.png', '851294223655-front.png', '251294223676-back.png', '781294223680-interior.png');
INSERT INTO `vehicles` VALUES ('403', '49', '386', 'Insight', '681294224347-front.png', '791294224350-back.png', '531294224354-interior.png', '821294224336-front.png', '311294224338-back.png', '31294224340-interior.png');
INSERT INTO `vehicles` VALUES ('404', '17', '387', 'Accord Sedan', '541294226514-car_front.png', '21294226519-back.png', '901294226522-interior.png', '821294226503-car_front.png', '71294226504-back.png', '381294226507-interior.png');
INSERT INTO `vehicles` VALUES ('405', '17', '388', 'Accord Sedan', '281294226684-car_front.png', '251294226690-back.png', '821294226692-interior.png', '311294226673-car_front.png', '721294226677-back.png', '751294226678-interior.png');
INSERT INTO `vehicles` VALUES ('406', '17', '389', 'Accord Sedan', '721294226945-car_front.png', '161294226950-back.png', '951294226951-interior.png', '291294226934-car_front.png', '871294226938-back.png', '151294226939-interior.png');
INSERT INTO `vehicles` VALUES ('407', '17', '390', 'Accord Sedan', '321294227105-car_front.png', '121294227103-back.png', '01294227107-interior.png', '921294227091-car_front.png', '111294227094-back.png', '261294227098-interior.png');
INSERT INTO `vehicles` VALUES ('408', '29', '391', 'Civic sedan', '701294227736-front.png', '971294227739-back.png', '61294227745-interior.png', '331294227725-front.png', '291294227730-back.png', '791294227737-interior.png');
INSERT INTO `vehicles` VALUES ('409', '49', '392', 'Insight', '671294228335-front.png', '861294228339-back.png', '811294228344-interior.png', '241294228325-front.png', '241294228329-back.png', '271294228330-interior.png');
INSERT INTO `vehicles` VALUES ('410', '29', '393', 'Civic sedan', '311294228284-front.png', '601294228287-back.png', '961294228294-interior.png', '781294228274-front.png', '881294228278-back.png', '481294228280-interior.png');
INSERT INTO `vehicles` VALUES ('411', '29', '394', 'Civic sedan', '71294230653-front.png', '281294230654-back.png', '211294230663-interior.png', '81294230639-front.png', '201294230640-back.png', '571294230642-interior.png');
INSERT INTO `vehicles` VALUES ('412', '29', '395', 'Civic sedan', '931294230891-front.png', '391294230898-back.png', '651294230900-interior.png', '611294230881-front.png', '21294230884-back.png', '321294230885-interior.png');
INSERT INTO `vehicles` VALUES ('413', '29', '396', 'Civic sedan', '471294232325-front.png', '851294232332-back.png', '421294232352-interior.png', '371294232312-front.png', '771294232316-back.png', '701294232320-interior.png');
INSERT INTO `vehicles` VALUES ('414', '29', '397', 'Civic sedan', '31294232459-front.png', '301294232466-back.png', '871294232477-interior.png', '321294232446-front.png', '411294232451-back.png', '411294232452-interior.png');
INSERT INTO `vehicles` VALUES ('415', '29', '398', 'Civic sedan', '401294232614-front.png', '591294232619-back.png', '171294232632-interior.png', '311294232599-front.png', '361294232606-back.png', '411294232608-interior.png');
INSERT INTO `vehicles` VALUES ('416', '29', '399', 'Civic sedan', '941294232806-front.png', '81294232813-back.png', '681294232837-interior.png', '91294232794-front.png', '351294232798-back.png', '691294232800-interior.png');
INSERT INTO `vehicles` VALUES ('417', '29', '400', 'Civic sedan', '21294288488-front.png', '581294288492-back.png', '981294288496-interior.png', '521294288476-front.png', '501294288481-back.png', '811294288485-interior.png');
INSERT INTO `vehicles` VALUES ('418', '29', '401', 'Civic sedan', '141294288576-front.png', '81294288578-back.png', '321294288585-interior.png', '811294288565-front.png', '721294288569-back.png', '61294288570-interior.png');
INSERT INTO `vehicles` VALUES ('419', '29', '402', 'Civic sedan', '711294288664-front.png', '781294288667-back.png', '751294288671-interior.png', '511294288652-front.png', '141294288656-back.png', '191294288658-interior.png');
INSERT INTO `vehicles` VALUES ('420', '29', '403', 'Civic sedan', '731294289043-front.png', '761294289046-back.png', '991294289051-interior.png', '641294289034-front.png', '261294289038-back.png', '201294289039-interior.png');
INSERT INTO `vehicles` VALUES ('421', '29', '404', 'Civic sedan', '121294289131-front.png', '201294289131-back.png', '381294289136-interior.png', '51294289118-front.png', '871294289126-back.png', '121294289123-interior.png');
INSERT INTO `vehicles` VALUES ('422', '29', '405', 'Civic sedan', '381294289390-front.png', '621294289396-back.png', '801294289397-interior.png', '961294289381-front.png', '571294289385-back.png', '171294289385-interior.png');
INSERT INTO `vehicles` VALUES ('423', '29', '406', 'Civic sedan', '281294289610-front.png', '731294289615-back.png', '01294289617-interior.png', '591294289598-front.png', '01294289600-back.png', '801294289605-interior.png');
INSERT INTO `vehicles` VALUES ('424', '29', '407', 'Civic sedan', '781294290427-front.png', '671294290430-back.png', '501294290435-interior.png', '471294290416-front.png', '451294290419-back.png', '61294290423-interior.png');
INSERT INTO `vehicles` VALUES ('425', '29', '408', 'Civic sedan', '111294290568-front.png', '141294290572-back.png', '831294290574-interior.png', '181294290558-front.png', '291294290562-back.png', '831294290563-interior.png');
INSERT INTO `vehicles` VALUES ('426', '29', '409', 'Civic sedan', '671294290700-front.png', '531294290704-back.png', '351294290708-interior.png', '141294290688-front.png', '781294290693-back.png', '301294290694-interior.png');
INSERT INTO `vehicles` VALUES ('427', '29', '410', 'Civic sedan', '191294290788-front.png', '21294290791-back.png', '531294290796-interior.png', '91294290778-front.png', '321294290782-back.png', '981294290786-interior.png');
INSERT INTO `vehicles` VALUES ('428', '29', '411', 'Civic sedan', '771294290871-front.png', '131294290876-back.png', '741294290877-interior.png', '331294290860-front.png', '741294290865-back.png', '901294290866-interior.png');
INSERT INTO `vehicles` VALUES ('429', '29', '412', 'Civic sedan', '211294292096-front.png', '121294292106-back.png', '661294292114-interior.png', '231294292074-front.png', '231294292080-back.png', '511294292085-interior.png');
INSERT INTO `vehicles` VALUES ('430', '29', '413', 'Civic sedan', '901294292206-front.png', '411294292209-back.png', '51294292213-interior.png', '301294292197-front.png', '521294292201-back.png', '111294292201-interior.png');
INSERT INTO `vehicles` VALUES ('431', '29', '414', 'Civic sedan', '931294292317-front.png', '721294292319-back.png', '511294292325-interior.png', '381294292306-front.png', '191294292310-back.png', '271294292311-interior.png');
INSERT INTO `vehicles` VALUES ('432', '29', '415', 'Civic sedan', '851294292413-front.png', '591294292418-back.png', '471294292424-interior.png', '151294292403-front.png', '421294292407-back.png', '711294292408-interior.png');
INSERT INTO `vehicles` VALUES ('433', '29', '416', 'Civic sedan', '321294292529-front.png', '621294292535-back.png', '691294292542-interior.png', '921294292520-front.png', '621294292523-back.png', '691294292524-interior.png');
INSERT INTO `vehicles` VALUES ('434', '29', '417', 'Civic sedan', '361294292701-front.png', '831294292705-back.png', '121294292712-interior.png', '451294292694-front.png', '691294292696-back.png', '121294292696-interior.png');
INSERT INTO `vehicles` VALUES ('435', '29', '418', 'Civic sedan', '271294293013-front.png', '801294293016-back.png', '421294293021-interior.png', '701294293002-front.png', '261294293005-back.png', '811294293008-interior.png');
INSERT INTO `vehicles` VALUES ('436', '29', '419', 'Civic sedan', '501294293143-front.png', '681294293146-back.png', '361294293155-interior.png', '461294293133-front.png', '711294293137-back.png', '521294293138-interior.png');
INSERT INTO `vehicles` VALUES ('437', '29', '420', 'Civic sedan', '141294294052-front.png', '371294294078-back.png', '521294294095-interior.png', '171294294028-front.png', '341294294035-back.png', '891294294038-interior.png');
INSERT INTO `vehicles` VALUES ('438', '29', '421', 'Civic sedan', '51294294318-front.png', '471294294321-back.png', '241294294333-interior.png', '91294294303-front.png', '781294294310-back.png', '271294294311-interior.png');
INSERT INTO `vehicles` VALUES ('439', '29', '422', 'Civic sedan', '881294294821-front.png', '471294294825-back.png', '771294294830-interior.png', '561294294811-front.png', '291294294815-back.png', '721294294816-interior.png');
INSERT INTO `vehicles` VALUES ('444', '49', '427', 'Insight', '01294295925-front.png', '551294295929-back.png', '431294295930-interior.png', '501294295906-front.png', '901294295911-back.png', '361294295913-interior.png');
INSERT INTO `vehicles` VALUES ('441', '29', '424', 'Civic sedan', '251294295107-front.png', '201294295109-back.png', '181294295112-interior.png', '261294295100-front.png', '01294295101-back.png', '421294295103-interior.png');
INSERT INTO `vehicles` VALUES ('442', '29', '425', 'Civic sedan', '641294295276-front.png', '741294295280-back.png', '571294295285-interior.png', '841294295265-front.png', '511294295271-back.png', '711294295271-interior.png');
INSERT INTO `vehicles` VALUES ('443', '29', '426', 'Civic sedan', '661294295435-front.png', '581294295451-back.png', '31294295457-interior.png', '551294295421-front.png', '551294295429-back.png', '811294295431-interior.png');
INSERT INTO `vehicles` VALUES ('445', '29', '428', 'Civic sedan', '171294295827-front.png', '991294295832-back.png', '721294295836-interior.png', '361294295812-front.png', '881294295816-back.png', '161294295817-interior.png');
INSERT INTO `vehicles` VALUES ('446', '29', '429', 'Civic sedan', '341294296098-front.png', '801294296110-back.png', '651294296114-interior.png', '891294296080-front.png', '441294296084-back.png', '631294296084-interior.png');
INSERT INTO `vehicles` VALUES ('447', '29', '430', 'Civic sedan', '481294296361-front.png', '231294296370-back.png', '181294296456-interior.png', '261294296334-front.png', '541294296341-back.png', '361294296347-interior.png');
INSERT INTO `vehicles` VALUES ('448', '29', '431', 'Civic sedan', '211294296726-front.png', '431294296728-back.png', '301294296738-interior.png', '841294296705-front.png', '771294296706-back.png', '701294296712-interior.png');
INSERT INTO `vehicles` VALUES ('449', '29', '432', 'Civic sedan', '191294297472-front.png', '671294297458-back.png', '981294297473-interior.png', '121294297444-front.png', '471294297446-back.png', '711294297447-interior.png');
INSERT INTO `vehicles` VALUES ('450', '29', '433', 'Civic sedan', '921294298057-front.png', '951294298060-back.png', '611294298076-interior.png', '681294298037-front.png', '851294298042-back.png', '791294298049-interior.png');
INSERT INTO `vehicles` VALUES ('451', '49', '434', 'Insight', '851294298266-front.png', '661294298288-back.png', '491294298313-interior.png', '211294298197-front.png', '821294298203-back.png', '871294298204-interior.png');
INSERT INTO `vehicles` VALUES ('452', '17', '435', 'Accord Sedan', '901294298800-car_front.png', '451294298826-back.png', '11294298819-interior.png', '81294298783-car_front.png', '981294298783-back.png', '981294298785-interior.png');
INSERT INTO `vehicles` VALUES ('453', '17', '436', 'Accord Sedan', '741294299100-car_front.png', '261294299105-back.png', '111294299117-interior.png', '751294299058-car_front.png', '821294299057-back.png', '621294299093-interior.png');
INSERT INTO `vehicles` VALUES ('454', '17', '437', 'Accord Sedan', '491294299552-car_front.png', '941294299542-back.png', '931294299569-interior.png', '521294299522-car_front.png', '331294299526-back.png', '961294299528-interior.png');
INSERT INTO `vehicles` VALUES ('455', '17', '438', 'Accord Sedan', '701294299942-car_front.png', '531294299967-back.png', '921294299967-interior.png', '451294299900-car_front.png', '921294299906-back.png', '281294299911-interior.png');
INSERT INTO `vehicles` VALUES ('456', '30', '439', 'Civic sedan', '161294299878-front.png', '901294299888-back.png', '961294299905-interior.png', '531294299848-front.png', '121294299852-back.png', '611294299856-interior.png');
INSERT INTO `vehicles` VALUES ('457', '17', '440', 'Accord Sedan', '751294300127-car_front.png', '181294300136-back.png', '351294300156-interior.png', '891294300114-car_front.png', '481294300115-back.png', '31294300116-interior.png');
INSERT INTO `vehicles` VALUES ('458', '30', '441', 'Civic sedan', '561294300239-front.png', '351294300242-back.png', '571294300260-interior.png', '831294300226-front.png', '761294300228-back.png', '821294300244-interior.png');
INSERT INTO `vehicles` VALUES ('459', '49', '442', 'Insight', '751294300627-front.png', '381294300640-back.png', '61294300646-interior.png', '171294300599-front.png', '161294300605-back.png', '441294300612-interior.png');
INSERT INTO `vehicles` VALUES ('460', '17', '443', 'Accord Sedan', '21294300752-car_front.png', '451294300761-back.png', '321294300774-interior.png', '991294300734-car_front.png', '41294300747-back.png', '791294300739-interior.png');
INSERT INTO `vehicles` VALUES ('461', '30', '444', 'Civic sedan', '851294300766-front.png', '971294300773-back.png', '111294300779-interior.png', '811294300747-front.png', '331294300752-back.png', '251294300758-interior.png');
INSERT INTO `vehicles` VALUES ('462', '17', '445', 'Accord Sedan', '881294300957-car_front.png', '101294300951-back.png', '431294300976-interior.png', '311294300934-car_front.png', '181294300940-back.png', '831294300940-interior.png');
INSERT INTO `vehicles` VALUES ('463', '30', '446', 'Civic sedan', '251294301111-front.png', '431294301106-back.png', '781294301126-interior.png', '171294301089-front.png', '351294301093-back.png', '941294301094-interior.png');
INSERT INTO `vehicles` VALUES ('464', '17', '447', 'Accord Sedan', '401294301533-car_front.png', '541294301535-back.png', '361294301538-interior.png', '131294301506-car_front.png', '141294301514-back.png', '101294301515-interior.png');
INSERT INTO `vehicles` VALUES ('465', '17', '448', 'Accord Sedan', '281294301963-car_front.png', '461294301960-back.png', '821294301970-interior.png', '841294301947-car_front.png', '651294301952-back.png', '201294301952-interior.png');
INSERT INTO `vehicles` VALUES ('466', '30', '449', 'Civic sedan', '461294302031-front.png', '121294302035-back.png', '471294302037-interior.png', '261294302021-front.png', '271294302025-back.png', '621294302025-interior.png');
INSERT INTO `vehicles` VALUES ('467', '17', '450', 'Accord Sedan', '751294302114-car_front.png', '61294302117-back.png', '401294302123-interior.png', '521294302104-car_front.png', '941294302108-back.png', '501294302109-interior.png');
INSERT INTO `vehicles` VALUES ('468', '30', '451', 'Civic sedan', '911294302548-front.png', '591294302550-back.png', '371294302564-interior.png', '511294302539-front.png', '431294302532-back.png', '801294302541-interior.png');
INSERT INTO `vehicles` VALUES ('469', '17', '452', 'Accord Sedan', '661294302721-car_front.png', '911294302730-back.png', '841294302734-interior.png', '211294302714-car_front.png', '281294302715-back.png', '371294302716-interior.png');
INSERT INTO `vehicles` VALUES ('470', '17', '453', 'Accord Sedan', '111294302886-car_front.png', '641294302887-back.png', '251294302902-interior.png', '171294302866-car_front.png', '371294302869-back.png', '661294302874-interior.png');
INSERT INTO `vehicles` VALUES ('471', '30', '454', 'Civic sedan', '241294308636-front.png', '201294308650-back.png', '381294308687-interior.png', '571294308622-front.png', '791294308628-back.png', '801294308630-interior.png');
INSERT INTO `vehicles` VALUES ('472', '17', '455', 'Accord Sedan', '631294309243-car_front.png', '841294309252-back.png', '61294309256-interior.png', '901294309229-car_front.png', '191294309227-back.png', '811294309236-interior.png');
INSERT INTO `vehicles` VALUES ('473', '30', '456', 'Civic sedan', '841294309382-front.png', '551294309388-back.png', '891294309401-interior.png', '711294309349-front.png', '411294309353-back.png', '11294309363-interior.png');
INSERT INTO `vehicles` VALUES ('474', '17', '457', 'Accord Sedan', '191294309405-car_front.png', '801294309412-back.png', '441294309420-interior.png', '931294309390-car_front.png', '691294309394-back.png', '161294309395-interior.png');
INSERT INTO `vehicles` VALUES ('475', '17', '458', 'Accord Sedan', '641294309573-car_front.png', '831294309578-back.png', '741294309584-interior.png', '641294309542-car_front.png', '21294309554-back.png', '701294309558-interior.png');
INSERT INTO `vehicles` VALUES ('476', '17', '459', 'Accord Sedan', '601294309710-car_front.png', '651294309712-back.png', '41294309734-interior.png', '461294309688-car_front.png', '851294309700-back.png', '531294309694-interior.png');
INSERT INTO `vehicles` VALUES ('477', '17', '460', 'Accord Sedan', '631294309878-car_front.png', '621294309878-back.png', '601294309882-interior.png', '371294309856-car_front.png', '801294309862-back.png', '611294309862-interior.png');
INSERT INTO `vehicles` VALUES ('478', '17', '461', 'Accord Sedan', '51294310130-car_front.png', '971294310125-back.png', '511294310131-interior.png', '891294310092-car_front.png', '981294310103-back.png', '361294310111-interior.png');
INSERT INTO `vehicles` VALUES ('479', '17', '462', 'Accord Sedan', '31294310264-car_front.png', '451294310262-back.png', '31294310294-interior.png', '621294310236-car_front.png', '471294310240-back.png', '191294310241-interior.png');
INSERT INTO `vehicles` VALUES ('480', '17', '463', 'Accord Sedan', '851294310622-car_front.png', '681294310632-back.png', '301294310636-interior.png', '321294310608-car_front.png', '611294310595-back.png', '591294310600-interior.png');
INSERT INTO `vehicles` VALUES ('481', '30', '464', 'Civic sedan', '321294310765-front.png', '151294310772-back.png', '141294310779-interior.png', '831294310745-front.png', '771294310747-back.png', '471294310754-interior.png');
INSERT INTO `vehicles` VALUES ('482', '17', '465', 'Accord Sedan', '71294310812-car_front.png', '341294310824-back.png', '321294310853-interior.png', '921294310783-car_front.png', '41294310786-back.png', '821294310789-interior.png');
INSERT INTO `vehicles` VALUES ('483', '17', '466', 'Accord Sedan', '901294311005-car_front.png', '911294311005-back.png', '721294311010-interior.png', '511294310986-car_front.png', '441294310987-back.png', '881294310989-interior.png');
INSERT INTO `vehicles` VALUES ('484', '17', '467', 'Accord Sedan', '241294311160-car_front.png', '901294311169-back.png', '71294311177-interior.png', '621294311147-car_front.png', '591294311146-back.png', '441294311147-interior.png');
INSERT INTO `vehicles` VALUES ('485', '17', '468', 'Accord Sedan', '131294311327-car_front.png', '471294311325-back.png', '691294311334-interior.png', '621294311304-car_front.png', '391294311310-back.png', '801294311311-interior.png');
INSERT INTO `vehicles` VALUES ('486', '30', '469', 'Civic sedan', '431294311309-front.png', '491294311329-back.png', '581294311350-interior.png', '581294311248-front.png', '971294311256-back.png', '491294311289-interior.png');
INSERT INTO `vehicles` VALUES ('487', '30', '470', 'Civic sedan', '561294313380-front.png', '531294313387-back.png', '81294313413-interior.png', '491294313359-front.png', '401294313365-back.png', '471294313369-interior.png');
INSERT INTO `vehicles` VALUES ('488', '30', '471', 'Civic sedan', '301294313499-front.png', '521294313502-back.png', '41294313513-interior.png', '601294313485-front.png', '751294313488-back.png', '461294313492-interior.png');
INSERT INTO `vehicles` VALUES ('489', '30', '472', 'Civic sedan', '751294313621-front.png', '171294313629-back.png', '381294313654-interior.png', '191294313600-front.png', '481294313606-back.png', '801294313610-interior.png');
INSERT INTO `vehicles` VALUES ('490', '30', '473', 'Civic sedan', '921294313765-front.png', '461294313772-back.png', '651294313801-interior.png', '451294313729-front.png', '931294313735-back.png', '101294313738-interior.png');
INSERT INTO `vehicles` VALUES ('491', '30', '474', 'Civic sedan', '871294313909-front.png', '491294313918-back.png', '821294313937-interior.png', '571294313883-front.png', '401294313892-back.png', '911294313897-interior.png');
INSERT INTO `vehicles` VALUES ('492', '30', '475', 'Civic sedan', '281294314083-front.png', '841294314088-back.png', '191294314101-interior.png', '521294314060-front.png', '341294314065-back.png', '541294314072-interior.png');
INSERT INTO `vehicles` VALUES ('493', '30', '476', 'Civic sedan', '761294314344-front.png', '461294314354-back.png', '761294314380-interior.png', '261294314315-front.png', '911294314318-back.png', '731294314321-interior.png');
INSERT INTO `vehicles` VALUES ('494', '30', '477', 'Civic sedan', '541294314921-front.png', '431294314929-back.png', '911294314938-interior.png', '921294314902-front.png', '311294314906-back.png', '961294314911-interior.png');
INSERT INTO `vehicles` VALUES ('495', '30', '478', 'Civic sedan', '331294374402-front.png', '591294374409-back.png', '501294374420-interior.png', '101294374382-front.png', '661294374386-back.png', '71294374390-interior.png');
INSERT INTO `vehicles` VALUES ('496', '30', '479', 'Civic sedan', '291294374520-front.png', '191294374524-back.png', '461294374537-interior.png', '421294374495-front.png', '211294374500-back.png', '251294374503-interior.png');
INSERT INTO `vehicles` VALUES ('497', '30', '480', 'Civic sedan', '421294374884-front.png', '701294374888-back.png', '931294374895-interior.png', '441294374867-front.png', '541294374872-back.png', '761294374875-interior.png');
INSERT INTO `vehicles` VALUES ('498', '30', '481', 'Civic sedan', '751294374989-front.png', '681294374996-back.png', '541294375002-interior.png', '631294374971-front.png', '311294374974-back.png', '61294374979-interior.png');
INSERT INTO `vehicles` VALUES ('499', '30', '482', 'Civic sedan', '881294375531-front.png', '21294375537-back.png', '361294375544-interior.png', '191294375510-front.png', '41294375517-back.png', '691294375521-interior.png');
INSERT INTO `vehicles` VALUES ('500', '30', '483', 'Civic sedan', '821294376001-front.png', '891294376007-back.png', '701294376016-interior.png', '571294375981-front.png', '671294375987-back.png', '331294375991-interior.png');
INSERT INTO `vehicles` VALUES ('501', '30', '484', 'Civic sedan', '881294376627-front.png', '491294376631-back.png', '21294376640-interior.png', '41294376588-front.png', '501294376599-back.png', '11294376611-interior.png');
INSERT INTO `vehicles` VALUES ('502', '30', '485', 'Civic sedan', '111294376733-front.png', '861294376738-back.png', '11294376747-interior.png', '731294376715-front.png', '641294376721-back.png', '251294376724-interior.png');
INSERT INTO `vehicles` VALUES ('503', '30', '486', 'Civic sedan', '191294376857-front.png', '501294376869-back.png', '641294376877-interior.png', '371294376834-front.png', '801294376843-back.png', '741294376849-interior.png');
INSERT INTO `vehicles` VALUES ('504', '30', '487', 'Civic sedan', '111294377050-front.png', '71294377073-back.png', '191294377083-interior.png', '801294377010-front.png', '901294377025-back.png', '991294377033-interior.png');
INSERT INTO `vehicles` VALUES ('505', '30', '488', 'Civic sedan', '111294377244-front.png', '91294377251-back.png', '451294377257-interior.png', '531294377216-front.png', '711294377222-back.png', '11294377227-interior.png');
INSERT INTO `vehicles` VALUES ('506', '30', '489', 'Civic sedan', '921294377820-front.png', '781294377824-back.png', '41294377833-interior.png', '81294377794-front.png', '351294377806-back.png', '491294377812-interior.png');
INSERT INTO `vehicles` VALUES ('507', '30', '490', 'Civic sedan', '901294378012-front.png', '711294378030-back.png', '481294378041-interior.png', '491294377986-front.png', '381294377992-back.png', '71294377995-interior.png');
INSERT INTO `vehicles` VALUES ('508', '30', '491', 'Civic sedan', '581294378206-front.png', '561294378209-back.png', '651294378215-interior.png', '941294378116-front.png', '201294378124-back.png', '541294378128-interior.png');
INSERT INTO `vehicles` VALUES ('509', '30', '492', 'Civic sedan', '851294378353-front.png', '641294378359-back.png', '141294378365-interior.png', '951294378327-front.png', '911294378335-back.png', '71294378342-interior.png');
INSERT INTO `vehicles` VALUES ('510', '30', '493', 'Civic sedan', '911294378476-front.png', '951294378482-back.png', '441294378490-interior.png', '531294378455-front.png', '511294378462-back.png', '601294378466-interior.png');
INSERT INTO `vehicles` VALUES ('511', '30', '494', 'Civic sedan', '761294378596-front.png', '121294378603-back.png', '861294378609-interior.png', '361294378573-front.png', '861294378579-back.png', '91294378583-interior.png');
INSERT INTO `vehicles` VALUES ('512', '30', '495', 'Civic sedan', '681294378856-front.png', '171294378859-back.png', '81294378865-interior.png', '531294378842-front.png', '161294378846-back.png', '291294378849-interior.png');
INSERT INTO `vehicles` VALUES ('513', '30', '496', 'Civic sedan', '231294380489-front.png', '921294380494-back.png', '171294380503-interior.png', '181294380465-front.png', '301294380471-back.png', '781294380474-interior.png');
INSERT INTO `vehicles` VALUES ('514', '30', '497', 'Civic sedan', '281294380598-front.png', '921294380604-back.png', '931294380612-interior.png', '131294380580-front.png', '761294380584-back.png', '441294380587-interior.png');
INSERT INTO `vehicles` VALUES ('515', '30', '498', 'Civic sedan', '631294381647-front.png', '01294381674-back.png', '311294381682-interior.png', '661294381627-front.png', '701294381632-back.png', '01294381636-interior.png');
INSERT INTO `vehicles` VALUES ('516', '31', '499', 'Civic sedan', '791294382812-front.png', '451294382827-back.png', '611294382844-interior.png', '891294382783-front.png', '871294382790-back.png', '151294382795-interior.png');
INSERT INTO `vehicles` VALUES ('517', '31', '500', 'Civic sedan', '141294383776-front.png', '981294384384-back.png', '571294385297-interior.png', '71294383080-front.png', '311294383086-back.png', '871294383763-interior.png');
INSERT INTO `vehicles` VALUES ('518', '31', '501', 'Civic sedan', '601294386583-front.png', '371294385800-back.png', '981294385813-interior.png', '231294385725-front.png', '231294385734-back.png', '811294385743-interior.png');
INSERT INTO `vehicles` VALUES ('519', '31', '502', 'Civic sedan', '311294394419-front.png', '771294394430-back.png', '231294394437-interior.png', '221294394400-front.png', '941294394405-back.png', '771294394409-interior.png');
INSERT INTO `vehicles` VALUES ('520', '31', '503', 'Civic sedan', '51294394574-front.png', '551294394928-back.png', '401294394934-interior.png', '261294394553-front.png', '371294394909-back.png', '311294394915-interior.png');
INSERT INTO `vehicles` VALUES ('521', '31', '504', 'Civic sedan', '941294395577-front.png', '621294396008-back.png', '291294396002-interior.png', '71294395554-front.png', '351294395560-back.png', '141294395564-interior.png');
INSERT INTO `vehicles` VALUES ('522', '31', '505', 'Civic sedan', '761294396364-front.png', '441294396369-back.png', '271294396376-interior.png', '701294396333-front.png', '321294396343-back.png', '881294396350-interior.png');
INSERT INTO `vehicles` VALUES ('523', '31', '506', 'Civic sedan', '601294396508-front.png', '721294396526-back.png', '801294397020-interior.png', '441294396487-front.png', '401294396494-back.png', '371294396498-interior.png');
INSERT INTO `vehicles` VALUES ('524', '31', '507', 'Civic sedan', '411294397182-front.png', '401294397197-back.png', '491294397226-interior.png', '631294397166-front.png', '611294397170-back.png', '481294397174-interior.png');
INSERT INTO `vehicles` VALUES ('525', '31', '508', 'Civic sedan', '661294399084-front.png', '611294397684-back.png', '781294397701-interior.png', '221294397594-front.png', '51294397607-back.png', '551294399097-interior.png');
INSERT INTO `vehicles` VALUES ('526', '31', '509', 'Civic sedan', '841294399397-front.png', '891294399402-back.png', '421294399406-interior.png', '301294399380-front.png', '461294399387-back.png', '141294399391-interior.png');
INSERT INTO `vehicles` VALUES ('527', '31', '510', 'Civic sedan', '201294399495-front.png', '151294399500-back.png', '891294399502-interior.png', '51294399486-front.png', '181294399487-back.png', '911294399488-interior.png');
INSERT INTO `vehicles` VALUES ('528', '31', '511', 'Civic sedan', '291294399886-front.png', '31294400421-back.png', '511294399893-interior.png', '451294399850-front.png', '891294399857-back.png', '361294399858-interior.png');
INSERT INTO `vehicles` VALUES ('529', '31', '512', 'Civic sedan', '881294401040-front.png', '191294400558-back.png', '901294400565-interior.png', '741294400517-front.png', '521294400519-back.png', '891294400524-interior.png');
INSERT INTO `vehicles` VALUES ('530', '31', '513', 'Civic sedan', '261294401227-front.png', '581294401239-back.png', '381294401243-interior.png', '281294401192-front.png', '471294401952-back.png', '31294401206-interior.png');
INSERT INTO `vehicles` VALUES ('531', '31', '514', 'Civic sedan', '641294402136-front.png', '601294402140-back.png', '401294402144-interior.png', '851294402084-front.png', '301294402093-back.png', '11294403313-interior.png');
INSERT INTO `vehicles` VALUES ('532', '31', '515', 'Civic sedan', '601294403950-front.png', '81294403741-back.png', '111294403745-interior.png', '11294403427-front.png', '871294403949-back.png', '171294403447-interior.png');
INSERT INTO `vehicles` VALUES ('533', '31', '516', 'Civic sedan', '931294404080-front.png', '61294404093-back.png', '511294404114-interior.png', '531294404055-front.png', '181294404061-back.png', '791294404064-interior.png');
INSERT INTO `vehicles` VALUES ('534', '31', '517', 'Civic sedan', '771294404494-front.png', '641294404500-back.png', '361294404507-interior.png', '911294404285-front.png', '451294404624-back.png', '21294404508-interior.png');
INSERT INTO `vehicles` VALUES ('535', '31', '518', 'Civic sedan', '231294404740-front.png', '871294404749-back.png', '741294404759-interior.png', '601294404722-front.png', '91294404728-back.png', '811294404733-interior.png');
INSERT INTO `vehicles` VALUES ('536', '31', '519', 'Civic sedan', '651294633654-front.png', '471294633658-back.png', '521294633664-interior.png', '591294633640-front.png', '351294633646-back.png', '81294633647-interior.png');
INSERT INTO `vehicles` VALUES ('537', '31', '520', 'Civic sedan', '861294633757-front.png', '571294633760-back.png', '401294633766-interior.png', '171294633740-front.png', '271294633746-back.png', '41294633749-interior.png');
INSERT INTO `vehicles` VALUES ('538', '31', '521', 'Civic sedan', '571294633952-front.png', '91294633952-back.png', '551294633956-interior.png', '181294633843-front.png', '881294633850-back.png', '281294633859-interior.png');
INSERT INTO `vehicles` VALUES ('539', '31', '522', 'Civic sedan', '751294634065-front.png', '161294634069-back.png', '511294634070-interior.png', '931294634053-front.png', '911294634058-back.png', '771294634059-interior.png');
INSERT INTO `vehicles` VALUES ('540', '31', '523', 'Civic sedan', '401294634800-front.png', '201294634803-back.png', '51294634809-interior.png', '51294634788-front.png', '641294634793-back.png', '731294634795-interior.png');
INSERT INTO `vehicles` VALUES ('541', '31', '524', 'Civic sedan', '81294634900-front.png', '571294634902-back.png', '391294634907-interior.png', '121294634887-front.png', '251294634893-back.png', '181294634894-interior.png');
INSERT INTO `vehicles` VALUES ('542', '31', '525', 'Civic sedan', '301294635011-front.png', '71294635016-back.png', '311294635019-interior.png', '91294635000-front.png', '851294635004-back.png', '931294635004-interior.png');
INSERT INTO `vehicles` VALUES ('543', '31', '526', 'Civic sedan', '31294635121-front.png', '341294635124-back.png', '841294635129-interior.png', '441294635111-front.png', '101294635114-back.png', '851294635116-interior.png');
INSERT INTO `vehicles` VALUES ('544', '31', '527', 'Civic sedan', '131294635254-front.png', '441294635257-back.png', '151294635261-interior.png', '471294635240-front.png', '871294635244-back.png', '131294635245-interior.png');
INSERT INTO `vehicles` VALUES ('545', '31', '528', 'Civic sedan', '81294635714-front.png', '691294635368-back.png', '321294635375-interior.png', '501294635357-front.png', '231294635354-back.png', '261294635355-interior.png');
INSERT INTO `vehicles` VALUES ('546', '31', '529', 'Civic sedan', '821294635830-front.png', '181294635833-back.png', '961294635838-interior.png', '311294635819-front.png', '391294635823-back.png', '691294635824-interior.png');
INSERT INTO `vehicles` VALUES ('547', '31', '530', 'Civic sedan', '271294635939-front.png', '211294635942-back.png', '561294635946-interior.png', '251294635926-front.png', '841294635934-back.png', '51294635931-interior.png');
INSERT INTO `vehicles` VALUES ('548', '31', '531', 'Civic sedan', '381294636060-front.png', '521294636480-back.png', '501294636069-interior.png', '711294636047-front.png', '891294636052-back.png', '11294636053-interior.png');
INSERT INTO `vehicles` VALUES ('549', '31', '532', 'Civic sedan', '461294636578-front.png', '941294636582-back.png', '551294636589-interior.png', '271294636568-front.png', '461294636573-back.png', '861294636573-interior.png');
INSERT INTO `vehicles` VALUES ('550', '31', '533', 'Civic sedan', '51294636695-front.png', '151294637030-back.png', '461294636707-interior.png', '181294636685-front.png', '861294636689-back.png', '571294636690-interior.png');
INSERT INTO `vehicles` VALUES ('551', '31', '534', 'Civic sedan', '501294637134-front.png', '491294637137-back.png', '351294637140-interior.png', '731294637122-front.png', '731294637128-back.png', '321294637128-interior.png');
INSERT INTO `vehicles` VALUES ('552', '31', '535', 'Civic sedan', '961294637246-front.png', '411294637275-back.png', '631294637273-interior.png', '681294637225-front.png', '291294637227-back.png', '811294637232-interior.png');
INSERT INTO `vehicles` VALUES ('553', '31', '536', 'Civic sedan', '991294637421-front.png', '641294637423-back.png', '291294637432-interior.png', '451294637409-front.png', '591294637414-back.png', '721294637415-interior.png');
INSERT INTO `vehicles` VALUES ('554', '31', '537', 'Civic sedan', '621294638295-front.png', '221294638298-back.png', '771294638302-interior.png', '261294638283-front.png', '891294638287-back.png', '541294638289-interior.png');
INSERT INTO `vehicles` VALUES ('555', '31', '538', 'Civic sedan', '351294638718-front.png', '251294638418-back.png', '421294638426-interior.png', '981294638401-front.png', '561294638402-back.png', '731294638406-interior.png');
INSERT INTO `vehicles` VALUES ('556', '32', '539', 'Civic sedan', '181294638887-front.png', '561294638893-back.png', '391294638909-interior.png', '751294638876-front.png', '231294638879-back.png', '531294638889-interior.png');
INSERT INTO `vehicles` VALUES ('557', '32', '540', 'Civic sedan', '231294639580-front.png', '651294639580-back.png', '421294639601-interior.png', '101294639567-front.png', '471294639570-back.png', '741294639573-interior.png');
INSERT INTO `vehicles` VALUES ('558', '32', '541', 'Civic sedan', '731294641317-front.png', '391294641329-back.png', '81294641347-interior.png', '161294641301-front.png', '631294641305-back.png', '361294641308-interior.png');
INSERT INTO `vehicles` VALUES ('559', '32', '542', 'Civic sedan', '251294642285-front.png', '401294641569-back.png', '581294641607-interior.png', '561294641542-front.png', '61294641547-back.png', '931294641548-interior.png');
INSERT INTO `vehicles` VALUES ('560', '32', '543', 'Civic sedan', '411294643172-front.png', '581294642556-back.png', '41294642578-interior.png', '591294642518-front.png', '591294642547-back.png', '761294642522-interior.png');
INSERT INTO `vehicles` VALUES ('561', '32', '544', 'Civic sedan', '421294643273-front.png', '611294643278-back.png', '401294643280-interior.png', '331294643262-front.png', '681294643266-back.png', '341294643267-interior.png');
INSERT INTO `vehicles` VALUES ('562', '32', '545', 'Civic sedan', '451294644046-front.png', '21294644051-back.png', '261294644071-interior.png', '491294644036-front.png', '711294644039-back.png', '451294644039-interior.png');
INSERT INTO `vehicles` VALUES ('563', '17', '546', 'Accord Sedan', '711294644511-car_front.png', '871294644518-back.png', '541294644529-interior.png', '911294644508-car_front.png', '421294644500-back.png', '161294644504-interior.png');
INSERT INTO `vehicles` VALUES ('564', '32', '547', 'Civic sedan', '451294644765-front.png', '661294644767-back.png', '651294644783-interior.png', '291294644753-front.png', '651294644755-back.png', '831294644756-interior.png');
INSERT INTO `vehicles` VALUES ('565', '17', '548', 'Accord Sedan', '71294645081-car_front.png', '171294645083-back.png', '871294645090-interior.png', '641294645070-car_front.png', '611294645074-back.png', '771294645075-interior.png');
INSERT INTO `vehicles` VALUES ('566', '32', '549', 'Civic sedan', '791294645208-front.png', '871294645552-back.png', '181294645237-interior.png', '311294645194-front.png', '401294645195-back.png', '731294645198-interior.png');
INSERT INTO `vehicles` VALUES ('567', '17', '550', 'Accord Sedan', '741294645515-car_front.png', '731294645527-back.png', '571294645533-interior.png', '361294645504-car_front.png', '41294645508-back.png', '711294645509-interior.png');
INSERT INTO `vehicles` VALUES ('568', '32', '551', 'Civic sedan', '651294645644-front.png', '411294645649-back.png', '741294645654-interior.png', '401294645634-front.png', '481294645638-back.png', '251294645639-interior.png');
INSERT INTO `vehicles` VALUES ('569', '32', '552', 'Civic sedan', '181294645770-front.png', '281294645775-back.png', '741294645779-interior.png', '801294645759-front.png', '701294645763-back.png', '81294645764-interior.png');
INSERT INTO `vehicles` VALUES ('570', '32', '553', 'Civic sedan', '111294645890-front.png', '641294645891-back.png', '521294645897-interior.png', '921294645879-front.png', '371294645883-back.png', '441294645884-interior.png');
INSERT INTO `vehicles` VALUES ('571', '32', '554', 'Civic sedan', '761294646382-front.png', '151294646003-back.png', '671294646009-interior.png', '521294645989-front.png', '201294645994-back.png', '381294645995-interior.png');
INSERT INTO `vehicles` VALUES ('572', '32', '555', 'Civic sedan', '661294646469-front.png', '41294646472-back.png', '911294646477-interior.png', '631294646455-front.png', '651294646463-back.png', '551294646469-interior.png');
INSERT INTO `vehicles` VALUES ('573', '32', '556', 'Civic sedan', '891294646585-front.png', '51294646587-back.png', '661294646591-interior.png', '881294646575-front.png', '431294646579-back.png', '211294646580-interior.png');
INSERT INTO `vehicles` VALUES ('574', '32', '557', 'Civic sedan', '141294646678-front.png', '391294646680-back.png', '531294646684-interior.png', '771294646668-front.png', '51294646672-back.png', '471294646673-interior.png');
INSERT INTO `vehicles` VALUES ('575', '17', '558', 'Accord Sedan', '501294646819-car_front.png', '701294646860-back.png', '631294646901-interior.png', '941294646795-car_front.png', '171294646800-back.png', '501294646801-interior.png');
INSERT INTO `vehicles` VALUES ('576', '32', '559', 'Civic sedan', '841294647046-front.png', '741294647051-back.png', '11294647057-interior.png', '371294647035-front.png', '261294647039-back.png', '341294647040-interior.png');
INSERT INTO `vehicles` VALUES ('577', '17', '560', 'Accord Sedan', '931294647328-car_front.png', '111294647332-back.png', '861294647340-interior.png', '851294647316-car_front.png', '871294647319-back.png', '921294647321-interior.png');
INSERT INTO `vehicles` VALUES ('578', '17', '561', 'Accord Sedan', '971294647492-car_front.png', '651294647498-back.png', '671294647503-interior.png', '361294647470-car_front.png', '131294647474-back.png', '951294647475-interior.png');
INSERT INTO `vehicles` VALUES ('579', '17', '562', 'Accord Sedan', '481294647629-car_front.png', '431294647634-back.png', '391294647638-interior.png', '711294647618-car_front.png', '851294647620-back.png', '951294647622-interior.png');
INSERT INTO `vehicles` VALUES ('580', '32', '563', 'Civic sedan', '861294647309-front.png', '481294647726-back.png', '251294647323-interior.png', '961294647295-front.png', '941294647300-back.png', '771294647300-interior.png');
INSERT INTO `vehicles` VALUES ('581', '17', '564', 'Accord Sedan', '211294647804-car_front.png', '691294647819-back.png', '431294647828-interior.png', '121294647787-car_front.png', '561294647792-back.png', '01294647795-interior.png');
INSERT INTO `vehicles` VALUES ('582', '32', '565', 'Civic sedan', '521294647859-front.png', '341294648282-back.png', '841294647881-interior.png', '391294647843-front.png', '181294647847-back.png', '151294647849-interior.png');
INSERT INTO `vehicles` VALUES ('583', '17', '566', 'Accord Sedan', '811294648276-car_front.png', '611294648284-back.png', '481294648300-interior.png', '891294648252-car_front.png', '741294648256-back.png', '681294648258-interior.png');
INSERT INTO `vehicles` VALUES ('584', '32', '567', 'Civic sedan', '641294648388-front.png', '891294648806-back.png', '941294648399-interior.png', '351294648377-front.png', '371294648380-back.png', '271294648381-interior.png');
INSERT INTO `vehicles` VALUES ('585', '33', '568', 'Civic sedan', '221294649092-front.png', '181294649128-back.png', '441294649121-interior.png', '551294649082-front.png', '111294649076-back.png', '751294649078-interior.png');
INSERT INTO `vehicles` VALUES ('586', '33', '569', 'Civic sedan', '271294649293-front.png', '101294649298-back.png', '741294649355-interior.png', '771294649280-front.png', '231294649280-back.png', '41294649289-interior.png');
INSERT INTO `vehicles` VALUES ('587', '33', '570', 'Civic sedan', '291294653652-front.png', '731294649579-back.png', '401294649594-interior.png', '331294649539-front.png', '111294649550-back.png', '181294649544-interior.png');
INSERT INTO `vehicles` VALUES ('588', '33', '571', 'Civic sedan', '191294653753-front.png', '761294653758-back.png', '911294653763-interior.png', '521294653741-front.png', '671294653746-back.png', '601294653746-interior.png');
INSERT INTO `vehicles` VALUES ('589', '33', '572', 'Civic sedan', '31294654043-front.png', '821294654065-back.png', '131294654072-interior.png', '791294654023-front.png', '651294654027-back.png', '841294654027-interior.png');
INSERT INTO `vehicles` VALUES ('590', '33', '573', 'Civic sedan', '131294654775-front.png', '831294654322-back.png', '711294654336-interior.png', '21294654302-front.png', '551294654305-back.png', '511294654310-interior.png');
INSERT INTO `vehicles` VALUES ('591', '33', '574', 'Civic sedan', '291294655000-front.png', '151294655004-back.png', '971294655009-interior.png', '941294654988-front.png', '571294654993-back.png', '221294654995-interior.png');
INSERT INTO `vehicles` VALUES ('592', '33', '575', 'Civic sedan', '501294655264-front.png', '101294655293-back.png', '891294655280-interior.png', '451294655243-front.png', '291294655245-back.png', '631294655247-interior.png');
INSERT INTO `vehicles` VALUES ('593', '33', '576', 'Civic sedan', '951294655520-front.png', '841294655525-back.png', '71294655536-interior.png', '951294655513-front.png', '131294655513-back.png', '561294655517-interior.png');
INSERT INTO `vehicles` VALUES ('594', '33', '577', 'Civic sedan', '821294655639-front.png', '311294655658-back.png', '381294655656-interior.png', '331294655626-front.png', '71294655632-back.png', '391294655633-interior.png');
INSERT INTO `vehicles` VALUES ('595', '33', '578', 'Civic sedan', '271294655974-front.png', '931294656307-back.png', '521294655980-interior.png', '931294655960-front.png', '671294655964-back.png', '441294655964-interior.png');
INSERT INTO `vehicles` VALUES ('596', '33', '579', 'Civic sedan', '631294656454-front.png', '541294656447-back.png', '741294656455-interior.png', '191294656436-front.png', '201294656438-back.png', '501294656442-interior.png');
INSERT INTO `vehicles` VALUES ('597', '33', '580', 'Civic sedan', '411294656643-front.png', '411294656659-back.png', '811294656684-interior.png', '51294656616-front.png', '711294657035-back.png', '371294656626-interior.png');
INSERT INTO `vehicles` VALUES ('598', '33', '581', 'Civic sedan', '391294658581-front.png', '391294658581-back.png', '371294658590-interior.png', '01294658564-front.png', '581294658570-back.png', '361294658575-interior.png');
INSERT INTO `vehicles` VALUES ('599', '33', '582', 'Civic sedan', '861294658842-front.png', '481294658842-back.png', '351294658850-interior.png', '891294658824-front.png', '621294658828-back.png', '831294658828-interior.png');
INSERT INTO `vehicles` VALUES ('600', '17', '583', 'Accord Sedan', '531294658948-car_front.png', '391294658947-back.png', '391294658954-interior.png', '91294658935-car_front.png', '101294658933-back.png', '421294658937-interior.png');
INSERT INTO `vehicles` VALUES ('601', '17', '584', 'Accord Sedan', '231294659058-car_front.png', '851294659064-back.png', '791294659074-interior.png', '31294659043-car_front.png', '61294659048-back.png', '521294659049-interior.png');
INSERT INTO `vehicles` VALUES ('602', '33', '585', 'Civic sedan', '541294659094-front.png', '181294659099-back.png', '151294659103-interior.png', '821294659078-front.png', '521294659082-back.png', '51294659083-interior.png');
INSERT INTO `vehicles` VALUES ('603', '17', '586', 'Accord Sedan', '441294659184-car_front.png', '701294659193-back.png', '151294659202-interior.png', '401294659166-car_front.png', '691294659177-back.png', '311294659186-interior.png');
INSERT INTO `vehicles` VALUES ('604', '17', '587', 'Accord Sedan', '251294659343-car_front.png', '331294659345-back.png', '481294659350-interior.png', '941294659324-car_front.png', '261294659326-back.png', '81294659332-interior.png');
INSERT INTO `vehicles` VALUES ('605', '17', '588', 'Accord Sedan', '221294659451-car_front.png', '661294659458-back.png', '261294659461-interior.png', '401294659436-car_front.png', '81294659443-back.png', '331294659444-interior.png');
INSERT INTO `vehicles` VALUES ('606', '33', '589', 'Civic sedan', '381294659326-front.png', '541294659339-back.png', '761294659350-interior.png', '311294659316-front.png', '561294659318-back.png', '21294659326-interior.png');
INSERT INTO `vehicles` VALUES ('607', '17', '590', 'Accord Sedan', '51294659654-car_front.png', '491294659658-back.png', '821294659665-interior.png', '901294659641-car_front.png', '71294659645-back.png', '201294659646-Untitled-1.png');
INSERT INTO `vehicles` VALUES ('608', '17', '591', 'Accord Sedan', '451294659776-car_front.png', '821294659780-back.png', '201294659785-interior.png', '21294659765-car_front.png', '611294659769-back.png', '271294659770-interior.png');
INSERT INTO `vehicles` VALUES ('609', '17', '592', 'Accord Sedan', '231294659904-car_front.png', '641294659918-back.png', '881294659924-interior.png', '841294659889-car_front.png', '61294659894-back.png', '921294659900-interior.png');
INSERT INTO `vehicles` VALUES ('610', '17', '593', 'Accord Sedan', '931294660027-car_front.png', '931294660033-back.png', '641294660037-interior.png', '131294660014-car_front.png', '611294660018-back.png', '931294660019-interior.png');
INSERT INTO `vehicles` VALUES ('611', '17', '594', 'Accord Sedan', '681294660164-car_front.png', '41294660172-back.png', '801294660179-interior.png', '741294660151-car_front.png', '571294660158-back.png', '681294660158-interior.png');
INSERT INTO `vehicles` VALUES ('612', '17', '595', 'Accord Sedan', '81294660274-car_front.png', '531294660274-back.png', '671294660281-interior.png', '721294660256-car_front.png', '891294660260-back.png', '211294660261-interior.png');
INSERT INTO `vehicles` VALUES ('613', '17', '596', 'Accord Sedan', '621294660382-car_front.png', '991294660386-back.png', '671294660391-interior.png', '921294660368-car_front.png', '101294660373-back.png', '101294660373-interior.png');
INSERT INTO `vehicles` VALUES ('614', '33', '597', 'Civic sedan', '701294660545-front.png', '741294660539-back.png', '51294660560-interior.png', '781294659676-front.png', '561294659680-back.png', '111294659681-interior.png');
INSERT INTO `vehicles` VALUES ('615', '33', '598', 'Civic sedan', '631294660693-front.png', '201294660703-back.png', '421294660704-interior.png', '231294660681-front.png', '611294660682-back.png', '791294660684-interior.png');
INSERT INTO `vehicles` VALUES ('616', '33', '599', 'Civic sedan', '501294660849-front.png', '911294660851-back.png', '661294660886-interior.png', '361294660843-front.png', '961294660843-back.png', '811294660844-interior.png');
INSERT INTO `vehicles` VALUES ('617', '33', '600', 'Civic sedan', '471294661147-front.png', '191294661153-back.png', '381294661165-interior.png', '271294661130-front.png', '41294661128-back.png', '541294661142-interior.png');
INSERT INTO `vehicles` VALUES ('618', '33', '601', 'Civic sedan', '891294661375-front.png', '881294661379-back.png', '161294661384-interior.png', '561294661359-front.png', '601294661361-back.png', '661294661367-interior.png');
INSERT INTO `vehicles` VALUES ('619', '33', '602', 'Civic sedan', '781294661471-front.png', '331294661475-back.png', '161294661480-interior.png', '01294661460-front.png', '431294661462-back.png', '311294661466-interior.png');
INSERT INTO `vehicles` VALUES ('620', '33', '603', 'Civic sedan', '511294662762-front.png', '761294662767-back.png', '771294662778-interior.png', '741294662750-front.png', '581294662751-back.png', '191294662753-interior.png');
INSERT INTO `vehicles` VALUES ('621', '33', '604', 'Civic sedan', '581294662891-front.png', '851294663197-back.png', '701294662907-interior.png', '411294662879-front.png', '951294662884-back.png', '451294662885-interior.png');
INSERT INTO `vehicles` VALUES ('622', '33', '605', 'Civic sedan', '611294663362-front.png', '581294663373-back.png', '681294663377-interior.png', '171294663347-front.png', '911294663352-back.png', '271294663357-interior.png');
INSERT INTO `vehicles` VALUES ('623', '33', '606', 'Civic sedan', '551294663939-front.png', '711294663929-back.png', '801294663943-interior.png', '891294663889-front.png', '261294663894-back.png', '321294663919-interior.png');
INSERT INTO `vehicles` VALUES ('624', '33', '607', 'Civic sedan', '841294664051-front.png', '481294664058-back.png', '561294664074-interior.png', '231294664038-front.png', '191294664055-back.png', '381294664045-interior.png');
INSERT INTO `vehicles` VALUES ('625', '33', '608', 'Civic sedan', '871294719316-front.png', '161294719327-back.png', '221294719328-interior.png', '621294719306-front.png', '851294719310-back.png', '721294719310-interior.png');
INSERT INTO `vehicles` VALUES ('626', '33', '609', 'Civic sedan', '81294719447-front.png', '871294719896-back.png', '271294719459-interior.png', '111294719432-front.png', '581294719437-back.png', '661294719437-interior.png');
INSERT INTO `vehicles` VALUES ('627', '33', '610', 'Civic sedan', '251294720002-front.png', '131294720010-back.png', '101294720010-interior.png', '731294719993-front.png', '861294719997-back.png', '811294719998-interior.png');
INSERT INTO `vehicles` VALUES ('628', '33', '611', 'Civic sedan', '421294720139-front.png', '561294720139-back.png', '851294720148-interior.png', '761294720124-front.png', '111294720128-back.png', '481294720128-interior.png');
INSERT INTO `vehicles` VALUES ('629', '33', '612', 'Civic sedan', '191294720525-front.png', '361294720531-back.png', '971294720536-interior.png', '291294720513-front.png', '271294720517-back.png', '571294720518-interior.png');
INSERT INTO `vehicles` VALUES ('630', '33', '613', 'Civic sedan', '91294720646-front.png', '511294720649-back.png', '671294720657-interior.png', '951294720634-front.png', '881294720639-back.png', '441294720642-interior.png');
INSERT INTO `vehicles` VALUES ('631', '33', '614', 'Civic sedan', '341294720861-front.png', '631294720867-back.png', '661294720875-interior.png', '701294720852-front.png', '741294720853-back.png', '811294720855-interior.png');
INSERT INTO `vehicles` VALUES ('632', '33', '615', 'Civic sedan', '101294720972-front.png', '821294720983-back.png', '841294720981-interior.png', '471294720960-front.png', '961294720964-back.png', '141294720965-interior.png');
INSERT INTO `vehicles` VALUES ('633', '33', '616', 'Civic sedan', '321294721227-front.png', '401294721230-back.png', '831294721235-interior.png', '721294721216-front.png', '941294721217-back.png', '591294721219-interior.png');
INSERT INTO `vehicles` VALUES ('634', '33', '617', 'Civic sedan', '701294721401-front.png', '681294721407-back.png', '261294721412-interior.png', '411294721390-front.png', '101294721393-back.png', '851294721394-interior.png');
INSERT INTO `vehicles` VALUES ('635', '33', '618', 'Civic sedan', '211294721630-front.png', '611294721631-back.png', '261294721637-interior.png', '121294721612-front.png', '761294721617-back.png', '981294721618-interior.png');
INSERT INTO `vehicles` VALUES ('636', '33', '619', 'Civic sedan', '491294721837-front.png', '901294721843-back.png', '911294721848-interior.png', '781294721827-front.png', '181294721830-back.png', '391294721831-interior.png');
INSERT INTO `vehicles` VALUES ('637', '34', '620', 'Civic sedan', '41294722207-front.png', '941294722199-back.png', '101294722206-interior.png', '71294722183-front.png', '81294722187-back.png', '371294722188-interior.png');
INSERT INTO `vehicles` VALUES ('638', '34', '621', 'Civic sedan', '471294722520-front.png', '491294722521-back.png', '401294722528-interior.png', '271294722502-front.png', '691294722510-back.png', '281294722507-interior.png');
INSERT INTO `vehicles` VALUES ('639', '34', '622', 'Civic sedan', '481294722735-front.png', '921294722744-back.png', '171294722744-interior.png', '871294722725-front.png', '141294722729-back.png', '101294722729-interior.png');
INSERT INTO `vehicles` VALUES ('640', '34', '623', 'Civic sedan', '261294723025-front.png', '201294723030-back.png', '421294723035-interior.png', '981294723013-front.png', '341294723012-back.png', '581294723013-interior.png');
INSERT INTO `vehicles` VALUES ('641', '34', '624', 'Civic sedan', '991294723254-front.png', '691294723262-back.png', '771294723264-interior.png', '31294723244-front.png', '671294723248-back.png', '931294723249-interior.png');
INSERT INTO `vehicles` VALUES ('642', '34', '625', 'Civic sedan', '141294723996-front.png', '971294724002-back.png', '701294724004-interior.png', '661294723985-front.png', '261294723989-back.png', '811294723990-interior.png');
INSERT INTO `vehicles` VALUES ('643', '17', '626', 'Accord Sedan', '691294724265-car_front.png', '51294724272-back.png', '671294724277-interior.png', '811294724254-car_front.png', '591294724257-back.png', '921294724256-interior.png');
INSERT INTO `vehicles` VALUES ('644', '17', '627', 'Accord Sedan', '271294724395-car_front.png', '801294724401-back.png', '321294724403-interior.png', '941294724388-car_front.png', '871294724387-back.png', '241294724388-interior.png');
INSERT INTO `vehicles` VALUES ('645', '34', '628', 'Civic sedan', '231294724247-front.png', '561294724245-back.png', '111294724256-interior.png', '841294724230-front.png', '671294724234-back.png', '761294724237-interior.png');
INSERT INTO `vehicles` VALUES ('646', '17', '629', 'Accord Sedan', '571294724513-car_front.png', '971294724523-back.png', '251294724526-interior.png', '101294724494-car_front.png', '741294724500-back.png', '721294724502-interior.png');
INSERT INTO `vehicles` VALUES ('647', '17', '630', 'Accord Sedan', '61294724768-car_front.png', '821294724772-back.png', '321294724783-interior.png', '601294724752-car_front.png', '451294724760-back.png', '891294724762-interior.png');
INSERT INTO `vehicles` VALUES ('648', '17', '631', 'Accord Sedan', '741294724885-car_front.png', '891294724891-back.png', '241294724904-interior.png', '591294724869-car_front.png', '591294724873-back.png', '911294724874-interior.png');
INSERT INTO `vehicles` VALUES ('649', '34', '632', 'Civic sedan', '231294724584-front.png', '581294724596-back.png', '481294724615-interior.png', '341294724931-front.png', '861294724567-back.png', '161294724571-interior.png');
INSERT INTO `vehicles` VALUES ('650', '17', '633', 'Accord Sedan', '751294725027-car_front.png', '201294725036-back.png', '911294725051-interior.png', '541294725012-car_front.png', '261294725013-back.png', '391294725015-interior.png');
INSERT INTO `vehicles` VALUES ('651', '34', '634', 'Civic sedan', '731294725023-front.png', '941294725035-back.png', '31294725050-interior.png', '231294725035-front.png', '211294725018-back.png', '321294725019-interior.png');
INSERT INTO `vehicles` VALUES ('652', '17', '635', 'Accord Sedan', '621294725181-car_front.png', '871294725184-back.png', '941294725196-interior.png', '141294725159-car_front.png', '101294725164-back.png', '171294725162-interior.png');
INSERT INTO `vehicles` VALUES ('653', '17', '636', 'Accord Sedan', '931294725301-car_front.png', '01294725305-back.png', '251294725310-interior.png', '191294725286-car_front.png', '741294725288-back.png', '891294725290-interior.png');
INSERT INTO `vehicles` VALUES ('654', '34', '637', 'Civic sedan', '591294725189-front.png', '491294725185-back.png', '681294725199-interior.png', '711294725166-front.png', '331294725173-back.png', '881294725171-interior.png');
INSERT INTO `vehicles` VALUES ('655', '17', '638', 'Accord Sedan', '61294725419-car_front.png', '751294725425-back.png', '951294725428-interior.png', '851294725404-car_front.png', '381294725408-back.png', '81294725411-interior.png');
INSERT INTO `vehicles` VALUES ('656', '17', '639', 'Accord Sedan', '411294725523-car_front.png', '931294725528-back.png', '631294725532-interior.png', '851294725506-car_front.png', '421294725510-back.png', '731294725511-interior.png');
INSERT INTO `vehicles` VALUES ('657', '34', '640', 'Civic sedan', '251294725485-front.png', '471294725481-back.png', '501294725490-interior.png', '441294725466-front.png', '281294725470-back.png', '691294725474-interior.png');
INSERT INTO `vehicles` VALUES ('658', '17', '641', 'Accord Sedan', '241294725706-car_front.png', '941294725720-back.png', '731294725727-interior.png', '721294725682-car_front.png', '601294725683-back.png', '661294725685-interior.png');
INSERT INTO `vehicles` VALUES ('659', '17', '642', 'Accord Sedan', '241294725843-car_front.png', '741294725838-back.png', '831294725848-interior.png', '481294725822-car_front.png', '821294725822-back.png', '391294725825-interior.png');
INSERT INTO `vehicles` VALUES ('660', '34', '643', 'Civic sedan', '401294725779-front.png', '11294726405-back.png', '841294725802-interior.png', '241294725764-front.png', '171294725763-back.png', '451294725764-interior.png');
INSERT INTO `vehicles` VALUES ('661', '17', '644', 'Accord Sedan', '941295000326-car_front.png', '271295000367-back.png', '811295000367-interior.png', '21295000312-car_front.png', '331295000330-back.png', '601295000319-interior.png');
INSERT INTO `vehicles` VALUES ('662', '17', '645', 'Accord Sedan', '141295000658-car_front.png', '971295000662-back.png', '501295000666-interior.png', '631295000640-car_front.png', '941295000643-back.png', '201295000645-interior.png');
INSERT INTO `vehicles` VALUES ('663', '17', '646', 'Accord Sedan', '701295000812-car_front.png', '671295000808-back.png', '911295000817-interior.png', '21295000795-car_front.png', '491295000795-back.png', '761295000796-interior.png');
INSERT INTO `vehicles` VALUES ('664', '17', '647', 'Accord Sedan', '721295000969-car_front.png', '401295000971-back.png', '181295000975-interior.png', '651295000956-car_front.png', '711295000957-back.png', '461295000959-interior.png');
INSERT INTO `vehicles` VALUES ('665', '17', '648', 'Accord Sedan', '881295001450-car_front.png', '101295001453-back.png', '391295001458-interior.png', '491295001344-car_front.png', '651295001346-back.png', '521295001349-interior.png');
INSERT INTO `vehicles` VALUES ('666', '17', '649', 'Accord Sedan', '91295001646-car_front.png', '301295001651-back.png', '741295001654-interior.png', '511295001634-car_front.png', '791295001635-back.png', '751295001640-interior.png');
INSERT INTO `vehicles` VALUES ('667', '17', '650', 'Accord Sedan', '871295001820-car_front.png', '761295001824-back.png', '771295001837-interior.png', '961295001806-car_front.png', '451295001808-back.png', '811295001811-interior.png');
INSERT INTO `vehicles` VALUES ('668', '17', '651', 'Accord Sedan', '671295002058-car_front.png', '761295002063-back.png', '921295002071-interior.png', '431295002044-car_front.png', '881295002047-back.png', '361295002049-interior.png');
INSERT INTO `vehicles` VALUES ('669', '17', '652', 'Accord Sedan', '121295002214-car_front.png', '621295002219-back.png', '91295002228-interior.png', '751295002201-car_front.png', '161295002203-back.png', '201295002205-interior.png');
INSERT INTO `wheel_assets` VALUES ('1', '1', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('2', '2', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('3', '3', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('4', '4', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('5', '5', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('6', '6', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('7', '7', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('8', '8', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('9', '9', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('10', '10', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('11', '11', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('12', '12', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('13', '13', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('14', '14', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('15', '15', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('16', '16', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('17', '17', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('18', '18', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('19', '19', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('20', '20', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('21', '21', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('22', '22', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('23', '23', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('24', '24', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('25', '25', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('26', '26', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('27', '27', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('28', '28', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('29', '29', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('30', '30', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('31', '31', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('32', '32', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('33', '33', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('34', '34', '261303214652-front_big.png', '121303214670-back_big.png', '_blank', '_blank', '851303214608-front_small.png', '561303214628-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('35', '35', '761303276914-front_big.png', '851303276932-back_big.png', '_blank', '_blank', '701303276877-front_small.png', '741303276891-back_small.png', '_blank');
INSERT INTO `wheel_assets` VALUES ('36', '36', '531303277223-front_big.png', '541303277242-back_big.png', '_blank', '_blank', '121303277196-front_small.png', '871303277211-back_small.png', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('1', '1', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('2', '2', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('3', '3', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('4', '4', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('5', '5', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('6', '6', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('7', '7', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('8', '8', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('9', '9', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('10', '10', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('11', '11', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('12', '12', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('13', '13', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('14', '14', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('15', '15', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('16', '16', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('17', '17', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('18', '18', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('19', '19', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('20', '20', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('21', '21', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('22', '22', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('23', '23', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('24', '24', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('25', '25', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('26', '26', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('27', '27', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('28', '28', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('29', '29', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('30', '30', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('31', '31', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('32', '32', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('33', '33', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('34', '34', '[{\"dimentions\":{\"tx\":560,\"ty\":365,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":375,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":137,\"ty\":189,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":40,\"ty\":322,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('35', '35', '[{\"dimentions\":{\"tx\":560,\"ty\":364,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":332,\"ty\":374,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"tx\":136,\"ty\":185,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '[{\"dimentions\":{\"tx\":38,\"ty\":321,\"a\":1,\"b\":0,\"c\":0,\"d\":1}}]', '_blank');
INSERT INTO `wheel_dimentions` VALUES ('36', '36', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":558,\"ty\":365,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":333,\"ty\":374,\"d\":1}}]', '_blank', '_blank', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":135,\"ty\":185,\"d\":1}}]', '[{\"dimentions\":{\"a\":1,\"b\":0,\"c\":0,\"tx\":40,\"ty\":321,\"d\":1}}]', '_blank');
INSERT INTO `wheel_types` VALUES ('1', '3', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('2', '3', 'Honda', '', '0');
INSERT INTO `wheel_types` VALUES ('3', '4', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('4', '4', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('5', '5', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('6', '5', 'Honda', '', '0');
INSERT INTO `wheel_types` VALUES ('7', '3', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('8', '3', 'Tis', '', '0');
INSERT INTO `wheel_types` VALUES ('9', '5', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('10', '6', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('11', '6', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('12', '43', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('13', '43', 'Honda', '', '0');
INSERT INTO `wheel_types` VALUES ('14', '43', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('15', '44', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('16', '45', 'American Racing', '', '0');
INSERT INTO `wheel_types` VALUES ('17', '45', 'Moteqi', '', '0');
INSERT INTO `wheel_types` VALUES ('18', '45', 'Tis', '', '0');
INSERT INTO `wheels` VALUES ('1', '21', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('2', '21', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('3', '21', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('4', '22', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('5', '22', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('6', '22', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('7', '23', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('8', '23', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('9', '23', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('10', '24', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('11', '24', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('12', '24', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('13', '25', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('14', '25', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('15', '25', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('16', '26', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('17', '26', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('18', '26', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('19', '27', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('20', '27', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('21', '27', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('22', '28', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('23', '28', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('24', '28', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('25', '29', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('26', '29', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('27', '29', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('28', '30', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('29', '30', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('30', '30', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('31', '31', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('32', '31', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('33', '31', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `wheels` VALUES ('34', '32', '1', '1', 'Casino diamond', 'Toyota', 'Test Decription will come here .Test Decription will come here \rTest Decription will come here Test Decription will come here \r\r', '336578-5478', '1', '641303214589-big_front_F.png', '365', '34');
INSERT INTO `wheels` VALUES ('35', '32', '1', '1', 'Casino Black', 'Honda', 'asdasd asdasdasdasd\r', '5588745-6654', '1', '421303276861-big_Font_F.png', '452.36', '24.36');
INSERT INTO `wheels` VALUES ('36', '32', '1', '1', 'Split polished', 'Honda', 'Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . Dummy Text will come here  . \r', '224455-ASD-455', '1', '671303277177-big_Front_F.png', '250.78', '34.25');
INSERT INTO `years` VALUES ('1', '2008', '');
INSERT INTO `years` VALUES ('2', '2009', '');
INSERT INTO `years` VALUES ('3', '2010', '');
INSERT INTO `years` VALUES ('4', '2011', '');
