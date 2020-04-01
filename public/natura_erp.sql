-- MySQL dump 10.17  Distrib 10.3.20-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: natura_erp
-- ------------------------------------------------------
-- Server version	10.3.20-MariaDB-1:10.3.20+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BOM`
--

DROP TABLE IF EXISTS `BOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOM` (
  `id` int(11) NOT NULL,
  `BOM_no` varchar(45) NOT NULL,
  `bom_name` varchar(50) DEFAULT NULL,
  `qty` float NOT NULL,
  `BOM_key_person` varchar(45) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOM`
--

LOCK TABLES `BOM` WRITE;
/*!40000 ALTER TABLE `BOM` DISABLE KEYS */;
INSERT INTO `BOM` VALUES (1,'NBT-BOM-2020020301','test',100,'test','test remark','BOM_CREATED','Y','2020-02-03',1,13,'2020-02-03',1);
/*!40000 ALTER TABLE `BOM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOM_items_details`
--

DROP TABLE IF EXISTS `BOM_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOM_items_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BOM_id` int(11) DEFAULT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOM_items_details`
--

LOCK TABLES `BOM_items_details` WRITE;
/*!40000 ALTER TABLE `BOM_items_details` DISABLE KEYS */;
INSERT INTO `BOM_items_details` VALUES (1,1,'NBTSE-01','NBTSE-01',100,6,8);
/*!40000 ALTER TABLE `BOM_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier_Master`
--

DROP TABLE IF EXISTS `Supplier_Master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier_Master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `offical_email` varchar(45) DEFAULT NULL,
  `personal_email` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `is_added_as_vendor` char(1) DEFAULT 'N',
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier_Master`
--

LOCK TABLES `Supplier_Master` WRITE;
/*!40000 ALTER TABLE `Supplier_Master` DISABLE KEYS */;
INSERT INTO `Supplier_Master` VALUES (1,'Test first nameSupplier','Test last name','Test Address here','1140','7894561230','','pragyad@appodeepo.com','','Y','N',NULL,'2020-02-12',1,7,NULL,NULL),(2,'Supplier 2 First Name','last name','Supplier 2 address','1558','7894561230','7894561230','rohillapragya@gmail.com','rohillapragya1@gmail.com','Y','N',NULL,'2020-02-12',1,7,NULL,NULL);
/*!40000 ALTER TABLE `Supplier_Master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UOM_master`
--

DROP TABLE IF EXISTS `UOM_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UOM_master` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UOM_master`
--

LOCK TABLES `UOM_master` WRITE;
/*!40000 ALTER TABLE `UOM_master` DISABLE KEYS */;
INSERT INTO `UOM_master` VALUES (1,'Ares','N','2019-12-07'),(2,'Centimetres','N','2019-12-07'),(3,'Cubic','N','2019-12-07'),(4,'Fahrenheit','N','2019-12-07'),(5,'Feet','N','2019-12-07'),(6,'Grams','Y','2019-12-07'),(7,'Inches','N','2019-12-07'),(8,'Kilograms','Y','2019-12-07'),(9,'Kilometres','N','2019-12-07'),(10,'Litres','Y','2019-12-07'),(11,'Metres','N','2019-12-07'),(12,'miles','N','2019-12-07'),(13,'Millilitres','N','2019-12-07'),(14,'Points','N','2019-12-07'),(15,'Pounds','N','2019-12-07'),(16,'Square','N','2019-12-07'),(17,'Tons','N','2019-12-07'),(18,'Box','N','2019-12-07');
/*!40000 ALTER TABLE `UOM_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_access_master`
--

DROP TABLE IF EXISTS `app_access_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_access_master` (
  `id` char(1) NOT NULL,
  `name` varchar(10) NOT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_access_master`
--

LOCK TABLES `app_access_master` WRITE;
/*!40000 ALTER TABLE `app_access_master` DISABLE KEYS */;
INSERT INTO `app_access_master` VALUES ('R','Read','Y'),('W','Write','Y'),('E','Execute','Y'),('O','ALL','Y');
/*!40000 ALTER TABLE `app_access_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_location_master`
--

DROP TABLE IF EXISTS `app_location_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_location_master` (
  `id` int(11) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `location_country` varchar(20) NOT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_location_master`
--

LOCK TABLES `app_location_master` WRITE;
/*!40000 ALTER TABLE `app_location_master` DISABLE KEYS */;
INSERT INTO `app_location_master` VALUES (1,'Bangaluru','','Y'),(2,'Hyderabad','','Y'),(3,'New Delhi','','Y'),(4,'Jaipur','','Y'),(5,'Bazpur','','Y'),(6,'Hariwar','','Y'),(7,'Aurangabad','','Y'),(8,'Chennai','','Y'),(9,'Manipur','','Y'),(10,'Chandigarh','','Y'),(11,'UK','','Y'),(12,'USA','','Y'),(13,'Korea','','Y');
/*!40000 ALTER TABLE `app_location_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_menu_set`
--

DROP TABLE IF EXISTS `app_menu_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu_set` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu_set`
--

LOCK TABLES `app_menu_set` WRITE;
/*!40000 ALTER TABLE `app_menu_set` DISABLE KEYS */;
INSERT INTO `app_menu_set` VALUES (1,'Wish List','Y'),(2,'Inquiry','Y'),(3,'Customer Sample','Y'),(4,'Sample Prepare for Dispatch','Y'),(5,'Vendor Sample','Y'),(6,'Customer Registration','Y'),(7,'Vendor Registartion','Y'),(8,'ERP User Registration','Y'),(9,'Dispatch Service','Y'),(10,'Dispatch Material','Y'),(11,'Add Product','Y'),(12,'Product List','Y'),(13,'Warehouse','Y'),(14,'Stock Entry','Y'),(15,'Stock Report','Y'),(16,'Material Requisition Note (MRN)','Y'),(17,'Purchase Requisition Note (PRN)','Y'),(18,'Verify Purchase Requisition Note','Y'),(19,'Goods Receipt Note (GRN)','Y'),(20,'Bill Of Material (BOM)','Y'),(21,'Production Details','Y'),(22,'Batch Manufacturing Number (BMR)','Y'),(23,'Purchase Indent','Y'),(24,'Purchase Request','Y'),(25,'Supplier Quotations','Y'),(26,'QC Details','Y'),(27,'Sales Head','Y'),(28,'Wish Action','Y'),(0,'ALL','Y'),(29,'Test','N'),(30,'Location','Y');
/*!40000 ALTER TABLE `app_menu_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_menu_url_map`
--

DROP TABLE IF EXISTS `app_menu_url_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu_url_map` (
  `menu_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu_url_map`
--

LOCK TABLES `app_menu_url_map` WRITE;
/*!40000 ALTER TABLE `app_menu_url_map` DISABLE KEYS */;
INSERT INTO `app_menu_url_map` VALUES (11,121,'Y'),(11,122,'Y'),(11,25,'Y'),(11,132,'Y'),(11,124,'Y'),(11,31,'Y'),(11,126,'Y'),(11,131,'Y'),(11,125,'Y'),(11,30,'Y'),(11,33,'Y'),(11,27,'Y'),(11,129,'Y'),(11,220,'Y'),(11,127,'Y'),(11,128,'Y'),(11,202,'Y'),(11,34,'Y'),(11,135,'Y'),(11,123,'Y'),(11,218,'Y'),(11,28,'Y'),(11,26,'Y'),(11,29,'Y'),(11,32,'Y'),(11,130,'Y'),(11,75,'Y'),(11,219,'Y'),(22,105,'Y'),(22,106,'Y'),(22,16,'Y'),(20,177,'Y'),(20,178,'Y'),(20,48,'Y'),(20,180,'Y'),(20,54,'Y'),(20,183,'Y'),(20,182,'Y'),(20,184,'Y'),(6,90,'Y'),(6,98,'Y'),(6,9,'Y'),(6,99,'Y'),(6,10,'Y'),(3,100,'Y'),(3,102,'Y'),(3,11,'Y'),(3,103,'Y'),(3,13,'Y'),(4,104,'Y'),(4,14,'Y'),(3,15,'Y'),(5,15,'Y'),(10,119,'Y'),(10,120,'Y'),(10,24,'Y'),(10,118,'Y'),(9,115,'Y'),(9,116,'Y'),(9,22,'Y'),(9,117,'Y'),(9,23,'Y'),(8,92,'Y'),(8,93,'Y'),(8,5,'Y'),(8,94,'Y'),(8,6,'Y'),(8,7,'Y'),(8,66,'Y'),(19,172,'Y'),(19,173,'Y'),(19,47,'Y'),(19,169,'Y'),(19,49,'Y'),(2,82,'Y'),(2,3,'Y'),(2,83,'Y'),(2,86,'Y'),(2,84,'Y'),(2,4,'Y'),(2,85,'Y'),(16,157,'Y'),(16,158,'Y'),(16,42,'Y'),(16,159,'Y'),(16,43,'Y'),(16,160,'Y'),(16,161,'Y'),(16,162,'Y'),(16,163,'Y'),(12,202,'Y'),(21,185,'Y'),(21,186,'Y'),(21,51,'Y'),(21,181,'Y'),(21,53,'Y'),(21,174,'Y'),(23,175,'Y'),(23,59,'Y'),(23,176,'Y'),(23,55,'Y'),(23,179,'Y'),(23,57,'Y'),(23,190,'Y'),(23,187,'Y'),(24,188,'Y'),(24,189,'Y'),(24,77,'Y'),(24,56,'Y'),(17,164,'Y'),(17,165,'Y'),(17,44,'Y'),(17,166,'Y'),(17,45,'Y'),(18,167,'Y'),(18,168,'Y'),(18,46,'Y'),(18,171,'Y'),(18,170,'Y'),(26,107,'Y'),(26,108,'Y'),(26,17,'Y'),(26,18,'Y'),(26,109,'Y'),(14,148,'Y'),(14,149,'Y'),(14,150,'Y'),(14,40,'Y'),(14,151,'Y'),(14,50,'Y'),(15,152,'Y'),(15,153,'Y'),(25,221,'Y'),(25,222,'Y'),(25,56,'Y'),(25,77,'Y'),(7,91,'Y'),(7,95,'Y'),(7,96,'Y'),(7,8,'Y'),(7,97,'Y'),(7,12,'Y'),(5,101,'Y'),(5,110,'Y'),(5,19,'Y'),(5,111,'Y'),(5,20,'Y'),(5,112,'Y'),(5,114,'Y'),(13,141,'Y'),(13,142,'Y'),(13,143,'Y'),(13,144,'Y'),(13,145,'Y'),(13,147,'Y'),(13,35,'Y'),(13,37,'Y'),(28,133,'Y'),(28,138,'Y'),(28,139,'Y'),(28,41,'Y'),(28,140,'Y'),(1,133,'Y'),(1,134,'Y'),(1,36,'Y'),(1,136,'Y'),(1,38,'Y'),(1,39,'Y'),(1,137,'Y'),(30,200,'Y'),(30,64,'Y'),(30,201,'Y'),(30,65,'Y');
/*!40000 ALTER TABLE `app_menu_url_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_region_location_map`
--

DROP TABLE IF EXISTS `app_region_location_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_region_location_map` (
  `region_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_region_location_map`
--

LOCK TABLES `app_region_location_map` WRITE;
/*!40000 ALTER TABLE `app_region_location_map` DISABLE KEYS */;
INSERT INTO `app_region_location_map` VALUES (3,9,'N'),(1,10,'N'),(1,6,'N'),(1,4,'N'),(1,3,'N'),(5,12,'Y'),(5,11,'Y'),(5,13,'Y'),(2,8,'Y'),(2,1,'Y'),(2,2,'Y'),(4,5,'Y'),(4,9,'Y');
/*!40000 ALTER TABLE `app_region_location_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_region_master`
--

DROP TABLE IF EXISTS `app_region_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_region_master` (
  `id` int(11) NOT NULL,
  `region` varchar(50) NOT NULL,
  `region_country` varchar(20) NOT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_region_master`
--

LOCK TABLES `app_region_master` WRITE;
/*!40000 ALTER TABLE `app_region_master` DISABLE KEYS */;
INSERT INTO `app_region_master` VALUES (1,'North India','','N'),(2,'South India','','Y'),(3,'East India','','N'),(4,'West India','','Y'),(5,'Outside India','','Y');
/*!40000 ALTER TABLE `app_region_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role` (
  `Id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role`
--

LOCK TABLES `app_role` WRITE;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role_master`
--

DROP TABLE IF EXISTS `app_role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role_master` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role_master`
--

LOCK TABLES `app_role_master` WRITE;
/*!40000 ALTER TABLE `app_role_master` DISABLE KEYS */;
INSERT INTO `app_role_master` VALUES (4,'Security Manager','N'),(3,'Administartor','Y'),(1,'Developer','Y'),(2,'Super Administrator','Y'),(5,'Sales Executive','Y'),(6,'Customer','Y'),(7,'Operation Admin','Y'),(8,'Production Admin','Y'),(9,'Accounts Admin','Y'),(10,'Quality Control Admin','Y'),(11,'Store Admin','Y'),(12,'Dispatch Admin','Y'),(13,'Purchase Admin','Y'),(14,'QA - Tech Support','Y');
/*!40000 ALTER TABLE `app_role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_urls`
--

DROP TABLE IF EXISTS `app_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_urls` (
  `id` int(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `access_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_urls`
--

LOCK TABLES `app_urls` WRITE;
/*!40000 ALTER TABLE `app_urls` DISABLE KEYS */;
INSERT INTO `app_urls` VALUES (1,'/doLogin',NULL),(2,'/changePassword',NULL),(3,'/inquiry/addProductInCart',NULL),(4,'/inquiry/save',NULL),(5,'/erpuser/save',NULL),(6,'/erpuser/update',NULL),(7,'/erpUser/changeStatus',NULL),(8,'/dashboard/saveVendor',NULL),(9,'/dashboard/saveCustomer',NULL),(10,'/dashboard/editCustomer',NULL),(11,'/dashboard/saveSampleRequest',NULL),(12,'/dashboard/editVendor',NULL),(13,'/dashboard/editSampleRequest',NULL),(14,'/customer/sample/readyForDispatch',NULL),(15,'/sample/removeSampleAttachment',NULL),(16,'/production/bmr',NULL),(17,'/qcDetails/qcSave',NULL),(18,'/qcDetails/qcStockInfoSave',NULL),(19,'/dashboard/saveVendorSampleRequest',NULL),(20,'/dashboard/editVendorSampleRequest',NULL),(21,'/vendor/sample/proceedVendorSampleTOStore',NULL),(22,'/dispatch/saveService',NULL),(23,'/dispatch/updateService',NULL),(24,'/dispatch/add',NULL),(25,'/product/saveProduct',NULL),(26,'/product/removeproductImage',NULL),(27,'/product/editProduct',NULL),(28,'/product/product/changeStatus',NULL),(29,'/product/saveCategory',NULL),(30,'/product/editCategory',NULL),(31,'/product/category/changeStatus',NULL),(32,'/product/saveMethod',NULL),(33,'/product/editMethod',NULL),(34,'/product/method/changeStatus',NULL),(35,'/warehouse/save',NULL),(36,'/wish/save',NULL),(37,'/warehouse/update',NULL),(38,'/wish/removeWishImage',NULL),(39,'/wish/edit',NULL),(40,'/stock/save',NULL),(41,'/wish/proceedAs/product',NULL),(42,'/mrn/save',NULL),(43,'/mrn/addNewPurpose',NULL),(44,'/prn/save',NULL),(45,'/prn/update',NULL),(46,'/prn/verifyPRN',NULL),(47,'/grn/save',NULL),(48,'/bom/save',NULL),(49,'/grn/update',NULL),(50,'/stock/update',NULL),(51,'/production/save',NULL),(52,'/development/editURL',NULL),(53,'/production/update',NULL),(54,'/bom/update',NULL),(55,'/pi/save',NULL),(56,'/quotation/save',NULL),(57,'/pi/action/save',NULL),(58,'/development/addNewURL',NULL),(59,'/dashboard/pi_to_sample_save',NULL),(60,'/development/addNewMenu',NULL),(61,'/development/addMenuUrlMap',NULL),(62,'/development/removeMenuUrlMap',NULL),(63,'/development/editMenu',NULL),(64,'/development/addNewLocation',NULL),(65,'/development/editLocation',NULL),(66,'/erpUser/inactiveERPUserStatus',NULL),(67,'/development/addNewRegion',NULL),(68,'/development/editRegion',NULL),(69,'/development/changeRegionStatus',NULL),(70,'/development/deleteRegion',NULL),(71,'/development/addRegionLocationMap',NULL),(72,'/development/removeRegionLocationMap',NULL),(73,'/development/deleteLocation',NULL),(74,'/development/deleteMenu',NULL),(75,'/product/updatePrice_valid',NULL),(76,'/user/addSupplier',NULL),(77,'/quotation/save',NULL),(78,'/forgotPassword',NULL),(79,'/signoff',NULL),(80,'login',NULL),(82,'/inquiry/init',NULL),(83,'/inquiry/getCartCount',NULL),(84,'/inquiry/proceedCart',NULL),(85,'/inquiry/{productId}/inactiveProductInCart',NULL),(86,'/inquiry/proceedCart',NULL),(87,'/user/IsCompanyExits',NULL),(88,'/user/IsGSTNExits',NULL),(89,'/user/checkRole',NULL),(90,'/dashbaord/customerRegistration',NULL),(91,'/dashbaord/vendorRegistration',NULL),(92,'/dashbaord/erpUserRegistration',NULL),(93,'/dashboard/addNewERPUser',NULL),(94,'/erpuser/edit/{erpUserID}',NULL),(95,'/dashboard/addVendor',NULL),(96,'/user/userContactInformation',NULL),(97,'/vendor/edit/{vendorId}',NULL),(98,'/dashboard/addCustomer',NULL),(99,'/customer/edit/{customerId}',NULL),(100,'/dashboard/customerSample',NULL),(101,'/dashboard/vendorSample',NULL),(102,'/dashboard/addNewSample',NULL),(103,'/sample/customer/show/{sampleId}',NULL),(104,'/sample/customer/readyForDispatch/{sampleId}',NULL),(105,'/dashboard/customerSampleBMRList',NULL),(106,'/sample/customer/BMRDetails/{sampleId}',NULL),(107,'/dashboard/customerSampleQC',NULL),(108,'/sample/qc/QCDetails/{sampleId}',NULL),(109,'/qc/getQCDetailsCount',NULL),(110,'/dashboard/addNewVendorSample',NULL),(111,'/sample/vendor/show/{sampleId}',NULL),(112,'/sample/vendor/saveVendorSample/{sampleId}',NULL),(113,'/sample/getCustomerCount',NULL),(114,'/sample/getVendorCount',NULL),(115,'/dashboard/dispatchService',NULL),(116,'/dashboard/addNewDistapchService',NULL),(117,'/dispatch/service/edit/{serviceId}',NULL),(118,'/dispatch/getdispatchCount',NULL),(119,'/dashboard/dispatchInfo',NULL),(120,'/dispatch/save/{sampleId}',NULL),(121,'/product/productIndex',NULL),(122,'/product/addProduct',NULL),(123,'/product/methodIndex',NULL),(124,'/product/addMethod',NULL),(125,'/product/edit/{productID}',NULL),(126,'/product/category/edit/{categoryId}',NULL),(127,'/product/getProductByCategoryId',NULL),(128,'/product/getProductList',NULL),(129,'/product/getMethodList',NULL),(130,'/product/uom',NULL),(131,'/product/categoryIndex',NULL),(132,'/product/addCategory',NULL),(133,'/wish/index',NULL),(134,'/wish/add',NULL),(135,'/product/method/edit/{methodId}',NULL),(136,'wish/edit/{wishId}',NULL),(137,'/wish/action/{wishId}',NULL),(138,'/wish/{wishId}/proceedAsProduct',NULL),(139,'/wish/{wishId}/discardProduct',NULL),(140,'/wish/getWishCount',NULL),(141,'/dashboard/warehouseInit',NULL),(142,'/dashboard/addNewWarehouse',NULL),(143,'/warehouse/getCityList',NULL),(144,'/warehouse/getStateList',NULL),(145,'/warehouse/gettingCityStateCountry',NULL),(146,'/warehouse/edit/{warehouseId}',NULL),(147,'/warehouse/getWarehouseList',NULL),(148,'/dashboard/stockEntryInit',NULL),(149,'/dashboard/addNewStockEntry',NULL),(150,'/stock/getStockEntryTypeDetails',NULL),(151,'/store/edit/{storeId}',NULL),(152,'/dashboard/StockReport',NULL),(153,'/stock/getStockByWarehouseId',NULL),(154,'/stock/qc/QCDetails/{sampleId}',NULL),(155,'/stock/getStockEntryCount',NULL),(156,'/stock/checkIsStockObjectExist',NULL),(157,'/dashboard/mrnInit',NULL),(158,'/dashboard/addNewMRN',NULL),(159,'/mrn/checkMRNRequestId',NULL),(160,'/mrn/getPurposeList',NULL),(161,'/mrn/{mrnID}/stockEntry',NULL),(162,'/mrn/{mrnID}/prnEntry',NULL),(163,'/mrn/mrnCount',NULL),(164,'/dashboard/prnInit',NULL),(165,'/dashboard/addNewPRN',NULL),(166,'/prn/edit/{prnId}',NULL),(167,'/dashoard/prn/verify',NULL),(168,'/prn/show/{prnId}',NULL),(169,'grn/edit/{grnId}',NULL),(170,'/prn/getPRNCount',NULL),(171,'/prn/verifyPRNCount',NULL),(172,'/dashboard/grnInit',NULL),(173,'/dashboard/addNewGRN',NULL),(174,'/production/getBMRCount',NULL),(175,'/dashboard/pI',NULL),(176,'/pi/inquiry/{inquiryId}',NULL),(177,'/dashboard/BOM',NULL),(178,'/dashboard/addBom',NULL),(179,'/pi/{piID}/action',NULL),(180,'/bom/edit/{bomID}',NULL),(181,'/production/edit/{productionId}',NULL),(182,'/production/checkBOM',NULL),(183,'/bom/{bomId}/production',NULL),(184,'/production/getBOMCount',NULL),(185,'/dashboard/production',NULL),(186,'/dashboard/addProduction',NULL),(187,'/pi/getPICount',NULL),(188,'/dashoard/qutationInit',NULL),(189,'/prn/{pID}/quotation/create',NULL),(190,'/pi/{piID}/SampleRequest',NULL),(191,'/sendhtmlemail',NULL),(192,'/charts',NULL),(193,'/chart/sample',NULL),(194,'/chart/inquiry',NULL),(195,'/development/addRoute',NULL),(196,'/development/getURL',NULL),(197,'/development/addMenu',NULL),(198,'/development/getMenu',NULL),(199,'/development/menu_route_map',NULL),(200,'/development/location',NULL),(201,'/development/getLocation',NULL),(202,'/product/list',NULL),(203,'/user/getRole',NULL),(204,'/user/getRoleExceptAdmin',NULL),(205,'/user/getLocation',NULL),(206,'/user/getAccess',NULL),(207,'selectLocation',NULL),(208,'/selectedLocation',NULL),(209,'/Index',NULL),(210,'/development/region',NULL),(211,'/development/getRegion',NULL),(212,'/development/region_location_map',NULL),(213,'/dashboard/userLocation',NULL),(214,'/dashboard/latestLocation/{locationID}',NULL),(216,'/user/userAllocatedLocation',NULL),(217,'/sample/pendingCustomerSample',NULL),(218,'/product/priceRange',NULL),(219,'/product/{productId}/priceRange',NULL),(220,'/product/getpriceRangeCount',NULL),(221,'/dashoard/vendorQuotationInit',NULL),(222,'/quotation/{qID}',NULL),(223,'/user/getVendorList',NULL),(224,'/user/getSupplierList',NULL),(225,'/getquotataionProductDetails',NULL),(226,'/quotation/view/{qID}',NULL),(227,'/chart/wish',NULL),(81,'dashboard',NULL),(215,'index',NULL);
/*!40000 ALTER TABLE `app_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_menu_access_map`
--

DROP TABLE IF EXISTS `app_user_menu_access_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_menu_access_map` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_url_map_id` varchar(200) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `access` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_menu_access_map`
--

LOCK TABLES `app_user_menu_access_map` WRITE;
/*!40000 ALTER TABLE `app_user_menu_access_map` DISABLE KEYS */;
INSERT INTO `app_user_menu_access_map` VALUES (6,182,'0','Y',1,'2020-01-23',NULL,NULL,3,1,'O'),(8,188,'11','Y',1,'2020-01-29',NULL,NULL,7,1,'W'),(9,188,'4','Y',1,'2020-01-29',NULL,NULL,5,2,'R'),(10,188,'13','Y',1,'2020-01-29',NULL,NULL,14,2,'W'),(11,188,'25','Y',1,'2020-01-29',NULL,NULL,13,2,'W'),(12,188,'11','Y',1,'2020-01-29',NULL,NULL,11,1,'W'),(13,188,'12','Y',1,'2020-01-29',NULL,NULL,3,1,'R'),(14,188,'4','Y',1,'2020-01-29',NULL,NULL,11,2,'R'),(15,188,'28','Y',1,'2020-01-29',NULL,NULL,14,2,'R'),(16,188,'11','Y',1,'2020-01-29',NULL,NULL,7,10,'R'),(17,188,'4','Y',1,'2020-01-29',NULL,NULL,11,13,'W'),(18,188,'15','Y',1,'2020-01-29',NULL,NULL,13,9,'W'),(19,189,'23','Y',1,'2020-01-31',NULL,NULL,14,5,'R'),(20,189,'17','Y',1,'2020-01-31',NULL,NULL,13,11,'W'),(21,7,'12','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(23,8,'11','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(24,9,'11','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(25,10,'11','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(26,11,'11','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(27,177,'11','Y',1,'2020-03-23',NULL,NULL,5,1,'W'),(28,6,'11','Y',1,'2020-03-24',NULL,NULL,5,1,'W');
/*!40000 ALTER TABLE `app_user_menu_access_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_role_map`
--

DROP TABLE IF EXISTS `app_user_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_role_map` (
  `user_id` int(10) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_role_map`
--

LOCK TABLES `app_user_role_map` WRITE;
/*!40000 ALTER TABLE `app_user_role_map` DISABLE KEYS */;
INSERT INTO `app_user_role_map` VALUES (1,3),(2,3),(3,3),(4,3),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(177,5),(180,5),(182,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(177,5),(180,5),(12,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(38,6),(39,6),(40,6),(41,6),(42,6),(43,6),(44,6),(45,6),(46,6),(47,6),(48,6),(49,6),(50,6),(51,6),(52,6),(53,6),(54,6),(55,6),(56,6),(57,6),(58,6),(59,6),(60,6),(61,6),(62,6),(63,6),(64,6),(65,6),(66,6),(67,6),(68,6),(69,6),(70,6),(71,6),(72,6),(73,6),(74,6),(75,6),(76,6),(77,6),(78,6),(79,6),(80,6),(81,6),(82,6),(83,6),(84,6),(85,6),(86,6),(87,6),(88,6),(89,6),(90,6),(91,6),(92,6),(93,6),(94,6),(95,6),(96,6),(97,6),(98,6),(99,6),(100,6),(101,6),(102,6),(103,6),(104,6),(105,6),(106,6),(107,6),(108,6),(109,6),(110,6),(111,6),(112,6),(113,6),(114,6),(115,6),(116,6),(117,6),(118,6),(119,6),(120,6),(121,6),(122,6),(123,6),(124,6),(125,6),(126,6),(127,6),(128,6),(129,6),(130,6),(131,6),(132,6),(133,6),(134,6),(135,6),(136,6),(137,6),(138,6),(139,6),(140,6),(141,6),(142,6),(143,6),(144,6),(145,6),(146,6),(147,6),(148,6),(149,6),(150,6),(151,6),(152,6),(153,6),(154,6),(155,6),(156,6),(157,6),(158,6),(159,6),(160,6),(161,6),(162,6),(163,6),(164,6),(165,6),(166,6),(167,6),(168,6),(169,6),(170,6),(171,6),(172,6),(173,6),(174,6),(175,6),(176,6),(183,6),(184,6),(185,6),(186,6),(1,5),(1,13),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(180,5),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,14),(2,5),(3,5),(7,8),(187,13),(193,13),(196,12),(202,10),(1,1),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,3),(188,7),(188,7),(188,7),(188,7),(188,7),(188,8),(188,5),(188,14),(188,8),(188,13),(188,11),(188,7),(188,7),(188,7),(188,7),(188,7),(188,8),(188,5),(188,14),(188,8),(188,13),(188,11),(188,7),(188,5),(188,14),(188,13),(188,11),(182,3),(182,3),(11,12),(188,7),(188,5),(188,14),(188,13),(188,11),(188,3),(188,11),(188,14),(188,7),(188,5),(188,14),(188,13),(188,11),(188,3),(188,11),(188,14),(188,7),(188,11),(188,13),(189,3),(189,14),(189,13),(189,14),(189,13),(189,14),(189,13),(7,5),(6,5),(8,5),(9,5),(10,5),(11,5),(177,5),(6,5);
/*!40000 ALTER TABLE `app_user_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_activity_master`
--

DROP TABLE IF EXISTS `business_activity_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_activity_master` (
  `Id` int(11) NOT NULL,
  `activity` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_activity_master`
--

LOCK TABLES `business_activity_master` WRITE;
/*!40000 ALTER TABLE `business_activity_master` DISABLE KEYS */;
INSERT INTO `business_activity_master` VALUES (1,'Manufacturing'),(2,'Trading'),(3,'Contract'),(4,'Institute'),(5,'Service Provider'),(6,'Others');
/*!40000 ALTER TABLE `business_activity_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_type_master`
--

DROP TABLE IF EXISTS `business_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_type_master` (
  `Id` int(11) NOT NULL,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_type_master`
--

LOCK TABLES `business_type_master` WRITE;
/*!40000 ALTER TABLE `business_type_master` DISABLE KEYS */;
INSERT INTO `business_type_master` VALUES (1,'Proprietorship'),(2,'Partnership'),(3,'Pvt LtD'),(4,'Public LtD'),(5,'LtD'),(6,'Others');
/*!40000 ALTER TABLE `business_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `code` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pin` int(11) NOT NULL,
  `state_code` varchar(10) NOT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`,`state_code`),
  KEY `fk_City_State1_idx` (`state_code`),
  CONSTRAINT `fk_City_State1` FOREIGN KEY (`state_code`) REFERENCES `state` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('ADIL','Adilabad',0,'TELA','',''),('AGAR','Agar',0,'MADY','',''),('AGRA','Agra',0,'UTTA','',''),('AHME','Ahmedabad',0,'GUJA','',''),('AHMG','Ahmednagar',0,'MAHA','',''),('AIZA','Aizawl',0,'MIZO','',''),('AJME','Ajmer',0,'RAJA','',''),('AKOL','Akola',0,'MAHA','',''),('ALAP','Alappuzha',0,'KERA','',''),('ALIG','Aligarh',0,'UTTA','',''),('ALIP','Alipurduar',0,'WEST','',''),('ALIR','Alirajpur',0,'MADY','',''),('ALLA','Allahabad',0,'UTTA','',''),('ALMO','Almora',0,'UTTR','',''),('ALWA','Alwar',0,'RAJA','',''),('AMBA','Ambala',0,'HARY','',''),('AMBE','Ambedkar Nagar',0,'UTTA','',''),('AMET','Amethi (Chhatrapati Shahuji Maharaj Nagar)',0,'UTTA','',''),('AMRA','Amravati',0,'MAHA','',''),('AMRE','Amreli',0,'GUJA','',''),('AMRI','Amritsar',0,'PUNJ','',''),('ANAG','Anantnag',0,'JAKA','',''),('ANAN','Anand',0,'GUJA','',''),('ANAT','Anantapur',0,'ANDH','',''),('ANDA','Andaman',0,'ANDA','',''),('ANGU','Angul',0,'ODIS','',''),('ANJA','Anjaw',0,'ARUN','',''),('ANUP','Anuppur',0,'MADY','',''),('ARAR','Araria',0,'BIHA','',''),('ARAV','Aravali',0,'GUJA','',''),('ARIY','Ariyalur',0,'TAMI','',''),('ARWA','Arwal',0,'BIHA','',''),('ASHO','Ashok Nagar',0,'MADY','',''),('AURA','Aurangabad',0,'MAHA',NULL,NULL),('AURI','Auraiya',0,'UTTA',NULL,NULL),('AURN','Aurangabad',0,'BIHA',NULL,NULL),('AZAM','Azamgarh',0,'UTTA','',''),('BABK','Barabanki',0,'UTTA','',''),('BADA','Banda',0,'UTTA','',''),('BADG','Badgam',0,'JAKA','',''),('BAGA','Bagalkot',0,'KARN','',''),('BAGE','Bageshwar',0,'UTTR','',''),('BAGH','Baghpat',0,'UTTA','',''),('BAHR','Bahraich',0,'UTTA','',''),('BALA','Balangir',0,'ODIS','',''),('BALD','Baloda Bazar',0,'CHHA','',''),('BALL','Ballia',0,'UTTA','',''),('BALO','Balod',0,'CHHA','',''),('BALR','Balrampur',0,'UTTA','',''),('BALS','Balasore',0,'ODIS','',''),('BANA','Banaskantha',0,'GUJA','',''),('BAND','Bandipora',0,'JAKA','',''),('BANG','Bangalore',0,'KARN','',''),('BANK','Bankura',0,'WEST','',''),('BANS','Banswara',0,'RAJA','',''),('BAPR','Balrampur',0,'CHHA','',''),('BARA','Baramula',0,'JAKA','',''),('BARD','Barddhaman',0,'WEST','',''),('BARE','Bareilly',0,'UTTA','',''),('BARG','Bargarh (Baragarh)',0,'ODIS','',''),('BARM','Barmer',0,'RAJA','',''),('BARN','Baran',0,'RAJA','',''),('BARP','Barpeta',0,'ASSA','',''),('BARW','Barwani',0,'MADY','',''),('BASI','Basti',0,'UTTA','',''),('BAST','Bastar',0,'CHHA','',''),('BATH','Bathinda',0,'PUNJ','',''),('BDRI','Bhadradri',0,'TELA','',''),('BEGU','Begusarai',0,'BIHA','',''),('BELG','Belgaum',0,'KARN','',''),('BELL','Bellary',0,'KARN','',''),('BEME','Bemetara',0,'CHHA','',''),('BETU','Betul',0,'MADY','',''),('BGHT','Balaghat',0,'MADY','',''),('BHAD','Bhadrak',0,'ODIS','',''),('BHAG','Bhagalpur',0,'BIHA','',''),('BHAN','Bhandara',0,'MAHA','',''),('BHAR','Bharuch',0,'GUJA','',''),('BHAV','Bhavnagar',0,'GUJA','',''),('BHIL','Bhilwara',0,'RAJA','',''),('BHIN','Bhind',0,'MADY','',''),('BHIW','Bhiwani',0,'HARY','',''),('BHOJ','Bhojpur',0,'BIHA','',''),('BHOP','Bhopal',0,'MADY','',''),('BID','Bid',0,'MAHA','',''),('BIDA','Bidar',0,'KARN','',''),('BIJA','Bijapur',0,'KARN','',''),('BIJN','Bijnor',0,'UTTA','',''),('BIKA','Bikaner',0,'RAJA','',''),('BILA','Bilaspur',0,'CHHA','',''),('BIRB','Birbhum',0,'WEST','',''),('BISH','Bishnupur',0,'MANI','',''),('BJPR','Bijapur',0,'CHHA','',''),('BNKA','Banka',0,'BIHA','',''),('BOKA','Bokaro',0,'JHAR','',''),('BONG','Bongaigaon',0,'ASSA','',''),('BOTA','Botad',0,'GUJA','',''),('BOUD','Boudh(Bauda)',0,'ODIS','',''),('BRAT','Bharatpur',0,'RAJA','',''),('BRNL','Barnala',0,'PUNJ','',''),('BSUR','Bilaspur',0,'HIMA','',''),('BUDA','Budaun',0,'UTTA','',''),('BULA','Buldana',0,'MAHA','',''),('BUND','Bundi',0,'RAJA','',''),('BURH','Burhanpur',0,'MADY','',''),('BUSH','Bulandshahar',0,'UTTA','',''),('BUXA','Buxar',0,'BIHA','',''),('CACH','Cachar',0,'ASSA','',''),('CAMP','Champhai',0,'MIZO','',''),('CHAB','Chamba',0,'HIMA','',''),('CHAJ','Chamarajanagar',0,'KARN','',''),('CHAM','Pashchim Champaran',0,'BIHA','',''),('CHAR','Charkhi Dadri',0,'HARY','',''),('CHAT','Chatra',0,'JHAR','',''),('CHAU','Chandauli',0,'UTTA',NULL,NULL),('CHAW','Champawat',0,'UTTR','',''),('CHCH','Churachandpur',0,'MANI','',''),('CHDE','Chandel',0,'MANI',NULL,NULL),('CHEN','Chennai',0,'TAMI','',''),('CHGH','Chandigarh',0,'CHAN','',''),('CHHA','Chhatarpur',0,'MADY','',''),('CHHI','Chhindwara',0,'MADY','',''),('CHHO','Chhota Udaipur',0,'GUJA','',''),('CHIK','Chikkaballapura',0,'KARN','',''),('CHIL','Chikmagalur',0,'KARN','',''),('CHIT','Chittoor',0,'ANDH',NULL,NULL),('CHLI','Chamoli',0,'UTTR','',''),('CHND','Chandrapur',0,'MAHA',NULL,NULL),('CHTA','Chitrakoot',0,'UTTA',NULL,NULL),('CHTR','Chitradurga',0,'KARN',NULL,NULL),('CHTT','Chittaurgarh',0,'RAJA',NULL,NULL),('CHUR','Churu',0,'RAJA','',''),('COIM','Coimbatore',0,'TAMI','',''),('CUDD','Cuddalore',0,'TAMI','',''),('CUTT','Cuttack',0,'ODIS','',''),('DADA','Dadra and Nagar Haveli',0,'DADR','',''),('DAMA','Daman',0,'DAMA','',''),('DAMO','Damoh',0,'MADY','',''),('DANG','The Dangs',0,'GUJA','',''),('DANT','Dantewada',0,'CHHA','',''),('DARB','Darbhanga',0,'BIHA','',''),('DARJ','Darjiling',0,'WEST','',''),('DARR','Darrang',0,'ASSA','',''),('DATI','Datia',0,'MADY','',''),('DAUS','Dausa',0,'RAJA','',''),('DAVA','Davanagere',0,'KARN','',''),('DEBA','Debagarh (Deogarh)',0,'ODIS','',''),('DEHR','Dehradun',0,'UTTR','',''),('DELH','Delhi',0,'DELH','',''),('DEOG','Deoghar',0,'JHAR','',''),('DEOR','Deoria',0,'UTTA','',''),('DEWA','Dewas',0,'MADY','',''),('DGUL','Dindigul',0,'TAMI','',''),('DHAL','Dhalai',0,'TRIP','',''),('DHAM','Dhamtari',0,'CHHA','',''),('DHAN','Dhanbad',0,'JHAR','',''),('DHAP','Dharmapuri',0,'TAMI','',''),('DHAR','Dhar',0,'MADY','',''),('DHAU','Dhaulpur',0,'RAJA','',''),('DHAW','Dharwad',0,'KARN','',''),('DHEM','Dhemaji',0,'ASSA','',''),('DHEN','Dhenkanal',0,'ODIS','',''),('DHUB','Dhubri',0,'ASSA','',''),('DHUL','Dhule',0,'MAHA','',''),('DIBA','Dibang Valley',0,'ARUN','',''),('DIBR','Dibrugarh',0,'ASSA','',''),('DIMA','Dima Hasao',0,'ASSA','',''),('DIMP','Dimapur',0,'NAGA','',''),('DINA','Dakshin Dinajpur',0,'WEST','',''),('DIND','Dindori',0,'MADY','',''),('DIU','Diu',0,'DAMA','',''),('DODA','Doda',0,'JAKA','',''),('DOHA','Dohad',0,'GUJA','',''),('DUMK','Dumka',0,'JHAR','',''),('DUNG','Dungarpur',0,'RAJA','',''),('DURG','Durg',0,'CHHA','',''),('DWAR','Devbhoomi Dwarka',0,'GUJA','',''),('ERNA','Ernakulam',0,'KERA','',''),('EROD','Erode',0,'TAMI','',''),('ETAH','Etah',0,'UTTA','',''),('ETAW','Etawah',0,'UTTA','',''),('FAIZ','Faizabad',0,'UTTA','',''),('FARD','Faridabad',0,'HARY','',''),('FARI','Faridkot',0,'PUNJ','',''),('FARR','Farrukhabad',0,'UTTA','',''),('FATE','Fatehgarh Sahib',0,'PUNJ','',''),('FATH','Fatehabad',0,'HARY','',''),('FATP','Fatehpur',0,'UTTA','',''),('FAZI','Fazilka',0,'PUNJ','',''),('FIRO','Firozpur',0,'PUNJ','',''),('FIRZ','Firozabad',0,'UTTA','',''),('GADA','Gadag',0,'KARN','',''),('GADC','Gadchiroli',0,'MAHA','',''),('GADW','Gadwal',0,'TELA','',''),('GAJA','Gajapati',0,'ODIS','',''),('GAND','Gandhinagar',0,'GUJA','',''),('GANG','Ganganagar',0,'RAJA','',''),('GANJ','Ganjam',0,'ODIS','',''),('GARH','Garhwa',0,'JHAR','',''),('GARI','Gariaband',0,'CHHA','',''),('GARO','Garo Hills',0,'MEGH','',''),('GAUT','Gautam Buddha Nagar',0,'UTTA','',''),('GAYA','Gaya',0,'BIHA','',''),('GDER','Ganderbal',0,'JAKA','',''),('GHAI','Ghazipur',0,'UTTA','',''),('GHAZ','Ghaziabad',0,'UTTA','',''),('GIRI','Giridih',0,'JHAR','',''),('GIRS','Gir Somnath',0,'GUJA','',''),('GOA','Goa',0,'GOAI','',''),('GOAL','Goalpara',0,'ASSA','',''),('GODA','Godavari',0,'ANDH','',''),('GODD','Godda',0,'JHAR','',''),('GOLA','Golaghat',0,'ASSA','',''),('GOND','Gonda',0,'UTTA','',''),('GOPA','Gopalganj',0,'BIHA','',''),('GORA','Gorakhpur',0,'UTTA','',''),('GOTI','Gomati',0,'TRIP','',''),('GOYA','Gondiya',0,'MAHA','',''),('GULB','Gulbarga',0,'KARN','',''),('GUML','Gumla',0,'JHAR','',''),('GUNA','Guna',0,'MADY','',''),('GUNT','Guntur',0,'ANDH','',''),('GURD','Gurdaspur',0,'PUNJ','',''),('GURG','Gurgaon',0,'HARY','',''),('GWAL','Gwalior',0,'MADY','',''),('HAIL','Hailakandi',0,'ASSA','',''),('HAMI','Hamirpur',0,'HIMA',NULL,NULL),('HANU','Hanumangarh',0,'RAJA','',''),('HAOI','Hardoi',0,'UTTA','',''),('HAOR','Haora',0,'WEST','',''),('HAPR','Hamirpur',0,'UTTA',NULL,NULL),('HAPU','Hapur (Panchsheel Nagar district)',0,'UTTA','',''),('HARD','Harda',0,'MADY','',''),('HARI','Haridwar',0,'UTTR','',''),('HASS','Hassan',0,'KARN','',''),('HATH','Hathras (Mahamaya Nagar)',0,'UTTA','',''),('HAVE','Haveri',0,'KARN','',''),('HAZA','Hazaribagh',0,'JHAR','',''),('HING','Hingoli',0,'MAHA','',''),('HISA','Hisar',0,'HARY','',''),('HOSH','Hoshangabad',0,'MADY','',''),('HOUR','Hoshiarpur',0,'PUNJ','',''),('HUGL','Hugli',0,'WEST','',''),('HYDE','Hyderabad',0,'TELA','',''),('IDUK','Idukki',0,'KERA','',''),('IMPH','Imphal West',0,'MANI','',''),('INDO','Indore',0,'MADY','',''),('JAAN','Jalaun',0,'UTTA','',''),('JABA','Jabalpur',0,'MADY','',''),('JAGA','Jagatsinghpur',0,'ODIS','',''),('JAGT','Jagtial',0,'TELA','',''),('JAIP','Jaipur',0,'RAJA','',''),('JAIS','Jaisalmer',0,'RAJA','',''),('JAJP','Jajpur',0,'ODIS','',''),('JALA','Jalandhar',0,'PUNJ','',''),('JALG','Jalgaon',0,'MAHA','',''),('JALN','Jalna',0,'MAHA','',''),('JALO','Jalor',0,'RAJA','',''),('JALP','Jalpaiguri',0,'WEST','',''),('JAMM','Jammu',0,'JAKA','',''),('JAMN','Jamnagar',0,'GUJA','',''),('JAMT','Jamtara',0,'JHAR','',''),('JAMU','Jamui',0,'BIHA','',''),('JANG','Jangaon',0,'TELA','',''),('JANJ','Janjgir Champa',0,'CHHA','',''),('JASH','Jashpur',0,'CHHA','',''),('JAUN','Jaunpur',0,'UTTA','',''),('JAYA','Jayashankar',0,'TELA','',''),('JEHA','Jehanabad',0,'BIHA','',''),('JHAB','Jhabua',0,'MADY','',''),('JHAJ','Jhajjar',0,'HARY','',''),('JHAL','Jhalawar',0,'RAJA','',''),('JHAN','Jhansi',0,'UTTA','',''),('JHAR','Jharsuguda',0,'ODIS','',''),('JHUN','Jhunjhunun',0,'RAJA','',''),('JIND','Jind',0,'HARY','',''),('JIRI','Jiribam',0,'MANI','',''),('JODH','Jodhpur',0,'RAJA','',''),('JORH','Jorhat',0,'ASSA','',''),('JUNA','Junagadh',0,'GUJA','',''),('JYOT','Jyotiba Phule Nagar',0,'UTTA','',''),('KAAG','Karimnagar',0,'TELA','',''),('KAAM','Kandhamal',0,'ODIS','',''),('KABI','Karbi Anglong',0,'ASSA','',''),('KACH','Kachchh',0,'GUJA','',''),('KAGP','Kangpokpi',0,'MANI','',''),('KAIM','Karimganj',0,'ASSA','',''),('KAIT','Kaithal',0,'HARY','',''),('KAKC','Kakching district',0,'MANI','',''),('KALA','Kalahandi',0,'ODIS','',''),('KAMA','Kamareddy',0,'TELA','',''),('KAME','West Kameng',0,'ARUN','',''),('KAMJ','Kamjong',0,'MANI','',''),('KAMR','Kamrup Metropolitan',0,'ASSA','',''),('KANA','Kannauj',0,'UTTA','',''),('KANC','Kancheepuram',0,'TAMI','',''),('KAND','Kanpur Dehat (Ramabai Nagar)',0,'UTTA','',''),('KANG','Kangra',0,'HIMA','',''),('KANI','Kanniyakumari',0,'TAMI','',''),('KANK','Kanker',0,'CHHA','',''),('KANN','Kannur',0,'KERA','',''),('KANP','Kanpur Nagar',0,'UTTA','',''),('KAPU','Kapurthala',0,'PUNJ','',''),('KARA','Karaikal',0,'PUDU','',''),('KARB','Karbi Anglong',0,'ASSA','',''),('KARG','Kargil',0,'JAKA','',''),('KARI','Karimganj',0,'ASSA','',''),('KARN','Karnal',0,'HARY','',''),('KARU','Karur',0,'TAMI','',''),('KASA','Kasaragod',0,'KERA','',''),('KASG','Kasganj (Kanshiram Nagar)',0,'UTTA','',''),('KATH','Kathua',0,'JAKA','',''),('KATI','Katihar',0,'BIHA','',''),('KATN','Katni',0,'MADY','',''),('KAUL','Karauli',0,'RAJA','',''),('KAUS','Kaushambi',0,'UTTA','',''),('KBDH','Kabirdham',0,'CHHA','',''),('KEND','Kendrapara',0,'ODIS','',''),('KENJ','Kendujhar (Keonjhar)',0,'ODIS','',''),('KHAG','Khagaria',0,'BIHA','',''),('KHAM','Khammam',0,'TELA','',''),('KHAN','Khandwa(East Nimar)',0,'MADY','',''),('KHAR','Khargone(West Nimar)',0,'MADY','',''),('KHED','Kheda',0,'GUJA','',''),('KHER','Kheri',0,'UTTA','',''),('KHOR','Khordha',0,'ODIS','',''),('KHOW','Khowai',0,'TRIP','',''),('KHUN','Khunti',0,'JHAR','',''),('KIHA','Kishanganj',0,'BIHA','',''),('KINN','Kinnaur',0,'HIMA','',''),('KIPH','Kiphire',0,'NAGA','',''),('KISH','Kishtwar',0,'JAKA','',''),('KMUR','Kaimur',0,'BIHA','',''),('KOCH','Koch Bihar',0,'WEST','',''),('KOCI','Kochi',0,'KERA',NULL,NULL),('KODA','Kodarma',0,'JHAR','',''),('KODG','Kodagu',0,'KARN','',''),('KOHI','Kohima',0,'NAGA','',''),('KOLA','Kolar',0,'KARN','',''),('KOLH','Kolhapur',0,'MAHA','',''),('KOLK','Kolkata',0,'WEST','',''),('KOLL','Kollam',0,'KERA','',''),('KOMR','Komram Bheem district',0,'TELA','',''),('KOND','Kondagaon',0,'CHHA','',''),('KOPP','Koppal',0,'KARN','',''),('KORA','Koraput',0,'ODIS','',''),('KORB','Korba',0,'CHHA','',''),('KORE','Korea',0,'CHHA','',''),('KOSI','Kolasib',0,'MIZO','',''),('KOTA','Kota',0,'RAJA','',''),('KOTT','Kottayam',0,'KERA','',''),('KOZH','Kozhikode',0,'KERA','',''),('KRIS','Krishna',0,'ANDH','',''),('KRNA','Krishnagiri',0,'TAMI','',''),('KULG','Kulgam',0,'JAKA','',''),('KULL','Kullu',0,'HIMA','',''),('KUME','Kurung Kumey',0,'ARUN','',''),('KUPW','Kupwara',0,'JAKA','',''),('KURN','Kurnool',0,'ANDH','',''),('KURU','Kurukshetra',0,'HARY','',''),('KUSH','Kushinagar',0,'UTTA','',''),('LAHI','Lakhimpur',0,'ASSA','',''),('LAHU','Lahul and Spiti',0,'HIMA','',''),('LAKH','Lakhimpur',0,'ASSA','',''),('LAKS','Lakshadweep',0,'LAKS','',''),('LALI','Lalitpur',0,'UTTA','',''),('LASA','Lakhisarai',0,'BIHA','',''),('LATE','Latehar',0,'JHAR','',''),('LATU','Latur',0,'MAHA','',''),('LAWN','Lawngtlai',0,'MIZO','',''),('LEHJ','Leh',0,'JAKA','',''),('LOHA','Lohardaga',0,'JHAR','',''),('LOHI','Lohit',0,'ARUN','',''),('LONG','Longleng',0,'NAGA','',''),('LUCK','Lucknow',0,'UTTA','',''),('LUDH','Ludhiana',0,'PUNJ','',''),('LUNG','Lunglei',0,'MIZO','',''),('MADA','Mandla',0,'MADY','',''),('MADH','Madhepura',0,'BIHA','',''),('MADU','Madurai',0,'TAMI','',''),('MAGH','Mahendragarh',0,'HARY','',''),('MAHA','Mahasamund',0,'CHHA',NULL,NULL),('MAHB','Mahbubnagar',0,'TELA','',''),('MAHE','Mahe',0,'PUDU','',''),('MAHI','Mahisagar',0,'GUJA','',''),('MAHO','Mahoba',0,'UTTA','',''),('MAHR','Maharajganj',0,'UTTA',NULL,NULL),('MAIN','Mainpuri',0,'UTTA','',''),('MAJU','Majuli',0,'ASSA','',''),('MALA','Malappuram',0,'KERA','',''),('MALD','Maldah',0,'WEST','',''),('MALK','Malkangiri',0,'ODIS','',''),('MAMI','Mamit',0,'MIZO','',''),('MANC','Mancherial',0,'TELA','',''),('MAND','Mandi',0,'HIMA','',''),('MANS','Mansa',0,'PUNJ','',''),('MANU','Mandsaur',0,'MADY','',''),('MANY','Mandya',0,'KARN','',''),('MATH','Mathura',0,'UTTA','',''),('MAUL','Majuli',0,'ASSA','',''),('MAUN','Madhubani',0,'BIHA','',''),('MAUU','Mau',0,'UTTA','',''),('MAYU','Mayurbhanj',0,'ODIS','',''),('MEDA','Medak',0,'TELA','',''),('MEDC','Medchal',0,'TELA','',''),('MEER','Meerut',0,'UTTA','',''),('MEHS','Mehsana',0,'GUJA','',''),('MEWA','Mewat',0,'HARY','',''),('MIRZ','Mirzapur',0,'UTTA','',''),('MNGR','Munger',0,'BIHA','',''),('MOGA','Moga',0,'PUNJ','',''),('MOHA','Mohali',0,'PUNJ','',''),('MOKO','Mokokchung',0,'NAGA','',''),('MON','Mon',0,'NAGA','',''),('MORA','Moradabad',0,'UTTA','',''),('MORB','Morbi',0,'GUJA','',''),('MORE','Morena',0,'MADY','',''),('MORG','Morigaon',0,'ASSA','',''),('MORI','Morigaon',0,'ASSA','',''),('MUAF','Muzaffarpur',0,'BIHA','',''),('MUKT','Muktsar',0,'PUNJ','',''),('MUMB','Mumbai City',0,'MAHA','',''),('MUNG','Mungeli',0,'CHHA','',''),('MURS','Murshidabad',0,'WEST','',''),('MUZA','Muzaffarnagar',0,'UTTA','',''),('MYSO','Mysore',0,'KARN','',''),('NABA','Nabarangpur',0,'ODIS','',''),('NADI','Nadia',0,'WEST','',''),('NAGA','Nagaon',0,'ASSA',NULL,NULL),('NAGK','Nagarkurnool',0,'TELA',NULL,NULL),('NAGO','Nagaon',0,'ASSA','',''),('NAGP','Nagpur',0,'MAHA','',''),('NAGU','Nagaur',0,'RAJA',NULL,NULL),('NAIN','Nainital',0,'UTTR','',''),('NALA','Nalanda',0,'BIHA','',''),('NALB','Nalbari',0,'ASSA','',''),('NALG','Nalgonda',0,'TELA','',''),('NAMA','Namakkal',0,'TAMI','',''),('NANB','Nandurbar',0,'MAHA','',''),('NAND','Nanded',0,'MAHA','',''),('NARA','Narayanpur',0,'CHHA','',''),('NARM','Narmada',0,'GUJA','',''),('NARS','Narsinghpur',0,'MADY','',''),('NASH','Nashik',0,'MAHA','',''),('NATT','Nagapattinam',0,'TAMI',NULL,NULL),('NAVS','Navsari',0,'GUJA','',''),('NAWA','Nawada',0,'BIHA','',''),('NAYA','Nayagarh',0,'ODIS','',''),('NEEM','Neemuch',0,'MADY','',''),('NICO','Nicobar',0,'ANDA','',''),('NILG','The Nilgiris',0,'TAMI','',''),('NIRM','Nirmal',0,'TELA','',''),('NIZA','Nizamabad',0,'TELA','',''),('NONE','Noney',0,'MANI','',''),('NUAP','Nuapada',0,'ODIS','',''),('OSMA','Osmanabad',0,'MAHA','',''),('PAAL','PanchMahal',0,'GUJA','',''),('PAKD','Palakkad',0,'KERA','',''),('PAKU','Pakur',0,'JHAR','',''),('PALA','Palamu',0,'JHAR','',''),('PALG','Palghar',0,'MAHA','',''),('PALI','Pali',0,'RAJA','',''),('PALW','Palwal',0,'HARY','',''),('PANC','Panchkula',0,'HARY','',''),('PANI','Panipat',0,'HARY','',''),('PANN','Panna',0,'MADY','',''),('PAPU','Papum Pare',0,'ARUN','',''),('PARB','Parbhani',0,'MAHA','',''),('PARG','North Twenty Four Parganas',0,'WEST','',''),('PASC','Paschim Medinipur',0,'WEST','',''),('PATA','Patan',0,'GUJA','',''),('PATH','Pathankot',0,'PUNJ','',''),('PATI','Patiala',0,'PUNJ','',''),('PATN','Patna',0,'BIHA','',''),('PAUR','Pauri Garhwal',0,'UTTR','',''),('PEDD','Peddapalli',0,'TELA','',''),('PERA','Perambalur',0,'TAMI','',''),('PERE','Peren',0,'NAGA','',''),('PHEK','Phek',0,'NAGA','',''),('PHER','Pherzawl',0,'MANI','',''),('PILI','Pilibhit',0,'UTTA','',''),('PITH','Pithoragarh',0,'UTTR','',''),('PORB','Porbandar',0,'GUJA','',''),('PRAK','Prakasam',0,'ANDH','',''),('PRAT','Pratapgarh',0,'UTTA','',''),('PRPG','Pratapgarh',0,'RAJA','',''),('PTTL','Pathanamthitta',0,'KERA','',''),('PUDU','Puducherry',0,'PUDU','',''),('PUKK','Pudukkottai',0,'TAMI','',''),('PULW','Pulwama',0,'JAKA','',''),('PUNC','Punch',0,'JAKA','',''),('PUNE','Pune',0,'MAHA','',''),('PURB','Purba Medinipur',0,'WEST','',''),('PURI','Puri',0,'ODIS','',''),('PURN','Purnia',0,'BIHA','',''),('PURU','Puruliya',0,'WEST','',''),('RAEB','Rae Bareli',0,'UTTA','',''),('RAIC','Raichur',0,'KARN','',''),('RAIG','Raigarh',0,'MAHA','',''),('RAIP','Raipur',0,'CHHA','',''),('RAIS','Raisen',0,'MADY','',''),('RAJA','Rajanna',0,'TELA','',''),('RAJG','Rajgarh',0,'MADY','',''),('RAJK','Rajkot',0,'GUJA','',''),('RAJN','Rajnandgaon',0,'CHHA','',''),('RAJO','Rajouri',0,'JAKA','',''),('RAJS','Rajsamand',0,'RAJA','',''),('RAMA','Ramanagara',0,'KARN','',''),('RAMB','Ramban',0,'JAKA','',''),('RAMG','Ramgarh',0,'JHAR','',''),('RAMP','Rampur',0,'UTTA','',''),('RAMU','Sri Potti Sri Ramulu Nellore',0,'ANDH','',''),('RANC','Ranchi',0,'JHAR','',''),('RANG','Ranga Reddy',0,'TELA','',''),('RAPU','Ramanathapuram',0,'TAMI','',''),('RATL','Ratlam',0,'MADY','',''),('RATN','Ratnagiri',0,'MAHA','',''),('RAYA','Rayagada',0,'ODIS','',''),('REAS','Reasi',0,'JAKA','',''),('REWA','Rewa',0,'MADY','',''),('REWI','Rewari',0,'HARY','',''),('RGAH','Raigarh',0,'CHHA','',''),('RIBH','Ri-Bhoi',0,'MEGH','',''),('ROHA','Rohtas',0,'BIHA','',''),('ROHT','Rohtak',0,'HARY','',''),('RUDR','Rudraprayag',0,'UTTR','',''),('RUPN','Rupnagar',0,'PUNJ','',''),('SAAN','Saran',0,'BIHA','',''),('SABA','Sabarkantha',0,'GUJA','',''),('SAGA','Sagar',0,'MADY','',''),('SAGD','Sangareddy',0,'TELA',NULL,NULL),('SAGR','Sangrur',0,'PUNJ',NULL,NULL),('SAHA','Saharsa',0,'BIHA','',''),('SAHI','Sahibganj',0,'JHAR','',''),('SAIH','Saiha',0,'MIZO','',''),('SALE','Salem',0,'TAMI','',''),('SAMA','Samastipur',0,'BIHA','',''),('SANG','Sangli',0,'MAHA',NULL,NULL),('SANR','Sant Ravidas Nagar',0,'UTTA','',''),('SANT','Sant Kabir Nagar',0,'UTTA','',''),('SAPU','Saharanpur',0,'UTTA','',''),('SARA','Saraikela Kharsawan',0,'JHAR','',''),('SATA','Satara',0,'MAHA','',''),('SATN','Satna',0,'MADY','',''),('SAWA','Sawai Madhopur',0,'RAJA','',''),('SEHO','Sehore',0,'MADY','',''),('SENA','Senapati',0,'MANI','',''),('SEON','Seoni',0,'MADY','',''),('SEPA','Sepahijala',0,'TRIP','',''),('SERC','Serchhip',0,'MIZO','',''),('SHAD','Shahdol',0,'MADY','',''),('SHAH','Shahid Bhagat Singh Nagar',0,'PUNJ','',''),('SHAJ','Shajapur',0,'MADY','',''),('SHAM','Shamli',0,'UTTA','',''),('SHEI','Sheikhpura',0,'BIHA','',''),('SHEO','Sheohar',0,'BIHA','',''),('SHGA','Shimoga',0,'KARN','',''),('SHIM','Shimla',0,'HIMA','',''),('SHIV','Shivpuri',0,'MADY','',''),('SHJH','Shahjahanpur',0,'UTTA','',''),('SHPU','Sheopur',0,'MADY','',''),('SHRA','Shrawasti',0,'UTTA','',''),('SHUP','Shupiyan',0,'JAKA','',''),('SIAN','Siang',0,'ARUN','',''),('SIDD','Siddharth Nagar',0,'UTTA','',''),('SIDH','Sidhi',0,'MADY','',''),('SIDP','Siddipet',0,'TELA','',''),('SIGR','Singrauli',0,'MADY','',''),('SIKA','Sikar',0,'RAJA','',''),('SIKK','Sikkim',0,'SIKK','',''),('SIMD','Simdega',0,'JHAR','',''),('SIND','Sindhudurg',0,'MAHA','',''),('SING','West Singhbhum',0,'JHAR','',''),('SIRM','Sirmaur',0,'HIMA','',''),('SIRO','Sirohi',0,'RAJA','',''),('SIRS','Sirsa',0,'HARY','',''),('SITA','Sitapur',0,'UTTA','',''),('SITR','Sitamarhi',0,'BIHA','',''),('SIVA','Sivaganga',0,'TAMI','',''),('SIWA','Siwan',0,'BIHA','',''),('SOAP','Solapur',0,'MAHA','',''),('SOLA','Solan',0,'HIMA','',''),('SONB','Sonbhadra',0,'UTTA','',''),('SONI','Sonipat',0,'HARY','',''),('SOTP','Sonitpur',0,'ASSA','',''),('SRIK','Srikakulam',0,'ANDH','',''),('SRIN','Srinagar',0,'JAKA','',''),('SSAG','Sivasagar',0,'ASSA','',''),('SUBA','Subarnapur (Sonepur)',0,'ODIS','',''),('SUBN','Subansiri',0,'ARUN','',''),('SUKM','Sukma',0,'CHHA','',''),('SULT','Sultanpur',0,'UTTA','',''),('SUND','Sundergarh',0,'ODIS','',''),('SUPA','Supaul',0,'BIHA','',''),('SURA','Surajpur',0,'CHHA','',''),('SURE','Surendranagar',0,'GUJA','',''),('SURG','Surguja',0,'CHHA','',''),('SURT','Surat',0,'GUJA','',''),('SURY','Suryapet',0,'TELA','',''),('TAME','Tamenglong',0,'MANI','',''),('TAPI','Tapi',0,'GUJA','',''),('TARN','Tarn Taran',0,'PUNJ','',''),('TAWA','Tawang',0,'ARUN','',''),('TEHR','Tehri Garhwal',0,'UTTR','',''),('TENG','Tengnoupal',0,'MANI','',''),('THAE','Thane',0,'MAHA','',''),('THAN','Thanjavur',0,'TAMI','',''),('THEN','Theni',0,'TAMI','',''),('THIR','Thiruvarur',0,'TAMI','',''),('THIU','Thiruvallur',0,'TAMI','',''),('THOO','Thoothukkudi',0,'TAMI','',''),('THOU','Thoubal',0,'MANI','',''),('THPU','Thiruvananthapuram',0,'KERA','',''),('THRI','Thrissur',0,'KERA','',''),('TIKA','Tikamgarh',0,'MADY','',''),('TINS','Tinsukia',0,'ASSA','',''),('TIRA','Tirap',0,'ARUN','',''),('TIRC','Tiruchirappalli',0,'TAMI','',''),('TIRN','Tirunelveli',0,'TAMI','',''),('TIRP','Tiruppur',0,'TAMI','',''),('TIRV','Tiruvannamalai',0,'TAMI','',''),('TONK','Tonk',0,'RAJA','',''),('TRIP','Tripura',0,'TRIP','',''),('TUEN','Tuensang',0,'NAGA','',''),('TUMK','Tumkur',0,'KARN','',''),('UDAI','Udaipur',0,'RAJA','',''),('UDAR','Udhampur',0,'JAKA','',''),('UDHA','Udham Singh Nagar',0,'UTTR','',''),('UDUP','Udupi',0,'KARN','',''),('UJJA','Ujjain',0,'MADY','',''),('UKHR','Ukhrul',0,'MANI','',''),('UMAR','Umaria',0,'MADY','',''),('UNA','Una',0,'HIMA','',''),('UNAK','Unakoti',0,'TRIP','',''),('UNNA','Unnao',0,'UTTA','',''),('UTAK','Uttarkashi',0,'UTTR','',''),('VADO','Vadodara',0,'GUJA','',''),('VAIS','Vaishali',0,'BIHA','',''),('VALS','Valsad',0,'GUJA','',''),('VARA','Varanasi',0,'UTTA','',''),('VELL','Vellore',0,'TAMI','',''),('VIDI','Vidisha',0,'MADY','',''),('VIKA','Vikarabad',0,'TELA','',''),('VILU','Viluppuram',0,'TAMI','',''),('VIRU','Virudhunagar',0,'TAMI','',''),('VISA','Visakhapatnam',0,'ANDH','',''),('VIZI','Vizianagaram',0,'ANDH','',''),('WANA','Wanaparthy',0,'TELA','',''),('WARA','Warangal',0,'TELA','',''),('WARD','Wardha',0,'MAHA','',''),('WASH','Washim',0,'MAHA','',''),('WAYA','Wayanad',0,'KERA','',''),('WOKH','Wokha',0,'NAGA','',''),('YADA','Yadadri',0,'TELA','',''),('YADG','Yadgir',0,'KARN','',''),('YAMU','Yamunanagar',0,'HARY','',''),('YANA','Yanam',0,'PUDU','',''),('YAVA','Yavatmal',0,'MAHA','',''),('YSRK','YSR Kadapa',0,'ANDH','',''),('ZUNH','Zunheboto',0,'NAGA','','');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_master`
--

DROP TABLE IF EXISTS `city_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48358 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_master`
--

LOCK TABLES `city_master` WRITE;
/*!40000 ALTER TABLE `city_master` DISABLE KEYS */;
INSERT INTO `city_master` VALUES (42284,'Great Yarmouth',3876),(42285,'Heacham',3876),(42286,'Hopton',3876),(42287,'Kings Lynn',3876),(42288,'Little Cressingham',3876),(42289,'Norwich',3876),(42290,'Sheringham',3876),(42291,'Thetford',3876),(42292,'Trunch',3876),(42293,'Winordhan',3876),(42294,'Wymondham',3876),(42295,'Daventry',3879),(42296,'Irthlingborough',3879),(42297,'Middleton Cheney',3879),(42298,'Oundle',3879),(42299,'Towcester',3879),(42300,'Welford',3879),(42301,'Wellingborough',3879),(42302,'Woodford Halse',3879),(42303,'Brackley',3880),(42304,'Desborough',3880),(42305,'weedon',3880),(42306,'Bedlington',3882),(42307,'Corbridge',3882),(42308,'Cramlington',3882),(42309,'Morpeth',3882),(42310,'Northumberland',3882),(42311,'Ponteland',3882),(42312,'Wooler',3882),(42313,'Burton Joyce',3883),(42314,'Cotgraves',3883),(42315,'Gonalston',3883),(42316,'Mansfield',3883),(42317,'Newark',3883),(42318,'Nottingham',3883),(42319,'Pennyfoot Street',3883),(42320,'Sandiacre',3883),(42321,'Southwell',3883),(42322,'Whatton',3883),(42323,'Bampton',3884),(42324,'Banbury',3884),(42325,'Bicester',3884),(42326,'Blewbury',3884),(42327,'Cheltenham',3884),(42328,'Chipping Norton',3884),(42329,'Drayton',3884),(42330,'Eynsham',3884),(42331,'Farringdon',3884),(42332,'Henely on Thames',3884),(42333,'Henley-on-Thames',3884),(42334,'Oxford',3884),(42335,'Shenington',3884),(42336,'Thame',3884),(42337,'Wantage',3884),(42338,'Builth Wells',3885),(42339,'Knighton',3885),(42340,'Llanbrynmair',3885),(42341,'New town',3885),(42342,'Newtown',3885),(42343,'Rhaeadr',3885),(42344,'Welshpool',3885),(42345,'Hill of Fearn',3886),(42346,'Shoreham',3887),(42347,'Sark',3888),(42348,'Aberdeen',3889),(42349,'Alloa',3889),(42350,'Alness',3889),(42351,'Annan',3889),(42352,'Arbroath',3889),(42353,'Ardrossan',3889),(42354,'Armadale',3889),(42355,'Ayr',3889),(42356,'Bathgate',3889),(42357,'Blairgowrie',3889),(42358,'Blantyre-Hamilton',3889),(42359,'Boness',3889),(42360,'Bonnybridge',3889),(42361,'Broxburn',3889),(42362,'Broxham',3889),(42363,'Buckhaven',3889),(42364,'Burntisland',3889),(42365,'Carluke',3889),(42366,'Carnoustie',3889),(42367,'Coatbridge',3889),(42368,'Cowdenbeath',3889),(42369,'Cumbernauld',3889),(42370,'Cumnock',3889),(42371,'Cupar',3889),(42372,'Dalbeattie',3889),(42373,'Dalkeith',3889),(42374,'Dingwall',3889),(42375,'Dumbarton',3889),(42376,'Dumfries',3889),(42377,'Dundee',3889),(42378,'Dunfermline',3889),(42379,'Dunoon',3889),(42380,'East Kilbride',3889),(42381,'Edimburah',3889),(42382,'Edinburgh',3889),(42383,'Elgin',3889),(42384,'Ellon',3889),(42385,'Erskine',3889),(42386,'Falkirk',3889),(42387,'Forfar',3889),(42388,'Forres',3889),(42389,'Fort William',3889),(42390,'Fraserburgh',3889),(42391,'Galashiels',3889),(42392,'Galston-Newmilns',3889),(42393,'Girvan',3889),(42394,'Glasgow',3889),(42395,'Glenrothes',3889),(42396,'Greengairs',3889),(42397,'Greenock',3889),(42398,'Haddington',3889),(42399,'Hawick',3889),(42400,'Helensburgh',3889),(42401,'Insch',3889),(42402,'Inverkeithing-Dalgety Bay',3889),(42403,'Inverness',3889),(42404,'Inverurie',3889),(42405,'Irvine',3889),(42406,'Isle of Lewis',3889),(42407,'Kilmarnock',3889),(42408,'Kilsyth',3889),(42409,'Kilwinning',3889),(42410,'Kirkcaldy',3889),(42411,'Kirkintilloch-Lenzie',3889),(42412,'Kirkwall',3889),(42413,'Lanark',3889),(42414,'Largs',3889),(42415,'Larkhall',3889),(42416,'Lerwick',3889),(42417,'Linlithgow',3889),(42418,'Livingston',3889),(42419,'Loanhead',3889),(42420,'Montrose',3889),(42421,'Motherwell',3889),(42422,'Nairn',3889),(42423,'Newtown Saint Boswells',3889),(42424,'Paisley',3889),(42425,'Penicuik',3889),(42426,'Perth',3889),(42427,'Peterhead',3889),(42428,'Saint Andrews',3889),(42429,'Selkirkshire',3889),(42430,'Shotts',3889),(42431,'Stirling',3889),(42432,'Stonehaven',3889),(42433,'Stornoway',3889),(42434,'Stranraer',3889),(42435,'Tranent',3889),(42436,'Troon',3889),(42437,'Whitburn',3889),(42438,'Bishops Castle',3891),(42439,'Bridgnorth',3891),(42440,'Bucknell',3891),(42441,'Drayton',3891),(42442,'Greete',3891),(42443,'Hinstock',3891),(42444,'Jackfield',3891),(42445,'Ludlow',3891),(42446,'Much Wenlock',3891),(42447,'Oswestry',3891),(42448,'Ryton',3891),(42449,'Shifnal',3891),(42450,'Shrewsbury',3891),(42451,'Telford',3891),(42452,'Whitchurch',3891),(42453,'Bath',3892),(42454,'Brent Knoll',3892),(42455,'Castle Cary',3892),(42456,'Shepton Mallet',3892),(42457,'Somerset',3892),(42458,'Taunton',3892),(42459,'Wedmore',3892),(42460,'Wellington',3892),(42461,'Weston-super-Mare',3892),(42462,'Burton-on-Trent',3897),(42463,'Hednesford',3897),(42464,'Stoke on Trent',3897),(42465,'Stone',3897),(42466,'Strabane',3898),(42467,'Bury St Edmunds',3899),(42468,'Felixstowe',3899),(42469,'Haverhill',3899),(42470,'Leiston',3899),(42471,'Lowestoft',3899),(42472,'Stowmarket',3899),(42473,'Sudbury',3899),(42474,'Woodbridge',3899),(42475,'Ashtead',3900),(42476,'Bagshot',3900),(42477,'Betchworth',3900),(42478,'Bletchingley',3900),(42479,'Carshalton',3900),(42480,'Chertsey',3900),(42481,'Claygate',3900),(42482,'Croydon',3900),(42483,'Dorking',3900),(42484,'Effingham',3900),(42485,'Epsom',3900),(42486,'Farnham',3900),(42487,'Haslemere',3900),(42488,'Kingston Upon Thames',3900),(42489,'Leatherhead',3900),(42490,'Mitcham',3900),(42491,'New Malden',3900),(42492,'Redhill',3900),(42493,'Richmond',3900),(42494,'Salfords',3900),(42495,'Shepperton',3900),(42496,'Stoneleigh',3900),(42497,'Surbiton',3900),(42498,'Surrey',3900),(42499,'Tadworth',3900),(42500,'Walton on Thames',3900),(42501,'West Molesey',3900),(42502,'Wisley',3900),(42503,'Woking',3900),(42504,'Brighton',3901),(42505,'Henfield',3901),(42506,'Sussex',3901),(42507,'Worthing',3901),(42508,'Twickenham',3902),(42509,'Omagh',3904),(42510,'Santaquin',3905),(42511,'Aberdare',3906),(42512,'Aberystwyth',3906),(42513,'Barry',3906),(42514,'Brecon',3906),(42515,'Bridgend',3906),(42516,'Brynmawr',3906),(42517,'Caernarfon',3906),(42518,'Caerphily',3906),(42519,'Caldicot',3906),(42520,'Cardiff',3906),(42521,'Carmarthen',3906),(42522,'Colwyn Bay',3906),(42523,'Connahs Quay',3906),(42524,'Cwmbran',3906),(42525,'Dolgellau',3906),(42526,'Ebbw Vale',3906),(42527,'Gaerwen',3906),(42528,'Gwynedd',3906),(42529,'Haverfordwest',3906),(42530,'Isle of Anglesey',3906),(42531,'Islwyn',3906),(42532,'Llandrindod Wells',3906),(42533,'Llanelli',3906),(42534,'Llangefni',3906),(42535,'Maesteg',3906),(42536,'Merthyr Tydfil',3906),(42537,'Mold',3906),(42538,'Mountain Ash-Abercynon',3906),(42539,'Neath',3906),(42540,'Newport',3906),(42541,'Pembrokeshire',3906),(42542,'Penarth',3906),(42543,'Pencader',3906),(42544,'Pontypool',3906),(42545,'Pontypridd',3906),(42546,'Port Talbot',3906),(42547,'Queensferry',3906),(42548,'Rhondda',3906),(42549,'Rhyl',3906),(42550,'Ruthin',3906),(42551,'Shotton-Hawarden',3906),(42552,'St. Asaph',3906),(42553,'Swansea',3906),(42554,'West Glamorgan',3906),(42555,'Wrexham',3906),(42556,'Alcester',3907),(42557,'Coventry',3907),(42558,'Henley in Arden',3907),(42559,'Nuneaton',3907),(42560,'Pershore',3907),(42561,'Southam',3907),(42562,'Warwick',3907),(42563,'Whissendine',3912),(42564,'Amesbury',3913),(42565,'Bradford on Avon',3913),(42566,'Calne',3913),(42567,'Chippenham',3913),(42568,'Corsham',3913),(42569,'Cosham',3913),(42570,'Devizes',3913),(42571,'Downton',3913),(42572,'Malmesbury',3913),(42573,'Marlborough',3913),(42574,'Melksham',3913),(42575,'Pewsey',3913),(42576,'Salisbury',3913),(42577,'Southwick',3913),(42578,'Swindon',3913),(42579,'Warminster',3913),(42580,'Westbury',3913),(42581,'Winnersh',3914),(42582,'Evesham',3915),(42583,'Hartlebury',3915),(42584,'Kidderminster',3915),(42585,'Pershore',3915),(42586,'Redditch',3915),(42587,'Worcester',3915),(42588,'Caergwrle',3916),(42589,'Ruabon',3916),(42590,'Neuffen',3917),(42591,'Beverley',3918),(42592,'Malton',3918),(42593,'Mexborough',3918),(42594,'Alabaster',3919),(42595,'Albertville',3919),(42596,'Alexander City',3919),(42597,'Anniston',3919),(42598,'Arab',3919),(42599,'Ashville',3919),(42600,'Athens',3919),(42601,'Atmore',3919),(42602,'Auburn',3919),(42603,'Bessemer',3919),(42604,'Birmingham',3919),(42605,'Capshaw',3919),(42606,'Center Point',3919),(42607,'Childersburg',3919),(42608,'Cullman',3919),(42609,'Daleville',3919),(42610,'Daphne',3919),(42611,'Decatur',3919),(42612,'Dothan',3919),(42613,'Enterprise',3919),(42614,'Eufaula',3919),(42615,'Fairfield',3919),(42616,'Fairhope',3919),(42617,'Florence',3919),(42618,'Fort Payne',3919),(42619,'Gadsden',3919),(42620,'Grand Bay',3919),(42621,'Grove Hill',3919),(42622,'Guntersville',3919),(42623,'Hampton Cove',3919),(42624,'Hanceville',3919),(42625,'Hartselle',3919),(42626,'Headland',3919),(42627,'Helena',3919),(42628,'Hodges',3919),(42629,'Homewood',3919),(42630,'Hoover',3919),(42631,'Hueytown',3919),(42632,'Huntsville',3919),(42633,'Jacksonville',3919),(42634,'Jasper',3919),(42635,'Leeds',3919),(42636,'Luverne',3919),(42637,'Madison',3919),(42638,'Mobile',3919),(42639,'Montgomery',3919),(42640,'Mountain Brook',3919),(42641,'Muscle Shoals',3919),(42642,'Northport',3919),(42643,'Notasulga',3919),(42644,'Opelika',3919),(42645,'Oxford',3919),(42646,'Ozark',3919),(42647,'Pelham',3919),(42648,'Pell City',3919),(42649,'Pennsylvania',3919),(42650,'Phenix City',3919),(42651,'Prattville',3919),(42652,'Prichard',3919),(42653,'Ramer',3919),(42654,'Roanoke',3919),(42655,'Saraland',3919),(42656,'Scottsboro',3919),(42657,'Selma',3919),(42658,'Sheffield',3919),(42659,'Smiths',3919),(42660,'Sumiton',3919),(42661,'Sylacauga',3919),(42662,'Talladega',3919),(42663,'Thomasville',3919),(42664,'Trafford',3919),(42665,'Troy',3919),(42666,'Trussville',3919),(42667,'Tuscaloosa',3919),(42668,'Tuskegee',3919),(42669,'Vestavia Hills',3919),(42670,'Anchorage',3920),(42671,'Barrow',3920),(42672,'Bethel',3920),(42673,'College',3920),(42674,'Fairbanks',3920),(42675,'Homer',3920),(42676,'Juneau',3920),(42677,'Kenai',3920),(42678,'Ketchikan',3920),(42679,'Kodiak',3920),(42680,'Nome',3920),(42681,'Palmer',3920),(42682,'Sitka',3920),(42683,'Soldotna',3920),(42684,'Sterling',3920),(42685,'Unalaska',3920),(42686,'Valdez',3920),(42687,'Wasilla',3920),(42688,'Apache Junction',3921),(42689,'Avondale',3921),(42690,'Bisbee',3921),(42691,'Bouse',3921),(42692,'Bullhead City',3921),(42693,'Carefree',3921),(42694,'Casa Grande',3921),(42695,'Casas Adobes',3921),(42696,'Chandler',3921),(42697,'Clarkdale',3921),(42698,'Cottonwood',3921),(42699,'Douglas',3921),(42700,'Drexel Heights',3921),(42701,'El Mirage',3921),(42702,'Flagstaff',3921),(42703,'Florence',3921),(42704,'Flowing Wells',3921),(42705,'Fort Mohave',3921),(42706,'Fortuna Foothills',3921),(42707,'Fountain Hills',3921),(42708,'Gilbert',3921),(42709,'Glendale',3921),(42710,'Globe',3921),(42711,'Goodyear',3921),(42712,'Green Valley',3921),(42713,'Kingman',3921),(42714,'Lake Havasu City',3921),(42715,'Laveen',3921),(42716,'Litchfield Park',3921),(42717,'Marana',3921),(42718,'Mesa',3921),(42719,'New Kingman-Butler',3921),(42720,'Nogales',3921),(42721,'Oracle',3921),(42722,'Oro Valley',3921),(42723,'Paradise Valley',3921),(42724,'Parker',3921),(42725,'Payson',3921),(42726,'Peoria',3921),(42727,'Phoenix',3921),(42728,'Pine',3921),(42729,'Pinetop',3921),(42730,'Prescott',3921),(42731,'Prescott Valley',3921),(42732,'Quartzsite',3921),(42733,'Queen Creek',3921),(42734,'Rio Rico',3921),(42735,'Safford',3921),(42736,'San Luis',3921),(42737,'Scottsdale',3921),(42738,'Sedona',3921),(42739,'Sierra Vista',3921),(42740,'Sierra Vista Southeast',3921),(42741,'Sun City',3921),(42742,'Sun City West',3921),(42743,'Surprise',3921),(42744,'Tempe',3921),(42745,'Tombstone',3921),(42746,'Tucson',3921),(42747,'Winslow',3921),(42748,'Yuma',3921),(42749,'Alexander',3922),(42750,'Arkadelphia',3922),(42751,'Batesville',3922),(42752,'Bella Vista',3922),(42753,'Benton',3922),(42754,'Bentonville',3922),(42755,'Berryville',3922),(42756,'Blytheville',3922),(42757,'Cabot',3922),(42758,'Camden',3922),(42759,'Cherry Valley',3922),(42760,'Conway',3922),(42761,'Corning',3922),(42762,'El Dorado',3922),(42763,'Fayetteville',3922),(42764,'Forrest City',3922),(42765,'Fort Smith',3922),(42766,'Harrison',3922),(42767,'Hope',3922),(42768,'Hot Springs',3922),(42769,'Jacksonville',3922),(42770,'Jonesboro',3922),(42771,'Lake City',3922),(42772,'Little Rock',3922),(42773,'Magnolia',3922),(42774,'Mount Vernon',3922),(42775,'Mountain Home',3922),(42776,'Norfork',3922),(42777,'North Little Rock',3922),(42778,'Paragould',3922),(42779,'Piggott',3922),(42780,'Pine Bluff',3922),(42781,'Pocahontas',3922),(42782,'Prescott',3922),(42783,'Quitman',3922),(42784,'Rogers',3922),(42785,'Russellville',3922),(42786,'Searcy',3922),(42787,'Sheridan',3922),(42788,'Sherwood',3922),(42789,'Siloam Springs',3922),(42790,'Springdale',3922),(42791,'Stuttgart',3922),(42792,'Texarkana',3922),(42793,'Van Buren',3922),(42794,'Ward',3922),(42795,'West Helena',3922),(42796,'West Memphis',3922),(42797,'Wynne',3922),(42798,'Acton',3924),(42799,'Adelanto',3924),(42800,'Agoura Hills',3924),(42801,'Aguanga',3924),(42802,'Alameda',3924),(42803,'Alamo',3924),(42804,'Albany',3924),(42805,'Alhambra',3924),(42806,'Aliso Viejo',3924),(42807,'Alondra Park',3924),(42808,'Alpine',3924),(42809,'Alta Loma',3924),(42810,'Altadena',3924),(42811,'American Canyon',3924),(42812,'Anaheim',3924),(42813,'Anderson',3924),(42814,'Antelope',3924),(42815,'Antioch',3924),(42816,'Apple Valley',3924),(42817,'Aptos',3924),(42818,'Arcadia',3924),(42819,'Arcata',3924),(42820,'Arden-Arcade',3924),(42821,'Arroyo Grande',3924),(42822,'Artesia',3924),(42823,'Arvin',3924),(42824,'Ashland',3924),(42825,'Atascadero',3924),(42826,'Atwater',3924),(42827,'Auburn',3924),(42828,'Avalon',3924),(42829,'Avenal',3924),(42830,'Avocado Heights',3924),(42831,'Azusa',3924),(42832,'Bakersfield',3924),(42833,'Baldwin Park',3924),(42834,'Banning',3924),(42835,'Barstow',3924),(42836,'Bay Point',3924),(42837,'Baywood-Los Osos',3924),(42838,'Bear Valley Springs',3924),(42839,'Beaumont',3924),(42840,'Bell',3924),(42841,'Bell Gardens',3924),(42842,'Bellflower',3924),(42843,'Belmont',3924),(42844,'Ben Lomond',3924),(42845,'Benicia',3924),(42846,'Berkeley',3924),(42847,'Beverly Hills',3924),(42848,'Big Bear Lake',3924),(42849,'Bloomington',3924),(42850,'Blythe',3924),(42851,'Bonita',3924),(42852,'Bostonia',3924),(42853,'Brawley',3924),(42854,'Brea',3924),(42855,'Brentwood',3924),(42856,'Brisbane',3924),(42857,'Brookdale',3924),(42858,'Buena Park',3924),(42859,'Burbank',3924),(42860,'Burlingame',3924),(42861,'Burnham',3924),(42862,'Byron',3924),(42863,'Calabasas',3924),(42864,'Calexico',3924),(42865,'California City',3924),(42866,'Camarillo',3924),(42867,'Cameron Park',3924),(42868,'Camino',3924),(42869,'Camp Pendleton North',3924),(42870,'Camp Pendleton South',3924),(42871,'Campbell',3924),(42872,'Canoga Park',3924),(42873,'Canyon Lake',3924),(42874,'Capitola',3924),(42875,'Carlsbad',3924),(42876,'Carmel',3924),(42877,'Carmel Valley',3924),(42878,'Carmichael',3924),(42879,'Carpinteria',3924),(42880,'Carson',3924),(42881,'Casa de Oro-Mount Helix',3924),(42882,'Castaic',3924),(42883,'Castro Valley',3924),(42884,'Cathedral City',3924),(42885,'Cayucos',3924),(42886,'Ceres',3924),(42887,'Cerritos',3924),(42888,'Charter Oak',3924),(42889,'Chatsworth',3924),(42890,'Cherryland',3924),(42891,'Chico',3924),(42892,'Chino',3924),(42893,'Chino Hills',3924),(42894,'Chula Vista',3924),(42895,'Citrus',3924),(42896,'Citrus Heights',3924),(42897,'City of Commerce',3924),(42898,'City of Industry',3924),(42899,'Claremont',3924),(42900,'Clearlake',3924),(42901,'Clovis',3924),(42902,'Coachella',3924),(42903,'Coalinga',3924),(42904,'Colfax',3924),(42905,'Colton',3924),(42906,'Colusa',3924),(42907,'Commerce',3924),(42908,'Compton',3924),(42909,'Concord',3924),(42910,'Corcoran',3924),(42911,'Corning',3924),(42912,'Corona',3924),(42913,'Coronado',3924),(42914,'Corte Madera',3924),(42915,'Costa Mesa',3924),(42916,'Cotati',3924),(42917,'Cottonwood',3924),(42918,'Country Club',3924),(42919,'Covina',3924),(42920,'Crestline',3924),(42921,'Cudahy',3924),(42922,'Culver City',3924),(42923,'Cupertino',3924),(42924,'Cypress',3924),(42925,'Daly City',3924),(42926,'Dana Point',3924),(42927,'Danville',3924),(42928,'Davis',3924),(42929,'Del Mar',3924),(42930,'Delano',3924),(42931,'Desert Hot Springs',3924),(42932,'Diamond Bar',3924),(42933,'Dinuba',3924),(42934,'Dixon',3924),(42935,'Downey',3924),(42936,'Duarte',3924),(42937,'Dublin',3924),(42938,'East Foothills',3924),(42939,'East Hemet',3924),(42940,'East La Mirada',3924),(42941,'East Palo Alto',3924),(42942,'East San Gabriel',3924),(42943,'El Cajon',3924),(42944,'El Centro',3924),(42945,'El Cerrito',3924),(42946,'El Granada',3924),(42947,'El Monte',3924),(42948,'El Paso de Robles',3924),(42949,'El Segundo',3924),(42950,'El Sobrante',3924),(42951,'Elk Grove',3924),(42952,'Emeryville',3924),(42953,'Encinitas',3924),(42954,'Encino',3924),(42955,'Escondido',3924),(42956,'Etna',3924),(42957,'Eureka',3924),(42958,'Exeter',3924),(42959,'Fair Oaks',3924),(42960,'Fairfax',3924),(42961,'Fairfield',3924),(42962,'Fairview',3924),(42963,'Fallbrook',3924),(42964,'Ferndale',3924),(42965,'Fillmore',3924),(42966,'Florence-Graham',3924),(42967,'Florin',3924),(42968,'Folsom',3924),(42969,'Fontana',3924),(42970,'Foothill Farms',3924),(42971,'Foothill Ranch',3924),(42972,'Forestville',3924),(42973,'Fort Bragg',3924),(42974,'Fortuna',3924),(42975,'Foster City',3924),(42976,'Fountain Valley',3924),(42977,'Freedom',3924),(42978,'Fremont',3924),(42979,'Fresno',3924),(42980,'Fullerton',3924),(42981,'Galt',3924),(42982,'Garberville',3924),(42983,'Garden Acres',3924),(42984,'Garden Grove',3924),(42985,'Gardena',3924),(42986,'Georgetown',3924),(42987,'Gilroy',3924),(42988,'Glen Avon',3924),(42989,'Glendale',3924),(42990,'Glendora',3924),(42991,'Goleta',3924),(42992,'Gonzales',3924),(42993,'Granada Hills',3924),(42994,'Grand Terrace',3924),(42995,'Grass Valley',3924),(42996,'Greenfield',3924),(42997,'Grover Beach',3924),(42998,'Gualala',3924),(42999,'Guerneville',3924),(43000,'Hacienda Heights',3924),(43001,'Half Moon Bay',3924),(43002,'Hanford',3924),(43003,'Harbor City',3924),(43004,'Hawaiian Gardens',3924),(43005,'Hawthorne',3924),(43006,'Hayward',3924),(43007,'Hemet',3924),(43008,'Hercules',3924),(43009,'Hermosa Beach',3924),(43010,'Hesperia',3924),(43011,'Highland',3924),(43012,'Hillsborough',3924),(43013,'Hollister',3924),(43014,'Hollywood',3924),(43015,'Huntington Beach',3924),(43016,'Huntington Park',3924),(43017,'Idyllwild',3924),(43018,'Imperial Beach',3924),(43019,'Indio',3924),(43020,'Industry',3924),(43021,'Inglewood',3924),(43022,'Irvine',3924),(43023,'Irwindale',3924),(43024,'Isla Vista',3924),(43025,'Jackson',3924),(43026,'Jamul',3924),(43027,'La Canada Flintridge',3924),(43028,'La Crescenta-Montrose',3924),(43029,'La Habra',3924),(43030,'La Jolla',3924),(43031,'La Mesa',3924),(43032,'La Mirada',3924),(43033,'La Palma',3924),(43034,'La Presa',3924),(43035,'La Puente',3924),(43036,'La Quinta',3924),(43037,'La Riviera',3924),(43038,'La Verne',3924),(43039,'LaVerne',3924),(43040,'Ladera Ranch',3924),(43041,'Lafayette',3924),(43042,'Laguna',3924),(43043,'Laguna Beach',3924),(43044,'Laguna Hills',3924),(43045,'Laguna Niguel',3924),(43046,'Lake Elsinore',3924),(43047,'Lake Forest',3924),(43048,'Lakeside',3924),(43049,'Lakewood',3924),(43050,'Lamont',3924),(43051,'Lancaster',3924),(43052,'Larkspur',3924),(43053,'Lawndale',3924),(43054,'Laytonville',3924),(43055,'Lemon Grove',3924),(43056,'Lemoore',3924),(43057,'Lennox',3924),(43058,'Linda',3924),(43059,'Lindsay',3924),(43060,'Live Oak',3924),(43061,'Livermore',3924),(43062,'Livingston',3924),(43063,'Lodi',3924),(43064,'Loma Linda',3924),(43065,'Lomita',3924),(43066,'Lompoc',3924),(43067,'Long Beach',3924),(43068,'Los Alamitos',3924),(43069,'Los Altos',3924),(43070,'Los Angeles',3924),(43071,'Los Angeles East',3924),(43072,'Los Banos',3924),(43073,'Los Gatos',3924),(43074,'Los Olivos',3924),(43075,'Lynwood',3924),(43076,'MacKinleyville',3924),(43077,'Madera',3924),(43078,'Magalia',3924),(43079,'Malibu',3924),(43080,'Mammoth Lakes',3924),(43081,'Manhattan Beach',3924),(43082,'Manteca',3924),(43083,'Marina',3924),(43084,'Marina del Rey',3924),(43085,'Mariposa',3924),(43086,'Marshall',3924),(43087,'Martinez',3924),(43088,'Marysville',3924),(43089,'Maywood',3924),(43090,'Menlo Park',3924),(43091,'Merced',3924),(43092,'Middletown',3924),(43093,'Midway City',3924),(43094,'Mill Valley',3924),(43095,'Millbrae',3924),(43096,'Milpitas',3924),(43097,'Mira Loma',3924),(43098,'Miranda',3924),(43099,'Mission Viejo',3924),(43100,'Modesto',3924),(43101,'Monclair',3924),(43102,'Monrovia',3924),(43103,'Montara',3924),(43104,'Montclair',3924),(43105,'Montebello',3924),(43106,'Montecito',3924),(43107,'Monterey',3924),(43108,'Monterey Park',3924),(43109,'Moorpark',3924),(43110,'Moraga Town',3924),(43111,'Moreno Valley',3924),(43112,'Morgan Hill',3924),(43113,'Morro Bay',3924),(43114,'Moss Beach',3924),(43115,'Mount Shasta',3924),(43116,'Mountain View',3924),(43117,'Murrieta',3924),(43118,'N. Hollywood',3924),(43119,'Napa',3924),(43120,'National City',3924),(43121,'Nevada City',3924),(43122,'Newark',3924),(43123,'Newport Beach',3924),(43124,'Norco',3924),(43125,'North Auburn',3924),(43126,'North Fair Oaks',3924),(43127,'North Fork',3924),(43128,'North Highlands',3924),(43129,'North Hills',3924),(43130,'North Hollywood',3924),(43131,'Northridge',3924),(43132,'Norwalk',3924),(43133,'Novato',3924),(43134,'Nuevo',3924),(43135,'Oak View',3924),(43136,'Oakdale',3924),(43137,'Oakhurst',3924),(43138,'Oakland',3924),(43139,'Oakley',3924),(43140,'Oceanside',3924),(43141,'Oildale',3924),(43142,'Ojai',3924),(43143,'Olivehurst',3924),(43144,'Ontario',3924),(43145,'Orange',3924),(43146,'Orangevale',3924),(43147,'Orcutt',3924),(43148,'Oregon House',3924),(43149,'Orinda',3924),(43150,'Oroville',3924),(43151,'Oxnard',3924),(43152,'Pacific Grove',3924),(43153,'Pacific Palisades',3924),(43154,'Pacifica',3924),(43155,'Pacoima',3924),(43156,'Pajaro',3924),(43157,'Palm Desert',3924),(43158,'Palm Springs',3924),(43159,'Palmdale',3924),(43160,'Palo Alto',3924),(43161,'Palos Verdes Estates',3924),(43162,'Pamona',3924),(43163,'Panorama City',3924),(43164,'Paradise',3924),(43165,'Paramount',3924),(43166,'Parkway-South Sacramento',3924),(43167,'Parlier',3924),(43168,'Pasadena',3924),(43169,'Patterson',3924),(43170,'Pedley',3924),(43171,'Perris',3924),(43172,'Petaluma',3924),(43173,'Pico Rivera',3924),(43174,'Piedmont',3924),(43175,'Pinole',3924),(43176,'Pismo Beach',3924),(43177,'Pittsburg',3924),(43178,'Placentia',3924),(43179,'Placerville',3924),(43180,'Playa del Rey',3924),(43181,'Pleasant Hill',3924),(43182,'Pleasanton',3924),(43183,'Plymouth',3924),(43184,'Point Reyes Station',3924),(43185,'Pollock Pines',3924),(43186,'Pomona',3924),(43187,'Port Costa',3924),(43188,'Port Hueneme',3924),(43189,'Porterville',3924),(43190,'Poway',3924),(43191,'Quartz Hill',3924),(43192,'Ramona',3924),(43193,'Rancho Cordova',3924),(43194,'Rancho Cucamonga',3924),(43195,'Rancho Dominguez',3924),(43196,'Rancho Mirage',3924),(43197,'Rancho Murieta',3924),(43198,'Rancho Palos Verdes',3924),(43199,'Rancho San Diego',3924),(43200,'Rancho Santa Margarita',3924),(43201,'Red Bluff',3924),(43202,'Redding',3924),(43203,'Redlands',3924),(43204,'Redondo Beach',3924),(43205,'Redway',3924),(43206,'Redwood City',3924),(43207,'Reedley',3924),(43208,'Reseda',3924),(43209,'Rialto',3924),(43210,'Richmond',3924),(43211,'Ridgecrest',3924),(43212,'Rio Linda',3924),(43213,'Rio Nido',3924),(43214,'Rio del Mar',3924),(43215,'Riverbank',3924),(43216,'Riverside',3924),(43217,'Rocklin',3924),(43218,'Rohnert Park',3924),(43219,'Rolling Hills',3924),(43220,'Rosamond',3924),(43221,'Roseland',3924),(43222,'Rosemead',3924),(43223,'Rosemont',3924),(43224,'Roseville',3924),(43225,'Rossmoor',3924),(43226,'Rowland Heights',3924),(43227,'Rubidoux',3924),(43228,'Sacramento',3924),(43229,'Salinas',3924),(43230,'San Anselmo',3924),(43231,'San Bernardino',3924),(43232,'San Bruno',3924),(43233,'San Buenaventura',3924),(43234,'San Carlos',3924),(43235,'San Clemente',3924),(43236,'San Diego',3924),(43237,'San Dimas',3924),(43238,'San Fernando',3924),(43239,'San Francisco',3924),(43240,'San Gabriel',3924),(43241,'San Jacinto',3924),(43242,'San Jose',3924),(43243,'San Juan Capistrano',3924),(43244,'San Leandro',3924),(43245,'San Lorenzo',3924),(43246,'San Luis Obispo',3924),(43247,'San Marcos',3924),(43248,'San Marino',3924),(43249,'San Mateo',3924),(43250,'San Pablo',3924),(43251,'San Pedro',3924),(43252,'San Rafael',3924),(43253,'San Ramon',3924),(43254,'San Ysidro',3924),(43255,'Sanger',3924),(43256,'Santa Ana',3924),(43257,'Santa Barbara',3924),(43258,'Santa Clara',3924),(43259,'Santa Clarita',3924),(43260,'Santa Cruz',3924),(43261,'Santa Fe Springs',3924),(43262,'Santa Maria',3924),(43263,'Santa Monica',3924),(43264,'Santa Paula',3924),(43265,'Santa Rosa',3924),(43266,'Santa Ynez',3924),(43267,'Santee',3924),(43268,'Saratoga',3924),(43269,'Sausalito',3924),(43270,'Scotts Valley',3924),(43271,'Seal Beach',3924),(43272,'Seaside',3924),(43273,'Sebastopol',3924),(43274,'Selma',3924),(43275,'Shafter',3924),(43276,'Sherman Oaks',3924),(43277,'Sierra Madre',3924),(43278,'Signal Hill',3924),(43279,'Simi Valley',3924),(43280,'Solana Beach',3924),(43281,'Soledad',3924),(43282,'Solvang',3924),(43283,'Sonoma',3924),(43284,'Sonora',3924),(43285,'Soquel',3924),(43286,'South El Monte',3924),(43287,'South Gate',3924),(43288,'South Lake Tahoe',3924),(43289,'South Pasadena',3924),(43290,'South San Francisco',3924),(43291,'South San Jose Hills',3924),(43292,'South Whittier',3924),(43293,'South Yuba City',3924),(43294,'Spring Valley',3924),(43295,'St. Helena',3924),(43296,'Stanford',3924),(43297,'Stanton',3924),(43298,'Stevenson Ranch',3924),(43299,'Stockton',3924),(43300,'Strathmore',3924),(43301,'Studio City',3924),(43302,'Suisun City',3924),(43303,'Sun City',3924),(43304,'Sun Valley',3924),(43305,'Sunland',3924),(43306,'Sunnyvale',3924),(43307,'Susanville',3924),(43308,'Sutter',3924),(43309,'Sylmar',3924),(43310,'Tahoe City',3924),(43311,'Tamalpais-Homestead Valley',3924),(43312,'Tarzana',3924),(43313,'Tehachapi',3924),(43314,'Temecula',3924),(43315,'Temple City',3924),(43316,'Thousand Oaks',3924),(43317,'Tiburon',3924),(43318,'Topanga',3924),(43319,'Torrance',3924),(43320,'Trabuco Canyon',3924),(43321,'Tracy',3924),(43322,'Trinidad',3924),(43323,'Trona',3924),(43324,'Truckee',3924),(43325,'Tujunga',3924),(43326,'Tulare',3924),(43327,'Turlock',3924),(43328,'Tustin',3924),(43329,'Tustin Foothills',3924),(43330,'Twentynine Palms',3924),(43331,'Twentynine Palms Base',3924),(43332,'Ukiah',3924),(43333,'Union City',3924),(43334,'Upland',3924),(43335,'Vacaville',3924),(43336,'Valencia',3924),(43337,'Valinda',3924),(43338,'Valle Vista',3924),(43339,'Vallejo',3924),(43340,'Valley Center',3924),(43341,'Valley Glen',3924),(43342,'Valley Village',3924),(43343,'Van Nuys',3924),(43344,'Vandenberg Air Force Base',3924),(43345,'Venice',3924),(43346,'Ventura',3924),(43347,'Vernon',3924),(43348,'Victorville',3924),(43349,'View Park-Windsor Hills',3924),(43350,'Vincent',3924),(43351,'Visalia',3924),(43352,'Vista',3924),(43353,'Walnut',3924),(43354,'Walnut Creek',3924),(43355,'Walnut Park',3924),(43356,'Wasco',3924),(43357,'Waterford',3924),(43358,'Watsonville',3924),(43359,'West Athens',3924),(43360,'West Carson',3924),(43361,'West Covina',3924),(43362,'West Hills',3924),(43363,'West Hollywood',3924),(43364,'West Puente Valley',3924),(43365,'West Sacramento',3924),(43366,'West Whittier-Los Nietos',3924),(43367,'Westlake Village',3924),(43368,'Westminster',3924),(43369,'Westmont',3924),(43370,'Whittier',3924),(43371,'Wildomar',3924),(43372,'Willits',3924),(43373,'Willowbrook',3924),(43374,'Wilmington',3924),(43375,'Windsor',3924),(43376,'Woodland',3924),(43377,'Woodland Hills',3924),(43378,'Yorba Linda',3924),(43379,'Yreka',3924),(43380,'Yuba City',3924),(43381,'Yucaipa',3924),(43382,'Yucca Valley',3924),(43383,'Air Force Academy',3926),(43384,'Alamosa',3926),(43385,'Applewood',3926),(43386,'Arvada',3926),(43387,'Aspen',3926),(43388,'Aurora',3926),(43389,'Avon',3926),(43390,'Basalt',3926),(43391,'Bellvue',3926),(43392,'Black Forest',3926),(43393,'Boulder',3926),(43394,'Brighton',3926),(43395,'Broomfield',3926),(43396,'Canon City',3926),(43397,'Carbondale',3926),(43398,'Castle Rock',3926),(43399,'Castlewood',3926),(43400,'Centennial',3926),(43401,'Cimarron Hills',3926),(43402,'Clifton',3926),(43403,'Colorado Springs',3926),(43404,'Columbine',3926),(43405,'Commerce City',3926),(43406,'Cortez',3926),(43407,'Crawford',3926),(43408,'Denver',3926),(43409,'Durango',3926),(43410,'Edwards',3926),(43411,'Elizabeth',3926),(43412,'Englewood',3926),(43413,'Estes Park',3926),(43414,'Evergreen',3926),(43415,'Federal Heights',3926),(43416,'Fort Carson',3926),(43417,'Fort Collins',3926),(43418,'Fort Morgan',3926),(43419,'Fountain',3926),(43420,'Golden',3926),(43421,'Grand Junction',3926),(43422,'Greeley',3926),(43423,'Greenwood Village',3926),(43424,'Gunbarrel',3926),(43425,'Highlands Ranch',3926),(43426,'Holly',3926),(43427,'Ken Caryl',3926),(43428,'Lafayette',3926),(43429,'Lakewood',3926),(43430,'Littleton',3926),(43431,'Longmont',3926),(43432,'Louisville',3926),(43433,'Loveland',3926),(43434,'Lyons',3926),(43435,'Montrose',3926),(43436,'Monument',3926),(43437,'Nederland',3926),(43438,'Niwot',3926),(43439,'Northglenn',3926),(43440,'Pagosa Springs',3926),(43441,'Parker',3926),(43442,'Penrose',3926),(43443,'Peyton',3926),(43444,'Pueblo',3926),(43445,'Redlands',3926),(43446,'Ridgway',3926),(43447,'Rifle',3926),(43448,'Rocky Ford',3926),(43449,'Sanford',3926),(43450,'Security-Widefield',3926),(43451,'Sherrelwood',3926),(43452,'Silver Cliff',3926),(43453,'Snowmass Village',3926),(43454,'Southglenn',3926),(43455,'Steamboat Springs',3926),(43456,'Sterling',3926),(43457,'Superior',3926),(43458,'Telluride',3926),(43459,'Thornton',3926),(43460,'Vail',3926),(43461,'Welby',3926),(43462,'Westcliffe',3926),(43463,'Westminster',3926),(43464,'Wheat Ridge',3926),(43465,'Woodland Park',3926),(43466,'Ansonia',3927),(43467,'Avon',3927),(43468,'Bethel',3927),(43469,'Bethlehem',3927),(43470,'Bloomfield',3927),(43471,'Branford',3927),(43472,'Bridgeport',3927),(43473,'Bristol',3927),(43474,'Canaan',3927),(43475,'Canton',3927),(43476,'Central Manchester',3927),(43477,'Cheshire',3927),(43478,'Colchester',3927),(43479,'Conning Towers-Nautilus Park',3927),(43480,'Coscob',3927),(43481,'Cranbury',3927),(43482,'Cromwell',3927),(43483,'Danbury',3927),(43484,'Darien',3927),(43485,'Dayville',3927),(43486,'Derby',3927),(43487,'East Hartford',3927),(43488,'East Haven',3927),(43489,'Ellington',3927),(43490,'Enfield',3927),(43491,'Fairfield',3927),(43492,'Farmington',3927),(43493,'Glastonbury',3927),(43494,'Greens Farms',3927),(43495,'Greenwich',3927),(43496,'Groton',3927),(43497,'Guilford',3927),(43498,'Haddam',3927),(43499,'Hamden',3927),(43500,'Hartford',3927),(43501,'Harwinton',3927),(43502,'Lakeville',3927),(43503,'Lyme',3927),(43504,'Madison',3927),(43505,'Manchester',3927),(43506,'Meriden',3927),(43507,'Middletown',3927),(43508,'Milford',3927),(43509,'Monroe',3927),(43510,'Mystic',3927),(43511,'Naugatuck',3927),(43512,'New Britain',3927),(43513,'New Canaan',3927),(43514,'New Hartford',3927),(43515,'New Haven',3927),(43516,'New London',3927),(43517,'New Milford',3927),(43518,'New Town',3927),(43519,'Newington',3927),(43520,'North Haven',3927),(43521,'North Stonington',3927),(43522,'Norwalk',3927),(43523,'Norwich',3927),(43524,'Old Saybrook',3927),(43525,'Oneco',3927),(43526,'Orange',3927),(43527,'Pawcatuck',3927),(43528,'Plainville',3927),(43529,'Portland',3927),(43530,'Putnam',3927),(43531,'Riverside',3927),(43532,'Rocky Hill',3927),(43533,'Rowayton',3927),(43534,'Sandy Hook',3927),(43535,'Seymour',3927),(43536,'Sharon',3927),(43537,'Shelton',3927),(43538,'South Windsor',3927),(43539,'Southington',3927),(43540,'Southport',3927),(43541,'Stamford',3927),(43542,'Sterling',3927),(43543,'Storrs',3927),(43544,'Stratford',3927),(43545,'Suffield',3927),(43546,'Taftville',3927),(43547,'Terryville',3927),(43548,'Tolland',3927),(43549,'Torrington',3927),(43550,'Trumbull',3927),(43551,'Vernon',3927),(43552,'Wallingford Center',3927),(43553,'Waterbury',3927),(43554,'Watertown',3927),(43555,'West Hartford',3927),(43556,'West Haven',3927),(43557,'Weston',3927),(43558,'Westport',3927),(43559,'Wethersfield',3927),(43560,'Willimantic',3927),(43561,'Wilton',3927),(43562,'Windsor',3927),(43563,'Windsor Locks',3927),(43564,'Winsted',3927),(43565,'Woodbury',3927),(43566,'Woodstock',3927),(43567,'pomfret',3927),(43568,'Bear',3928),(43569,'Brookside',3928),(43570,'Claymont',3928),(43571,'Dover',3928),(43572,'Dover Base Housing',3928),(43573,'Edgemoor',3928),(43574,'Elsmere',3928),(43575,'Georgetown',3928),(43576,'Greenville',3928),(43577,'Middletown',3928),(43578,'Milford',3928),(43579,'Milton',3928),(43580,'Newark',3928),(43581,'Pike Creek',3928),(43582,'Seaford',3928),(43583,'Smyrna',3928),(43584,'Stanton',3928),(43585,'Talleyville',3928),(43586,'Wilmington',3928),(43587,'Wilmington Manor',3928),(43588,'Alachua',3930),(43589,'Altamonte Springs',3930),(43590,'Apopka',3930),(43591,'Atlantic Beach',3930),(43592,'Auburndale',3930),(43593,'Aventura',3930),(43594,'Avon Park',3930),(43595,'Azalea Park',3930),(43596,'Bal Harbour',3930),(43597,'Bartow',3930),(43598,'Bayonet Point',3930),(43599,'Bayshore Gardens',3930),(43600,'Beach',3930),(43601,'Bellair-Meadowbrook Terrace',3930),(43602,'Belle Glade',3930),(43603,'Bellview',3930),(43604,'Beverly Hills',3930),(43605,'Bloomingdale',3930),(43606,'Boca Raton',3930),(43607,'Boca del Mar',3930),(43608,'Bonita Springs',3930),(43609,'Boynton Beach',3930),(43610,'Bradenton',3930),(43611,'Brandon',3930),(43612,'Brent',3930),(43613,'Brooksville',3930),(43614,'Brownsville',3930),(43615,'Buena Ventura Lakes',3930),(43616,'Bunnell',3930),(43617,'Callaway',3930),(43618,'Cape Coral',3930),(43619,'Carol City',3930),(43620,'Casselberry',3930),(43621,'Catalina Foothills',3930),(43622,'Celebration',3930),(43623,'Century Village',3930),(43624,'Citrus Park',3930),(43625,'Clearwater',3930),(43626,'Clermont',3930),(43627,'Cocoa',3930),(43628,'Cocoa Beach',3930),(43629,'Coconut Creek',3930),(43630,'Coconut Grove',3930),(43631,'Conway',3930),(43632,'Cooper City',3930),(43633,'Coral Gables',3930),(43634,'Coral Springs',3930),(43635,'Coral Terrace',3930),(43636,'Cortlandt Manor',3930),(43637,'Country Club',3930),(43638,'Crestview',3930),(43639,'Crystal River',3930),(43640,'Cutler',3930),(43641,'Cutler Ridge',3930),(43642,'Cypress Gardens',3930),(43643,'Cypress Lake',3930),(43644,'Dania',3930),(43645,'Dania Beach',3930),(43646,'Davie',3930),(43647,'Daytona Beach',3930),(43648,'De Bary',3930),(43649,'De Funiak Springs',3930),(43650,'De Land',3930),(43651,'Debary',3930),(43652,'Deer Park',3930),(43653,'Deerfield Beach',3930),(43654,'Del Rio',3930),(43655,'Delray Beach',3930),(43656,'Deltona',3930),(43657,'Destin',3930),(43658,'Doctor Phillips',3930),(43659,'Dora',3930),(43660,'Doral',3930),(43661,'Dundee',3930),(43662,'Dunedin',3930),(43663,'East Lake',3930),(43664,'Edgewater',3930),(43665,'Eglin Air Force Base',3930),(43666,'Egypt Lake-Leto',3930),(43667,'Elfers',3930),(43668,'Englewood',3930),(43669,'Ensley',3930),(43670,'Eustis',3930),(43671,'Fairview Shores',3930),(43672,'Fern Park',3930),(43673,'Fernandina Beach',3930),(43674,'Ferry Pass',3930),(43675,'Flagler Beach',3930),(43676,'Floral City',3930),(43677,'Florida City',3930),(43678,'Florida Ridge',3930),(43679,'Forest City',3930),(43680,'Fort Lauderdale',3930),(43681,'Fort Myers',3930),(43682,'Fort Myers Beach',3930),(43683,'Fort Pierce',3930),(43684,'Fort Walton Beach',3930),(43685,'Freeport',3930),(43686,'Fruitville',3930),(43687,'Ft. Lauderdale',3930),(43688,'Gainesville',3930),(43689,'Gladeview',3930),(43690,'Glenvar Heights',3930),(43691,'Golden Gate',3930),(43692,'Golden Glades',3930),(43693,'Goldenrod',3930),(43694,'Greater Carrollwood',3930),(43695,'Greater Northdale',3930),(43696,'Green Cove Springs',3930),(43697,'Greenacres',3930),(43698,'Gulf Gate Estates',3930),(43699,'Gulfport',3930),(43700,'Haines City',3930),(43701,'Hallandale',3930),(43702,'Hallandale Beach',3930),(43703,'Hammocks',3930),(43704,'Hamptons at Boca Raton',3930),(43705,'Havana',3930),(43706,'Hialeah',3930),(43707,'Hialeah Gardens',3930),(43708,'Highpoint',3930),(43709,'Hobe Sound',3930),(43710,'Holiday',3930),(43711,'Holly Hill',3930),(43712,'Hollywood',3930),(43713,'Homestead',3930),(43714,'Homosassa',3930),(43715,'Hudson',3930),(43716,'Immokalee',3930),(43717,'Inverness',3930),(43718,'Iona',3930),(43719,'Ives Estates',3930),(43720,'Jacksonville',3930),(43721,'Jacksonville Beach',3930),(43722,'Jasmine Estates',3930),(43723,'Jensen Beach',3930),(43724,'Jupiter',3930),(43725,'Kendale Lakes',3930),(43726,'Kendall',3930),(43727,'Kendall West',3930),(43728,'Key Biscayne',3930),(43729,'Key Largo',3930),(43730,'Key West',3930),(43731,'Kings Point',3930),(43732,'Kissimmee',3930),(43733,'Lady Lake',3930),(43734,'Lake Alfred',3930),(43735,'Lake City',3930),(43736,'Lake Lucerne',3930),(43737,'Lake Magdalene',3930),(43738,'Lake Mary',3930),(43739,'Lake Placid',3930),(43740,'Lake Wales',3930),(43741,'Lake Worth',3930),(43742,'Lakeland',3930),(43743,'Lakeland Highlands',3930),(43744,'Lakeside',3930),(43745,'Land O\'Lakes',3930),(43746,'Largo',3930),(43747,'Lauderdale Lakes',3930),(43748,'Lauderhill',3930),(43749,'Laurel',3930),(43750,'Lecanto',3930),(43751,'Leesburg',3930),(43752,'Lehigh Acres',3930),(43753,'Leisure City',3930),(43754,'Lighthouse Point',3930),(43755,'Lockhart',3930),(43756,'Longwood',3930),(43757,'Loxahatchee',3930),(43758,'Lutz',3930),(43759,'Lynn Haven',3930),(43760,'Madison',3930),(43761,'Maitland',3930),(43762,'Mango',3930),(43763,'Marathon',3930),(43764,'Marco',3930),(43765,'Margate',3930),(43766,'Medley',3930),(43767,'Melbourne',3930),(43768,'Merritt Island',3930),(43769,'Miami',3930),(43770,'Miami Beach',3930),(43771,'Miami Gardens',3930),(43772,'Miami Lakes',3930),(43773,'Miami Shores',3930),(43774,'Miami Springs',3930),(43775,'Micco',3930),(43776,'Milton',3930),(43777,'Mims',3930),(43778,'Miramar',3930),(43779,'Mulberry',3930),(43780,'Myrtle Grove',3930),(43781,'Naples',3930),(43782,'Naples Park',3930),(43783,'Naranja',3930),(43784,'New Port Richey',3930),(43785,'New Port Richey East',3930),(43786,'New Smyrna Beach',3930),(43787,'Niceville',3930),(43788,'Nokomis',3930),(43789,'Norland',3930),(43790,'North Andrews Gardens',3930),(43791,'North Fort Myers',3930),(43792,'North Lauderdale',3930),(43793,'North Miami',3930),(43794,'North Miami Beach',3930),(43795,'North Naples',3930),(43796,'North Palm Beach',3930),(43797,'North Port',3930),(43798,'Oak Ridge',3930),(43799,'Oakland Park',3930),(43800,'Ocala',3930),(43801,'Ocoee',3930),(43802,'Ojus',3930),(43803,'Okeechobee',3930),(43804,'Oldsmar',3930),(43805,'Olympia Heights',3930),(43806,'Opa-locka',3930),(43807,'Orange City',3930),(43808,'Orange Park',3930),(43809,'Orlando',3930),(43810,'Ormond Beach',3930),(43811,'Ormond-by-the-Sea',3930),(43812,'Osprey',3930),(43813,'Oviedo',3930),(43814,'Palatka',3930),(43815,'Palm Bay',3930),(43816,'Palm Beach',3930),(43817,'Palm Beach Gardens',3930),(43818,'Palm City',3930),(43819,'Palm Coast',3930),(43820,'Palm Harbor',3930),(43821,'Palm River-Clair Mel',3930),(43822,'Palm Valley',3930),(43823,'Palmetto',3930),(43824,'Palmetto Estates',3930),(43825,'Panama City',3930),(43826,'Parkland',3930),(43827,'Pembroke Park',3930),(43828,'Pembroke Pines',3930),(43829,'Pensacola',3930),(43830,'Perrine',3930),(43831,'Pine Castle',3930),(43832,'Pine Hills',3930),(43833,'Pinellas Park',3930),(43834,'Pinewood',3930),(43835,'Plant City',3930),(43836,'Plantation',3930),(43837,'Pompano Beach',3930),(43838,'Pompano Beach Highlands',3930),(43839,'Ponte Vedra',3930),(43840,'Port Charlotte',3930),(43841,'Port Orange',3930),(43842,'Port Saint John',3930),(43843,'Port Saint Lucie',3930),(43844,'Punta Gorda',3930),(43845,'Quincy',3930),(43846,'Redington Shores',3930),(43847,'Richmond Heights',3930),(43848,'Richmond West',3930),(43849,'Riverview',3930),(43850,'Riviera Beach',3930),(43851,'Rockledge',3930),(43852,'Royal Palm Beach',3930),(43853,'Safety Harbor',3930),(43854,'Saint Augustine',3930),(43855,'Saint Cloud',3930),(43856,'Saint Petersburg',3930),(43857,'Saint Petersburg Beach',3930),(43858,'San Carlos Park',3930),(43859,'Sandalfoot Cove',3930),(43860,'Sanford',3930),(43861,'Sanibel',3930),(43862,'Sarasota',3930),(43863,'Sarasota Springs',3930),(43864,'Satellite Beach',3930),(43865,'Scott Lake',3930),(43866,'Sebastian',3930),(43867,'Seminole',3930),(43868,'Shalimar',3930),(43869,'South Bradenton',3930),(43870,'South Daytona',3930),(43871,'South Miami',3930),(43872,'South Miami Heights',3930),(43873,'South Patrick Shores',3930),(43874,'South Venice',3930),(43875,'Spring Hill',3930),(43876,'Stuart',3930),(43877,'Sun City Center',3930),(43878,'Sunny Isles',3930),(43879,'Sunrise',3930),(43880,'Sunset',3930),(43881,'Sweetwater',3930),(43882,'Tallahassee',3930),(43883,'Tamarac',3930),(43884,'Tamiami',3930),(43885,'Tampa',3930),(43886,'Tarpon Springs',3930),(43887,'Temple Terrace',3930),(43888,'The Crossings',3930),(43889,'The Hammocks',3930),(43890,'Titusville',3930),(43891,'Town\'n\'Country',3930),(43892,'University',3930),(43893,'University Park',3930),(43894,'Valrico',3930),(43895,'Venice',3930),(43896,'Vero Beach',3930),(43897,'Vero Beach South',3930),(43898,'Villas',3930),(43899,'Warrington',3930),(43900,'Wekiva Springs',3930),(43901,'Wellington',3930),(43902,'Wesley Chapel',3930),(43903,'West Little River',3930),(43904,'West Palm Beach',3930),(43905,'West Park',3930),(43906,'West Pensacola',3930),(43907,'West and East Lealman',3930),(43908,'Westchester',3930),(43909,'Weston',3930),(43910,'Westview',3930),(43911,'Westwood Lakes',3930),(43912,'Wilton Manors',3930),(43913,'Windermere',3930),(43914,'Winston',3930),(43915,'Winter Garden',3930),(43916,'Winter Haven',3930),(43917,'Winter Park',3930),(43918,'Winter Springs',3930),(43919,'Wright',3930),(43920,'Yeehaw Junction',3930),(43921,'Acworth',3931),(43922,'Adel',3931),(43923,'Albany',3931),(43924,'Alma',3931),(43925,'Alpharetta',3931),(43926,'Americus',3931),(43927,'Athens',3931),(43928,'Athens-Clarke',3931),(43929,'Atlanta',3931),(43930,'Auburn',3931),(43931,'Augusta-Richmond',3931),(43932,'Austell',3931),(43933,'Bainbridge',3931),(43934,'Barnesville',3931),(43935,'Belvedere Park',3931),(43936,'Bogart',3931),(43937,'Bowdon',3931),(43938,'Braselton',3931),(43939,'Brunswick',3931),(43940,'Buford',3931),(43941,'Byron',3931),(43942,'Cairo',3931),(43943,'Calhoun',3931),(43944,'Candler-MacAfee',3931),(43945,'Canton',3931),(43946,'Carrollton',3931),(43947,'Cartersville',3931),(43948,'Chamblee',3931),(43949,'Clarkston',3931),(43950,'Cochran',3931),(43951,'College Park',3931),(43952,'Columbus',3931),(43953,'Comer',3931),(43954,'Conley',3931),(43955,'Conyers',3931),(43956,'Cordele',3931),(43957,'Covington',3931),(43958,'Culloden',3931),(43959,'Cumming',3931),(43960,'Dacula',3931),(43961,'Dahlonega',3931),(43962,'Dallas',3931),(43963,'Dalton',3931),(43964,'Decatur',3931),(43965,'Dewy Rose',3931),(43966,'Doraville',3931),(43967,'Douglas',3931),(43968,'Douglasville',3931),(43969,'Druid Hills',3931),(43970,'Dublin',3931),(43971,'Duluth',3931),(43972,'Dunwoody',3931),(43973,'East Point',3931),(43974,'Elberton',3931),(43975,'Ellenwood',3931),(43976,'Ellijay',3931),(43977,'Evans',3931),(43978,'Fairmount',3931),(43979,'Fayetteville',3931),(43980,'Flowery Branch',3931),(43981,'Folkston',3931),(43982,'Forest Park',3931),(43983,'Fort Benning South',3931),(43984,'Fort Gordon',3931),(43985,'Fort Stewart',3931),(43986,'Fort Valley',3931),(43987,'Foxborough',3931),(43988,'Gaines School',3931),(43989,'Gainesville',3931),(43990,'Glennville',3931),(43991,'Gresham Park',3931),(43992,'Griffin',3931),(43993,'Grovetown',3931),(43994,'Hampton',3931),(43995,'Hartwell',3931),(43996,'Hinesville',3931),(43997,'Jackson',3931),(43998,'Jonesboro',3931),(43999,'Kennesaw',3931),(44000,'Kingsland',3931),(44001,'LaGrange',3931),(44002,'Lawrenceville',3931),(44003,'Lilburn',3931),(44004,'Lithia Springs',3931),(44005,'Lithonia',3931),(44006,'Locust Grove',3931),(44007,'Loganville',3931),(44008,'Louisville',3931),(44009,'Mableton',3931),(44010,'Macon',3931),(44011,'Madison',3931),(44012,'Marietta',3931),(44013,'Martinez',3931),(44014,'McDonough',3931),(44015,'Milledgeville',3931),(44016,'Monroe',3931),(44017,'Morrow',3931),(44018,'Moultrie',3931),(44019,'Mountain',3931),(44020,'Mountain Park',3931),(44021,'Newnan',3931),(44022,'Norcross',3931),(44023,'North Atlanta',3931),(44024,'North Decatur',3931),(44025,'North Druid Hills',3931),(44026,'Oakwood',3931),(44027,'Panthersville',3931),(44028,'Peachtree City',3931),(44029,'Powder Springs',3931),(44030,'Redan',3931),(44031,'Rex',3931),(44032,'Riverdale',3931),(44033,'Rome',3931),(44034,'Rossville',3931),(44035,'Roswell',3931),(44036,'Saint Marys',3931),(44037,'Saint Simons',3931),(44038,'Sandy Springs',3931),(44039,'Savannah',3931),(44040,'Scottdale',3931),(44041,'Sharpsburg',3931),(44042,'Smyrna',3931),(44043,'Snellville',3931),(44044,'Sparks',3931),(44045,'Statesboro',3931),(44046,'Stockbridge',3931),(44047,'Stone Mountain',3931),(44048,'Suwanee',3931),(44049,'Thomasville',3931),(44050,'Tifton',3931),(44051,'Tucker',3931),(44052,'Tybee Island',3931),(44053,'Union City',3931),(44054,'Valdosta',3931),(44055,'Vidalia',3931),(44056,'Villa Rica',3931),(44057,'Warner Robins',3931),(44058,'Waycross',3931),(44059,'Wilmington Island',3931),(44060,'Winder',3931),(44061,'Woodbine',3931),(44062,'Woodstock',3931),(44063,'Ahuimanu',3932),(44064,'Aiea',3932),(44065,'Aliamanu',3932),(44066,'Ewa Beach',3932),(44067,'Haiku',3932),(44068,'Halawa',3932),(44069,'Hanalei',3932),(44070,'Hilo',3932),(44071,'Holualoa',3932),(44072,'Honolulu',3932),(44073,'Kahului',3932),(44074,'Kailua',3932),(44075,'Kalaheo',3932),(44076,'Kamuela',3932),(44077,'Kaneohe',3932),(44078,'Kaneohe Station',3932),(44079,'Kapaa',3932),(44080,'Kapolei',3932),(44081,'Kihei',3932),(44082,'Kula',3932),(44083,'Lahaina',3932),(44084,'Lanai City',3932),(44085,'Lihue',3932),(44086,'Makaha',3932),(44087,'Makakilo City',3932),(44088,'Makawao',3932),(44089,'Mi-Wuk Village',3932),(44090,'Mililani Town',3932),(44091,'Naalehu',3932),(44092,'Nanakuli',3932),(44093,'Pahoa',3932),(44094,'Pearl City',3932),(44095,'Schofield Barracks',3932),(44096,'Wahiawa',3932),(44097,'Waialua',3932),(44098,'Waianae',3932),(44099,'Wailuku',3932),(44100,'Waimalu',3932),(44101,'Waipahu',3932),(44102,'Waipio',3932),(44103,'Blackfoot',3933),(44104,'Boise',3933),(44105,'Boise City',3933),(44106,'Boulder Hill',3933),(44107,'Burley',3933),(44108,'Caldwell',3933),(44109,'Coeur d\'Alene',3933),(44110,'Eagle',3933),(44111,'Garden City',3933),(44112,'Idaho Falls',3933),(44113,'Lewiston',3933),(44114,'Meridian',3933),(44115,'Moscow',3933),(44116,'Mountain Home',3933),(44117,'Nampa',3933),(44118,'Payette',3933),(44119,'Pocatello',3933),(44120,'Post Falls',3933),(44121,'Preston',3933),(44122,'Rexburg',3933),(44123,'Rigby',3933),(44124,'Sandpoint',3933),(44125,'Troy',3933),(44126,'Twin Falls',3933),(44127,'Addison',3934),(44128,'Algonquin',3934),(44129,'Alsip',3934),(44130,'Alton',3934),(44131,'Arlington Heights',3934),(44132,'Aurora',3934),(44133,'Bannockburn',3934),(44134,'Barrington',3934),(44135,'Bartlett',3934),(44136,'Batavia',3934),(44137,'Beach Park',3934),(44138,'Beardstown',3934),(44139,'Bedford Park',3934),(44140,'Belleville',3934),(44141,'Bellwood',3934),(44142,'Belvidere',3934),(44143,'Bensenville',3934),(44144,'Berwyn',3934),(44145,'Bloomingdale',3934),(44146,'Bloomington',3934),(44147,'Blue Island',3934),(44148,'Boling Brook',3934),(44149,'Bolingbrook',3934),(44150,'Bourbonnais',3934),(44151,'Bradley',3934),(44152,'Breese',3934),(44153,'Bridgeview',3934),(44154,'Brimfield',3934),(44155,'Broadview',3934),(44156,'Brookfield',3934),(44157,'Buffalo Grove',3934),(44158,'Burbank',3934),(44159,'Burr Ridge',3934),(44160,'Cahokia',3934),(44161,'Calumet City',3934),(44162,'Canton',3934),(44163,'Carbondale',3934),(44164,'Carlinville',3934),(44165,'Carol Stream',3934),(44166,'Carpentersville',3934),(44167,'Carthage',3934),(44168,'Cary',3934),(44169,'Centralia',3934),(44170,'Champaign',3934),(44171,'Channahon',3934),(44172,'Charleston',3934),(44173,'Chicago',3934),(44174,'Chicago Heights',3934),(44175,'Chicago Ridge',3934),(44176,'Cicero',3934),(44177,'Coal City',3934),(44178,'Collinsville',3934),(44179,'Congerville',3934),(44180,'Country Club Hills',3934),(44181,'Crest Hill',3934),(44182,'Crestwood',3934),(44183,'Crystal Lake',3934),(44184,'Danville',3934),(44185,'Darien',3934),(44186,'DeKalb',3934),(44187,'Decatur',3934),(44188,'Deerfield',3934),(44189,'Des Plaines',3934),(44190,'Dixon',3934),(44191,'Dolton',3934),(44192,'Downers Grove',3934),(44193,'Earlville',3934),(44194,'East Dundee',3934),(44195,'East Moline',3934),(44196,'East Peoria',3934),(44197,'East Saint Louis',3934),(44198,'Edwardsville',3934),(44199,'Effingham',3934),(44200,'Elburn',3934),(44201,'Elgin',3934),(44202,'Elk Grove',3934),(44203,'Elk Grove Village',3934),(44204,'Elmhurst',3934),(44205,'Elmwood Park',3934),(44206,'Evanston',3934),(44207,'Evergreen Park',3934),(44208,'Fairview Heights',3934),(44209,'Flossmoor',3934),(44210,'Forest Park',3934),(44211,'Frankfort',3934),(44212,'Franklin Park',3934),(44213,'Freeport',3934),(44214,'Galena',3934),(44215,'Galesburg',3934),(44216,'Geneva',3934),(44217,'Genoa',3934),(44218,'Glen Carbon',3934),(44219,'Glen Ellyn',3934),(44220,'Glencoe',3934),(44221,'Glendale Heights',3934),(44222,'Glenview',3934),(44223,'Godfrey',3934),(44224,'Goodings Grove',3934),(44225,'Granite City',3934),(44226,'Grayslake',3934),(44227,'Gurnee',3934),(44228,'Hamilton',3934),(44229,'Hampshire',3934),(44230,'Hanover Park',3934),(44231,'Harvard',3934),(44232,'Harvey',3934),(44233,'Hawthorn Woods',3934),(44234,'Hazel Crest',3934),(44235,'Herrin',3934),(44236,'Hickory Hills',3934),(44237,'Highland Park',3934),(44238,'Hinsdale',3934),(44239,'Hoffman Estates',3934),(44240,'Homewood',3934),(44241,'Huntley',3934),(44242,'Illinois City',3934),(44243,'Ingleside',3934),(44244,'Itasca',3934),(44245,'Jacksonville',3934),(44246,'Johnston City',3934),(44247,'Joliet',3934),(44248,'Justice',3934),(44249,'Kankakee',3934),(44250,'Kenilworth',3934),(44251,'Kewanee',3934),(44252,'La Grange',3934),(44253,'La Grange Park',3934),(44254,'La Salle',3934),(44255,'Lake Bluff',3934),(44256,'Lake Forest',3934),(44257,'Lake Zurich',3934),(44258,'Lake in the Hills',3934),(44259,'Lansing',3934),(44260,'Lemont',3934),(44261,'Libertyville',3934),(44262,'Lincoln',3934),(44263,'Lincolnwood',3934),(44264,'Lindenhurst',3934),(44265,'Lindenwood',3934),(44266,'Lisle',3934),(44267,'Lockport',3934),(44268,'Lombard',3934),(44269,'Long Grove',3934),(44270,'Loves Park',3934),(44271,'Lyons',3934),(44272,'MacHenry',3934),(44273,'Machesney Park',3934),(44274,'Macomb',3934),(44275,'Marion',3934),(44276,'Markham',3934),(44277,'Marshall',3934),(44278,'Martinsville',3934),(44279,'Maryville',3934),(44280,'Matteson',3934),(44281,'Mattoon',3934),(44282,'Maywood',3934),(44283,'McHenry',3934),(44284,'Melrose Park',3934),(44285,'Midlothian',3934),(44286,'Milan',3934),(44287,'Minooka',3934),(44288,'Mokena',3934),(44289,'Moline',3934),(44290,'Momence',3934),(44291,'Montgomery',3934),(44292,'Monticello',3934),(44293,'Morris',3934),(44294,'Morton',3934),(44295,'Morton Grove',3934),(44296,'Mossville',3934),(44297,'Mount Prospect',3934),(44298,'Mount Vernon',3934),(44299,'Mount Zion',3934),(44300,'Mundelein',3934),(44301,'Naperville',3934),(44302,'New Lenox',3934),(44303,'Niles',3934),(44304,'Normal',3934),(44305,'Norridge',3934),(44306,'North Aurora',3934),(44307,'North Chicago',3934),(44308,'Northbrook',3934),(44309,'Northfield',3934),(44310,'Northlake',3934),(44311,'O\'Fallon',3934),(44312,'Oak Forest',3934),(44313,'Oak Lawn',3934),(44314,'Oak Park',3934),(44315,'Oakbrook',3934),(44316,'Oakwood',3934),(44317,'Olney',3934),(44318,'Orland Park',3934),(44319,'Osco',3934),(44320,'Ottawa',3934),(44321,'Palatine',3934),(44322,'Palos Heights',3934),(44323,'Palos Hills',3934),(44324,'Park Forest',3934),(44325,'Park Ridge',3934),(44326,'Pekin',3934),(44327,'Peoria',3934),(44328,'Peru',3934),(44329,'Plainfield',3934),(44330,'Pontiac',3934),(44331,'Princeton',3934),(44332,'Prospect Heights',3934),(44333,'Quincy',3934),(44334,'Ramsey',3934),(44335,'Rantoul',3934),(44336,'Richmond',3934),(44337,'Richton Park',3934),(44338,'River Forest',3934),(44339,'Riverdale',3934),(44340,'Rochelle',3934),(44341,'Rock Island',3934),(44342,'Rockford',3934),(44343,'Rolling Meadows',3934),(44344,'Romeoville',3934),(44345,'Roscoe',3934),(44346,'Roselle',3934),(44347,'Round Lake Beach',3934),(44348,'Saint Charles',3934),(44349,'Sauget',3934),(44350,'Sauk Village',3934),(44351,'Schaumburg',3934),(44352,'Schiller Park',3934),(44353,'Shumway',3934),(44354,'Skokie',3934),(44355,'South Elgin',3934),(44356,'South Holland',3934),(44357,'Spring Valley',3934),(44358,'Springfield',3934),(44359,'Sterling',3934),(44360,'Streamwood',3934),(44361,'Streator',3934),(44362,'Swansea',3934),(44363,'Sycamore',3934),(44364,'Taylorville',3934),(44365,'Tinley Park',3934),(44366,'Trenton',3934),(44367,'Urbana',3934),(44368,'Ursa',3934),(44369,'Vernon Hills',3934),(44370,'Villa Park',3934),(44371,'Walnut',3934),(44372,'Warrenville',3934),(44373,'Washington',3934),(44374,'Waukegan',3934),(44375,'West Chicago',3934),(44376,'West Dundee',3934),(44377,'Westchester',3934),(44378,'Western Springs',3934),(44379,'Westmont',3934),(44380,'Wheaton',3934),(44381,'Wheeling',3934),(44382,'Willowbrook',3934),(44383,'Wilmette',3934),(44384,'Winnebago',3934),(44385,'Winnetka',3934),(44386,'Wood Dale',3934),(44387,'Wood River',3934),(44388,'Woodridge',3934),(44389,'Woodstock',3934),(44390,'Worth',3934),(44391,'Zion',3934),(44392,'Albion',3935),(44393,'Anderson',3935),(44394,'Angola',3935),(44395,'Auburn',3935),(44396,'Bedford',3935),(44397,'Beech Grove',3935),(44398,'Bloomington',3935),(44399,'Brownsburg',3935),(44400,'Carmel',3935),(44401,'Cedar Lake',3935),(44402,'Chesterton',3935),(44403,'Clarksville',3935),(44404,'Columbus',3935),(44405,'Connersville',3935),(44406,'Crawfordsville',3935),(44407,'Crown Point',3935),(44408,'Dyer',3935),(44409,'East Chicago',3935),(44410,'Elkhart',3935),(44411,'Evansville',3935),(44412,'Fishers',3935),(44413,'Fort Wayne',3935),(44414,'Frankfort',3935),(44415,'Franklin',3935),(44416,'Gary',3935),(44417,'Goshen',3935),(44418,'Gosport',3935),(44419,'Granger',3935),(44420,'Greenfield',3935),(44421,'Greensburg',3935),(44422,'Greenwood',3935),(44423,'Griffith',3935),(44424,'Hammond',3935),(44425,'Helmsburg',3935),(44426,'Highland',3935),(44427,'Hobart',3935),(44428,'Huntington',3935),(44429,'Indianapolis',3935),(44430,'Jasper',3935),(44431,'Jeffersonville',3935),(44432,'Knightstown',3935),(44433,'Kokomo',3935),(44434,'La Porte',3935),(44435,'Lafayette',3935),(44436,'Lake Station',3935),(44437,'Lawrence',3935),(44438,'Lebanon',3935),(44439,'Liberty',3935),(44440,'Logansport',3935),(44441,'Madison',3935),(44442,'Marion',3935),(44443,'Martinsville',3935),(44444,'Merrillville',3935),(44445,'Michigan City',3935),(44446,'Mishawaka',3935),(44447,'Muncie',3935),(44448,'Munster',3935),(44449,'N. Albany',3935),(44450,'Nashville',3935),(44451,'New Albany',3935),(44452,'New Castle',3935),(44453,'New Haven',3935),(44454,'New Trenton',3935),(44455,'Noblesville',3935),(44456,'North Vernon',3935),(44457,'Osceola',3935),(44458,'Peru',3935),(44459,'Plainfield',3935),(44460,'Plymouth',3935),(44461,'Poland',3935),(44462,'Portage',3935),(44463,'Richmond',3935),(44464,'Rising Sun',3935),(44465,'Roanoke',3935),(44466,'Rockport',3935),(44467,'Schererville',3935),(44468,'Scottsburg',3935),(44469,'Seymour',3935),(44470,'Shelbyville',3935),(44471,'South Bend',3935),(44472,'Speedway',3935),(44473,'St. John',3935),(44474,'Terre Haute',3935),(44475,'Thorntown',3935),(44476,'Tippecanoe',3935),(44477,'Troy',3935),(44478,'Valparaiso',3935),(44479,'Vermont',3935),(44480,'Vincennes',3935),(44481,'Wabash',3935),(44482,'Warsaw',3935),(44483,'Washington',3935),(44484,'West Lafayette',3935),(44485,'Williams',3935),(44486,'Altoona',3936),(44487,'Ames',3936),(44488,'Ankeny',3936),(44489,'Bettendorf',3936),(44490,'Boone',3936),(44491,'Burlington',3936),(44492,'Carroll',3936),(44493,'Cedar Falls',3936),(44494,'Cedar Rapids',3936),(44495,'Clarinda',3936),(44496,'Clinton',3936),(44497,'Clive',3936),(44498,'Coralville',3936),(44499,'Council Bluffs',3936),(44500,'Davenport',3936),(44501,'Des Moines',3936),(44502,'Dubuque',3936),(44503,'Eldridge',3936),(44504,'Elkader',3936),(44505,'Essex',3936),(44506,'Fairfield',3936),(44507,'Fayette',3936),(44508,'Fort Dodge',3936),(44509,'Fort Madison',3936),(44510,'Harlan',3936),(44511,'Indianola',3936),(44512,'Iowa City',3936),(44513,'Kalona',3936),(44514,'Keokuk',3936),(44515,'Marion',3936),(44516,'Marshalltown',3936),(44517,'Mason City',3936),(44518,'Muscatine',3936),(44519,'Newton',3936),(44520,'Orange City',3936),(44521,'Oskaloosa',3936),(44522,'Ottumwa',3936),(44523,'Pella',3936),(44524,'Sioux City',3936),(44525,'Spencer',3936),(44526,'Storm Lake',3936),(44527,'Urbandale',3936),(44528,'Waterloo',3936),(44529,'West Des Moines',3936),(44530,'Arkansas City',3937),(44531,'Atchison',3937),(44532,'Coffeyville',3937),(44533,'Derby',3937),(44534,'Dodge City',3937),(44535,'El Dorado',3937),(44536,'Elk City',3937),(44537,'Emporia',3937),(44538,'Fort Riley North',3937),(44539,'Garden City',3937),(44540,'Great Bend',3937),(44541,'Hays',3937),(44542,'Hutchinson',3937),(44543,'Independence',3937),(44544,'Junction City',3937),(44545,'Kansas City',3937),(44546,'Kingman',3937),(44547,'Lawrence',3937),(44548,'Leavenworth',3937),(44549,'Leawood',3937),(44550,'Lenexa',3937),(44551,'Liberal',3937),(44552,'MacPherson',3937),(44553,'Manhattan',3937),(44554,'Merriam',3937),(44555,'Minneapolis',3937),(44556,'Moscow',3937),(44557,'Moundridge',3937),(44558,'Nashville',3937),(44559,'Newton',3937),(44560,'Olathe',3937),(44561,'Ottawa',3937),(44562,'Overland Park',3937),(44563,'Parsons',3937),(44564,'Pittsburg',3937),(44565,'Prairie Village',3937),(44566,'Rose Hill',3937),(44567,'Salina',3937),(44568,'Shawnee',3937),(44569,'Topeka',3937),(44570,'Wichita',3937),(44571,'Winfield',3937),(44572,'tecumseh',3937),(44573,'Albany',3938),(44574,'Ashland',3938),(44575,'Bardstown',3938),(44576,'Berea',3938),(44577,'Bowling Green',3938),(44578,'Campbellsville',3938),(44579,'Catlettsburg',3938),(44580,'Covington',3938),(44581,'Crescent Springs',3938),(44582,'Danville',3938),(44583,'Dawson Springs',3938),(44584,'Eastview',3938),(44585,'Eddyville',3938),(44586,'Elizabethtown',3938),(44587,'Erlanger',3938),(44588,'Evarts',3938),(44589,'Fern Creek',3938),(44590,'Florence',3938),(44591,'Fort Campbell North',3938),(44592,'Fort Knox',3938),(44593,'Fort Mitchell',3938),(44594,'Fort Thomas',3938),(44595,'Frankfort',3938),(44596,'Georgetown',3938),(44597,'Glasgow',3938),(44598,'Grays Knob',3938),(44599,'Henderson',3938),(44600,'Highview',3938),(44601,'Hopkinsville',3938),(44602,'Independence',3938),(44603,'Jeffersontown',3938),(44604,'Lawrenceburg',3938),(44605,'Lebanon',3938),(44606,'Lexington',3938),(44607,'Lexington-Fayette',3938),(44608,'Louisville',3938),(44609,'Madisonville',3938),(44610,'Marion',3938),(44611,'Mayfield',3938),(44612,'Maysville',3938),(44613,'Middlesborough',3938),(44614,'Murray',3938),(44615,'Nebo',3938),(44616,'Newburg',3938),(44617,'Newport',3938),(44618,'Nicholasville',3938),(44619,'Okolona',3938),(44620,'Olive Hill',3938),(44621,'Owensboro',3938),(44622,'Paducah',3938),(44623,'Paris',3938),(44624,'Pikeville',3938),(44625,'Pleasure Ridge Park',3938),(44626,'Queens',3938),(44627,'Radcliff',3938),(44628,'Richmond',3938),(44629,'Saint Dennis',3938),(44630,'Saint Matthews',3938),(44631,'Scottsville',3938),(44632,'Shively',3938),(44633,'Somerset',3938),(44634,'South Shore',3938),(44635,'Tollesboro',3938),(44636,'Valley Station',3938),(44637,'Wallins Creek',3938),(44638,'Walton',3938),(44639,'Winchester',3938),(44640,'Abbeville',3939),(44641,'Alexandria',3939),(44642,'Amite',3939),(44643,'Baker',3939),(44644,'Bastrop',3939),(44645,'Baton Rouge',3939),(44646,'Bayou Cane',3939),(44647,'Bogalusa',3939),(44648,'Bossier City',3939),(44649,'Broussard',3939),(44650,'Calhoun',3939),(44651,'Chalmette',3939),(44652,'Covington',3939),(44653,'Crowley',3939),(44654,'De Ridder',3939),(44655,'Delcambre',3939),(44656,'Denham Springs',3939),(44657,'Estelle',3939),(44658,'Eunice',3939),(44659,'Fort Polk South',3939),(44660,'Franklin',3939),(44661,'French Settlement',3939),(44662,'Garyville',3939),(44663,'Geismar',3939),(44664,'Gretna',3939),(44665,'Hammond',3939),(44666,'Harahan',3939),(44667,'Harvey',3939),(44668,'Houma',3939),(44669,'Independence',3939),(44670,'Jefferson',3939),(44671,'Jennings',3939),(44672,'Kenner',3939),(44673,'Lafayette',3939),(44674,'Lake Charles',3939),(44675,'Laplace',3939),(44676,'Mandeville',3939),(44677,'Marrero',3939),(44678,'Merrydale',3939),(44679,'Metairie',3939),(44680,'Minden',3939),(44681,'Monroe',3939),(44682,'Morgan City',3939),(44683,'Natchitoches',3939),(44684,'New Iberia',3939),(44685,'New Orleans',3939),(44686,'Opelousas',3939),(44687,'Pineville',3939),(44688,'Pioneer',3939),(44689,'Prairieville',3939),(44690,'River Ridge',3939),(44691,'Ruston',3939),(44692,'Saint Amant',3939),(44693,'Saint Martinville',3939),(44694,'Shenandoah',3939),(44695,'Shreveport',3939),(44696,'Slidell',3939),(44697,'Sulphur',3939),(44698,'Terrytown',3939),(44699,'Thibodaux',3939),(44700,'Timberlane',3939),(44701,'Vinton',3939),(44702,'Waggaman',3939),(44703,'West Monroe',3939),(44704,'Westwego',3939),(44705,'Zachary',3939),(44706,'Manchester',3940),(44707,'Washington',3940),(44708,'Auburn',3941),(44709,'Augusta',3941),(44710,'Bangor',3941),(44711,'Bath',3941),(44712,'Biddeford',3941),(44713,'Brunswick',3941),(44714,'Cornish',3941),(44715,'Dover-Foxcroft',3941),(44716,'Ellsworth',3941),(44717,'Etna',3941),(44718,'Freeport',3941),(44719,'Gorham',3941),(44720,'Greene',3941),(44721,'Harmony',3941),(44722,'Lewiston',3941),(44723,'Liberty',3941),(44724,'Limerick',3941),(44725,'Lyman',3941),(44726,'Maine',3941),(44727,'New Gloucester',3941),(44728,'Norridgewock',3941),(44729,'North Yarmouth',3941),(44730,'Old Town',3941),(44731,'Orono',3941),(44732,'Portland',3941),(44733,'Presque Isle',3941),(44734,'Saco',3941),(44735,'Sanford',3941),(44736,'Scarborough',3941),(44737,'South Portland',3941),(44738,'Spruce Head',3941),(44739,'Thomaston',3941),(44740,'Waldoboro',3941),(44741,'Waterville',3941),(44742,'West Buxton',3941),(44743,'Westbrook',3941),(44744,'Whitefield',3941),(44745,'Windham',3941),(44746,'Yarmouth',3941),(44747,'York Harbor',3941),(44748,'stockton springs',3941),(44749,'Aberdeen',3942),(44750,'Accokeek',3942),(44751,'Adelphi',3942),(44752,'Andrews Air Force Base',3942),(44753,'Annapolis',3942),(44754,'Arbutus',3942),(44755,'Arnold',3942),(44756,'Aspen Hill',3942),(44757,'Baltimore',3942),(44758,'Bel Air North',3942),(44759,'Bel Air South',3942),(44760,'Beltsville',3942),(44761,'Berlin',3942),(44762,'Bethesda',3942),(44763,'Bladensburg',3942),(44764,'Boonsboro',3942),(44765,'Bowie',3942),(44766,'Brookeville',3942),(44767,'Brooklandville',3942),(44768,'Brooklyn Park',3942),(44769,'Burtonsville',3942),(44770,'Calverton',3942),(44771,'Cambridge',3942),(44772,'Camp Springs',3942),(44773,'Capitol Heights',3942),(44774,'Carney',3942),(44775,'Catonsville',3942),(44776,'Chestertown',3942),(44777,'Chillum',3942),(44778,'Clarksburg',3942),(44779,'Clarksville',3942),(44780,'Clinton',3942),(44781,'Cockeysville',3942),(44782,'Colesville',3942),(44783,'College Park',3942),(44784,'Columbia',3942),(44785,'Cooksville',3942),(44786,'Coral Hills',3942),(44787,'Crofton',3942),(44788,'Cumberland',3942),(44789,'Damascus',3942),(44790,'Darlington',3942),(44791,'District Heights',3942),(44792,'Dundalk',3942),(44793,'East Riverdale',3942),(44794,'Easton',3942),(44795,'Edgemere',3942),(44796,'Edgewood',3942),(44797,'Eldersburg',3942),(44798,'Elkridge',3942),(44799,'Elkton',3942),(44800,'Ellicott City',3942),(44801,'Essex',3942),(44802,'Fairland',3942),(44803,'Ferndale',3942),(44804,'Forest Hill',3942),(44805,'Forestville',3942),(44806,'Fort Meade',3942),(44807,'Fort Washington',3942),(44808,'Frederick',3942),(44809,'Fredrick',3942),(44810,'Friendly',3942),(44811,'Gaithersburg',3942),(44812,'Germantown',3942),(44813,'Glen Burnie',3942),(44814,'Glenn Dale',3942),(44815,'Greater Landover',3942),(44816,'Greater Upper Marlboro',3942),(44817,'Green Haven',3942),(44818,'Green Valley',3942),(44819,'Greenbelt',3942),(44820,'Hagerstown',3942),(44821,'Hanover',3942),(44822,'Harmans',3942),(44823,'Havre de Grace',3942),(44824,'Hillandale',3942),(44825,'Hillcrest Heights',3942),(44826,'Hunt Valley',3942),(44827,'Hurlock',3942),(44828,'Hyattsville',3942),(44829,'Ijamsville',3942),(44830,'Jefferson',3942),(44831,'Jessup',3942),(44832,'Joppatowne',3942),(44833,'Kettering',3942),(44834,'Lake Shore',3942),(44835,'Langley Park',3942),(44836,'Lanham',3942),(44837,'Lanham-Seabrook',3942),(44838,'Lansdowne-Baltimore Highlands',3942),(44839,'Largo',3942),(44840,'Laurel',3942),(44841,'Lexington Park',3942),(44842,'Lochearn',3942),(44843,'Lutherville-Timonium',3942),(44844,'Marriottsville',3942),(44845,'Maryland City',3942),(44846,'Mays Chapel',3942),(44847,'Middle River',3942),(44848,'Milford Mill',3942),(44849,'Millersville',3942),(44850,'Mitchellville',3942),(44851,'Montgomery Village',3942),(44852,'National Harbor',3942),(44853,'New Carrollton',3942),(44854,'North Bethesda',3942),(44855,'North Laurel',3942),(44856,'North Potomac',3942),(44857,'Odenton',3942),(44858,'Olney',3942),(44859,'Overlea',3942),(44860,'Owings Mills',3942),(44861,'Oxon Hill-Glassmanor',3942),(44862,'Parkville',3942),(44863,'Parole',3942),(44864,'Pasadena',3942),(44865,'Perry Hall',3942),(44866,'Pikesville',3942),(44867,'Poolesville',3942),(44868,'Potomac',3942),(44869,'Randallstown',3942),(44870,'Redland',3942),(44871,'Reisterstown',3942),(44872,'Riviera Beach',3942),(44873,'Rockville',3942),(44874,'Rosaryville',3942),(44875,'Rosedale',3942),(44876,'Rossville',3942),(44877,'Saint Charles',3942),(44878,'Salisbury',3942),(44879,'Sandy Spring',3942),(44880,'Savage Guilford',3942),(44881,'Severn',3942),(44882,'Severna Park',3942),(44883,'Silver Spring',3942),(44884,'Snow Hill',3942),(44885,'South Gate',3942),(44886,'South Laurel',3942),(44887,'Suitland-Silver Hill',3942),(44888,'Takoma Park',3942),(44889,'Temple Hill',3942),(44890,'Thurmont',3942),(44891,'Timonium',3942),(44892,'Towson',3942),(44893,'Upper Marlboro',3942),(44894,'Waldorf',3942),(44895,'Walker Mill',3942),(44896,'Washington Grove',3942),(44897,'Westminster',3942),(44898,'Wheaton-Glenmont',3942),(44899,'White Oak',3942),(44900,'Windsor Mill',3942),(44901,'Woodlawn',3942),(44902,'Abington',3943),(44903,'Acton',3943),(44904,'Agawam',3943),(44905,'Amesbury',3943),(44906,'Amherst Center',3943),(44907,'Arlington',3943),(44908,'Ashland',3943),(44909,'Athol',3943),(44910,'Attleboro',3943),(44911,'Barnstable Town',3943),(44912,'Baxboro',3943),(44913,'Becket',3943),(44914,'Bedford',3943),(44915,'Belmont',3943),(44916,'Beverly',3943),(44917,'Billerica',3943),(44918,'Boston',3943),(44919,'Boylston',3943),(44920,'Braintree',3943),(44921,'Brockton',3943),(44922,'Brookfield',3943),(44923,'Brookline',3943),(44924,'Burlington',3943),(44925,'Cambridge',3943),(44926,'Canton',3943),(44927,'Charlestown',3943),(44928,'Chelmsford',3943),(44929,'Chelsea',3943),(44930,'Chicopee',3943),(44931,'Clinton',3943),(44932,'Concord',3943),(44933,'Danvers',3943),(44934,'Dedham',3943),(44935,'Devens',3943),(44936,'Devenscrest',3943),(44937,'Duxbury',3943),(44938,'Easthampton',3943),(44939,'Everett',3943),(44940,'Fairhaven',3943),(44941,'Fall River',3943),(44942,'Fitchburg',3943),(44943,'Florence',3943),(44944,'Framingham',3943),(44945,'Franklin',3943),(44946,'Gardner',3943),(44947,'Gloucester',3943),(44948,'Great Barrington',3943),(44949,'Greenfield',3943),(44950,'Groton',3943),(44951,'Hadley',3943),(44952,'Harvard',3943),(44953,'Haverhill',3943),(44954,'Hingham',3943),(44955,'Holbrook',3943),(44956,'Holliston',3943),(44957,'Holyoke',3943),(44958,'Hopedale',3943),(44959,'Housatonic',3943),(44960,'Hubbardston',3943),(44961,'Hudson',3943),(44962,'Hull',3943),(44963,'Hyannis',3943),(44964,'Ipswich',3943),(44965,'Jamaica Plain',3943),(44966,'Lawrence',3943),(44967,'Lee',3943),(44968,'Lenox',3943),(44969,'Leominster',3943),(44970,'Lexington',3943),(44971,'Longmeadow',3943),(44972,'Lowell',3943),(44973,'Lynn',3943),(44974,'Lynnfield',3943),(44975,'Malden',3943),(44976,'Manchester',3943),(44977,'Marblehead',3943),(44978,'Marion',3943),(44979,'Marlborough',3943),(44980,'Marshfield',3943),(44981,'Massachusetts',3943),(44982,'Maynard',3943),(44983,'Medfield',3943),(44984,'Medford',3943),(44985,'Medway',3943),(44986,'Melrose',3943),(44987,'Methuen',3943),(44988,'Middleboro',3943),(44989,'Milford',3943),(44990,'Milton',3943),(44991,'Monson',3943),(44992,'Montague',3943),(44993,'Nantucket',3943),(44994,'Natick',3943),(44995,'Needham',3943),(44996,'New Bedford',3943),(44997,'Newburyport',3943),(44998,'Newton',3943),(44999,'North Adams',3943),(45000,'North Andover',3943),(45001,'North Attleborough Center',3943),(45002,'North Easton',3943),(45003,'Northampton',3943),(45004,'Northborough',3943),(45005,'Norwood',3943),(45006,'Orleans',3943),(45007,'Peabody',3943),(45008,'Pepperell',3943),(45009,'Pittsfield',3943),(45010,'Plainfield',3943),(45011,'Plymouth',3943),(45012,'Provincetown',3943),(45013,'Quincy',3943),(45014,'Randolph',3943),(45015,'Reading',3943),(45016,'Rehoboth',3943),(45017,'Revere',3943),(45018,'Rockland',3943),(45019,'Rockport',3943),(45020,'Roslindale',3943),(45021,'Salem',3943),(45022,'Saugus',3943),(45023,'Scituate',3943),(45024,'Seekonk',3943),(45025,'Shelburne Falls',3943),(45026,'Sherborn',3943),(45027,'Shrewsbury',3943),(45028,'Somerset',3943),(45029,'Somerville',3943),(45030,'South Boston',3943),(45031,'South Deerfield',3943),(45032,'South Hadley',3943),(45033,'South Lee',3943),(45034,'South Yarmouth',3943),(45035,'Southborough',3943),(45036,'Southbridge',3943),(45037,'Southwick',3943),(45038,'Springfield',3943),(45039,'Stoneham',3943),(45040,'Sturbridge',3943),(45041,'Swampscott',3943),(45042,'Swansea',3943),(45043,'Taunton',3943),(45044,'Tewksbury',3943),(45045,'Three Rivers',3943),(45046,'Truro',3943),(45047,'Upton',3943),(45048,'Vineyard Haven',3943),(45049,'Wakefield',3943),(45050,'Waltham',3943),(45051,'Ware',3943),(45052,'Wareham',3943),(45053,'Watertown',3943),(45054,'Wayland',3943),(45055,'Webster',3943),(45056,'Wellesley',3943),(45057,'Wellesley Hills',3943),(45058,'West Concord',3943),(45059,'West Roxbury',3943),(45060,'West Springfield',3943),(45061,'West Yarmouth',3943),(45062,'Westborough',3943),(45063,'Westfield',3943),(45064,'Westford',3943),(45065,'Weston',3943),(45066,'Weymouth',3943),(45067,'Wilbraham',3943),(45068,'Wilmington',3943),(45069,'Winchester',3943),(45070,'Winthrop',3943),(45071,'Woburn',3943),(45072,'Worcester',3943),(45073,'Yarmouthport',3943),(45074,'Adrian',3945),(45075,'Albion',3945),(45076,'Allegan',3945),(45077,'Allen Park',3945),(45078,'Alma',3945),(45079,'Alpena',3945),(45080,'Ann Arbor',3945),(45081,'Attica',3945),(45082,'Auburn Hills',3945),(45083,'Battle Creek',3945),(45084,'Bay City',3945),(45085,'Beecher',3945),(45086,'Belleville',3945),(45087,'Benton Harbor',3945),(45088,'Berkley',3945),(45089,'Beverly Hills',3945),(45090,'Big Rapids',3945),(45091,'Birmingham',3945),(45092,'Bloomfield Hills',3945),(45093,'Bloomfield Township',3945),(45094,'Boyne City',3945),(45095,'Brighton',3945),(45096,'Burt',3945),(45097,'Burton',3945),(45098,'Cadillac',3945),(45099,'Canton',3945),(45100,'Charlotte',3945),(45101,'Chesterfield',3945),(45102,'Clarkston',3945),(45103,'Clawson',3945),(45104,'Clinton',3945),(45105,'Commerce',3945),(45106,'Comstock Park',3945),(45107,'Coopersville',3945),(45108,'Cornell',3945),(45109,'Cutlerville',3945),(45110,'Davisburg',3945),(45111,'Dearborn',3945),(45112,'Dearborn Heights',3945),(45113,'Delton',3945),(45114,'Detroit',3945),(45115,'Dexter',3945),(45116,'Dowagiac',3945),(45117,'East Grand Rapids',3945),(45118,'East Lansing',3945),(45119,'Eastpointe',3945),(45120,'Ecorse',3945),(45121,'Escanaba',3945),(45122,'Evart',3945),(45123,'Fair Haven',3945),(45124,'Fairgrove',3945),(45125,'Farmington',3945),(45126,'Farmington Hills',3945),(45127,'Fenton',3945),(45128,'Ferndale',3945),(45129,'Flint',3945),(45130,'Forest Hills',3945),(45131,'Fowlerville',3945),(45132,'Frankenmuth',3945),(45133,'Fraser',3945),(45134,'Fremont',3945),(45135,'Fruitport',3945),(45136,'Garden City',3945),(45137,'Goodrich',3945),(45138,'Grand Blanc',3945),(45139,'Grand Haven',3945),(45140,'Grand Rapids',3945),(45141,'Grandville',3945),(45142,'Grosse Ile',3945),(45143,'Grosse Pointe Farms',3945),(45144,'Grosse Pointe Park',3945),(45145,'Grosse Pointe Woods',3945),(45146,'Gwinn',3945),(45147,'Hamtramck',3945),(45148,'Hancock',3945),(45149,'Harper Woods',3945),(45150,'Harrison',3945),(45151,'Haslett',3945),(45152,'Hazel Park',3945),(45153,'Highland Park',3945),(45154,'Holland',3945),(45155,'Holly',3945),(45156,'Holt',3945),(45157,'Houghton',3945),(45158,'Hudsonville',3945),(45159,'Huntington Woods',3945),(45160,'Imlay',3945),(45161,'Inkster',3945),(45162,'Jackon',3945),(45163,'Jackson',3945),(45164,'Jenison',3945),(45165,'Kalamazoo',3945),(45166,'Kalkaska',3945),(45167,'Kentwood',3945),(45168,'Kingsford',3945),(45169,'Lansing',3945),(45170,'Lapeer',3945),(45171,'Lincoln Park',3945),(45172,'Litchfield',3945),(45173,'Livonia',3945),(45174,'Ludington',3945),(45175,'Macomb',3945),(45176,'Madison Heights',3945),(45177,'Manistee',3945),(45178,'Marquette',3945),(45179,'Marysville',3945),(45180,'Melvindale',3945),(45181,'Midland',3945),(45182,'Monroe',3945),(45183,'Mount Clemens',3945),(45184,'Mount Morris',3945),(45185,'Mount Pleasant',3945),(45186,'Mt. Pleasant',3945),(45187,'Muskegon',3945),(45188,'Muskegon Heights',3945),(45189,'New Hudson',3945),(45190,'Newaygo',3945),(45191,'Niles',3945),(45192,'Northview',3945),(45193,'Northville',3945),(45194,'Norton Shores',3945),(45195,'Novi',3945),(45196,'Oak Park',3945),(45197,'Okemos',3945),(45198,'Oscoda',3945),(45199,'Owosso',3945),(45200,'Oxford',3945),(45201,'Petoskey',3945),(45202,'Pinckney',3945),(45203,'Plymouth Township',3945),(45204,'Pontiac',3945),(45205,'Port Huron',3945),(45206,'Portage',3945),(45207,'Redford',3945),(45208,'Reese',3945),(45209,'River Rouge',3945),(45210,'Riverview',3945),(45211,'Rochester Hills',3945),(45212,'Rockford',3945),(45213,'Romeo',3945),(45214,'Romulus',3945),(45215,'Roseville',3945),(45216,'Royal Oak',3945),(45217,'Saginaw',3945),(45218,'Saginaw Township North',3945),(45219,'Saginaw Township South',3945),(45220,'Saint Clair Shores',3945),(45221,'Saint Louis',3945),(45222,'Saline',3945),(45223,'Saugatuck',3945),(45224,'Sault Sainte Marie',3945),(45225,'Schoolcraft',3945),(45226,'Shelby',3945),(45227,'Southfield',3945),(45228,'Southgate',3945),(45229,'Sterling Heights',3945),(45230,'Sturgis',3945),(45231,'Taylor',3945),(45232,'Traverse City',3945),(45233,'Trenton',3945),(45234,'Troy',3945),(45235,'Walker',3945),(45236,'Walled Lake',3945),(45237,'Warren',3945),(45238,'Waterford',3945),(45239,'Waverly',3945),(45240,'Wayne',3945),(45241,'West Bloomfield Township',3945),(45242,'Westland',3945),(45243,'White Lake',3945),(45244,'Whitmore Lake',3945),(45245,'Williamston',3945),(45246,'Wixom',3945),(45247,'Woodhaven',3945),(45248,'Wyandotte',3945),(45249,'Wyoming',3945),(45250,'Ypsilanti',3945),(45251,'Albert Lea',3946),(45252,'Alger',3946),(45253,'Andover',3946),(45254,'Annandale',3946),(45255,'Anoka',3946),(45256,'Apple Valley',3946),(45257,'Austin',3946),(45258,'Baxter',3946),(45259,'Bemidji',3946),(45260,'Blaine',3946),(45261,'Blomkest',3946),(45262,'Bloomington',3946),(45263,'Blue Earth',3946),(45264,'Brainerd',3946),(45265,'Brooklyn Center',3946),(45266,'Brooklyn Park',3946),(45267,'Burnsville',3946),(45268,'Champlin',3946),(45269,'Chanhassen',3946),(45270,'Chaska',3946),(45271,'Chatfield',3946),(45272,'Circle Pines',3946),(45273,'Cloquet',3946),(45274,'Cokato',3946),(45275,'Columbia Heights',3946),(45276,'Coon Rapids',3946),(45277,'Cottage Grove',3946),(45278,'Crystal',3946),(45279,'Duluth',3946),(45280,'Eagan',3946),(45281,'East Bethel',3946),(45282,'Eden Prairie',3946),(45283,'Edina',3946),(45284,'Elk River',3946),(45285,'Ely',3946),(45286,'Fairmont',3946),(45287,'Faribault',3946),(45288,'Farmington',3946),(45289,'Fergus Falls',3946),(45290,'Frazee',3946),(45291,'Fridley',3946),(45292,'Golden Valley',3946),(45293,'Grand Rapids',3946),(45294,'Ham Lake',3946),(45295,'Hamel',3946),(45296,'Hastings',3946),(45297,'Hibbing',3946),(45298,'Hopkins',3946),(45299,'Houston',3946),(45300,'Hutchinson',3946),(45301,'Inver Grove Heights',3946),(45302,'Isanti',3946),(45303,'LaCrescent',3946),(45304,'Lakeville',3946),(45305,'Le Sueur',3946),(45306,'Lino Lakes',3946),(45307,'Litchfield',3946),(45308,'Mankato',3946),(45309,'Maple Grove',3946),(45310,'Maplewood',3946),(45311,'Marshall',3946),(45312,'Mendota Heights',3946),(45313,'Minneapolis',3946),(45314,'Minnetonka',3946),(45315,'Moorhead',3946),(45316,'Mounds View',3946),(45317,'Nelson',3946),(45318,'New Brighton',3946),(45319,'New Hope',3946),(45320,'New Ulm',3946),(45321,'North Mankato',3946),(45322,'North Saint Paul',3946),(45323,'Northfield',3946),(45324,'Oakdale',3946),(45325,'Onamia',3946),(45326,'Owatonna',3946),(45327,'Pequot Lakes',3946),(45328,'Plymouth',3946),(45329,'Prior Lake',3946),(45330,'Ramsey',3946),(45331,'Red Wing',3946),(45332,'Renville',3946),(45333,'Richfield',3946),(45334,'Robbinsdale',3946),(45335,'Rochester',3946),(45336,'Rosemount',3946),(45337,'Roseville',3946),(45338,'Royalton',3946),(45339,'Saint Cloud',3946),(45340,'Saint Louis Park',3946),(45341,'Saint Michael',3946),(45342,'Saint Paul',3946),(45343,'Saint Peter',3946),(45344,'Sauk Rapids',3946),(45345,'Savage',3946),(45346,'Shakopee',3946),(45347,'Shoreview',3946),(45348,'South Saint Paul',3946),(45349,'St. Paul',3946),(45350,'Stewartville',3946),(45351,'Stillwater',3946),(45352,'Vadnais Heights',3946),(45353,'Waconia',3946),(45354,'Wadena',3946),(45355,'West Saint Paul',3946),(45356,'White Bear Lake',3946),(45357,'Willmar',3946),(45358,'Winona',3946),(45359,'Woodbury',3946),(45360,'Worthington',3946),(45361,'Bay Saint Louis',3947),(45362,'Biloxi',3947),(45363,'Brandon',3947),(45364,'Brookhaven',3947),(45365,'Byhalia',3947),(45366,'Byram',3947),(45367,'Canton',3947),(45368,'Clarksdale',3947),(45369,'Cleveland',3947),(45370,'Clinton',3947),(45371,'Columbus',3947),(45372,'Corinth',3947),(45373,'Diamondhead',3947),(45374,'Gautier',3947),(45375,'Greenville',3947),(45376,'Greenwood',3947),(45377,'Grenada',3947),(45378,'Gulfport',3947),(45379,'Hattiesburg',3947),(45380,'Hernando',3947),(45381,'Horn Lake',3947),(45382,'Indianola',3947),(45383,'Jackson',3947),(45384,'Laurel',3947),(45385,'Long Beach',3947),(45386,'Lucedale',3947),(45387,'MacComb',3947),(45388,'Madison',3947),(45389,'Magnolia',3947),(45390,'Meridian',3947),(45391,'Michigan City',3947),(45392,'Moselle',3947),(45393,'Moss Point',3947),(45394,'Natchez',3947),(45395,'Ocean Springs',3947),(45396,'Olive Branch',3947),(45397,'Orange Grove',3947),(45398,'Oxford',3947),(45399,'Pascagoula',3947),(45400,'Pearl',3947),(45401,'Pelahatchie',3947),(45402,'Picayune',3947),(45403,'Quitman',3947),(45404,'Ridgeland',3947),(45405,'Senatobia',3947),(45406,'Southaven',3947),(45407,'Southhaven',3947),(45408,'Starkville',3947),(45409,'Tupelo',3947),(45410,'Utica',3947),(45411,'Vicksburg',3947),(45412,'Yazoo City',3947),(45413,'Affton',3948),(45414,'Annapolis',3948),(45415,'Arnold',3948),(45416,'Ballwin',3948),(45417,'Belgique',3948),(45418,'Bellefontaine Neighbors',3948),(45419,'Belton',3948),(45420,'Berkeley',3948),(45421,'Blue Springs',3948),(45422,'Branson',3948),(45423,'Bridgeton',3948),(45424,'Brighton',3948),(45425,'California',3948),(45426,'Camdenton',3948),(45427,'Cape Girardeau',3948),(45428,'Carthage',3948),(45429,'Chaffee',3948),(45430,'Chesterfield',3948),(45431,'Chillicothe',3948),(45432,'Clayton',3948),(45433,'Clever',3948),(45434,'Columbia',3948),(45435,'Concord',3948),(45436,'Crestwood',3948),(45437,'Creve Coeur',3948),(45438,'Desloge',3948),(45439,'Dora',3948),(45440,'Earth City',3948),(45441,'Excelsior Springs',3948),(45442,'Farmington',3948),(45443,'Fenton',3948),(45444,'Ferguson',3948),(45445,'Florissant',3948),(45446,'Forsyth',3948),(45447,'Fort Leonard Wood',3948),(45448,'Fulton',3948),(45449,'Gladstone',3948),(45450,'Grain Valley',3948),(45451,'Grandview',3948),(45452,'Gravois Mills',3948),(45453,'Hannibal',3948),(45454,'Harrisonville',3948),(45455,'Hazelwood',3948),(45456,'High Ridge',3948),(45457,'Independence',3948),(45458,'Jackson',3948),(45459,'Jefferson City',3948),(45460,'Jennings',3948),(45461,'Joplin',3948),(45462,'Kansas City',3948),(45463,'Kennett',3948),(45464,'Kirksville',3948),(45465,'Kirkwood',3948),(45466,'Kissee Mills',3948),(45467,'Lamar',3948),(45468,'Lebanon',3948),(45469,'Lees Summit',3948),(45470,'Lemay',3948),(45471,'Liberty',3948),(45472,'Lone Jack',3948),(45473,'Marshall',3948),(45474,'Maryland Heights',3948),(45475,'Maryville',3948),(45476,'Mehlville',3948),(45477,'Mexico',3948),(45478,'Moberly',3948),(45479,'Murphy',3948),(45480,'Nixa',3948),(45481,'O\'Fallon',3948),(45482,'Oakville',3948),(45483,'Overland',3948),(45484,'Pacific',3948),(45485,'Park Hills',3948),(45486,'Parkville',3948),(45487,'Peculiar',3948),(45488,'Poplar Bluff',3948),(45489,'Raytown',3948),(45490,'Richmond Heights',3948),(45491,'Rolla',3948),(45492,'Saint Ann',3948),(45493,'Saint Charles',3948),(45494,'Saint Clair',3948),(45495,'Saint Joseph',3948),(45496,'Saint Louis',3948),(45497,'Saint Peters',3948),(45498,'Sappington',3948),(45499,'Sedalia',3948),(45500,'Sikeston',3948),(45501,'Spanish Lake',3948),(45502,'Springfield',3948),(45503,'St. Louis',3948),(45504,'Steelville',3948),(45505,'Sunrise Beach',3948),(45506,'Town and Country',3948),(45507,'Trimble',3948),(45508,'Troy',3948),(45509,'University City',3948),(45510,'Warrensburg',3948),(45511,'Washington',3948),(45512,'Webb City',3948),(45513,'Webster Groves',3948),(45514,'Wentzville',3948),(45515,'West Plains',3948),(45516,'Wildwood',3948),(45517,'Anaconda-Deer Lodge County',3949),(45518,'Arlee',3949),(45519,'Belgrade',3949),(45520,'Billings',3949),(45521,'Bozeman',3949),(45522,'Butte',3949),(45523,'Butte-Silver Bow',3949),(45524,'Great Falls',3949),(45525,'Hamilton',3949),(45526,'Havre',3949),(45527,'Helena',3949),(45528,'Helena Valley Southeast',3949),(45529,'Helena Valley West Central',3949),(45530,'Kalispell',3949),(45531,'Lame Deer',3949),(45532,'Laurel',3949),(45533,'Lewistown',3949),(45534,'Livingston',3949),(45535,'Malmstrom Air Force Base',3949),(45536,'Manhattan',3949),(45537,'Miles City',3949),(45538,'Missoula',3949),(45539,'Orchard Homes',3949),(45540,'Pablo',3949),(45541,'Polson',3949),(45542,'Roberts',3949),(45543,'Ryegate',3949),(45544,'Sidney',3949),(45545,'Stevensville',3949),(45546,'Whitefish',3949),(45547,'Beatrice',3950),(45548,'Bellevue',3950),(45549,'Central City',3950),(45550,'Columbus',3950),(45551,'Cozad',3950),(45552,'Creighton',3950),(45553,'Fremont',3950),(45554,'Gering',3950),(45555,'Grand Island',3950),(45556,'Hastings',3950),(45557,'Homer',3950),(45558,'Keamey',3950),(45559,'Kearney',3950),(45560,'La Vista',3950),(45561,'Lexington',3950),(45562,'Lincoln',3950),(45563,'McCook',3950),(45564,'Norfolk',3950),(45565,'North Platte',3950),(45566,'Offutt Air Force Base West',3950),(45567,'Ogallala',3950),(45568,'Omaha',3950),(45569,'Papillion',3950),(45570,'Scottsbluff',3950),(45571,'South Sioux City',3950),(45572,'Boulder City',3951),(45573,'Carson City',3951),(45574,'Elko',3951),(45575,'Goldfield',3951),(45576,'Henderson',3951),(45577,'Las Vegas',3951),(45578,'Laughlin',3951),(45579,'Lovelock',3951),(45580,'Mesquite',3951),(45581,'Nellis Air Force Base',3951),(45582,'North Las Vegas',3951),(45583,'Pahrump',3951),(45584,'Paradise',3951),(45585,'Reno',3951),(45586,'Sparks',3951),(45587,'Spring Valley',3951),(45588,'Sun Valley',3951),(45589,'Sunrise Manor',3951),(45590,'Winchester',3951),(45591,'Winnemucca',3951),(45592,'Akron',3959),(45593,'Alledonia',3959),(45594,'Alliance',3959),(45595,'Amherst',3959),(45596,'Apple Creek',3959),(45597,'Archbold',3959),(45598,'Ashland',3959),(45599,'Ashtabula',3959),(45600,'Athens',3959),(45601,'Atwater',3959),(45602,'Aurora',3959),(45603,'Austintown',3959),(45604,'Avon Lake',3959),(45605,'Barberton',3959),(45606,'Batavia',3959),(45607,'Bay Village',3959),(45608,'Beachwood',3959),(45609,'Beavercreek',3959),(45610,'Bedford',3959),(45611,'Bedford Heights',3959),(45612,'Bellaire',3959),(45613,'Bellefontaine',3959),(45614,'Bellevue',3959),(45615,'Berea',3959),(45616,'Bexley',3959),(45617,'Blacklick',3959),(45618,'Blacklick Estates',3959),(45619,'Blanchester',3959),(45620,'Blue Ash',3959),(45621,'Boardman',3959),(45622,'Bowling Green',3959),(45623,'Brecksville',3959),(45624,'Bridgetown North',3959),(45625,'Bristolville',3959),(45626,'Broadview Heights',3959),(45627,'Brook Park',3959),(45628,'Brooklyn',3959),(45629,'Brunswick',3959),(45630,'Bryan',3959),(45631,'Bucyrus',3959),(45632,'Burton',3959),(45633,'Cambridge',3959),(45634,'Campbell',3959),(45635,'Canal Winchester',3959),(45636,'Canton',3959),(45637,'Carlisle',3959),(45638,'Celina',3959),(45639,'Centerville',3959),(45640,'Chagrin Falls',3959),(45641,'Chardon',3959),(45642,'Cheshire',3959),(45643,'Chillicothe',3959),(45644,'Chippewa Lake',3959),(45645,'Cincinnati',3959),(45646,'Circleville',3959),(45647,'Cleveland',3959),(45648,'Cleveland Heights',3959),(45649,'Columbus',3959),(45650,'Conneaut',3959),(45651,'Coshocton',3959),(45652,'Cuyahoga Falls',3959),(45653,'Dayton',3959),(45654,'Defiance',3959),(45655,'Delaware',3959),(45656,'Dover',3959),(45657,'Dublin',3959),(45658,'East Cleveland',3959),(45659,'East Liverpool',3959),(45660,'Eastlake',3959),(45661,'Elyria',3959),(45662,'Englewood',3959),(45663,'Euclid',3959),(45664,'Fairborn',3959),(45665,'Fairfield',3959),(45666,'Fairview Park',3959),(45667,'Findlay',3959),(45668,'Finneytown',3959),(45669,'Forest Park',3959),(45670,'Fort MacKinley',3959),(45671,'Fostoria',3959),(45672,'Fremont',3959),(45673,'Gahanna',3959),(45674,'Galion',3959),(45675,'Garfield Heights',3959),(45676,'Girard',3959),(45677,'Glenwillow',3959),(45678,'Green',3959),(45679,'Greenville',3959),(45680,'Grove City',3959),(45681,'Hamilton',3959),(45682,'Harrison',3959),(45683,'Hilliard',3959),(45684,'Hiram',3959),(45685,'Holland',3959),(45686,'Huber Heights',3959),(45687,'Hudson',3959),(45688,'Ironton',3959),(45689,'Kent',3959),(45690,'Kettering',3959),(45691,'Kidron',3959),(45692,'Lakewood',3959),(45693,'Lancaster',3959),(45694,'Lebanon',3959),(45695,'Lewis Center',3959),(45696,'Lima',3959),(45697,'Lincoln Village',3959),(45698,'Lorain',3959),(45699,'Loveland',3959),(45700,'Lyndhurst',3959),(45701,'Macedonia',3959),(45702,'Madison',3959),(45703,'Maineville',3959),(45704,'Mansfield',3959),(45705,'Maple Heights',3959),(45706,'Marietta',3959),(45707,'Marion',3959),(45708,'Marysville',3959),(45709,'Mason',3959),(45710,'Massillon',3959),(45711,'Maumee',3959),(45712,'Mayfield Heights',3959),(45713,'Medina',3959),(45714,'Mentor',3959),(45715,'Miamisburg',3959),(45716,'Middleburg Heights',3959),(45717,'Middletown',3959),(45718,'Milford',3959),(45719,'Millbury',3959),(45720,'Mineral City',3959),(45721,'Minster',3959),(45722,'Mount Gilead',3959),(45723,'Mount Vernon',3959),(45724,'Nelsonville',3959),(45725,'New Albany',3959),(45726,'New Philadelphia',3959),(45727,'Newark',3959),(45728,'Niles',3959),(45729,'North Canton',3959),(45730,'North College Hill',3959),(45731,'North Lewisburg',3959),(45732,'North Olmsted',3959),(45733,'North Ridgeville',3959),(45734,'North Royalton',3959),(45735,'Northbrook',3959),(45736,'Northfield',3959),(45737,'Northview',3959),(45738,'Norton',3959),(45739,'Norwalk',3959),(45740,'Norwood',3959),(45741,'Oberlin',3959),(45742,'Ohio',3959),(45743,'Oregon',3959),(45744,'Overlook-Page Manor',3959),(45745,'Oxford',3959),(45746,'Painesville',3959),(45747,'Parma',3959),(45748,'Parma Heights',3959),(45749,'Peninsula',3959),(45750,'Perrysburg',3959),(45751,'Pickerington',3959),(45752,'Piqua',3959),(45753,'Portage Lakes',3959),(45754,'Portsmouth',3959),(45755,'Powell',3959),(45756,'Ravenna',3959),(45757,'Reading',3959),(45758,'Reynoldsburg',3959),(45759,'Rittman',3959),(45760,'Riverside',3959),(45761,'Rocky River',3959),(45762,'Rossford',3959),(45763,'Salem',3959),(45764,'Sandusky',3959),(45765,'Seven Hills',3959),(45766,'Seville',3959),(45767,'Shaker Heights',3959),(45768,'Sharonville',3959),(45769,'Sheffield Lake',3959),(45770,'Shelby',3959),(45771,'Sidney',3959),(45772,'Solon',3959),(45773,'South Euclid',3959),(45774,'Springdale',3959),(45775,'Springfield',3959),(45776,'Steubenville',3959),(45777,'Stow',3959),(45778,'Streetsboro',3959),(45779,'Strongsville',3959),(45780,'Struthers',3959),(45781,'Sylvania',3959),(45782,'Tallmadge',3959),(45783,'Tiffin',3959),(45784,'Toledo',3959),(45785,'Trotwood',3959),(45786,'Troy',3959),(45787,'Twinsburg',3959),(45788,'University Heights',3959),(45789,'Upper Arlington',3959),(45790,'Urbana',3959),(45791,'Valley Glen',3959),(45792,'Van Wert',3959),(45793,'Vandalia',3959),(45794,'Vermilion',3959),(45795,'Wadsworth',3959),(45796,'Warren',3959),(45797,'Warrensville Heights',3959),(45798,'Washington',3959),(45799,'Waverly',3959),(45800,'West Carrollton City',3959),(45801,'West Chester',3959),(45802,'Westerville',3959),(45803,'Westlake',3959),(45804,'White Oak',3959),(45805,'Whitehall',3959),(45806,'Wickliffe',3959),(45807,'Willoughby',3959),(45808,'Willowick',3959),(45809,'Wilmington',3959),(45810,'Winesburg',3959),(45811,'Wooster',3959),(45812,'Worthington',3959),(45813,'Xenia',3959),(45814,'Yellow Springs',3959),(45815,'Youngstown',3959),(45816,'Zanesville',3959),(45817,'Ada',3960),(45818,'Altus',3960),(45819,'Ardmore',3960),(45820,'Bartlesville',3960),(45821,'Bethany',3960),(45822,'Bixby',3960),(45823,'Broken Arrow',3960),(45824,'Catoosa',3960),(45825,'Chickasha',3960),(45826,'Choctaw',3960),(45827,'Claremore',3960),(45828,'Del City',3960),(45829,'Duncan',3960),(45830,'Durant',3960),(45831,'Edmond',3960),(45832,'El Reno',3960),(45833,'Elk City',3960),(45834,'Enid',3960),(45835,'Fort Sill',3960),(45836,'Grove',3960),(45837,'Guthrie',3960),(45838,'Heavener',3960),(45839,'Hugo',3960),(45840,'Lawton',3960),(45841,'Lindsay',3960),(45842,'MacAlester',3960),(45843,'Miami',3960),(45844,'Midwest City',3960),(45845,'Moore',3960),(45846,'Morrison',3960),(45847,'Muskogee',3960),(45848,'Mustang',3960),(45849,'Norman',3960),(45850,'Oklahoma City',3960),(45851,'Okmulgee',3960),(45852,'Owasso',3960),(45853,'Pawnee',3960),(45854,'Ponca City',3960),(45855,'Rattan',3960),(45856,'Sand Springs',3960),(45857,'Sapulpa',3960),(45858,'Shawnee',3960),(45859,'Stillwater',3960),(45860,'Sulphur',3960),(45861,'Tahlequah',3960),(45862,'The Village',3960),(45863,'Tulsa',3960),(45864,'Weatherford',3960),(45865,'Welch',3960),(45866,'Woodward',3960),(45867,'Yukon',3960),(45868,'Point Edward',3961),(45869,'Woodbridge',3961),(45870,'Albany',3962),(45871,'Aloha',3962),(45872,'Altamont',3962),(45873,'Arleta',3962),(45874,'Ashland',3962),(45875,'Astoria',3962),(45876,'Baker City',3962),(45877,'Beaverton',3962),(45878,'Bend',3962),(45879,'Canby',3962),(45880,'Cave Junction',3962),(45881,'Cedar Hills',3962),(45882,'Cedar Mill',3962),(45883,'Central Point',3962),(45884,'City of The Dalles',3962),(45885,'Coos Bay',3962),(45886,'Corvallis',3962),(45887,'Creswell',3962),(45888,'Dallas',3962),(45889,'Donald',3962),(45890,'Eugene',3962),(45891,'Forest Grove',3962),(45892,'Four Corners',3962),(45893,'Gladstone',3962),(45894,'Glide',3962),(45895,'Grants Pass',3962),(45896,'Gresham',3962),(45897,'Hayesville',3962),(45898,'Hazelwood',3962),(45899,'Hermiston',3962),(45900,'Hillsboro',3962),(45901,'Hood River',3962),(45902,'Hubbard',3962),(45903,'John Day',3962),(45904,'Jordan Valley',3962),(45905,'Keizer',3962),(45906,'Klamath Falls',3962),(45907,'La Grande',3962),(45908,'Lake Oswego',3962),(45909,'Lebanon',3962),(45910,'Lincoln',3962),(45911,'MacMinnville',3962),(45912,'Medford',3962),(45913,'Milwaukie',3962),(45914,'Newberg',3962),(45915,'Newport',3962),(45916,'North Bend',3962),(45917,'OBrien',3962),(45918,'Oak Grove',3962),(45919,'Oatfield',3962),(45920,'Ontario',3962),(45921,'Oregon City',3962),(45922,'Pendleton',3962),(45923,'Portland',3962),(45924,'Redmond',3962),(45925,'Riddle',3962),(45926,'River Road',3962),(45927,'Roseburg',3962),(45928,'Salem',3962),(45929,'Sherwood',3962),(45930,'Springfield',3962),(45931,'Sublimity',3962),(45932,'Sutherlin',3962),(45933,'Talent',3962),(45934,'Tigard',3962),(45935,'Troutdale',3962),(45936,'Tualatin',3962),(45937,'Turner',3962),(45938,'Vaughn',3962),(45939,'West Linn',3962),(45940,'Wilsonville',3962),(45941,'Woodburn',3962),(45942,'Akron',3963),(45943,'Aliquippa',3963),(45944,'Allentown',3963),(45945,'Altoona',3963),(45946,'Ambler',3963),(45947,'Amityville',3963),(45948,'Ardmore',3963),(45949,'Audubon',3963),(45950,'Back Mountain',3963),(45951,'Baldwin',3963),(45952,'Bangor',3963),(45953,'Beaver Falls',3963),(45954,'Belle Vernon',3963),(45955,'Bensalem',3963),(45956,'Berwick',3963),(45957,'Berwyn',3963),(45958,'Bethel Park',3963),(45959,'Bethlehem',3963),(45960,'Bloomsburg',3963),(45961,'Boyertown',3963),(45962,'Bradford',3963),(45963,'Brentwood',3963),(45964,'Bridgeport',3963),(45965,'Bristol',3963),(45966,'Brockway',3963),(45967,'Broomall',3963),(45968,'Bushkill',3963),(45969,'Butler',3963),(45970,'Camp Hill',3963),(45971,'Canonsburg',3963),(45972,'Carbondale',3963),(45973,'Carlisle',3963),(45974,'Carnegie',3963),(45975,'Carnot Moon',3963),(45976,'Chambersburg',3963),(45977,'Chester',3963),(45978,'Chester Springs',3963),(45979,'Clarks Summit',3963),(45980,'Coatesville',3963),(45981,'Colonial Park',3963),(45982,'Columbia',3963),(45983,'Conshohocken',3963),(45984,'Coraopolis',3963),(45985,'Corry',3963),(45986,'Cranberry Township',3963),(45987,'Cresco',3963),(45988,'Croydon',3963),(45989,'Dallas',3963),(45990,'Dallastown',3963),(45991,'Darby',3963),(45992,'Darby Township',3963),(45993,'Downingtown',3963),(45994,'Drexel Hill',3963),(45995,'Duncansville',3963),(45996,'Dunmore',3963),(45997,'East Norriton',3963),(45998,'East Stroudsburg',3963),(45999,'Easton',3963),(46000,'Economy',3963),(46001,'Edinboro',3963),(46002,'Elizabethtown',3963),(46003,'Elkins Park',3963),(46004,'Emmaus',3963),(46005,'Ephrata',3963),(46006,'Erdenheim',3963),(46007,'Erie',3963),(46008,'Erwinna',3963),(46009,'Exton',3963),(46010,'Feasterville',3963),(46011,'Folcroft',3963),(46012,'Franklin',3963),(46013,'Franklin Park',3963),(46014,'Frederick',3963),(46015,'Fullerton',3963),(46016,'Furlong',3963),(46017,'Gettysburg',3963),(46018,'Gibsonia',3963),(46019,'Glenside',3963),(46020,'Gordonville',3963),(46021,'Greensburg',3963),(46022,'Gwynedd',3963),(46023,'Hampden Township',3963),(46024,'Hanover',3963),(46025,'Harleysville',3963),(46026,'Harrisburg',3963),(46027,'Harrison Township',3963),(46028,'Hatboro',3963),(46029,'Haverford',3963),(46030,'Havertown',3963),(46031,'Hazleton',3963),(46032,'Hermitage',3963),(46033,'Hershey',3963),(46034,'Hollidaysburg',3963),(46035,'Horsham',3963),(46036,'Huntingdon Valley',3963),(46037,'Indiana',3963),(46038,'Irvine',3963),(46039,'Ivyland',3963),(46040,'Jeannette',3963),(46041,'Jefferson',3963),(46042,'Jenkintown',3963),(46043,'Johnstown',3963),(46044,'Kempton',3963),(46045,'Kennett Square',3963),(46046,'King of Prussia',3963),(46047,'Kingston',3963),(46048,'Kutztown',3963),(46049,'Lafayette Hill',3963),(46050,'Lancaster',3963),(46051,'Landenberg',3963),(46052,'Langhorne',3963),(46053,'Lansdale',3963),(46054,'Lansdowne',3963),(46055,'Lansford',3963),(46056,'Laurys Station',3963),(46057,'Lebanon',3963),(46058,'Lehighton',3963),(46059,'Levittown',3963),(46060,'Lincoln University',3963),(46061,'Linesville',3963),(46062,'Linwood',3963),(46063,'Lower Burrell',3963),(46064,'Lower Merion',3963),(46065,'MacCandless Township',3963),(46066,'MacKeesport',3963),(46067,'Malvern',3963),(46068,'Meadville',3963),(46069,'Mechanicsburg',3963),(46070,'Media',3963),(46071,'Merion Station',3963),(46072,'Middleburg',3963),(46073,'Mifflinville',3963),(46074,'Milanville',3963),(46075,'Milford',3963),(46076,'Millersburg',3963),(46077,'Monessen',3963),(46078,'Moscow',3963),(46079,'Mount Carmel',3963),(46080,'Mount Lebanon',3963),(46081,'Mountville',3963),(46082,'Munhall',3963),(46083,'Municipality of Monroeville',3963),(46084,'Municipality of Murrysville',3963),(46085,'N. Charleroi',3963),(46086,'Nanticoke',3963),(46087,'Narberth',3963),(46088,'Natrona Heights',3963),(46089,'Nazareth',3963),(46090,'Nether Providence Township',3963),(46091,'New Buffalo',3963),(46092,'New Carlisle',3963),(46093,'New Castle',3963),(46094,'New Cumberland',3963),(46095,'New Hope',3963),(46096,'New Kensington',3963),(46097,'Newton',3963),(46098,'Newtown',3963),(46099,'Newville',3963),(46100,'Norristown',3963),(46101,'North East',3963),(46102,'North Versailles',3963),(46103,'North Wales',3963),(46104,'Oaks',3963),(46105,'Oil City',3963),(46106,'Olyphant',3963),(46107,'Orrtanna',3963),(46108,'Orwigsburg',3963),(46109,'Oxford',3963),(46110,'Paoli',3963),(46111,'Parksburg',3963),(46112,'Penn Hills',3963),(46113,'Philadelphia',3963),(46114,'Phildelphia',3963),(46115,'Phoenixville',3963),(46116,'Pipersville',3963),(46117,'Pittsburgh',3963),(46118,'Pleasantville',3963),(46119,'Plum',3963),(46120,'Pocono Summit',3963),(46121,'Pottstown',3963),(46122,'Pottsville',3963),(46123,'Primos',3963),(46124,'Progress',3963),(46125,'Prospect',3963),(46126,'Quakertown',3963),(46127,'Radnor Township',3963),(46128,'Reading',3963),(46129,'Robinson Township',3963),(46130,'Roseto',3963),(46131,'Ross Township',3963),(46132,'Royersford',3963),(46133,'Saint Marys',3963),(46134,'Sarver',3963),(46135,'Saxonburg',3963),(46136,'Scott Township',3963),(46137,'Scranton',3963),(46138,'Seward',3963),(46139,'Sewickley',3963),(46140,'Shaler Township',3963),(46141,'Sharon',3963),(46142,'Shermans Dale',3963),(46143,'Somerset',3963),(46144,'Souderton',3963),(46145,'South Park Township',3963),(46146,'Southampton',3963),(46147,'Springfield',3963),(46148,'State College',3963),(46149,'Strasburg',3963),(46150,'Sunbury',3963),(46151,'Susquehanna',3963),(46152,'Swissvale',3963),(46153,'Tamaqua',3963),(46154,'Taylor',3963),(46155,'Telford',3963),(46156,'Trevose',3963),(46157,'Turtle Creek',3963),(46158,'Tyrone',3963),(46159,'Uniontown',3963),(46160,'Upper Darby',3963),(46161,'Upper Providence Township',3963),(46162,'Upper Saint Clair',3963),(46163,'Vanderbilt',3963),(46164,'Warminster',3963),(46165,'Warren',3963),(46166,'Warrendale',3963),(46167,'Washington',3963),(46168,'Waterford',3963),(46169,'Waverly',3963),(46170,'Wayne',3963),(46171,'Waynesboro',3963),(46172,'West Chester',3963),(46173,'West Mifflin',3963),(46174,'West Norriton',3963),(46175,'West Point',3963),(46176,'Wexford',3963),(46177,'Whitehall',3963),(46178,'Wilcox',3963),(46179,'Wilkes-Barre',3963),(46180,'Wilkinsburg',3963),(46181,'Williamsport',3963),(46182,'Willow Grove',3963),(46183,'Womelsdorf',3963),(46184,'Woodlyn',3963),(46185,'Woolrich',3963),(46186,'Wyncote',3963),(46187,'Wyndmoor',3963),(46188,'Wynnewood',3963),(46189,'Yardley',3963),(46190,'Yeadon',3963),(46191,'York',3963),(46192,'Ramey',3964),(46193,'Adamsville',3969),(46194,'Alcoa',3969),(46195,'Antioch',3969),(46196,'Arlington',3969),(46197,'Athens',3969),(46198,'Bartlett',3969),(46199,'Bell Buckle',3969),(46200,'Bloomingdale',3969),(46201,'Blountville',3969),(46202,'Brentwood',3969),(46203,'Bristol',3969),(46204,'Brownsville',3969),(46205,'Burns',3969),(46206,'Chattanooga',3969),(46207,'Clarksville',3969),(46208,'Cleveland',3969),(46209,'Collierville',3969),(46210,'Columbia',3969),(46211,'Cookeville',3969),(46212,'Cornersville',3969),(46213,'Crossville',3969),(46214,'Dayton',3969),(46215,'Dickson',3969),(46216,'Dyersburg',3969),(46217,'East Brainerd',3969),(46218,'East Ridge',3969),(46219,'Elizabethton',3969),(46220,'Farragut',3969),(46221,'Franklin',3969),(46222,'Gainesboro',3969),(46223,'Gallatin',3969),(46224,'Gatlinburg',3969),(46225,'Germantown',3969),(46226,'Goodlettsville',3969),(46227,'Greeneville',3969),(46228,'Hendersonville',3969),(46229,'Hixson',3969),(46230,'Jackson',3969),(46231,'Johnson City',3969),(46232,'Kingsport',3969),(46233,'Knoxville',3969),(46234,'Kodak',3969),(46235,'La Vergne',3969),(46236,'Lawrenceburg',3969),(46237,'Lebanon',3969),(46238,'Lenoir City',3969),(46239,'Lewisburg',3969),(46240,'MacMinnville',3969),(46241,'Maryville',3969),(46242,'Memphis',3969),(46243,'Middle Valley',3969),(46244,'Millington',3969),(46245,'Morristown',3969),(46246,'Mulberry',3969),(46247,'Murfreesboro',3969),(46248,'Nashville',3969),(46249,'Oak Ridge',3969),(46250,'Ooltewah',3969),(46251,'Pinson',3969),(46252,'Red Bank',3969),(46253,'Selmer',3969),(46254,'Sevierville',3969),(46255,'Shelbyville',3969),(46256,'Smithville',3969),(46257,'Smyrna',3969),(46258,'Spring City',3969),(46259,'Springfield',3969),(46260,'Tazewell',3969),(46261,'Trenton',3969),(46262,'Tullahoma',3969),(46263,'Union City',3969),(46264,'Abilene',3970),(46265,'Addison',3970),(46266,'Alamo',3970),(46267,'Aldine',3970),(46268,'Alice',3970),(46269,'Allen',3970),(46270,'Alvin',3970),(46271,'Amarillo',3970),(46272,'Anderson Mill',3970),(46273,'Andrews',3970),(46274,'Angleton',3970),(46275,'Argyle',3970),(46276,'Arlington',3970),(46277,'Aspermont',3970),(46278,'Atascocita',3970),(46279,'Athens',3970),(46280,'Austin',3970),(46281,'Austinn',3970),(46282,'Azle',3970),(46283,'Balch Springs',3970),(46284,'Barry',3970),(46285,'Bay City',3970),(46286,'Baytown',3970),(46287,'Beaumont',3970),(46288,'Bedford',3970),(46289,'Beeville',3970),(46290,'Bellaire',3970),(46291,'Belton',3970),(46292,'Benbrook',3970),(46293,'Big Spring',3970),(46294,'Bluff Dale',3970),(46295,'Boerne',3970),(46296,'Borger',3970),(46297,'Breckenridge',3970),(46298,'Brenham',3970),(46299,'Brownfield',3970),(46300,'Brownsville',3970),(46301,'Brownwood',3970),(46302,'Bryan',3970),(46303,'Buda',3970),(46304,'Burkburnett',3970),(46305,'Burleson',3970),(46306,'Campbell',3970),(46307,'Canyon',3970),(46308,'Canyon Lake',3970),(46309,'Carrollton',3970),(46310,'Cat Spring',3970),(46311,'Cedar Hill',3970),(46312,'Cedar Park',3970),(46313,'Celina',3970),(46314,'Center',3970),(46315,'Channelview',3970),(46316,'City of Dallas',3970),(46317,'Cleburne',3970),(46318,'Cloverleaf',3970),(46319,'Clute',3970),(46320,'College Station',3970),(46321,'Colleyville',3970),(46322,'Columbus',3970),(46323,'Comanche',3970),(46324,'Conroe',3970),(46325,'Converse',3970),(46326,'Coppell',3970),(46327,'Copperas Cove',3970),(46328,'Corinth',3970),(46329,'Corpus Christi',3970),(46330,'Corsicana',3970),(46331,'Cotulla',3970),(46332,'Crandall',3970),(46333,'Cypress',3970),(46334,'Dallas',3970),(46335,'Dayton',3970),(46336,'DeSoto',3970),(46337,'Deer Park',3970),(46338,'Del Rio',3970),(46339,'Denison',3970),(46340,'Denton',3970),(46341,'Dickinson',3970),(46342,'Donna',3970),(46343,'Dumas',3970),(46344,'Duncanville',3970),(46345,'Eagle Pass',3970),(46346,'Edinburg',3970),(46347,'El Campo',3970),(46348,'El Paso',3970),(46349,'Elmendorf',3970),(46350,'Ennis',3970),(46351,'Euless',3970),(46352,'Fairfield',3970),(46353,'Farmers Branch',3970),(46354,'Flower Mound',3970),(46355,'Forest Hill',3970),(46356,'Forney',3970),(46357,'Fort Bliss',3970),(46358,'Fort Hood',3970),(46359,'Fort Worth',3970),(46360,'Freeport',3970),(46361,'Friendswood',3970),(46362,'Frisco',3970),(46363,'Gainesville',3970),(46364,'Galena Park',3970),(46365,'Galveston',3970),(46366,'Garland',3970),(46367,'Gatesville',3970),(46368,'Georgetown',3970),(46369,'Grand Prairie',3970),(46370,'Grandview',3970),(46371,'Grapeland',3970),(46372,'Grapevine',3970),(46373,'Greenville',3970),(46374,'Gregory',3970),(46375,'Groves',3970),(46376,'Haltom City',3970),(46377,'Harker Heights',3970),(46378,'Harlingen',3970),(46379,'Henderson',3970),(46380,'Hereford',3970),(46381,'Hewitt',3970),(46382,'Highland Village',3970),(46383,'Hillsboro',3970),(46384,'Houston',3970),(46385,'Humble',3970),(46386,'Huntsville',3970),(46387,'Hurst',3970),(46388,'Ingleside',3970),(46389,'Irving',3970),(46390,'Jacksonville',3970),(46391,'Jefferson',3970),(46392,'Jollyville',3970),(46393,'Justin',3970),(46394,'Katy',3970),(46395,'Kaufman',3970),(46396,'Keller',3970),(46397,'Kemah',3970),(46398,'Kemp',3970),(46399,'Kerrville',3970),(46400,'Kilgore',3970),(46401,'Killeen',3970),(46402,'Kingsville',3970),(46403,'Kingwood',3970),(46404,'La Marque',3970),(46405,'La Porte',3970),(46406,'Lackland Air Force Base',3970),(46407,'Lago Vista',3970),(46408,'Lake Jackson',3970),(46409,'Lamesa',3970),(46410,'Lampasas',3970),(46411,'Lancaster',3970),(46412,'Laredo',3970),(46413,'League City',3970),(46414,'Leon Valley',3970),(46415,'Levelland',3970),(46416,'Lewisville',3970),(46417,'Liberty Hill',3970),(46418,'Lindsay',3970),(46419,'Little Elm',3970),(46420,'Live Oak',3970),(46421,'Llano',3970),(46422,'Lockhart',3970),(46423,'Longview',3970),(46424,'Lubbock',3970),(46425,'Lufkin',3970),(46426,'Lumberton',3970),(46427,'MacAllen',3970),(46428,'MacKinney',3970),(46429,'Magnolia',3970),(46430,'Malakoff',3970),(46431,'Mansfield',3970),(46432,'Marshall',3970),(46433,'McAllen',3970),(46434,'McKinney',3970),(46435,'Medina',3970),(46436,'Mercedes',3970),(46437,'Mesquite',3970),(46438,'Midland',3970),(46439,'Mineral Wells',3970),(46440,'Mission',3970),(46441,'Mission Bend',3970),(46442,'Missouri City',3970),(46443,'Montgomery',3970),(46444,'Mount Pleasant',3970),(46445,'Murphy',3970),(46446,'Nacogdoches',3970),(46447,'Nederland',3970),(46448,'New Braunfels',3970),(46449,'New Caney',3970),(46450,'North Richland Hills',3970),(46451,'North Zulch',3970),(46452,'Odessa',3970),(46453,'Orange',3970),(46454,'Ovalo',3970),(46455,'Palestine',3970),(46456,'Pampa',3970),(46457,'Paris',3970),(46458,'Pasadena',3970),(46459,'Pearland',3970),(46460,'Pecan Grove',3970),(46461,'Pecos',3970),(46462,'Pflugerville',3970),(46463,'Pharr',3970),(46464,'Pinehurst',3970),(46465,'Plainview',3970),(46466,'Plano',3970),(46467,'Pontotoc',3970),(46468,'Port Arthur',3970),(46469,'Port Lavaca',3970),(46470,'Port Neches',3970),(46471,'Portland',3970),(46472,'Pottsboro',3970),(46473,'Princeton',3970),(46474,'Richardson',3970),(46475,'Richmond',3970),(46476,'Rio Grande City',3970),(46477,'Robstown',3970),(46478,'Rockport',3970),(46479,'Rockwall',3970),(46480,'Roma',3970),(46481,'Rosenberg',3970),(46482,'Round Rock',3970),(46483,'Rowlett',3970),(46484,'Royse City',3970),(46485,'Sachse',3970),(46486,'Saginaw',3970),(46487,'San Angelo',3970),(46488,'San Antonio',3970),(46489,'San Benito',3970),(46490,'San Juan',3970),(46491,'San Marcos',3970),(46492,'Santa Fe',3970),(46493,'Schertz',3970),(46494,'Seabrook',3970),(46495,'Seagoville',3970),(46496,'Seguin',3970),(46497,'Sherman',3970),(46498,'Slaton',3970),(46499,'Smithville',3970),(46500,'Snyder',3970),(46501,'Socorro',3970),(46502,'South Houston',3970),(46503,'South Padre Island',3970),(46504,'Southlake',3970),(46505,'Spring',3970),(46506,'Stafford',3970),(46507,'Stephenville',3970),(46508,'Strawn',3970),(46509,'Sugar Land',3970),(46510,'Sulphur Springs',3970),(46511,'Sweetwater',3970),(46512,'Taylor',3970),(46513,'Temple',3970),(46514,'Terrell',3970),(46515,'Texarkana',3970),(46516,'Texas City',3970),(46517,'The Colony',3970),(46518,'The Woodlands',3970),(46519,'Tomball',3970),(46520,'Tyler',3970),(46521,'Universal City',3970),(46522,'University Park',3970),(46523,'Uvalde',3970),(46524,'Vernon',3970),(46525,'Victoria',3970),(46526,'Vidor',3970),(46527,'Waco',3970),(46528,'Watauga',3970),(46529,'Waxahachie',3970),(46530,'Weatherford',3970),(46531,'Weslaco',3970),(46532,'West Odessa',3970),(46533,'West University Place',3970),(46534,'White Settlement',3970),(46535,'Wichita Falls',3970),(46536,'Winnsboro',3970),(46537,'Woodway',3970),(46538,'Wylie',3970),(46539,'Yoakum',3970),(46540,'austinn',3970),(46541,'Bedford Kentucky',3971),(46542,'Alpine',3972),(46543,'American Fork',3972),(46544,'Bluffdale',3972),(46545,'Bountiful',3972),(46546,'Brigham City',3972),(46547,'Canyon Rim',3972),(46548,'Castle Dale',3972),(46549,'Cedar City',3972),(46550,'Centerville',3972),(46551,'Clearfield',3972),(46552,'Clinton',3972),(46553,'Cottonwood Heights',3972),(46554,'Cottonwood West',3972),(46555,'Draper',3972),(46556,'East Millcreek',3972),(46557,'Farmington',3972),(46558,'Holladay-Cottonwood',3972),(46559,'Ivins',3972),(46560,'Kaysville',3972),(46561,'Kearns',3972),(46562,'Layton',3972),(46563,'Lehi',3972),(46564,'Logan',3972),(46565,'Magna',3972),(46566,'Mapleton',3972),(46567,'Midvale',3972),(46568,'Millcreek',3972),(46569,'Moab',3972),(46570,'Monticello',3972),(46571,'Murray',3972),(46572,'North Logan',3972),(46573,'North Ogden',3972),(46574,'Ogden',3972),(46575,'Orem',3972),(46576,'Panguitch',3972),(46577,'Park City',3972),(46578,'Payson',3972),(46579,'Pleasant Grove',3972),(46580,'Provo',3972),(46581,'Riverton',3972),(46582,'Roy',3972),(46583,'Saint George',3972),(46584,'Salt Lake City',3972),(46585,'Sandy',3972),(46586,'Santaquin',3972),(46587,'South Jordan',3972),(46588,'South Ogden',3972),(46589,'South Salt Lake',3972),(46590,'Spanish Fork',3972),(46591,'Springville',3972),(46592,'Taylorsville',3972),(46593,'Tooele',3972),(46594,'Tremonton',3972),(46595,'Union',3972),(46596,'Washington',3972),(46597,'West Jordan',3972),(46598,'West Valley City',3972),(46599,'Woods Cross',3972),(46600,'Barre',3973),(46601,'Bennington',3973),(46602,'Brattleboro',3973),(46603,'Bristol',3973),(46604,'Burlington',3973),(46605,'Cabot',3973),(46606,'Colchester',3973),(46607,'Danville',3973),(46608,'Dorset',3973),(46609,'Dummerston',3973),(46610,'East Corinth',3973),(46611,'East Fairfield',3973),(46612,'East Randolph',3973),(46613,'Essex',3973),(46614,'Essex Junction',3973),(46615,'Grand Isle',3973),(46616,'Hartford',3973),(46617,'Jericho',3973),(46618,'Manchester',3973),(46619,'Manchester Center',3973),(46620,'Middlebury',3973),(46621,'Milton',3973),(46622,'Montpelier',3973),(46623,'Putney',3973),(46624,'Randolph',3973),(46625,'Rochester',3973),(46626,'Rutland',3973),(46627,'Saint Albans',3973),(46628,'Saint Johnsbury',3973),(46629,'Saxtons River',3973),(46630,'South Burlington',3973),(46631,'South Strafford',3973),(46632,'Springfield',3973),(46633,'Townshend',3973),(46634,'Tunbridge',3973),(46635,'Van',3973),(46636,'Vernon',3973),(46637,'Wallingford',3973),(46638,'Watisfield',3973),(46639,'West Brookfield',3973),(46640,'West Charleston',3973),(46641,'West Newbury',3973),(46642,'Williston',3973),(46643,'Winooski',3973),(46644,'Abingdon',3974),(46645,'Alexandria',3974),(46646,'Annandale',3974),(46647,'Arlington',3974),(46648,'Ashburn',3974),(46649,'Ashland',3974),(46650,'Aylett',3974),(46651,'Bailey\'s Crossroads',3974),(46652,'Blacksburg',3974),(46653,'Bland',3974),(46654,'Bluefield',3974),(46655,'Bon Air',3974),(46656,'Bristol',3974),(46657,'Burke',3974),(46658,'Cave Spring',3974),(46659,'Centreville',3974),(46660,'Chantilly',3974),(46661,'Charlottesville',3974),(46662,'Chesapeake',3974),(46663,'Chester',3974),(46664,'Christiansburg',3974),(46665,'Churchville',3974),(46666,'Clifton',3974),(46667,'Colonial Heights',3974),(46668,'Culloden',3974),(46669,'Dale City',3974),(46670,'Danville',3974),(46671,'Dublin',3974),(46672,'Eagle Rock',3974),(46673,'East Highland Park',3974),(46674,'Faber',3974),(46675,'Fairfax',3974),(46676,'Falls Church',3974),(46677,'Fishersville',3974),(46678,'Fort Hunt',3974),(46679,'Fort Valley',3974),(46680,'Franconia',3974),(46681,'Franklin',3974),(46682,'Fredericksburg',3974),(46683,'Front Royal',3974),(46684,'Gainesville',3974),(46685,'Glen Allen',3974),(46686,'Gloucester',3974),(46687,'Goochland',3974),(46688,'Great Falls',3974),(46689,'Groveton',3974),(46690,'Hampton',3974),(46691,'Harrisonburg',3974),(46692,'Henrico',3974),(46693,'Herndon',3974),(46694,'Highland Springs',3974),(46695,'Hollins',3974),(46696,'Hopewell',3974),(46697,'Hybla Valley',3974),(46698,'Idylwood',3974),(46699,'Irvington',3974),(46700,'Jamesville',3974),(46701,'Jefferson',3974),(46702,'Keen Mountain',3974),(46703,'Keswick',3974),(46704,'Lake Ridge',3974),(46705,'Lakeside',3974),(46706,'Laurel',3974),(46707,'Leesburg',3974),(46708,'Lincolnia',3974),(46709,'Lorton',3974),(46710,'Lynchburg',3974),(46711,'MacLean',3974),(46712,'Madison',3974),(46713,'Madison Heights',3974),(46714,'Manassas',3974),(46715,'Marion',3974),(46716,'Martinsville',3974),(46717,'Mclean',3974),(46718,'Mechanicsville',3974),(46719,'Melfa',3974),(46720,'Midlothian',3974),(46721,'Montclair',3974),(46722,'Montross',3974),(46723,'Mount Vernon',3974),(46724,'Newington',3974),(46725,'Newport News',3974),(46726,'Norfolk',3974),(46727,'North Springfield',3974),(46728,'Oakton',3974),(46729,'Orange',3974),(46730,'Petersburg',3974),(46731,'Poquoson',3974),(46732,'Portsmouth',3974),(46733,'Radford',3974),(46734,'Reston',3974),(46735,'Richmond',3974),(46736,'Roanoke',3974),(46737,'Rose Hill',3974),(46738,'Salem',3974),(46739,'Seaford',3974),(46740,'South Boston',3974),(46741,'Springfield',3974),(46742,'Stafford',3974),(46743,'Staffordshire',3974),(46744,'Staunton',3974),(46745,'Sterling',3974),(46746,'Suffolk',3974),(46747,'Sugarland Run',3974),(46748,'Tappahannock',3974),(46749,'Timberlake',3974),(46750,'Triangle',3974),(46751,'Tuckahoe',3974),(46752,'Tysons Corner',3974),(46753,'Vienna',3974),(46754,'Virginia Beach',3974),(46755,'Warrenton',3974),(46756,'Washington',3974),(46757,'Waterford',3974),(46758,'Waynesboro',3974),(46759,'West Springfield',3974),(46760,'Williamsburg',3974),(46761,'Winchester',3974),(46762,'Wolf Trap',3974),(46763,'Woodbridge',3974),(46764,'Wytheville',3974),(46765,'Yorktown',3974),(46766,'Aberdeen',3975),(46767,'Airway Heights',3975),(46768,'Alderwood Manor',3975),(46769,'Anacortes',3975),(46770,'Arlington',3975),(46771,'Auburn',3975),(46772,'Bainbridge Island',3975),(46773,'Battle Ground',3975),(46774,'Bellevue',3975),(46775,'Bellingham',3975),(46776,'Bingen',3975),(46777,'Blaine',3975),(46778,'Bothell',3975),(46779,'Bremerton',3975),(46780,'Bryn Mawr-Skyway',3975),(46781,'Buckley',3975),(46782,'Burien',3975),(46783,'Burlington',3975),(46784,'Camano Island',3975),(46785,'Camas',3975),(46786,'Cascade-Fairwood',3975),(46787,'Centralia',3975),(46788,'Chehalis',3975),(46789,'Cheney',3975),(46790,'Clear Lake',3975),(46791,'Colbert',3975),(46792,'Cottage Lake',3975),(46793,'Covington-Sawyer-Wilderness',3975),(46794,'Des Moines',3975),(46795,'Duvall',3975),(46796,'East Hill-Meridian',3975),(46797,'East Renton Highlands',3975),(46798,'East Wenatchee Bench',3975),(46799,'Eastsound',3975),(46800,'Eatonville',3975),(46801,'Edgewood-North Hill',3975),(46802,'Edmonds',3975),(46803,'Elk Plain',3975),(46804,'Ellensburg',3975),(46805,'Enumclaw',3975),(46806,'Esperance',3975),(46807,'Everett',3975),(46808,'Evergreen',3975),(46809,'Fairchild',3975),(46810,'Federal Way',3975),(46811,'Ferndale',3975),(46812,'Fircrest',3975),(46813,'Ford',3975),(46814,'Fort Lewis',3975),(46815,'Friday Harbor',3975),(46816,'Gig Harbor',3975),(46817,'Graham',3975),(46818,'Harbour Pointe',3975),(46819,'Inglewood-Finn Hill',3975),(46820,'Issaquah',3975),(46821,'Kelso',3975),(46822,'Kenmore',3975),(46823,'Kennewick',3975),(46824,'Kent',3975),(46825,'Kingsgate',3975),(46826,'Kirkland',3975),(46827,'Lacey',3975),(46828,'Lake Serene-North Lynnwood',3975),(46829,'Lakeland North',3975),(46830,'Lakeland South',3975),(46831,'Lakewood',3975),(46832,'Longview',3975),(46833,'Lynnwood',3975),(46834,'Martha Lake',3975),(46835,'Marysville',3975),(46836,'Mercer Island',3975),(46837,'Minnehaha',3975),(46838,'Monroe',3975),(46839,'Moses Lake',3975),(46840,'Mossyrock',3975),(46841,'Mount Vernon',3975),(46842,'Mountlake Terrace',3975),(46843,'Mukilteo',3975),(46844,'Newport Hills',3975),(46845,'North City-Ridgecrest',3975),(46846,'North Creek',3975),(46847,'North Marysville',3975),(46848,'Oak Harbor',3975),(46849,'Ocean Shores',3975),(46850,'Olympia',3975),(46851,'Opportunity',3975),(46852,'Orchards South',3975),(46853,'Orting',3975),(46854,'Paine Field-Lake Stickney',3975),(46855,'Parkland',3975),(46856,'Pasco',3975),(46857,'Picnic Point-North Lynnwood',3975),(46858,'Pine Lake',3975),(46859,'Port Angeles',3975),(46860,'Port Hadlock',3975),(46861,'Port Ludlow',3975),(46862,'Port Orchard',3975),(46863,'Poulsbo',3975),(46864,'Pullman',3975),(46865,'Puyallup',3975),(46866,'Redmond',3975),(46867,'Renton',3975),(46868,'Republic',3975),(46869,'Richland',3975),(46870,'Riverton-Boulevard Park',3975),(46871,'Sahalee',3975),(46872,'Salmon Creek',3975),(46873,'Sammamish',3975),(46874,'SeaTac',3975),(46875,'Seattle',3975),(46876,'Seattle Hill-Silver Firs',3975),(46877,'Sedro Woolley',3975),(46878,'Shelton',3975),(46879,'Shoreline',3975),(46880,'Silverdale',3975),(46881,'Snohomish',3975),(46882,'South Hill',3975),(46883,'South Prairie',3975),(46884,'South Seattle',3975),(46885,'Spanaway',3975),(46886,'Spokane',3975),(46887,'Sumas',3975),(46888,'Sumner',3975),(46889,'Sunnyside',3975),(46890,'Tacoma',3975),(46891,'Tukwila',3975),(46892,'Tumwater',3975),(46893,'University Place',3975),(46894,'Vancouver',3975),(46895,'Vashon',3975),(46896,'Walla Walla',3975),(46897,'Washougal',3975),(46898,'Wenatchee',3975),(46899,'West Lake Stevens',3975),(46900,'White Center',3975),(46901,'White Salmon',3975),(46902,'White Swan',3975),(46903,'Woodinville',3975),(46904,'Yakima',3975),(46905,'Yelm',3975),(46906,'Adams',3977),(46907,'Allouez',3977),(46908,'Appleton',3977),(46909,'Ashland',3977),(46910,'Ashwaubenon',3977),(46911,'Baraboo',3977),(46912,'Beaver Dam',3977),(46913,'Beloit',3977),(46914,'Brookfield',3977),(46915,'Brown Deer',3977),(46916,'Burlington',3977),(46917,'Caledonia',3977),(46918,'Carter',3977),(46919,'Cedarburg',3977),(46920,'Chippewa Falls',3977),(46921,'Cudahy',3977),(46922,'De Pere',3977),(46923,'Deer Park',3977),(46924,'Delafield',3977),(46925,'Eau Claire',3977),(46926,'Elkhorn',3977),(46927,'Elroy',3977),(46928,'Fitchburg',3977),(46929,'Fond du Lac',3977),(46930,'Fort Atkinson',3977),(46931,'Franklin',3977),(46932,'Galesville',3977),(46933,'Germantown',3977),(46934,'Glen Flora',3977),(46935,'Glendale',3977),(46936,'Goodman',3977),(46937,'Grafton',3977),(46938,'Green Bay',3977),(46939,'Greendale',3977),(46940,'Greenfield',3977),(46941,'Hartford',3977),(46942,'Hartland',3977),(46943,'Howard',3977),(46944,'Hudson',3977),(46945,'Janesville',3977),(46946,'Jefferson',3977),(46947,'Junction City',3977),(46948,'Kaukauna',3977),(46949,'Kenosha',3977),(46950,'Kiel',3977),(46951,'Kohler',3977),(46952,'La Crosse',3977),(46953,'Little Chute',3977),(46954,'Madison',3977),(46955,'Manitowoc',3977),(46956,'Marinette',3977),(46957,'Marshfield',3977),(46958,'Medford',3977),(46959,'Menasha',3977),(46960,'Menomonee Falls',3977),(46961,'Menomonie',3977),(46962,'Mequon',3977),(46963,'Merrill',3977),(46964,'Middleton',3977),(46965,'Milwaukee',3977),(46966,'Mineral Point',3977),(46967,'Monroe',3977),(46968,'Mount Pleasant',3977),(46969,'Mukwonago',3977),(46970,'Muskego',3977),(46971,'Neenah',3977),(46972,'New Berlin',3977),(46973,'New Richmond',3977),(46974,'Oak Creek',3977),(46975,'Oconomowoc',3977),(46976,'Onalaska',3977),(46977,'Orfordville',3977),(46978,'Oshkosh',3977),(46979,'Pigeon Falls',3977),(46980,'Platteville',3977),(46981,'Pleasant Prairie',3977),(46982,'Plover',3977),(46983,'Port Washington',3977),(46984,'Portage',3977),(46985,'Pound',3977),(46986,'Racine',3977),(46987,'Reedsburg',3977),(46988,'Rhinelander',3977),(46989,'River Falls',3977),(46990,'Saint Francis',3977),(46991,'Sheboygan',3977),(46992,'Shorewood',3977),(46993,'South Milwaukee',3977),(46994,'Spring Valley',3977),(46995,'Stevens Point',3977),(46996,'Stoughton',3977),(46997,'Strum',3977),(46998,'Sturtevant',3977),(46999,'Sun Prairie',3977),(47000,'Superior',3977),(47001,'Three Lakes',3977),(47002,'Tomah',3977),(47003,'Two Rivers',3977),(47004,'Washington Island',3977),(47005,'Waterford',3977),(47006,'Watertown',3977),(47007,'Waukesha',3977),(47008,'Waupun',3977),(47009,'Wausau',3977),(47010,'Wautoma',3977),(47011,'Wauwatosa',3977),(47012,'West Allis',3977),(47013,'West Bend',3977),(47014,'Weston',3977),(47015,'Whitefish Bay',3977),(47016,'Whitewater',3977),(47017,'Wisconsin Rapids',3977),(47018,'Buffalo',3978),(47019,'Casper',3978),(47020,'Cheyenne',3978),(47021,'Cody',3978),(47022,'Douglas',3978),(47023,'Evanston',3978),(47024,'Gillette',3978),(47025,'Green River',3978),(47026,'Jackson',3978),(47027,'Lander',3978),(47028,'Laramie',3978),(47029,'Powell',3978),(47030,'Rawlins',3978),(47031,'Riverton',3978),(47032,'Rock Springs',3978),(47033,'Sheridan',3978),(47034,'Torrington',3978),(47035,'Worland',3978),(47036,'Artigas',3980),(47037,'Bella Union',3980),(47038,'Camino Maldonado',3981),(47039,'Canelones',3981),(47040,'Ciudad de la Costa',3981),(47041,'Juan Antonio Artigas',3981),(47042,'Las Piedras',3981),(47043,'Pando',3981),(47044,'Paso de Carrasco',3981),(47045,'Progreso',3981),(47046,'Santa Lucia',3981),(47047,'Carmelo',3983),(47048,'Colonia',3983),(47049,'Juan Lacaze',3983),(47050,'Nueva Helvecia',3983),(47051,'Durazno',3984),(47052,'Florida',3985),(47053,'Trinidad',3986),(47054,'Minas',3987),(47055,'Maldonado',3988),(47056,'San Carlos',3988),(47057,'La Paz',3989),(47058,'Montevideo',3989),(47059,'Paysandu',3990),(47060,'Rivera',3992),(47061,'Chuy',3993),(47062,'Rocha',3993),(47063,'Salto',3994),(47064,'Dolores',3996),(47065,'Mercedes',3996),(47066,'Paso de los Toros',3997),(47067,'Tacuarembo',3997),(47068,'Ahunabayev',3999),(47069,'Andijon',3999),(47070,'Asaka',3999),(47071,'Boz',3999),(47072,'Hakkulobod',3999),(47073,'Hocaobod',3999),(47074,'Honobod',3999),(47075,'Ilyichevsk',3999),(47076,'Karabagis',3999),(47077,'Kurgontepa',3999),(47078,'Marhomat',3999),(47079,'Pahtaobod',3999),(47080,'Paytug',3999),(47081,'Sahrihan',3999),(47082,'Buhoro',4000),(47083,'Cangeldi',4000),(47084,'Galaosiye',4000),(47085,'Gazli',4000),(47086,'Gijduvon',4000),(47087,'Kizilravbe',4000),(47088,'Kogon',4000),(47089,'Korakul',4000),(47090,'Korovulbazar',4000),(47091,'Kukca',4000),(47092,'Olot',4000),(47093,'Oyokkuduk',4000),(47094,'Romitan',4000),(47095,'Safirkon',4000),(47096,'Vobkent',4000),(47097,'Cizah',4002),(47098,'Dustlik',4002),(47099,'Gagarin',4002),(47100,'Gallaorol',4002),(47101,'Marcanbulok',4002),(47102,'Pahtakor',4002),(47103,'Ulyanovo',4002),(47104,'Zomin',4002),(47105,'Altyarik',4003),(47106,'Avval',4003),(47107,'Besarik',4003),(47108,'Fargona',4003),(47109,'Hamza',4003),(47110,'Kirgili',4003),(47111,'Kukon',4003),(47112,'Kuva',4003),(47113,'Kuvasoy',4003),(47114,'Margilon',4003),(47115,'Rapkan',4003),(47116,'Riston',4003),(47117,'Toslok',4003),(47118,'Yaypan',4003),(47119,'Drujba',4004),(47120,'Gurlan',4004),(47121,'Hazorasp',4004),(47122,'Heva',4004),(47123,'Honko',4004),(47124,'Kuskupir',4004),(47125,'Mesekli',4004),(47126,'Sovot',4004),(47127,'Turpokkala',4004),(47128,'Urgenc',4004),(47129,'Beskent',4005),(47130,'Ceynau',4005),(47131,'Cirakci',4005),(47132,'Dehkanobod',4005),(47133,'Dinau',4005),(47134,'Guzor',4005),(47135,'Kallig',4005),(47136,'Kamasi',4005),(47137,'Karabag',4005),(47138,'Karsi',4005),(47139,'Kasbi',4005),(47140,'Kitob',4005),(47141,'Koson',4005),(47142,'Madaniyat',4005),(47143,'Maydayap',4005),(47144,'Maymanak',4005),(47145,'Muborak',4005),(47146,'Oktyabrskiy',4005),(47147,'Sahrisabz',4005),(47148,'Talimarcon',4005),(47149,'Urtacim',4005),(47150,'Yakkabog',4005),(47151,'Yaninison',4005),(47152,'Beruni',4006),(47153,'Buston',4006),(47154,'Cimboy',4006),(47155,'Halkobod',4006),(47156,'Hucayli',4006),(47157,'Karauzyak',4006),(47158,'Kegayli',4006),(47159,'Kizketken',4006),(47160,'Kozokdaryo',4006),(47161,'Kungirot',4006),(47162,'Mangit',4006),(47163,'Muynok',4006),(47164,'Nukus',4006),(47165,'Tahiatos',4006),(47166,'Tahtakupir',4006),(47167,'Turtkul',4006),(47168,'Aytim',4007),(47169,'Besbulok',4007),(47170,'Cartak',4007),(47171,'Cingeldi',4007),(47172,'Cust',4007),(47173,'Gozgon',4007),(47174,'Iskavat',4007),(47175,'Kalkuduk',4007),(47176,'Konimeh',4007),(47177,'Kosonsoy',4007),(47178,'Minbulok',4007),(47179,'Namangan',4007),(47180,'Nurota',4007),(47181,'Pop',4007),(47182,'Tomdibulok',4007),(47183,'Tosbulok',4007),(47184,'Turakurgon',4007),(47185,'Uckurgon',4007),(47186,'Unhoyat',4007),(47187,'Uyci',4007),(47188,'Uzunkuduk',4007),(47189,'Yanikurgon',4007),(47190,'Karmana',4008),(47191,'Kiziltepa',4008),(47192,'Navoi',4008),(47193,'Uckuduk',4008),(47194,'Zarafson',4008),(47195,'Bulungur',4009),(47196,'Camboy',4009),(47197,'Carhin',4009),(47198,'Celak',4009),(47199,'Cuma',4009),(47200,'Dahbed',4009),(47201,'Istihon',4009),(47202,'Kattakurgon',4009),(47203,'Kusrobod',4009),(47204,'Nurobod',4009),(47205,'Oktos',4009),(47206,'Paysanba',4009),(47207,'Samarkand',4009),(47208,'Superfosfatniy',4009),(47209,'Urgut',4009),(47210,'Yanirobod',4009),(47211,'Ziadin',4009),(47212,'Baht',4010),(47213,'Guliston',4010),(47214,'Hovos',4010),(47215,'Sirdare',4010),(47216,'Sirin',4010),(47217,'Yaniyer',4010),(47218,'Akkurgon',4011),(47219,'Boysun',4011),(47220,'Carkurgon',4011),(47221,'Denau',4011),(47222,'Kumkurgon',4011),(47223,'Paskurd',4011),(47224,'Sargun',4011),(47225,'Sariasiya',4011),(47226,'Serobod',4011),(47227,'Surci',4011),(47228,'Termiz',4011),(47229,'Zan',4011),(47230,'Almazar',4012),(47231,'Angren',4012),(47232,'Bekobod',4012),(47233,'Bektemir',4012),(47234,'Buka',4012),(47235,'Cinoz',4012),(47236,'Circik',4012),(47237,'Gazalkent',4012),(47238,'Iskandar',4012),(47239,'Keles',4012),(47240,'Kibray',4012),(47241,'Krasnogorskiy',4012),(47242,'Kuyluk',4012),(47243,'Ohangaron',4012),(47244,'Olmalik',4012),(47245,'Parkent',4012),(47246,'Pskent',4012),(47247,'Salar',4012),(47248,'Soldatski',4012),(47249,'Tashkent',4012),(47250,'Toskent',4012),(47251,'Tuytepa',4012),(47252,'Urtaaul',4012),(47253,'Yaniobod',4012),(47254,'Yaniyul',4012),(47255,'Lakatoro',4013),(47256,'Norsup',4013),(47257,'Longana',4014),(47258,'Luganville',4015),(47259,'Port Olry',4015),(47260,'Vila',4016),(47261,'Isangel',4017),(47262,'Sola',4018),(47263,'Puerto Ayacucho',4020),(47264,'Anaco',4021),(47265,'Barcelona',4021),(47266,'Cantaura',4021),(47267,'El Tigre',4021),(47268,'Puerto la Cruz',4021),(47269,'San Jose de Guanipa',4021),(47270,'Guasdualito',4022),(47271,'San Fernando',4022),(47272,'Cagua',4023),(47273,'El Limon',4023),(47274,'La Victoria',4023),(47275,'Las Teyerias',4023),(47276,'Maracay',4023),(47277,'Palo Negro',4023),(47278,'San Mateo',4023),(47279,'Turmero',4023),(47280,'Villa de Cura',4023),(47281,'Barinas',4024),(47282,'Barinitas',4024),(47283,'Ciudad Bolivar',4025),(47284,'Ciudad Guayana',4025),(47285,'Upata',4025),(47286,'Goaigoaza',4026),(47287,'Guacara',4026),(47288,'Guigue',4026),(47289,'Mariara',4026),(47290,'Moron',4026),(47291,'Puerto Cabello',4026),(47292,'San Joaquin',4026),(47293,'Tacarigua',4026),(47294,'Valencia',4026),(47295,'San Carlos',4027),(47296,'Tinaquillo',4027),(47297,'Coro',4030),(47298,'Punta Cardon',4030),(47299,'Punto Fijo',4030),(47300,'Altagracia de Orituco',4031),(47301,'Calabozo',4031),(47302,'San Juan de los Morros',4031),(47303,'Valle de la Pascua',4031),(47304,'Zaraza',4031),(47305,'Barquisimeto',4032),(47306,'Cabudare',4032),(47307,'Carora',4032),(47308,'El Tocuyo',4032),(47309,'Los Rastrojos',4032),(47310,'Quibor',4032),(47311,'Ejido',4033),(47312,'El Vigia',4033),(47313,'Merida',4033),(47314,'Baruta',4034),(47315,'Carrizal',4034),(47316,'Catia La Mar',4034),(47317,'Caucaguita',4034),(47318,'Chacao',4034),(47319,'Charallave',4034),(47320,'Cua',4034),(47321,'El Cafetal',4034),(47322,'El Hatillo',4034),(47323,'Filas de Mariche',4034),(47324,'Guarenas',4034),(47325,'Guatire',4034),(47326,'La Dolorita',4034),(47327,'Los Dos Caminos',4034),(47328,'Los Teques',4034),(47329,'Ocumare del Tuy',4034),(47330,'Petare',4034),(47331,'San Antonio de los Altos',4034),(47332,'Santa Teresa',4034),(47333,'Maturin',4035),(47334,'Acarigua',4037),(47335,'Araure',4037),(47336,'Guanare',4037),(47337,'Villa Bruzual',4037),(47338,'Carupano',4038),(47339,'Cumana',4038),(47340,'La Fria',4039),(47341,'Rubio',4039),(47342,'San Antonio del Tachira',4039),(47343,'San Cristobal',4039),(47344,'San Juan de Colon',4039),(47345,'Tariba',4039),(47346,'Trujillo',4040),(47347,'Valera',4040),(47348,'Caraballeda',4041),(47349,'La Guaira',4041),(47350,'Maiquetia',4041),(47351,'Chivacoa',4042),(47352,'Nirgua',4042),(47353,'San Felipe',4042),(47354,'Yaritagua',4042),(47355,'Bachaquero',4043),(47356,'Cabimas',4043),(47357,'Ciudad Ojeda',4043),(47358,'Lagunillas',4043),(47359,'Machiques',4043),(47360,'Maracaibo',4043),(47361,'San Carlos del Zulia',4043),(47362,'Santa Rita',4043),(47363,'Villa del Rosario',4043),(47364,'Ha noi',4053),(47365,'Hoang Mai',4053),(47366,'Lang Ha',4053),(47367,'Settlement',4064),(47368,'East End-Long Look',4066),(47369,'Road Town',4066),(47370,'West End',4066),(47371,'Kolia',4070),(47372,'Mala\'e',4070),(47373,'Ono',4070),(47374,'Poi',4070),(47375,'Tamana',4070),(47376,'Taoa',4070),(47377,'Tuatafa',4070),(47378,'Vele',4070),(47379,'Fiua',4071),(47380,'Leava',4071),(47381,'Nuku',4071),(47382,'Tavai',4071),(47383,'Toloke',4071),(47384,'Vaisei',4071),(47385,'Ahoa',4072),(47386,'Aka Aka',4072),(47387,'Alele',4072),(47388,'Falaleu',4072),(47389,'Gahi',4072),(47390,'Haafuasia',4072),(47391,'Haatofo',4072),(47392,'Halalo',4072),(47393,'Kolopopo',4072),(47394,'Lavegahau',4072),(47395,'Liku',4072),(47396,'Mala\'e',4072),(47397,'Malaefoou',4072),(47398,'Mata\'Utu',4072),(47399,'Teesi',4072),(47400,'Tepa',4072),(47401,'Utuofa',4072),(47402,'Vailala',4072),(47403,'Vaimalau',4072),(47404,'Vaitupu',4072),(47405,'ad-Dakhlah',4074),(47406,'al-\'Ayun',4075),(47407,'as-Samarah',4076),(47408,'\'Adan',4077),(47409,'Aden',4077),(47410,'Ahwar',4078),(47411,'Ja\'ar',4078),(47412,'Zinjibar',4078),(47413,'Dhamar',4079),(47414,'Shaqra\'',4080),(47415,'al-Mukalla',4080),(47416,'ash-Shahir',4080),(47417,'Hajjah',4081),(47418,'Hodaidah',4082),(47419,'Dhi Sufal',4083),(47420,'Ibb',4083),(47421,'Jiblah',4083),(47422,'Qa\'tabah',4083),(47423,'Yarim',4083),(47424,'Tuban',4084),(47425,'Ma\'rib',4085),(47426,'Sa\'dah',4087),(47427,'\'Amran',4088),(47428,'Sahar',4088),(47429,'Sanaa',4088),(47430,'Sayyan',4088),(47431,'\'Ataq',4089),(47432,'Habban',4089),(47433,'Taiz',4089),(47434,'Ta\'izz',4090),(47435,'al-Mukha',4090),(47436,'Raydah',4091),(47437,'al-Bayda',4091),(47438,'Bajil',4092),(47439,'Bayt-al-Faqih',4092),(47440,'Zabid',4092),(47441,'al-Hudaydah',4092),(47442,'al-Marawi\'ah',4092),(47443,'az-Zaydiyah',4092),(47444,'al-Hazm',4093),(47445,'al-Ghaydah',4094),(47446,'Mahwit',4095),(47447,'Nikshic',4098),(47448,'Pljevlja',4098),(47449,'Podgorica',4098),(47450,'Ulcinj',4098),(47451,'Gjakove',4100),(47452,'Novi Banovci',4100),(47453,'Senta',4100),(47454,'Serbia',4100),(47455,'Uzice',4100),(47456,'Ada',4101),(47457,'Alibunar',4101),(47458,'Apatin',4101),(47459,'Bach',4101),(47460,'Bachka Palanka',4101),(47461,'Bachka Petrovac',4101),(47462,'Bachka Topola',4101),(47463,'Bachki Jarak',4101),(47464,'Banacki Karlovac',4101),(47465,'Bechej',4101),(47466,'Bela Crkva',4101),(47467,'Beochin',4101),(47468,'Choka',4101),(47469,'Churug',4101),(47470,'Crvenka',4101),(47471,'Futog',4101),(47472,'Indhija',4101),(47473,'Irig',4101),(47474,'Kac',4101),(47475,'Kanjizha',4101),(47476,'Kikinda',4101),(47477,'Kovachica',4101),(47478,'Kovin',4101),(47479,'Kula',4101),(47480,'Mol',4101),(47481,'Nova Pazova',4101),(47482,'Novi Bechej',4101),(47483,'Novi Knezhevac',4101),(47484,'Novi Sad',4101),(47485,'Odzhaci',4101),(47486,'Pacarak',4101),(47487,'Palic',4101),(47488,'Panchevo',4101),(47489,'Petrovaradin',4101),(47490,'Ruma',4101),(47491,'Senta',4101),(47492,'Shid',4101),(47493,'Sivac',4101),(47494,'Sombor',4101),(47495,'Srbobran',4101),(47496,'Sremska Kamenica',4101),(47497,'Sremska Mitrovica',4101),(47498,'Sremski Karlovci',4101),(47499,'Stara Pazova',4101),(47500,'Subotica',4101),(47501,'Temerin',4101),(47502,'Veternik',4101),(47503,'Vrbas',4101),(47504,'Vrshac',4101),(47505,'Zhabalj',4101),(47506,'Zhitishte',4101),(47507,'Zrenjanin',4101),(47508,'Kabwe',4102),(47509,'Kapiri Mposhi',4102),(47510,'Mkushi',4102),(47511,'Mumbwa',4102),(47512,'Serenje',4102),(47513,'Chambishi',4103),(47514,'Chililabombwe',4103),(47515,'Chingola',4103),(47516,'Kalulushi',4103),(47517,'Kitwe',4103),(47518,'Luanshya',4103),(47519,'Mpongwe',4103),(47520,'Mufulira',4103),(47521,'Ndola',4103),(47522,'Chipata',4104),(47523,'Katete',4104),(47524,'Lundazi',4104),(47525,'Petauke',4104),(47526,'Mansa',4105),(47527,'Mwansabombwe',4105),(47528,'Nchelenge',4105),(47529,'Samfya',4105),(47530,'Chilanga',4106),(47531,'Kafue',4106),(47532,'Lusaka',4106),(47533,'Kalengwa',4107),(47534,'Kansanshi',4107),(47535,'Mwinilunga',4107),(47536,'Solwezi',4107),(47537,'Zambezi',4107),(47538,'Chinsali',4108),(47539,'Isoka',4108),(47540,'Kasama',4108),(47541,'Mbala',4108),(47542,'Mpika',4108),(47543,'Choma',4109),(47544,'Itezhi-Tezhi',4109),(47545,'Kalomo',4109),(47546,'Livingstone',4109),(47547,'Maamba',4109),(47548,'Mazabuka',4109),(47549,'Monze',4109),(47550,'Nakambala',4109),(47551,'Siavonga',4109),(47552,'Kalabo',4110),(47553,'Kaoma',4110),(47554,'Limulunga',4110),(47555,'Mongu',4110),(47556,'Senanga',4110),(47557,'Sesheke',4110),(47558,'Bulawayo',4111),(47559,'Chitungwiza',4112),(47560,'Harare',4112),(47561,'Chimanimani',4113),(47562,'Chipinge',4113),(47563,'Mutare',4113),(47564,'Nyanga',4113),(47565,'Rusape',4113),(47566,'Sakubva',4113),(47567,'Chiredzi',4117),(47568,'Gaths',4117),(47569,'Masvingo',4117),(47570,'Chivhu',4120),(47571,'Gweru',4120),(47572,'Kwekwe',4120),(47573,'Mvuma',4120),(47574,'Redcliffe',4120),(47575,'Shurugwi',4120),(47576,'Zvishavane',4120),(47577,'Manchester',3952),(47578,'Nashua',3952),(47579,'Concord',3952),(47580,'Derry',3952),(47581,'Dover',3952),(47582,'Rochester',3952),(47583,'Salem',3952),(47584,'Merrimack',3952),(47585,'Hudson',3952),(47586,'Londonderry',3952),(47587,'Keene',3952),(47588,'Bedford',3952),(47589,'Portsmouth',3952),(47590,'Goffstown',3952),(47591,'Laconia',3952),(47592,'Hampton',3952),(47593,'Milford',3952),(47594,'Durham',3952),(47595,'Exeter',3952),(47596,'Windham',3952),(47597,'Hooksett',3952),(47598,'Claremont',3952),(47599,'Lebanon',3952),(47600,'Pelham',3952),(47601,'Somersworth',3952),(47602,'Hanover',3952),(47603,'Amherst',3952),(47604,'Raymond',3952),(47605,'Conway',3952),(47606,'Berlin',3952),(47607,'Newmarket',3952),(47608,'Weare',3952),(47609,'Seabrook',3952),(47610,'Barrington',3952),(47611,'Hampstead',3952),(47612,'Franklin',3952),(47613,'Litchfield',3952),(47614,'Hollis',3952),(47615,'Plaistow',3952),(47616,'Bow',3952),(47617,'Belmont',3952),(47618,'Stratham',3952),(47619,'Swanzey',3952),(47620,'Gilford',3952),(47621,'Pembroke',3952),(47622,'Plymouth',3952),(47623,'Farmington',3952),(47624,'Atkinson',3952),(47625,'Newport',3952),(47626,'Epping',3952),(47627,'Peterborough',3952),(47628,'Wolfeboro',3952),(47629,'Meredith',3952),(47630,'Kingston',3952),(47631,'Rindge',3952),(47632,'Hillsborough',3952),(47633,'Newark',3953),(47634,'Jersey City',3953),(47635,'Paterson',3953),(47636,'Elizabeth',3953),(47637,'Edison',3953),(47638,'Woodbridge',3953),(47639,'Lakewood',3953),(47640,'Toms River',3953),(47641,'Hamilton',3953),(47642,'Trenton',3953),(47643,'Clifton',3953),(47644,'Camden',3953),(47645,'Brick',3953),(47646,'Cherry Hill',3953),(47647,'Passaic',3953),(47648,'Middletown',3953),(47649,'Union City',3953),(47650,'Old Bridge',3953),(47651,'Gloucester Township',3953),(47652,'East Orange',3953),(47653,'Bayonne',3953),(47654,'Franklin',3953),(47655,'North Bergen',3953),(47656,'Vineland',3953),(47657,'Union',3953),(47658,'Piscataway',3953),(47659,'New Brunswick',3953),(47660,'Jackson',3953),(47661,'Wayne',3953),(47662,'Irvington',3953),(47663,'Parsippany-Troy Hills',3953),(47664,'Howell',3953),(47665,'Perth Amboy',3953),(47666,'Hoboken',3953),(47667,'Plainfield',3953),(47668,'West New York',3953),(47669,'Washington Township',3953),(47670,'East Brunswick',3953),(47671,'Bloomfield',3953),(47672,'West Orange',3953),(47673,'Evesham',3953),(47674,'Bridgewater',3953),(47675,'South Brunswick',3953),(47676,'Egg Harbor',3953),(47677,'Manchester',3953),(47678,'Hackensack',3953),(47679,'Sayreville',3953),(47680,'Mount Laurel',3953),(47681,'Berkeley',3953),(47682,'North Brunswick',3953),(47683,'Kearny',3953),(47684,'Linden',3953),(47685,'Marlboro',3953),(47686,'Teaneck',3953),(47687,'Atlantic City',3953),(47688,'Winslow',3953),(47689,'Monroe',3953),(47690,'Manalapan',3953),(47691,'Hillsborough',3953),(47692,'Montclair',3953),(47693,'Galloway',3953),(47694,'Freehold Township',3953),(47695,'Monroe Township',3953),(47696,'Belleville',3953),(47697,'Pennsauken',3953),(47698,'Ewing',3953),(47699,'Fort Lee',3953),(47700,'Lawrence',3953),(47701,'Fair Lawn',3953),(47702,'Willingboro',3953),(47703,'Long Branch',3953),(47704,'Deptford',3953),(47705,'Garfield',3953),(47706,'Westfield',3953),(47707,'City of Orange',3953),(47708,'Livingston',3953),(47709,'Voorhees',3953),(47710,'Princeton',3953),(47711,'Millville',3953),(47712,'Nutley',3953),(47713,'Mount Olive',3953),(47714,'Neptune',3953),(47715,'Pemberton Township',3953),(47716,'Lacey',3953),(47717,'Rahway',3953),(47718,'Ocean Township',3953),(47719,'East Windsor',3953),(47720,'West Windsor',3953),(47721,'Englewood',3953),(47722,'Bergenfield',3953),(47723,'Bernards Township',3953),(47724,'Stafford Township',3953),(47725,'Hamilton Township',3953),(47726,'Paramus',3953),(47727,'Wall',3953),(47728,'Mahwah',3953),(47729,'West Milford',3953),(47730,'Randolph',3953),(47731,'Bridgeton',3953),(47732,'Ridgewood',3953),(47733,'Rockaway Township',3953),(47734,'Lodi',3953),(47735,'Vernon',3953),(47736,'Maplewood',3953),(47737,'Cliffside Park',3953),(47738,'Scotch Plains',3953),(47739,'South Plainfield',3953),(47740,'Roxbury',3953),(47741,'Medford',3953),(47742,'Plainsboro',3953),(47743,'Lower Township',3953),(47744,'Carteret',3953),(47745,'Cranford',3953),(47746,'Burlington Township',3953),(47747,'Morris Township',3953),(47748,'Montgomery',3953),(47749,'Raritan Township',3953),(47750,'North Plainfield',3953),(47751,'West Deptford',3953),(47752,'Montville',3953),(47753,'Summit',3953),(47754,'Hillside',3953),(47755,'Jefferson',3953),(47756,'Roselle',3953),(47757,'Barnegat',3953),(47758,'Moorestown',3953),(47759,'Lyndhurst',3953),(47760,'Hazlet',3953),(47761,'Pleasantville',3953),(47762,'Millburn',3953),(47763,'Little Egg Harbor',3953),(47764,'Sparta',3953),(47765,'Palisades Park',3953),(47766,'Elmwood Park',3953),(47767,'Maple Shade',3953),(47768,'Middle Township',3953),(47769,'Hawthorne',3953),(47770,'Glassboro',3953),(47771,'Washington Township',3953),(47772,'Morristown',3953),(47773,'Point Pleasant',3953),(47774,'Aberdeen',3953),(47775,'Dover',3953),(47776,'Rutherford',3953),(47777,'Tinton Falls',3953),(47778,'Lindenwold',3953),(47779,'Dumont',3953),(47780,'Hopewell Township',3953),(47781,'Delran',3953),(47782,'Franklin Township',3953),(47783,'Holmdel',3953),(47784,'Wyckoff',3953),(47785,'Denville',3953),(47786,'New Milford',3953),(47787,'Secaucus',3953),(47788,'South Orange Village',3953),(47789,'Readington',3953),(47790,'Asbury Park',3953),(47791,'South River',3953),(47792,'Madison',3953),(47793,'Springfield',3953),(47794,'Cinnaminson',3953),(47795,'Pequannock',3953),(47796,'North Arlington',3953),(47797,'Warren',3953),(47798,'Mantua',3953),(47799,'Hopatcong',3953),(47800,'Phillipsburg',3953),(47801,'Hammonton',3953),(47802,'Clark',3953),(47803,'Haddon Township',3953),(47804,'Tenafly',3953),(47805,'Ramsey',3953),(47806,'Branchburg',3953),(47807,'Little Falls',3953),(47808,'Highland Park',3953),(47809,'Collingswood',3953),(47810,'Fairview',3953),(47811,'Hanover',3953),(47812,'Saddle Brook',3953),(47813,'Robbinsville',3953),(47814,'Middlesex',3953),(47815,'Harrison',3953),(47816,'Metuchen',3953),(47817,'Clinton Township',3953),(47818,'Pennsville',3953),(47819,'Verona',3953),(47820,'Albuquerque',3955),(47821,'Las Cruces',3955),(47822,'Rio Rancho',3955),(47823,'Santa Fe',3955),(47824,'Roswell',3955),(47825,'Farmington',3955),(47826,'South Valley',3955),(47827,'Clovis',3955),(47828,'Hobbs',3955),(47829,'Alamogordo',3955),(47830,'Carlsbad',3955),(47831,'Gallup',3955),(47832,'Deming',3955),(47833,'Los Lunas',3955),(47834,'Chaparral',3955),(47835,'Sunland Park',3955),(47836,'Las Vegas',3955),(47837,'Portales',3955),(47838,'Los Alamos',3955),(47839,'North Valley',3955),(47840,'Artesia',3955),(47841,'Lovington',3955),(47842,'Silver City',3955),(47843,'Espanola',3955),(47844,'Anthony',3955),(47845,'Grants',3955),(47846,'Socorro',3955),(47847,'Corrales',3955),(47848,'Bernalillo',3955),(47849,'Shiprock',3955),(47850,'Bloomfield',3955),(47851,'Ruidoso',3955),(47852,'Kirtland',3955),(47853,'Belen',3955),(47854,'Airmont',3956),(47855,'Albany',3956),(47856,'Alden',3956),(47857,'Amherst',3956),(47858,'Amityville',3956),(47859,'Amsterdam',3956),(47860,'Arcadia',3956),(47861,'Auburn',3956),(47862,'Aurora',3956),(47863,'Babylon',3956),(47864,'Baldwinsville',3956),(47865,'Ballston',3956),(47866,'Batavia',3956),(47867,'Bath',3956),(47868,'Beacon',3956),(47869,'Bedford',3956),(47870,'Beekman',3956),(47871,'Bethlehem',3956),(47872,'Binghamton',3956),(47873,'Blooming Grove',3956),(47874,'Briarcliff Manor',3956),(47875,'Brighton',3956),(47876,'Brockport',3956),(47877,'Brookhaven',3956),(47878,'Brunswick',3956),(47879,'Buffalo',3956),(47880,'Camillus',3956),(47881,'Canandaigua',3956),(47882,'Canton',3956),(47883,'Carmel',3956),(47884,'Catskill',3956),(47885,'Cheektowaga',3956),(47886,'Chenango',3956),(47887,'Chester',3956),(47888,'Chestnut Ridge',3956),(47889,'Chili',3956),(47890,'Cicero',3956),(47891,'Clarence',3956),(47892,'Clarkstown',3956),(47893,'Clay',3956),(47894,'Clifton Park',3956),(47895,'Cohoes',3956),(47896,'Colonie',3956),(47897,'Corning',3956),(47898,'Cornwall',3956),(47899,'Cortland',3956),(47900,'Cortlandt',3956),(47901,'Crawford',3956),(47902,'Croton-on-Hudson',3956),(47903,'Depew',3956),(47904,'DeWitt (De Witt)',3956),(47905,'Dobbs Ferry',3956),(47906,'Dryden',3956),(47907,'Dunkirk',3956),(47908,'East Fishkill',3956),(47909,'East Greenbush',3956),(47910,'East Hampton',3956),(47911,'East Hills',3956),(47912,'East Rockaway',3956),(47913,'Eastchester',3956),(47914,'Elma',3956),(47915,'Elmira',3956),(47916,'Endicott',3956),(47917,'Esopus',3956),(47918,'Evans',3956),(47919,'Fallsburg',3956),(47920,'Farmingdale',3956),(47921,'Farmington',3956),(47922,'Fishkill',3956),(47923,'Floral Park',3956),(47924,'Fredonia',3956),(47925,'Freeport',3956),(47926,'Fulton',3956),(47927,'Garden City',3956),(47928,'Gates',3956),(47929,'Geddes',3956),(47930,'Geneseo',3956),(47931,'Geneva',3956),(47932,'German Flatts',3956),(47933,'Glen Cove',3956),(47934,'Glens Falls',3956),(47935,'Glenville',3956),(47936,'Gloversville',3956),(47937,'Goshen',3956),(47938,'Grand Island',3956),(47939,'Great Neck',3956),(47940,'Greece',3956),(47941,'Greenburgh',3956),(47942,'Guilderland',3956),(47943,'Halfmoon',3956),(47944,'Hamburg',3956),(47945,'Hamlin',3956),(47946,'Harrison',3956),(47947,'Hastings',3956),(47948,'Hastings-on-Hudson',3956),(47949,'Haverstraw',3956),(47950,'Hempstead',3956),(47951,'Henrietta',3956),(47952,'Herkimer',3956),(47953,'Highlands',3956),(47954,'Hornell',3956),(47955,'Horseheads',3956),(47956,'Hudson',3956),(47957,'Hudson Falls',3956),(47958,'Huntington',3956),(47959,'Hyde Park',3956),(47960,'Ilion',3956),(47961,'Irondequoit',3956),(47962,'Islip',3956),(47963,'Ithaca',3956),(47964,'Jamestown',3956),(47965,'Johnson City',3956),(47966,'Johnstown',3956),(47967,'Kenmore',3956),(47968,'Kent',3956),(47969,'Kingsbury',3956),(47970,'Kingston',3956),(47971,'Kirkland',3956),(47972,'Kiryas Joel',3956),(47973,'Lackawanna',3956),(47974,'LaGrange (La Grange)',3956),(47975,'Lake Grove',3956),(47976,'Lancaster',3956),(47977,'Lansing',3956),(47978,'Le Ray',3956),(47979,'Lenox',3956),(47980,'Lewisboro',3956),(47981,'Lewiston',3956),(47982,'Liberty',3956),(47983,'Lindenhurst',3956),(47984,'Little Falls',3956),(47985,'Lloyd',3956),(47986,'Lockport',3956),(47987,'Long Beach',3956),(47988,'Lynbrook',3956),(47989,'Lysander',3956),(47990,'Macedon',3956),(47991,'Malone',3956),(47992,'Malta',3956),(47993,'Malverne',3956),(47994,'Mamakating',3956),(47995,'Mamaroneck',3956),(47996,'Manchester',3956),(47997,'Manlius',3956),(47998,'Massapequa Park',3956),(47999,'Massena',3956),(48000,'Mastic Beach',3956),(48001,'Mechanicville',3956),(48002,'Mendon',3956),(48003,'Middletown',3956),(48004,'Milton',3956),(48005,'Mineola',3956),(48006,'Monroe',3956),(48007,'Montgomery',3956),(48008,'Moreau',3956),(48009,'Mount Kisco',3956),(48010,'Mount Pleasant',3956),(48011,'Mount Vernon',3956),(48012,'New Castle',3956),(48013,'New Hartford',3956),(48014,'New Hyde Park',3956),(48015,'New Paltz',3956),(48016,'New Rochelle',3956),(48017,'New Square',3956),(48018,'New Windsor',3956),(48019,'New York',3956),(48020,'Newark',3956),(48021,'Newburgh',3956),(48022,'Newfane',3956),(48023,'Niagara Falls',3956),(48024,'Niskayuna',3956),(48025,'North Castle',3956),(48026,'North Greenbush',3956),(48027,'North Hempstead',3956),(48028,'North Syracuse',3956),(48029,'North Tonawanda',3956),(48030,'Northport',3956),(48031,'Norwich',3956),(48032,'Nyack',3956),(48033,'Ogden',3956),(48034,'Ogdensburg',3956),(48035,'Olean',3956),(48036,'Oneida',3956),(48037,'Oneonta',3956),(48038,'Onondaga',3956),(48039,'Ontario',3956),(48040,'Orangetown',3956),(48041,'Orchard Park',3956),(48042,'Ossining',3956),(48043,'Oswego',3956),(48044,'Owego',3956),(48045,'Oyster Bay',3956),(48046,'Parma',3956),(48047,'Patchogue',3956),(48048,'Patterson',3956),(48049,'Peekskill',3956),(48050,'Pelham',3956),(48051,'Penfield',3956),(48052,'Perinton',3956),(48053,'Philipstown',3956),(48054,'Pittsford',3956),(48055,'Plattekill',3956),(48056,'Plattsburgh',3956),(48057,'Pleasant Valley',3956),(48058,'Pleasantville',3956),(48059,'Pomfret',3956),(48060,'Port Chester',3956),(48061,'Port Jefferson',3956),(48062,'Port Jervis',3956),(48063,'Potsdam',3956),(48064,'Poughkeepsie',3956),(48065,'Putnam Valley',3956),(48066,'Queensbury',3956),(48067,'Ramapo',3956),(48068,'Red Hook',3956),(48069,'Rensselaer',3956),(48070,'Riverhead',3956),(48071,'Rochester',3956),(48072,'Rockville Centre',3956),(48073,'Rome',3956),(48074,'Rotterdam',3956),(48075,'Rye',3956),(48076,'Rye Brook',3956),(48077,'Salamanca',3956),(48078,'Salina',3956),(48079,'Saratoga Springs',3956),(48080,'Saugerties',3956),(48081,'Scarsdale',3956),(48082,'Schenectady',3956),(48083,'Schodack',3956),(48084,'Scotia',3956),(48085,'Seneca Falls',3956),(48086,'Shawangunk',3956),(48087,'Sherrill',3956),(48088,'Sleepy Hollow',3956),(48089,'Smithtown',3956),(48090,'Somers',3956),(48091,'Southampton',3956),(48092,'Southeast',3956),(48093,'Southold',3956),(48094,'Southport',3956),(48095,'Spring Valley',3956),(48096,'Stony Point',3956),(48097,'Suffern',3956),(48098,'Sullivan',3956),(48099,'Sweden',3956),(48100,'Syracuse',3956),(48101,'Tarrytown',3956),(48102,'Thompson',3956),(48103,'Tonawanda',3956),(48104,'Troy',3956),(48105,'Ulster',3956),(48106,'Union',3956),(48107,'Utica',3956),(48108,'Valley Stream',3956),(48109,'Van Buren',3956),(48110,'Vestal',3956),(48111,'Victor',3956),(48112,'Walden',3956),(48113,'Wallkill',3956),(48114,'Walworth',3956),(48115,'Wappinger',3956),(48116,'Warwick',3956),(48117,'Watertown',3956),(48118,'Watervliet',3956),(48119,'Wawarsing',3956),(48120,'Webster',3956),(48121,'West Haverstraw',3956),(48122,'West Seneca',3956),(48123,'Westbury',3956),(48124,'Wheatfield',3956),(48125,'White Plains',3956),(48126,'Whitestown',3956),(48127,'Williston Park',3956),(48128,'Wilton',3956),(48129,'Woodbury',3956),(48130,'Yonkers',3956),(48131,'Yorktown',3956),(48132,'Charlotte',3957),(48133,'Raleigh',3957),(48134,'Greensboro',3957),(48135,'Durham',3957),(48136,'Winston-Salem',3957),(48137,'Fayetteville',3957),(48138,'Cary',3957),(48139,'Wilmington',3957),(48140,'High Point',3957),(48141,'Greenville',3957),(48142,'Asheville',3957),(48143,'Concord',3957),(48144,'Gastonia',3957),(48145,'Jacksonville',3957),(48146,'Chapel Hill',3957),(48147,'Rocky Mount',3957),(48148,'Burlington',3957),(48149,'Huntersville',3957),(48150,'Wilson',3957),(48151,'Kannapolis',3957),(48152,'Apex',3957),(48153,'Hickory',3957),(48154,'Wake Forest',3957),(48155,'Indian Trail',3957),(48156,'Goldsboro',3957),(48157,'Mooresville',3957),(48158,'Monroe',3957),(48159,'Salisbury',3957),(48160,'New Bern',3957),(48161,'Holly Springs',3957),(48162,'Matthews',3957),(48163,'Sanford',3957),(48164,'Garner',3957),(48165,'Cornelius',3957),(48166,'Thomasville',3957),(48167,'Asheboro',3957),(48168,'Statesville',3957),(48169,'Mint Hill',3957),(48170,'Kernersville',3957),(48171,'Morrisville',3957),(48172,'Fuquay-Varina',3957),(48173,'Lumberton',3957),(48174,'Kinston',3957),(48175,'Carrboro',3957),(48176,'Havelock',3957),(48177,'Shelby',3957),(48178,'Clemmons',3957),(48179,'Lexington',3957),(48180,'Clayton',3957),(48181,'Boone',3957),(48182,'Fargo',3958),(48183,'Bismarck',3958),(48184,'Grand Forks',3958),(48185,'Minot',3958),(48186,'West Fargo',3958),(48187,'Williston',3958),(48188,'Dickinson',3958),(48189,'Mandan',3958),(48190,'Jamestown',3958),(48191,'Wahpeton',3958),(48192,'Devils Lake',3958),(48193,'Valley City',3958),(48194,'Providence',3965),(48195,'Warwick',3965),(48196,'Cranston',3965),(48197,'Pawtucket',3965),(48198,'East Providence',3965),(48199,'Woonsocket',3965),(48200,'Coventry',3965),(48201,'Cumberland',3965),(48202,'North Providence',3965),(48203,'South Kingstown',3965),(48204,'West Warwick',3965),(48205,'Johnston',3965),(48206,'North Kingstown',3965),(48207,'Newport',3965),(48208,'Bristol',3965),(48209,'Westerly',3965),(48210,'Smithfield',3965),(48211,'Lincoln',3965),(48212,'Central Falls',3965),(48213,'Portsmouth',3965),(48214,'Barrington',3965),(48215,'Middletown',3965),(48216,'Burrillville',3965),(48217,'Narragansett',3965),(48218,'Tiverton',3965),(48219,'East Greenwich',3965),(48220,'North Smithfield',3965),(48221,'Warren',3965),(48222,'Scituate',3965),(48223,'Glocester',3965),(48224,'Hopkinton',3965),(48225,'Charlestown',3965),(48226,'Richmond',3965),(48227,'Columbia',3966),(48228,'Charleston',3966),(48229,'North Charleston',3966),(48230,'Mount Pleasant',3966),(48231,'Rock Hill',3966),(48232,'Greenville',3966),(48233,'Summerville',3966),(48234,'Sumter',3966),(48235,'Hilton Head Island',3966),(48236,'Spartanburg',3966),(48237,'Florence',3966),(48238,'Goose Creek',3966),(48239,'Aiken',3966),(48240,'Myrtle Beach',3966),(48241,'Anderson',3966),(48242,'Greer',3966),(48243,'Mauldin',3966),(48244,'Greenwood',3966),(48245,'North Augusta',3966),(48246,'Easley',3966),(48247,'Simpsonville',3966),(48248,'Hanahan',3966),(48249,'Lexington',3966),(48250,'Conway',3966),(48251,'West Columbia',3966),(48252,'North Myrtle Beach',3966),(48253,'Clemson',3966),(48254,'Orangeburg',3966),(48255,'Cayce',3966),(48256,'Bluffton',3966),(48257,'Beaufort',3966),(48258,'Gaffney',3966),(48259,'Irmo',3966),(48260,'Fort Mill',3966),(48261,'Port Royal',3966),(48262,'Forest Acres',3966),(48263,'Newberry',3966),(48264,'Sioux Falls',3967),(48265,'Rapid City',3967),(48266,'Aberdeen',3967),(48267,'Brookings',3967),(48268,'Watertown',3967),(48269,'Mitchell',3967),(48270,'Yankton',3967),(48271,'Pierre',3967),(48272,'Huron',3967),(48273,'Spearfish',3967),(48274,'Vermillion',3967),(48275,'Brandon',3967),(48276,'Box Elder',3967),(48277,'Madison',3967),(48278,'Sturgis',3967),(48279,'Belle Fourche',3967),(48280,'Harrisburg',3967),(48281,'Charleston',3976),(48282,'Huntington',3976),(48283,'Morgantown',3976),(48284,'Parkersburg',3976),(48285,'Wheeling',3976),(48286,'Weirton',3976),(48287,'Fairmont',3976),(48288,'Martinsburg',3976),(48289,'Beckley',3976),(48290,'Clarksburg',3976),(48291,'South Charleston',3976),(48292,'St. Albans',3976),(48293,'Vienna',3976),(48294,'Bluefield',3976),(48295,'Moundsville',3976),(48296,'Bridgeport',3976),(48297,'Oak Hill',3976),(48298,'Dunbar',3976),(48299,'Elkins',3976),(48300,'Nitro',3976),(48301,'Hurricane',3976),(48302,'Princeton',3976),(48303,'Charles Town',3976),(48304,'Buckhannon',3976),(48305,'Keyser',3976),(48306,'New Martinsville',3976),(48307,'Grafton',3976),(48308,'Ranson',3976),(48309,'Point Pleasant',3976),(48310,'Westover',3976),(48311,'Weston',3976),(48312,'Lewisburg',3976),(48313,'Ravenswood',3976),(48314,'Summersville',3976),(48315,'Alcala',805),(48316,'Andalucia',805),(48317,'Ansermanuevo',805),(48318,'Argelia',805),(48319,'Bolivar',805),(48320,'Buenaventura',805),(48321,'Buga',805),(48322,'Bugalagrande',805),(48323,'Caicedonia',805),(48324,'Cali',805),(48325,'Calima - El Darien',805),(48326,'Candelaria',805),(48327,'Cartago',805),(48328,'Dagua',805),(48329,'El Aguila',805),(48330,'El Cairo',805),(48331,'El Cerrito',805),(48332,'El Dovio',805),(48333,'Florida',805),(48334,'Ginebra',805),(48335,'Guacari',805),(48336,'Jamundi',805),(48337,'La Cumbre',805),(48338,'La Union',805),(48339,'La Victoria',805),(48340,'Obando',805),(48341,'Palmira',805),(48342,'Pradera',805),(48343,'Restrepo',805),(48344,'Riofrio',805),(48345,'Roldanillo',805),(48346,'San Pedro',805),(48347,'Sevilla',805),(48348,'Toro',805),(48349,'Trujillo',805),(48350,'Tulua',805),(48351,'Ulloa',805),(48352,'Versalles',805),(48353,'Vijes',805),(48354,'Yotoco',805),(48355,'Yumbo',805),(48356,'Zarzal',805),(48357,'Kenmore',18);
/*!40000 ALTER TABLE `city_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `code` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_code` int(11) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('INDA','INDIA',91,'IN');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_master`
--

LOCK TABLES `country_master` WRITE;
/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` VALUES (1,'AF','Afghanistan',93),(2,'AL','Albania',355),(3,'DZ','Algeria',213),(4,'AS','American Samoa',1684),(5,'AD','Andorra',376),(6,'AO','Angola',244),(7,'AI','Anguilla',1264),(8,'AQ','Antarctica',0),(9,'AG','Antigua And Barbuda',1268),(10,'AR','Argentina',54),(11,'AM','Armenia',374),(12,'AW','Aruba',297),(13,'AU','Australia',61),(14,'AT','Austria',43),(15,'AZ','Azerbaijan',994),(16,'BS','Bahamas The',1242),(17,'BH','Bahrain',973),(18,'BD','Bangladesh',880),(19,'BB','Barbados',1246),(20,'BY','Belarus',375),(21,'BE','Belgium',32),(22,'BZ','Belize',501),(23,'BJ','Benin',229),(24,'BM','Bermuda',1441),(25,'BT','Bhutan',975),(26,'BO','Bolivia',591),(27,'BA','Bosnia and Herzegovina',387),(28,'BW','Botswana',267),(29,'BV','Bouvet Island',0),(30,'BR','Brazil',55),(31,'IO','British Indian Ocean Territory',246),(32,'BN','Brunei',673),(33,'BG','Bulgaria',359),(34,'BF','Burkina Faso',226),(35,'BI','Burundi',257),(36,'KH','Cambodia',855),(37,'CM','Cameroon',237),(38,'CA','Canada',1),(39,'CV','Cape Verde',238),(40,'KY','Cayman Islands',1345),(41,'CF','Central African Republic',236),(42,'TD','Chad',235),(43,'CL','Chile',56),(44,'CN','China',86),(45,'CX','Christmas Island',61),(46,'CC','Cocos (Keeling) Islands',672),(47,'CO','Colombia',57),(48,'KM','Comoros',269),(49,'CG','Republic Of The Congo',242),(50,'CD','Democratic Republic Of The Congo',242),(51,'CK','Cook Islands',682),(52,'CR','Costa Rica',506),(53,'CI','Cote D\'Ivoire (Ivory Coast)',225),(54,'HR','Croatia (Hrvatska)',385),(55,'CU','Cuba',53),(56,'CY','Cyprus',357),(57,'CZ','Czech Republic',420),(58,'DK','Denmark',45),(59,'DJ','Djibouti',253),(60,'DM','Dominica',1767),(61,'DO','Dominican Republic',1809),(62,'TP','East Timor',670),(63,'EC','Ecuador',593),(64,'EG','Egypt',20),(65,'SV','El Salvador',503),(66,'GQ','Equatorial Guinea',240),(67,'ER','Eritrea',291),(68,'EE','Estonia',372),(69,'ET','Ethiopia',251),(70,'XA','External Territories of Australia',61),(71,'FK','Falkland Islands',500),(72,'FO','Faroe Islands',298),(73,'FJ','Fiji Islands',679),(74,'FI','Finland',358),(75,'FR','France',33),(76,'GF','French Guiana',594),(77,'PF','French Polynesia',689),(78,'TF','French Southern Territories',0),(79,'GA','Gabon',241),(80,'GM','Gambia The',220),(81,'GE','Georgia',995),(82,'DE','Germany',49),(83,'GH','Ghana',233),(84,'GI','Gibraltar',350),(85,'GR','Greece',30),(86,'GL','Greenland',299),(87,'GD','Grenada',1473),(88,'GP','Guadeloupe',590),(89,'GU','Guam',1671),(90,'GT','Guatemala',502),(91,'XU','Guernsey and Alderney',44),(92,'GN','Guinea',224),(93,'GW','Guinea-Bissau',245),(94,'GY','Guyana',592),(95,'HT','Haiti',509),(96,'HM','Heard and McDonald Islands',0),(97,'HN','Honduras',504),(98,'HK','Hong Kong S.A.R.',852),(99,'HU','Hungary',36),(100,'IS','Iceland',354),(101,'IN','India',91),(102,'ID','Indonesia',62),(103,'IR','Iran',98),(104,'IQ','Iraq',964),(105,'IE','Ireland',353),(106,'IL','Israel',972),(107,'IT','Italy',39),(108,'JM','Jamaica',1876),(109,'JP','Japan',81),(110,'XJ','Jersey',44),(111,'JO','Jordan',962),(112,'KZ','Kazakhstan',7),(113,'KE','Kenya',254),(114,'KI','Kiribati',686),(115,'KP','Korea North',850),(116,'KR','Korea South',82),(117,'KW','Kuwait',965),(118,'KG','Kyrgyzstan',996),(119,'LA','Laos',856),(120,'LV','Latvia',371),(121,'LB','Lebanon',961),(122,'LS','Lesotho',266),(123,'LR','Liberia',231),(124,'LY','Libya',218),(125,'LI','Liechtenstein',423),(126,'LT','Lithuania',370),(127,'LU','Luxembourg',352),(128,'MO','Macau S.A.R.',853),(129,'MK','Macedonia',389),(130,'MG','Madagascar',261),(131,'MW','Malawi',265),(132,'MY','Malaysia',60),(133,'MV','Maldives',960),(134,'ML','Mali',223),(135,'MT','Malta',356),(136,'XM','Man (Isle of)',44),(137,'MH','Marshall Islands',692),(138,'MQ','Martinique',596),(139,'MR','Mauritania',222),(140,'MU','Mauritius',230),(141,'YT','Mayotte',269),(142,'MX','Mexico',52),(143,'FM','Micronesia',691),(144,'MD','Moldova',373),(145,'MC','Monaco',377),(146,'MN','Mongolia',976),(147,'MS','Montserrat',1664),(148,'MA','Morocco',212),(149,'MZ','Mozambique',258),(150,'MM','Myanmar',95),(151,'NA','Namibia',264),(152,'NR','Nauru',674),(153,'NP','Nepal',977),(154,'AN','Netherlands Antilles',599),(155,'NL','Netherlands The',31),(156,'NC','New Caledonia',687),(157,'NZ','New Zealand',64),(158,'NI','Nicaragua',505),(159,'NE','Niger',227),(160,'NG','Nigeria',234),(161,'NU','Niue',683),(162,'NF','Norfolk Island',672),(163,'MP','Northern Mariana Islands',1670),(164,'NO','Norway',47),(165,'OM','Oman',968),(166,'PK','Pakistan',92),(167,'PW','Palau',680),(168,'PS','Palestinian Territory Occupied',970),(169,'PA','Panama',507),(170,'PG','Papua new Guinea',675),(171,'PY','Paraguay',595),(172,'PE','Peru',51),(173,'PH','Philippines',63),(174,'PN','Pitcairn Island',0),(175,'PL','Poland',48),(176,'PT','Portugal',351),(177,'PR','Puerto Rico',1787),(178,'QA','Qatar',974),(179,'RE','Reunion',262),(180,'RO','Romania',40),(181,'RU','Russia',70),(182,'RW','Rwanda',250),(183,'SH','Saint Helena',290),(184,'KN','Saint Kitts And Nevis',1869),(185,'LC','Saint Lucia',1758),(186,'PM','Saint Pierre and Miquelon',508),(187,'VC','Saint Vincent And The Grenadines',1784),(188,'WS','Samoa',684),(189,'SM','San Marino',378),(190,'ST','Sao Tome and Principe',239),(191,'SA','Saudi Arabia',966),(192,'SN','Senegal',221),(193,'RS','Serbia',381),(194,'SC','Seychelles',248),(195,'SL','Sierra Leone',232),(196,'SG','Singapore',65),(197,'SK','Slovakia',421),(198,'SI','Slovenia',386),(199,'XG','Smaller Territories of the UK',44),(200,'SB','Solomon Islands',677),(201,'SO','Somalia',252),(202,'ZA','South Africa',27),(203,'GS','South Georgia',0),(204,'SS','South Sudan',211),(205,'ES','Spain',34),(206,'LK','Sri Lanka',94),(207,'SD','Sudan',249),(208,'SR','Suriname',597),(209,'SJ','Svalbard And Jan Mayen Islands',47),(210,'SZ','Swaziland',268),(211,'SE','Sweden',46),(212,'CH','Switzerland',41),(213,'SY','Syria',963),(214,'TW','Taiwan',886),(215,'TJ','Tajikistan',992),(216,'TZ','Tanzania',255),(217,'TH','Thailand',66),(218,'TG','Togo',228),(219,'TK','Tokelau',690),(220,'TO','Tonga',676),(221,'TT','Trinidad And Tobago',1868),(222,'TN','Tunisia',216),(223,'TR','Turkey',90),(224,'TM','Turkmenistan',7370),(225,'TC','Turks And Caicos Islands',1649),(226,'TV','Tuvalu',688),(227,'UG','Uganda',256),(228,'UA','Ukraine',380),(229,'AE','United Arab Emirates',971),(230,'GB','United Kingdom',44),(231,'US','United States',1),(232,'UM','United States Minor Outlying Islands',1),(233,'UY','Uruguay',598),(234,'UZ','Uzbekistan',998),(235,'VU','Vanuatu',678),(236,'VA','Vatican City State (Holy See)',39),(237,'VE','Venezuela',58),(238,'VN','Vietnam',84),(239,'VG','Virgin Islands (British)',1284),(240,'VI','Virgin Islands (US)',1340),(241,'WF','Wallis And Futuna Islands',681),(242,'EH','Western Sahara',212),(243,'YE','Yemen',967),(244,'YU','Yugoslavia',38),(245,'ZM','Zambia',260),(246,'ZW','Zimbabwe',263);
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch_attachments`
--

DROP TABLE IF EXISTS `dispatch_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dispatch_details_id` int(11) DEFAULT NULL,
  `attached_docx_name` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_attachments`
--

LOCK TABLES `dispatch_attachments` WRITE;
/*!40000 ALTER TABLE `dispatch_attachments` DISABLE KEYS */;
INSERT INTO `dispatch_attachments` VALUES (1,1,'batch number 1','2019-12-23',1),(2,2,'batch number 1','2019-12-23',1),(3,1,'batch number 1','2019-12-23',1),(4,2,'batch number','2020-01-07',1),(5,3,'batch number 1','2020-02-03',1),(6,4,'batch number 3','2020-02-05',1);
/*!40000 ALTER TABLE `dispatch_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch_details`
--

DROP TABLE IF EXISTS `dispatch_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(45) NOT NULL,
  `object_id` varchar(45) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `amount` float DEFAULT NULL,
  `dispatch_date` date DEFAULT current_timestamp(),
  `delivery_date` date DEFAULT NULL,
  `dispatch_docx_num` varchar(45) DEFAULT NULL,
  `dispatch_docx_receipt` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_details`
--

LOCK TABLES `dispatch_details` WRITE;
/*!40000 ALTER TABLE `dispatch_details` DISABLE KEYS */;
INSERT INTO `dispatch_details` VALUES (1,'INQUIRY','NBT2019122001',2,'CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER',0,'2019-04-06','2019-01-01','DOC1112','','2019-12-23',1,NULL,NULL,NULL),(2,'SAMPLE','1',1,'CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER',1,'2019-01-01','2019-01-01','','','2020-01-07',1,NULL,NULL,NULL),(3,'SAMPLE','3',3,'CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER',0,'2019-01-01','2019-01-01','DOC1112','','2020-02-03',1,7,'2020-02-03',1),(4,'SAMPLE','4',0,'CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER',0,'2019-01-01','2019-01-01','','','2020-02-05',1,8,NULL,NULL);
/*!40000 ALTER TABLE `dispatch_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch_document_list`
--

DROP TABLE IF EXISTS `dispatch_document_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch_document_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_document_list`
--

LOCK TABLES `dispatch_document_list` WRITE;
/*!40000 ALTER TABLE `dispatch_document_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch_document_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch_service_master`
--

DROP TABLE IF EXISTS `dispatch_service_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch_service_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `is_active` char(1) NOT NULL DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_service_master`
--

LOCK TABLES `dispatch_service_master` WRITE;
/*!40000 ALTER TABLE `dispatch_service_master` DISABLE KEYS */;
INSERT INTO `dispatch_service_master` VALUES (1,'Test edit','test1.edit@dispatch.com','9999999999','Y','2019-12-23',1,1,'2020-02-03',1),(2,'Test Dispatch service 2','test2@dispatch.com','9999999998','Y','2019-12-23',1,2,NULL,NULL),(3,'Test Dispatch service 1','','','Y','2020-02-03',1,7,NULL,NULL),(4,'Test Dispatch service 2','','','Y','2020-02-03',1,6,NULL,NULL);
/*!40000 ALTER TABLE `dispatch_service_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `Id` char(1) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES ('F','FEMALE'),('M','MALE'),('O','OTHERS');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_receipt_note`
--

DROP TABLE IF EXISTS `goods_receipt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_receipt_note` (
  `id` int(11) NOT NULL,
  `grn_no` varchar(45) NOT NULL,
  `PRN_no` varchar(45) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `supplier` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `transporter` varchar(50) DEFAULT NULL,
  `LR_no` varchar(50) DEFAULT NULL,
  `delivery_warehouse` int(11) DEFAULT NULL,
  `net_amount` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_receipt_note`
--

LOCK TABLES `goods_receipt_note` WRITE;
/*!40000 ALTER TABLE `goods_receipt_note` DISABLE KEYS */;
INSERT INTO `goods_receipt_note` VALUES (1,'NBT-GRN-2019122401','prn122','2019-03-02','2019-06-17','',NULL,'Y',187,'Bill1234','1','LRN098',1,'417500','2019-12-24',1,'2020-02-03',1,8),(2,'NBT-GRN-2019122402','PRN12435','2019-03-14','2019-11-29','',NULL,'Y',187,'BIll-12t8','2','LR0913',2,'1102256','2019-12-24',1,'2020-02-03',1,7),(3,'NBT-GRN-2019122403','PRN1243 edit','2019-04-11','2019-05-19','',NULL,'Y',187,'Bill 12 edit','1','LR129 edit',2,'2312500','2019-12-24',1,'2019-12-24',1,NULL);
/*!40000 ALTER TABLE `goods_receipt_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_receipt_note_details`
--

DROP TABLE IF EXISTS `goods_receipt_note_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_receipt_note_details` (
  `id` int(11) NOT NULL,
  `grn_no` int(11) NOT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_receipt_note_details`
--

LOCK TABLES `goods_receipt_note_details` WRITE;
/*!40000 ALTER TABLE `goods_receipt_note_details` DISABLE KEYS */;
INSERT INTO `goods_receipt_note_details` VALUES (6,3,'NBTDE-817',2,5,500,6),(7,3,'NBTSE-62',8,500,4512,8),(8,3,'NBTSE-112',3,40,100,6),(9,3,'NBTSE-07',6,500,100,10),(12,2,'NBTDE-534',3,52,450,8),(13,2,'NBTSE-62',7,100,1000,8),(14,2,'NBTDE-400',5,124,7894,10),(15,1,'NBTSE-07',4,50,500,8),(16,1,'NBTDE-961',5,500,785,10);
/*!40000 ALTER TABLE `goods_receipt_note_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role_map`
--

DROP TABLE IF EXISTS `group_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_role_map` (
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role_map`
--

LOCK TABLES `group_role_map` WRITE;
/*!40000 ALTER TABLE `group_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_account_docx_details`
--

DROP TABLE IF EXISTS `inquiry_account_docx_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_account_docx_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `docx_name` varchar(45) DEFAULT NULL,
  `docx_attchment` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_account_docx_details`
--

LOCK TABLES `inquiry_account_docx_details` WRITE;
/*!40000 ALTER TABLE `inquiry_account_docx_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_account_docx_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_accounts`
--

DROP TABLE IF EXISTS `inquiry_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_number` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_accounts`
--

LOCK TABLES `inquiry_accounts` WRITE;
/*!40000 ALTER TABLE `inquiry_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_address`
--

DROP TABLE IF EXISTS `inquiry_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_address` (
  `id` int(11) NOT NULL,
  `inquiry_no` varchar(30) NOT NULL,
  `address_type` int(11) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_address`
--

LOCK TABLES `inquiry_address` WRITE;
/*!40000 ALTER TABLE `inquiry_address` DISABLE KEYS */;
INSERT INTO `inquiry_address` VALUES (1,'NBT2019121901',1,'185','address here',1558,245631,NULL,NULL),(2,'NBT2019121901',2,'185','address here',1558,245631,NULL,NULL),(3,'NBT2019121902',1,'185','customer address here',713,456123,NULL,NULL),(4,'NBT2019121902',2,'185','customer address here',713,456123,NULL,NULL),(5,'NBT2019121903',1,'20','customer billing address',1,789562,NULL,NULL),(6,'NBT2019121903',2,'20','shipping address here',1,78952,NULL,NULL),(7,'NBT2019122001',1,'51','billing addesss   billing address billing addfress billing address billindfcfiuewuasmdsir0psdudhfewp',2090,123456,NULL,NULL),(8,'NBT2019122001',2,'51','billing addesss   billing address billing addfress billing address billindfcfiuewuasmdsir0psdudhfewp',2494,123456,NULL,NULL);
/*!40000 ALTER TABLE `inquiry_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_address_type`
--

DROP TABLE IF EXISTS `inquiry_address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_address_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_address_type`
--

LOCK TABLES `inquiry_address_type` WRITE;
/*!40000 ALTER TABLE `inquiry_address_type` DISABLE KEYS */;
INSERT INTO `inquiry_address_type` VALUES (1,'Billing Address',NULL,NULL),(2,'Shipping Address',NULL,NULL);
/*!40000 ALTER TABLE `inquiry_address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_batch_info`
--

DROP TABLE IF EXISTS `inquiry_batch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_batch_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiry_no` varchar(45) NOT NULL,
  `batch_no` varchar(45) NOT NULL,
  `attahcment` varchar(45) DEFAULT NULL,
  `remarks` varchar(2000) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_batch_info`
--

LOCK TABLES `inquiry_batch_info` WRITE;
/*!40000 ALTER TABLE `inquiry_batch_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_batch_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_master`
--

DROP TABLE IF EXISTS `inquiry_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_master` (
  `id` varchar(100) NOT NULL,
  `date` varchar(10) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sales_executive_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `seq_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inquiry_master_prdouct_type1_idx` (`type`),
  CONSTRAINT `fk_inquiry_master_prdouct_type1` FOREIGN KEY (`type`) REFERENCES `product_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_master`
--

LOCK TABLES `inquiry_master` WRITE;
/*!40000 ALTER TABLE `inquiry_master` DISABLE KEYS */;
INSERT INTO `inquiry_master` VALUES ('NBT060819001','2019/08/06','PURCAHSE_INDENT_CREADTED',1,NULL,'2019-08-06 10:33:21',NULL,23,NULL,NULL,2),('NBT200619001','2019/06/20','PENDING',1,2,'2019-06-20 17:20:14',NULL,23,NULL,NULL,1),('NBT2019121901','2019/12/19','PENDING',1,NULL,'2019-12-19 00:00:00',NULL,185,1,NULL,7),('NBT2019121902','2019/12/19','INQUIRY_REQUEST_FOR_SAMPLE',1,NULL,'2019-12-19 00:00:00','2019-12-20 00:00:00',185,2,NULL,1),('NBT2019121903','2019/12/19','PURCAHSE_INDENT_CREADTED',1,NULL,'2019-12-19 00:00:00',NULL,20,3,NULL,1),('NBT2019122001','2019/12/20','CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER',1,1,'2019-12-20 00:00:00','2020-01-14 00:00:00',51,4,1,7);
/*!40000 ALTER TABLE `inquiry_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_response`
--

DROP TABLE IF EXISTS `inquiry_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_response` (
  `id` int(11) DEFAULT NULL,
  `inquiry_id` varchar(100) DEFAULT NULL,
  `sales_executive_id` int(11) DEFAULT NULL,
  `inquiry_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `response` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_response`
--

LOCK TABLES `inquiry_response` WRITE;
/*!40000 ALTER TABLE `inquiry_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_status_change_log`
--

DROP TABLE IF EXISTS `inquiry_status_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry_status_change_log` (
  `objective_id` varchar(40) NOT NULL,
  `process_name` varchar(100) DEFAULT NULL,
  `current_status` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`objective_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_status_change_log`
--

LOCK TABLES `inquiry_status_change_log` WRITE;
/*!40000 ALTER TABLE `inquiry_status_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_status_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_request_note`
--

DROP TABLE IF EXISTS `material_request_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_request_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_request_no` varchar(45) DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  `object_id` varchar(45) DEFAULT NULL,
  `is_procced_for_stock_entry` char(1) DEFAULT NULL,
  `is_proceed_for_prn` char(1) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_request_note`
--

LOCK TABLES `material_request_note` WRITE;
/*!40000 ALTER TABLE `material_request_note` DISABLE KEYS */;
INSERT INTO `material_request_note` VALUES (1,'NBT-MRN-2019121201','2020-04-04','SAMPLE','NBT-SAMPLE-CUSTOMER-2019121201',NULL,NULL,'Material-Requization-Note-CREATED',1,'MRN Added','2019-12-12',1,1,NULL,NULL),(2,'NBT-MRN-2020020301','2019-01-01','SAMPLE','NBT-SAMPLE-CUSTOMER-2019121201',NULL,NULL,'Material-Requization-Note-CREATED',1,'zsdfg','2020-02-03',1,7,NULL,NULL);
/*!40000 ALTER TABLE `material_request_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_request_note_details`
--

DROP TABLE IF EXISTS `material_request_note_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_request_note_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_entry_id` int(11) NOT NULL,
  `item_code` varchar(20) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL,
  `botanical_scientific_name` varchar(45) DEFAULT NULL,
  `item_qty` float DEFAULT NULL,
  `item_uom` int(11) DEFAULT NULL,
  `control_qty` float DEFAULT NULL,
  `control_uom` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_request_note_details`
--

LOCK TABLES `material_request_note_details` WRITE;
/*!40000 ALTER TABLE `material_request_note_details` DISABLE KEYS */;
INSERT INTO `material_request_note_details` VALUES (1,1,'NBTDE-1712','NBTDE-1712',NULL,12,10,12,8,3),(2,2,'NBTSE-01','NBTSE-01',NULL,2,6,0,6,8);
/*!40000 ALTER TABLE `material_request_note_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_request_purpose`
--

DROP TABLE IF EXISTS `material_request_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_request_purpose` (
  `id` int(11) NOT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_request_purpose`
--

LOCK TABLES `material_request_purpose` WRITE;
/*!40000 ALTER TABLE `material_request_purpose` DISABLE KEYS */;
INSERT INTO `material_request_purpose` VALUES (1,'Sample Request','Y',NULL,'2019-12-12');
/*!40000 ALTER TABLE `material_request_purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performa_invoice_master`
--

DROP TABLE IF EXISTS `performa_invoice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performa_invoice_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `performa_invoice_no` varchar(45) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `amount_paid` float DEFAULT NULL,
  `rest_amount` float DEFAULT NULL,
  `inquiry_no` varchar(45) DEFAULT NULL,
  `another_info` varchar(500) DEFAULT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performa_invoice_master`
--

LOCK TABLES `performa_invoice_master` WRITE;
/*!40000 ALTER TABLE `performa_invoice_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `performa_invoice_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_change_log`
--

DROP TABLE IF EXISTS `process_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` varchar(20) NOT NULL,
  `process_type` varchar(45) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `updated_at` date DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_change_log`
--

LOCK TABLES `process_change_log` WRITE;
/*!40000 ALTER TABLE `process_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_status`
--

DROP TABLE IF EXISTS `process_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(45) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT 'Y',
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_status`
--

LOCK TABLES `process_status` WRITE;
/*!40000 ALTER TABLE `process_status` DISABLE KEYS */;
INSERT INTO `process_status` VALUES (1,'SAMPLE','CUSTOMER_SAMPLE_REQUEST','Customer Sample Request Received','Y'),(2,'SAMPLE','CUSTOMER_SAMPLE_PENDING_FROM_STROE','Customer Sample Request sample material pending form store team','Y'),(3,'SAMPLE','CUSTOMER_SAMPLE_APPROVEL_PENDING_FROM_QC_TEAM','Customer Sample Request waiting for QC team response','Y'),(4,'SAMPLE','CUSTOMER_SAMPLE_STATUS_PASS_QC_TEAM','Customer Sample Pass form QC team','Y'),(5,'SAMPLE','CUSTOMER_SAMPLE_STATUS_FAIL_QC_TEAM','Customer Sample Fail form QC team','Y'),(6,'SAMPLE','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER','Customer Sample Dispatched','Y'),(7,'SAMPLE','CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER','Sample Received to Cusromer','Y'),(8,'SAMPLE','CUSTOMER_SAMPLE_PASS_BY_CUSTOMER','Customer Sample pass by Customer','Y'),(9,'SAMPLE','CUSTOMER_SAMPLE_FAIL_BY_CUSTOMER','Customer Sample fail by Customer ','Y'),(10,'SAMPLE','VENDOR_SAMPLE_RECEIVED','Vendor Sample Request Received','Y'),(11,'SAMPLE','VENDOR_SAMPLE_PENDING_FOR_QC_APPROVAL','Vendor Sample Request waiting for QC team response','Y'),(12,'SAMPLE','VENDOR_SAMPLE_STATUS_PASS_QC_TEAM','Vendor Sample Pass form QC team','Y'),(13,'SAMPLE','VENDOR_SAMPLE_STATUS_FAIL_QC_TEAM','Vendor Sample Fail form QC team','Y'),(14,'SAMPLE','VENDOR_SAMPLE_RECEIVED_IN_STORE','Vendor Sample stored in Store','Y'),(15,'OPERATION','INQUIRY_RECEIVED','New Inquiry received','Y'),(16,'OPERATION','PURCAHSE_INDENT_CREADTED','Purchase Indent created','Y'),(17,'OPERATION','PURCHASE_INDENT_DISCARD','Purchase Indent discarded','Y'),(18,'OPERATION','INQUIRY_DISCARD_DUE_STOCK_NOT_AVAILABLE','Inquiry discareded due to stock not available','Y'),(19,'OPERATION','INQUIRY_REQUEST_FOR_SAMPLE','Inquiry request for sample.','Y'),(20,'OPERATION','INQUIRY_PROCEED_WITHOUT_SAMPLE','Inquiry proceed with out sample','Y'),(21,'OPERATION','INQUIRY_STOCK_IS_READY_FOR_DISPATCH','Inquiry is ready for dispatch','Y'),(22,'OPERATION','INQUIRY_STOCK_IS_NOT_READY_FOR_DISPATCH','Inquiry is not ready for dispatch.','Y'),(23,'PURCHASE','PURCHASE_REQUISITION_NUMBER_PROCEED_CALL_FOR_QUTATION','Inquiry is call for quotation stage','Y'),(24,'PURCHASE','PURCHASE_REQUISITION_NUMBER_DISCARD_FROM_PURCHASE_DEPT','PRN is discared by Purchase dept','Y'),(25,'PURCHASE','PRN_QUOTATION_SEND_FOR_SUPPLIER_QUTATION','PRN sending for supplier quotation','Y'),(26,'PURCHASE','PURCHASE_SUPPLIER_QUOTATION_RECEIVED','PRN received different supplier quoation','Y'),(27,'PURCHASE','PO_RELEASE','PO release','Y'),(28,'PURCHASE','PERFORMA_INVOICE_CREATED','Performa Invoice Created','Y'),(29,'SAMPLE','CUSTOMER_SAMPLE_BMR_RECEIVED','Customer Sample BMR number received from Store Team','Y'),(30,'SAMPLE','CUSTOMER_SAMPLE_READY_FOR_DISPATCH','Custome sample is ready for dispatch','Y'),(31,'STOCK','Material-Requization-Note-CREATED','Material Requization Note was created by Operation Team','Y'),(32,'STOCK','PURCHASE_REQUIZATION_NOTE_CREATED','Purchase Requization Note Created','Y'),(33,'PRODUCTION','BOM_CREATED','Bill of Material created','Y'),(34,'STOCK','PURCHASE_REQUIZATION_NOTE_VERIFIED','Purchase Requization Note Verified','Y'),(35,'PURCHASE','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','Quotation Created for PRN','Y'),(36,'STOCK','STOCK_BATCH_INFORMATION_UPDATED_BY_QC_TEAM','Stock Batch Information updated By QC Team','Y'),(37,'PRODUCT','WISH-CREATED','Wish Created','Y'),(38,'PRODUCT','WISH-DISCARD','Wish Discarded','Y'),(39,'PRODUCT','WISH-PROCEED-AS-PRODUCT','Wish Proceed As Product','Y'),(40,'CART','PENDING','User Cart Created','Y'),(41,'CART','INQUIRY-RECEIVED','User cart convert into Inquiry','Y'),(42,'PURCHASE','PURCHASE_REQUISTION_NUMBER_QUTATION_RECEIVED','Quotation REceived for PRN','Y');
/*!40000 ALTER TABLE `process_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_master`
--

DROP TABLE IF EXISTS `product_category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_master` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_master`
--

LOCK TABLES `product_category_master` WRITE;
/*!40000 ALTER TABLE `product_category_master` DISABLE KEYS */;
INSERT INTO `product_category_master` VALUES (1,'STANDARD HERBAL EXTRACTS','2018-12-07 10:11:27',NULL,'Y'),(2,'PHYTOCHEMICALS','2018-12-07 10:11:27',NULL,'Y'),(3,'ESSENTIAL OILS','2018-12-07 10:11:27',NULL,'Y'),(4,'OLEORESINS','2018-12-07 10:11:27',NULL,'Y'),(5,'SUPER CRITICAL FLUID EXTRACT','2018-12-07 10:11:27',NULL,'Y'),(6,'ORGANIC HERBS','2018-12-07 10:11:27',NULL,'Y'),(7,'FLORAL EXTRACTS','2018-12-07 10:11:27',NULL,'Y'),(8,'NATURAL COLORS','2018-12-07 10:11:27',NULL,'Y'),(9,'CHINESE HERBAL EXTRACTS','2018-12-07 10:11:27',NULL,'Y'),(10,'HERBAL EXTRACTS','2018-12-07 10:11:29',NULL,'Y');
/*!40000 ALTER TABLE `product_category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_master`
--

DROP TABLE IF EXISTS `product_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_master` (
  `code` varchar(45) NOT NULL,
  `name` varchar(200) NOT NULL,
  `scrientific_name` varchar(200) NOT NULL,
  `specification` varchar(2000) DEFAULT NULL,
  `application` varchar(2000) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `ratio_based` char(1) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `min_price` int(11) NOT NULL,
  `max_price` int(11) NOT NULL,
  `valid_till` varchar(45) NOT NULL,
  `hsn_code` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `quantity_type` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `min_qty` varchar(5) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_product_master_product_category_master1_idx` (`category`),
  KEY `fk_product_master_product_method_master1_idx` (`method`),
  KEY `fk_product_master_prdouct_type1_idx` (`type`),
  CONSTRAINT `fk_product_master_prdouct_type1` FOREIGN KEY (`type`) REFERENCES `product_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_master_product_category_master1` FOREIGN KEY (`category`) REFERENCES `product_category_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_master_product_method_master1` FOREIGN KEY (`method`) REFERENCES `product_method_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_master`
--

LOCK TABLES `product_master` WRITE;
/*!40000 ALTER TABLE `product_master` DISABLE KEYS */;
INSERT INTO `product_master` VALUES ('0','TEST PRODUCT','TEST PRODUCT','sfds','sdfds',1,'N',1,0,0,'2020/11/17','000000','','N',1,'2019-12-12 00:00:00',NULL,130,'2019-12-07 14:58:59','25',NULL,NULL),('NBTAQ-48','Curry Leaf Extract','Murraya koenigii','3% iron','NA',1,'N',1,1400,1750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,51,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-08','Amla Extract','Emblica officinalis','25% Tannins','Cosmetics',1,'N',2,400,425,'2020/11/17','13021919',NULL,'Y',1,NULL,1,4,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-09','Amla Extract','Emblica officinalis','10:1','Cosmetics',1,'Y',0,425,475,'2019/01/01','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,10,'2019-12-07 14:57:47','25',1,NULL),('NBTDE-105','Morinda Extract ','Morinda Citrifolia','20% Saponins','NA',1,'N',4,475,525,'2020/11/17','13021919',NULL,'Y',1,NULL,1,91,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-12','Pomegranate ext 40%','NA','Ellagic acid;40%','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,136,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-1313','Mucuna Extract','Mucuna pruriens','40% Levodopa','Supports the CNS, Energy Booster, Men Health support',1,'N',2,1200,1400,'2020/03/01','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,85,'2019-12-07 14:57:47','25',1,NULL),('NBTDE-14','Andrographis Extract','Andrographis paniculata','10% Andrographolides ','Liver support',1,'N',4,650,750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,11,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1429','Gotukola/ Centella Extract','Centella asiatica','10% Asiaticoside','Memory support, Cosmetics',1,'N',4,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,65,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1474','Salacia Extract','Salacia reticulata','10% Saponins','Antidiabetic',1,'N',4,1450,1650,'2020/11/17','13021919',NULL,'Y',1,NULL,1,97,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1476','Mucuna Extract','Mucuna pruriens','50% L-DOPA','Supports the CNS, Energy Booster, Men Health support',1,'N',2,1400,1600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,86,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1477','Bacopa Extract','Bacopa monnieri','10% Bacosides','Memory support, Hair care',1,'N',3,750,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,28,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1499','Morinda Extract ','Morinda Citrifolia','40% Saponins','NA',1,'N',4,775,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,92,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1500','Turmeric Extract','Curcuma longa','25% Total Curcuminoids','Anti-oxidant, Skin care',1,'N',3,1450,1750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,124,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1661','Nisoth dry extract','NA','Saponin 15%','NA',1,NULL,0,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,132,'2019-12-07 14:56:58','25',NULL,NULL),('NBTDE-1712','Ashoka dry extract','NA','Tannins 25%','NA',1,NULL,2,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,131,'2019-12-07 14:56:58','25',NULL,NULL),('NBTDE-180','Vasaka/ Malabar nut','Justicia adhatoda','1.5% Alkaloids','Respiratory support, Liver care',1,'N',4,675,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,127,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-1893','Anaantmool ext','NA','Saponins 25%','NA',1,NULL,4,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,138,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-190','Tribulus Extract','Tribulus terrestris','45% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',1,375,425,'2020/11/17','13021919',NULL,'Y',1,NULL,1,110,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-192','Amla Extract','Emblica officinalis',' 10% Vitamin C','Cosmetics',1,'N',3,1200,1300,'2020/11/17','13021919',NULL,'Y',1,NULL,1,9,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-20','Ashwagandha Extract','Withania somnifera ','5% Withanolides ','Immune support, adoptogen',1,'N',4,925,1000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,19,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-203','Bacopa Extract','Bacopa monnieri','50% Bacosides','Memory support, Hair care',1,'N',4,1400,1500,'2020/11/17','13021919',NULL,'Y',1,NULL,1,32,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-212','Pteracarpus Extract','NA','Pterostilbene 5%','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,141,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-220','Gotukola/ Centella Extract','Centella asiatica','20% Asiaticoside','Memory support, Cosmetics',1,'N',4,600,700,'2020/11/17','13021919',NULL,'Y',1,NULL,1,66,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-235','Gotukola/ Centella Extract','Centella asiatica','40% Asiaticoside','Memory support, Cosmetics',1,'N',4,1200,1300,'2020/11/17','13021919',NULL,'Y',1,NULL,1,67,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-236','Fenugreek Extract','NA','Saponins;60%','NA',1,NULL,4,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,140,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-247','Gingseng ext','NA','Ginsenoside 20%','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,134,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-273','Guggul Extract','Commiphora mukul','5% Total Guggulsterones','Anti-inflammatory',1,'N',1,1900,2100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,76,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-284','Tribulus Extract','Tribulus terrestris','20% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',4,325,375,'2020/11/17','13021919',NULL,'Y',1,NULL,1,106,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-29','Banaba extract 4.5% HPLC','NA','NA','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,144,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-290','Arjuna Extract','NA','Tannins 25%','NA',1,NULL,2,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,142,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-299','Tribulus Extract','Tribulus terrestris','60% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',1,475,550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,112,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-301','Neem Extract','Azardica indica','10% Bitters','Cosmetics, Immunity Booster',1,'N',4,950,1100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,96,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-303','Bhui amla Extract','Phyllanthus amarus/Phyllanthus niruri','2.5% Bitters','Liver Care',1,'N',4,450,500,'2020/11/17','13021919',NULL,'Y',1,NULL,1,37,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-312','Fenugreek Extract','Trigonella foenum-graecum','20% Saponins ','Blood sugar management, Immunostimulant, Digestive support',1,'N',4,500,600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,57,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-314','Tulsi Extract','Ocimum sanctum','5% Tannins ','Anti-oxidant, Expectorant, Anti-pyretic, Skin Care',1,'N',2,500,550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,121,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-360','Bacopa Extract','Bacopa monnieri','40% Bacosides','Memory support, Hair care',1,'N',4,1200,1300,'2020/11/17','13021919',NULL,'Y',1,NULL,1,30,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-400','Guggul Extract','Commiphora mukul','10% Total Guggulsterones','Anti-inflammatory',1,'N',1,2850,2950,'2020/11/17','13021919',NULL,'Y',1,NULL,1,77,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-413','Bacopa Extract','Bacopa monnieri','20% Saponins','Memory support, Hair care',1,'N',4,500,550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,29,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-520','Amla Extract','Emblica officinalis','50% Vitamin C','Cosmetics',1,'N',3,2000,2500,'2020/11/17','13021919',NULL,'Y',1,NULL,1,7,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-525','Mucuna Extract','Mucuna pruriens','10% Levodopa','Supports the CNS, Energy Booster, Men Health support',1,'N',2,450,550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,83,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-530','Lavang ext 5:1','NA','NA','NA',1,NULL,0,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,135,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-534','Ashwagandha Extract','Withania somnifera ','5:1','Immune support, adoptogen',1,'Y',0,450,525,'2020/11/17','13021919',NULL,'Y',1,NULL,1,25,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-551','Turmeric extract','NA','Curcuminoids 20% water Dispersible','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,137,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-577','Salacia extract','NA','Saponins 5%','NA',1,NULL,4,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,139,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-600','Andrographis Extract','Andrographis paniculata','10:1','Liver support',1,'Y',0,650,700,'2020/11/17','13021919',NULL,'Y',1,NULL,1,16,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-690','Cissus Extract','Cissus quadrangularis','40% Total Ketosterone','NA',1,'N',4,1800,2000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,50,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-711','Gotukola/ Centella Extract','Centella asiatica','20% Saponins','Memory support, Cosmetics',1,'N',4,600,700,'2020/11/17','13021919',NULL,'Y',1,NULL,1,68,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-747','Jatamansi ext','NA','Saponins 10%','NA',1,NULL,4,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,145,'2019-12-07 14:56:59','25',NULL,NULL),('NBTDE-758','Bamboo Extract','Bambusa vulgaris','70% Silica','Women health, Digestive support',1,'N',4,450,600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,35,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-770','Amla Extract','Emblica officinalis','30% Tannins ','Cosmetics',1,'N',2,500,525,'2020/11/17','13021919',NULL,'Y',1,NULL,1,5,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-801','Andrographis Extract','Andrographis paniculata','40% Andrographolides','Liver support',1,'N',3,5500,5800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,15,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-817','Ashwagandha Extract','Withania somnifera ','1.5% Withanolides ','Immune support, adoptogen',1,'N',4,475,550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,17,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-961','Ashwagandha Extract','Withania somnifera ','4% Withanolides ','Immune support, adoptogen',1,'N',6,1850,2100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,23,'2019-12-07 14:57:47','25',NULL,NULL),('NBTDE-965','Andrographis Extract','Andrographis paniculata','2.5% Andrographolides','Liver support',1,'N',4,425,475,'2020/11/17','13021919',NULL,'Y',1,NULL,1,12,'2019-12-07 14:57:47','25',NULL,NULL),('NBTNP-10','Spirullina Powder','NA','Protein;65%','NA',1,NULL,0,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,143,'2019-12-07 14:56:59','25',NULL,NULL),('NBTNP-13','Amla Extract','Emblica officinalis','4% Vitamin C','Cosmetics',1,'N',3,750,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,8,'2019-12-07 14:57:47','25',NULL,NULL),('NBTPC-38','Berberine 50%','NA','NA','NA',1,NULL,3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,146,'2019-12-07 14:57:00','25',NULL,NULL),('NBTSE-01','Aloevera Extract','Aloe barbadensis','200:1','Cosmetics, Immuno stimulant',1,'Y',0,2500,3000,'2020/03/01','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,1,'2019-12-07 14:57:47','25',1,NULL),('NBTSE-02','Aloevera Extract','Aloe barbadensis','100:1','Cosmetics, Immuno stimulant',1,'Y',0,1400,2000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,2,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-03','Amla Extract','Emblica officinalis','20%  Tannins ',' Cosmetics',1,'N',2,375,400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,3,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-05','Amla Extract','Emblica officinalis','40% Tannins ','Cosmetics',1,'N',2,650,700,'2020/11/17','13021919',NULL,'Y',1,NULL,1,6,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-06','Andrographis Extract','Andrographis paniculata','10% Andrographolides ','Liver support',1,'N',3,1250,1400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,13,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-07','Andrographis Extract','Andrographis paniculata','20% Andrographolides','Liver support',1,'N',3,2400,2600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,14,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-08','Ashwagandha Extract','Withania somnifera ','1.5% Withanolides ','Immune support, adoptogen',1,'N',3,900,975,'2020/11/17','13021919',NULL,'Y',1,NULL,1,21,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-10','Ashwagandha Extract','Withania somnifera ','2.5% Withanolides ','Immune support, adoptogen',1,'N',3,1500,1650,'2020/11/17','13021919',NULL,'Y',1,NULL,1,22,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-100','Shilajith Extract','Asphaltum','20% Fulvic Acid','Immune support, Men Health',1,'N',4,1500,1800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,104,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-101','Tribulus Extract','Tribulus terrestris','40% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',4,535,600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,107,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-101-1','Shilajith Extract','Asphaltum','50% Fulvic Acid','Immune support, Men Health',1,'N',4,3500,4000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,105,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-102','Tribulus Extract','Tribulus terrestris','40% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',1,350,450,'2020/11/17','13021919',NULL,'Y',1,NULL,1,108,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-103','Tribulus Extract','Tribulus terrestris','45% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',4,575,650,'2020/11/17','13021919',NULL,'Y',1,NULL,1,109,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-105','Tribulus Extract','Tribulus terrestris','60% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',4,950,1250,'2020/11/17','13021919',NULL,'Y',1,NULL,1,111,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-107','Tribulus Extract','Tribulus terrestris','90% Saponins','Aphrodisiac, Immune support, Prevents Kidney stone formulation',1,'N',1,650,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,113,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-108','Trikatu','Piper longum, piper nigrum, Zingiber offcinale','2.5% Piperine','Gastro intestinal disorders management',1,'N',1,975,1200,'2020/11/17','13021919',NULL,'Y',1,NULL,1,114,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-109','Trikatu','Piper longum, piper nigrum, Zingiber offcinale','2.5% Piperine','Gastro intestinal disorders management',1,'N',3,1050,1400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,115,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-11','Ashwagandha Extract','Withania somnifera ','2.5% Withanolides ','Immune support, adoptogen',1,'N',4,650,750,'2020/02/18','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,18,'2019-12-07 14:57:47','25',1,NULL),('NBTSE-110','Triphala Extract','Emblica officinalis, Terminalia Chebula, Terminalia belerica','20% Tannins','Digestive support, Rejuvenator, Laxative',1,'N',2,300,375,'2020/11/17','13021919',NULL,'Y',1,NULL,1,116,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-111','Triphala Extract','Emblica officinalis, Terminalia Chebula, Terminalia belerica','40% Tannins','Digestive support, Rejuvenator, Laxative',1,'N',2,500,600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,117,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-112','Triphala Extract','Emblica officinalis, Terminalia Chebula, Terminalia belerica','45% Tannins','Digestive support, Rejuvenator, Laxative',1,'N',2,550,650,'2020/11/17','13021919',NULL,'Y',1,NULL,1,118,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-113','Tulsi Extract','Ocimum sanctum','10% Tannins ','Anti-oxidant, Expectorant, Anti-pyretic, Skin Care',1,'N',2,850,900,'2020/11/17','13021919',NULL,'Y',1,NULL,1,122,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-115','Tulsi Extract','Ocimum sanctum','1.5% Ursolic Acid by HPLC','Anti-oxidant, Expectorant, Anti-pyretic, Skin Care',1,'N',3,1800,2100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,119,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-116','Tulsi Extract','Ocimum sanctum','2.5% Ursolic Acid  by HPLC','Anti-oxidant, Expectorant, Anti-pyretic, Skin Care',1,'N',3,2800,3400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,120,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-117','Turmeric Extract','Curcuma longa','10% Total Curcuminoids','Anti-oxidant, Skin care',1,'N',3,750,1100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,123,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-118','Turmeric Extract','Curcuma longa','95% Total Curcuminoids','Anti-oxidant, Skin care',1,'N',3,5800,6400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,125,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-119','Vasaka/ Malabar nut','Justicia adhatoda','1% Alkaloids','Respiratory support, Liver care',1,'N',4,500,750,'2019/03/01','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,126,'2019-12-07 14:57:47','25',1,NULL),('NBTSE-121','White Kidney Beans Extract','Phaceolus vulgaris','10,000 IU/ ml Amylase Inhibitory Activity','Weight management',1,'N',1,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,128,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-122','White Kidney Beans Extract','Phaceolus vulgaris','20,000 IU /ml Amylase Inhibitory Activity','Weight management',1,'N',1,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,129,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-13','Ashwagandha Extract','Withania somnifera ','10% Withanolides ','Immune support, adoptogen',1,'N',4,1850,2000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,20,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-132','Boswellia AKBA 30%','NA','NA','NA',1,NULL,0,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,133,'2019-12-07 14:56:58','25',NULL,NULL),('NBTSE-134','Boswellia Extract','Boswellia Serrata','30% Acetyl Keto beta Boswellic acid (AKBBA)','Bone health Skin care',1,'N',3,9000,9500,'2020/11/17','13021919',NULL,'Y',1,NULL,1,44,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-14','Bacopa Extract','Bacopa monnieri','20% Bacosides','Memory support, Hair care',1,'N',3,1450,1650,'2020/11/17','13021919',NULL,'Y',1,NULL,1,26,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-140','Bacopa Extract','Bacopa monnieri','25% Bacosides','Memory support, Hair care',1,'N',3,1850,2100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,27,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-141','Ashwagandha Extract','Withania somnifera ','5% Withanolides ','Immune support, adoptogen',1,'N',3,2500,3000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,24,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-15','Bacopa Extract','Bacopa monnieri','40% Bacosides','Memory support, Hair care',1,'N',3,3200,3350,'2020/11/17','13021919',NULL,'Y',1,NULL,1,31,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-16','Bacopa Extract','Bacopa monnieri','50% Bacosides','Memory support, Hair care',1,'N',3,3500,3800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,33,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-17','Bacopa Extract','Bacopa monnieri','50% Bacosides','Memory support, Hair care',1,'N',1,2000,2200,'2020/11/17','13021919',NULL,'Y',1,NULL,1,34,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-19','Banaba Extract','Lagerstroemia speciosa','1% corosolic acid','Weight management, Blood sugar management',1,'N',3,850,950,'2020/11/17','13021919',NULL,'Y',1,NULL,1,36,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-24','Bitter gourd Extract/Karela Extract','Momordica charantia','5% Bitters','Liver support, Weight management, Blood sugar management',1,'N',4,650,750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,39,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-25','Bitter gourd Extract/  Karela Extract','Momordica charantia','10% Bitters','Liver support, Weight management, Blood sugar management',1,'N',4,1150,1350,'2020/11/17','13021919',NULL,'Y',1,NULL,1,40,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-28','Boswellia Extract','Boswellia Serrata','65% Boswellic Acid','Bone health Skin care',1,'N',2,1025,1100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,41,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-29','Boswellia Extract','Boswellia Serrata','70% Boswellic Acid','Bone health Skin care',1,'N',2,1100,1175,'2020/11/17','13021919',NULL,'Y',1,NULL,1,42,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-30','Boswellia Extract','Boswellia Serrata','85% Boswellic Acid','Bone health Skin care',1,'N',2,1475,1600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,43,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-31','Cinnamon Extract','Cinnamomum verum','10% Polyphenols','Antidiabetic, Antimicrobial, Natural preservative',1,'N',1,1150,1350,'2020/11/17','13021919',NULL,'Y',1,NULL,1,45,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-32','Cinnamon Extract','Cinnamomum verum','20% Polyphenols','Antidiabetic, Antimicrobial, Natural preservative',1,'N',1,1750,1950,'2020/11/17','13021919',NULL,'Y',1,NULL,1,46,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-33','Cissus Extract','Cissus quadrangularis','5% Total Ketosterone','Bone Health Care',1,'N',4,1000,1200,'2019/12/05','13021919',NULL,'Y',1,'2020-02-10 00:00:00',1,47,'2019-12-07 14:57:47','25',1,NULL),('NBTSE-34','Cissus Extract','Cissus quadrangularis','10% Total Ketosterone','Bone Health Care',1,'N',4,700,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,48,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-35','Cissus Extract','Cissus quadrangularis','20% Total Ketosterone','Bone Health Care',1,'N',4,1200,1300,'2020/11/17','13021919',NULL,'Y',1,NULL,1,49,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-36','Coffe Bean Extract','Coffee robusta','45% Chlorogenic acid','Weight management, Antioxidant',1,'N',3,1300,1400,'2020/11/17','13021919',NULL,'Y',1,NULL,1,53,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-36_1','Coffe Bean Extract','Coffee robusta','50% Chlorogenic acid ','Weight management, Antioxidant',1,'N',3,1800,1900,'2020/11/17','13021919',NULL,'Y',1,NULL,1,52,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-39','Coleus Extract ','Coleus forskohlii','10% Forskolin','Weight management, Circulatory support',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,54,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-40','Coleus Extract ','Coleus forskohlii','20% Forskolin','Weight management, Circulatory support',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,55,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-41','Coleus Extract ','Coleus forskohlii','98% Forskolin','Weight management, Circulatory support',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,56,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-43','Fenugreek Extract','Trigonella foenum-graecum','40% Saponins ','NA',1,'N',4,750,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,58,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-44','Fenugreek Extract','Trigonella foenum-graecum','50% Saponins ','Blood sugar management, Immunostimulant, Digestive support',1,'N',4,900,1000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,59,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-47','Garcinia Extract','Garcinia cambogia','50% (-) Hydroxy Citric Acid ','Weight management',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,60,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-49','Garcinia Extract','Garcinia cambogia','60% (-) Hydroxy Citric Acid ','Weight management',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,61,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-52','Garcinia Extract','Garcinia cambogia','70% (-) Hydroxy Citric Acid ','Weight management',1,'N',3,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,62,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-53','Garlic Extract','Allium sativum','Allicin/Allin 1%','Cardiovascular health, Blood sugar management, Digestive support',1,'N',3,850,1100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,63,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-55','Ginger Extract','Zingiber officinale','5% Total Gingerol','Anti-emetic, Digestive support, Anti-inflammatory',1,'N',3,1450,1600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,64,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-59','Grape seed Extract','Vitis vinifera','95% OPC','Antioxidant',1,'N',1,1600,1800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,69,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-60','Green Tea Extract','Camellia sinensis','50% Polyphenols','Anti-oxidant, Digestive support, Weight management',1,'N',1,750,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,70,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-61','Green Tea Extract','Camellia sinensis','90% Polyphenols','Anti-oxidant, Digestive support, Weight management',1,'N',1,1900,2250,'2020/11/17','13021919',NULL,'Y',1,NULL,1,71,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-62','Guduchi/Giloy Extract ','Tinospora cordifolia','2.5% Bitters','Adaptogen, Febrifuge, Immune support',1,'N',4,425,475,'2020/11/17','13021919',NULL,'Y',1,NULL,1,72,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-63','Guduchi/Giloy Extract ','Tinospora cordifolia','5% Bitters','Adaptogen, Febrifuge, Immune support',1,'N',4,750,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,73,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-64','Guggul Extract','Commiphora mukul','2.5% Total Guggulsterones','Anti-inflammatory',1,'N',3,3900,4100,'2020/11/17','13021919',NULL,'Y',1,NULL,1,74,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-65','Guggul Extract','Commiphora mukul','2.5% Total Guggulsterones','Anti-inflammatory',1,'N',1,1400,1550,'2020/11/17','13021919',NULL,'Y',1,NULL,1,75,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-66','Gymnema Extract','Gymnema sylvestre','25% Gymnemic acid','Blood sugar management, Cardivascular support',1,'N',4,750,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,78,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-67','Gymnema Extract','Gymnema sylvestre','75% Gymnemic acid','Blood sugar management, Cardivascular support',1,'N',4,2100,2350,'2020/11/17','13021919',NULL,'Y',1,NULL,1,79,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-69','Licorice/ Yashtimadhu Extract','Glycyrrhiza glabra','20% Glyzyrrizic acid','Digestive support, Expectorant, Anti deppresent ',1,'N',3,1800,2000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,81,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-70','Licorice/ Yashtimadhu Extract','Glycyrrhiza glabra','20% Glyzyrrizin','Digestive support, Expectorant, Anti deppresent ',1,'N',4,900,1050,'2020/11/17','13021919',NULL,'Y',1,NULL,1,80,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-73','Mucuna Extract','Mucuna pruriens','10% Levodopa','Supports the CNS, Energy Booster, Men Health support',1,'N',3,1300,1450,'2020/11/17','13021919',NULL,'Y',1,NULL,1,82,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-75','Mucuna Extract','Mucuna pruriens','20% Levodopa','Supports the CNS, Energy Booster, Men Health support',1,'N',3,2400,2600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,84,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-78','Marigold Extract ','Tagets','10% Lutein','Natural Food Color',1,'N',1,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,87,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-79','Marigold Extract ','Tagets','20% Lutein','Natural Food Color',1,'N',1,0,0,'2020/11/17','13021919',NULL,'Y',1,NULL,1,88,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-80','Moringa Extract','Moringa oleifera','10% Total Saponins','Blood Sugar Management, Immune support, Men Health Support',1,'N',4,600,750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,89,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-81','Moringa Extract','Moringa oleifera','20% Total Saponins','Blood Sugar Management, Immune support, Men Health Support',1,'N',4,900,1200,'2020/11/17','13021919',NULL,'Y',1,NULL,1,90,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-82','Safed musli Extract','Chlorophytum borivilianum','20% Saponins','Aphrodisiac, Adaptogen',1,'N',4,1350,1600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,93,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-85','Neem Extract','Azardica indica','2.5% Bitters','Cosmetics, Immunity Booster',1,'N',4,335,385,'2020/11/17','13021919',NULL,'Y',1,NULL,1,94,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-86','Neem Extract','Azardica indica','5% Bitters','Cosmetics, Immunity Booster',1,'N',4,650,750,'2020/11/17','13021919',NULL,'Y',1,NULL,1,95,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-88','Bhui amla Extract','Phyllanthus amarus/Phyllanthus niruri','5% Bitters','Liver Care',1,'N',4,700,800,'2020/11/17','13021919',NULL,'Y',1,NULL,1,38,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-89','Salacia Extract','Salacia reticulata','20% Saponins','Antidiabetic',1,'N',4,2400,2600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,98,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-91','Senna Extract','Cassia angustifolia','10% Sennoside','Laxative',1,'N',1,775,850,'2020/11/17','13021919',NULL,'Y',1,NULL,1,99,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-92','Senna Extract','Cassia angustifolia','20% Sennoside','Laxative',1,'N',1,1500,1600,'2020/11/17','13021919',NULL,'Y',1,NULL,1,101,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-95','Senna Extract','Cassia angustifolia','20% Sennoside','Laxative',1,'N',3,2650,3000,'2020/11/17','13021919',NULL,'Y',1,NULL,1,100,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-98','Shatavari Extract','Asparagus racemosus','20% Saponins','Adaptogen, Women Health Support',1,'N',4,400,475,'2020/11/17','13021919',NULL,'Y',1,NULL,1,102,'2019-12-07 14:57:47','25',NULL,NULL),('NBTSE-99','Shatavari Extract','Asparagus racemosus','40% Saponins','Adaptogen, Women Health Support',1,'N',4,625,700,'2020/11/17','13021919',NULL,'Y',1,NULL,1,103,'2019-12-07 14:57:47','25',NULL,NULL),('TEST0001','Test Product 1','Test Product 1','Test Product 1','Test Product 1',5,'Y',3,0,0,'2019/03/05','TEST00132','','N',1,'2019-12-20 00:00:00',NULL,147,'2019-12-20 00:00:00','500',NULL,NULL);
/*!40000 ALTER TABLE `product_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_method_master`
--

DROP TABLE IF EXISTS `product_method_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_method_master` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_method_master`
--

LOCK TABLES `product_method_master` WRITE;
/*!40000 ALTER TABLE `product_method_master` DISABLE KEYS */;
INSERT INTO `product_method_master` VALUES (0,'NA','2018-12-07 16:24:51',NULL,'N'),(1,'UV','2018-12-07 10:07:37',NULL,'Y'),(2,'TITRATION','2018-12-07 10:07:37',NULL,'Y'),(3,'HPLC','2018-12-07 10:07:37',NULL,'Y'),(4,'GRAVIMETRY','2018-12-07 10:07:37',NULL,'Y'),(5,'HPLC by USP','2018-12-07 10:07:37',NULL,'Y'),(6,'USP','2018-12-07 10:07:37',NULL,'Y'),(7,'IP','2018-12-07 10:07:37',NULL,'Y'),(8,'GC','2018-12-07 10:07:39',NULL,'Y');
/*!40000 ALTER TABLE `product_method_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'PRODUCT','2018-12-07 11:26:57',NULL),(2,'WISH','2018-12-07 11:27:11',NULL);
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_details`
--

DROP TABLE IF EXISTS `production_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_id` int(11) NOT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `source_warehouse` int(11) DEFAULT NULL,
  `required_qty` float DEFAULT NULL,
  `transfered_qty` float DEFAULT NULL,
  `consumed_qty` float DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_details`
--

LOCK TABLES `production_details` WRITE;
/*!40000 ALTER TABLE `production_details` DISABLE KEYS */;
INSERT INTO `production_details` VALUES (1,1,'NBTSE-01',1,50,20,30,6,'2020-02-03',NULL,8);
/*!40000 ALTER TABLE `production_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_master`
--

DROP TABLE IF EXISTS `production_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_number` varchar(45) NOT NULL,
  `items_to_manufacturer` varchar(45) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `BOM_no` varchar(45) DEFAULT NULL,
  `source_warehouse` int(11) DEFAULT NULL,
  `target_warehouse` int(11) DEFAULT NULL,
  `production_start_date` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `remarks` varchar(2000) DEFAULT NULL,
  `qty_uom` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_master`
--

LOCK TABLES `production_master` WRITE;
/*!40000 ALTER TABLE `production_master` DISABLE KEYS */;
INSERT INTO `production_master` VALUES (1,'NBT-PRODUCTION-2020020301','ytes',100,'NBT-BOM-2020020301',1,2,'2019-01-01','2019-01-01','2020-02-03',1,'test remark',6,13,'2020-02-03',1);
/*!40000 ALTER TABLE `production_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_indent`
--

DROP TABLE IF EXISTS `purchase_indent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_indent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_indent_id` varchar(45) NOT NULL,
  `inquiry_no` varchar(45) NOT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `remarks` varchar(2000) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_ready_for_pre_dispatch_docx_list` char(1) DEFAULT 'N',
  `is_arrangement_possible` char(1) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_sample_request` char(1) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_indent`
--

LOCK TABLES `purchase_indent` WRITE;
/*!40000 ALTER TABLE `purchase_indent` DISABLE KEYS */;
INSERT INTO `purchase_indent` VALUES (1,'NBT-PURCHASE-INDENT-2019121901','NBT2019121902',NULL,'sample request came','CUSTOMER_SAMPLE_REQUEST','N','Y','2019-12-19',1,'Y',9,1,'2019-12-20',NULL),(2,'NBT-PURCHASE-INDENT-2019122001','NBT2019122001',NULL,'no sample request','INQUIRY_PROCEED_WITHOUT_SAMPLE','Y','Y','2019-12-20',1,'N',NULL,1,'2019-12-20',NULL),(3,'NBT-PURCHASE-INDENT-2020020301','NBT060819001',NULL,'','PURCAHSE_INDENT_CREADTED','N',NULL,'2020-02-03',1,NULL,NULL,NULL,NULL,NULL),(4,'NBT-PURCHASE-INDENT-2020020304','NBT2019121903',NULL,'','PURCAHSE_INDENT_CREADTED','N',NULL,'2020-02-03',1,NULL,NULL,NULL,NULL,7);
/*!40000 ALTER TABLE `purchase_indent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_indent_details`
--

DROP TABLE IF EXISTS `purchase_indent_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_indent_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_indent_id` varchar(45) NOT NULL,
  `item_code` varchar(45) NOT NULL,
  `botanical_name` varchar(45) DEFAULT NULL,
  `qty` float NOT NULL,
  `uom` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_indent_details`
--

LOCK TABLES `purchase_indent_details` WRITE;
/*!40000 ALTER TABLE `purchase_indent_details` DISABLE KEYS */;
INSERT INTO `purchase_indent_details` VALUES (1,'1','NBTSE-121',NULL,500,8,NULL,NULL,1),(2,'2','NBTDE-09',NULL,10000,8,NULL,NULL,0),(3,'2','NBTDE-530',NULL,456,8,NULL,NULL,0),(4,'2','NBTSE-103',NULL,500,8,NULL,NULL,4),(5,'3','NBTNP-13',NULL,2,6,NULL,NULL,3),(6,'4','NBTDE-09',NULL,10,8,NULL,NULL,0);
/*!40000 ALTER TABLE `purchase_indent_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_number` varchar(45) DEFAULT NULL,
  `ref_type` varchar(45) DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT NULL,
  `po_attachment` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_request_note`
--

DROP TABLE IF EXISTS `purchase_request_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_request_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_request_no` varchar(45) DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `is_verifed_from_purchase_dept` char(1) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `approved_by` varchar(50) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_request_note`
--

LOCK TABLES `purchase_request_note` WRITE;
/*!40000 ALTER TABLE `purchase_request_note` DISABLE KEYS */;
INSERT INTO `purchase_request_note` VALUES (1,'NBT-PRN-2019122301','2019-04-06','Y','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','purchase requisition note created','2019-12-23',1,1,'2019-12-23',NULL,1),(2,'NBT-PRN-2020011301','2020-01-01','Y','PURCHASE_REQUIZATION_NOTE_VERIFIED','test','2020-01-13',1,1,'2020-01-13',NULL,3),(3,'NBT-PRN-2020011401','2020-01-01',NULL,'PURCHASE_REQUIZATION_NOTE_CREATED','PRN added','2020-01-14',1,NULL,NULL,NULL,5),(4,'NBT-PRN-2020020301','2019-01-01','Y','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','Asd','2020-02-03',1,1,'2020-02-10',NULL,7),(5,'NBT-PRN-2020021001','2019-03-02','Y','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','this is PRN request','2020-02-10',1,1,'2020-02-10',NULL,7),(6,'NBT-PRN-2020021006','2020-02-06','Y','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','Added 5  HPLC','2020-02-10',1,1,'2020-02-10',NULL,7);
/*!40000 ALTER TABLE `purchase_request_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_request_note_details`
--

DROP TABLE IF EXISTS `purchase_request_note_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_request_note_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_entry_id` int(11) NOT NULL,
  `item_code` varchar(20) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL,
  `botanical_scientific_name` varchar(45) DEFAULT NULL,
  `item_qty` float DEFAULT NULL,
  `item_uom` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_request_note_details`
--

LOCK TABLES `purchase_request_note_details` WRITE;
/*!40000 ALTER TABLE `purchase_request_note_details` DISABLE KEYS */;
INSERT INTO `purchase_request_note_details` VALUES (1,1,'NBTDE-817','NBTDE-817',NULL,50,8,2),(2,2,'NBTSE-01','NBTSE-01',NULL,500,8,4),(3,3,'NBTSE-01','NBTSE-01',NULL,500,8,8),(4,4,'NBTSE-01','NBTSE-01',NULL,12234,6,8),(5,5,'NBTSE-07','NBTSE-07',NULL,800,8,2),(6,5,'NBTDE-413','NBTDE-413',NULL,500,10,2),(7,6,'NBTDE-534','NBTDE-534',NULL,500,6,3),(8,6,'NBTSE-98','NBTSE-98',NULL,520,8,0),(9,6,'NBTDE-235','NBTDE-235',NULL,1000,10,8),(10,6,'NBTSE-115','NBTSE-115',NULL,56,8,6);
/*!40000 ALTER TABLE `purchase_request_note_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qc_details`
--

DROP TABLE IF EXISTS `qc_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_details` (
  `id` int(11) NOT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  `object_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `document_name` varchar(45) DEFAULT NULL,
  `document_value` varchar(100) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qc_details`
--

LOCK TABLES `qc_details` WRITE;
/*!40000 ALTER TABLE `qc_details` DISABLE KEYS */;
INSERT INTO `qc_details` VALUES (1,'SAMPLE',1,'CUSTOMER_SAMPLE_STATUS_PASS_QC_TEAM',NULL,'2019-12-12',1,'batch number','111111',NULL),(2,'SAMPLE',2,'CUSTOMER_SAMPLE_STATUS_PASS_QC_TEAM',NULL,'2019-12-12',1,'batch number 1','333333',NULL),(3,'SAMPLE',8,'CUSTOMER_SAMPLE_STATUS_PASS_QC_TEAM',NULL,'2020-02-03',1,'batch number 3','111111',7);
/*!40000 ALTER TABLE `qc_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qc_documents_details`
--

DROP TABLE IF EXISTS `qc_documents_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_documents_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qc_ref_id` int(11) DEFAULT NULL,
  `docx_ref_name` varchar(45) DEFAULT NULL,
  `docx_ref_attachment` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qc_documents_details`
--

LOCK TABLES `qc_documents_details` WRITE;
/*!40000 ALTER TABLE `qc_documents_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qc_documents_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qc_remarks_details`
--

DROP TABLE IF EXISTS `qc_remarks_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qc_remarks_details` (
  `id` int(11) NOT NULL,
  `qc_ref_id` int(11) DEFAULT NULL,
  `remarks` varchar(2000) DEFAULT NULL,
  `updated_at` date DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `qc_ref_type` varchar(45) DEFAULT NULL,
  `qc_test_result` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qc_remarks_details`
--

LOCK TABLES `qc_remarks_details` WRITE;
/*!40000 ALTER TABLE `qc_remarks_details` DISABLE KEYS */;
INSERT INTO `qc_remarks_details` VALUES (1,1,'It is passed Sample','2019-12-12',1,'SAMPLE','PASS'),(2,2,'it is passed','2019-12-12',1,'SAMPLE','PASS'),(3,8,'sample id 8 qc result pass','2020-02-03',1,'SAMPLE','PASS');
/*!40000 ALTER TABLE `qc_remarks_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualification` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (1,'Secondary','10th'),(2,'Senior Secondary','12th'),(3,'Bachelor of Arts','BA'),(4,'Bachelor of Business Administration','BBA'),(5,'Bachelor of Computer Application','BCA'),(6,'Bachelor of Engineering','BE'),(7,'Bachelor of Technology','Btech'),(8,'Bachelor of Commerce','B.Com'),(9,'Bachelor of Science','BSc'),(10,'Bachelor of Education','B.Ed'),(11,'Bachelor of Architecture','B.Arch.'),(12,'Master of Arts','M.A.'),(13,'Master of Business Administration','M.B.A.'),(14,'Master of Computer Applications','M.C.A.'),(15,'Master of Engineering','M.E.'),(16,'Master of Philosophy','M.Phil.'),(17,'Master of Science','M.Sc.'),(18,'Master of Technology','M.Tech.'),(19,'Master of Statistics','M.Stat.'),(20,'Master of Laws','LL.M.'),(21,'Master of Commerce','M.Com.'),(22,'Master of Architecture','M.Arch.'),(23,'Master of Veterinary Science','MVSc'),(24,'Master of Philosophy','MPhil'),(25,'Doctorate of Philosophy','PhD');
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qunatity_unit_master`
--

DROP TABLE IF EXISTS `qunatity_unit_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qunatity_unit_master` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `udated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qunatity_unit_master`
--

LOCK TABLES `qunatity_unit_master` WRITE;
/*!40000 ALTER TABLE `qunatity_unit_master` DISABLE KEYS */;
INSERT INTO `qunatity_unit_master` VALUES (1,'PER KG','2018-12-07 11:45:41',NULL),(2,'PER LITER','2018-12-07 11:49:14',NULL);
/*!40000 ALTER TABLE `qunatity_unit_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_approved_vendor`
--

DROP TABLE IF EXISTS `quotation_approved_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_approved_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_req_id` int(11) NOT NULL,
  `supplier_vendor_id` int(11) NOT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `remarks` varchar(200) DEFAULT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_approved_vendor`
--

LOCK TABLES `quotation_approved_vendor` WRITE;
/*!40000 ALTER TABLE `quotation_approved_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_approved_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_approved_vendor_details`
--

DROP TABLE IF EXISTS `quotation_approved_vendor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_approved_vendor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_approved_vendor_id` int(11) DEFAULT NULL,
  `item_id` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `botanical_scientific_name` varchar(45) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  `approx_delivery_day` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_approved_vendor_details`
--

LOCK TABLES `quotation_approved_vendor_details` WRITE;
/*!40000 ALTER TABLE `quotation_approved_vendor_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_approved_vendor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_request_items_details`
--

DROP TABLE IF EXISTS `quotation_request_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_request_items_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_request_id` varchar(45) NOT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `botanical_scientific_name` varchar(45) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `UOM` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `specification` varchar(500) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_request_items_details`
--

LOCK TABLES `quotation_request_items_details` WRITE;
/*!40000 ALTER TABLE `quotation_request_items_details` DISABLE KEYS */;
INSERT INTO `quotation_request_items_details` VALUES (1,'1','NBTDE-817',NULL,NULL,50,8,NULL,2,NULL,'2019-12-23',1),(2,'2','NBTSE-01',NULL,NULL,12234,6,NULL,8,NULL,'2020-02-10',1),(3,'3','NBTSE-07',NULL,NULL,800,8,NULL,2,NULL,'2020-02-10',1),(4,'3','NBTDE-413',NULL,NULL,500,10,NULL,2,NULL,'2020-02-10',1),(5,'3','NBTDE-290',NULL,NULL,5,6,NULL,3,NULL,'2020-02-10',1),(6,'3','NBTSE-60',NULL,NULL,500,8,NULL,6,NULL,'2020-02-10',1),(7,'3','NBTSE-121',NULL,NULL,100,10,NULL,7,NULL,'2020-02-10',1),(8,'4','NBTDE-534',NULL,NULL,500,6,NULL,3,NULL,'2020-02-10',1),(9,'4','NBTSE-98',NULL,NULL,520,8,NULL,0,NULL,'2020-02-10',1),(10,'4','NBTDE-235',NULL,NULL,1000,10,NULL,8,NULL,'2020-02-10',1),(11,'4','NBTSE-115',NULL,NULL,56,8,NULL,6,NULL,'2020-02-10',1),(12,'4','NBTSE-36',NULL,NULL,500,8,NULL,8,NULL,'2020-02-10',1),(13,'4','NBTDE-551',NULL,NULL,100,6,NULL,5,NULL,'2020-02-10',1);
/*!40000 ALTER TABLE `quotation_request_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_request_master`
--

DROP TABLE IF EXISTS `quotation_request_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_request_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_no` varchar(45) NOT NULL,
  `PRN_no` varchar(45) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `other_info` varchar(2000) DEFAULT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_request_master`
--

LOCK TABLES `quotation_request_master` WRITE;
/*!40000 ALTER TABLE `quotation_request_master` DISABLE KEYS */;
INSERT INTO `quotation_request_master` VALUES (1,'NBT-QUOTATION-2019122301','1','2019-12-17','2020-01-19','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','Qutation created',NULL,'Y','2019-12-23',1,NULL,NULL,NULL),(2,'NBT-QUOTATION-2020021001','4','2019-01-01','2019-01-01','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','this is for test entry',NULL,'Y','2020-02-10',1,7,NULL,NULL),(3,'NBT-QUOTATION-2020021003','5','2019-01-01','2019-01-01','PURCHASE_REQUISTION_NUMBER_QUTATION_RECEIVED','this is  test create quotation entry',NULL,'Y','2020-02-10',1,7,NULL,NULL),(4,'NBT-QUOTATION-2020021004','6','2020-03-03','2020-03-18','PURCHASE_REQUISTION_NUMBER_QUTATION_CREATED','this is purchase request add form',NULL,'Y','2020-02-10',1,7,NULL,NULL);
/*!40000 ALTER TABLE `quotation_request_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotation_request_supplier_details`
--

DROP TABLE IF EXISTS `quotation_request_supplier_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_request_supplier_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_request_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `remarks` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotation_request_supplier_details`
--

LOCK TABLES `quotation_request_supplier_details` WRITE;
/*!40000 ALTER TABLE `quotation_request_supplier_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotation_request_supplier_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_details`
--

DROP TABLE IF EXISTS `sample_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sample_id` int(11) NOT NULL,
  `ref_name` varchar(45) NOT NULL,
  `ref_address` varchar(400) DEFAULT NULL,
  `ref_mobile` varchar(20) DEFAULT NULL,
  `ref_email` varchar(45) NOT NULL,
  `city` varchar(10) DEFAULT NULL,
  `sample_response` varchar(1000) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `attachment_1` varchar(45) DEFAULT NULL,
  `attachment_2` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_details`
--

LOCK TABLES `sample_details` WRITE;
/*!40000 ALTER TABLE `sample_details` DISABLE KEYS */;
INSERT INTO `sample_details` VALUES (1,1,'pragya edit','test address','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-12',1,NULL,NULL),(2,2,'pragya edit','test','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-12',1,NULL,NULL),(3,3,'pragya','test','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2020-01-31',1,'2020-01-31',1),(4,4,'pragya','customer Sample request','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-12',1,'2020-01-31',1),(5,5,'pragya','vendor sample request','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-12',1,NULL,NULL),(6,6,'pragya','aSFDGHJ','9568419300','rohilladeenu@gmail.com',NULL,NULL,NULL,'',NULL,'2020-01-31',1,NULL,NULL),(7,7,'pragya','test address here','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-19',1,NULL,NULL),(8,8,'pragya','address hrtr','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2019-12-20',1,'2020-02-04',1),(9,9,'pragya','address are here','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'1576844111.png',NULL,'2019-12-20',1,NULL,NULL),(10,10,'pragya','test entry','9568419300','rohilladeenu@gmail.com',NULL,NULL,NULL,'',NULL,'2020-01-31',1,'2020-02-04',1),(11,11,'Pragya','test adddress will entry here','9568419300','rohillapragyaedit@gmail.com',NULL,NULL,NULL,'1580469975.pdf',NULL,'2020-01-31',1,NULL,NULL),(12,12,'Pragya Chandigarh Location','rohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapragya gmail comrohillapr','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2020-01-31',1,NULL,NULL),(13,13,'Pragya  Aurangabad Location','Aurangabad Location','9568419300','rohilladeenu@gmail.com',NULL,NULL,NULL,'',NULL,'2020-01-31',1,NULL,NULL),(14,14,'pragya','customer Sample request','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2020-02-04',188,NULL,NULL),(15,15,'pragya','customer Sample request','9568419300','rohillapragya@gmail.com',NULL,NULL,NULL,'',NULL,'2020-02-04',188,NULL,NULL),(16,16,'pragya edit','aedsedf','7894561230','webadmin@awgp.org',NULL,NULL,NULL,'',NULL,'2020-02-04',188,NULL,NULL);
/*!40000 ALTER TABLE `sample_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_items_details`
--

DROP TABLE IF EXISTS `sample_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_items_details` (
  `id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `item_code` varchar(45) NOT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `botanical _name` varchar(100) DEFAULT NULL,
  `qunatity` int(11) DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `specification` varchar(200) DEFAULT NULL,
  `others_info` varchar(2000) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_items_details`
--

LOCK TABLES `sample_items_details` WRITE;
/*!40000 ALTER TABLE `sample_items_details` DISABLE KEYS */;
INSERT INTO `sample_items_details` VALUES (1,1,'NBTSE-01',NULL,NULL,5,8,1,NULL,NULL,NULL,'2019-12-12'),(2,2,'NBTSE-01',NULL,NULL,5,8,2,NULL,NULL,NULL,'2019-12-12'),(5,5,'NBTSE-01',NULL,NULL,6,6,0,NULL,NULL,NULL,'2019-12-12'),(10,7,'NBTSE-01',NULL,NULL,500,8,3,NULL,NULL,NULL,'2019-12-19'),(13,9,'NBTSE-121',NULL,NULL,500,8,1,NULL,NULL,NULL,'2019-12-20'),(15,11,'NBTSE-01',NULL,NULL,50,6,8,NULL,NULL,NULL,'2020-01-31'),(16,12,'NBTDE-290',NULL,NULL,500,6,4,NULL,NULL,NULL,'2020-01-31'),(17,3,'NBTSE-29',NULL,NULL,5,6,2,NULL,NULL,NULL,'2020-01-31'),(18,4,'NBTSE-31',NULL,NULL,50,8,1,NULL,NULL,NULL,'2020-01-31'),(19,4,'NBTSE-119',NULL,NULL,100,10,4,NULL,NULL,NULL,'2020-01-31'),(20,13,'NBTSE-01',NULL,NULL,5,6,8,NULL,NULL,NULL,'2020-01-31'),(21,6,'NBTSE-01',NULL,NULL,34,6,0,NULL,NULL,NULL,'2020-01-31'),(22,6,'NBTSE-29',NULL,NULL,56,8,2,NULL,NULL,NULL,'2020-01-31'),(23,8,'NBTDE-961',NULL,NULL,34,6,6,NULL,NULL,NULL,'2020-02-04'),(24,10,'NBTSE-01',NULL,NULL,50,6,0,NULL,NULL,NULL,'2020-02-04'),(25,14,'NBTAQ-48',NULL,NULL,50,8,3,NULL,NULL,NULL,'2020-02-04'),(26,15,'NBTAQ-48',NULL,NULL,50,8,3,NULL,NULL,NULL,'2020-02-04'),(27,16,'NBTSE-01',NULL,NULL,45,6,8,NULL,NULL,NULL,'2020-02-04');
/*!40000 ALTER TABLE `sample_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_master`
--

DROP TABLE IF EXISTS `sample_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_master` (
  `id` int(11) NOT NULL,
  `sample_number` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `request_date` date DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `any_behalf_of` varchar(45) DEFAULT NULL,
  `source_at_team` varchar(45) DEFAULT NULL,
  `updated_at` date DEFAULT current_timestamp(),
  `updated_by` varchar(10) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_master`
--

LOCK TABLES `sample_master` WRITE;
/*!40000 ALTER TABLE `sample_master` DISABLE KEYS */;
INSERT INTO `sample_master` VALUES (1,'NBT-SAMPLE-CUSTOMER-2019121201','CUSTOMER','2019-03-04',NULL,'2019-10-18','CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER','pragya',NULL,'2020-01-14','1','2019-12-12','1',NULL),(2,'NBT-SAMPLE-CUSTOMER-2019121202','CUSTOMER','2019-08-20',NULL,'2019-07-17','CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER','pragya',NULL,'2020-01-07','1','2019-12-12','1',NULL),(3,'NBT-SAMPLE-CUSTOMER-2019121203','CUSTOMER','2019-01-01',NULL,'2019-01-01','CUSTOMER_SAMPLE_RECEIVED_BY_CUSTOMER','pragya',NULL,'2020-02-03','1','2020-01-31','1',5),(4,'NBT-SAMPLE-CUSTOMER-2019121204','CUSTOMER','2019-05-06',NULL,'2019-04-10','CUSTOMER_SAMPLE_DISPATCH_TO_CUSTOMER','pragya',NULL,'2020-02-05','1','2019-12-12','1',8),(5,'NBT-SAMPLE-VENDOR-2019121201','VENDOR','2019-01-01','1970-01-01',NULL,'VENDOR_SAMPLE_RECEIVED','',NULL,'2019-12-12',NULL,'2019-12-12','1',NULL),(6,'NBT-SAMPLE-VENDOR-2019121206','VENDOR','2019-01-01','1970-01-01',NULL,'VENDOR_SAMPLE_RECEIVED','',NULL,'2020-01-31','1','2019-12-12','1',7),(7,'NBT-SAMPLE-CUSTOMER-2019121901','CUSTOMER','2021-11-05',NULL,'2021-04-10','CUSTOMER_SAMPLE_READY_FOR_DISPATCH','pragya',NULL,'2020-02-03','1','2019-12-19','1',NULL),(8,'NBT-SAMPLE-CUSTOMER-2019122001','CUSTOMER','2019-04-05',NULL,'2019-09-19','CUSTOMER_SAMPLE_REQUEST','pragya',NULL,'2020-02-04','1','2019-12-20','1',7),(9,'NBT-SAMPLE-CUSTOMER-2019122009','CUSTOMER','2020-08-19',NULL,'1970-01-01','CUSTOMER_SAMPLE_READY_FOR_DISPATCH','pragya',NULL,'2020-02-03','1','2019-12-20','1',NULL),(10,'NBT-SAMPLE-CUSTOMER-2020013101','CUSTOMER','2019-01-04',NULL,'2019-01-01','CUSTOMER_SAMPLE_REQUEST','pragya',NULL,'2020-02-04','1','2020-01-31','1',8),(11,'NBT-SAMPLE-CUSTOMER-2020013111','CUSTOMER','2019-01-01',NULL,'2019-01-01','CUSTOMER_SAMPLE_REQUEST','pragya',NULL,'2020-01-31',NULL,'2020-01-31','1',7),(12,'NBT-SAMPLE-CUSTOMER-2020013112','CUSTOMER','2019-01-03',NULL,'2020-01-13','CUSTOMER_SAMPLE_REQUEST','Chandigarh Location',NULL,'2020-01-31',NULL,'2020-01-31','1',10),(13,'NBT-SAMPLE-VENDOR-2020013101','VENDOR','2020-01-01','2020-02-13',NULL,'VENDOR_SAMPLE_RECEIVED','Pragya Aurangabad Location',NULL,'2020-01-31',NULL,'2020-01-31','1',7),(14,'NBT-SAMPLE-CUSTOMER-2020020401','CUSTOMER','2020-02-01',NULL,'2020-02-05','CUSTOMER_SAMPLE_REQUEST','pragya',NULL,'2020-02-04',NULL,'2020-02-04','188',1),(15,'NBT-SAMPLE-CUSTOMER-2020020415','CUSTOMER','2020-02-01',NULL,'2020-02-05','CUSTOMER_SAMPLE_REQUEST','pragya',NULL,'2020-02-04',NULL,'2020-02-04','188',1),(16,'NBT-SAMPLE-CUSTOMER-2020020416','CUSTOMER','2020-02-03',NULL,'2020-02-09','CUSTOMER_SAMPLE_REQUEST','p',NULL,'2020-02-04',NULL,'2020-02-04','188',1);
/*!40000 ALTER TABLE `sample_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_store_details`
--

DROP TABLE IF EXISTS `sample_store_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_store_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `bmr` varchar(45) DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  `object_id` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_store_details`
--

LOCK TABLES `sample_store_details` WRITE;
/*!40000 ALTER TABLE `sample_store_details` DISABLE KEYS */;
INSERT INTO `sample_store_details` VALUES (1,'CUSTOMER_SAMPLE_BMR_RECEIVED',NULL,'2019-12-12',1,'BMR003','SAMPLE','1',NULL),(2,'CUSTOMER_SAMPLE_BMR_RECEIVED',NULL,'2019-12-12',1,'BMR002','SAMPLE','2',NULL),(3,'CUSTOMER_SAMPLE_BMR_RECEIVED',NULL,'2020-02-03',1,'BMR003','SAMPLE','8',7);
/*!40000 ALTER TABLE `sample_store_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_store_remarks_details`
--

DROP TABLE IF EXISTS `sample_store_remarks_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_store_remarks_details` (
  `id` int(11) NOT NULL,
  `sample_store_id` int(11) DEFAULT NULL,
  `remarks` varchar(2000) DEFAULT NULL,
  `updated_at` date DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_store_remarks_details`
--

LOCK TABLES `sample_store_remarks_details` WRITE;
/*!40000 ALTER TABLE `sample_store_remarks_details` DISABLE KEYS */;
INSERT INTO `sample_store_remarks_details` VALUES (1,1,'BMR added','2019-12-12',1),(2,2,'Batch Number Added','2019-12-12',1),(3,3,'S','2020-02-03',1);
/*!40000 ALTER TABLE `sample_store_remarks_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_master`
--

DROP TABLE IF EXISTS `session_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_master` (
  `id` varchar(10) NOT NULL,
  `session` varchar(10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_master`
--

LOCK TABLES `session_master` WRITE;
/*!40000 ALTER TABLE `session_master` DISABLE KEYS */;
INSERT INTO `session_master` VALUES ('2019-2020','2019-2020','2019-04-01','2020-03-31'),('2020-2021','2020-2021','2020-04-01','2021-03-31'),('2021-2022','2021-2022','2021-04-01','2022-03-31'),('2022-2023','2022-2023','2022-04-01','2023-03-31');
/*!40000 ALTER TABLE `session_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `code` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  PRIMARY KEY (`code`,`country_code`),
  KEY `fk_State_Country1_idx` (`country_code`),
  CONSTRAINT `fk_State_Country1` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('ANDA','Andaman and Nicobar','INDA'),('ANDH','Andhra Pradesh','INDA'),('ARUN','Arunachal Pradesh','INDA'),('ASSA','Assam','INDA'),('BIHA','Bihar','INDA'),('CHAN','Chandigarh','INDA'),('CHHA','Chhattisgarh','INDA'),('DADR','Dadra and Nagar Haveli','INDA'),('DAMA','Daman and Diu','INDA'),('DELH','NCT Delhi','INDA'),('GOAI','Goa','INDA'),('GUJA','Gujarat','INDA'),('HARY','Haryana','INDA'),('HIMA','Himachal Pradesh','INDA'),('JAKA','Jammu and Kashmir','INDA'),('JHAR','Jharkhand','INDA'),('KARN','Karnataka','INDA'),('KERA','Kerala','INDA'),('LAKS','Lakshadweep','INDA'),('MADY','Madhya Pradesh','INDA'),('MAHA','Maharashtra','INDA'),('MANI','Manipur','INDA'),('MEGH','Meghalaya','INDA'),('MIZO','Mizoram','INDA'),('NAGA','Nagaland','INDA'),('ODIS','Odisha','INDA'),('PUDU','Puducherry','INDA'),('PUNJ','Punjab','INDA'),('RAJA','Rajasthan','INDA'),('SIKK','Sikkim','INDA'),('TAMI','Tamil Nadu','INDA'),('TELA','Telangana','INDA'),('TRIP','Tripura','INDA'),('UTTA','Uttar Pradesh','INDA'),('UTTR','Uttarakhand','INDA'),('WEST','West Bengal','INDA');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1,
  `is_active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_master`
--

LOCK TABLES `state_master` WRITE;
/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` VALUES (1,'Andaman and Nicobar Islands',101,NULL),(2,'Andhra Pradesh',101,NULL),(3,'Arunachal Pradesh',101,NULL),(4,'Assam',101,NULL),(5,'Bihar',101,NULL),(6,'Chandigarh',101,NULL),(7,'Chhattisgarh',101,NULL),(8,'Dadra and Nagar Haveli',101,NULL),(9,'Daman and Diu',101,NULL),(10,'Delhi',101,NULL),(11,'Goa',101,NULL),(12,'Gujarat',101,NULL),(13,'Haryana',101,NULL),(14,'Himachal Pradesh',101,NULL),(15,'Jammu and Kashmir',101,NULL),(16,'Jharkhand',101,NULL),(17,'Karnataka',101,NULL),(18,'Kenmore',101,'N'),(19,'Kerala',101,NULL),(20,'Lakshadweep',101,NULL),(21,'Madhya Pradesh',101,NULL),(22,'Maharashtra',101,NULL),(23,'Manipur',101,NULL),(24,'Meghalaya',101,NULL),(25,'Mizoram',101,NULL),(26,'Nagaland',101,NULL),(27,'Narora',101,'N'),(28,'Natwar',101,'N'),(29,'Odisha',101,NULL),(30,'Paschim Medinipur',101,'N'),(31,'Pondicherry',101,NULL),(32,'Punjab',101,NULL),(33,'Rajasthan',101,NULL),(34,'Sikkim',101,NULL),(35,'Tamil Nadu',101,NULL),(36,'Telangana',101,NULL),(37,'Tripura',101,NULL),(38,'Uttar Pradesh',101,NULL),(39,'Uttarakhand',101,NULL),(40,'Vaishali',101,'N'),(41,'West Bengal',101,NULL),(42,'Badakhshan',1,NULL),(43,'Badgis',1,NULL),(44,'Baglan',1,NULL),(45,'Balkh',1,NULL),(46,'Bamiyan',1,NULL),(47,'Farah',1,NULL),(48,'Faryab',1,NULL),(49,'Gawr',1,NULL),(50,'Gazni',1,NULL),(51,'Herat',1,NULL),(52,'Hilmand',1,NULL),(53,'Jawzjan',1,NULL),(54,'Kabul',1,NULL),(55,'Kapisa',1,NULL),(56,'Khawst',1,NULL),(57,'Kunar',1,NULL),(58,'Lagman',1,NULL),(59,'Lawghar',1,NULL),(60,'Nangarhar',1,NULL),(61,'Nimruz',1,NULL),(62,'Nuristan',1,NULL),(63,'Paktika',1,NULL),(64,'Paktiya',1,NULL),(65,'Parwan',1,NULL),(66,'Qandahar',1,NULL),(67,'Qunduz',1,NULL),(68,'Samangan',1,NULL),(69,'Sar-e Pul',1,'N'),(70,'Takhar',1,NULL),(71,'Uruzgan',1,NULL),(72,'Wardag',1,NULL),(73,'Zabul',1,NULL),(74,'Berat',2,NULL),(75,'Bulqize',2,NULL),(76,'Delvine',2,NULL),(77,'Devoll',2,NULL),(78,'Dibre',2,NULL),(79,'Durres',2,NULL),(80,'Elbasan',2,NULL),(81,'Fier',2,NULL),(82,'Gjirokaster',2,NULL),(83,'Gramsh',2,NULL),(84,'Has',2,NULL),(85,'Kavaje',2,NULL),(86,'Kolonje',2,NULL),(87,'Korce',2,NULL),(88,'Kruje',2,NULL),(89,'Kucove',2,NULL),(90,'Kukes',2,NULL),(91,'Kurbin',2,NULL),(92,'Lezhe',2,NULL),(93,'Librazhd',2,NULL),(94,'Lushnje',2,NULL),(95,'Mallakaster',2,NULL),(96,'Malsi e Madhe',2,'N'),(97,'Mat',2,NULL),(98,'Mirdite',2,NULL),(99,'Peqin',2,NULL),(100,'Permet',2,NULL),(101,'Pogradec',2,NULL),(102,'Puke',2,NULL),(103,'Sarande',2,NULL),(104,'Shkoder',2,NULL),(105,'Skrapar',2,NULL),(106,'Tepelene',2,NULL),(107,'Tirane',2,NULL),(108,'Tropoje',2,NULL),(109,'Vlore',2,NULL),(110,'\'Ayn Daflah',3,'N'),(111,'\'Ayn Tamushanat',3,'N'),(112,'Adrar',3,NULL),(113,'Algiers',3,NULL),(114,'Annabah',3,NULL),(115,'Bashshar',3,NULL),(116,'Batnah',3,NULL),(117,'Bijayah',3,NULL),(118,'Biskrah',3,NULL),(119,'Blidah',3,NULL),(120,'Buirah',3,NULL),(121,'Bumardas',3,NULL),(122,'Burj Bu Arririj',3,'N'),(123,'Ghalizan',3,NULL),(124,'Ghardayah',3,NULL),(125,'Ilizi',3,NULL),(126,'Jijili',3,NULL),(127,'Jilfah',3,NULL),(128,'Khanshalah',3,NULL),(129,'Masilah',3,NULL),(130,'Midyah',3,NULL),(131,'Milah',3,NULL),(132,'Muaskar',3,NULL),(133,'Mustaghanam',3,NULL),(134,'Naama',3,NULL),(135,'Oran',3,NULL),(136,'Ouargla',3,NULL),(137,'Qalmah',3,NULL),(138,'Qustantinah',3,NULL),(139,'Sakikdah',3,NULL),(140,'Satif',3,NULL),(141,'Sayda\'',3,NULL),(142,'Sidi ban-al-\'Abbas',3,'N'),(143,'Suq Ahras',3,'N'),(144,'Tamanghasat',3,NULL),(145,'Tibazah',3,NULL),(146,'Tibissah',3,NULL),(147,'Tilimsan',3,NULL),(148,'Tinduf',3,NULL),(149,'Tisamsilt',3,NULL),(150,'Tiyarat',3,NULL),(151,'Tizi Wazu',3,'N'),(152,'Umm-al-Bawaghi',3,NULL),(153,'Wahran',3,NULL),(154,'Warqla',3,NULL),(155,'Wilaya d Alger',3,'N'),(156,'Wilaya de Bejaia',3,'N'),(157,'Wilaya de Constantine',3,'N'),(158,'al-Aghwat',3,NULL),(159,'al-Bayadh',3,NULL),(160,'al-Jaza\'ir',3,NULL),(161,'al-Wad',3,NULL),(162,'ash-Shalif',3,NULL),(163,'at-Tarif',3,NULL),(164,'Eastern',4,NULL),(165,'Manu\'a',4,NULL),(166,'Swains Island',4,'N'),(167,'Western',4,NULL),(168,'Andorra la Vella',5,'N'),(169,'Canillo',5,NULL),(170,'Encamp',5,NULL),(171,'La Massana',5,'N'),(172,'Les Escaldes',5,'N'),(173,'Ordino',5,NULL),(174,'Sant Julia de Loria',5,'N'),(175,'Bengo',6,NULL),(176,'Benguela',6,NULL),(177,'Bie',6,NULL),(178,'Cabinda',6,NULL),(179,'Cunene',6,NULL),(180,'Huambo',6,NULL),(181,'Huila',6,NULL),(182,'Kuando-Kubango',6,NULL),(183,'Kwanza Norte',6,'N'),(184,'Kwanza Sul',6,'N'),(185,'Luanda',6,NULL),(186,'Lunda Norte',6,'N'),(187,'Lunda Sul',6,'N'),(188,'Malanje',6,NULL),(189,'Moxico',6,NULL),(190,'Namibe',6,NULL),(191,'Uige',6,NULL),(192,'Zaire',6,NULL),(193,'Other Provinces',7,'N'),(194,'Sector claimed by Argentina/Ch',8,'N'),(195,'Sector claimed by Argentina/UK',8,'N'),(196,'Sector claimed by Australia',8,'N'),(197,'Sector claimed by France',8,'N'),(198,'Sector claimed by New Zealand',8,'N'),(199,'Sector claimed by Norway',8,'N'),(200,'Unclaimed Sector',8,'N'),(201,'Barbuda',9,NULL),(202,'Saint George',9,'N'),(203,'Saint John',9,'N'),(204,'Saint Mary',9,'N'),(205,'Saint Paul',9,'N'),(206,'Saint Peter',9,'N'),(207,'Saint Philip',9,'N'),(208,'Buenos Aires',10,'N'),(209,'Catamarca',10,NULL),(210,'Chaco',10,NULL),(211,'Chubut',10,NULL),(212,'Cordoba',10,NULL),(213,'Corrientes',10,NULL),(214,'Distrito Federal',10,'N'),(215,'Entre Rios',10,'N'),(216,'Formosa',10,NULL),(217,'Jujuy',10,NULL),(218,'La Pampa',10,'N'),(219,'La Rioja',10,'N'),(220,'Mendoza',10,NULL),(221,'Misiones',10,NULL),(222,'Neuquen',10,NULL),(223,'Rio Negro',10,'N'),(224,'Salta',10,NULL),(225,'San Juan',10,'N'),(226,'San Luis',10,'N'),(227,'Santa Cruz',10,'N'),(228,'Santa Fe',10,'N'),(229,'Santiago del Estero',10,'N'),(230,'Tierra del Fuego',10,'N'),(231,'Tucuman',10,NULL),(232,'Aragatsotn',11,NULL),(233,'Ararat',11,NULL),(234,'Armavir',11,NULL),(235,'Gegharkunik',11,NULL),(236,'Kotaik',11,NULL),(237,'Lori',11,NULL),(238,'Shirak',11,NULL),(239,'Stepanakert',11,NULL),(240,'Syunik',11,NULL),(241,'Tavush',11,NULL),(242,'Vayots Dzor',11,'N'),(243,'Yerevan',11,NULL),(244,'Aruba',12,NULL),(245,'Auckland',13,NULL),(246,'Australian Capital Territory',13,'N'),(247,'Balgowlah',13,NULL),(248,'Balmain',13,NULL),(249,'Bankstown',13,NULL),(250,'Baulkham Hills',13,'N'),(251,'Bonnet Bay',13,'N'),(252,'Camberwell',13,NULL),(253,'Carole Park',13,'N'),(254,'Castle Hill',13,'N'),(255,'Caulfield',13,NULL),(256,'Chatswood',13,NULL),(257,'Cheltenham',13,NULL),(258,'Cherrybrook',13,NULL),(259,'Clayton',13,NULL),(260,'Collingwood',13,NULL),(261,'Frenchs Forest',13,'N'),(262,'Hawthorn',13,NULL),(263,'Jannnali',13,NULL),(264,'Knoxfield',13,NULL),(265,'Melbourne',13,NULL),(266,'New South Wales',13,'N'),(267,'Northern Territory',13,'N'),(268,'Perth',13,NULL),(269,'Queensland',13,NULL),(270,'South Australia',13,'N'),(271,'Tasmania',13,NULL),(272,'Templestowe',13,NULL),(273,'Victoria',13,NULL),(274,'Werribee south',13,'N'),(275,'Western Australia',13,'N'),(276,'Wheeler',13,NULL),(277,'Bundesland Salzburg',14,'N'),(278,'Bundesland Steiermark',14,'N'),(279,'Bundesland Tirol',14,'N'),(280,'Burgenland',14,NULL),(281,'Carinthia',14,NULL),(282,'Karnten',14,NULL),(283,'Liezen',14,'N'),(284,'Lower Austria',14,'N'),(285,'Niederosterreich',14,NULL),(286,'Oberosterreich',14,NULL),(287,'Salzburg',14,NULL),(288,'Schleswig-Holstein',14,NULL),(289,'Steiermark',14,NULL),(290,'Styria',14,NULL),(291,'Tirol',14,NULL),(292,'Upper Austria',14,'N'),(293,'Vorarlberg',14,NULL),(294,'Wien',14,NULL),(295,'Abseron',15,NULL),(296,'Baki Sahari',15,'N'),(297,'Ganca',15,NULL),(298,'Ganja',15,NULL),(299,'Kalbacar',15,NULL),(300,'Lankaran',15,NULL),(301,'Mil-Qarabax',15,NULL),(302,'Mugan-Salyan',15,NULL),(303,'Nagorni-Qarabax',15,NULL),(304,'Naxcivan',15,NULL),(305,'Priaraks',15,NULL),(306,'Qazax',15,NULL),(307,'Saki',15,NULL),(308,'Sirvan',15,NULL),(309,'Xacmaz',15,NULL),(310,'Abaco',16,NULL),(311,'Acklins Island',16,'N'),(312,'Andros',16,NULL),(313,'Berry Islands',16,'N'),(314,'Biminis',16,NULL),(315,'Cat Island',16,'N'),(316,'Crooked Island',16,'N'),(317,'Eleuthera',16,NULL),(318,'Exuma and Cays',16,'N'),(319,'Grand Bahama',16,'N'),(320,'Inagua Islands',16,'N'),(321,'Long Island',16,'N'),(322,'Mayaguana',16,NULL),(323,'New Providence',16,'N'),(324,'Ragged Island',16,'N'),(325,'Rum Cay',16,'N'),(326,'San Salvador',16,'N'),(327,'\'Isa',17,NULL),(328,'Badiyah',17,NULL),(329,'Hidd',17,NULL),(330,'Jidd Hafs',17,'N'),(331,'Mahama',17,NULL),(332,'Manama',17,NULL),(333,'Sitrah',17,NULL),(334,'al-Manamah',17,NULL),(335,'al-Muharraq',17,NULL),(336,'ar-Rifa\'a',17,NULL),(337,'Bagar Hat',18,'N'),(338,'Bandarban',18,NULL),(339,'Barguna',18,NULL),(340,'Barisal',18,NULL),(341,'Bhola',18,NULL),(342,'Bogora',18,NULL),(343,'Brahman Bariya',18,'N'),(344,'Chandpur',18,NULL),(345,'Chattagam',18,NULL),(346,'Chittagong Division',18,'N'),(347,'Chuadanga',18,NULL),(348,'Dhaka',18,NULL),(349,'Dinajpur',18,NULL),(350,'Faridpur',18,NULL),(351,'Feni',18,NULL),(352,'Gaybanda',18,NULL),(353,'Gazipur',18,NULL),(354,'Gopalganj',18,NULL),(355,'Habiganj',18,NULL),(356,'Jaipur Hat',18,'N'),(357,'Jamalpur',18,NULL),(358,'Jessor',18,NULL),(359,'Jhalakati',18,NULL),(360,'Jhanaydah',18,NULL),(361,'Khagrachhari',18,NULL),(362,'Khulna',18,NULL),(363,'Kishorganj',18,NULL),(364,'Koks Bazar',18,'N'),(365,'Komilla',18,NULL),(366,'Kurigram',18,NULL),(367,'Kushtiya',18,NULL),(368,'Lakshmipur',18,NULL),(369,'Lalmanir Hat',18,'N'),(370,'Madaripur',18,NULL),(371,'Magura',18,NULL),(372,'Maimansingh',18,NULL),(373,'Manikganj',18,NULL),(374,'Maulvi Bazar',18,'N'),(375,'Meherpur',18,NULL),(376,'Munshiganj',18,NULL),(377,'Naral',18,NULL),(378,'Narayanganj',18,NULL),(379,'Narsingdi',18,NULL),(380,'Nator',18,NULL),(381,'Naugaon',18,NULL),(382,'Nawabganj',18,NULL),(383,'Netrakona',18,NULL),(384,'Nilphamari',18,NULL),(385,'Noakhali',18,NULL),(386,'Pabna',18,NULL),(387,'Panchagarh',18,NULL),(388,'Patuakhali',18,NULL),(389,'Pirojpur',18,NULL),(390,'Rajbari',18,NULL),(391,'Rajshahi',18,NULL),(392,'Rangamati',18,NULL),(393,'Rangpur',18,NULL),(394,'Satkhira',18,NULL),(395,'Shariatpur',18,NULL),(396,'Sherpur',18,NULL),(397,'Silhat',18,NULL),(398,'Sirajganj',18,NULL),(399,'Sunamganj',18,NULL),(400,'Tangayal',18,NULL),(401,'Thakurgaon',18,NULL),(402,'Christ Church',19,'N'),(403,'Saint Andrew',19,'N'),(404,'Saint George',19,'N'),(405,'Saint James',19,'N'),(406,'Saint John',19,'N'),(407,'Saint Joseph',19,'N'),(408,'Saint Lucy',19,'N'),(409,'Saint Michael',19,'N'),(410,'Saint Peter',19,'N'),(411,'Saint Philip',19,'N'),(412,'Saint Thomas',19,'N'),(413,'Brest',20,NULL),(414,'Homjel\'',20,NULL),(415,'Hrodna',20,NULL),(416,'Mahiljow',20,NULL),(417,'Mahilyowskaya Voblasts',20,'N'),(418,'Minsk',20,NULL),(419,'Minskaja Voblasts\'',20,'N'),(420,'Petrik',20,NULL),(421,'Vicebsk',20,NULL),(422,'Antwerpen',21,NULL),(423,'Berchem',21,NULL),(424,'Brabant',21,NULL),(425,'Brabant Wallon',21,NULL),(426,'Brussel',21,NULL),(427,'East Flanders',21,'N'),(428,'Hainaut',21,NULL),(429,'Liege',21,NULL),(430,'Limburg',21,NULL),(431,'Luxembourg',21,NULL),(432,'Namur',21,NULL),(433,'Ontario',21,NULL),(434,'Oost-Vlaanderen',21,NULL),(435,'Provincie Brabant',21,'N'),(436,'Vlaams-Brabant',21,NULL),(437,'Wallonne',21,NULL),(438,'West-Vlaanderen',21,NULL),(439,'Belize',22,NULL),(440,'Cayo',22,NULL),(441,'Corozal',22,NULL),(442,'Orange Walk',22,'N'),(443,'Stann Creek',22,'N'),(444,'Toledo',22,NULL),(445,'Alibori',23,NULL),(446,'Atacora',23,NULL),(447,'Atlantique',23,NULL),(448,'Borgou',23,NULL),(449,'Collines',23,NULL),(450,'Couffo',23,NULL),(451,'Donga',23,NULL),(452,'Littoral',23,NULL),(453,'Mono',23,NULL),(454,'Oueme',23,NULL),(455,'Plateau',23,NULL),(456,'Zou',23,NULL),(457,'Hamilton',24,NULL),(458,'Saint George',24,'N'),(459,'Bumthang',25,NULL),(460,'Chhukha',25,NULL),(461,'Chirang',25,NULL),(462,'Daga',25,NULL),(463,'Geylegphug',25,NULL),(464,'Ha',25,NULL),(465,'Lhuntshi',25,NULL),(466,'Mongar',25,NULL),(467,'Pemagatsel',25,NULL),(468,'Punakha',25,NULL),(469,'Rinpung',25,NULL),(470,'Samchi',25,NULL),(471,'Samdrup Jongkhar',25,'N'),(472,'Shemgang',25,NULL),(473,'Tashigang',25,NULL),(474,'Timphu',25,NULL),(475,'Tongsa',25,NULL),(476,'Wangdiphodrang',25,NULL),(477,'Beni',26,NULL),(478,'Chuquisaca',26,NULL),(479,'Cochabamba',26,NULL),(480,'La Paz',26,'N'),(481,'Oruro',26,NULL),(482,'Pando',26,NULL),(483,'Potosi',26,NULL),(484,'Santa Cruz',26,'N'),(485,'Tarija',26,NULL),(486,'Federacija Bosna i Hercegovina',27,'N'),(487,'Republika Srpska',27,'N'),(488,'Central Bobonong',28,'N'),(489,'Central Boteti',28,'N'),(490,'Central Mahalapye',28,'N'),(491,'Central Serowe-Palapye',28,'N'),(492,'Central Tutume',28,'N'),(493,'Chobe',28,NULL),(494,'Francistown',28,NULL),(495,'Gaborone',28,NULL),(496,'Ghanzi',28,NULL),(497,'Jwaneng',28,NULL),(498,'Kgalagadi North',28,'N'),(499,'Kgalagadi South',28,'N'),(500,'Kgatleng',28,NULL),(501,'Kweneng',28,NULL),(502,'Lobatse',28,NULL),(503,'Ngamiland',28,NULL),(504,'Ngwaketse',28,NULL),(505,'North East',28,'N'),(506,'Okavango',28,NULL),(507,'Orapa',28,NULL),(508,'Selibe Phikwe',28,'N'),(509,'South East',28,'N'),(510,'Sowa',28,NULL),(511,'Bouvet Island',29,'N'),(512,'Acre',30,NULL),(513,'Alagoas',30,NULL),(514,'Amapa',30,NULL),(515,'Amazonas',30,NULL),(516,'Bahia',30,NULL),(517,'Ceara',30,NULL),(518,'Distrito Federal',30,'N'),(519,'Espirito Santo',30,'N'),(520,'Estado de Sao Paulo',30,'N'),(521,'Goias',30,NULL),(522,'Maranhao',30,NULL),(523,'Mato Grosso',30,'N'),(524,'Mato Grosso do Sul',30,'N'),(525,'Minas Gerais',30,'N'),(526,'Para',30,NULL),(527,'Paraiba',30,NULL),(528,'Parana',30,NULL),(529,'Pernambuco',30,NULL),(530,'Piaui',30,NULL),(531,'Rio Grande do Norte',30,'N'),(532,'Rio Grande do Sul',30,'N'),(533,'Rio de Janeiro',30,'N'),(534,'Rondonia',30,NULL),(535,'Roraima',30,NULL),(536,'Santa Catarina',30,'N'),(537,'Sao Paulo',30,'N'),(538,'Sergipe',30,NULL),(539,'Tocantins',30,NULL),(540,'British Indian Ocean Territory',31,'N'),(541,'Belait',32,NULL),(542,'Brunei-Muara',32,NULL),(543,'Temburong',32,NULL),(544,'Tutong',32,NULL),(545,'Blagoevgrad',33,NULL),(546,'Burgas',33,NULL),(547,'Dobrich',33,NULL),(548,'Gabrovo',33,NULL),(549,'Haskovo',33,NULL),(550,'Jambol',33,NULL),(551,'Kardzhali',33,NULL),(552,'Kjustendil',33,NULL),(553,'Lovech',33,NULL),(554,'Montana',33,NULL),(555,'Oblast Sofiya-Grad',33,'N'),(556,'Pazardzhik',33,NULL),(557,'Pernik',33,NULL),(558,'Pleven',33,NULL),(559,'Plovdiv',33,NULL),(560,'Razgrad',33,NULL),(561,'Ruse',33,NULL),(562,'Shumen',33,NULL),(563,'Silistra',33,NULL),(564,'Sliven',33,NULL),(565,'Smoljan',33,NULL),(566,'Sofija grad',33,'N'),(567,'Sofijska oblast',33,'N'),(568,'Stara Zagora',33,'N'),(569,'Targovishte',33,NULL),(570,'Varna',33,NULL),(571,'Veliko Tarnovo',33,'N'),(572,'Vidin',33,NULL),(573,'Vraca',33,NULL),(574,'Yablaniza',33,NULL),(575,'Bale',34,NULL),(576,'Bam',34,NULL),(577,'Bazega',34,NULL),(578,'Bougouriba',34,NULL),(579,'Boulgou',34,NULL),(580,'Boulkiemde',34,NULL),(581,'Comoe',34,NULL),(582,'Ganzourgou',34,NULL),(583,'Gnagna',34,NULL),(584,'Gourma',34,NULL),(585,'Houet',34,NULL),(586,'Ioba',34,NULL),(587,'Kadiogo',34,NULL),(588,'Kenedougou',34,NULL),(589,'Komandjari',34,NULL),(590,'Kompienga',34,NULL),(591,'Kossi',34,NULL),(592,'Kouritenga',34,NULL),(593,'Kourweogo',34,NULL),(594,'Leraba',34,NULL),(595,'Mouhoun',34,NULL),(596,'Nahouri',34,NULL),(597,'Namentenga',34,NULL),(598,'Noumbiel',34,NULL),(599,'Oubritenga',34,NULL),(600,'Oudalan',34,NULL),(601,'Passore',34,NULL),(602,'Poni',34,NULL),(603,'Sanguie',34,NULL),(604,'Sanmatenga',34,NULL),(605,'Seno',34,NULL),(606,'Sissili',34,NULL),(607,'Soum',34,NULL),(608,'Sourou',34,NULL),(609,'Tapoa',34,NULL),(610,'Tuy',34,NULL),(611,'Yatenga',34,NULL),(612,'Zondoma',34,NULL),(613,'Zoundweogo',34,NULL),(614,'Bubanza',35,NULL),(615,'Bujumbura',35,NULL),(616,'Bururi',35,NULL),(617,'Cankuzo',35,NULL),(618,'Cibitoke',35,NULL),(619,'Gitega',35,NULL),(620,'Karuzi',35,NULL),(621,'Kayanza',35,NULL),(622,'Kirundo',35,NULL),(623,'Makamba',35,NULL),(624,'Muramvya',35,NULL),(625,'Muyinga',35,NULL),(626,'Ngozi',35,NULL),(627,'Rutana',35,NULL),(628,'Ruyigi',35,NULL),(629,'Banteay Mean Chey',36,'N'),(630,'Bat Dambang',36,'N'),(631,'Kampong Cham',36,'N'),(632,'Kampong Chhnang',36,'N'),(633,'Kampong Spoeu',36,'N'),(634,'Kampong Thum',36,'N'),(635,'Kampot',36,NULL),(636,'Kandal',36,NULL),(637,'Kaoh Kong',36,'N'),(638,'Kracheh',36,NULL),(639,'Krong Kaeb',36,'N'),(640,'Krong Pailin',36,'N'),(641,'Krong Preah Sihanouk',36,'N'),(642,'Mondol Kiri',36,'N'),(643,'Otdar Mean Chey',36,'N'),(644,'Phnum Penh',36,'N'),(645,'Pousat',36,NULL),(646,'Preah Vihear',36,'N'),(647,'Prey Veaeng',36,'N'),(648,'Rotanak Kiri',36,'N'),(649,'Siem Reab',36,'N'),(650,'Stueng Traeng',36,'N'),(651,'Svay Rieng',36,'N'),(652,'Takaev',36,NULL),(653,'Adamaoua',37,NULL),(654,'Centre',37,NULL),(655,'Est',37,NULL),(656,'Littoral',37,NULL),(657,'Nord',37,NULL),(658,'Nord Extreme',37,NULL),(659,'Nordouest',37,NULL),(660,'Ouest',37,NULL),(661,'Sud',37,NULL),(662,'Sudouest',37,NULL),(663,'Alberta',38,NULL),(664,'British Columbia',38,'N'),(665,'Manitoba',38,NULL),(666,'New Brunswick',38,'N'),(667,'Newfoundland and Labrador',38,'N'),(668,'Northwest Territories',38,'N'),(669,'Nova Scotia',38,'N'),(670,'Nunavut',38,NULL),(671,'Ontario',38,NULL),(672,'Prince Edward Island',38,'N'),(673,'Quebec',38,NULL),(674,'Saskatchewan',38,NULL),(675,'Yukon',38,NULL),(676,'Boavista',39,NULL),(677,'Brava',39,NULL),(678,'Fogo',39,NULL),(679,'Maio',39,NULL),(680,'Sal',39,NULL),(681,'Santo Antao',39,'N'),(682,'Sao Nicolau',39,'N'),(683,'Sao Tiago',39,'N'),(684,'Sao Vicente',39,'N'),(685,'Grand Cayman',40,'N'),(686,'Bamingui-Bangoran',41,NULL),(687,'Bangui',41,NULL),(688,'Basse-Kotto',41,NULL),(689,'Haut-Mbomou',41,NULL),(690,'Haute-Kotto',41,NULL),(691,'Kemo',41,NULL),(692,'Lobaye',41,NULL),(693,'Mambere-Kadei',41,NULL),(694,'Mbomou',41,NULL),(695,'Nana-Gribizi',41,NULL),(696,'Nana-Mambere',41,NULL),(697,'Ombella Mpoko',41,'N'),(698,'Ouaka',41,NULL),(699,'Ouham',41,NULL),(700,'Ouham-Pende',41,NULL),(701,'Sangha-Mbaere',41,NULL),(702,'Vakaga',41,NULL),(703,'Batha',42,NULL),(704,'Biltine',42,NULL),(705,'Bourkou-Ennedi-Tibesti',42,NULL),(706,'Chari-Baguirmi',42,NULL),(707,'Guera',42,NULL),(708,'Kanem',42,NULL),(709,'Lac',42,NULL),(710,'Logone Occidental',42,'N'),(711,'Logone Oriental',42,'N'),(712,'Mayo-Kebbi',42,NULL),(713,'Moyen-Chari',42,NULL),(714,'Ouaddai',42,NULL),(715,'Salamat',42,NULL),(716,'Tandjile',42,NULL),(717,'Aisen',43,NULL),(718,'Antofagasta',43,NULL),(719,'Araucania',43,NULL),(720,'Atacama',43,NULL),(721,'Bio Bio',43,'N'),(722,'Coquimbo',43,NULL),(723,'Libertador General Bernardo O\'',43,'N'),(724,'Los Lagos',43,'N'),(725,'Magellanes',43,NULL),(726,'Maule',43,NULL),(727,'Metropolitana',43,NULL),(728,'Metropolitana de Santiago',43,NULL),(729,'Tarapaca',43,NULL),(730,'Valparaiso',43,NULL),(731,'Anhui',44,NULL),(734,'Aomen',44,NULL),(735,'Beijing',44,NULL),(736,'Beijing Shi',44,NULL),(737,'Chongqing',44,NULL),(738,'Fujian',44,NULL),(740,'Gansu',44,NULL),(741,'Guangdong',44,NULL),(743,'Guangxi',44,NULL),(744,'Guizhou',44,NULL),(745,'Hainan',44,NULL),(746,'Hebei',44,NULL),(747,'Heilongjiang',44,NULL),(748,'Henan',44,NULL),(749,'Hubei',44,NULL),(750,'Hunan',44,NULL),(751,'Jiangsu',44,NULL),(753,'Jiangxi',44,NULL),(754,'Jilin',44,NULL),(755,'Liaoning',44,NULL),(757,'Nei Monggol',44,'N'),(758,'Ningxia Hui',44,'N'),(759,'Qinghai',44,NULL),(760,'Shaanxi',44,NULL),(761,'Shandong',44,NULL),(763,'Shanghai',44,NULL),(764,'Shanxi',44,NULL),(765,'Sichuan',44,NULL),(766,'Tianjin',44,NULL),(767,'Xianggang',44,NULL),(768,'Xinjiang',44,NULL),(769,'Xizang',44,NULL),(770,'Yunnan',44,NULL),(771,'Zhejiang',44,NULL),(773,'Christmas Island',45,'N'),(774,'Cocos (Keeling) Islands',46,'N'),(775,'Amazonas',47,NULL),(776,'Antioquia',47,NULL),(777,'Arauca',47,NULL),(778,'Atlantico',47,NULL),(779,'Bogota',47,NULL),(780,'Bolivar',47,NULL),(781,'Boyaca',47,NULL),(782,'Caldas',47,NULL),(783,'Caqueta',47,NULL),(784,'Casanare',47,NULL),(785,'Cauca',47,NULL),(786,'Cesar',47,NULL),(787,'Choco',47,NULL),(788,'Cordoba',47,NULL),(789,'Cundinamarca',47,NULL),(790,'Guainia',47,NULL),(791,'Guaviare',47,NULL),(792,'Huila',47,NULL),(793,'La Guajira',47,'N'),(794,'Magdalena',47,NULL),(795,'Meta',47,NULL),(796,'Narino',47,NULL),(797,'Norte de Santander',47,'N'),(798,'Putumayo',47,NULL),(799,'Quindio',47,NULL),(800,'Risaralda',47,NULL),(801,'San Andres y Providencia',47,'N'),(802,'Santander',47,NULL),(803,'Sucre',47,NULL),(804,'Tolima',47,NULL),(805,'Valle del Cauca',47,NULL),(806,'Vaupes',47,NULL),(807,'Vichada',47,NULL),(808,'Mwali',48,NULL),(809,'Njazidja',48,NULL),(810,'Nzwani',48,NULL),(811,'Bouenza',49,NULL),(812,'Brazzaville',49,NULL),(813,'Cuvette',49,NULL),(814,'Kouilou',49,NULL),(815,'Lekoumou',49,NULL),(816,'Likouala',49,NULL),(817,'Niari',49,NULL),(818,'Plateaux',49,NULL),(819,'Pool',49,NULL),(820,'Sangha',49,NULL),(821,'Bandundu',50,NULL),(822,'Bas-Congo',50,NULL),(823,'Equateur',50,NULL),(824,'Haut-Congo',50,NULL),(825,'Kasai-Occidental',50,NULL),(826,'Kasai-Oriental',50,NULL),(827,'Katanga',50,NULL),(828,'Kinshasa',50,NULL),(829,'Maniema',50,NULL),(830,'Nord-Kivu',50,NULL),(831,'Sud-Kivu',50,NULL),(832,'Aitutaki',51,NULL),(833,'Atiu',51,NULL),(834,'Mangaia',51,NULL),(835,'Manihiki',51,NULL),(836,'Mauke',51,NULL),(837,'Mitiaro',51,NULL),(838,'Nassau',51,NULL),(839,'Pukapuka',51,NULL),(840,'Rakahanga',51,NULL),(841,'Rarotonga',51,NULL),(842,'Tongareva',51,NULL),(843,'Alajuela',52,NULL),(844,'Cartago',52,NULL),(845,'Guanacaste',52,NULL),(846,'Heredia',52,NULL),(847,'Limon',52,NULL),(848,'Puntarenas',52,NULL),(849,'San Jose',52,'N'),(850,'Abidjan',53,NULL),(851,'Agneby',53,NULL),(852,'Bafing',53,NULL),(853,'Denguele',53,NULL),(854,'Dix-huit Montagnes',53,'N'),(855,'Fromager',53,NULL),(856,'Haut-Sassandra',53,NULL),(857,'Lacs',53,NULL),(858,'Lagunes',53,NULL),(859,'Marahoue',53,NULL),(860,'Moyen-Cavally',53,NULL),(861,'Moyen-Comoe',53,NULL),(862,'N\'zi-Comoe',53,NULL),(863,'Sassandra',53,NULL),(864,'Savanes',53,NULL),(865,'Sud-Bandama',53,NULL),(866,'Sud-Comoe',53,NULL),(867,'Vallee du Bandama',53,'N'),(868,'Worodougou',53,NULL),(869,'Zanzan',53,NULL),(870,'Bjelovar-Bilogora',54,NULL),(871,'Dubrovnik-Neretva',54,NULL),(872,'Grad Zagreb',54,'N'),(873,'Istra',54,NULL),(874,'Karlovac',54,NULL),(875,'Koprivnica-Krizhevci',54,NULL),(876,'Krapina-Zagorje',54,NULL),(877,'Lika-Senj',54,NULL),(878,'Medhimurje',54,NULL),(879,'Medimurska Zupanija',54,'N'),(880,'Osijek-Baranja',54,NULL),(881,'Osjecko-Baranjska Zupanija',54,'N'),(882,'Pozhega-Slavonija',54,NULL),(883,'Primorje-Gorski Kotar',54,'N'),(884,'Shibenik-Knin',54,NULL),(885,'Sisak-Moslavina',54,NULL),(886,'Slavonski Brod-Posavina',54,'N'),(887,'Split-Dalmacija',54,NULL),(888,'Varazhdin',54,NULL),(889,'Virovitica-Podravina',54,NULL),(890,'Vukovar-Srijem',54,NULL),(891,'Zadar',54,NULL),(892,'Zagreb',54,NULL),(893,'Camaguey',55,NULL),(894,'Ciego de Avila',55,'N'),(895,'Cienfuegos',55,NULL),(896,'Ciudad de la Habana',55,'N'),(897,'Granma',55,NULL),(898,'Guantanamo',55,NULL),(899,'Habana',55,NULL),(900,'Holguin',55,NULL),(901,'Isla de la Juventud',55,'N'),(902,'La Habana',55,'N'),(903,'Las Tunas',55,'N'),(904,'Matanzas',55,NULL),(905,'Pinar del Rio',55,'N'),(906,'Sancti Spiritus',55,'N'),(907,'Santiago de Cuba',55,'N'),(908,'Villa Clara',55,'N'),(909,'Government controlled area',56,'N'),(910,'Limassol',56,NULL),(911,'Nicosia District',56,'N'),(912,'Paphos',56,NULL),(913,'Turkish controlled area',56,'N'),(914,'Central Bohemian',57,'N'),(915,'Frycovice',57,NULL),(916,'Jihocesky Kraj',57,'N'),(917,'Jihochesky',57,NULL),(918,'Jihomoravsky',57,NULL),(919,'Karlovarsky',57,NULL),(920,'Klecany',57,NULL),(921,'Kralovehradecky',57,NULL),(922,'Liberecky',57,NULL),(923,'Lipov',57,NULL),(924,'Moravskoslezsky',57,NULL),(925,'Olomoucky',57,NULL),(926,'Olomoucky Kraj',57,NULL),(927,'Pardubicky',57,NULL),(928,'Plzensky',57,NULL),(929,'Praha',57,NULL),(930,'Rajhrad',57,NULL),(931,'Smirice',57,NULL),(932,'South Moravian',57,'N'),(933,'Straz nad Nisou',57,'N'),(934,'Stredochesky',57,NULL),(935,'Unicov',57,NULL),(936,'Ustecky',57,NULL),(937,'Valletta',57,NULL),(938,'Velesin',57,NULL),(939,'Vysochina',57,NULL),(940,'Zlinsky',57,NULL),(941,'Arhus',58,NULL),(942,'Bornholm',58,NULL),(943,'Frederiksborg',58,NULL),(944,'Fyn',58,NULL),(945,'Hovedstaden',58,NULL),(946,'Kobenhavn',58,NULL),(947,'Kobenhavns Amt',58,'N'),(948,'Kobenhavns Kommune',58,'N'),(949,'Nordjylland',58,NULL),(950,'Ribe',58,NULL),(951,'Ringkobing',58,NULL),(952,'Roervig',58,NULL),(953,'Roskilde',58,NULL),(954,'Roslev',58,NULL),(955,'Sjaelland',58,NULL),(956,'Soeborg',58,NULL),(957,'Sonderjylland',58,NULL),(958,'Storstrom',58,NULL),(959,'Syddanmark',58,NULL),(960,'Toelloese',58,NULL),(961,'Vejle',58,NULL),(962,'Vestsjalland',58,NULL),(963,'Viborg',58,NULL),(964,'\'Ali Sabih',59,'N'),(965,'Dikhil',59,NULL),(966,'Jibuti',59,NULL),(967,'Tajurah',59,NULL),(968,'Ubuk',59,NULL),(969,'Saint Andrew',60,'N'),(970,'Saint David',60,'N'),(971,'Saint George',60,'N'),(972,'Saint John',60,'N'),(973,'Saint Joseph',60,'N'),(974,'Saint Luke',60,'N'),(975,'Saint Mark',60,'N'),(976,'Saint Patrick',60,'N'),(977,'Saint Paul',60,'N'),(978,'Saint Peter',60,'N'),(979,'Azua',61,NULL),(980,'Bahoruco',61,NULL),(981,'Barahona',61,NULL),(982,'Dajabon',61,NULL),(983,'Distrito Nacional',61,'N'),(984,'Duarte',61,NULL),(985,'El Seybo',61,'N'),(986,'Elias Pina',61,'N'),(987,'Espaillat',61,NULL),(988,'Hato Mayor',61,'N'),(989,'Independencia',61,NULL),(990,'La Altagracia',61,'N'),(991,'La Romana',61,'N'),(992,'La Vega',61,'N'),(993,'Maria Trinidad Sanchez',61,'N'),(994,'Monsenor Nouel',61,'N'),(995,'Monte Cristi',61,'N'),(996,'Monte Plata',61,'N'),(997,'Pedernales',61,NULL),(998,'Peravia',61,NULL),(999,'Puerto Plata',61,'N'),(1000,'Salcedo',61,NULL),(1001,'Samana',61,NULL),(1002,'San Cristobal',61,'N'),(1003,'San Juan',61,'N'),(1004,'San Pedro de Macoris',61,'N'),(1005,'Sanchez Ramirez',61,'N'),(1006,'Santiago',61,NULL),(1007,'Santiago Rodriguez',61,NULL),(1008,'Valverde',61,NULL),(1009,'Aileu',62,NULL),(1010,'Ainaro',62,NULL),(1011,'Ambeno',62,NULL),(1012,'Baucau',62,NULL),(1013,'Bobonaro',62,NULL),(1014,'Cova Lima',62,'N'),(1015,'Dili',62,NULL),(1016,'Ermera',62,NULL),(1017,'Lautem',62,NULL),(1018,'Liquica',62,NULL),(1019,'Manatuto',62,NULL),(1020,'Manufahi',62,NULL),(1021,'Viqueque',62,NULL),(1022,'Azuay',63,NULL),(1023,'Bolivar',63,NULL),(1024,'Canar',63,NULL),(1025,'Carchi',63,NULL),(1026,'Chimborazo',63,NULL),(1027,'Cotopaxi',63,NULL),(1028,'El Oro',63,'N'),(1029,'Esmeraldas',63,NULL),(1030,'Galapagos',63,NULL),(1031,'Guayas',63,NULL),(1032,'Imbabura',63,NULL),(1033,'Loja',63,NULL),(1034,'Los Rios',63,'N'),(1035,'Manabi',63,NULL),(1036,'Morona Santiago',63,'N'),(1037,'Napo',63,NULL),(1038,'Orellana',63,NULL),(1039,'Pastaza',63,NULL),(1040,'Pichincha',63,NULL),(1041,'Sucumbios',63,NULL),(1042,'Tungurahua',63,NULL),(1043,'Zamora Chinchipe',63,'N'),(1044,'Aswan',64,NULL),(1045,'Asyut',64,NULL),(1046,'Bani Suwayf',64,'N'),(1047,'Bur Sa\'id',64,'N'),(1048,'Cairo',64,NULL),(1049,'Dumyat',64,NULL),(1050,'Kafr-ash-Shaykh',64,NULL),(1051,'Matruh',64,NULL),(1052,'Muhafazat ad Daqahliyah',64,'N'),(1053,'Muhafazat al Fayyum',64,'N'),(1054,'Muhafazat al Gharbiyah',64,'N'),(1055,'Muhafazat al Iskandariyah',64,'N'),(1056,'Muhafazat al Qahirah',64,'N'),(1057,'Qina',64,NULL),(1058,'Sawhaj',64,NULL),(1059,'Sina al-Janubiyah',64,'N'),(1060,'Sina ash-Shamaliyah',64,'N'),(1061,'ad-Daqahliyah',64,NULL),(1062,'al-Bahr-al-Ahmar',64,NULL),(1063,'al-Buhayrah',64,NULL),(1064,'al-Fayyum',64,NULL),(1065,'al-Gharbiyah',64,NULL),(1066,'al-Iskandariyah',64,NULL),(1067,'al-Ismailiyah',64,NULL),(1068,'al-Jizah',64,NULL),(1069,'al-Minufiyah',64,NULL),(1070,'al-Minya',64,NULL),(1071,'al-Qahira',64,NULL),(1072,'al-Qalyubiyah',64,NULL),(1073,'al-Uqsur',64,NULL),(1074,'al-Wadi al-Jadid',64,'N'),(1075,'as-Suways',64,NULL),(1076,'ash-Sharqiyah',64,NULL),(1077,'Ahuachapan',65,NULL),(1078,'Cabanas',65,NULL),(1079,'Chalatenango',65,NULL),(1080,'Cuscatlan',65,NULL),(1081,'La Libertad',65,'N'),(1082,'La Paz',65,'N'),(1083,'La Union',65,'N'),(1084,'Morazan',65,NULL),(1085,'San Miguel',65,'N'),(1086,'San Salvador',65,'N'),(1087,'San Vicente',65,'N'),(1088,'Santa Ana',65,'N'),(1089,'Sonsonate',65,NULL),(1090,'Usulutan',65,NULL),(1091,'Annobon',66,NULL),(1092,'Bioko Norte',66,'N'),(1093,'Bioko Sur',66,'N'),(1094,'Centro Sur',66,'N'),(1095,'Kie-Ntem',66,NULL),(1096,'Litoral',66,NULL),(1097,'Wele-Nzas',66,NULL),(1098,'Anseba',67,NULL),(1099,'Debub',67,NULL),(1100,'Debub-Keih-Bahri',67,NULL),(1101,'Gash-Barka',67,NULL),(1102,'Maekel',67,NULL),(1103,'Semien-Keih-Bahri',67,NULL),(1104,'Harju',68,NULL),(1105,'Hiiu',68,NULL),(1106,'Ida-Viru',68,NULL),(1107,'Jarva',68,NULL),(1108,'Jogeva',68,NULL),(1109,'Laane',68,NULL),(1110,'Laane-Viru',68,NULL),(1111,'Parnu',68,NULL),(1112,'Polva',68,NULL),(1113,'Rapla',68,NULL),(1114,'Saare',68,NULL),(1115,'Tartu',68,NULL),(1116,'Valga',68,NULL),(1117,'Viljandi',68,NULL),(1118,'Voru',68,NULL),(1119,'Addis Abeba',69,'N'),(1120,'Afar',69,NULL),(1121,'Amhara',69,NULL),(1122,'Benishangul',69,NULL),(1123,'Diredawa',69,NULL),(1124,'Gambella',69,NULL),(1125,'Harar',69,NULL),(1126,'Jigjiga',69,NULL),(1127,'Mekele',69,'N'),(1128,'Oromia',69,NULL),(1129,'Somali',69,NULL),(1130,'Southern',69,NULL),(1131,'Tigray',69,NULL),(1132,'Christmas Island',70,'N'),(1133,'Cocos Islands',70,'N'),(1134,'Coral Sea Islands',70,'N'),(1135,'Falkland Islands',71,'N'),(1136,'South Georgia',71,'N'),(1137,'Klaksvik',72,NULL),(1138,'Nor ara Eysturoy',72,'N'),(1139,'Nor oy',72,'N'),(1140,'Sandoy',72,NULL),(1141,'Streymoy',72,NULL),(1142,'Su uroy',72,'N'),(1143,'Sy ra Eysturoy',72,'N'),(1144,'Torshavn',72,NULL),(1145,'Vaga',72,NULL),(1146,'Central',73,NULL),(1147,'Eastern',73,NULL),(1148,'Northern',73,NULL),(1149,'South Pacific',73,'N'),(1150,'Western',73,NULL),(1151,'Ahvenanmaa',74,NULL),(1152,'Etela-Karjala',74,NULL),(1153,'Etela-Pohjanmaa',74,NULL),(1154,'Etela-Savo',74,NULL),(1155,'Etela-Suomen Laani',74,'N'),(1156,'Ita-Suomen Laani',74,'N'),(1157,'Ita-Uusimaa',74,NULL),(1158,'Kainuu',74,NULL),(1159,'Kanta-Hame',74,NULL),(1160,'Keski-Pohjanmaa',74,NULL),(1161,'Keski-Suomi',74,NULL),(1162,'Kymenlaakso',74,NULL),(1163,'Lansi-Suomen Laani',74,'N'),(1164,'Lappi',74,NULL),(1165,'Northern Savonia',74,'N'),(1166,'Ostrobothnia',74,NULL),(1167,'Oulun Laani',74,'N'),(1168,'Paijat-Hame',74,NULL),(1169,'Pirkanmaa',74,NULL),(1170,'Pohjanmaa',74,NULL),(1171,'Pohjois-Karjala',74,NULL),(1172,'Pohjois-Pohjanmaa',74,NULL),(1173,'Pohjois-Savo',74,NULL),(1174,'Saarijarvi',74,NULL),(1175,'Satakunta',74,NULL),(1176,'Southern Savonia',74,'N'),(1177,'Tavastia Proper',74,'N'),(1178,'Uleaborgs Lan',74,'N'),(1179,'Uusimaa',74,NULL),(1180,'Varsinais-Suomi',74,NULL),(1181,'Ain',75,NULL),(1182,'Aisne',75,NULL),(1183,'Albi Le Sequestre',75,'N'),(1184,'Allier',75,NULL),(1185,'Alpes-Cote dAzur',75,'N'),(1186,'Alpes-Maritimes',75,NULL),(1187,'Alpes-de-Haute-Provence',75,NULL),(1188,'Alsace',75,NULL),(1189,'Aquitaine',75,NULL),(1190,'Ardeche',75,NULL),(1191,'Ardennes',75,NULL),(1192,'Ariege',75,NULL),(1193,'Aube',75,NULL),(1194,'Aude',75,NULL),(1195,'Auvergne',75,NULL),(1196,'Aveyron',75,NULL),(1197,'Bas-Rhin',75,NULL),(1198,'Basse-Normandie',75,NULL),(1199,'Bouches-du-Rhone',75,NULL),(1200,'Bourgogne',75,NULL),(1201,'Bretagne',75,NULL),(1202,'Brittany',75,NULL),(1203,'Burgundy',75,NULL),(1204,'Calvados',75,NULL),(1205,'Cantal',75,NULL),(1206,'Cedex',75,NULL),(1207,'Centre',75,NULL),(1208,'Charente',75,NULL),(1209,'Charente-Maritime',75,NULL),(1210,'Cher',75,NULL),(1211,'Correze',75,NULL),(1212,'Corse-du-Sud',75,NULL),(1213,'Cote-d\'Or',75,NULL),(1214,'Cotes-d\'Armor',75,NULL),(1215,'Creuse',75,NULL),(1216,'Crolles',75,NULL),(1217,'Deux-Sevres',75,NULL),(1218,'Dordogne',75,NULL),(1219,'Doubs',75,NULL),(1220,'Drome',75,NULL),(1221,'Essonne',75,NULL),(1222,'Eure',75,NULL),(1223,'Eure-et-Loir',75,NULL),(1224,'Feucherolles',75,NULL),(1225,'Finistere',75,NULL),(1226,'Franche-Comte',75,NULL),(1227,'Gard',75,NULL),(1228,'Gers',75,NULL),(1229,'Gironde',75,NULL),(1230,'Haut-Rhin',75,NULL),(1231,'Haute-Corse',75,NULL),(1232,'Haute-Garonne',75,NULL),(1233,'Haute-Loire',75,NULL),(1234,'Haute-Marne',75,NULL),(1235,'Haute-Saone',75,NULL),(1236,'Haute-Savoie',75,NULL),(1237,'Haute-Vienne',75,NULL),(1238,'Hautes-Alpes',75,NULL),(1239,'Hautes-Pyrenees',75,NULL),(1240,'Hauts-de-Seine',75,NULL),(1241,'Herault',75,NULL),(1242,'Ile-de-France',75,NULL),(1243,'Ille-et-Vilaine',75,NULL),(1244,'Indre',75,NULL),(1245,'Indre-et-Loire',75,NULL),(1246,'Isere',75,NULL),(1247,'Jura',75,NULL),(1248,'Klagenfurt',75,NULL),(1249,'Landes',75,NULL),(1250,'Languedoc-Roussillon',75,NULL),(1251,'Larcay',75,NULL),(1252,'Le Castellet',75,'N'),(1253,'Le Creusot',75,'N'),(1254,'Limousin',75,NULL),(1255,'Loir-et-Cher',75,NULL),(1256,'Loire',75,NULL),(1257,'Loire-Atlantique',75,NULL),(1258,'Loiret',75,NULL),(1259,'Lorraine',75,NULL),(1260,'Lot',75,NULL),(1261,'Lot-et-Garonne',75,NULL),(1262,'Lower Normandy',75,'N'),(1263,'Lozere',75,NULL),(1264,'Maine-et-Loire',75,NULL),(1265,'Manche',75,NULL),(1266,'Marne',75,NULL),(1267,'Mayenne',75,NULL),(1268,'Meurthe-et-Moselle',75,NULL),(1269,'Meuse',75,NULL),(1270,'Midi-Pyrenees',75,NULL),(1271,'Morbihan',75,NULL),(1272,'Moselle',75,NULL),(1273,'Nievre',75,NULL),(1274,'Nord',75,NULL),(1275,'Nord-Pas-de-Calais',75,NULL),(1276,'Oise',75,NULL),(1277,'Orne',75,NULL),(1278,'Paris',75,NULL),(1279,'Pas-de-Calais',75,NULL),(1280,'Pays de la Loire',75,'N'),(1281,'Pays-de-la-Loire',75,NULL),(1282,'Picardy',75,NULL),(1283,'Puy-de-Dome',75,NULL),(1284,'Pyrenees-Atlantiques',75,NULL),(1285,'Pyrenees-Orientales',75,NULL),(1286,'Quelmes',75,NULL),(1287,'Rhone',75,NULL),(1288,'Rhone-Alpes',75,NULL),(1289,'Saint Ouen',75,'N'),(1290,'Saint Viatre',75,'N'),(1291,'Saone-et-Loire',75,NULL),(1292,'Sarthe',75,NULL),(1293,'Savoie',75,NULL),(1294,'Seine-Maritime',75,NULL),(1295,'Seine-Saint-Denis',75,NULL),(1296,'Seine-et-Marne',75,NULL),(1297,'Somme',75,NULL),(1298,'Sophia Antipolis',75,'N'),(1299,'Souvans',75,NULL),(1300,'Tarn',75,NULL),(1301,'Tarn-et-Garonne',75,NULL),(1302,'Territoire de Belfort',75,'N'),(1303,'Treignac',75,NULL),(1304,'Upper Normandy',75,'N'),(1305,'Val-d\'Oise',75,NULL),(1306,'Val-de-Marne',75,NULL),(1307,'Var',75,NULL),(1308,'Vaucluse',75,NULL),(1309,'Vellise',75,NULL),(1310,'Vendee',75,NULL),(1311,'Vienne',75,NULL),(1312,'Vosges',75,NULL),(1313,'Yonne',75,NULL),(1314,'Yvelines',75,NULL),(1315,'Cayenne',76,NULL),(1316,'Saint-Laurent-du-Maroni',76,NULL),(1317,'Iles du Vent',77,'N'),(1318,'Iles sous le Vent',77,'N'),(1319,'Marquesas',77,NULL),(1320,'Tuamotu',77,NULL),(1321,'Tubuai',77,NULL),(1322,'Amsterdam',78,NULL),(1323,'Crozet Islands',78,'N'),(1324,'Kerguelen',78,NULL),(1325,'Estuaire',79,NULL),(1326,'Haut-Ogooue',79,NULL),(1327,'Moyen-Ogooue',79,NULL),(1328,'Ngounie',79,NULL),(1329,'Nyanga',79,NULL),(1330,'Ogooue-Ivindo',79,NULL),(1331,'Ogooue-Lolo',79,NULL),(1332,'Ogooue-Maritime',79,NULL),(1333,'Woleu-Ntem',79,NULL),(1334,'Banjul',80,NULL),(1335,'Basse',80,NULL),(1336,'Brikama',80,NULL),(1337,'Janjanbureh',80,NULL),(1338,'Kanifing',80,NULL),(1339,'Kerewan',80,NULL),(1340,'Kuntaur',80,NULL),(1341,'Mansakonko',80,NULL),(1342,'Abhasia',81,NULL),(1343,'Ajaria',81,NULL),(1344,'Guria',81,NULL),(1345,'Imereti',81,NULL),(1346,'Kaheti',81,NULL),(1347,'Kvemo Kartli',81,'N'),(1348,'Mcheta-Mtianeti',81,NULL),(1349,'Racha',81,NULL),(1350,'Samagrelo-Zemo Svaneti',81,'N'),(1351,'Samche-Zhavaheti',81,NULL),(1352,'Shida Kartli',81,'N'),(1353,'Tbilisi',81,NULL),(1354,'Auvergne',82,'N'),(1355,'Baden-Wurttemberg',82,NULL),(1356,'Bavaria',82,NULL),(1357,'Bayern',82,NULL),(1358,'Beilstein Wurtt',82,'N'),(1359,'Berlin',82,NULL),(1360,'Brandenburg',82,NULL),(1361,'Bremen',82,NULL),(1362,'Dreisbach',82,'N'),(1363,'Freistaat Bayern',82,'N'),(1364,'Hamburg',82,NULL),(1365,'Hannover',82,NULL),(1366,'Heroldstatt',82,NULL),(1367,'Hessen',82,NULL),(1368,'Kortenberg',82,NULL),(1369,'Laasdorf',82,NULL),(1370,'Land Baden-Wurttemberg',82,'N'),(1371,'Land Bayern',82,'N'),(1372,'Land Brandenburg',82,'N'),(1373,'Land Hessen',82,'N'),(1374,'Land Mecklenburg-Vorpommern',82,'N'),(1375,'Land Nordrhein-Westfalen',82,'N'),(1376,'Land Rheinland-Pfalz',82,'N'),(1377,'Land Sachsen',82,'N'),(1378,'Land Sachsen-Anhalt',82,'N'),(1379,'Land Thuringen',82,'N'),(1380,'Lower Saxony',82,'N'),(1381,'Mecklenburg-Vorpommern',82,NULL),(1382,'Mulfingen',82,NULL),(1383,'Munich',82,NULL),(1384,'Neubeuern',82,NULL),(1385,'Niedersachsen',82,NULL),(1386,'Noord-Holland',82,NULL),(1387,'Nordrhein-Westfalen',82,NULL),(1388,'North Rhine-Westphalia',82,'N'),(1389,'Osterode',82,NULL),(1390,'Rheinland-Pfalz',82,NULL),(1391,'Rhineland-Palatinate',82,NULL),(1392,'Saarland',82,NULL),(1393,'Sachsen',82,NULL),(1394,'Sachsen-Anhalt',82,NULL),(1395,'Saxony',82,NULL),(1396,'Schleswig-Holstein',82,NULL),(1397,'Thuringia',82,NULL),(1398,'Webling',82,NULL),(1399,'Weinstrabe',82,NULL),(1400,'schlobborn',82,NULL),(1401,'Ashanti',83,NULL),(1402,'Brong-Ahafo',83,NULL),(1403,'Central',83,NULL),(1404,'Eastern',83,NULL),(1405,'Greater Accra',83,'N'),(1406,'Northern',83,NULL),(1407,'Upper East',83,'N'),(1408,'Upper West',83,'N'),(1409,'Volta',83,NULL),(1410,'Western',83,NULL),(1411,'Gibraltar',84,NULL),(1412,'Acharnes',85,NULL),(1413,'Ahaia',85,NULL),(1414,'Aitolia kai Akarnania',85,'N'),(1415,'Argolis',85,NULL),(1416,'Arkadia',85,NULL),(1417,'Arta',85,NULL),(1418,'Attica',85,NULL),(1419,'Attiki',85,NULL),(1420,'Ayion Oros',85,'N'),(1421,'Crete',85,NULL),(1422,'Dodekanisos',85,NULL),(1423,'Drama',85,NULL),(1424,'Evia',85,NULL),(1425,'Evritania',85,NULL),(1426,'Evros',85,NULL),(1427,'Evvoia',85,NULL),(1428,'Florina',85,NULL),(1429,'Fokis',85,NULL),(1430,'Fthiotis',85,NULL),(1431,'Grevena',85,NULL),(1432,'Halandri',85,NULL),(1433,'Halkidiki',85,NULL),(1434,'Hania',85,NULL),(1435,'Heraklion',85,NULL),(1436,'Hios',85,NULL),(1437,'Ilia',85,NULL),(1438,'Imathia',85,NULL),(1439,'Ioannina',85,NULL),(1440,'Iraklion',85,'N'),(1441,'Karditsa',85,NULL),(1442,'Kastoria',85,NULL),(1443,'Kavala',85,NULL),(1444,'Kefallinia',85,NULL),(1445,'Kerkira',85,NULL),(1446,'Kiklades',85,NULL),(1447,'Kilkis',85,NULL),(1448,'Korinthia',85,NULL),(1449,'Kozani',85,NULL),(1450,'Lakonia',85,NULL),(1451,'Larisa',85,NULL),(1452,'Lasithi',85,NULL),(1453,'Lesvos',85,NULL),(1454,'Levkas',85,NULL),(1455,'Magnisia',85,NULL),(1456,'Messinia',85,NULL),(1457,'Nomos Attikis',85,'N'),(1458,'Nomos Zakynthou',85,'N'),(1459,'Pella',85,NULL),(1460,'Pieria',85,NULL),(1461,'Piraios',85,NULL),(1462,'Preveza',85,NULL),(1463,'Rethimni',85,NULL),(1464,'Rodopi',85,NULL),(1465,'Samos',85,NULL),(1466,'Serrai',85,NULL),(1467,'Thesprotia',85,NULL),(1468,'Thessaloniki',85,NULL),(1469,'Trikala',85,NULL),(1470,'Voiotia',85,NULL),(1471,'West Greece',85,'N'),(1472,'Xanthi',85,NULL),(1473,'Zakinthos',85,NULL),(1474,'Aasiaat',86,NULL),(1475,'Ammassalik',86,NULL),(1476,'Illoqqortoormiut',86,NULL),(1477,'Ilulissat',86,NULL),(1478,'Ivittuut',86,NULL),(1479,'Kangaatsiaq',86,NULL),(1480,'Maniitsoq',86,NULL),(1481,'Nanortalik',86,NULL),(1482,'Narsaq',86,NULL),(1483,'Nuuk',86,NULL),(1484,'Paamiut',86,NULL),(1485,'Qaanaaq',86,NULL),(1486,'Qaqortoq',86,NULL),(1487,'Qasigiannguit',86,NULL),(1488,'Qeqertarsuaq',86,NULL),(1489,'Sisimiut',86,NULL),(1490,'Udenfor kommunal inddeling',86,'N'),(1491,'Upernavik',86,NULL),(1492,'Uummannaq',86,NULL),(1493,'Carriacou-Petite Martinique',87,'N'),(1494,'Saint Andrew',87,'N'),(1495,'Saint Davids',87,'N'),(1496,'Saint George\'s',87,'N'),(1497,'Saint John',87,'N'),(1498,'Saint Mark',87,'N'),(1499,'Saint Patrick',87,'N'),(1500,'Basse-Terre',88,NULL),(1501,'Grande-Terre',88,NULL),(1502,'Iles des Saintes',88,'N'),(1503,'La Desirade',88,'N'),(1504,'Marie-Galante',88,NULL),(1505,'Saint Barthelemy',88,'N'),(1506,'Saint Martin',88,'N'),(1507,'Agana Heights',89,'N'),(1508,'Agat',89,NULL),(1509,'Barrigada',89,NULL),(1510,'Chalan-Pago-Ordot',89,NULL),(1511,'Dededo',89,NULL),(1512,'Hagatna',89,NULL),(1513,'Inarajan',89,NULL),(1514,'Mangilao',89,NULL),(1515,'Merizo',89,NULL),(1516,'Mongmong-Toto-Maite',89,NULL),(1517,'Santa Rita',89,'N'),(1518,'Sinajana',89,NULL),(1519,'Talofofo',89,NULL),(1520,'Tamuning',89,NULL),(1521,'Yigo',89,NULL),(1522,'Yona',89,NULL),(1523,'Alta Verapaz',90,'N'),(1524,'Baja Verapaz',90,'N'),(1525,'Chimaltenango',90,NULL),(1526,'Chiquimula',90,NULL),(1527,'El Progreso',90,'N'),(1528,'Escuintla',90,NULL),(1529,'Guatemala',90,NULL),(1530,'Huehuetenango',90,NULL),(1531,'Izabal',90,NULL),(1532,'Jalapa',90,NULL),(1533,'Jutiapa',90,NULL),(1534,'Peten',90,NULL),(1535,'Quezaltenango',90,NULL),(1536,'Quiche',90,NULL),(1537,'Retalhuleu',90,NULL),(1538,'Sacatepequez',90,NULL),(1539,'San Marcos',90,'N'),(1540,'Santa Rosa',90,'N'),(1541,'Solola',90,NULL),(1542,'Suchitepequez',90,NULL),(1543,'Totonicapan',90,NULL),(1544,'Zacapa',90,NULL),(1545,'Alderney',91,NULL),(1546,'Castel',91,NULL),(1547,'Forest',91,NULL),(1548,'Saint Andrew',91,'N'),(1549,'Saint Martin',91,'N'),(1550,'Saint Peter Port',91,'N'),(1551,'Saint Pierre du Bois',91,'N'),(1552,'Saint Sampson',91,'N'),(1553,'Saint Saviour',91,'N'),(1554,'Sark',91,NULL),(1555,'Torteval',91,NULL),(1556,'Vale',91,NULL),(1557,'Beyla',92,NULL),(1558,'Boffa',92,NULL),(1559,'Boke',92,NULL),(1560,'Conakry',92,NULL),(1561,'Coyah',92,NULL),(1562,'Dabola',92,NULL),(1563,'Dalaba',92,NULL),(1564,'Dinguiraye',92,NULL),(1565,'Faranah',92,NULL),(1566,'Forecariah',92,NULL),(1567,'Fria',92,NULL),(1568,'Gaoual',92,NULL),(1569,'Gueckedou',92,NULL),(1570,'Kankan',92,NULL),(1571,'Kerouane',92,NULL),(1572,'Kindia',92,NULL),(1573,'Kissidougou',92,NULL),(1574,'Koubia',92,NULL),(1575,'Koundara',92,NULL),(1576,'Kouroussa',92,NULL),(1577,'Labe',92,NULL),(1578,'Lola',92,NULL),(1579,'Macenta',92,NULL),(1580,'Mali',92,NULL),(1581,'Mamou',92,NULL),(1582,'Mandiana',92,NULL),(1583,'Nzerekore',92,NULL),(1584,'Pita',92,NULL),(1585,'Siguiri',92,NULL),(1586,'Telimele',92,NULL),(1587,'Tougue',92,NULL),(1588,'Yomou',92,NULL),(1589,'Bafata',93,NULL),(1590,'Bissau',93,NULL),(1591,'Bolama',93,NULL),(1592,'Cacheu',93,NULL),(1593,'Gabu',93,NULL),(1594,'Oio',93,NULL),(1595,'Quinara',93,NULL),(1596,'Tombali',93,NULL),(1597,'Barima-Waini',94,NULL),(1598,'Cuyuni-Mazaruni',94,NULL),(1599,'Demerara-Mahaica',94,NULL),(1600,'East Berbice-Corentyne',94,'N'),(1601,'Essequibo Islands-West Demerar',94,'N'),(1602,'Mahaica-Berbice',94,NULL),(1603,'Pomeroon-Supenaam',94,NULL),(1604,'Potaro-Siparuni',94,NULL),(1605,'Upper Demerara-Berbice',94,'N'),(1606,'Upper Takutu-Upper Essequibo',94,'N'),(1607,'Artibonite',95,NULL),(1608,'Centre',95,NULL),(1609,'Grand\'Anse',95,NULL),(1610,'Nord',95,NULL),(1611,'Nord-Est',95,NULL),(1612,'Nord-Ouest',95,NULL),(1613,'Ouest',95,NULL),(1614,'Sud',95,NULL),(1615,'Sud-Est',95,NULL),(1616,'Heard and McDonald Islands',96,'N'),(1617,'Atlantida',97,NULL),(1618,'Choluteca',97,NULL),(1619,'Colon',97,NULL),(1620,'Comayagua',97,NULL),(1621,'Copan',97,NULL),(1622,'Cortes',97,NULL),(1623,'Distrito Central',97,'N'),(1624,'El Paraiso',97,'N'),(1625,'Francisco Morazan',97,'N'),(1626,'Gracias a Dios',97,'N'),(1627,'Intibuca',97,NULL),(1628,'Islas de la Bahia',97,'N'),(1629,'La Paz',97,'N'),(1630,'Lempira',97,NULL),(1631,'Ocotepeque',97,NULL),(1632,'Olancho',97,NULL),(1633,'Santa Barbara',97,'N'),(1634,'Valle',97,NULL),(1635,'Yoro',97,NULL),(1636,'Hong Kong',98,'N'),(1637,'Bacs-Kiskun',99,NULL),(1638,'Baranya',99,NULL),(1639,'Bekes',99,NULL),(1640,'Borsod-Abauj-Zemplen',99,NULL),(1641,'Budapest',99,NULL),(1642,'Csongrad',99,NULL),(1643,'Fejer',99,NULL),(1644,'Gyor-Moson-Sopron',99,NULL),(1645,'Hajdu-Bihar',99,NULL),(1646,'Heves',99,NULL),(1647,'Jasz-Nagykun-Szolnok',99,NULL),(1648,'Komarom-Esztergom',99,NULL),(1649,'Nograd',99,NULL),(1650,'Pest',99,NULL),(1651,'Somogy',99,NULL),(1652,'Szabolcs-Szatmar-Bereg',99,NULL),(1653,'Tolna',99,NULL),(1654,'Vas',99,NULL),(1655,'Veszprem',99,NULL),(1656,'Zala',99,NULL),(1657,'Austurland',100,NULL),(1658,'Gullbringusysla',100,'N'),(1659,'Hofu borgarsva i',100,'N'),(1660,'Nor urland eystra',100,'N'),(1661,'Nor urland vestra',100,'N'),(1662,'Su urland',100,'N'),(1663,'Su urnes',100,'N'),(1664,'Vestfir ir',100,'N'),(1665,'Vesturland',100,NULL),(1666,'Aceh',102,NULL),(1667,'Bali',102,NULL),(1668,'Bangka-Belitung',102,NULL),(1669,'Banten',102,NULL),(1670,'Bengkulu',102,NULL),(1671,'Gandaria',102,NULL),(1672,'Gorontalo',102,NULL),(1673,'Jakarta',102,NULL),(1674,'Jambi',102,NULL),(1675,'Jawa Barat',102,'N'),(1676,'Jawa Tengah',102,'N'),(1677,'Jawa Timur',102,'N'),(1678,'Kalimantan Barat',102,'N'),(1679,'Kalimantan Selatan',102,'N'),(1680,'Kalimantan Tengah',102,'N'),(1681,'Kalimantan Timur',102,'N'),(1682,'Kendal',102,NULL),(1683,'Lampung',102,NULL),(1684,'Maluku',102,NULL),(1685,'Maluku Utara',102,NULL),(1686,'Nusa Tenggara Barat',102,'N'),(1687,'Nusa Tenggara Timur',102,'N'),(1688,'Papua',102,NULL),(1689,'Riau',102,NULL),(1690,'Riau Kepulauan',102,NULL),(1691,'Solo',102,NULL),(1692,'Sulawesi Selatan',102,'N'),(1693,'Sulawesi Tengah',102,'N'),(1694,'Sulawesi Tenggara',102,'N'),(1695,'Sulawesi Utara',102,'N'),(1696,'Sumatera Barat',102,'N'),(1697,'Sumatera Selatan',102,'N'),(1698,'Sumatera Utara',102,'N'),(1699,'Yogyakarta',102,NULL),(1700,'Ardabil',103,NULL),(1701,'Azarbayjan-e Bakhtari',103,'N'),(1702,'Azarbayjan-e Khavari',103,'N'),(1703,'Bushehr',103,NULL),(1704,'Chahar Mahal-e Bakhtiari',103,'N'),(1705,'Esfahan',103,NULL),(1706,'Fars',103,NULL),(1707,'Gilan',103,NULL),(1708,'Golestan',103,NULL),(1709,'Hamadan',103,NULL),(1710,'Hormozgan',103,NULL),(1711,'Ilam',103,NULL),(1712,'Kerman',103,NULL),(1713,'Kermanshah',103,NULL),(1714,'Khorasan',103,NULL),(1715,'Khuzestan',103,NULL),(1716,'Kohgiluyeh-e Boyerahmad',103,'N'),(1717,'Kordestan',103,NULL),(1718,'Lorestan',103,NULL),(1719,'Markazi',103,NULL),(1720,'Mazandaran',103,NULL),(1721,'Ostan-e Esfahan',103,'N'),(1722,'Qazvin',103,NULL),(1723,'Qom',103,NULL),(1724,'Semnan',103,NULL),(1725,'Sistan-e Baluchestan',103,'N'),(1726,'Tehran',103,NULL),(1727,'Yazd',103,NULL),(1728,'Zanjan',103,NULL),(1729,'Babil',104,NULL),(1730,'Baghdad',104,NULL),(1731,'Dahuk',104,NULL),(1732,'Dhi Qar',104,'N'),(1733,'Diyala',104,NULL),(1734,'Erbil',104,NULL),(1735,'Irbil',104,NULL),(1736,'Karbala',104,NULL),(1737,'Kurdistan',104,NULL),(1738,'Maysan',104,NULL),(1739,'Ninawa',104,NULL),(1740,'Salah-ad-Din',104,NULL),(1741,'Wasit',104,NULL),(1742,'al-Anbar',104,NULL),(1743,'al-Basrah',104,NULL),(1744,'al-Muthanna',104,NULL),(1745,'al-Qadisiyah',104,NULL),(1746,'an-Najaf',104,NULL),(1747,'as-Sulaymaniyah',104,NULL),(1748,'at-Ta\'mim',104,NULL),(1749,'Armagh',105,NULL),(1750,'Carlow',105,NULL),(1751,'Cavan',105,NULL),(1752,'Clare',105,NULL),(1753,'Cork',105,NULL),(1754,'Donegal',105,NULL),(1755,'Dublin',105,NULL),(1756,'Galway',105,NULL),(1757,'Kerry',105,NULL),(1758,'Kildare',105,NULL),(1759,'Kilkenny',105,NULL),(1760,'Laois',105,NULL),(1761,'Leinster',105,NULL),(1762,'Leitrim',105,NULL),(1763,'Limerick',105,NULL),(1764,'Loch Garman',105,'N'),(1765,'Longford',105,NULL),(1766,'Louth',105,NULL),(1767,'Mayo',105,NULL),(1768,'Meath',105,NULL),(1769,'Monaghan',105,NULL),(1770,'Offaly',105,NULL),(1771,'Roscommon',105,NULL),(1772,'Sligo',105,NULL),(1773,'Tipperary North Riding',105,'N'),(1774,'Tipperary South Riding',105,'N'),(1775,'Ulster',105,NULL),(1776,'Waterford',105,NULL),(1777,'Westmeath',105,NULL),(1778,'Wexford',105,NULL),(1779,'Wicklow',105,NULL),(1780,'Beit Hanania',106,'N'),(1781,'Ben Gurion Airport',106,'N'),(1782,'Bethlehem',106,NULL),(1783,'Caesarea',106,NULL),(1784,'Centre',106,NULL),(1785,'Gaza',106,NULL),(1786,'Hadaron',106,NULL),(1787,'Haifa District',106,'N'),(1788,'Hamerkaz',106,NULL),(1789,'Hazafon',106,NULL),(1790,'Hebron',106,NULL),(1791,'Jaffa',106,NULL),(1792,'Jerusalem',106,NULL),(1793,'Khefa',106,NULL),(1794,'Kiryat Yam',106,'N'),(1795,'Lower Galilee',106,'N'),(1796,'Qalqilya',106,NULL),(1797,'Talme Elazar',106,'N'),(1798,'Tel Aviv',106,'N'),(1799,'Tsafon',106,NULL),(1800,'Umm El Fahem',106,'N'),(1801,'Yerushalayim',106,NULL),(1802,'Abruzzi',107,NULL),(1803,'Abruzzo',107,NULL),(1804,'Agrigento',107,NULL),(1805,'Alessandria',107,NULL),(1806,'Ancona',107,NULL),(1807,'Arezzo',107,NULL),(1808,'Ascoli Piceno',107,'N'),(1809,'Asti',107,NULL),(1810,'Avellino',107,NULL),(1811,'Bari',107,'N'),(1812,'Basilicata',107,NULL),(1813,'Belluno',107,NULL),(1814,'Benevento',107,NULL),(1815,'Bergamo',107,NULL),(1816,'Biella',107,NULL),(1817,'Bologna',107,NULL),(1818,'Bolzano',107,NULL),(1819,'Brescia',107,NULL),(1820,'Brindisi',107,NULL),(1821,'Calabria',107,NULL),(1822,'Campania',107,NULL),(1823,'Cartoceto',107,NULL),(1824,'Caserta',107,NULL),(1825,'Catania',107,NULL),(1826,'Chieti',107,NULL),(1827,'Como',107,NULL),(1828,'Cosenza',107,NULL),(1829,'Cremona',107,NULL),(1830,'Cuneo',107,NULL),(1831,'Emilia-Romagna',107,NULL),(1832,'Ferrara',107,NULL),(1833,'Firenze',107,NULL),(1834,'Florence',107,NULL),(1835,'Forli-Cesena ',107,'N'),(1836,'Friuli-Venezia Giulia',107,'N'),(1837,'Frosinone',107,NULL),(1838,'Genoa',107,NULL),(1839,'Gorizia',107,NULL),(1840,'L\'Aquila',107,NULL),(1841,'Lazio',107,NULL),(1842,'Lecce',107,NULL),(1843,'Lecco',107,NULL),(1845,'Liguria',107,NULL),(1846,'Lodi',107,NULL),(1847,'Lombardia',107,NULL),(1848,'Lombardy',107,NULL),(1849,'Macerata',107,NULL),(1850,'Mantova',107,NULL),(1851,'Marche',107,NULL),(1852,'Messina',107,NULL),(1853,'Milan',107,NULL),(1854,'Modena',107,NULL),(1855,'Molise',107,NULL),(1856,'Molteno',107,'N'),(1857,'Montenegro',107,NULL),(1858,'Monza and Brianza',107,'N'),(1859,'Naples',107,NULL),(1860,'Novara',107,NULL),(1861,'Padova',107,NULL),(1862,'Parma',107,NULL),(1863,'Pavia',107,NULL),(1864,'Perugia',107,NULL),(1865,'Pesaro-Urbino',107,NULL),(1866,'Piacenza',107,NULL),(1867,'Piedmont',107,NULL),(1868,'Piemonte',107,NULL),(1869,'Pisa',107,NULL),(1870,'Pordenone',107,NULL),(1871,'Potenza',107,NULL),(1872,'Puglia',107,NULL),(1873,'Reggio Emilia',107,'N'),(1874,'Rimini',107,NULL),(1875,'Roma',107,NULL),(1876,'Salerno',107,NULL),(1877,'Sardegna',107,NULL),(1878,'Sassari',107,NULL),(1879,'Savona',107,NULL),(1880,'Sicilia',107,NULL),(1881,'Siena',107,NULL),(1882,'Sondrio',107,NULL),(1883,'South Tyrol',107,'N'),(1884,'Taranto',107,NULL),(1885,'Teramo',107,NULL),(1886,'Torino',107,NULL),(1887,'Toscana',107,NULL),(1888,'Trapani',107,NULL),(1889,'Trentino-Alto Adige',107,'N'),(1890,'Trento',107,NULL),(1891,'Treviso',107,NULL),(1892,'Udine',107,NULL),(1893,'Umbria',107,NULL),(1894,'Valle d\'Aosta',107,'N'),(1895,'Varese',107,NULL),(1896,'Veneto',107,NULL),(1897,'Venezia',107,NULL),(1898,'Verbano-Cusio-Ossola',107,NULL),(1899,'Vercelli',107,NULL),(1900,'Verona',107,NULL),(1901,'Vicenza',107,NULL),(1902,'Viterbo',107,NULL),(1903,'Buxoro Viloyati',108,'N'),(1904,'Clarendon',108,NULL),(1905,'Hanover',108,NULL),(1906,'Kingston',108,NULL),(1907,'Manchester',108,NULL),(1908,'Portland',108,NULL),(1909,'Saint Andrews',108,'N'),(1910,'Saint Ann',108,'N'),(1911,'Saint Catherine',108,'N'),(1912,'Saint Elizabeth',108,'N'),(1913,'Saint James',108,'N'),(1914,'Saint Mary',108,'N'),(1915,'Saint Thomas',108,'N'),(1916,'Trelawney',108,NULL),(1917,'Westmoreland',108,NULL),(1918,'Aichi',109,NULL),(1919,'Akita',109,NULL),(1920,'Aomori',109,NULL),(1921,'Chiba',109,NULL),(1922,'Ehime',109,NULL),(1923,'Fukui',109,NULL),(1924,'Fukuoka',109,NULL),(1925,'Fukushima',109,NULL),(1926,'Gifu',109,NULL),(1927,'Gumma',109,NULL),(1928,'Hiroshima',109,NULL),(1929,'Hokkaido',109,NULL),(1930,'Hyogo',109,NULL),(1931,'Ibaraki',109,NULL),(1932,'Ishikawa',109,NULL),(1933,'Iwate',109,NULL),(1934,'Kagawa',109,NULL),(1935,'Kagoshima',109,NULL),(1936,'Kanagawa',109,NULL),(1937,'Kanto',109,NULL),(1938,'Kochi',109,NULL),(1939,'Kumamoto',109,NULL),(1940,'Kyoto',109,NULL),(1941,'Mie',109,NULL),(1942,'Miyagi',109,NULL),(1943,'Miyazaki',109,NULL),(1944,'Nagano',109,NULL),(1945,'Nagasaki',109,NULL),(1946,'Nara',109,NULL),(1947,'Niigata',109,NULL),(1948,'Oita',109,NULL),(1949,'Okayama',109,NULL),(1950,'Okinawa',109,NULL),(1951,'Osaka',109,NULL),(1952,'Saga',109,NULL),(1953,'Saitama',109,NULL),(1954,'Shiga',109,NULL),(1955,'Shimane',109,NULL),(1956,'Shizuoka',109,NULL),(1957,'Tochigi',109,NULL),(1958,'Tokushima',109,NULL),(1959,'Tokyo',109,NULL),(1960,'Tottori',109,NULL),(1961,'Toyama',109,NULL),(1962,'Wakayama',109,NULL),(1963,'Yamagata',109,NULL),(1964,'Yamaguchi',109,NULL),(1965,'Yamanashi',109,NULL),(1966,'Grouville',110,NULL),(1967,'Saint Brelade',110,'N'),(1968,'Saint Clement',110,'N'),(1969,'Saint Helier',110,'N'),(1970,'Saint John',110,'N'),(1971,'Saint Lawrence',110,'N'),(1972,'Saint Martin',110,'N'),(1973,'Saint Mary',110,'N'),(1974,'Saint Peter',110,'N'),(1975,'Saint Saviour',110,'N'),(1976,'Trinity',110,NULL),(1977,'\'Ajlun',111,NULL),(1978,'Amman',111,NULL),(1979,'Irbid',111,NULL),(1980,'Jarash',111,NULL),(1981,'Ma\'an',111,NULL),(1982,'Madaba',111,NULL),(1983,'al-\'Aqabah',111,NULL),(1984,'al-Balqa\'',111,NULL),(1985,'al-Karak',111,NULL),(1986,'al-Mafraq',111,NULL),(1987,'at-Tafilah',111,NULL),(1988,'az-Zarqa\'',111,NULL),(1989,'Akmecet',112,NULL),(1990,'Akmola',112,NULL),(1991,'Aktobe',112,NULL),(1992,'Almati',112,NULL),(1993,'Atirau',112,NULL),(1994,'Batis Kazakstan',112,'N'),(1995,'Burlinsky Region',112,'N'),(1996,'Karagandi',112,NULL),(1997,'Kostanay',112,NULL),(1998,'Mankistau',112,NULL),(1999,'Ontustik Kazakstan',112,'N'),(2000,'Pavlodar',112,NULL),(2001,'Sigis Kazakstan',112,'N'),(2002,'Soltustik Kazakstan',112,'N'),(2003,'Taraz',112,NULL),(2004,'Central',113,NULL),(2005,'Coast',113,NULL),(2006,'Eastern',113,NULL),(2007,'Nairobi',113,NULL),(2008,'North Eastern',113,'N'),(2009,'Nyanza',113,NULL),(2010,'Rift Valley',113,'N'),(2011,'Western',113,NULL),(2012,'Abaiang',114,NULL),(2013,'Abemana',114,NULL),(2014,'Aranuka',114,NULL),(2015,'Arorae',114,NULL),(2016,'Banaba',114,NULL),(2017,'Beru',114,NULL),(2018,'Butaritari',114,NULL),(2019,'Kiritimati',114,NULL),(2020,'Kuria',114,NULL),(2021,'Maiana',114,NULL),(2022,'Makin',114,NULL),(2023,'Marakei',114,NULL),(2024,'Nikunau',114,NULL),(2025,'Nonouti',114,NULL),(2026,'Onotoa',114,NULL),(2027,'Phoenix Islands',114,'N'),(2028,'Tabiteuea North',114,'N'),(2029,'Tabiteuea South',114,'N'),(2030,'Tabuaeran',114,NULL),(2031,'Tamana',114,NULL),(2032,'Tarawa North',114,'N'),(2033,'Tarawa South',114,'N'),(2034,'Teraina',114,NULL),(2035,'Chagangdo',115,NULL),(2036,'Hamgyeongbukto',115,NULL),(2037,'Hamgyeongnamdo',115,NULL),(2038,'Hwanghaebukto',115,NULL),(2039,'Hwanghaenamdo',115,NULL),(2040,'Kaeseong',115,NULL),(2041,'Kangweon',115,NULL),(2042,'Nampo',115,NULL),(2043,'Pyeonganbukto',115,NULL),(2044,'Pyeongannamdo',115,NULL),(2045,'Pyeongyang',115,NULL),(2046,'Yanggang',115,NULL),(2047,'Busan',116,NULL),(2048,'Cheju',116,NULL),(2049,'Chollabuk',116,NULL),(2050,'Chollanam',116,NULL),(2051,'Chungbuk',116,NULL),(2052,'Chungcheongbuk',116,NULL),(2053,'Chungcheongnam',116,NULL),(2054,'Chungnam',116,NULL),(2055,'Daegu',116,NULL),(2056,'Gangwon-do',116,NULL),(2057,'Goyang-si',116,NULL),(2058,'Gyeonggi-do',116,NULL),(2059,'Gyeongsang ',116,'N'),(2060,'Gyeongsangnam-do',116,NULL),(2061,'Incheon',116,NULL),(2062,'Jeju-Si',116,NULL),(2063,'Jeonbuk',116,NULL),(2064,'Kangweon',116,NULL),(2065,'Kwangju',116,NULL),(2066,'Kyeonggi',116,NULL),(2067,'Kyeongsangbuk',116,NULL),(2068,'Kyeongsangnam',116,NULL),(2069,'Kyonggi-do',116,NULL),(2070,'Kyungbuk-Do',116,NULL),(2071,'Kyunggi-Do',116,NULL),(2072,'Kyunggi-do',116,NULL),(2073,'Pusan',116,NULL),(2074,'Seoul',116,NULL),(2075,'Sudogwon',116,NULL),(2076,'Taegu',116,NULL),(2077,'Taejeon',116,NULL),(2078,'Taejon-gwangyoksi',116,NULL),(2079,'Ulsan',116,NULL),(2080,'Wonju',116,NULL),(2081,'gwangyoksi',116,NULL),(2082,'Al Asimah',117,'N'),(2083,'Hawalli',117,NULL),(2084,'Mishref',117,NULL),(2085,'Qadesiya',117,NULL),(2086,'Safat',117,NULL),(2087,'Salmiya',117,NULL),(2088,'al-Ahmadi',117,NULL),(2089,'al-Farwaniyah',117,NULL),(2090,'al-Jahra',117,NULL),(2091,'al-Kuwayt',117,NULL),(2092,'Batken',118,NULL),(2093,'Bishkek',118,NULL),(2094,'Chui',118,NULL),(2095,'Issyk-Kul',118,NULL),(2096,'Jalal-Abad',118,NULL),(2097,'Naryn',118,NULL),(2098,'Osh',118,NULL),(2099,'Talas',118,NULL),(2100,'Attopu',119,NULL),(2101,'Bokeo',119,NULL),(2102,'Bolikhamsay',119,NULL),(2103,'Champasak',119,NULL),(2104,'Houaphanh',119,NULL),(2105,'Khammouane',119,NULL),(2106,'Luang Nam Tha',119,'N'),(2107,'Luang Prabang',119,'N'),(2108,'Oudomxay',119,NULL),(2109,'Phongsaly',119,NULL),(2110,'Saravan',119,NULL),(2111,'Savannakhet',119,NULL),(2112,'Sekong',119,NULL),(2113,'Viangchan Prefecture',119,'N'),(2114,'Viangchan Province',119,'N'),(2115,'Xaignabury',119,NULL),(2116,'Xiang Khuang',119,'N'),(2117,'Aizkraukles',120,NULL),(2118,'Aluksnes',120,NULL),(2119,'Balvu',120,NULL),(2120,'Bauskas',120,NULL),(2121,'Cesu',120,NULL),(2122,'Daugavpils',120,NULL),(2123,'Daugavpils City',120,NULL),(2124,'Dobeles',120,NULL),(2125,'Gulbenes',120,NULL),(2126,'Jekabspils',120,NULL),(2127,'Jelgava',120,NULL),(2128,'Jelgavas',120,NULL),(2129,'Jurmala City',120,'N'),(2130,'Kraslavas',120,NULL),(2131,'Kuldigas',120,NULL),(2132,'Liepaja',120,NULL),(2133,'Liepajas',120,NULL),(2134,'Limbazhu',120,NULL),(2135,'Ludzas',120,NULL),(2136,'Madonas',120,NULL),(2137,'Ogres',120,NULL),(2138,'Preilu',120,NULL),(2139,'Rezekne',120,NULL),(2140,'Rezeknes',120,NULL),(2141,'Riga',120,NULL),(2142,'Rigas',120,NULL),(2143,'Saldus',120,NULL),(2144,'Talsu',120,NULL),(2145,'Tukuma',120,NULL),(2146,'Valkas',120,NULL),(2147,'Valmieras',120,NULL),(2148,'Ventspils',120,NULL),(2149,'Ventspils City',120,NULL),(2150,'Beirut',121,NULL),(2151,'Jabal Lubnan',121,'N'),(2152,'Mohafazat Liban-Nord',121,'N'),(2153,'Mohafazat Mont-Liban',121,'N'),(2154,'Sidon',121,NULL),(2155,'al-Biqa',121,NULL),(2156,'al-Janub',121,NULL),(2157,'an-Nabatiyah',121,NULL),(2158,'ash-Shamal',121,NULL),(2159,'Berea',122,NULL),(2160,'Butha-Buthe',122,NULL),(2161,'Leribe',122,NULL),(2162,'Mafeteng',122,NULL),(2163,'Maseru',122,NULL),(2164,'Mohale\'s Hoek',122,'N'),(2165,'Mokhotlong',122,NULL),(2166,'Qacha\'s Nek',122,'N'),(2167,'Quthing',122,NULL),(2168,'Thaba-Tseka',122,NULL),(2169,'Bomi',123,NULL),(2170,'Bong',123,NULL),(2171,'Grand Bassa',123,'N'),(2172,'Grand Cape Mount',123,'N'),(2173,'Grand Gedeh',123,'N'),(2174,'Loffa',123,NULL),(2175,'Margibi',123,NULL),(2176,'Maryland and Grand Kru',123,'N'),(2177,'Montserrado',123,NULL),(2178,'Nimba',123,NULL),(2179,'Rivercess',123,NULL),(2180,'Sinoe',123,NULL),(2181,'Ajdabiya',124,NULL),(2182,'Fezzan',124,NULL),(2183,'Banghazi',124,NULL),(2184,'Darnah',124,NULL),(2185,'Ghadamis',124,NULL),(2186,'Gharyan',124,NULL),(2187,'Misratah',124,NULL),(2188,'Murzuq',124,NULL),(2189,'Sabha',124,NULL),(2190,'Sawfajjin',124,NULL),(2191,'Surt',124,NULL),(2192,'Tarabulus',124,NULL),(2193,'Tarhunah',124,NULL),(2194,'Tripolitania',124,NULL),(2195,'Tubruq',124,NULL),(2196,'Yafran',124,NULL),(2197,'Zlitan',124,NULL),(2198,'al-\'Aziziyah',124,NULL),(2199,'al-Fatih',124,NULL),(2200,'al-Jabal al Akhdar',124,'N'),(2201,'al-Jufrah',124,NULL),(2202,'al-Khums',124,NULL),(2203,'al-Kufrah',124,NULL),(2204,'an-Nuqat al-Khams',124,'N'),(2205,'ash-Shati\'',124,NULL),(2206,'az-Zawiyah',124,NULL),(2207,'Balzers',125,NULL),(2208,'Eschen',125,NULL),(2209,'Gamprin',125,NULL),(2210,'Mauren',125,NULL),(2211,'Planken',125,NULL),(2212,'Ruggell',125,NULL),(2213,'Schaan',125,NULL),(2214,'Schellenberg',125,NULL),(2215,'Triesen',125,NULL),(2216,'Triesenberg',125,NULL),(2217,'Vaduz',125,NULL),(2218,'Alytaus',126,NULL),(2219,'Anyksciai',126,NULL),(2220,'Kauno',126,NULL),(2221,'Klaipedos',126,NULL),(2222,'Marijampoles',126,NULL),(2223,'Panevezhio',126,NULL),(2224,'Panevezys',126,NULL),(2225,'Shiauliu',126,NULL),(2226,'Taurages',126,NULL),(2227,'Telshiu',126,NULL),(2228,'Telsiai',126,NULL),(2229,'Utenos',126,NULL),(2230,'Vilniaus',126,NULL),(2231,'Capellen',127,NULL),(2232,'Clervaux',127,NULL),(2233,'Diekirch',127,NULL),(2234,'Echternach',127,NULL),(2235,'Esch-sur-Alzette',127,NULL),(2236,'Grevenmacher',127,NULL),(2237,'Luxembourg',127,NULL),(2238,'Mersch',127,NULL),(2239,'Redange',127,NULL),(2240,'Remich',127,NULL),(2241,'Vianden',127,NULL),(2242,'Wiltz',127,NULL),(2243,'Macau',128,NULL),(2244,'Berovo',129,NULL),(2245,'Bitola',129,NULL),(2246,'Brod',129,NULL),(2247,'Debar',129,NULL),(2248,'Delchevo',129,NULL),(2249,'Demir Hisar',129,'N'),(2250,'Gevgelija',129,NULL),(2251,'Gostivar',129,NULL),(2252,'Kavadarci',129,NULL),(2253,'Kichevo',129,NULL),(2254,'Kochani',129,NULL),(2255,'Kratovo',129,NULL),(2256,'Kriva Palanka',129,'N'),(2257,'Krushevo',129,NULL),(2258,'Kumanovo',129,NULL),(2259,'Negotino',129,NULL),(2260,'Ohrid',129,NULL),(2261,'Prilep',129,NULL),(2262,'Probishtip',129,NULL),(2263,'Radovish',129,NULL),(2264,'Resen',129,NULL),(2265,'Shtip',129,NULL),(2266,'Skopje',129,NULL),(2267,'Struga',129,NULL),(2268,'Strumica',129,NULL),(2269,'Sveti Nikole',129,'N'),(2270,'Tetovo',129,NULL),(2271,'Valandovo',129,NULL),(2272,'Veles',129,NULL),(2273,'Vinica',129,NULL),(2274,'Antananarivo',130,NULL),(2275,'Antsiranana',130,NULL),(2276,'Fianarantsoa',130,NULL),(2277,'Mahajanga',130,NULL),(2278,'Toamasina',130,NULL),(2279,'Toliary',130,NULL),(2280,'Balaka',131,NULL),(2281,'Blantyre City',131,'N'),(2282,'Chikwawa',131,NULL),(2283,'Chiradzulu',131,NULL),(2284,'Chitipa',131,NULL),(2285,'Dedza',131,NULL),(2286,'Dowa',131,NULL),(2287,'Karonga',131,NULL),(2288,'Kasungu',131,NULL),(2289,'Lilongwe City',131,'N'),(2290,'Machinga',131,NULL),(2291,'Mangochi',131,NULL),(2292,'Mchinji',131,NULL),(2293,'Mulanje',131,NULL),(2294,'Mwanza',131,NULL),(2295,'Mzimba',131,NULL),(2296,'Mzuzu City',131,'N'),(2297,'Nkhata Bay',131,'N'),(2298,'Nkhotakota',131,NULL),(2299,'Nsanje',131,NULL),(2300,'Ntcheu',131,NULL),(2301,'Ntchisi',131,NULL),(2302,'Phalombe',131,NULL),(2303,'Rumphi',131,NULL),(2304,'Salima',131,NULL),(2305,'Thyolo',131,NULL),(2306,'Zomba Municipality',131,'N'),(2307,'Johor',132,NULL),(2308,'Kedah',132,NULL),(2309,'Kelantan',132,NULL),(2310,'Kuala Lumpur',132,'N'),(2311,'Labuan',132,NULL),(2312,'Melaka',132,NULL),(2313,'Negeri Johor',132,'N'),(2314,'Negeri Sembilan',132,'N'),(2315,'Pahang',132,NULL),(2316,'Penang',132,NULL),(2317,'Perak',132,NULL),(2318,'Perlis',132,NULL),(2319,'Pulau Pinang',132,'N'),(2320,'Sabah',132,NULL),(2321,'Sarawak',132,NULL),(2322,'Selangor',132,NULL),(2323,'Sembilan',132,NULL),(2324,'Terengganu',132,NULL),(2325,'Alif Alif',133,'N'),(2326,'Alif Dhaal',133,'N'),(2327,'Baa',133,NULL),(2328,'Dhaal',133,NULL),(2329,'Faaf',133,NULL),(2330,'Gaaf Alif',133,'N'),(2331,'Gaaf Dhaal',133,'N'),(2332,'Ghaviyani',133,NULL),(2333,'Haa Alif',133,'N'),(2334,'Haa Dhaal',133,'N'),(2335,'Kaaf',133,NULL),(2336,'Laam',133,NULL),(2337,'Lhaviyani',133,NULL),(2338,'Male',133,'N'),(2339,'Miim',133,NULL),(2340,'Nuun',133,NULL),(2341,'Raa',133,NULL),(2342,'Shaviyani',133,NULL),(2343,'Siin',133,NULL),(2344,'Thaa',133,NULL),(2345,'Vaav',133,NULL),(2346,'Bamako',134,NULL),(2347,'Gao',134,NULL),(2348,'Kayes',134,NULL),(2349,'Kidal',134,NULL),(2350,'Koulikoro',134,NULL),(2351,'Mopti',134,NULL),(2352,'Segou',134,NULL),(2353,'Sikasso',134,NULL),(2354,'Tombouctou',134,NULL),(2355,'Gozo and Comino',135,'N'),(2356,'Inner Harbour',135,'N'),(2357,'Northern',135,NULL),(2358,'Outer Harbour',135,'N'),(2359,'South Eastern',135,'N'),(2360,'Valletta',135,NULL),(2361,'Western',135,NULL),(2362,'Castletown',136,NULL),(2363,'Douglas',136,NULL),(2364,'Laxey',136,NULL),(2365,'Onchan',136,NULL),(2366,'Peel',136,NULL),(2367,'Port Erin',136,'N'),(2368,'Port Saint Mary',136,'N'),(2369,'Ramsey',136,NULL),(2370,'Ailinlaplap',137,NULL),(2371,'Ailuk',137,NULL),(2372,'Arno',137,NULL),(2373,'Aur',137,NULL),(2374,'Bikini',137,NULL),(2375,'Ebon',137,NULL),(2376,'Enewetak',137,NULL),(2377,'Jabat',137,NULL),(2378,'Jaluit',137,NULL),(2379,'Kili',137,NULL),(2380,'Kwajalein',137,NULL),(2381,'Lae',137,NULL),(2382,'Lib',137,NULL),(2383,'Likiep',137,NULL),(2384,'Majuro',137,NULL),(2385,'Maloelap',137,NULL),(2386,'Mejit',137,NULL),(2387,'Mili',137,NULL),(2388,'Namorik',137,NULL),(2389,'Namu',137,NULL),(2390,'Rongelap',137,NULL),(2391,'Ujae',137,NULL),(2392,'Utrik',137,NULL),(2393,'Wotho',137,NULL),(2394,'Wotje',137,NULL),(2395,'Fort-de-France',138,NULL),(2396,'La Trinite',138,'N'),(2397,'Le Marin',138,'N'),(2398,'Saint-Pierre',138,NULL),(2399,'Adrar',139,NULL),(2400,'Assaba',139,NULL),(2401,'Brakna',139,NULL),(2402,'Dhakhlat Nawadibu',139,'N'),(2403,'Hudh-al-Gharbi',139,NULL),(2404,'Hudh-ash-Sharqi',139,NULL),(2405,'Inshiri',139,NULL),(2406,'Nawakshut',139,NULL),(2407,'Qidimagha',139,NULL),(2408,'Qurqul',139,NULL),(2409,'Taqant',139,NULL),(2410,'Tiris Zammur',139,'N'),(2411,'Trarza',139,NULL),(2412,'Black River',140,'N'),(2413,'Eau Coulee',140,'N'),(2414,'Flacq',140,NULL),(2415,'Floreal',140,NULL),(2416,'Grand Port',140,'N'),(2417,'Moka',140,NULL),(2418,'Pamplempousses',140,NULL),(2419,'Plaines Wilhelm',140,'N'),(2420,'Port Louis',140,'N'),(2421,'Riviere du Rempart',140,'N'),(2422,'Rodrigues',140,NULL),(2423,'Rose Hill',140,'N'),(2424,'Savanne',140,NULL),(2425,'Mayotte',141,NULL),(2426,'Pamanzi',141,NULL),(2427,'Aguascalientes',142,NULL),(2428,'Baja California',142,'N'),(2429,'Baja California Sur',142,'N'),(2430,'Campeche',142,NULL),(2431,'Chiapas',142,NULL),(2432,'Chihuahua',142,NULL),(2433,'Coahuila',142,NULL),(2434,'Colima',142,NULL),(2435,'Distrito Federal',142,'N'),(2436,'Durango',142,NULL),(2437,'Estado de Mexico',142,'N'),(2438,'Guanajuato',142,NULL),(2439,'Guerrero',142,NULL),(2440,'Hidalgo',142,NULL),(2441,'Jalisco',142,NULL),(2442,'Mexico',142,NULL),(2443,'Michoacan',142,NULL),(2444,'Morelos',142,NULL),(2445,'Nayarit',142,NULL),(2446,'Nuevo Leon',142,'N'),(2447,'Oaxaca',142,NULL),(2448,'Puebla',142,NULL),(2449,'Queretaro',142,NULL),(2450,'Quintana Roo',142,'N'),(2451,'San Luis Potosi',142,'N'),(2452,'Sinaloa',142,NULL),(2453,'Sonora',142,NULL),(2454,'Tabasco',142,NULL),(2455,'Tamaulipas',142,NULL),(2456,'Tlaxcala',142,NULL),(2457,'Veracruz',142,NULL),(2458,'Yucatan',142,NULL),(2459,'Zacatecas',142,NULL),(2460,'Chuuk',143,NULL),(2461,'Kusaie',143,NULL),(2462,'Pohnpei',143,NULL),(2463,'Yap',143,NULL),(2464,'Balti',144,NULL),(2465,'Cahul',144,NULL),(2466,'Chisinau',144,NULL),(2467,'Chisinau Oras',144,NULL),(2468,'Edinet',144,NULL),(2469,'Gagauzia',144,NULL),(2470,'Lapusna',144,NULL),(2471,'Orhei',144,NULL),(2472,'Soroca',144,NULL),(2473,'Taraclia',144,NULL),(2474,'Tighina',144,NULL),(2475,'Transnistria',144,NULL),(2476,'Ungheni',144,NULL),(2477,'Fontvieille',145,NULL),(2478,'La Condamine',145,'N'),(2479,'Monaco-Ville',145,NULL),(2480,'Monte Carlo',145,'N'),(2481,'Arhangaj',146,NULL),(2482,'Bajan-Olgij',146,NULL),(2483,'Bajanhongor',146,NULL),(2484,'Bulgan',146,NULL),(2485,'Darhan-Uul',146,NULL),(2486,'Dornod',146,NULL),(2487,'Dornogovi',146,NULL),(2488,'Dundgovi',146,NULL),(2489,'Govi-Altaj',146,NULL),(2490,'Govisumber',146,NULL),(2491,'Hentij',146,NULL),(2492,'Hovd',146,NULL),(2493,'Hovsgol',146,NULL),(2494,'Omnogovi',146,NULL),(2495,'Orhon',146,NULL),(2496,'Ovorhangaj',146,NULL),(2497,'Selenge',146,NULL),(2498,'Suhbaatar',146,NULL),(2499,'Tov',146,NULL),(2500,'Ulaanbaatar',146,NULL),(2501,'Uvs',146,NULL),(2502,'Zavhan',146,NULL),(2503,'Montserrat',147,NULL),(2504,'Agadir',148,NULL),(2505,'Casablanca',148,NULL),(2506,'Chaouia-Ouardigha',148,NULL),(2507,'Doukkala-Abda',148,NULL),(2508,'Fes-Boulemane',148,NULL),(2509,'Gharb-Chrarda-Beni Hssen',148,'N'),(2510,'Guelmim',148,NULL),(2511,'Kenitra',148,NULL),(2512,'Marrakech-Tensift-Al Haouz',148,'N'),(2513,'Meknes-Tafilalet',148,NULL),(2514,'Oriental',148,NULL),(2515,'Oujda',148,NULL),(2516,'Province de Tanger',148,'N'),(2517,'Rabat-Sale-Zammour-Zaer',148,NULL),(2518,'Sala Al Jadida',148,'N'),(2519,'Settat',148,NULL),(2520,'Souss Massa-Draa',148,'N'),(2521,'Tadla-Azilal',148,NULL),(2522,'Tangier-Tetouan',148,NULL),(2523,'Taza-Al Hoceima-Taounate',148,'N'),(2524,'Wilaya de Casablanca',148,'N'),(2525,'Wilaya de Rabat-Sale',148,'N'),(2526,'Cabo Delgado',149,'N'),(2527,'Gaza',149,NULL),(2528,'Inhambane',149,NULL),(2529,'Manica',149,NULL),(2530,'Maputo',149,NULL),(2531,'Maputo Provincia',149,NULL),(2532,'Nampula',149,NULL),(2533,'Niassa',149,NULL),(2534,'Sofala',149,NULL),(2535,'Tete',149,NULL),(2536,'Zambezia',149,NULL),(2537,'Ayeyarwady',150,NULL),(2538,'Bago',150,NULL),(2539,'Chin',150,NULL),(2540,'Kachin',150,NULL),(2541,'Kayah',150,NULL),(2542,'Kayin',150,NULL),(2543,'Magway',150,NULL),(2544,'Mandalay',150,NULL),(2545,'Mon',150,NULL),(2546,'Nay Pyi Taw',150,'N'),(2547,'Rakhine',150,NULL),(2548,'Sagaing',150,NULL),(2549,'Shan',150,NULL),(2550,'Tanintharyi',150,NULL),(2551,'Yangon',150,NULL),(2552,'Caprivi',151,NULL),(2553,'Erongo',151,NULL),(2554,'Hardap',151,NULL),(2555,'Karas',151,NULL),(2556,'Kavango',151,NULL),(2557,'Khomas',151,NULL),(2558,'Kunene',151,NULL),(2559,'Ohangwena',151,NULL),(2560,'Omaheke',151,NULL),(2561,'Omusati',151,NULL),(2562,'Oshana',151,NULL),(2563,'Oshikoto',151,NULL),(2564,'Otjozondjupa',151,NULL),(2565,'Yaren',152,NULL),(2566,'Bagmati',153,NULL),(2567,'Bheri',153,NULL),(2568,'Dhawalagiri',153,NULL),(2569,'Gandaki',153,NULL),(2570,'Janakpur',153,NULL),(2571,'Karnali',153,NULL),(2572,'Koshi',153,NULL),(2573,'Lumbini',153,NULL),(2574,'Mahakali',153,NULL),(2575,'Mechi',153,NULL),(2576,'Narayani',153,NULL),(2577,'Rapti',153,NULL),(2578,'Sagarmatha',153,NULL),(2579,'Seti',153,NULL),(2580,'Bonaire',154,NULL),(2581,'Curacao',154,NULL),(2582,'Saba',154,NULL),(2583,'Sint Eustatius',154,'N'),(2584,'Sint Maarten',154,'N'),(2585,'Amsterdam',155,NULL),(2586,'Benelux',155,NULL),(2587,'Drenthe',155,NULL),(2588,'Flevoland',155,NULL),(2589,'Friesland',155,NULL),(2590,'Gelderland',155,NULL),(2591,'Groningen',155,NULL),(2592,'Limburg',155,NULL),(2593,'Noord-Brabant',155,NULL),(2594,'Noord-Holland',155,NULL),(2595,'Overijssel',155,NULL),(2596,'South Holland',155,'N'),(2597,'Utrecht',155,NULL),(2598,'Zeeland',155,NULL),(2599,'Zuid-Holland',155,NULL),(2600,'Iles',156,NULL),(2601,'Nord',156,NULL),(2602,'Sud',156,NULL),(2603,'Area Outside Region',157,'N'),(2604,'Auckland',157,NULL),(2605,'Bay of Plenty',157,'N'),(2606,'Canterbury',157,NULL),(2607,'Christchurch',157,'N'),(2608,'Gisborne',157,NULL),(2609,'Hawke\'s Bay',157,'N'),(2610,'Manawatu-Wanganui',157,NULL),(2611,'Marlborough',157,NULL),(2612,'Nelson',157,NULL),(2613,'Northland',157,NULL),(2614,'Otago',157,NULL),(2615,'Rodney',157,NULL),(2616,'Southland',157,NULL),(2617,'Taranaki',157,NULL),(2618,'Tasman',157,NULL),(2619,'Waikato',157,NULL),(2620,'Wellington',157,NULL),(2621,'West Coast',157,'N'),(2622,'Atlantico Norte',158,'N'),(2623,'Atlantico Sur',158,'N'),(2624,'Boaco',158,NULL),(2625,'Carazo',158,NULL),(2626,'Chinandega',158,NULL),(2627,'Chontales',158,NULL),(2628,'Esteli',158,NULL),(2629,'Granada',158,NULL),(2630,'Jinotega',158,NULL),(2631,'Leon',158,NULL),(2632,'Madriz',158,NULL),(2633,'Managua',158,NULL),(2634,'Masaya',158,NULL),(2635,'Matagalpa',158,NULL),(2636,'Nueva Segovia',158,'N'),(2637,'Rio San Juan',158,'N'),(2638,'Rivas',158,NULL),(2639,'Agadez',159,NULL),(2640,'Diffa',159,NULL),(2641,'Dosso',159,NULL),(2642,'Maradi',159,NULL),(2643,'Niamey',159,NULL),(2644,'Tahoua',159,NULL),(2645,'Tillabery',159,NULL),(2646,'Zinder',159,NULL),(2647,'Abia',160,NULL),(2648,'Abuja Federal Capital Territor',160,'N'),(2649,'Adamawa',160,NULL),(2650,'Akwa Ibom',160,'N'),(2651,'Anambra',160,NULL),(2652,'Bauchi',160,NULL),(2653,'Bayelsa',160,NULL),(2654,'Benue',160,NULL),(2655,'Borno',160,NULL),(2656,'Cross River',160,'N'),(2657,'Delta',160,NULL),(2658,'Ebonyi',160,NULL),(2659,'Edo',160,NULL),(2660,'Ekiti',160,NULL),(2661,'Enugu',160,NULL),(2662,'Gombe',160,NULL),(2663,'Imo',160,NULL),(2664,'Jigawa',160,NULL),(2665,'Kaduna',160,NULL),(2666,'Kano',160,NULL),(2667,'Katsina',160,NULL),(2668,'Kebbi',160,NULL),(2669,'Kogi',160,NULL),(2670,'Kwara',160,NULL),(2671,'Lagos',160,NULL),(2672,'Nassarawa',160,NULL),(2673,'Niger',160,NULL),(2674,'Ogun',160,NULL),(2675,'Ondo',160,NULL),(2676,'Osun',160,NULL),(2677,'Oyo',160,NULL),(2678,'Plateau',160,NULL),(2679,'Rivers',160,NULL),(2680,'Sokoto',160,NULL),(2681,'Taraba',160,NULL),(2682,'Yobe',160,NULL),(2683,'Zamfara',160,NULL),(2684,'Niue',161,NULL),(2685,'Norfolk Island',162,'N'),(2686,'Northern Islands',163,'N'),(2687,'Rota',163,NULL),(2688,'Saipan',163,NULL),(2689,'Tinian',163,NULL),(2690,'Akershus',164,NULL),(2691,'Aust Agder',164,'N'),(2692,'Bergen',164,NULL),(2693,'Buskerud',164,NULL),(2694,'Finnmark',164,NULL),(2695,'Hedmark',164,NULL),(2696,'Hordaland',164,NULL),(2697,'Moere og Romsdal',164,'N'),(2698,'Nord Trondelag',164,'N'),(2699,'Nordland',164,NULL),(2700,'Oestfold',164,NULL),(2701,'Oppland',164,NULL),(2702,'Oslo',164,NULL),(2703,'Rogaland',164,NULL),(2704,'Soer Troendelag',164,'N'),(2705,'Sogn og Fjordane',164,'N'),(2706,'Stavern',164,NULL),(2707,'Sykkylven',164,NULL),(2708,'Telemark',164,NULL),(2709,'Troms',164,NULL),(2710,'Vest Agder',164,'N'),(2711,'Vestfold',164,NULL),(2712,'ÃƒÂ˜stfold',164,'N'),(2713,'Al Buraimi',165,'N'),(2714,'Dhufar',165,NULL),(2715,'Masqat',165,NULL),(2716,'Musandam',165,NULL),(2717,'Rusayl',165,NULL),(2718,'Wadi Kabir',165,'N'),(2719,'ad-Dakhiliyah',165,NULL),(2720,'adh-Dhahirah',165,NULL),(2721,'al-Batinah',165,NULL),(2722,'ash-Sharqiyah',165,NULL),(2723,'Baluchistan',166,NULL),(2724,'Federal Capital Area',166,'N'),(2725,'Federally administered Tribal ',166,'N'),(2726,'North-West Frontier',166,'N'),(2727,'Northern Areas',166,'N'),(2728,'Punjab',166,NULL),(2729,'Sind',166,NULL),(2730,'Aimeliik',167,NULL),(2731,'Airai',167,NULL),(2732,'Angaur',167,NULL),(2733,'Hatobohei',167,NULL),(2734,'Kayangel',167,NULL),(2735,'Koror',167,NULL),(2736,'Melekeok',167,NULL),(2737,'Ngaraard',167,NULL),(2738,'Ngardmau',167,NULL),(2739,'Ngaremlengui',167,NULL),(2740,'Ngatpang',167,NULL),(2741,'Ngchesar',167,NULL),(2742,'Ngerchelong',167,NULL),(2743,'Ngiwal',167,NULL),(2744,'Peleliu',167,NULL),(2745,'Sonsorol',167,NULL),(2746,'Ariha',168,NULL),(2747,'Bayt Lahm',168,'N'),(2748,'Bethlehem',168,NULL),(2749,'Dayr-al-Balah',168,NULL),(2750,'Ghazzah',168,NULL),(2751,'Ghazzah ash-Shamaliyah',168,NULL),(2752,'Janin',168,NULL),(2753,'Khan Yunis',168,'N'),(2754,'Nabulus',168,NULL),(2755,'Qalqilyah',168,NULL),(2756,'Rafah',168,NULL),(2757,'Ram Allah wal-Birah',168,'N'),(2758,'Salfit',168,NULL),(2759,'Tubas',168,NULL),(2760,'Tulkarm',168,NULL),(2761,'al-Khalil',168,NULL),(2762,'al-Quds',168,NULL),(2763,'Bocas del Toro',169,'N'),(2764,'Chiriqui',169,NULL),(2765,'Cocle',169,NULL),(2766,'Colon',169,NULL),(2767,'Darien',169,NULL),(2768,'Embera',169,NULL),(2769,'Herrera',169,NULL),(2770,'Kuna Yala',169,'N'),(2771,'Los Santos',169,'N'),(2772,'Ngobe Bugle',169,'N'),(2773,'Panama',169,NULL),(2774,'Veraguas',169,NULL),(2775,'East New Britain',170,'N'),(2776,'East Sepik',170,'N'),(2777,'Eastern Highlands',170,'N'),(2778,'Enga',170,NULL),(2779,'Fly River',170,'N'),(2780,'Gulf',170,NULL),(2781,'Madang',170,NULL),(2782,'Manus',170,NULL),(2783,'Milne Bay',170,'N'),(2784,'Morobe',170,NULL),(2785,'National Capital District',170,'N'),(2786,'New Ireland',170,'N'),(2787,'North Solomons',170,'N'),(2788,'Oro',170,NULL),(2789,'Sandaun',170,NULL),(2790,'Simbu',170,NULL),(2791,'Southern Highlands',170,'N'),(2792,'West New Britain',170,'N'),(2793,'Western Highlands',170,'N'),(2794,'Alto Paraguay',171,'N'),(2795,'Alto Parana',171,'N'),(2796,'Amambay',171,NULL),(2797,'Asuncion',171,NULL),(2798,'Boqueron',171,NULL),(2799,'Caaguazu',171,NULL),(2800,'Caazapa',171,NULL),(2801,'Canendiyu',171,NULL),(2802,'Central',171,NULL),(2803,'Concepcion',171,NULL),(2804,'Cordillera',171,NULL),(2805,'Guaira',171,NULL),(2806,'Itapua',171,NULL),(2807,'Misiones',171,NULL),(2808,'Neembucu',171,NULL),(2809,'Paraguari',171,NULL),(2810,'Presidente Hayes',171,'N'),(2811,'San Pedro',171,'N'),(2812,'Amazonas',172,NULL),(2813,'Ancash',172,NULL),(2814,'Apurimac',172,NULL),(2815,'Arequipa',172,NULL),(2816,'Ayacucho',172,NULL),(2817,'Cajamarca',172,NULL),(2818,'Cusco',172,NULL),(2819,'Huancavelica',172,NULL),(2820,'Huanuco',172,NULL),(2821,'Ica',172,NULL),(2822,'Junin',172,NULL),(2823,'La Libertad',172,'N'),(2824,'Lambayeque',172,NULL),(2825,'Lima y Callao',172,'N'),(2826,'Loreto',172,NULL),(2827,'Madre de Dios',172,'N'),(2828,'Moquegua',172,NULL),(2829,'Pasco',172,NULL),(2830,'Piura',172,NULL),(2831,'Puno',172,NULL),(2832,'San Martin',172,'N'),(2833,'Tacna',172,NULL),(2834,'Tumbes',172,NULL),(2835,'Ucayali',172,NULL),(2836,'Batangas',173,NULL),(2837,'Bicol',173,NULL),(2838,'Bulacan',173,NULL),(2839,'Cagayan',173,NULL),(2840,'Caraga',173,NULL),(2841,'Central Luzon',173,'N'),(2842,'Central Mindanao',173,'N'),(2843,'Central Visayas',173,'N'),(2844,'Cordillera',173,NULL),(2845,'Davao',173,NULL),(2846,'Eastern Visayas',173,'N'),(2847,'Greater Metropolitan Area',173,'N'),(2848,'Ilocos',173,NULL),(2849,'Laguna',173,NULL),(2850,'Luzon',173,NULL),(2851,'Mactan',173,NULL),(2852,'Metropolitan Manila Area',173,'N'),(2853,'Muslim Mindanao',173,'N'),(2854,'Northern Mindanao',173,'N'),(2855,'Southern Mindanao',173,'N'),(2856,'Southern Tagalog',173,'N'),(2857,'Western Mindanao',173,'N'),(2858,'Western Visayas',173,'N'),(2859,'Pitcairn Island',174,'N'),(2860,'Biale Blota',175,'N'),(2861,'Dobroszyce',175,NULL),(2862,'Dolnoslaskie',175,NULL),(2863,'Dziekanow Lesny',175,'N'),(2864,'Hopowo',175,NULL),(2865,'Kartuzy',175,NULL),(2866,'Koscian',175,NULL),(2867,'Krakow',175,NULL),(2868,'Kujawsko-Pomorskie',175,NULL),(2869,'Lodzkie',175,NULL),(2870,'Lubelskie',175,NULL),(2871,'Lubuskie',175,NULL),(2872,'Malomice',175,NULL),(2873,'Malopolskie',175,NULL),(2874,'Mazowieckie',175,NULL),(2875,'Mirkow',175,NULL),(2876,'Opolskie',175,NULL),(2877,'Ostrowiec',175,NULL),(2878,'Podkarpackie',175,NULL),(2879,'Podlaskie',175,NULL),(2880,'Polska',175,NULL),(2881,'Pomorskie',175,NULL),(2882,'Poznan',175,NULL),(2883,'Pruszkow',175,NULL),(2884,'Rymanowska',175,NULL),(2885,'Rzeszow',175,NULL),(2886,'Slaskie',175,NULL),(2887,'Stare Pole',175,'N'),(2888,'Swietokrzyskie',175,NULL),(2889,'Warminsko-Mazurskie',175,NULL),(2890,'Warsaw',175,NULL),(2891,'Wejherowo',175,NULL),(2892,'Wielkopolskie',175,NULL),(2893,'Wroclaw',175,NULL),(2894,'Zachodnio-Pomorskie',175,NULL),(2895,'Zukowo',175,NULL),(2896,'Abrantes',176,NULL),(2897,'Acores',176,NULL),(2898,'Alentejo',176,NULL),(2899,'Algarve',176,NULL),(2900,'Braga',176,NULL),(2901,'Centro',176,NULL),(2902,'Distrito de Leiria',176,'N'),(2903,'Distrito de Viana do Castelo',176,'N'),(2904,'Distrito de Vila Real',176,'N'),(2905,'Distrito do Porto',176,'N'),(2906,'Lisboa e Vale do Tejo',176,'N'),(2907,'Madeira',176,NULL),(2908,'Norte',176,NULL),(2909,'Paivas',176,NULL),(2910,'Arecibo',177,NULL),(2911,'Bayamon',177,NULL),(2912,'Carolina',177,NULL),(2913,'Florida',177,NULL),(2914,'Guayama',177,NULL),(2915,'Humacao',177,NULL),(2916,'Mayaguez-Aguadilla',177,NULL),(2917,'Ponce',177,NULL),(2918,'Salinas',177,NULL),(2919,'San Juan',177,'N'),(2920,'Doha',178,NULL),(2921,'Jarian-al-Batnah',178,NULL),(2922,'Umm Salal',178,'N'),(2923,'ad-Dawhah',178,NULL),(2924,'al-Ghuwayriyah',178,NULL),(2925,'al-Jumayliyah',178,NULL),(2926,'al-Khawr',178,NULL),(2927,'al-Wakrah',178,NULL),(2928,'ar-Rayyan',178,NULL),(2929,'ash-Shamal',178,NULL),(2930,'Saint-Benoit',179,NULL),(2931,'Saint-Denis',179,NULL),(2932,'Saint-Paul',179,NULL),(2933,'Saint-Pierre',179,NULL),(2934,'Alba',180,NULL),(2935,'Arad',180,NULL),(2936,'Arges',180,NULL),(2937,'Bacau',180,NULL),(2938,'Bihor',180,NULL),(2939,'Bistrita-Nasaud',180,NULL),(2940,'Botosani',180,NULL),(2941,'Braila',180,NULL),(2942,'Brasov',180,NULL),(2943,'Bucuresti',180,NULL),(2944,'Buzau',180,NULL),(2945,'Calarasi',180,NULL),(2946,'Caras-Severin',180,NULL),(2947,'Cluj',180,NULL),(2948,'Constanta',180,NULL),(2949,'Covasna',180,NULL),(2950,'Dambovita',180,NULL),(2951,'Dolj',180,NULL),(2952,'Galati',180,NULL),(2953,'Giurgiu',180,NULL),(2954,'Gorj',180,NULL),(2955,'Harghita',180,NULL),(2956,'Hunedoara',180,NULL),(2957,'Ialomita',180,NULL),(2958,'Iasi',180,NULL),(2959,'Ilfov',180,NULL),(2960,'Maramures',180,NULL),(2961,'Mehedinti',180,NULL),(2962,'Mures',180,NULL),(2963,'Neamt',180,NULL),(2964,'Olt',180,NULL),(2965,'Prahova',180,NULL),(2966,'Salaj',180,NULL),(2967,'Satu Mare',180,'N'),(2968,'Sibiu',180,NULL),(2969,'Sondelor',180,NULL),(2970,'Suceava',180,NULL),(2971,'Teleorman',180,NULL),(2972,'Timis',180,NULL),(2973,'Tulcea',180,NULL),(2974,'Valcea',180,NULL),(2975,'Vaslui',180,NULL),(2976,'Vrancea',180,NULL),(2977,'Adygeja',181,NULL),(2978,'Aga',181,NULL),(2979,'Alanija',181,NULL),(2980,'Altaj',181,NULL),(2981,'Amur',181,NULL),(2982,'Arhangelsk',181,NULL),(2983,'Astrahan',181,NULL),(2984,'Bashkortostan',181,NULL),(2985,'Belgorod',181,NULL),(2986,'Brjansk',181,NULL),(2987,'Burjatija',181,NULL),(2988,'Chechenija',181,NULL),(2989,'Cheljabinsk',181,NULL),(2990,'Chita',181,NULL),(2991,'Chukotka',181,NULL),(2992,'Chuvashija',181,NULL),(2993,'Dagestan',181,NULL),(2994,'Evenkija',181,NULL),(2995,'Gorno-Altaj',181,NULL),(2996,'Habarovsk',181,NULL),(2997,'Hakasija',181,NULL),(2998,'Hanty-Mansija',181,NULL),(2999,'Ingusetija',181,NULL),(3000,'Irkutsk',181,NULL),(3001,'Ivanovo',181,NULL),(3002,'Jamalo-Nenets',181,NULL),(3003,'Jaroslavl',181,NULL),(3004,'Jevrej',181,NULL),(3005,'Kabardino-Balkarija',181,NULL),(3006,'Kaliningrad',181,NULL),(3007,'Kalmykija',181,NULL),(3008,'Kaluga',181,NULL),(3009,'Kamchatka',181,NULL),(3010,'Karachaj-Cherkessija',181,NULL),(3011,'Karelija',181,NULL),(3012,'Kemerovo',181,NULL),(3013,'Khabarovskiy Kray',181,'N'),(3014,'Kirov',181,NULL),(3015,'Komi',181,NULL),(3016,'Komi-Permjakija',181,NULL),(3017,'Korjakija',181,NULL),(3018,'Kostroma',181,NULL),(3019,'Krasnodar',181,NULL),(3020,'Krasnojarsk',181,NULL),(3021,'Krasnoyarskiy Kray',181,'N'),(3022,'Kurgan',181,NULL),(3023,'Kursk',181,NULL),(3024,'Leningrad',181,NULL),(3025,'Lipeck',181,NULL),(3026,'Magadan',181,NULL),(3027,'Marij El',181,'N'),(3028,'Mordovija',181,NULL),(3029,'Moscow',181,NULL),(3030,'Moskovskaja Oblast',181,'N'),(3031,'Moskovskaya Oblast',181,'N'),(3032,'Moskva',181,NULL),(3033,'Murmansk',181,NULL),(3034,'Nenets',181,NULL),(3035,'Nizhnij Novgorod',181,'N'),(3036,'Novgorod',181,NULL),(3037,'Novokusnezk',181,NULL),(3038,'Novosibirsk',181,NULL),(3039,'Omsk',181,NULL),(3040,'Orenburg',181,NULL),(3041,'Orjol',181,NULL),(3042,'Penza',181,NULL),(3043,'Perm',181,NULL),(3044,'Primorje',181,NULL),(3045,'Pskov',181,NULL),(3046,'Pskovskaya Oblast',181,'N'),(3047,'Rjazan',181,NULL),(3048,'Rostov',181,NULL),(3049,'Saha',181,NULL),(3050,'Sahalin',181,NULL),(3051,'Samara',181,NULL),(3052,'Samarskaya',181,NULL),(3053,'Sankt-Peterburg',181,NULL),(3054,'Saratov',181,NULL),(3055,'Smolensk',181,NULL),(3056,'Stavropol',181,NULL),(3057,'Sverdlovsk',181,NULL),(3058,'Tajmyrija',181,NULL),(3059,'Tambov',181,NULL),(3060,'Tatarstan',181,NULL),(3061,'Tjumen',181,NULL),(3062,'Tomsk',181,NULL),(3063,'Tula',181,NULL),(3064,'Tver',181,NULL),(3065,'Tyva',181,NULL),(3066,'Udmurtija',181,NULL),(3067,'Uljanovsk',181,NULL),(3068,'Ulyanovskaya Oblast',181,'N'),(3069,'Ust-Orda',181,NULL),(3070,'Vladimir',181,NULL),(3071,'Volgograd',181,NULL),(3072,'Vologda',181,NULL),(3073,'Voronezh',181,NULL),(3074,'Butare',182,NULL),(3075,'Byumba',182,NULL),(3076,'Cyangugu',182,NULL),(3077,'Gikongoro',182,NULL),(3078,'Gisenyi',182,NULL),(3079,'Gitarama',182,NULL),(3080,'Kibungo',182,NULL),(3081,'Kibuye',182,NULL),(3082,'Kigali-ngali',182,NULL),(3083,'Ruhengeri',182,NULL),(3084,'Ascension',183,NULL),(3085,'Gough Island',183,'N'),(3086,'Saint Helena',183,'N'),(3087,'Tristan da Cunha',183,'N'),(3088,'Christ Church Nichola Town',184,'N'),(3089,'Saint Anne Sandy Point',184,'N'),(3090,'Saint George Basseterre',184,'N'),(3091,'Saint George Gingerland',184,'N'),(3092,'Saint James Windward',184,'N'),(3093,'Saint John Capesterre',184,'N'),(3094,'Saint John Figtree',184,'N'),(3095,'Saint Mary Cayon',184,'N'),(3096,'Saint Paul Capesterre',184,'N'),(3097,'Saint Paul Charlestown',184,'N'),(3098,'Saint Peter Basseterre',184,'N'),(3099,'Saint Thomas Lowland',184,'N'),(3100,'Saint Thomas Middle Island',184,'N'),(3101,'Trinity Palmetto Point',184,'N'),(3102,'Anse-la-Raye',185,NULL),(3103,'Canaries',185,NULL),(3104,'Castries',185,NULL),(3105,'Choiseul',185,NULL),(3106,'Dennery',185,NULL),(3107,'Gros Inlet',185,'N'),(3108,'Laborie',185,NULL),(3109,'Micoud',185,NULL),(3110,'Soufriere',185,NULL),(3111,'Vieux Fort',185,'N'),(3112,'Miquelon-Langlade',186,NULL),(3113,'Saint-Pierre',186,NULL),(3114,'Charlotte',187,NULL),(3115,'Grenadines',187,NULL),(3116,'Saint Andrew',187,'N'),(3117,'Saint David',187,'N'),(3118,'Saint George',187,'N'),(3119,'Saint Patrick',187,'N'),(3120,'A\'ana',188,NULL),(3121,'Aiga-i-le-Tai',188,NULL),(3122,'Atua',188,NULL),(3123,'Fa\'asaleleaga',188,NULL),(3124,'Gaga\'emauga',188,NULL),(3125,'Gagaifomauga',188,NULL),(3126,'Palauli',188,NULL),(3127,'Satupa\'itea',188,NULL),(3128,'Tuamasaga',188,NULL),(3129,'Va\'a-o-Fonoti',188,NULL),(3130,'Vaisigano',188,NULL),(3131,'Acquaviva',189,NULL),(3132,'Borgo Maggiore',189,'N'),(3133,'Chiesanuova',189,NULL),(3134,'Domagnano',189,NULL),(3135,'Faetano',189,NULL),(3136,'Fiorentino',189,NULL),(3137,'Montegiardino',189,NULL),(3138,'San Marino',189,'N'),(3139,'Serravalle',189,NULL),(3140,'Agua Grande',190,'N'),(3141,'Cantagalo',190,NULL),(3142,'Lemba',190,NULL),(3143,'Lobata',190,NULL),(3144,'Me-Zochi',190,NULL),(3145,'Pague',190,NULL),(3146,'Al Khobar',191,'N'),(3147,'Aseer',191,NULL),(3148,'Ash Sharqiyah',191,'N'),(3149,'Asir',191,NULL),(3150,'Central Province',191,'N'),(3151,'Eastern Province',191,'N'),(3152,'Ha\'il',191,NULL),(3153,'Jawf',191,NULL),(3154,'Jizan',191,NULL),(3155,'Makkah',191,NULL),(3156,'Najran',191,NULL),(3157,'Qasim',191,NULL),(3158,'Tabuk',191,NULL),(3159,'Western Province',191,'N'),(3160,'al-Bahah',191,NULL),(3161,'al-Hudud-ash-Shamaliyah',191,NULL),(3162,'al-Madinah',191,NULL),(3163,'ar-Riyad',191,NULL),(3164,'Dakar',192,NULL),(3165,'Diourbel',192,NULL),(3166,'Fatick',192,NULL),(3167,'Kaolack',192,NULL),(3168,'Kolda',192,NULL),(3169,'Louga',192,NULL),(3170,'Saint-Louis',192,NULL),(3171,'Tambacounda',192,NULL),(3172,'Thies',192,NULL),(3173,'Ziguinchor',192,NULL),(3174,'Central Serbia',193,'N'),(3175,'Kosovo and Metohija',193,'N'),(3176,'Vojvodina',193,'N'),(3177,'Anse Boileau',194,'N'),(3178,'Anse Royale',194,'N'),(3179,'Cascade',194,NULL),(3180,'Takamaka',194,NULL),(3181,'Victoria',194,NULL),(3182,'Eastern',195,NULL),(3183,'Northern',195,NULL),(3184,'Southern',195,NULL),(3185,'Western',195,NULL),(3186,'Singapore',196,NULL),(3187,'Banskobystricky',197,NULL),(3188,'Bratislavsky',197,NULL),(3189,'Kosicky',197,NULL),(3190,'Nitriansky',197,NULL),(3191,'Presovsky',197,NULL),(3192,'Trenciansky',197,NULL),(3193,'Trnavsky',197,NULL),(3194,'Zilinsky',197,NULL),(3195,'Benedikt',198,NULL),(3196,'Gorenjska',198,NULL),(3197,'Gorishka',198,NULL),(3198,'Jugovzhodna Slovenija',198,'N'),(3199,'Koroshka',198,NULL),(3200,'Notranjsko-krashka',198,NULL),(3201,'Obalno-krashka',198,NULL),(3202,'Obcina Domzale',198,'N'),(3203,'Obcina Vitanje',198,'N'),(3204,'Osrednjeslovenska',198,NULL),(3205,'Podravska',198,NULL),(3206,'Pomurska',198,NULL),(3207,'Savinjska',198,NULL),(3208,'Slovenian Littoral',198,'N'),(3209,'Spodnjeposavska',198,NULL),(3210,'Zasavska',198,NULL),(3211,'Pitcairn',199,NULL),(3212,'Central',200,NULL),(3213,'Choiseul',200,NULL),(3214,'Guadalcanal',200,NULL),(3215,'Isabel',200,NULL),(3216,'Makira and Ulawa',200,'N'),(3217,'Malaita',200,NULL),(3218,'Rennell and Bellona',200,'N'),(3219,'Temotu',200,NULL),(3220,'Western',200,NULL),(3221,'Awdal',201,NULL),(3222,'Bakol',201,NULL),(3223,'Banadir',201,NULL),(3224,'Bari',201,NULL),(3225,'Bay',201,NULL),(3226,'Galgudug',201,NULL),(3227,'Gedo',201,NULL),(3228,'Hiran',201,NULL),(3229,'Jubbada Hose',201,'N'),(3230,'Jubbadha Dexe',201,'N'),(3231,'Mudug',201,NULL),(3232,'Nugal',201,NULL),(3233,'Sanag',201,NULL),(3234,'Shabellaha Dhexe',201,'N'),(3235,'Shabellaha Hose',201,'N'),(3236,'Togdher',201,NULL),(3237,'Woqoyi Galbed',201,'N'),(3238,'Eastern Cape',202,'N'),(3239,'Free State',202,'N'),(3240,'Gauteng',202,NULL),(3241,'Kempton Park',202,'N'),(3242,'Kramerville',202,NULL),(3243,'KwaZulu Natal',202,'N'),(3244,'Limpopo',202,NULL),(3245,'Mpumalanga',202,NULL),(3246,'North West',202,'N'),(3247,'Northern Cape',202,'N'),(3248,'Parow',202,NULL),(3249,'Table View',202,'N'),(3250,'Umtentweni',202,NULL),(3251,'Western Cape',202,'N'),(3252,'South Georgia',203,'N'),(3253,'Central Equatoria',204,'N'),(3254,'A Coruna',205,NULL),(3255,'Alacant',205,NULL),(3256,'Alava',205,NULL),(3257,'Albacete',205,NULL),(3258,'Almeria',205,NULL),(3260,'Asturias',205,NULL),(3261,'Avila',205,NULL),(3262,'Badajoz',205,NULL),(3263,'Balears',205,NULL),(3264,'Barcelona',205,NULL),(3267,'Burgos',205,NULL),(3268,'Caceres',205,NULL),(3269,'Cadiz',205,NULL),(3270,'Cantabria',205,NULL),(3271,'Castello',205,NULL),(3273,'Ceuta',205,NULL),(3274,'Ciudad Real',205,'N'),(3281,'Cordoba',205,NULL),(3282,'Cuenca',205,NULL),(3284,'Girona',205,NULL),(3285,'Granada',205,NULL),(3286,'Guadalajara',205,NULL),(3287,'Guipuzcoa',205,NULL),(3288,'Huelva',205,NULL),(3289,'Huesca',205,NULL),(3290,'Jaen',205,NULL),(3291,'La Rioja',205,'N'),(3292,'Las Palmas',205,'N'),(3293,'Leon',205,NULL),(3295,'Lleida',205,NULL),(3296,'Lugo',205,NULL),(3297,'Madrid',205,NULL),(3298,'Malaga',205,NULL),(3299,'Melilla',205,NULL),(3300,'Murcia',205,NULL),(3301,'Navarra',205,NULL),(3302,'Ourense',205,NULL),(3303,'Pais Vasco',205,'N'),(3304,'Palencia',205,NULL),(3305,'Pontevedra',205,NULL),(3306,'Salamanca',205,NULL),(3308,'Segovia',205,NULL),(3309,'Sevilla',205,NULL),(3310,'Soria',205,NULL),(3311,'Tarragona',205,NULL),(3312,'Santa Cruz de Tenerife',205,NULL),(3313,'Teruel',205,NULL),(3314,'Toledo',205,NULL),(3315,'Valencia',205,NULL),(3316,'Valladolid',205,NULL),(3317,'Vizcaya',205,NULL),(3318,'Zamora',205,NULL),(3319,'Zaragoza',205,NULL),(3320,'Amparai',206,NULL),(3321,'Anuradhapuraya',206,NULL),(3322,'Badulla',206,NULL),(3323,'Boralesgamuwa',206,NULL),(3324,'Colombo',206,NULL),(3325,'Galla',206,NULL),(3326,'Gampaha',206,NULL),(3327,'Hambantota',206,NULL),(3328,'Kalatura',206,NULL),(3329,'Kegalla',206,NULL),(3330,'Kilinochchi',206,NULL),(3331,'Kurunegala',206,NULL),(3332,'Madakalpuwa',206,NULL),(3333,'Maha Nuwara',206,'N'),(3334,'Malwana',206,NULL),(3335,'Mannarama',206,NULL),(3336,'Matale',206,NULL),(3337,'Matara',206,NULL),(3338,'Monaragala',206,NULL),(3339,'Mullaitivu',206,NULL),(3340,'North Eastern Province',206,'N'),(3341,'North Western Province',206,'N'),(3342,'Nuwara Eliya',206,'N'),(3343,'Polonnaruwa',206,NULL),(3344,'Puttalama',206,NULL),(3345,'Ratnapuraya',206,NULL),(3346,'Southern Province',206,'N'),(3347,'Tirikunamalaya',206,NULL),(3348,'Tuscany',206,NULL),(3349,'Vavuniyawa',206,NULL),(3350,'Western Province',206,'N'),(3351,'Yapanaya',206,NULL),(3352,'kadawatha',206,NULL),(3353,'A\'ali-an-Nil',207,NULL),(3354,'Bahr-al-Jabal',207,NULL),(3355,'Central Equatoria',207,'N'),(3356,'Gharb Bahr-al-Ghazal',207,'N'),(3357,'Gharb Darfur',207,'N'),(3358,'Gharb Kurdufan',207,'N'),(3359,'Gharb-al-Istiwa\'iyah',207,NULL),(3360,'Janub Darfur',207,'N'),(3361,'Janub Kurdufan',207,'N'),(3362,'Junqali',207,NULL),(3363,'Kassala',207,NULL),(3364,'Nahr-an-Nil',207,NULL),(3365,'Shamal Bahr-al-Ghazal',207,'N'),(3366,'Shamal Darfur',207,'N'),(3367,'Shamal Kurdufan',207,'N'),(3368,'Sharq-al-Istiwa\'iyah',207,NULL),(3369,'Sinnar',207,NULL),(3370,'Warab',207,NULL),(3371,'Wilayat al Khartum',207,'N'),(3372,'al-Bahr-al-Ahmar',207,NULL),(3373,'al-Buhayrat',207,NULL),(3374,'al-Jazirah',207,NULL),(3375,'al-Khartum',207,NULL),(3376,'al-Qadarif',207,NULL),(3377,'al-Wahdah',207,NULL),(3378,'an-Nil-al-Abyad',207,NULL),(3379,'an-Nil-al-Azraq',207,NULL),(3380,'ash-Shamaliyah',207,NULL),(3381,'Brokopondo',208,NULL),(3382,'Commewijne',208,NULL),(3383,'Coronie',208,NULL),(3384,'Marowijne',208,NULL),(3385,'Nickerie',208,NULL),(3386,'Para',208,NULL),(3387,'Paramaribo',208,NULL),(3388,'Saramacca',208,NULL),(3389,'Wanica',208,NULL),(3390,'Svalbard',209,NULL),(3391,'Hhohho',210,NULL),(3392,'Lubombo',210,NULL),(3393,'Manzini',210,NULL),(3394,'Shiselweni',210,NULL),(3395,'Alvsborgs Lan',211,'N'),(3396,'Angermanland',211,'N'),(3397,'Blekinge',211,NULL),(3398,'Bohuslan',211,NULL),(3399,'Dalarna',211,NULL),(3400,'Gavleborg',211,NULL),(3401,'Gaza',211,'N'),(3402,'Gotland',211,NULL),(3403,'Halland',211,NULL),(3404,'Jamtland',211,NULL),(3405,'Jonkoping',211,NULL),(3406,'Kalmar',211,NULL),(3407,'Kristianstads',211,NULL),(3408,'Kronoberg',211,NULL),(3409,'Norrbotten',211,NULL),(3410,'Orebro',211,NULL),(3411,'Ostergotland',211,NULL),(3412,'Saltsjo-Boo',211,NULL),(3413,'Skane',211,NULL),(3414,'Smaland',211,NULL),(3415,'Sodermanland',211,NULL),(3416,'Stockholm',211,NULL),(3417,'Uppsala',211,NULL),(3418,'Varmland',211,NULL),(3419,'Vasterbotten',211,NULL),(3420,'Vastergotland',211,NULL),(3421,'Vasternorrland',211,NULL),(3422,'Vastmanland',211,NULL),(3423,'Vastra Gotaland',211,'N'),(3424,'Aargau',212,NULL),(3425,'Appenzell Inner-Rhoden',212,'N'),(3426,'Appenzell-Ausser Rhoden',212,'N'),(3427,'Basel-Landschaft',212,NULL),(3428,'Basel-Stadt',212,NULL),(3429,'Bern',212,NULL),(3430,'Canton Ticino',212,'N'),(3431,'Fribourg',212,NULL),(3432,'Geneve',212,NULL),(3433,'Glarus',212,NULL),(3434,'Graubunden',212,NULL),(3435,'Heerbrugg',212,NULL),(3436,'Jura',212,NULL),(3437,'Kanton Aargau',212,'N'),(3438,'Luzern',212,NULL),(3439,'Morbio Inferiore',212,'N'),(3440,'Muhen',212,NULL),(3441,'Neuchatel',212,NULL),(3442,'Nidwalden',212,NULL),(3443,'Obwalden',212,NULL),(3444,'Sankt Gallen',212,'N'),(3445,'Schaffhausen',212,NULL),(3446,'Schwyz',212,NULL),(3447,'Solothurn',212,NULL),(3448,'Thurgau',212,NULL),(3449,'Ticino',212,NULL),(3450,'Uri',212,NULL),(3451,'Valais',212,NULL),(3452,'Vaud',212,NULL),(3453,'Vauffelin',212,NULL),(3454,'Zug',212,NULL),(3455,'Zurich',212,NULL),(3456,'Aleppo',213,NULL),(3457,'Dar\'a',213,NULL),(3458,'Dayr-az-Zawr',213,NULL),(3459,'Dimashq',213,NULL),(3460,'Halab',213,NULL),(3461,'Hamah',213,NULL),(3462,'Hims',213,NULL),(3463,'Idlib',213,NULL),(3464,'Madinat Dimashq',213,'N'),(3465,'Tartus',213,NULL),(3466,'al-Hasakah',213,NULL),(3467,'al-Ladhiqiyah',213,NULL),(3468,'al-Qunaytirah',213,NULL),(3469,'ar-Raqqah',213,NULL),(3470,'as-Suwayda',213,NULL),(3471,'Changhua County',214,NULL),(3472,'Chiayi County',214,'N'),(3473,'Chiayi City',214,'N'),(3474,'Taipei City',214,'N'),(3475,'Hsinchu County',214,'N'),(3476,'Hsinchu City',214,'N'),(3477,'Hualien County',214,NULL),(3480,'Kaohsiung City',214,'N'),(3481,'Keelung City',214,'N'),(3482,'Kinmen County',214,NULL),(3483,'Miaoli County',214,NULL),(3484,'Nantou County',214,NULL),(3486,'Penghu County',214,NULL),(3487,'Pingtung County',214,NULL),(3488,'Taichung City',214,NULL),(3492,'Tainan City',214,'N'),(3493,'New Taipei City',214,'N'),(3495,'Taitung County',214,NULL),(3496,'Taoyuan City',214,NULL),(3497,'Yilan County',214,NULL),(3498,'YunLin County',214,'N'),(3500,'Dushanbe',215,NULL),(3501,'Gorno-Badakhshan',215,NULL),(3502,'Karotegin',215,NULL),(3503,'Khatlon',215,NULL),(3504,'Sughd',215,NULL),(3505,'Arusha',216,NULL),(3506,'Dar es Salaam',216,'N'),(3507,'Dodoma',216,NULL),(3508,'Iringa',216,NULL),(3509,'Kagera',216,NULL),(3510,'Kigoma',216,NULL),(3511,'Kilimanjaro',216,NULL),(3512,'Lindi',216,NULL),(3513,'Mara',216,NULL),(3514,'Mbeya',216,NULL),(3515,'Morogoro',216,NULL),(3516,'Mtwara',216,NULL),(3517,'Mwanza',216,NULL),(3518,'Pwani',216,NULL),(3519,'Rukwa',216,NULL),(3520,'Ruvuma',216,NULL),(3521,'Shinyanga',216,NULL),(3522,'Singida',216,NULL),(3523,'Tabora',216,NULL),(3524,'Tanga',216,NULL),(3525,'Zanzibar and Pemba',216,'N'),(3526,'Amnat Charoen',217,'N'),(3527,'Ang Thong',217,'N'),(3528,'Bangkok',217,NULL),(3529,'Buri Ram',217,'N'),(3530,'Chachoengsao',217,NULL),(3531,'Chai Nat',217,'N'),(3532,'Chaiyaphum',217,NULL),(3533,'Changwat Chaiyaphum',217,'N'),(3534,'Chanthaburi',217,NULL),(3535,'Chiang Mai',217,'N'),(3536,'Chiang Rai',217,'N'),(3537,'Chon Buri',217,'N'),(3538,'Chumphon',217,NULL),(3539,'Kalasin',217,NULL),(3540,'Kamphaeng Phet',217,'N'),(3541,'Kanchanaburi',217,NULL),(3542,'Khon Kaen',217,'N'),(3543,'Krabi',217,NULL),(3544,'Krung Thep',217,'N'),(3545,'Lampang',217,NULL),(3546,'Lamphun',217,NULL),(3547,'Loei',217,NULL),(3548,'Lop Buri',217,'N'),(3549,'Mae Hong Son',217,'N'),(3550,'Maha Sarakham',217,'N'),(3551,'Mukdahan',217,NULL),(3552,'Nakhon Nayok',217,'N'),(3553,'Nakhon Pathom',217,'N'),(3554,'Nakhon Phanom',217,'N'),(3555,'Nakhon Ratchasima',217,'N'),(3556,'Nakhon Sawan',217,'N'),(3557,'Nakhon Si Thammarat',217,'N'),(3558,'Nan',217,NULL),(3559,'Narathiwat',217,NULL),(3560,'Nong Bua Lam Phu',217,'N'),(3561,'Nong Khai',217,'N'),(3562,'Nonthaburi',217,NULL),(3563,'Pathum Thani',217,'N'),(3564,'Pattani',217,NULL),(3565,'Phangnga',217,NULL),(3566,'Phatthalung',217,NULL),(3567,'Phayao',217,NULL),(3568,'Phetchabun',217,NULL),(3569,'Phetchaburi',217,NULL),(3570,'Phichit',217,NULL),(3571,'Phitsanulok',217,NULL),(3572,'Phra Nakhon Si Ayutthaya',217,'N'),(3573,'Phrae',217,NULL),(3574,'Phuket',217,NULL),(3575,'Prachin Buri',217,'N'),(3576,'Prachuap Khiri Khan',217,'N'),(3577,'Ranong',217,NULL),(3578,'Ratchaburi',217,NULL),(3579,'Rayong',217,NULL),(3580,'Roi Et',217,'N'),(3581,'Sa Kaeo',217,'N'),(3582,'Sakon Nakhon',217,'N'),(3583,'Samut Prakan',217,'N'),(3584,'Samut Sakhon',217,'N'),(3585,'Samut Songkhran',217,'N'),(3586,'Saraburi',217,NULL),(3587,'Satun',217,NULL),(3588,'Si Sa Ket',217,'N'),(3589,'Sing Buri',217,'N'),(3590,'Songkhla',217,NULL),(3591,'Sukhothai',217,NULL),(3592,'Suphan Buri',217,'N'),(3593,'Surat Thani',217,'N'),(3594,'Surin',217,NULL),(3595,'Tak',217,NULL),(3596,'Trang',217,NULL),(3597,'Trat',217,NULL),(3598,'Ubon Ratchathani',217,'N'),(3599,'Udon Thani',217,'N'),(3600,'Uthai Thani',217,'N'),(3601,'Uttaradit',217,NULL),(3602,'Yala',217,NULL),(3603,'Yasothon',217,NULL),(3604,'Centre',218,NULL),(3605,'Kara',218,NULL),(3606,'Maritime',218,NULL),(3607,'Plateaux',218,NULL),(3608,'Savanes',218,NULL),(3609,'Atafu',219,NULL),(3610,'Fakaofo',219,NULL),(3611,'Nukunonu',219,NULL),(3612,'Eua',220,NULL),(3613,'Ha\'apai',220,NULL),(3614,'Niuas',220,NULL),(3615,'Tongatapu',220,NULL),(3616,'Vava\'u',220,NULL),(3617,'Arima-Tunapuna-Piarco',221,NULL),(3618,'Caroni',221,NULL),(3619,'Chaguanas',221,NULL),(3620,'Couva-Tabaquite-Talparo',221,NULL),(3621,'Diego Martin',221,'N'),(3622,'Glencoe',221,NULL),(3623,'Penal Debe',221,'N'),(3624,'Point Fortin',221,'N'),(3625,'Port of Spain',221,'N'),(3626,'Princes Town',221,'N'),(3627,'Saint George',221,'N'),(3628,'San Fernando',221,'N'),(3629,'San Juan',221,'N'),(3630,'Sangre Grande',221,'N'),(3631,'Siparia',221,NULL),(3632,'Tobago',221,NULL),(3633,'Aryanah',222,NULL),(3634,'Bajah',222,NULL),(3635,'Bin \'Arus',222,'N'),(3636,'Binzart',222,NULL),(3637,'Gouvernorat de Ariana',222,'N'),(3638,'Gouvernorat de Nabeul',222,'N'),(3639,'Gouvernorat de Sousse',222,'N'),(3640,'Hammamet Yasmine',222,'N'),(3641,'Jundubah',222,NULL),(3642,'Madaniyin',222,NULL),(3643,'Manubah',222,NULL),(3644,'Monastir',222,NULL),(3645,'Nabul',222,NULL),(3646,'Qabis',222,NULL),(3647,'Qafsah',222,NULL),(3648,'Qibili',222,NULL),(3649,'Safaqis',222,NULL),(3650,'Sfax',222,NULL),(3651,'Sidi Bu Zayd',222,'N'),(3652,'Silyanah',222,NULL),(3653,'Susah',222,NULL),(3654,'Tatawin',222,NULL),(3655,'Tawzar',222,NULL),(3656,'Tunis',222,NULL),(3657,'Zaghwan',222,NULL),(3658,'al-Kaf',222,NULL),(3659,'al-Mahdiyah',222,NULL),(3660,'al-Munastir',222,NULL),(3661,'al-Qasrayn',222,NULL),(3662,'al-Qayrawan',222,NULL),(3663,'Adana',223,NULL),(3664,'Adiyaman',223,NULL),(3665,'Afyon',223,NULL),(3666,'Agri',223,NULL),(3667,'Aksaray',223,NULL),(3668,'Amasya',223,NULL),(3669,'Ankara',223,NULL),(3670,'Antalya',223,NULL),(3671,'Ardahan',223,NULL),(3672,'Artvin',223,NULL),(3673,'Aydin',223,NULL),(3674,'Balikesir',223,NULL),(3675,'Bartin',223,NULL),(3676,'Batman',223,NULL),(3677,'Bayburt',223,NULL),(3678,'Bilecik',223,NULL),(3679,'Bingol',223,NULL),(3680,'Bitlis',223,NULL),(3681,'Bolu',223,NULL),(3682,'Burdur',223,NULL),(3683,'Bursa',223,NULL),(3684,'Canakkale',223,NULL),(3685,'Cankiri',223,NULL),(3686,'Corum',223,NULL),(3687,'Denizli',223,NULL),(3688,'Diyarbakir',223,NULL),(3689,'Duzce',223,NULL),(3690,'Edirne',223,NULL),(3691,'Elazig',223,NULL),(3692,'Erzincan',223,NULL),(3693,'Erzurum',223,NULL),(3694,'Eskisehir',223,NULL),(3695,'Gaziantep',223,NULL),(3696,'Giresun',223,NULL),(3697,'Gumushane',223,NULL),(3698,'Hakkari',223,NULL),(3699,'Hatay',223,NULL),(3700,'Icel',223,NULL),(3701,'Igdir',223,NULL),(3702,'Isparta',223,NULL),(3703,'Istanbul',223,NULL),(3704,'Izmir',223,NULL),(3705,'Kahramanmaras',223,NULL),(3706,'Karabuk',223,NULL),(3707,'Karaman',223,NULL),(3708,'Kars',223,NULL),(3709,'Karsiyaka',223,NULL),(3710,'Kastamonu',223,NULL),(3711,'Kayseri',223,NULL),(3712,'Kilis',223,NULL),(3713,'Kirikkale',223,NULL),(3714,'Kirklareli',223,NULL),(3715,'Kirsehir',223,NULL),(3716,'Kocaeli',223,NULL),(3717,'Konya',223,NULL),(3718,'Kutahya',223,NULL),(3719,'Lefkosa',223,NULL),(3720,'Malatya',223,NULL),(3721,'Manisa',223,NULL),(3722,'Mardin',223,NULL),(3723,'Mugla',223,NULL),(3724,'Mus',223,NULL),(3725,'Nevsehir',223,NULL),(3726,'Nigde',223,NULL),(3727,'Ordu',223,NULL),(3728,'Osmaniye',223,NULL),(3729,'Rize',223,NULL),(3730,'Sakarya',223,NULL),(3731,'Samsun',223,NULL),(3732,'Sanliurfa',223,NULL),(3733,'Siirt',223,NULL),(3734,'Sinop',223,NULL),(3735,'Sirnak',223,NULL),(3736,'Sivas',223,NULL),(3737,'Tekirdag',223,NULL),(3738,'Tokat',223,NULL),(3739,'Trabzon',223,NULL),(3740,'Tunceli',223,NULL),(3741,'Usak',223,NULL),(3742,'Van',223,NULL),(3743,'Yalova',223,NULL),(3744,'Yozgat',223,NULL),(3745,'Zonguldak',223,NULL),(3746,'Ahal',224,NULL),(3747,'Asgabat',224,NULL),(3748,'Balkan',224,NULL),(3749,'Dasoguz',224,NULL),(3750,'Lebap',224,NULL),(3751,'Mari',224,NULL),(3752,'Grand Turk',225,'N'),(3753,'South Caicos and East Caicos',225,'N'),(3754,'Funafuti',226,NULL),(3755,'Nanumanga',226,NULL),(3756,'Nanumea',226,NULL),(3757,'Niutao',226,NULL),(3758,'Nui',226,NULL),(3759,'Nukufetau',226,NULL),(3760,'Nukulaelae',226,NULL),(3761,'Vaitupu',226,NULL),(3762,'Central',227,NULL),(3763,'Eastern',227,NULL),(3764,'Northern',227,NULL),(3765,'Western',227,NULL),(3766,'Cherkas\'ka',228,NULL),(3767,'Chernihivs\'ka',228,NULL),(3768,'Chernivets\'ka',228,NULL),(3769,'Crimea',228,NULL),(3770,'Dnipropetrovska',228,NULL),(3771,'Donets\'ka',228,NULL),(3772,'Ivano-Frankivs\'ka',228,NULL),(3773,'Kharkiv',228,NULL),(3774,'Kharkov',228,NULL),(3775,'Khersonska',228,NULL),(3776,'Khmel\'nyts\'ka',228,NULL),(3777,'Kirovohrad',228,NULL),(3778,'Krym',228,NULL),(3779,'Kyyiv',228,NULL),(3780,'Kyyivs\'ka',228,NULL),(3781,'L\'vivs\'ka',228,NULL),(3782,'Luhans\'ka',228,NULL),(3783,'Mykolayivs\'ka',228,NULL),(3784,'Odes\'ka',228,NULL),(3785,'Odessa',228,NULL),(3786,'Poltavs\'ka',228,NULL),(3787,'Rivnens\'ka',228,NULL),(3788,'Sevastopol\'',228,'N'),(3789,'Sums\'ka',228,NULL),(3790,'Ternopil\'s\'ka',228,NULL),(3791,'Volyns\'ka',228,NULL),(3792,'Vynnyts\'ka',228,NULL),(3793,'Zakarpats\'ka',228,NULL),(3794,'Zaporizhia',228,NULL),(3795,'Zhytomyrs\'ka',228,NULL),(3796,'Abu Zabi',229,'N'),(3797,'Ajman',229,NULL),(3798,'Dubai',229,NULL),(3799,'Ras al-Khaymah',229,'N'),(3800,'Sharjah',229,NULL),(3801,'Sharjha',229,'N'),(3802,'Umm al Qaywayn',229,'N'),(3803,'al-Fujayrah',229,NULL),(3804,'ash-Shariqah',229,'N'),(3805,'Aberdeen',230,NULL),(3806,'Aberdeenshire',230,NULL),(3807,'Argyll',230,NULL),(3808,'Armagh',230,NULL),(3809,'Bedfordshire',230,NULL),(3810,'Belfast',230,NULL),(3811,'Berkshire',230,NULL),(3812,'Birmingham',230,NULL),(3813,'Brechin',230,NULL),(3814,'Bridgnorth',230,NULL),(3815,'Bristol',230,NULL),(3816,'Buckinghamshire',230,NULL),(3817,'Cambridge',230,NULL),(3818,'Cambridgeshire',230,NULL),(3819,'Channel Islands',230,'N'),(3820,'Cheshire',230,NULL),(3821,'Cleveland',230,NULL),(3822,'Co Fermanagh',230,'N'),(3823,'Conwy',230,NULL),(3824,'Cornwall',230,NULL),(3825,'Coventry',230,NULL),(3826,'Craven Arms',230,'N'),(3827,'Cumbria',230,NULL),(3828,'Denbighshire',230,NULL),(3829,'Derby',230,NULL),(3830,'Derbyshire',230,NULL),(3831,'Devon',230,NULL),(3832,'Dial Code Dungannon',230,'N'),(3833,'Didcot',230,NULL),(3834,'Dorset',230,NULL),(3835,'Dunbartonshire',230,NULL),(3836,'Durham',230,NULL),(3837,'East Dunbartonshire',230,'N'),(3838,'East Lothian',230,'N'),(3839,'East Midlands',230,'N'),(3840,'East Sussex',230,'N'),(3841,'East Yorkshire',230,'N'),(3842,'England',230,NULL),(3843,'Essex',230,NULL),(3844,'Fermanagh',230,NULL),(3845,'Fife',230,NULL),(3846,'Flintshire',230,NULL),(3847,'Fulham',230,NULL),(3848,'Gainsborough',230,NULL),(3849,'Glocestershire',230,NULL),(3850,'Gwent',230,NULL),(3851,'Hampshire',230,NULL),(3852,'Hants',230,NULL),(3853,'Herefordshire',230,NULL),(3854,'Hertfordshire',230,NULL),(3855,'Ireland',230,'N'),(3856,'Isle Of Man',230,'N'),(3857,'Isle of Wight',230,'N'),(3858,'Kenford',230,NULL),(3859,'Kent',230,NULL),(3860,'Kilmarnock',230,NULL),(3861,'Lanarkshire',230,NULL),(3862,'Lancashire',230,NULL),(3863,'Leicestershire',230,NULL),(3864,'Lincolnshire',230,NULL),(3865,'Llanymynech',230,NULL),(3866,'London',230,NULL),(3867,'Ludlow',230,NULL),(3868,'Manchester',230,NULL),(3869,'Mayfair',230,NULL),(3870,'Merseyside',230,NULL),(3871,'Mid Glamorgan',230,'N'),(3872,'Middlesex',230,NULL),(3873,'Mildenhall',230,NULL),(3874,'Monmouthshire',230,NULL),(3875,'Newton Stewart',230,'N'),(3876,'Norfolk',230,NULL),(3877,'North Humberside',230,'N'),(3878,'North Yorkshire',230,'N'),(3879,'Northamptonshire',230,NULL),(3880,'Northants',230,NULL),(3881,'Northern Ireland',230,'N'),(3882,'Northumberland',230,NULL),(3883,'Nottinghamshire',230,NULL),(3884,'Oxford',230,NULL),(3885,'Powys',230,NULL),(3886,'Roos-shire',230,NULL),(3887,'SUSSEX',230,NULL),(3888,'Sark',230,NULL),(3889,'Scotland',230,NULL),(3890,'Scottish Borders',230,'N'),(3891,'Shropshire',230,NULL),(3892,'Somerset',230,NULL),(3893,'South Glamorgan',230,'N'),(3894,'South Wales',230,'N'),(3895,'South Yorkshire',230,'N'),(3896,'Southwell',230,'N'),(3897,'Staffordshire',230,NULL),(3898,'Strabane',230,NULL),(3899,'Suffolk',230,NULL),(3900,'Surrey',230,NULL),(3901,'Sussex',230,NULL),(3902,'Twickenham',230,NULL),(3903,'Tyne and Wear',230,'N'),(3904,'Tyrone',230,NULL),(3905,'Utah',230,NULL),(3906,'Wales',230,NULL),(3907,'Warwickshire',230,NULL),(3908,'West Lothian',230,'N'),(3909,'West Midlands',230,'N'),(3910,'West Sussex',230,'N'),(3911,'West Yorkshire',230,'N'),(3912,'Whissendine',230,NULL),(3913,'Wiltshire',230,NULL),(3914,'Wokingham',230,NULL),(3915,'Worcestershire',230,NULL),(3916,'Wrexham',230,NULL),(3917,'Wurttemberg',230,NULL),(3918,'Yorkshire',230,NULL),(3919,'Alabama',231,NULL),(3920,'Alaska',231,NULL),(3921,'Arizona',231,NULL),(3922,'Arkansas',231,NULL),(3923,'Byram',231,'N'),(3924,'California',231,NULL),(3925,'Cokato',231,'N'),(3926,'Colorado',231,NULL),(3927,'Connecticut',231,NULL),(3928,'Delaware',231,NULL),(3929,'District of Columbia',231,'N'),(3930,'Florida',231,NULL),(3931,'Georgia',231,NULL),(3932,'Hawaii',231,NULL),(3933,'Idaho',231,NULL),(3934,'Illinois',231,NULL),(3935,'Indiana',231,NULL),(3936,'Iowa',231,NULL),(3937,'Kansas',231,NULL),(3938,'Kentucky',231,NULL),(3939,'Louisiana',231,NULL),(3940,'Lowa',231,NULL),(3941,'Maine',231,NULL),(3942,'Maryland',231,NULL),(3943,'Massachusetts',231,NULL),(3944,'Medfield',231,'N'),(3945,'Michigan',231,NULL),(3946,'Minnesota',231,NULL),(3947,'Mississippi',231,NULL),(3948,'Missouri',231,NULL),(3949,'Montana',231,NULL),(3950,'Nebraska',231,NULL),(3951,'Nevada',231,NULL),(3952,'New Hampshire',231,NULL),(3953,'New Jersey',231,NULL),(3954,'New Jersy',231,'N'),(3955,'New Mexico',231,NULL),(3956,'New York',231,NULL),(3957,'North Carolina',231,NULL),(3958,'North Dakota',231,NULL),(3959,'Ohio',231,NULL),(3960,'Oklahoma',231,NULL),(3961,'Ontario',231,NULL),(3962,'Oregon',231,NULL),(3963,'Pennsylvania',231,NULL),(3964,'Ramey',231,NULL),(3965,'Rhode Island',231,NULL),(3966,'South Carolina',231,NULL),(3967,'South Dakota',231,NULL),(3968,'Sublimity',231,'N'),(3969,'Tennessee',231,NULL),(3970,'Texas',231,NULL),(3971,'Trimble',231,NULL),(3972,'Utah',231,NULL),(3973,'Vermont',231,NULL),(3974,'Virginia',231,NULL),(3975,'Washington',231,NULL),(3976,'West Virginia',231,NULL),(3977,'Wisconsin',231,NULL),(3978,'Wyoming',231,NULL),(3979,'United States Minor Outlying I',232,'N'),(3980,'Artigas',233,NULL),(3981,'Canelones',233,NULL),(3982,'Cerro Largo',233,'N'),(3983,'Colonia',233,NULL),(3984,'Durazno',233,NULL),(3985,'FLorida',233,NULL),(3986,'Flores',233,NULL),(3987,'Lavalleja',233,NULL),(3988,'Maldonado',233,NULL),(3989,'Montevideo',233,NULL),(3990,'Paysandu',233,NULL),(3991,'Rio Negro',233,'N'),(3992,'Rivera',233,NULL),(3993,'Rocha',233,NULL),(3994,'Salto',233,NULL),(3995,'San Jose',233,'N'),(3996,'Soriano',233,NULL),(3997,'Tacuarembo',233,NULL),(3998,'Treinta y Tres',233,'N'),(3999,'Andijon',234,NULL),(4000,'Buhoro',234,NULL),(4001,'Buxoro Viloyati',234,'N'),(4002,'Cizah',234,NULL),(4003,'Fargona',234,NULL),(4004,'Horazm',234,NULL),(4005,'Kaskadar',234,NULL),(4006,'Korakalpogiston',234,NULL),(4007,'Namangan',234,NULL),(4008,'Navoi',234,NULL),(4009,'Samarkand',234,NULL),(4010,'Sirdare',234,NULL),(4011,'Surhondar',234,NULL),(4012,'Toskent',234,NULL),(4013,'Malampa',235,NULL),(4014,'Penama',235,NULL),(4015,'Sanma',235,NULL),(4016,'Shefa',235,NULL),(4017,'Tafea',235,NULL),(4018,'Torba',235,NULL),(4019,'Vatican City State (Holy See)',236,'N'),(4020,'Amazonas',237,NULL),(4021,'Anzoategui',237,NULL),(4022,'Apure',237,NULL),(4023,'Aragua',237,NULL),(4024,'Barinas',237,NULL),(4025,'Bolivar',237,NULL),(4026,'Carabobo',237,NULL),(4027,'Cojedes',237,NULL),(4028,'Delta Amacuro',237,'N'),(4029,'Distrito Federal',237,'N'),(4030,'Falcon',237,NULL),(4031,'Guarico',237,NULL),(4032,'Lara',237,NULL),(4033,'Merida',237,NULL),(4034,'Miranda',237,NULL),(4035,'Monagas',237,NULL),(4036,'Nueva Esparta',237,'N'),(4037,'Portuguesa',237,NULL),(4038,'Sucre',237,NULL),(4039,'Tachira',237,NULL),(4040,'Trujillo',237,NULL),(4041,'Vargas',237,NULL),(4042,'Yaracuy',237,NULL),(4043,'Zulia',237,NULL),(4044,'Bac Giang',238,'N'),(4045,'Binh Dinh',238,'N'),(4046,'Binh Duong',238,'N'),(4047,'Da Nang',238,'N'),(4048,'Dong Bang Song Cuu Long',238,'N'),(4049,'Dong Bang Song Hong',238,'N'),(4050,'Dong Nai',238,'N'),(4051,'Dong Nam Bo',238,'N'),(4052,'Duyen Hai Mien Trung',238,'N'),(4053,'Hanoi',238,NULL),(4054,'Hung Yen',238,'N'),(4055,'Khu Bon Cu',238,'N'),(4056,'Long An',238,'N'),(4057,'Mien Nui Va Trung Du',238,'N'),(4058,'Thai Nguyen',238,'N'),(4059,'Thanh Pho Ho Chi Minh',238,'N'),(4060,'Thu Do Ha Noi',238,'N'),(4061,'Tinh Can Tho',238,'N'),(4062,'Tinh Da Nang',238,'N'),(4063,'Tinh Gia Lai',238,'N'),(4064,'Anegada',239,NULL),(4065,'Jost van Dyke',239,'N'),(4066,'Tortola',239,NULL),(4067,'Saint Croix',240,'N'),(4068,'Saint John',240,'N'),(4069,'Saint Thomas',240,'N'),(4070,'Alo',241,NULL),(4071,'Singave',241,NULL),(4072,'Wallis',241,NULL),(4073,'Bu Jaydur',242,'N'),(4074,'Wad-adh-Dhahab',242,NULL),(4075,'al-\'Ayun',242,NULL),(4076,'as-Samarah',242,NULL),(4077,'\'Adan',243,NULL),(4078,'Abyan',243,NULL),(4079,'Dhamar',243,NULL),(4080,'Hadramaut',243,NULL),(4081,'Hajjah',243,NULL),(4082,'Hudaydah',243,NULL),(4083,'Ibb',243,NULL),(4084,'Lahij',243,NULL),(4085,'Ma\'rib',243,NULL),(4086,'Madinat San\'a',243,'N'),(4087,'Sa\'dah',243,NULL),(4088,'Sana',243,NULL),(4089,'Shabwah',243,NULL),(4090,'Ta\'izz',243,NULL),(4091,'al-Bayda',243,NULL),(4092,'al-Hudaydah',243,NULL),(4093,'al-Jawf',243,NULL),(4094,'al-Mahrah',243,NULL),(4095,'al-Mahwit',243,NULL),(4096,'Central Serbia',244,'N'),(4097,'Kosovo and Metohija',244,'N'),(4098,'Montenegro',244,NULL),(4099,'Republic of Serbia',244,'N'),(4100,'Serbia',244,NULL),(4101,'Vojvodina',244,NULL),(4102,'Central',245,NULL),(4103,'Copperbelt',245,NULL),(4104,'Eastern',245,NULL),(4105,'Luapala',245,NULL),(4106,'Lusaka',245,NULL),(4107,'North-Western',245,NULL),(4108,'Northern',245,NULL),(4109,'Southern',245,NULL),(4110,'Western',245,NULL),(4111,'Bulawayo',246,NULL),(4112,'Harare',246,NULL),(4113,'Manicaland',246,NULL),(4114,'Mashonaland Central',246,'N'),(4115,'Mashonaland East',246,'N'),(4116,'Mashonaland West',246,'N'),(4117,'Masvingo',246,NULL),(4118,'Matabeleland North',246,'N'),(4119,'Matabeleland South',246,'N'),(4120,'Midlands',246,NULL),(4121,'Lienchiang County',214,'N');
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry`
--

DROP TABLE IF EXISTS `stock_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_type_id` int(11) DEFAULT NULL,
  `entry_type_details_id` int(11) DEFAULT NULL,
  `entry_description` varchar(500) DEFAULT NULL,
  `entry_attachment` varchar(45) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `stock_entry_for` varchar(20) DEFAULT NULL,
  `vendor_code` varchar(20) DEFAULT NULL,
  `vendor_batch_number` varchar(30) DEFAULT NULL,
  `raw_material_batch_number` varchar(30) DEFAULT NULL,
  `r_d_batch_number` varchar(30) DEFAULT NULL,
  `object_type` varchar(10) DEFAULT NULL,
  `object_id` varchar(40) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry`
--

LOCK TABLES `stock_entry` WRITE;
/*!40000 ALTER TABLE `stock_entry` DISABLE KEYS */;
INSERT INTO `stock_entry` VALUES (1,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','ABA',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(2,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(3,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(4,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','SA',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(5,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','NP',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(6,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','NP',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(7,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','SLL',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(8,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','NP',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(9,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(10,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','VLP',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(11,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','NP',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(12,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','IN',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(13,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','ALPL',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(14,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','ALPL',NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(15,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AEJ',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(16,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','HMAP',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(17,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(18,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','JN',NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(19,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','SAHP',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(20,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','BME',NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(21,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(22,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','AH',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(23,1,2,'Inital Stock Update',NULL,1,'2019-11-22',1,'2019-11-22','COMMERICAL','SAHP',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(24,2,6,'test stock entry',NULL,1,'2019-12-17',1,'2020-02-05','COMMERICAL','Trest',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(25,2,8,'test entry here',NULL,2,'2019-12-17',1,'2019-01-01','COMMERICAL','QWE',NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(26,1,5,'this is test entry',NULL,1,'2019-12-26',1,'2019-01-01','COMMERICAL','QWE',NULL,NULL,NULL,'GRN','NBT-GRN-2019122401',3,NULL,NULL),(27,1,1,'mrn to stock entry',NULL,2,'2019-12-26',1,'2019-01-01','COMMERICAL','QWE',NULL,NULL,NULL,'MRN','NBT-SAMPLE-CUSTOMER-',2,NULL,NULL),(28,1,1,'mrn to stock entry',NULL,2,'2019-12-26',1,'2019-01-01','COMMERICAL','QWE',NULL,NULL,NULL,'MRN','NBT-SAMPLE-CUSTOMER-',7,'2020-02-03',1),(29,1,1,'mrn to stock entry',NULL,1,'2020-02-03',1,'2019-01-01','COMMERICAL','ABC',NULL,NULL,NULL,'MRN','NBT-SAMPLE-CUSTOMER-2019121201',7,NULL,NULL);
/*!40000 ALTER TABLE `stock_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry_behalf_of`
--

DROP TABLE IF EXISTS `stock_entry_behalf_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_entry_behalf_of` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry_behalf_of`
--

LOCK TABLES `stock_entry_behalf_of` WRITE;
/*!40000 ALTER TABLE `stock_entry_behalf_of` DISABLE KEYS */;
INSERT INTO `stock_entry_behalf_of` VALUES ('MRN','Material Requization Note',NULL,NULL),('GRN','Goods Receipt Note',NULL,NULL);
/*!40000 ALTER TABLE `stock_entry_behalf_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry_for`
--

DROP TABLE IF EXISTS `stock_entry_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_entry_for` (
  `id` varchar(10) NOT NULL,
  `stock_entry_for` varchar(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry_for`
--

LOCK TABLES `stock_entry_for` WRITE;
/*!40000 ALTER TABLE `stock_entry_for` DISABLE KEYS */;
INSERT INTO `stock_entry_for` VALUES ('COMMERICAL','Commerical',NULL,NULL),('RD','Reserach and Development (R&D)',NULL,NULL);
/*!40000 ALTER TABLE `stock_entry_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry_type_details`
--

DROP TABLE IF EXISTS `stock_entry_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_entry_type_details` (
  `id` int(11) NOT NULL,
  `stock_entry_type_master_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry_type_details`
--

LOCK TABLES `stock_entry_type_details` WRITE;
/*!40000 ALTER TABLE `stock_entry_type_details` DISABLE KEYS */;
INSERT INTO `stock_entry_type_details` VALUES (1,1,'Receive from supplier',NULL,'Y',NULL,NULL),(2,1,'Stock transfer form warehouse',NULL,'Y',NULL,NULL),(3,1,'Control Sample from QC',NULL,'Y',NULL,NULL),(4,1,'Control Sample for future reference',NULL,'Y',NULL,NULL),(5,1,'Stock return',NULL,'Y',NULL,NULL),(6,2,'Send to Customer',NULL,'Y',NULL,NULL),(7,2,'Stock transfer to another warehouse',NULL,'Y',NULL,NULL),(8,2,'Control Sample to QC team',NULL,'Y',NULL,NULL),(9,2,'Control Sample for future reference',NULL,'Y',NULL,NULL),(10,2,'Resend',NULL,'Y',NULL,NULL);
/*!40000 ALTER TABLE `stock_entry_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_entry_type_master`
--

DROP TABLE IF EXISTS `stock_entry_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_entry_type_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_entry_type_master`
--

LOCK TABLES `stock_entry_type_master` WRITE;
/*!40000 ALTER TABLE `stock_entry_type_master` DISABLE KEYS */;
INSERT INTO `stock_entry_type_master` VALUES (1,'Carriage Inwards Stock',NULL,'Y','2019-12-07',NULL),(2,'Carriage Outwards Stock',NULL,'Y','2019-12-07',NULL);
/*!40000 ALTER TABLE `stock_entry_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_items_details`
--

DROP TABLE IF EXISTS `stock_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_items_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_entry_id` int(11) NOT NULL,
  `item_code` varchar(20) DEFAULT NULL,
  `item_name` varchar(45) NOT NULL,
  `botanical_scientific_name` varchar(45) DEFAULT NULL,
  `item_qty` float DEFAULT NULL,
  `item_uom` int(11) DEFAULT NULL,
  `control_qty` float DEFAULT NULL,
  `control_uom` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `is_control_sample` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_items_details`
--

LOCK TABLES `stock_items_details` WRITE;
/*!40000 ALTER TABLE `stock_items_details` DISABLE KEYS */;
INSERT INTO `stock_items_details` VALUES (1,1,'NBTSE-05','NBTSE-05',NULL,475,8,NULL,NULL,2,NULL),(2,2,'NBTDE-1712','NBTDE-1712',NULL,25,8,NULL,NULL,2,NULL),(3,3,'NBTDE-1661','NBTDE-1661',NULL,2,8,NULL,NULL,0,NULL),(4,4,'NBTSE-132','NBTSE-132',NULL,18,8,NULL,NULL,0,NULL),(5,5,'NBTDE-247','NBTDE-247',NULL,8,8,NULL,NULL,3,NULL),(6,6,'NBTDE-530','NBTDE-530',NULL,5,8,NULL,NULL,0,NULL),(7,7,'NBTDE-12','NBTDE-12',NULL,84,8,NULL,NULL,3,NULL),(8,8,'NBTDE-551','NBTDE-551',NULL,14,8,NULL,NULL,3,NULL),(9,9,'NBTDE-1893','NBTDE-1893',NULL,14,8,NULL,NULL,4,NULL),(10,10,'NBTSE-118','NBTSE-118',NULL,25,8,NULL,NULL,3,NULL),(11,11,'NBTSE-117','NBTSE-117',NULL,39,8,NULL,NULL,3,NULL),(12,12,'NBTDE-577','NBTDE-577',NULL,13,8,NULL,NULL,4,NULL),(13,13,'NBTDE-236','NBTDE-236',NULL,20,8,NULL,NULL,4,NULL),(14,14,'NBTDE-212','NBTDE-212',NULL,14,8,NULL,NULL,3,NULL),(15,15,'NBTSE-25','NBTSE-25',NULL,50,8,NULL,NULL,4,NULL),(16,16,'NBTSE-100','NBTSE-100',NULL,10,8,NULL,NULL,4,NULL),(17,17,'NBTDE-290','NBTDE-290',NULL,30,8,NULL,NULL,2,NULL),(18,18,'NBTNP-10','NBTNP-10',NULL,40,8,NULL,NULL,0,NULL),(19,19,'NBTDE-29','NBTDE-29',NULL,25,8,NULL,NULL,3,NULL),(20,20,'NBTSE-100','NBTSE-100',NULL,180,8,NULL,NULL,0,NULL),(21,21,'NBTDE-747','NBTDE-747',NULL,10,8,NULL,NULL,4,NULL),(22,22,'NBTSE-113','NBTSE-113',NULL,10,8,NULL,NULL,2,NULL),(23,23,'NBTPC-38','NBTPC-38',NULL,30,8,NULL,NULL,3,NULL),(24,24,'NBTSE-25','NBTSE-25',NULL,500,8,0,6,6,'Y'),(25,25,'NBTSE-132','NBTSE-132',NULL,10,8,0,6,1,'Y'),(26,26,'NBTSE-06','NBTSE-06',NULL,500,8,0,6,7,'Y'),(27,28,'NBTSE-01','NBTSE-01',NULL,12,6,12,6,0,'Y'),(28,29,'NBTSE-01','NBTSE-01',NULL,12,6,12,6,8,'Y');
/*!40000 ALTER TABLE `stock_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transaction_log`
--

DROP TABLE IF EXISTS `stock_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transaction_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_entry_id` int(11) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transaction_log`
--

LOCK TABLES `stock_transaction_log` WRITE;
/*!40000 ALTER TABLE `stock_transaction_log` DISABLE KEYS */;
INSERT INTO `stock_transaction_log` VALUES (1,24,'Transaction being initiated for stock id 24 by 1.Dated on entry_date for purpose 2  6.Stock entry for COMMERICAL vendor code is Trest','2019-12-17'),(2,25,'Transaction being initiated for stock id 25 by 1.Dated on entry_date for purpose 2  8.Stock entry for COMMERICAL vendor code is QWE','2019-12-17'),(3,26,'Transaction being initiated for stock id 26 by 1.Dated on entry_date for purpose 1  5.Stock entry for COMMERICAL vendor code is QWE','2019-12-26'),(4,28,'Transaction being initiated for stock id 28 by 1.Dated on entry_date for purpose 1  1.Stock entry for COMMERICAL vendor code is QWE','2019-12-26'),(5,29,'Transaction being initiated for stock id 29 by 1.Dated on entry_date for purpose 1  1.Stock entry for COMMERICAL vendor code is ABC location is 7','2020-02-03');
/*!40000 ALTER TABLE `stock_transaction_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_quotation_details`
--

DROP TABLE IF EXISTS `supplier_quotation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_quotation_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplie_vendor_id` int(11) DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL,
  `item_id` varchar(45) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `UOM` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_valid_till` int(11) DEFAULT NULL,
  `approx_delivery_day` int(11) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `supplier_vendor_type` varchar(10) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_quotation_details`
--

LOCK TABLES `supplier_quotation_details` WRITE;
/*!40000 ALTER TABLE `supplier_quotation_details` DISABLE KEYS */;
INSERT INTO `supplier_quotation_details` VALUES (1,187,3,'NBTSE-121',56,10,85,895,5,'Y','2020-02-14',1,'VENDOR',7,2),(2,1,3,'NBTDE-413',7,8,56,89,85,'Y','2020-02-14',1,'SUPPLIER',7,3),(3,1,3,'NBTDE-413',23,8,500,45,89,'Y','2020-02-14',1,'SUPPLIER',7,7),(4,187,3,'NBTSE-60',50,8,452,56,23,'Y','2020-02-14',1,'VENDOR',7,2),(5,1,3,'NBTSE-07',1000,8,789,56,56,'Y','2020-02-14',1,'SUPPLIER',7,6);
/*!40000 ALTER TABLE `supplier_quotation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tera_teri_master`
--

DROP TABLE IF EXISTS `tera_teri_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tera_teri_master` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tera_teri_master`
--

LOCK TABLES `tera_teri_master` WRITE;
/*!40000 ALTER TABLE `tera_teri_master` DISABLE KEYS */;
INSERT INTO `tera_teri_master` VALUES (1,'BANGALORE','Y'),(2,'JAIPUR','Y'),(3,'New Delhi','Y'),(4,'Chennai','Y');
/*!40000 ALTER TABLE `tera_teri_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_status`
--

DROP TABLE IF EXISTS `transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT 'now()',
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_status`
--

LOCK TABLES `transaction_status` WRITE;
/*!40000 ALTER TABLE `transaction_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `auth_type` int(11) DEFAULT NULL,
  `auth_value` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_auth_user_auth_master1_idx` (`auth_type`),
  CONSTRAINT `fk_user_auth_user_auth_master1` FOREIGN KEY (`auth_type`) REFERENCES `user_auth_master` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,1,1,'pragya','2019-06-19 14:12:11',NULL,'pragyad@appodeepo.com'),(2,2,1,'S2825183526C','2019-06-19 14:12:20',NULL,'shekhar@naturabt.com'),(3,3,1,'P3128182742V','2019-06-19 14:12:31',NULL,'pankaj@naturabt.com'),(4,4,1,'R2722362525S','2019-06-19 14:12:53',NULL,'rajesh@appodeepo.com'),(5,5,1,'zcdsdfdQWE','2019-06-19 14:13:38',NULL,'suresh@naturabt.com'),(6,6,1,'Guruprasad','2019-06-19 14:13:38','2020-03-24 00:00:00','guruprasad@naturabt.com'),(7,7,1,'Harsh','2019-06-19 14:13:38','2020-03-23 00:00:00','sales2@naturabt.com'),(8,8,1,'Praneet','2019-06-19 14:13:38','2020-03-23 00:00:00','sales1@naturabt.com'),(9,9,1,'Rajesh','2019-06-19 14:13:38','2020-03-23 00:00:00','rt@naturabt.com'),(10,10,1,'Prajna','2019-06-19 14:13:38','2020-03-23 00:00:00','sales3@naturabt.com'),(11,11,1,'Naveeneeswarudu','2019-06-19 14:13:38','2020-03-23 00:00:00','naveen@naturabt.com'),(12,12,1,'Customer','2019-06-19 14:22:51',NULL,'venkat@marvenbiochem.in'),(13,13,1,'Customer','2019-06-19 14:22:51',NULL,'urmil@parthphytoextracts.com'),(14,14,1,'Customer','2019-06-19 14:22:51',NULL,'bhat@karlegroup.com'),(15,15,1,'Customer','2019-06-19 14:22:51',NULL,'sreelatha@greenleafextractions.com'),(16,16,1,'Customer','2019-06-19 14:22:51',NULL,'contactus@newtrimed.com'),(17,17,1,'Customer','2019-06-19 14:22:51',NULL,'info@jkagri.com'),(18,18,1,'Customer','2019-06-19 14:22:51',NULL,'harish@jkmail.com'),(19,19,1,'Customer','2019-06-19 14:22:51',NULL,'info@naturalholistics.co.in'),(20,20,1,'Customer','2019-06-19 14:22:51',NULL,'ssk@sskphytotech.com'),(21,21,1,'Customer','2019-06-19 14:22:51',NULL,'indianherbals@rediffmail.com'),(22,22,1,'Customer','2019-06-19 14:22:51',NULL,'mdbiovitamins@rediffmail.com'),(23,23,1,'Customer','2019-06-19 14:22:51',NULL,'info@plantlipids.com'),(24,24,1,'Customer','2019-06-19 14:22:51',NULL,'marketing.nutreenest@gmail.com'),(25,25,1,'Customer','2019-06-19 14:22:51',NULL,'info@rclab.org'),(26,26,1,'Customer','2019-06-19 14:22:51',NULL,'bpm@varshagroup.com'),(27,27,1,'Customer','2019-06-19 14:22:51',NULL,'companysecretary@keralaayurveda.biz'),(28,28,1,'Customer','2019-06-19 14:22:51',NULL,'companysecretary@keralaayurveda.biz'),(29,29,1,'Customer','2019-06-19 14:22:51',NULL,'sebastian@biomedingredients.com'),(30,30,1,'Customer','2019-06-19 14:22:51',NULL,'raja@sunglowpharma.com'),(31,31,1,'Customer','2019-06-19 14:22:51',NULL,'asojmumbai@rediffmail.com'),(32,32,1,'Customer','2019-06-19 14:22:51',NULL,'srbiofuturelabs.com'),(33,33,1,'Customer','2019-06-19 14:22:51',NULL,'easternherbals@gmail.com'),(34,34,1,'Customer','2019-06-19 14:22:51',NULL,'maruthibalki58@gmail.com'),(35,35,1,'Customer','2019-06-19 14:22:51',NULL,'minakshi@vyomchem.com'),(36,36,1,'Customer','2019-06-19 14:22:51',NULL,'arvind.seshu@gmail.com'),(37,37,1,'Customer','2019-06-19 14:22:51',NULL,'karthik@hillgreen.com'),(38,38,1,'Customer','2019-06-19 14:22:51',NULL,'shafi@massherbals.com'),(39,39,1,'Customer','2019-06-19 14:22:51',NULL,'pradeep.kumar@coperniciumpharma.com'),(40,40,1,'Customer','2019-06-19 14:22:51',NULL,'deepak@dnaayurveda.in'),(41,41,1,'Customer','2019-06-19 14:22:51',NULL,'deeptalabs@gmail.com'),(42,42,1,'Customer','2019-06-19 14:22:51',NULL,'nskherbs@gmail.com'),(43,43,1,'Customer','2019-06-19 14:22:51',NULL,'rm9888@gmail.com'),(44,44,1,'Customer','2019-06-19 14:22:51',NULL,'kodurikiran@gmail.com'),(45,45,1,'Customer','2019-06-19 14:22:51',NULL,'anair@jairadhesales.com'),(46,46,1,'Customer','2019-06-19 14:22:51',NULL,'purchase@grenera.com'),(47,47,1,'Customer','2019-06-19 14:22:51',NULL,'contactus@newtrimed.com'),(48,48,1,'Customer','2019-06-19 14:22:51',NULL,'lakshman@milablifesciences.com'),(49,49,1,'Customer','2019-06-19 14:22:51',NULL,'supherblifesciences@gmail.com'),(50,50,1,'Customer','2019-06-19 14:22:51',NULL,'remezyshopping@gmail.com'),(51,51,1,'Customer','2019-06-19 14:22:51',NULL,'skc1234ca@gmail.com'),(52,52,1,'Customer','2019-06-19 14:22:51',NULL,'info@acumenindus.com'),(53,53,1,'Customer','2019-06-19 14:22:51',NULL,'finance@aeonf.com'),(54,54,1,'Customer','2019-06-19 14:22:51',NULL,'director@agronremedies.com'),(55,55,1,'Customer','2019-06-19 14:22:51',NULL,'alienterprises52@yahoo.in'),(56,56,1,'Customer','2019-06-19 14:22:51',NULL,'info@allseasonsherbs.com'),(57,57,1,'Customer','2019-06-19 14:22:51',NULL,'amarpharma107@gmail.com'),(58,58,1,'Customer','2019-06-19 14:22:51',NULL,'vikas1185@gmail.com'),(59,59,1,'Customer','2019-06-19 14:22:51',NULL,'accounts@apolloingredients.com'),(60,60,1,'Customer','2019-06-19 14:22:51',NULL,'mail@arjunanatural.com'),(61,61,1,'Customer','2019-06-19 14:22:51',NULL,'accounts@ayurvitaindia.com'),(62,62,1,'Customer','2019-06-19 14:22:51',NULL,'bhavichem@gmail.com'),(63,63,1,'Customer','2019-06-19 14:22:51',NULL,'accountsptjco@yahoo.com'),(64,64,1,'Customer','2019-06-19 14:22:51',NULL,'sales@bioextract.co.in'),(65,65,1,'Customer','2019-06-19 14:22:51',NULL,'dr.ravi@blissayurveda.com'),(66,66,1,'Customer','2019-06-19 14:22:51',NULL,'info@calixherbal.com'),(67,67,1,'Customer','2019-06-19 14:22:51',NULL,'manojkmadhav@biovedanaturals.com'),(68,68,1,'Customer','2019-06-19 14:22:51',NULL,'capl1@rediffmail.com'),(69,69,1,'Customer','2019-06-19 14:22:51',NULL,'crt1968@yahoo.co.in'),(70,70,1,'Customer','2019-06-19 14:22:51',NULL,'purchase.hwr@deltaspharma.com'),(71,71,1,'Customer','2019-06-19 14:22:51',NULL,'vsp@nutraforlife.com'),(72,72,1,'Customer','2019-06-19 14:22:51',NULL,'INFO@botanosys.com'),(73,73,1,'Customer','2019-06-19 14:22:51',NULL,'elizence@yahoo.com'),(74,74,1,'Customer','2019-06-19 14:22:51',NULL,'energeiapurchase@gmail.com'),(75,75,1,'Customer','2019-06-19 14:22:51',NULL,'vk.tripathi@yahoo.com'),(76,76,1,'Customer','2019-06-19 14:22:51',NULL,'info@flavourtrove.com'),(77,77,1,'Customer','2019-06-19 14:22:51',NULL,'snehal@fullife.co.in'),(78,78,1,'Customer','2019-06-19 14:22:51',NULL,'rahulmarwal@grherbals.com'),(79,79,1,'Customer','2019-06-19 14:22:51',NULL,'srishanthas@gmail.com'),(80,80,1,'Customer','2019-06-19 14:22:51',NULL,'sharkeyecreations@gmail.com'),(81,81,1,'Customer','2019-06-19 14:22:51',NULL,'mismaeelkhan@gmail.com'),(82,82,1,'Customer','2019-06-19 14:22:51',NULL,'hbl_finance@yahoo.com'),(83,83,1,'Customer','2019-06-19 14:22:51',NULL,'kumarrajinder@yahoo.com'),(84,84,1,'Customer','2019-06-19 14:22:51',NULL,'herbochemad@rediffmail.com'),(85,85,1,'Customer','2019-06-19 14:22:51',NULL,'hindnatural@gmail.com'),(86,86,1,'Customer','2019-06-19 14:22:51',NULL,'vinu@himalyanherbaria.com'),(87,87,1,'Customer','2019-06-19 14:22:51',NULL,'bharath@indoglobal.co.in'),(88,88,1,'Customer','2019-06-19 14:22:51',NULL,'irfan@indovedic.com'),(89,89,1,'Customer','2019-06-19 14:22:51',NULL,'moni @jairadhesales.com'),(90,90,1,'Customer','2019-06-19 14:22:51',NULL,'info.kaiwalbiotech@gmail.com'),(91,91,1,'Customer','2019-06-19 14:22:51',NULL,'krj@krishgen.com'),(92,92,1,'Customer','2019-06-19 14:22:51',NULL,'pawandubey456@gmail.com'),(93,93,1,'Customer','2019-06-19 14:22:51',NULL,'kapil.garg@kuberimpex.com'),(94,94,1,'Customer','2019-06-19 14:22:51',NULL,'krupallp387@gmail.com'),(95,95,1,'Customer','2019-06-19 14:22:51',NULL,'kanchan@kudos.in'),(96,96,1,'Customer','2019-06-19 14:22:51',NULL,'info.luckyimpex@gmail.com'),(97,97,1,'Customer','2019-06-19 14:22:51',NULL,'tharmarketing@rediffmail.com'),(98,98,1,'Customer','2019-06-19 14:22:51',NULL,'manishasherbal@gmail.com'),(99,99,1,'Customer','2019-06-19 14:22:51',NULL,'mehalherbs@gmail.com'),(100,100,1,'Customer','2019-06-19 14:22:51',NULL,'yamuna@natsollabs.com'),(101,101,1,'Customer','2019-06-19 14:22:51',NULL,'finance@naturalremedy.com'),(102,102,1,'Customer','2019-06-19 14:22:51',NULL,'maqbool786@gmail.com'),(103,103,1,'Customer','2019-06-19 14:22:51',NULL,'nhlabs@gmail.com'),(104,104,1,'Customer','2019-06-19 14:22:51',NULL,'sales@nectarphyto.com'),(105,105,1,'Customer','2019-06-19 14:22:51',NULL,'md@nectarphyto.com'),(106,106,1,'Customer','2019-06-19 14:22:51',NULL,'kopparaharrys@gmail.com'),(107,107,1,'Customer','2019-06-19 14:22:51',NULL,'info@oceanicpharmachem.com'),(108,108,1,'Customer','2019-06-19 14:22:51',NULL,'sales@optimumherbalextracts.com'),(109,109,1,'Customer','2019-06-19 14:22:51',NULL,'rmtiwarifcs@gmail.com'),(110,110,1,'Customer','2019-06-19 14:22:51',NULL,'hariharan@phytotech.in'),(111,111,1,'Customer','2019-06-19 14:22:51',NULL,'vikasca35@yahoo.co.in'),(112,112,1,'Customer','2019-06-19 14:22:51',NULL,'rajeshkulkarni17@gmail.com'),(113,113,1,'Customer','2019-06-19 14:22:51',NULL,'pratisales@prakruti.com'),(114,114,1,'Customer','2019-06-19 14:22:51',NULL,'rajeshsingh.awgp@gmail.com'),(115,115,1,'Customer','2019-06-19 14:22:51',NULL,'farhanachippa@yahoo.com'),(116,116,1,'Customer','2019-06-19 14:22:51',NULL,'quivercare@gmail.com'),(117,117,1,'Customer','2019-06-19 14:22:51',NULL,'shrawan@krishnaaloevera'),(118,118,1,'Customer','2019-06-19 14:22:51',NULL,'maqbool786@gmail.com'),(119,119,1,'Customer','2019-06-19 14:22:51',NULL,'dlalkotadia@sahmed.com'),(120,120,1,'Customer','2019-06-19 14:22:51',NULL,'renu.a@savaglobal.com'),(121,121,1,'Customer','2019-06-19 14:22:51',NULL,'shikha.shreedha@hotmail.com'),(122,122,1,'Customer','2019-06-19 14:22:51',NULL,'avprabhuji@gmail.com'),(123,123,1,'Customer','2019-06-19 14:22:51',NULL,'ganeshherbals@yahoo.com'),(124,124,1,'Customer','2019-06-19 14:22:51',NULL,'arvind@stiritiventures.com'),(125,125,1,'Customer','2019-06-19 14:22:51',NULL,'corporate@sugunafoods.co.in'),(126,126,1,'Customer','2019-06-19 14:22:51',NULL,'jayashree.ullal@himalayawellness.com'),(127,127,1,'Customer','2019-06-19 14:22:51',NULL,'ashokrao@samilabs.com'),(128,128,1,'Customer','2019-06-19 14:22:51',NULL,'tulsiamrit@tulsiamrit.com'),(129,129,1,'Customer','2019-06-19 14:22:51',NULL,'accounts@unicornnature.com'),(130,130,1,'Customer','2019-06-19 14:22:51',NULL,'admin@vipuldyes.com'),(131,131,1,'Customer','2019-06-19 14:22:51',NULL,'office_deepakcgandhi@rediffmail.com'),(132,132,1,'Customer','2019-06-19 14:22:51',NULL,'vitalpurchase305@gmail.com'),(133,133,1,'Customer','2019-06-19 14:22:51',NULL,'manishajmera10@hotmail.com'),(134,134,1,'Customer','2019-06-19 14:22:51',NULL,'sandhya@vruddhiinc.com'),(135,135,1,'Customer','2019-06-19 14:22:51',NULL,'welex@welexcare.com'),(136,136,1,'Customer','2019-06-19 14:22:51',NULL,'cs@windlasbiotech.com'),(137,137,1,'Customer','2019-06-19 14:22:51',NULL,'info@ziranindia.com'),(138,138,1,'Customer','2019-06-19 14:22:51',NULL,'macbiosciences@gmail.com'),(139,139,1,'Customer','2019-06-19 14:22:51',NULL,'suryaherbal171@gmail.com'),(140,140,1,'Customer','2019-06-19 14:22:51',NULL,'prosolpharma@gmail.com'),(141,141,1,'Customer','2019-06-19 14:22:51',NULL,'md.nbhealthcare@gmail.com'),(142,142,1,'Customer','2019-06-19 14:22:51',NULL,'kkharbal@gmail.com'),(143,143,1,'Customer','2019-06-19 14:22:51',NULL,'bioliferemedies22@gmail.com'),(144,144,1,'Customer','2019-06-19 14:22:51',NULL,'vsingla@zoicpharma.com'),(145,145,1,'Customer','2019-06-19 14:22:51',NULL,'deepak.tewari@brightlifecare.com'),(146,146,1,'Customer','2019-06-19 14:22:51',NULL,'logichembiotech@gmail.com'),(147,147,1,'Customer','2019-06-19 14:22:51',NULL,'info@ukgermanpharmaceutical.com'),(148,148,1,'Customer','2019-06-19 14:22:51',NULL,'maulikremedies1@gmail.com'),(149,149,1,'Customer','2019-06-19 14:22:51',NULL,'Na_149@test.com'),(150,150,1,'Customer','2019-06-19 14:22:51',NULL,'nadvedics@gmail.com'),(151,151,1,'Customer','2019-06-19 14:22:51',NULL,'sales@pharminoxmeditech.com'),(152,152,1,'Customer','2019-06-19 14:22:51',NULL,'na_152@test.com'),(153,153,1,'Customer','2019-06-19 14:22:51',NULL,'na_153@test.com'),(154,154,1,'Customer','2019-06-19 14:22:51',NULL,'setkoindia@gmail.com'),(155,155,1,'Customer','2019-06-19 14:22:51',NULL,'vineet@sblifesciences.in'),(156,156,1,'Customer','2019-06-19 14:22:51',NULL,'lewibhealthcare@gmail.com'),(157,157,1,'Customer','2019-06-19 14:22:51',NULL,'infoansalpharma@gmail.com'),(158,158,1,'Customer','2019-06-19 14:22:51',NULL,'na_158@test.com'),(159,159,1,'Customer','2019-06-19 14:22:51',NULL,'na_159@test.com'),(160,160,1,'Customer','2019-06-19 14:22:51',NULL,'taksalifesciences@rediffmail.com'),(161,161,1,'Customer','2019-06-19 14:22:51',NULL,'na_161@test.com'),(162,162,1,'Customer','2019-06-19 14:22:51',NULL,'Info.atulyamedilink@gmail.com'),(163,163,1,'Customer','2019-06-19 14:22:51',NULL,'nagpalayurveda@gmail.com'),(164,164,1,'Customer','2019-06-19 14:22:51',NULL,'aloecaresales@gmail.com'),(165,165,1,'Customer','2019-06-19 14:22:51',NULL,'easternhealthcare007@gmail.com'),(166,166,1,'Customer','2019-06-19 14:22:51',NULL,'info@prabhatayurvedicpharmacy.in'),(167,167,1,'Customer','2019-06-19 14:22:51',NULL,'gagan.ayu@gmail.com'),(168,168,1,'Customer','2019-06-19 14:22:51',NULL,'chandrayanherbal@gmail.com'),(169,169,1,'Customer','2019-06-19 14:22:51',NULL,' rajendra.prasad@copmedpharma.com'),(170,170,1,'Customer','2019-06-19 14:22:51',NULL,'harbalfarm@gmail.com'),(171,171,1,'Customer','2019-06-19 14:22:51',NULL,'zanekapurchase123@gmail.com'),(172,172,1,'Customer','2019-06-19 14:22:51',NULL,'herbalsamazon@gmail.com'),(173,173,1,'Customer','2019-06-19 14:22:51',NULL,'singh@redhillherbals.com'),(174,174,1,'Customer','2019-06-19 14:22:51',NULL,'purchase@vxldrugs.com'),(175,175,1,'Customer','2019-06-19 14:22:51',NULL,'ayurvite@gmail.com'),(176,176,1,'Customer','2019-06-19 14:22:51',NULL,'nmpamrit@giloy.in'),(177,177,1,'Shekhar','2019-06-19 14:13:38','2020-03-23 00:00:00','shekhar@pranikhealth.com'),(179,180,1,'Abhinav','2019-06-19 14:13:38',NULL,'abhinav@naturabt.com'),(180,184,1,'aw17gR','2019-06-24 12:08:20',NULL,'test@example.dom'),(181,185,1,'Esw9Im','2019-06-24 13:09:42',NULL,'test@wexample.com'),(183,182,1,'9341045805','2019-12-07 15:03:07','2020-01-23 00:00:00','bd@naturabt.com'),(184,188,1,'test','2020-01-22 15:36:58','2020-01-29 00:00:00','test@example.com'),(185,189,1,'test1','2020-01-30 14:15:38','2020-01-31 00:00:00','test1@example.com');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_master`
--

DROP TABLE IF EXISTS `user_auth_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_master` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_master`
--

LOCK TABLES `user_auth_master` WRITE;
/*!40000 ALTER TABLE `user_auth_master` DISABLE KEYS */;
INSERT INTO `user_auth_master` VALUES (1,'EMAIL'),(2,'MOBILE');
/*!40000 ALTER TABLE `user_auth_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bank_reference`
--

DROP TABLE IF EXISTS `user_bank_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bank_reference` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Account_no` varchar(45) DEFAULT NULL,
  `Ifsc` varchar(45) DEFAULT NULL,
  `bank_address` varchar(1000) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `insitution_name` varchar(100) DEFAULT NULL,
  `bank_reference_account_type` varchar(20) DEFAULT NULL,
  `home_equity_loan` varchar(45) DEFAULT NULL,
  `loan_balance` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bank_reference`
--

LOCK TABLES `user_bank_reference` WRITE;
/*!40000 ALTER TABLE `user_bank_reference` DISABLE KEYS */;
INSERT INTO `user_bank_reference` VALUES (1,13,'78945',NULL,'bangalore','9856321470','bank reference -1','CURRENT','','','2018-12-17 10:18:38'),(2,13,'78945612',NULL,'bangalore','','bank reference -29856321470','SAVING','','','2018-12-17 10:18:38'),(3,13,'',NULL,'bangalore','9856321470','bank reference 3','','78945','78956','2018-12-17 10:18:38'),(4,14,'7894561230',NULL,'bangalore','8956231470','bank reference -1','CURRENT','','','2018-12-17 10:18:38'),(5,14,'7894562',NULL,'bangalore','','bank reference -2 8956231470','SAVING','','','2018-12-17 10:18:38'),(6,14,'',NULL,'bangalore','8956231470','bank reference -3','','4562','46623','2018-12-17 10:18:38'),(1,138,'65165555021','SBIN0007604','barwala',NULL,'State bank of India','Current Account',NULL,NULL,'2019-06-19 14:23:44'),(2,139,'560101000097526/ 036205002978','CORP0003207/ ICIC0000362','SECTOR-25,PANCHKULA(HRY.)/ N.A.C. MANIMAJRA, CHANDIGARH',NULL,'CORPORATION BANK / ICICI BANK','Current Account',NULL,NULL,'2019-06-19 14:23:44'),(3,143,'918020042070111','UTIB0000041','chandigarh',NULL,'Axis Bank','Current Account',NULL,NULL,'2019-06-19 14:23:44'),(4,155,'50200015424460','HDFC0000435','Manimajra,Chandigarh',NULL,'HDFC Bank','Current Account',NULL,NULL,'2019-06-19 14:23:44'),(5,156,'2154651100000310','IBKL0002154','Manimajra,Chandigarh',NULL,'IDBI Bank','Current Account',NULL,NULL,'2019-06-19 14:23:44'),(7,185,'','','','','','CURRENT','','','2019-06-24 13:09:42'),(8,185,'','','','','','SAVING','','','2019-06-24 13:09:42'),(9,185,'','','','','','','','','2019-06-24 13:09:42'),(10,187,'','','',NULL,'',NULL,NULL,NULL,'2019-12-23 00:00:00');
/*!40000 ALTER TABLE `user_bank_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cart`
--

DROP TABLE IF EXISTS `user_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cart` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `inquiry_number` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cart`
--

LOCK TABLES `user_cart` WRITE;
/*!40000 ALTER TABLE `user_cart` DISABLE KEYS */;
INSERT INTO `user_cart` VALUES (1,21,NULL,'PENDING','2019-06-20 12:10:50',NULL,NULL),(2,21,'NBT200619001','INQUIRY-RECEIVED','2019-06-20 16:32:58','2019-06-20 17:20:14',NULL),(3,21,NULL,'PENDING','2019-06-20 17:20:14',NULL,NULL),(4,183,NULL,'PENDING','2019-06-24 11:07:24',NULL,NULL),(5,186,'NBT060819001','PURCAHSE_INDENT_CREADTED','2019-08-06 10:32:25','2019-08-06 10:33:21',NULL),(6,186,NULL,'PENDING','2019-08-06 10:33:21',NULL,NULL),(7,1,NULL,'PENDING','2019-12-07 00:00:00',NULL,NULL),(8,1,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(9,1,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(10,2,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(11,1,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(12,1,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(13,1,NULL,'PENDING','2019-12-12 00:00:00',NULL,NULL),(14,1,NULL,'PENDING','2019-12-17 00:00:00',NULL,NULL),(15,1,NULL,'PENDING','2019-12-17 00:00:00',NULL,NULL),(16,1,NULL,'PENDING','2019-12-17 00:00:00',NULL,NULL),(17,1,NULL,'PENDING','2019-12-18 00:00:00',NULL,NULL),(18,1,NULL,'PENDING','2019-12-18 00:00:00',NULL,NULL),(19,1,'NBT2019121901','INQUIRY-RECEIVED','2019-12-19 00:00:00','2019-12-19 00:00:00',NULL),(20,1,'NBT2019121902','INQUIRY_REQUEST_FOR_SAMPLE','2019-12-19 00:00:00','2019-12-20 00:00:00',NULL),(21,1,'NBT2019121903','PURCAHSE_INDENT_CREADTED','2019-12-19 00:00:00','2019-12-19 00:00:00',NULL),(22,1,NULL,'PENDING','2019-12-19 00:00:00',NULL,NULL),(23,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(24,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(25,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(26,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(27,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(28,1,'NBT2019122001','CUSTOMER_INQUIRY_RECEIVED_BY_CUSTOMER','2019-12-20 00:00:00','2020-01-14 00:00:00',1),(29,1,NULL,'PENDING','2019-12-20 00:00:00',NULL,NULL),(30,1,NULL,'PENDING','2019-12-23 00:00:00',NULL,NULL),(31,1,NULL,'PENDING','2019-12-24 00:00:00',NULL,NULL),(32,1,NULL,'PENDING','2019-12-26 00:00:00',NULL,NULL),(33,1,NULL,'PENDING','2019-12-26 00:00:00',NULL,NULL),(34,1,NULL,'PENDING','2019-12-26 00:00:00',NULL,NULL),(35,1,NULL,'PENDING','2019-12-26 00:00:00',NULL,NULL),(36,1,NULL,'PENDING','2019-12-26 00:00:00',NULL,NULL),(37,1,NULL,'PENDING','2020-01-06 00:00:00',NULL,NULL),(38,1,NULL,'PENDING','2020-01-07 00:00:00',NULL,NULL),(39,1,NULL,'PENDING','2020-01-08 00:00:00',NULL,NULL),(40,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(41,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(42,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(43,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(44,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(45,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(46,1,NULL,'PENDING','2020-01-14 00:00:00',NULL,NULL),(47,1,NULL,'PENDING','2020-01-20 00:00:00',NULL,NULL),(48,1,NULL,'PENDING','2020-01-22 00:00:00',NULL,NULL),(49,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(50,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(51,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(52,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(53,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(54,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(55,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(56,1,NULL,'PENDING','2020-01-24 00:00:00',NULL,NULL),(57,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(58,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(59,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(60,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(61,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(62,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(63,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(64,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(65,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(66,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(67,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(68,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(69,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(70,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(71,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(72,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(73,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(74,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(75,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(76,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(77,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(78,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(79,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(80,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(81,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(82,1,NULL,'PENDING','2020-02-03 00:00:00',NULL,NULL),(83,1,NULL,'PENDING','2020-02-05 00:00:00',NULL,NULL),(84,1,NULL,'PENDING','2020-02-05 00:00:00',NULL,NULL),(85,1,NULL,'PENDING','2020-02-18 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `user_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cart_detail`
--

DROP TABLE IF EXISTS `user_cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cart_detail` (
  `cart_id` int(11) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_unit` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_product_active_in_cart` char(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cart_detail`
--

LOCK TABLES `user_cart_detail` WRITE;
/*!40000 ALTER TABLE `user_cart_detail` DISABLE KEYS */;
INSERT INTO `user_cart_detail` VALUES (2,'8',2,1,'2019-06-20 17:20:03','Y',NULL,NULL,NULL),(2,'4',23,1,'2019-06-20 17:20:12','Y',NULL,NULL,NULL),(5,'8',2,1,'2019-08-06 10:32:39','N',NULL,NULL,NULL),(5,'8',2,1,'2019-08-06 10:32:42','N',NULL,NULL,NULL),(5,'8',2,1,'2019-08-06 10:33:07','Y',NULL,NULL,NULL),(19,'10',300,8,'2019-12-19 14:59:32','Y',NULL,1,'2019-12-19'),(19,'135',850,8,'2019-12-19 14:59:32','Y',NULL,1,'2019-12-19'),(20,'128',500,8,'2019-12-19 15:09:58','Y',NULL,1,'2019-12-19'),(21,'10',10,8,'2019-12-19 15:24:12','Y',NULL,1,'2019-12-19'),(28,'10',10000,8,'2019-12-20 17:41:10','Y',NULL,1,'2019-12-20'),(28,'135',456,8,'2019-12-20 17:41:10','Y',NULL,1,'2019-12-20'),(28,'109',500,8,'2019-12-20 17:41:10','Y',NULL,1,'2019-12-20'),(73,'2',56,8,'2020-02-03 00:00:00','Y',1,NULL,NULL),(83,'1',23,8,'2020-02-05 00:00:00','N',1,1,'2020-02-05'),(83,'1',23,8,'2020-02-05 00:00:00','N',1,1,'2020-02-05'),(84,'1',12,8,'2020-02-05 00:00:00','Y',1,NULL,NULL);
/*!40000 ALTER TABLE `user_cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_business_activity_map`
--

DROP TABLE IF EXISTS `user_company_business_activity_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_business_activity_map` (
  `id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `user_company_information_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_business_activity_map`
--

LOCK TABLES `user_company_business_activity_map` WRITE;
/*!40000 ALTER TABLE `user_company_business_activity_map` DISABLE KEYS */;
INSERT INTO `user_company_business_activity_map` VALUES (1,'1',1),(2,'3',1),(3,'4',1),(4,'1',2),(5,'3',2),(6,'1',2),(7,'4',2);
/*!40000 ALTER TABLE `user_company_business_activity_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_business_type_map`
--

DROP TABLE IF EXISTS `user_company_business_type_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_business_type_map` (
  `id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `user_company_information_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_business_type_map`
--

LOCK TABLES `user_company_business_type_map` WRITE;
/*!40000 ALTER TABLE `user_company_business_type_map` DISABLE KEYS */;
INSERT INTO `user_company_business_type_map` VALUES (1,'1',1),(2,'2',1),(3,'4',1),(4,'1',2),(5,'2',2),(1,'3',1),(2,'3',2),(3,'3',3),(4,'3',4),(5,'3',5),(6,'3',6),(7,'3',7),(8,'6',8),(9,'6',9),(10,'6',10),(11,'3',11),(12,'3',12),(13,'6',13),(14,'6',14),(15,'6',15),(16,'5',16),(17,'5',17),(18,'3',18),(19,'3',19),(20,'3',20),(21,'6',21),(22,'6',22),(23,'3',23),(24,'6',24),(25,'6',25),(26,'3',26),(27,'6',27),(28,'3',28),(29,'3',29),(30,'6',30),(31,'6',31),(32,'6',32),(33,'6',33),(34,'6',34),(35,'3',35),(36,'3',36),(37,'3',37),(38,'6',38),(39,'6',39),(40,'3',40),(41,'6',41),(42,'3',42),(43,'3',43),(44,'6',44),(45,'3',45),(46,'6',46),(47,'6',47),(48,'3',48),(49,'5',49),(50,'3',50),(51,'6',51),(52,'3',52),(53,'6',53),(54,'3',54),(55,'5',55),(56,'6',56),(57,'3',57),(58,'3',58),(59,'6',59),(60,'3',60),(61,'3',61),(62,'5',62),(63,'3',63),(64,'6',64),(65,'6',65),(66,'3',66),(67,'3',67),(68,'6',68),(69,'3',69),(70,'3',70),(71,'3',71),(72,'6',72),(73,'6',73),(74,'6',74),(75,'6',75),(76,'6',76),(77,'3',77),(78,'6',78),(79,'6',79),(80,'6',80),(81,'3',81),(82,'5',82),(83,'6',83),(84,'6',84),(85,'6',85),(86,'3',86),(87,'6',87),(88,'3',88),(89,'3',89),(90,'3',90),(91,'3',91),(92,'6',92),(93,'6',93),(94,'3',94),(95,'3',95),(96,'3',96),(97,'3',97),(98,'3',98),(99,'3',99),(100,'5',100),(101,'3',101),(102,'3',102),(103,'3',103),(104,'6',104),(105,'3',105),(106,'6',106),(107,'3',107),(108,'3',108),(109,'5',109),(110,'6',110),(111,'3',111),(112,'6',112),(113,'3',113),(114,'3',114),(115,'3',115),(116,'5',116),(117,'3',117),(118,'3',118),(119,'5',119),(120,'3',120),(121,'3',121),(122,'6',122),(123,'6',123),(124,'3',124),(125,'3',125),(126,'6',126),(127,'3',127),(128,'6',128),(129,'6',129),(130,'6',130),(131,'6',131),(132,'6',132),(133,'6',133),(134,'5',134),(135,'6',135),(136,'3',136),(137,'6',137),(138,'6',138),(139,'6',139),(140,'6',140),(141,'6',141),(142,'3',142),(143,'3',143),(144,'6',144),(145,'6',145),(146,'6',146),(147,'3',147),(148,'6',148),(149,'6',149),(150,'6',150),(151,'3',151),(152,'6',152),(153,'6',153),(154,'3',154),(155,'6',155),(156,'6',156),(157,'3',157),(158,'3',158),(159,'3',159),(160,'3',160),(161,'6',161),(162,'3',162),(163,'3',163),(164,'3',164),(165,'6',165),(166,'1',1),(167,'3',2),(168,'6',2);
/*!40000 ALTER TABLE `user_company_business_type_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_information`
--

DROP TABLE IF EXISTS `user_company_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_company_information` (
  `user_id` int(11) NOT NULL,
  `business_since` varchar(10) DEFAULT NULL,
  `primary_product` varchar(2000) DEFAULT NULL,
  `parent_company_name` varchar(45) DEFAULT NULL,
  `business_transaction_person_name` varchar(45) DEFAULT NULL,
  `business_transaction_person_address` varchar(500) DEFAULT NULL,
  `business_transaction_person_city` varchar(10) DEFAULT NULL,
  `business_transaction_person_pin` varchar(10) DEFAULT NULL,
  `business_transaction_person_mobile` varchar(20) DEFAULT NULL,
  `business_transaction_person_email` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `primary_contact_number` varchar(20) DEFAULT NULL,
  `primary_mobile_number` varchar(20) DEFAULT NULL,
  `primary_email` varchar(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_company_information_City1_idx` (`business_transaction_person_city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_information`
--

LOCK TABLES `user_company_information` WRITE;
/*!40000 ALTER TABLE `user_company_information` DISABLE KEYS */;
INSERT INTO `user_company_information` VALUES (185,'','','','','','8','','','','2019-06-24 13:09:42',NULL,'undefined','','',1),(187,'1234','7,10','Test Business 2',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-23 16:28:29',NULL,NULL,'7894561230','TestCustomerBusi@exp',2);
/*!40000 ALTER TABLE `user_company_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact_information_master`
--

DROP TABLE IF EXISTS `user_contact_information_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contact_information_master` (
  `Id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact_information_master`
--

LOCK TABLES `user_contact_information_master` WRITE;
/*!40000 ALTER TABLE `user_contact_information_master` DISABLE KEYS */;
INSERT INTO `user_contact_information_master` VALUES (1,'Management / Director'),(2,'Purchasing Department'),(3,'Business / Marketing'),(4,'Accounts / Finance'),(5,'Senior Quality Assurance'),(6,'Senior Plant or Production Person'),(7,'Alternate Point of Contact'),(8,'Quality Control');
/*!40000 ALTER TABLE `user_contact_information_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contacts_information`
--

DROP TABLE IF EXISTS `user_contacts_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contacts_information` (
  `user_id` int(11) NOT NULL,
  `contact_information_type` varchar(50) DEFAULT NULL,
  `contact_person_first_name` varchar(45) DEFAULT NULL,
  `contact_person_last_name` varchar(45) DEFAULT NULL,
  `contact_person_email` varchar(45) DEFAULT NULL,
  `contact_person_mobile` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  KEY `fk_User_contacts_information_user_contact_information_maste_idx` (`contact_information_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contacts_information`
--

LOCK TABLES `user_contacts_information` WRITE;
/*!40000 ALTER TABLE `user_contacts_information` DISABLE KEYS */;
INSERT INTO `user_contacts_information` VALUES (13,'2','Mr. Tirtha',NULL,'purchase@parthphytoextracts.com','022-40155162','2019-06-19 14:23:10',NULL,166),(14,'2','Mr. Tirtha',NULL,'stores2cymbio@karlgroup.com','9845711169','2019-06-19 14:23:10',NULL,167),(15,'2','Mr. Tirtha',NULL,'lathika@greenleafextractons.com','8943334012','2019-06-19 14:23:10',NULL,168),(16,'2','Mr. Tirtha',NULL,'contactus@newtrimed.com','9489954109','2019-06-19 14:23:10',NULL,169),(17,'2','Mr. Tirtha',NULL,'vkondalarao@jkagri.com','6281303428','2019-06-19 14:23:10',NULL,170),(18,'2','Mr. Tirtha',NULL,'skjohnpasha@jkagri.com','9182562739','2019-06-19 14:23:10',NULL,171),(19,'2','Mr. Tirtha',NULL,'info@naturalholistics.co.in','9901036573','2019-06-19 14:23:10',NULL,172),(20,'2','Mr. Tirtha',NULL,'ssk@sskphytotech.com','9926359711','2019-06-19 14:23:10',NULL,173),(21,'2','Mr. Tirtha',NULL,'indianherbals@rediffmail.com','6362059887','2019-06-19 14:23:10',NULL,174),(22,'2','Mr. Tirtha',NULL,'biovitaminsnutra@rediffmail.com','9342025651','2019-06-19 14:23:10',NULL,175),(23,'2','Mr. Tirtha',NULL,'ajaykumar.b@plantlipids.com','9745054462','2019-06-19 14:23:10',NULL,176),(24,'2','Mr. Tirtha',NULL,'marketing.nutreenest@gmail.com','9972012599','2019-06-19 14:23:10',NULL,177),(25,'2','Mr. Tirtha',NULL,'info@rclab.org','9986597088','2019-06-19 14:23:10',NULL,178),(26,'2','Mr. Tirtha',NULL,'varshapurchase123@gmail.com','080-23157183','2019-06-19 14:23:10',NULL,179),(27,'2','Mr. Tirtha',NULL,'purchasetpm@katraphyto.com','8012142473','2019-06-19 14:23:10',NULL,180),(28,'2','Mr. Tirtha',NULL,'raghupathy@keralaayurved.biz','9562508399','2019-06-19 14:23:10',NULL,181),(29,'2','Mr. Tirtha',NULL,'cs@biomedingredients.com','8547663323','2019-06-19 14:23:10',NULL,182),(30,'2','Mr. Tirtha',NULL,'punitha_purchase@sunglowpharma.com','9677839996','2019-06-19 14:23:10',NULL,183),(31,'2','Mr. Tirtha',NULL,'purchase@asojsoftcaps.com','8980808776','2019-06-19 14:23:10',NULL,184),(32,'2','Mr. Tirtha',NULL,'srbiofuturelabs@gmail.com','9787700925','2019-06-19 14:23:10',NULL,185),(35,'2','Mr. Tirtha',NULL,'vyomchemspecialities@gmail.com','7018241544','2019-06-19 14:23:10',NULL,186),(37,'2','Mr. Tirtha',NULL,'karthik@hillgreen.com','9845122446','2019-06-19 14:23:10',NULL,187),(39,'2','Mr. Tirtha',NULL,'symbio@symbiogenerics.com','044-25324300','2019-06-19 14:23:10',NULL,188),(40,'2','Mr. Tirtha',NULL,'purchase1@dnaayurveda.in','044-40927310','2019-06-19 14:23:10',NULL,189),(43,'2','Mr. Tirtha',NULL,'rm9888@gmail.com','8639719156','2019-06-19 14:23:10',NULL,190),(44,'2','Mr. Tirtha',NULL,'kodurikiran@gmail.com','9652223399','2019-06-19 14:23:10',NULL,191),(45,'2','Mr. Tirtha',NULL,'moni@jairadhesales.com','079-26423872-74','2019-06-19 14:23:10',NULL,192),(46,'2','Mr. Tirtha',NULL,'purchase@grenera.com','9952111014','2019-06-19 14:23:10',NULL,193),(47,'2','Mr. Tirtha',NULL,'contactus@newtrimed.com','9489954109','2019-06-19 14:23:10',NULL,194),(48,'2','Mr. Tirtha',NULL,'rajeshiyer@mavenilab.com','9945677665','2019-06-19 14:23:10',NULL,195),(51,'2','Jyoti',NULL,'jyoti@guruprasadam.com','','2019-06-19 14:23:10',NULL,196),(52,'2','Sangita',NULL,'info@acumenindus.com','','2019-06-19 14:23:10',NULL,197),(53,'2','Tamil Selvan',NULL,'purchase1@aeonf.com','','2019-06-19 14:23:10',NULL,198),(54,'2','Anurag',NULL,'director@agronremedies.com','','2019-06-19 14:23:10',NULL,199),(55,'2','Tahir S. Sehorewala',NULL,'alienterprises52@yahoo.in','','2019-06-19 14:23:10',NULL,200),(56,'2','Gokul Gopinath',NULL,'info@allseasonsherbs.com','','2019-06-19 14:23:10',NULL,201),(57,'2','Praveen Jain',NULL,'amarpharma107@gmail.com','','2019-06-19 14:23:10',NULL,202),(58,'2','Vikas Kumar Khandelwal',NULL,'vikas1185@gmail.com','','2019-06-19 14:23:10',NULL,203),(59,'2','Benjamin',NULL,'purchase@apolloingredients.com','','2019-06-19 14:23:10',NULL,204),(60,'2','Bineesh Gopi',NULL,'purchase@arjunanatural.com','','2019-06-19 14:23:10',NULL,205),(61,'2','Dilna Raj',NULL,'accounts@ayurvitaindia.com','','2019-06-19 14:23:10',NULL,206),(62,'2','Bhavin Shah',NULL,'bhavichem@gmail.com','','2019-06-19 14:23:10',NULL,207),(63,'2','Sreenath',NULL,'purchasing@bhoominaturals.in','','2019-06-19 14:23:10',NULL,208),(64,'2','Sowmya',NULL,'admin@bioextract.co.in ','','2019-06-19 14:23:10',NULL,209),(65,'2','Dr. ravi raghuvanshi',NULL,'dr.ravi@blissayurveda.com','','2019-06-19 14:23:10',NULL,210),(66,'2','Mohd Aijaz',NULL,'info@calixherbal.com','','2019-06-19 14:23:10',NULL,211),(67,'2','Manoj',NULL,'info@biovedanaturals.com','','2019-06-19 14:23:10',NULL,212),(68,'2','Rahul Saxena',NULL,'capl1@rediffmail.com','','2019-06-19 14:23:10',NULL,213),(69,'2','Gautam Lal',NULL,'gautamlal1962@gmail.com','','2019-06-19 14:23:10',NULL,214),(70,'2','Rohit Passi',NULL,'purchase.hwr@deltaspharma.com','','2019-06-19 14:23:10',NULL,215),(71,'2','Sriram Subramanya',NULL,' vsp@nutraforlife.com ','','2019-06-19 14:23:10',NULL,216),(72,'2','diksha jain',NULL,'sales@dolcas-botanosys.com','','2019-06-19 14:23:10',NULL,217),(73,'2','Vibhore Jain',NULL,'elizence@yahoo.com','','2019-06-19 14:23:10',NULL,218),(74,'2','Anand.P',NULL,'energeiapurchase@gmail.com','','2019-06-19 14:23:10',NULL,219),(75,'2','Ankush Tripathi',NULL,'fcl.ankush4@gmail.com','','2019-06-19 14:23:10',NULL,220),(76,'2','Aditya Agarwal',NULL,'info@flavourtrove.com','','2019-06-19 14:23:10',NULL,221),(77,'2','Henna',NULL,' heena@fullife.co.in','','2019-06-19 14:23:10',NULL,222),(78,'2','Vipin Dave',NULL,'purchase@grherbals.com','','2019-06-19 14:23:10',NULL,223),(79,'2','Shanth kumar',NULL,'srishanthas@gmail.com','','2019-06-19 14:23:10',NULL,224),(80,'2','Bhupinder Singh',NULL,' sharkeyecreations@gmail.com','','2019-06-19 14:23:10',NULL,225),(81,'2','Anish Sharma',NULL,'sharmaanish1987@gmail.com','','2019-06-19 14:23:10',NULL,226),(82,'2','Paramjit Arora',NULL,'purchase1@healthbiotech.in','','2019-06-19 14:23:10',NULL,227),(83,'2','Rajinder Kumar',NULL,'kumarrajinder@yahoo.com','','2019-06-19 14:23:10',NULL,228),(84,'2','Somnath K',NULL,'herbochemad@rediffmail.com','','2019-06-19 14:23:10',NULL,229),(85,'2','Deepak Kumar',NULL,'hindnatural@gmail.com','','2019-06-19 14:23:10',NULL,230),(86,'2','Vinod Chauhan',NULL,'vinu@himalyanherbaria.com','','2019-06-19 14:23:10',NULL,231),(87,'2','manjunath ',NULL,'manjunath@indoglobal.co.in','','2019-06-19 14:23:10',NULL,232),(88,'2','Kishore',NULL,'stores@indovedic.com','','2019-06-19 14:23:10',NULL,233),(89,'2','Moni Benny',NULL,'moni @jairadhesales.com','','2019-06-19 14:23:10',NULL,234),(90,'2','Tandel',NULL,'info.kaiwalbiotech@gmail.com','','2019-06-19 14:23:10',NULL,235),(91,'2','Kalpesh Ramanlal Jain',NULL,'krj@krishgen.com','','2019-06-19 14:23:10',NULL,236),(92,'2','Rajesh ',NULL,'biotechkshipra@gmail.com','','2019-06-19 14:23:10',NULL,237),(93,'2','kapil garg',NULL,'kapil.garg@kuberimpex.com','','2019-06-19 14:23:10',NULL,238),(94,'2','Gauri',NULL,'gauri@gopaldasvisram.in','','2019-06-19 14:23:10',NULL,239),(95,'2','kanchan',NULL,'kanchan@kudos.in','','2019-06-19 14:23:10',NULL,240),(96,'2','',NULL,'info.luckyimpex@gmail.com','','2019-06-19 14:23:10',NULL,241),(97,'2','Abha Sharma',NULL,'tharmarketing@rediffmail.com','','2019-06-19 14:23:10',NULL,242),(98,'2','V.Sudhakar Rao',NULL,'manishasherbal@gmail.com','','2019-06-19 14:23:10',NULL,243),(99,'2','Pawan Kumar',NULL,'mehalherbs@gmail.com','','2019-06-19 14:23:10',NULL,244),(100,'2','Srinivas',NULL,'srinivasaraov@natsollabs.com','','2019-06-19 14:23:10',NULL,245),(101,'2','Rajani',NULL,'rajani.k@naturalremedy.com','','2019-06-19 14:23:10',NULL,246),(102,'2','Aruna Mathur',NULL,'draruna.mathur@gmail.com','','2019-06-19 14:23:10',NULL,247),(103,'2','Madhukar',NULL,'nhlabs@gmail.com','','2019-06-19 14:23:10',NULL,248),(104,'2','Priyanka ',NULL,'sales1@nectarphyto.com','','2019-06-19 14:23:10',NULL,249),(105,'2','Devashish Verma',NULL,'dev@nectarphyto.com','','2019-06-19 14:23:10',NULL,250),(106,'2','Karthik',NULL,'purchase@novelnutrient.com','','2019-06-19 14:23:10',NULL,251),(107,'2','J J Shah',NULL,'inquiry@oceanicpharmachem.com','','2019-06-19 14:23:10',NULL,252),(108,'2','Navin Sundar',NULL,'sales@optimumherbalextracts.com','','2019-06-19 14:23:10',NULL,253),(109,'2','Rishi Kumar',NULL,'purchase@pncpl.com','','2019-06-19 14:23:10',NULL,254),(110,'2','Vijaya',NULL,'Vijaya@phytotech.in','','2019-06-19 14:23:10',NULL,255),(111,'2','Abhishek Singh',NULL,'rmpurchase@pontikaaerotech.com','','2019-06-19 14:23:10',NULL,256),(112,'2','Vasavi Kulkarni',NULL,'rajeshkulkarni17@gmail.com','','2019-06-19 14:23:10',NULL,257),(113,'2','Suchitra',NULL,'suchita@prakruti.com','','2019-06-19 14:23:10',NULL,258),(114,'2','Rajesh Singh',NULL,'rajesh@naturabt.com','','2019-06-19 14:23:10',NULL,259),(115,'2','Farhana',NULL,'farhanachippa@yahoo.com','','2019-06-19 14:23:10',NULL,260),(116,'2','Shubha',NULL,'csquiver@gmail.com','','2019-06-19 14:23:10',NULL,261),(117,'2','Krishna',NULL,'krishna@krishnaaloevera','','2019-06-19 14:23:10',NULL,262),(118,'2','Aruna Mathur',NULL,'draruna.mathur@gmail.com','','2019-06-19 14:23:10',NULL,263),(119,'2','Avinash Thakur',NULL,'avinash.thakur@sahbio.com','','2019-06-19 14:23:10',NULL,264),(120,'2','Kunal',NULL,'kunal.gunjal@savaglobal.com','','2019-06-19 14:23:10',NULL,265),(121,'2','Shikha Mainali',NULL,'shikha.shreedha@hotmail.com','','2019-06-19 14:23:10',NULL,266),(122,'2','Ramana Rao',NULL,'skbioextracts@gmail.com','','2019-06-19 14:23:10',NULL,267),(123,'2','jayalakshmi',NULL,'ganeshherbals@yahoo.com','','2019-06-19 14:23:10',NULL,268),(124,'2','Arvind Kumar Temura',NULL,'arvind@stiritiventures.com','','2019-06-19 14:23:10',NULL,269),(125,'2','RaviShadija',NULL,'ravishadija@sugunafoods.co.in','','2019-06-19 14:23:10',NULL,270),(126,'2','Sendil Kumar',NULL,'sendil.kumar@himalayawellness.com','','2019-06-19 14:23:10',NULL,271),(127,'2','Sahana',NULL,'sahana@samilabs.com','','2019-06-19 14:23:10',NULL,272),(128,'2','Gaurav Nagpal',NULL,'gaurav@tulsiamrit.com','','2019-06-19 14:23:10',NULL,273),(129,'2','Mahender',NULL,'orders@unppl.com','','2019-06-19 14:23:10',NULL,274),(130,'2','Jui Roy',NULL,'purchase@vipulorganics.com','','2019-06-19 14:23:10',NULL,275),(131,'2','Paresh Mahale',NULL,'purchase@virgouap.com','','2019-06-19 14:23:10',NULL,276),(132,'2','Pravin Patel',NULL,'vitalpurchase305@gmail.com','','2019-06-19 14:23:10',NULL,277),(133,'2','Manish Ajmera',NULL,'manishajmera10@hotmail.com','','2019-06-19 14:23:10',NULL,278),(134,'2','Chethan',NULL,'chethan@vruddhiinc.com','','2019-06-19 14:23:10',NULL,279),(135,'2','A.N.Shah',NULL,'dhamanesunil@gmail.com','','2019-06-19 14:23:10',NULL,280),(136,'2','Divya Dabral',NULL,'Purchase@windlasbiotech.com','','2019-06-19 14:23:10',NULL,281),(137,'2','M.Krishna Chaitanya',NULL,'chaitanya@ziranindia.com','','2019-06-19 14:23:10',NULL,282),(138,'2','Mr. Tirtha',NULL,'macbiosciences@gmail.com','9416681147','2019-06-19 14:23:10',NULL,283),(139,'2','Mr. Tirtha',NULL,'suryaherbal171@gmail.com','8427666003','2019-06-19 14:23:10',NULL,284),(140,'2','Mr. Tirtha',NULL,'prosolpharma@gmail.com','7838380841','2019-06-19 14:23:10',NULL,285),(141,'2','Mr. Tirtha',NULL,'nbhealthcare6@gmail.com','6280672620','2019-06-19 14:23:10',NULL,286),(142,'2','Mr. Tirtha',NULL,'kkharbal@gmail.com','9779966966','2019-06-19 14:23:10',NULL,287),(143,'2','Mr. Tirtha',NULL,'bioliferemediesindia@gmail.com','8699606606','2019-06-19 14:23:10',NULL,288),(144,'2','Mr. Tirtha',NULL,'contact@zoicpharma.com','9815620908','2019-06-19 14:23:10',NULL,289),(145,'2','Mr. Tirtha',NULL,' kuldeep.pal@brightlifecare.com','9910096378','2019-06-19 14:23:10',NULL,290),(146,'2','Mr. Tirtha',NULL,'logichembiotech@gmail.com','9896121111','2019-06-19 14:23:10',NULL,291),(147,'2','Mr. Tirtha',NULL,'info@ukgermanpharmaceutical.com','9815984107','2019-06-19 14:23:10',NULL,292),(148,'2','Mr. Tirtha',NULL,'maulikremedies1@gmail.com','9041777752','2019-06-19 14:23:10',NULL,293),(149,'2','Mr. Tirtha',NULL,'NA','9417266977','2019-06-19 14:23:10',NULL,294),(150,'2','Mr. Tirtha',NULL,'nadvedics@gmail.com','1724655867','2019-06-19 14:23:10',NULL,295),(151,'2','Mr. Tirtha',NULL,'atul@pharminoxmeditech.com','9876002885','2019-06-19 14:23:10',NULL,296),(152,'2','Mr. Tirtha',NULL,'rishiherbalproducts@gmail.com','8295234348','2019-06-19 14:23:10',NULL,297),(153,'2','Mr. Tirtha',NULL,'NA','9855045415','2019-06-19 14:23:10',NULL,298),(154,'2','Mr. Tirtha',NULL,'setkoindia@gmail.com','9501591587','2019-06-19 14:23:10',NULL,299),(155,'2','Mr. Tirtha',NULL,'ccs@sblifesciences.in','9634773914','2019-06-19 14:23:10',NULL,300),(156,'2','Mr. Tirtha',NULL,'lewibhealthcare@gmail.com','8901424800','2019-06-19 14:23:10',NULL,301),(157,'2','Mr. Tirtha',NULL,'infoansalpharma@gmail.com','9412274125','2019-06-19 14:23:10',NULL,302),(158,'2','Mr. Tirtha',NULL,'NA','9814582715','2019-06-19 14:23:10',NULL,303),(159,'2','Mr. Tirtha',NULL,'NA','8683957885','2019-06-19 14:23:10',NULL,304),(160,'2','Mr. Tirtha',NULL,'taksalifesciences@rediffmail.com','9779892404','2019-06-19 14:23:10',NULL,305),(161,'2','Mr. Tirtha',NULL,'7018363315','9625086011','2019-06-19 14:23:10',NULL,306),(162,'2','Mr. Tirtha',NULL,'Info.atulyamedilink@gmail.com','8851180014','2019-06-19 14:23:10',NULL,307),(163,'2','Mr. Tirtha',NULL,'nagpalayurveda@gmail.com','9694165747','2019-06-19 14:23:10',NULL,308),(164,'2','Mr. Tirtha',NULL,'aloecaresales@gmail.com','8955507057','2019-06-19 14:23:10',NULL,309),(165,'2','Mr. Tirtha',NULL,'easternhealthcare007@gmail.com','7290040048','2019-06-19 14:23:10',NULL,310),(166,'2','Mr. Tirtha',NULL,'info@prabhatayurvedicpharmacy.in','9815900424','2019-06-19 14:23:10',NULL,311),(167,'2','Mr. Tirtha',NULL,'gagan.ayu@gmail.com','7240790004','2019-06-19 14:23:10',NULL,312),(168,'2','Mr. Tirtha',NULL,'chandrayanherbal@gmail.com','700065788','2019-06-19 14:23:10',NULL,313),(169,'2','Mr. Tirtha',NULL,'rajendra.prasad@copmedpharma.com','9805000734','2019-06-19 14:23:10',NULL,314),(170,'2','Mr. Tirtha',NULL,'harbalfarm@gmail.com','9871727573','2019-06-19 14:23:10',NULL,315),(171,'2','Mr. Tirtha',NULL,'zanekapurchase123@gmail.com','7088168899','2019-06-19 14:23:10',NULL,316),(172,'2','Mr. Tirtha',NULL,'herbalsamazon@gmail.com','9868021369','2019-06-19 14:23:10',NULL,317),(173,'2','Mr. Tirtha',NULL,'singh@redhillherbals.com','9811619106','2019-06-19 14:23:10',NULL,318),(174,'2','Mr. Tirtha',NULL,'purchase@vxldrugs.com','7042394400','2019-06-19 14:23:10',NULL,319),(175,'2','Mr. Tirtha',NULL,'ayurvite@gmail.com','7697789405','2019-06-19 14:23:10',NULL,320),(176,'2','Mr. Tirtha',NULL,'nmpamrit@giloy.in','9643831908','2019-06-19 14:23:10',NULL,321),(12,'1','Mr.E.Venkatramulu',NULL,'venkat@marvenbiochem.in','9652189941','2019-06-19 14:23:18',NULL,1),(13,'1','MR.URMIL MAVANI',NULL,'urmil@parthphytoextracts.com','9821156162','2019-06-19 14:23:18',NULL,2),(14,'1','Mr.Mahendra Karle',NULL,'bhat@karlegroup.com','9900014078','2019-06-19 14:23:18',NULL,3),(15,'1','Ms. Sreelatha Nair',NULL,'sreelatha@greenleafextractions.com','9447150040','2019-06-19 14:23:18',NULL,4),(16,'1','Mr. T.M. Kannan',NULL,'contactus@newtrimed.com','9489954109','2019-06-19 14:23:18',NULL,5),(17,'1','Mr. Vikrampati singhania',NULL,'info@jkagri.com','040-66316858','2019-06-19 14:23:18',NULL,6),(18,'1','Mr. Harish',NULL,'harish@jkmail.com','7799775047','2019-06-19 14:23:18',NULL,7),(19,'1','Mr. Krishnaraj',NULL,'info@naturalholistics.co.in','9901036573','2019-06-19 14:23:18',NULL,8),(20,'1','Mr. Dinesh',NULL,'ssk@sskphytotech.com','9926359711','2019-06-19 14:23:18',NULL,9),(21,'1','Mr. Ashok kumar',NULL,'indianherbals@rediffmail.com','6362059887','2019-06-19 14:23:18',NULL,10),(22,'1','Mr. Kumaraswamy raju',NULL,'mdbiovitamins@rediffmail.com','9886036999','2019-06-19 14:23:18',NULL,11),(23,'1','Mr. Chennakattu John George',NULL,'info@plantlipids.com','0484-2844500','2019-06-19 14:23:18',NULL,12),(24,'1','Mr. Vasu',NULL,'marketing.nutreenest@gmail.com','9972012599','2019-06-19 14:23:18',NULL,13),(25,'1','Mr. Girinath Reddy',NULL,'info@rclab.org','08512-210045','2019-06-19 14:23:18',NULL,14),(26,'1','Mr. H.K. Nanjaiah',NULL,'bpm@varshagroup.com','080-23358945','2019-06-19 14:23:18',NULL,15),(27,'1','MR. Anil Kumar',NULL,'companysecretary@keralaayurveda.biz','0484-2476304','2019-06-19 14:23:18',NULL,16),(28,'1','MR. Anil Kumar',NULL,'companysecretary@keralaayurveda.biz','0484-2476304','2019-06-19 14:23:18',NULL,17),(29,'1','Mr. Sebastian',NULL,'sebastian@biomedingredients.com','8806668458','2019-06-19 14:23:18',NULL,18),(30,'1','MR. Rajasekaran',NULL,'raja@sunglowpharma.com','044-43534656','2019-06-19 14:23:18',NULL,19),(31,'1','Mr. Narendra khimji Savla',NULL,'asojmumbai@rediffmail.com','9320688354','2019-06-19 14:23:18',NULL,20),(32,'1','Mr. Raghavan',NULL,'srbiofuturelabs.com','9787700925','2019-06-19 14:23:18',NULL,21),(33,'1','Mr. Mohammed',NULL,'easternherbals@gmail.com','9446347668','2019-06-19 14:23:18',NULL,22),(34,'1','Mr. Thangavelu balakrishnan',NULL,'maruthibalki58@gmail.com','9444465938','2019-06-19 14:23:18',NULL,23),(35,'1','Ms. MINAKSHI NIKHANJ',NULL,'minakshi@vyomchem.com','8699090609','2019-06-19 14:23:18',NULL,24),(36,'1','Mr. Arvind Seshu',NULL,'arvind.seshu@gmail.com','9845868765','2019-06-19 14:23:18',NULL,25),(37,'1','Mr. KARTHIK',NULL,'karthik@hillgreen.com','9845122446','2019-06-19 14:23:18',NULL,26),(38,'1','Mr. Shafi',NULL,'shafi@massherbals.com','9341263155','2019-06-19 14:23:18',NULL,27),(39,'1','Mr. Pradeep Kumar',NULL,'pradeep.kumar@coperniciumpharma.com','9880035358','2019-06-19 14:23:18',NULL,28),(40,'1','Mr. Deepak Abhayakumar',NULL,'deepak@dnaayurveda.in','044-40927300','2019-06-19 14:23:18',NULL,29),(41,'1','Dr. Sajan George',NULL,'deeptalabs@gmail.com','9886648291','2019-06-19 14:23:18',NULL,30),(42,'1','Dr. Ashish',NULL,'nskherbs@gmail.com','9940363093','2019-06-19 14:23:18',NULL,31),(43,'1','Mr. Moorthy',NULL,'rm9888@gmail.com','8639719156','2019-06-19 14:23:18',NULL,32),(44,'1','Mr. Koduri Kiran',NULL,'kodurikiran@gmail.com','9652223399','2019-06-19 14:23:18',NULL,33),(45,'1','Mr. Anish Nair',NULL,'anair@jairadhesales.com','9925650031','2019-06-19 14:23:18',NULL,34),(46,'1','P.SUBRAMANIAM',NULL,'purchase@grenera.com','9952111014','2019-06-19 14:23:18',NULL,35),(47,'1','Mr. Sai',NULL,'contactus@newtrimed.com','9489954109','2019-06-19 14:23:18',NULL,36),(48,'1','Mr. Lakshman Perumal',NULL,'lakshman@milablifesciences.com','8050717400','2019-06-19 14:23:18',NULL,37),(49,'1','Mr. Liyakat Ali khan',NULL,'supherblifesciences@gmail.com','9902029911','2019-06-19 14:23:18',NULL,38),(50,'1','Mr. Mithra',NULL,'remezyshopping@gmail.com','8754172272','2019-06-19 14:23:18',NULL,39),(51,'1','Vibhuti Das',NULL,'skc1234ca@gmail.com','8383900912','2019-06-19 14:23:18',NULL,40),(52,'1','Priyanka Manghani',NULL,'info@acumenindus.com','7316446888','2019-06-19 14:23:18',NULL,41),(53,'1','Hasmukhlal Vora Dhirajlal',NULL,'finance@aeonf.com','9500043686','2019-06-19 14:23:18',NULL,42),(54,'1','Gopal Krishnan Agarwal',NULL,'director@agronremedies.com','9837050929','2019-06-19 14:23:18',NULL,43),(55,'1','Tahir S. Sehorewala',NULL,'alienterprises52@yahoo.in','9892428507','2019-06-19 14:23:18',NULL,44),(56,'1','ArunKumar KunjuPanicker',NULL,'info@allseasonsherbs.com','9845048292','2019-06-19 14:23:18',NULL,45),(57,'1','Praveen Jain',NULL,'amarpharma107@gmail.com','9152381974','2019-06-19 14:23:18',NULL,46),(58,'1','Vikas Kumar Khandelwal',NULL,'vikas1185@gmail.com','8952955651','2019-06-19 14:23:18',NULL,47),(59,'1','Lovely Ghanshyam Mutreja',NULL,'accounts@apolloingredients.com','7219888886','2019-06-19 14:23:18',NULL,48),(60,'1','KUNJACHAN P. JOSEPH ',NULL,'mail@arjunanatural.com','914844080400','2019-06-19 14:23:18',NULL,49),(61,'1','Vijay Kushvaha',NULL,'accounts@ayurvitaindia.com','','2019-06-19 14:23:18',NULL,50),(62,'1','Bhavin Shah',NULL,'bhavichem@gmail.com','','2019-06-19 14:23:18',NULL,51),(63,'1','Jayachandran Kottarathil',NULL,'accountsptjco@yahoo.com','','2019-06-19 14:23:18',NULL,52),(64,'1','Manoj kumar',NULL,'sales@bioextract.co.in','','2019-06-19 14:23:18',NULL,53),(65,'1','Nitin Agarwal',NULL,'dr.ravi@blissayurveda.com','','2019-06-19 14:23:18',NULL,54),(66,'1','Bilal Khan',NULL,'info@calixherbal.com','','2019-06-19 14:23:18',NULL,55),(67,'1','Manoj',NULL,'manojkmadhav@biovedanaturals.com','','2019-06-19 14:23:18',NULL,56),(68,'1','Kavita Sadanand Mandhyan',NULL,'capl1@rediffmail.com','','2019-06-19 14:23:18',NULL,57),(69,'1','Chitta Ranjan Tripathy',NULL,'crt1968@yahoo.co.in','','2019-06-19 14:23:18',NULL,58),(70,'1','Rohit Passi',NULL,'purchase.hwr@deltaspharma.com','','2019-06-19 14:23:18',NULL,59),(71,'1','Sriram Subramanya',NULL,'vsp@nutraforlife.com','044-40927310','2019-06-19 14:23:18',NULL,60),(72,'1','RTVIK SETHIA',NULL,'INFO@botanosys.com','0151-2543029','2019-06-19 14:23:18',NULL,61),(73,'1','Satinder Kumar Jain',NULL,'elizence@yahoo.com','','2019-06-19 14:23:18',NULL,62),(74,'1','Muthaiah Naveen',NULL,'energeiapurchase@gmail.com','','2019-06-19 14:23:18',NULL,63),(75,'1','Dr.V .K Tripathi',NULL,'vk.tripathi@yahoo.com','','2019-06-19 14:23:18',NULL,64),(76,'1','Aditya Agarwal',NULL,'info@flavourtrove.com','','2019-06-19 14:23:18',NULL,65),(77,'1','Snehal Shah Champaklal',NULL,'snehal@fullife.co.in','','2019-06-19 14:23:18',NULL,66),(78,'1','Rahul Marwal',NULL,'rahulmarwal@grherbals.com','','2019-06-19 14:23:18',NULL,67),(79,'1','Shanth kumar',NULL,'srishanthas@gmail.com','','2019-06-19 14:23:18',NULL,68),(80,'1','Bhupinder Singh',NULL,'sharkeyecreations@gmail.com','','2019-06-19 14:23:18',NULL,69),(81,'1','Mohd Khan Ismaeel',NULL,'mismaeelkhan@gmail.com','','2019-06-19 14:23:18',NULL,70),(82,'1','Paramjit Arora',NULL,'hbl_finance@yahoo.com','','2019-06-19 14:23:18',NULL,71),(83,'1','Rajinder Kumar',NULL,'kumarrajinder@yahoo.com','','2019-06-19 14:23:18',NULL,72),(84,'1','Somnath K',NULL,'herbochemad@rediffmail.com','914023077331','2019-06-19 14:23:18',NULL,73),(85,'1','Deepak Kumar Agarwal',NULL,'hindnatural@gmail.com','','2019-06-19 14:23:18',NULL,74),(86,'1','Vinod Chauhan',NULL,'vinu@himalyanherbaria.com','','2019-06-19 14:23:18',NULL,75),(87,'1','Bharath B Manjunath',NULL,'bharath@indoglobal.co.in','','2019-06-19 14:23:18',NULL,76),(88,'1','Gouse Moheddin Irfan Pasha',NULL,'irfan@indovedic.com','8028390111','2019-06-19 14:23:18',NULL,77),(89,'1','Nikunj Goswami',NULL,'moni@jairadhesales.com','','2019-06-19 14:23:18',NULL,78),(90,'1','N R Rathod',NULL,'info.kaiwalbiotech@gmail.com','','2019-06-19 14:23:18',NULL,79),(91,'1','Kalpesh Ramanlal Jain',NULL,'krj@krishgen.com','8042957097','2019-06-19 14:23:18',NULL,80),(92,'1','Pawan Kumar Dubey',NULL,'pawandubey456@gmail.com','','2019-06-19 14:23:18',NULL,81),(93,'1','Jatan Kumar Garg',NULL,'kapil.garg@kuberimpex.com','','2019-06-19 14:23:18',NULL,82),(94,'1','Shah Smitesh Chandravadan',NULL,'krupallp387@gmail.com','8042554924','2019-06-19 14:23:18',NULL,83),(95,'1','Goomer',NULL,'kanchan@kudos.in','','2019-06-19 14:23:18',NULL,84),(96,'1','NA',NULL,'info.luckyimpex@gmail.com','','2019-06-19 14:23:18',NULL,85),(97,'1','Abha Sharma',NULL,'tharmarketing@rediffmail.com','','2019-06-19 14:23:18',NULL,86),(98,'1','V.Sudhakar Rao',NULL,'manishasherbal@gmail.com','','2019-06-19 14:23:18',NULL,87),(99,'1','Pawan Kumar',NULL,'mehalherbs@gmail.com','','2019-06-19 14:23:18',NULL,88),(100,'1','Yamuna Subbaraju Gottumukalla',NULL,'yamuna@natsollabs.com','','2019-06-19 14:23:18',NULL,89),(101,'1','Amit Agarwal',NULL,'finance@naturalremedy.com','8040209999','2019-06-19 14:23:18',NULL,90),(102,'1','Maqbool Hassan',NULL,'maqbool786@gmail.com','8048077292','2019-06-19 14:23:18',NULL,91),(103,'1','Madhukar',NULL,'nhlabs@gmail.com','','2019-06-19 14:23:18',NULL,92),(104,'1','Devashish Verma',NULL,'sales@nectarphyto.com','','2019-06-19 14:23:18',NULL,93),(105,'1','Subhash Naithani',NULL,'md@nectarphyto.com','','2019-06-19 14:23:18',NULL,94),(106,'1','Subramanian Sobbayain',NULL,'kopparaharrys@gmail.com','','2019-06-19 14:23:18',NULL,95),(107,'1','Jayesh Jethalal Shah',NULL,'info@oceanicpharmachem.com','022-42128600 ','2019-06-19 14:23:18',NULL,96),(108,'1','Navin Sundar',NULL,'sales@optimumherbalextracts.com','','2019-06-19 14:23:18',NULL,97),(109,'1','Rakesh Mittal',NULL,'rmtiwarifcs@gmail.com','','2019-06-19 14:23:18',NULL,98),(110,'1','Venkitachalam Hariharan',NULL,'hariharan@phytotech.in','','2019-06-19 14:23:18',NULL,99),(111,'1','Ashok Goyal',NULL,'vikasca35@yahoo.co.in','','2019-06-19 14:23:18',NULL,100),(112,'1','Vasavi Kulkarni',NULL,'rajeshkulkarni17@gmail.com','','2019-06-19 14:23:18',NULL,101),(113,'1','Manur Raghavendar Shetty',NULL,'pratisales@prakruti.com','','2019-06-19 14:23:18',NULL,102),(114,'1','Sonali Rajesh Kumar Singh',NULL,'rajeshsingh.awgp@gmail.com','','2019-06-19 14:23:18',NULL,103),(115,'1','Neeraj Bhatnagar',NULL,'farhanachippa@yahoo.com','','2019-06-19 14:23:18',NULL,104),(116,'1','Sandip Misra',NULL,'quivercare@gmail.com','','2019-06-19 14:23:18',NULL,105),(117,'1','Shrawan Daga',NULL,'shrawan@krishnaaloevera','','2019-06-19 14:23:18',NULL,106),(118,'1','Maqbool Hassan',NULL,'maqbool786@gmail.com','','2019-06-19 14:23:18',NULL,107),(119,'1','Dhirajlal Vallabhbhai Kotadia',NULL,'dlalkotadia@sahmed.com','','2019-06-19 14:23:18',NULL,108),(120,'1','Renu',NULL,'renu.a@savaglobal.com','','2019-06-19 14:23:18',NULL,109),(12,'3','Mr. Tirtha',NULL,'tirtha@marvenbiochem.in','7995877161','2019-06-19 14:23:28',NULL,322),(13,'3','Mr. Urmil',NULL,'marketing@parthphytoextracts.com','','2019-06-19 14:23:28',NULL,323),(14,'3','Mr. Senthil',NULL,'senthil@karlegroup.com','','2019-06-19 14:23:28',NULL,324),(15,'3','Ms. Deepu',NULL,'deepu@greenleafextractions.com','','2019-06-19 14:23:28',NULL,325),(16,'3','Mr. Vivek',NULL,'vivek.tm26@gmail.com','8056169097','2019-06-19 14:23:28',NULL,326),(19,'3','Mr. Krishnaraj',NULL,'info@naturalholistics.co.in','9901036573','2019-06-19 14:23:28',NULL,327),(20,'3','Mr. Dinesh',NULL,'ssk@sskphytotech.com','9926359711','2019-06-19 14:23:28',NULL,328),(21,'3','Mr. Ashok',NULL,'indianherbals@rediffmail.com','6362059887','2019-06-19 14:23:28',NULL,329),(22,'3','Mr. Kumaraswamy raju',NULL,'mdbiovitamins@rediffmail.com','9886036999','2019-06-19 14:23:28',NULL,330),(23,'3','',NULL,'','','2019-06-19 14:23:28',NULL,331),(24,'3','Mr. Vasu',NULL,'marketing.nutreenest@gmail.com','9972012599','2019-06-19 14:23:28',NULL,332),(25,'3','Mr. Giri',NULL,'info@rclab.org','9986597088','2019-06-19 14:23:28',NULL,333),(29,'3','Mr. Sebastian',NULL,'sebastian@biomedingredients.com','8806668458','2019-06-19 14:23:28',NULL,334),(33,'3','Mr. Mohammed',NULL,'easternherbals@gmail.com','9446347668','2019-06-19 14:23:28',NULL,335),(34,'3','Mr. Rajan',NULL,'rajantmal@gmail.com','9444465938','2019-06-19 14:23:28',NULL,336),(35,'3','MINAKSHI NIKHANJ',NULL,'minakshi@vyomchem.com','8699090609','2019-06-19 14:23:28',NULL,337),(36,'3','Mr. Arvind Seshu',NULL,'arvind.seshu@gmail.com','9845868765','2019-06-19 14:23:28',NULL,338),(37,'3','RAJESH',NULL,'rajesh@hillgreen.com','9845122446','2019-06-19 14:23:28',NULL,339),(38,'3','Mr. Shafi',NULL,'shafi@massherbals.com','9341263155','2019-06-19 14:23:28',NULL,340),(41,'3','Dr. Sajan George',NULL,'deeptalabs@gmail.com','9886648291','2019-06-19 14:23:28',NULL,341),(42,'3','Dr. Ashish',NULL,'nskherbs@gmail.com','9940363093','2019-06-19 14:23:28',NULL,342),(45,'3','Ms. Rajul',NULL,'sales@jairadhesales.com','079-26423872-74','2019-06-19 14:23:28',NULL,343),(46,'3','Mr. Dinesh',NULL,'asia1.sales@grenera.com','9944997512','2019-06-19 14:23:28',NULL,344),(48,'3','Mr. Lakshman Perumal',NULL,'lakshman@milablifesciences.com','8050717400','2019-06-19 14:23:28',NULL,345),(49,'3','Mr. Liyakat Ali khan',NULL,'supherblifesciences@gmail.com','9902029911','2019-06-19 14:23:28',NULL,346),(50,'3','Mr. Mithra',NULL,'remezyshopping@gmail.com','8754172272','2019-06-19 14:23:28',NULL,347),(64,'3','',NULL,'','8048412343','2019-06-19 14:23:28',NULL,348),(67,'3','',NULL,'','4972709110','2019-06-19 14:23:28',NULL,349),(71,'3','',NULL,'','044-40927310','2019-06-19 14:23:28',NULL,350),(72,'3','',NULL,'','918239052000','2019-06-19 14:23:28',NULL,351),(84,'3','',NULL,'','4023077331','2019-06-19 14:23:28',NULL,352),(88,'3','',NULL,'','8022795657','2019-06-19 14:23:28',NULL,353),(91,'3','',NULL,'','8042957097','2019-06-19 14:23:28',NULL,354),(94,'3','',NULL,'','8042554924','2019-06-19 14:23:28',NULL,355),(106,'3','',NULL,'','8023253578','2019-06-19 14:23:28',NULL,356),(107,'3','',NULL,'','022-42128600 ','2019-06-19 14:23:28',NULL,357),(110,'3','',NULL,'','8060505048','2019-06-19 14:23:28',NULL,358),(113,'3','',NULL,'','8382220813','2019-06-19 14:23:28',NULL,359),(119,'3','',NULL,'','912613060735','2019-06-19 14:23:28',NULL,360),(122,'3','',NULL,'','4032569934','2019-06-19 14:23:28',NULL,361),(127,'3','',NULL,'','8028397973','2019-06-19 14:23:28',NULL,362),(130,'3','',NULL,'','2266139999','2019-06-19 14:23:28',NULL,363),(136,'3','',NULL,'','911356608000','2019-06-19 14:23:28',NULL,364),(12,'4','V Praveen Reddy',NULL,'marvenbiochem@gmail.com','9502484494','2019-06-19 14:23:37',NULL,365),(13,'4','HEMANGI',NULL,'accounts@parth-international.co.in','022-24156162','2019-06-19 14:23:37',NULL,366),(15,'4','RK Nair',NULL,'rk@greenleafextractions.com','8893250040','2019-06-19 14:23:37',NULL,367),(16,'4','M Abubucker',NULL,'contactus@newtrimed.com','9884450645','2019-06-19 14:23:37',NULL,368),(24,'4','Mr. Ramesh',NULL,'info@nutreenest.in','8073617798','2019-06-19 14:23:37',NULL,369),(37,'4','ANAND',NULL,'anand@hillgreen.com','22250717','2019-06-19 14:23:37',NULL,370),(39,'4','Ms. Padmavathy',NULL,'padmavathy@symbiogenerics.com','044-25324300','2019-06-19 14:23:37',NULL,371),(42,'4','Ms. Malar',NULL,'nskherbs@gmail.com','044-42021196','2019-06-19 14:23:37',NULL,372),(46,'4','Mr.Devanderan',NULL,'accounts@grenera.com','9944997526','2019-06-19 14:23:37',NULL,373),(48,'4','Mr. Rajesh Iyer',NULL,'rajeshiyer@mavenilab.com','9945677665','2019-06-19 14:23:37',NULL,374),(185,'1','First','undefined','email@director.com','7896541230','2019-06-24 13:09:42',NULL,375),(185,'2','','','','','2019-06-24 13:09:42',NULL,376),(185,'3','','','','','2019-06-24 13:09:42',NULL,377),(185,'4','','','','','2019-06-24 13:09:42',NULL,378),(185,'4','','','','','2019-06-24 13:09:42',NULL,379),(187,'4','first name 1','last name 1','accounts@example.com','7894561230','2019-12-23 00:00:00',NULL,380),(187,'2','first name 1','last name 1','purchase@example.com','7894561230','2019-12-23 00:00:00',NULL,381);
/*!40000 ALTER TABLE `user_contacts_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cron_email`
--

DROP TABLE IF EXISTS `user_cron_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cron_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reference_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `reference_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cron_email`
--

LOCK TABLES `user_cron_email` WRITE;
/*!40000 ALTER TABLE `user_cron_email` DISABLE KEYS */;
INSERT INTO `user_cron_email` VALUES (1,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'NBT2019122001'),(2,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'NBT2019122001'),(3,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'1'),(4,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'NBT2019122001'),(5,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'NBT2019122001'),(6,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2019-12-23',NULL,'NBT2019122001'),(7,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(8,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(9,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'2'),(10,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(11,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-01-07',NULL,'1'),(12,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(13,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(14,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-01-07',NULL,'NBT2019122001'),(15,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(16,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-07',NULL,'NBT2019122001'),(17,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-01-07',NULL,'NBT2019122001'),(18,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-14',NULL,'1'),(19,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-01-14',NULL,'NBT2019122001'),(20,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-02-03',NULL,'3'),(21,1,'SAMPLE_INQUIRY_DELIVERED','PENDING','2020-02-03',NULL,'3'),(22,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-02-05',NULL,'4'),(23,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-02-05',NULL,'4'),(24,1,'SAMPLE_INQUIRY_DISPATCH','PENDING','2020-02-05',NULL,'4');
/*!40000 ALTER TABLE `user_cron_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback_query`
--

DROP TABLE IF EXISTS `user_feedback_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feedback_query` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `response` varchar(2000) DEFAULT NULL,
  `responder` int(11) DEFAULT NULL,
  `responce_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback_query`
--

LOCK TABLES `user_feedback_query` WRITE;
/*!40000 ALTER TABLE `user_feedback_query` DISABLE KEYS */;
INSERT INTO `user_feedback_query` VALUES (1,21,1,'this is query','PENDING','',1,'2019-06-24 14:27:20','2019-06-20 12:11:10',NULL);
/*!40000 ALTER TABLE `user_feedback_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback_query_response`
--

DROP TABLE IF EXISTS `user_feedback_query_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feedback_query_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_feedback_id` int(11) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `response` varchar(2000) DEFAULT NULL,
  `response_date` datetime DEFAULT current_timestamp(),
  `resonder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback_query_response`
--

LOCK TABLES `user_feedback_query_response` WRITE;
/*!40000 ALTER TABLE `user_feedback_query_response` DISABLE KEYS */;
INSERT INTO `user_feedback_query_response` VALUES (1,1,'','PENDING','tezt','2019-06-24 14:41:26',1);
/*!40000 ALTER TABLE `user_feedback_query_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback_query_type_master`
--

DROP TABLE IF EXISTS `user_feedback_query_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feedback_query_type_master` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback_query_type_master`
--

LOCK TABLES `user_feedback_query_type_master` WRITE;
/*!40000 ALTER TABLE `user_feedback_query_type_master` DISABLE KEYS */;
INSERT INTO `user_feedback_query_type_master` VALUES (1,'QUERY','2018-12-15 12:49:07',NULL),(2,'FEEDBACK','2018-12-15 12:49:24',NULL);
/*!40000 ALTER TABLE `user_feedback_query_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,'Admin','Y','2018-11-15 17:30:54',NULL),(2,'Sales Executive','Y','2018-12-06 10:19:12',NULL),(3,'Customer','Y','2018-12-06 10:19:27',NULL);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_map`
--

DROP TABLE IF EXISTS `user_group_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_map` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_map`
--

LOCK TABLES `user_group_map` WRITE;
/*!40000 ALTER TABLE `user_group_map` DISABLE KEYS */;
INSERT INTO `user_group_map` VALUES (1,1,'2018-11-15 17:31:19',NULL);
/*!40000 ALTER TABLE `user_group_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inquiry_product_detail`
--

DROP TABLE IF EXISTS `user_inquiry_product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_inquiry_product_detail` (
  `inquiry_no` varchar(100) NOT NULL,
  `product_code` varchar(45) DEFAULT NULL,
  `qunatity` int(11) DEFAULT NULL,
  `quantity_unit` int(11) DEFAULT NULL,
  `shipping_id` int(11) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`inquiry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inquiry_product_detail`
--

LOCK TABLES `user_inquiry_product_detail` WRITE;
/*!40000 ALTER TABLE `user_inquiry_product_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inquiry_product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_master` (
  `Id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `father_first_name` varchar(20) DEFAULT NULL,
  `father_last_name` varchar(20) DEFAULT NULL,
  `mother_first_name` varchar(20) DEFAULT NULL,
  `mother_last_name` varchar(20) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `city_code` varchar(10) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `cin_no` varchar(45) DEFAULT NULL,
  `gst_no` varchar(45) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `qualification` int(11) DEFAULT NULL,
  `dsignation` varchar(45) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ssi_regn_no` varchar(45) DEFAULT NULL,
  `joined_by` int(11) DEFAULT NULL,
  `user_master_type` int(11) NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `tera_teri` int(11) DEFAULT NULL,
  `offical_email` varchar(45) DEFAULT NULL,
  `offical_mobile` varchar(45) DEFAULT NULL,
  `executive_type` varchar(45) DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `se_joining_date` varchar(20) DEFAULT NULL,
  `monthly_target` int(20) DEFAULT NULL,
  `user_master_type_code` varchar(20) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_User_master_Gender_idx` (`gender`),
  KEY `fk_User_master_Qualification1_idx` (`qualification`),
  KEY `fk_User_master_City1_idx` (`city_code`),
  CONSTRAINT `fk_User_master_Gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_master_Qualification1` FOREIGN KEY (`qualification`) REFERENCES `qualification` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,'Pragya','Devi',NULL,NULL,NULL,NULL,'pragyad@appodeepo.com','9568419300','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-19 14:12:11',NULL,NULL,NULL,NULL),(2,'Shekhar','Chaturvedi',NULL,NULL,NULL,NULL,'shekhar@naturabt.com','9341045805','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-19 14:12:20',NULL,NULL,NULL,NULL),(3,'Pankaj','Varshney',NULL,NULL,NULL,NULL,'pankaj@naturabt.com','9166663045','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-19 14:12:30',NULL,NULL,NULL,NULL),(4,'Rajesh','Singh',NULL,NULL,NULL,NULL,'rajesh@appodeepo.com','9686451459','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-19 14:12:53',NULL,NULL,NULL,NULL),(5,'Suresh','Kumar',NULL,NULL,NULL,NULL,'suresh@naturabt.com','9902295788','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,1,'suresh@naturabt.com','7625097616','FULL','N',NULL,'2019-06-19 14:16:30','02/11/2016',2500000,NULL,NULL),(6,'Guruprasad','B.A',NULL,NULL,NULL,NULL,'guruprasad@naturabt.com','7625097617','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-24 00:00:00',NULL,2,2,NULL,1,'guruprasad@naturabt.com','7625097617','FULL','Y',NULL,'2019-06-19 14:16:30','06/08/2018',4000000,NULL,1),(7,'Harsh','Varshney',NULL,NULL,NULL,NULL,'sales2@naturabt.com','6397625464','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,2,2,NULL,2,'sales2@naturabt.com','6397625464','FULL','Y',NULL,'2019-06-19 14:16:30','01/04/2018',1500000,NULL,1),(8,'Praneet','Varshney',NULL,NULL,NULL,NULL,'sales1@naturabt.com','9316281031','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,2,2,NULL,2,'sales1@naturabt.com','9316281031','FULL','Y',NULL,'2019-06-19 14:16:30','08/07/2018',3300000,NULL,1),(9,'Rajesh','Thavi',NULL,NULL,NULL,NULL,'rt@naturabt.com','9833875404','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,2,2,NULL,1,'rt@naturabt.com','9833875404','FULL','Y',NULL,'2019-06-19 14:16:30','01/04/2018',3000000,NULL,1),(10,'Prajna','S',NULL,NULL,NULL,NULL,'sales3@naturabt.com','9591941004','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,2,2,NULL,1,'sales3@naturabt.com','9591941004','PART','Y',NULL,'2019-06-19 14:16:30','18/06/2018',0,NULL,1),(11,'Naveeneeswarudu','Vinayakula',NULL,NULL,NULL,NULL,'naveen@naturabt.com','9742477468','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,2,2,NULL,1,'naveen@naturabt.com','9742477468','COMMISION','Y',NULL,'2019-06-19 14:16:30','',1000000,NULL,1),(12,'Company','Company',NULL,NULL,NULL,NULL,'venkat@marvenbiochem.in','7995877161','4460',509338,'Survey  96/A, Village Udimeshwaram, Kodangal mandal, Mahabubnagar dist, Telangana, India - 509338.  ',NULL,'AIJPR5273K','U85320TG2018PTC125727','36AIJPR5273K1ZN',NULL,NULL,NULL,NULL,'',2,1,'Marven Biochem Private Ltd',NULL,NULL,'7995877161',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(13,'Company','Company',NULL,NULL,NULL,NULL,'urmil@parthphytoextracts.com','9821156162','707',400014,'708,B,7TH FLOOR, ADARSH CHS SOCIETY,G D AMBEKAR MARG,NEXT TO SPRING MILLS DADAR',NULL,'AAOFP6420H','U17110GJ2005PTC047202','27AAOFP6420H1Z1',NULL,NULL,NULL,NULL,'',2,1,'Parth International  Pvt Ltd',NULL,NULL,'022-24156162',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(14,'Company','Company',NULL,NULL,NULL,NULL,'bhat@karlegroup.com','9900014078','707',560064,'KARLE GROUP OF COMPANIES  No. 23/4  NH 7 , Venkatala , Yelahanka , Bangalore - 560 064',NULL,'AABCC0047R','U85110KA1998PTC024210','29AABCC0047R1ZD',NULL,NULL,NULL,NULL,'',2,1,'Cymbio Pharma Pvt ltd',NULL,NULL,'9900014078',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(15,'Company','Company',NULL,NULL,NULL,NULL,'sreelatha@greenleafextractions.com','8943334012','1930',683503,'Plot No: 15, KINFRA HI-TECH Park, Opp Co-operative Medical College, P.O, HMT Colony, North Kalamassery, Kochi, Kerala 683503',NULL,'AADCG7440E','U01133KL2010PTC025744','32AADCG7440E1Z0',NULL,NULL,NULL,NULL,'',2,1,'Greenleaf extractions Pvt Ltd',NULL,NULL,'0484-2986092',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(16,'Company','Company',NULL,NULL,NULL,NULL,'contactus@newtrimed.com','97902 44188','3659',600041,'Plot No: 72 & 73, Judges Colony, Nehru Nagar, Kottivakkam (OMR)',NULL,'AAFCN2874H','U36999TN2016PTC111358','33AAFCN2874H1ZF',NULL,NULL,NULL,NULL,'',2,1,'Newtrimed HealthCare Pvt Ltd',NULL,NULL,'044 4261 8866',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(17,'Company','Company',NULL,NULL,NULL,NULL,'info@jkagri.com','6281303428','4460',500016,'1-10-1774, 4th Floor, Varun Towers ,  Begumpet , Hyderabad - 500016',NULL,'AAACF7629R','L01400WB2000PLC091286','36AAACF7629R1ZY',NULL,NULL,NULL,NULL,'',2,1,'JK Agri Genetics Ltd',NULL,NULL,'6281303428',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(18,'Company','Company',NULL,NULL,NULL,NULL,'harish@jkmail.com','9182562739','4489',502319,'Phase IV ,  Admin Block,  Plot No. 4 & 22,  Industrial Development Area, Patancheru Sanga Reddy Dist.,  Telangana',NULL,'AAJCP5100A','U01820DL2017PTC325611','36AAJCP5100A1Z0',NULL,NULL,NULL,NULL,'',2,1,'PSV Agro Products  Pvt Ltd',NULL,NULL,'9182562739',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(19,'Company','Company',NULL,NULL,NULL,NULL,'info@naturalholistics.co.in','9901036573','707',560037,'No. 24,  Shop No. 5, Kaveri Street, Shell Petrol Bank, Basavanagar Main Road, Bangalore - 560 037',NULL,'ATPPK8129G','NOT APPLICABLE','29ATPPK8129G1Z5',NULL,NULL,NULL,NULL,'',2,1,'Natural Holistics ',NULL,NULL,'080 - 49526176',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(20,'Company','Company',NULL,NULL,NULL,NULL,'ssk@sskphytotech.com','9926359711','2229',452011,'D-68,  2nd Floor, MIG Shopping Complex,  Opp. Dainik Bhaskar,  AB Road, Indore Madhyapradesh - 452 011',NULL,'ALKPM9594L','NOT APPLICABLE','23ALKPM9594L1ZA',NULL,NULL,NULL,NULL,'',2,1,'SSK Phytotech',NULL,NULL,'0731-2560994',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(21,'Company','Company',NULL,NULL,NULL,NULL,'indianherbals@rediffmail.com','6362059887','1750',570012,'No. 45/A , Temple Road, Second cross, Jayalakshmipuram , Mysore - 570012 ',NULL,'ABKPA6692B','NOT APPLICABLE','29ABKPA6692B1ZN',NULL,NULL,NULL,NULL,'',2,1,'Chaithanya Agro Herbals ',NULL,NULL,'0821-2515744',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(22,'Company','Company',NULL,NULL,NULL,NULL,'mdbiovitamins@rediffmail.com','9342025651','707',562112,'No. 347 - C , 2nd Phase, Harohalli Industrial Area,  Kanakapura Taluk, Ramangara Dist., 562 112',NULL,'AACCB0324K','U24234KA2002PTC030453','29AACCB0324K1ZV',NULL,NULL,NULL,NULL,'',2,1,'Biovitamins Private Ltd',NULL,NULL,'080-26772224',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(23,'Company','Company',NULL,NULL,NULL,NULL,'info@plantlipids.com','9745054462','1930',682311,'Plant Lipids P Ltd., - Kadayiruppu Post ,  Kolencherry ,  Cochin - Kerala 682 311',NULL,'AABCP6061C','U15495KL1979TC003044','32AABCP6061C1ZY',NULL,NULL,NULL,NULL,'',2,1,'Plant Lipids P Ltd',NULL,NULL,'0484-3051500',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(24,'Company','Company',NULL,NULL,NULL,NULL,'marketing.nutreenest@gmail.com','8073617798','707',560021,'No. 4191 ,  12th Main, Subramanya Nagar, Rajaji Nagar Iind Stage ,  Bangalore - 560 021 ',NULL,'AAOFN1853E','NOT APPLICABLE','29AAOFN1853E1Z2',NULL,NULL,NULL,NULL,'',2,1,'Nu Tree Nest Extract',NULL,NULL,'9972012599',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(25,'Company','Company',NULL,NULL,NULL,NULL,'info@rclab.org','9986597088','1678',563101,'Rank Chem Lab ,  Plot No : V - 16,  KSSIDC Industrial Estate , Tamaka , Kolar - 563 101 ',NULL,'AASFR1752L','NOT APPLICABLE','29AASFR1752L2ZG',NULL,NULL,NULL,NULL,'',2,1,'Rank Chem Lab',NULL,NULL,'08152-210045',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(26,'Company','Company',NULL,NULL,NULL,NULL,'bpm@varshagroup.com','080-23157183','707',560010,'No. 18, 40 Feet Road, Manjunathanagar 1st Stage, 2nd Phase, 1st Stage, 2nd Phase, West of Chord Road, Bengaluru - 560010',NULL,'AAMPN5670K','NOT APPLICABLE','29AAMPN5670K1ZZ',NULL,NULL,NULL,NULL,'',2,1,'Varsha Multitech',NULL,NULL,'080-23157183',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(27,'Company','Company',NULL,NULL,NULL,NULL,'companysecretary@keralaayurveda.biz','8012142473','707',560038,'3282 12th Main Road HAL 2nd Stage Indiranagar Bengaluru',NULL,'AABCK4228Q','L24233KL1992PLC006582','29AABCK4228Q1Z0',NULL,NULL,NULL,NULL,'',2,1,'Kerala ayurveda Limited',NULL,NULL,'080-23086400',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(28,'Company','Company',NULL,NULL,NULL,NULL,'companysecretary@keralaayurveda.biz','9562508399','1892',683585,'VII  / 415 ,  Nedumbasery ,  Athani ,  P.O. Aluva , Ernakulam ',NULL,'AABCK4228Q','L24233KL1992PLC006592','32AABCK4228Q2ZC',NULL,NULL,NULL,NULL,'',2,1,'Kerala ayurveda Limited ',NULL,NULL,'4312457696',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(29,'Company','Company',NULL,NULL,NULL,NULL,'sebastian@biomedingredients.com','8547663323','733',403806,'No. 21, Ranghavi Estate , Issorcim, Bogmallo Beach Road, Dabolim, Vasco, Goa - 403806',NULL,'AAGCB7768R','U51909GA2016PTC012926','30AAGCB7768R1Z0',NULL,NULL,NULL,NULL,'',2,1,'Biomed Ingredients Pvt Ltd',NULL,NULL,'8806668458',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(30,'Company','Company',NULL,NULL,NULL,NULL,'raja@sunglowpharma.com','9677839996','707',605009,'sunglow pharmaceuticals P Ltd., RS No. 29-36, Opp. To Ponlait, Kurumbapet, Puducherry - 605 009',NULL,'AANCS8501Q','U24232PY2010PTC002407','34AANCS8501Q1ZP',NULL,NULL,NULL,NULL,'',2,1,'sunglow pharmaceuticals P Ltd',NULL,NULL,'0413-2277313',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(31,'Company','Company',NULL,NULL,NULL,NULL,'asojmumbai@rediffmail.com','8980808776','1068',391510,'Asoj Soft Caps Pvt Ltd., Village - Asoj ,  Baroda - Halol Highway , Baroda - 391 510',NULL,'AACA4046P','U24110MH1981PTC024872','24AACA4046P1ZN',NULL,NULL,NULL,NULL,'',2,1,'Asoj Soft Caps Pvt Ltd',NULL,NULL,'02668 - 281177',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(32,'Company','Company',NULL,NULL,NULL,NULL,'srbiofuturelabs.com','9840625078','3912',625020,'Plot No. 6,7,8, First Floor, Azhagiyasingam nagar, Vandiyur, Madurai - 625020',NULL,'AAPFB7551C','NOT APPLICABLE','33AAPFB7551C1ZL',NULL,NULL,NULL,NULL,'',2,1,'Bio Nutrients',NULL,NULL,'9787700925',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(33,'Company','Company',NULL,NULL,NULL,NULL,'easternherbals@gmail.com','9446347668','2064',676123,'Eastern Herbals Pvt Ltd , P,O. Thiruvalli, Wandoor Malappuram Dt. Kerala 676123',NULL,'AABCE3755A','NOT APPLICABLE','32AABCE3755A1ZA',NULL,NULL,NULL,NULL,'',2,1,'Eastern Herbals',NULL,NULL,'4832720118',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(34,'Company','Company',NULL,NULL,NULL,NULL,'maruthibalki58@gmail.com','9444465938','707',603204,'MGR 2nd Street., Ganesh Nagar, OPP. Mahindra World City, Chettipunniyam, Kanchipuram Dt., 603204',NULL,'AAFCT3618R','U15490TN2015PTC100249','33AAFCT3618R1ZW',NULL,NULL,NULL,NULL,'',2,1,'Thirumaruti Foods Pvt Ltd',NULL,NULL,'9444465938',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(35,'Company','Company',NULL,NULL,NULL,NULL,'minakshi@vyomchem.com','7018241544','1264',173205,'Shop No. 03 Guru Nanak Market Near Big Bazar Chakkan Road Baddi Distt. solan',NULL,'AANFV5285F','NOT APPLICABLE','02AANFV5285F1ZZ',NULL,NULL,NULL,NULL,'',2,1,'VYOMCHEM SPECIALITIES',NULL,NULL,'8699090609',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(36,'Company','Company',NULL,NULL,NULL,NULL,'arvind.seshu@gmail.com','9845868765','3659',600083,'Elless Aromatics  ,  G-5, 55th Street, Ashok Nagar, Chennai - 600083, ',NULL,'ACKPL4896M','NOT APPLICABLE','33ACKPL4896M1ZW',NULL,NULL,NULL,NULL,'',2,1,'Elless Aromatics',NULL,NULL,'9845868765',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(37,'Company','Company',NULL,NULL,NULL,NULL,'karthik@hillgreen.com','9845122446','707',560052,'Hill Green  ,  No. 17,  13th Cross Vasanth Nagar East,  Bangalore - 560 052',NULL,'AABCH0662D','U24239KA2002PTC030478','29AABCH0662D1ZW',NULL,NULL,NULL,NULL,'',2,1,'ill Green Herbals Pvt Ltd',NULL,NULL,'080-2225 0717',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(38,'Company','Company',NULL,NULL,NULL,NULL,'shafi@massherbals.com','9341263155','707',562127,'No. 100/1, Lekkenahalli Village ,  Solur Hobli, Magadi Taluk, Ramanagara Dt., Bangalore - 562127',NULL,'AAHFG3421G','NOT APPLICABLE','29AAHGF3421G1ZK',NULL,NULL,NULL,NULL,'',2,1,'Green Space',NULL,NULL,'9341263155',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(39,'Company','Company',NULL,NULL,NULL,NULL,'pradeep.kumar@coperniciumpharma.com','9880035358','3659',600124,'Ground Floor , Wing A , DP 21, Sidco Indl. Estate , Thirumazhisai, Chennai 600124',NULL,'AAPCS9972B','U74990TN2011PTC080853','33AAPCS9972B2ZY',NULL,NULL,NULL,NULL,'',2,1,'Symbio Generrics India Pvt Ltd',NULL,NULL,'044-25324300',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(40,'Company','Company',NULL,NULL,NULL,NULL,'deepak@dnaayurveda.in','9841382261','3659',600017,'No. 8/34, Neelakanta Mirtha Street,  T. Nagar, Chennai - 600 017. ',NULL,'AAFCD9452P','U74999TN2016PTC113760','33AAFCD9452P1Z4',NULL,NULL,NULL,NULL,'',2,1,'Dhanvantari Nano Ayushadi P Ltd',NULL,NULL,'044-40927300',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(41,'Company','Company',NULL,NULL,NULL,NULL,'deeptalabs@gmail.com','9886648291','1750',570008,'No. 77-78/1, Industrial Suburb, 2nd Stage , Visweswaranagar, Mysore - 570 008',NULL,'AAJFD8252E','NOT APPLICABLE','29AAJFD8252E1ZA',NULL,NULL,NULL,NULL,'',2,1,'Deepta Laboratories',NULL,NULL,'9886648291',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(42,'Company','Company',NULL,NULL,NULL,NULL,'nskherbs@gmail.com','9940363093','3659',600001,'No. 59, Govindappa Naicken Street, Chennai - 600001',NULL,'AAFPD4622A','NOT APPLICABLE','33AAFPD4622A1ZM',NULL,NULL,NULL,NULL,'',2,1,'N Shobha Kant & Co',NULL,NULL,'044-42021196',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(43,'Company','Company',NULL,NULL,NULL,NULL,'rm9888@gmail.com','8639719156','4460',81,'5th Floor, Radha Krishna pride, No. 269, St. No. 7, Kavuri Hills Road, Madhapur, Hyerabad Telangana 500081',NULL,'AAQCA0544G','U52601TG2017PTC119655','36AAQCA0544G1ZQ',NULL,NULL,NULL,NULL,'',2,1,'Ayushveda Innovations Pvt Ltd',NULL,NULL,'8639719156',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(44,'Company','Company',NULL,NULL,NULL,NULL,'kodurikiran@gmail.com','9652223399','4460',500072,'Plot No. 16, Vasanth Nagar, Near Nizampet X Road, Hyderabad : 500 072 Telangana',NULL,'AALFV2477M','NOT APPLICABLE','36AALFV2477M1ZF',NULL,NULL,NULL,NULL,'',2,1,'Vivin Agri Biomax',NULL,NULL,'9652223399',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(45,'Company','Company',NULL,NULL,NULL,NULL,'anair@jairadhesales.com','9925650031','783',380006,'No. 309, Harikrupa Tower, Near Old shardamandir Cross Road, Ellisbridge, Ahmedabad 380006',NULL,'AACFJ3905B','NOT APPLICABLE','24AACFJ3905B1Z1',NULL,NULL,NULL,NULL,'',2,1,'Jai Radhe Sales',NULL,NULL,'079-26423872-74',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(46,'Company','Company',NULL,NULL,NULL,NULL,'purchase@grenera.com','9952111014','3714',638115,'37 B PUTHUPALAYAM, AVALPOONDURAI, ERODE 638115',NULL,'AADCG6719J','U15497TZ2010PTC015816','33AADCG6719J1ZJ',NULL,NULL,NULL,NULL,'',2,1,'GRENERA NUTRIENTS PVT LTD',NULL,NULL,'0424-2283846',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(47,'Company','Company',NULL,NULL,NULL,NULL,'contactus@newtrimed.com','9489954109','3659',600041,'Plot No. 72-73, 7th Link Street ,  Judges Colony,  Nehru Nagar, Kottivakkam, Chennai - 600041',NULL,'AAFCN2874H','U36999TN2016PTC111358','33AFCN2874H1ZF',NULL,NULL,NULL,NULL,'',2,1,'Newtrimed HealthCare Pvt Ltd',NULL,NULL,'044-42618886',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(48,'Company','Company',NULL,NULL,NULL,NULL,'lakshman@milablifesciences.com','9945677665','707',560043,'No. 10, 2nd Cross, 10th Main Road, Nandanam Colony, Horamavu Main Road, Bangalore 560043',NULL,'AAKCM2120J','U24230KA2010PTC055984','29AAKCM2120J1ZG',NULL,NULL,NULL,NULL,'',2,1,'MILab Lifesciences Pvt Ltd',NULL,NULL,'080-42001070',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(49,'Company','Company',NULL,NULL,NULL,NULL,'supherblifesciences@gmail.com','9902029911','707',560041,'16/472, 1st Floor, 11th Main, 33rd Cross, 4th T Block, Jayanagar , Bangalore 560041',NULL,'AAHFS1628Q','NOT APPLICABLE','29AAHFS1628Q1ZC',NULL,NULL,NULL,NULL,'',2,1,'supherb lifesciences',NULL,NULL,'9902029911',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(50,'Company','Company',NULL,NULL,NULL,NULL,'remezyshopping@gmail.com','8754172272','707',605010,'70A, First Cross, Kamalam Nagar, Jayanagar, Reddiyar Palayam, Pondicherry - 605 010',NULL,'AAVFR1799N','NOT APPLICABLE','34AAVFR1799N1Z4',NULL,NULL,NULL,NULL,'',2,1,'Remezy Lifesciences',NULL,NULL,'8754172272',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(51,'Company','Company',NULL,NULL,NULL,NULL,'skc1234ca@gmail.com','9990432490','4759',201001,'Darshan Dabar, Sachkhand Nanak Dham , Loni,Indirapuri ,2  No. Ghaziabad - 201001',NULL,'AAPCA5203M','U74999DL2017PTC316959','09AAPCA5203M1ZD',NULL,NULL,NULL,NULL,'',2,1,'ABHIMANTRIT GURUPRASADAM AYURVEDA HERBAL FOOD PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(52,'Company','Company',NULL,NULL,NULL,NULL,'info@acumenindus.com','9575425619','2229',452016,'304, ANMOL TOWER, 15/2,OLD PALASIA GRATER KAILASH ROAD,INDORE',NULL,'AAXFA8257A','NA','23AAXFA8257A1ZE',NULL,NULL,NULL,NULL,'',2,1,'ACUMEN LIFE SCIENCES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(53,'Company','Company',NULL,NULL,NULL,NULL,'finance@aeonf.com','9500043686','707',605107,'R.S No 515/1, 515/2, 514 Vinayagarkoli Street,Thirubhuvanaipalayam, Mannadipet Commune,Puducherry-605 107',NULL,'AAHCA4128R','U33110TN2008PTC069867','34AAHCA4128R1ZC',NULL,NULL,NULL,NULL,'',2,1,'Aeon Formulations Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(54,'Company','Company',NULL,NULL,NULL,NULL,'director@agronremedies.com','9837050929','5283',244713,'Opp. Naveen Anaj Mandi, Sarverkhera Moradabad road, Kashipur  ',NULL,'AABCA7572K','U74899DL1985PTC021384','05AABCA7572K1ZJ',NULL,NULL,NULL,NULL,'',2,1,'Agron Remedies Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(55,'Company','Company',NULL,NULL,NULL,NULL,'alienterprises52@yahoo.in','9892428507','707',400072,'C-603 Ashok Vihar Society , Ashok nagar off military road Andheri East   ',NULL,'AVMPS7406F','NA','27AVMPS7406F1Z8',NULL,NULL,NULL,NULL,'',2,1,'Ali Enterprises',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(56,'Company','Company',NULL,NULL,NULL,NULL,'info@allseasonsherbs.com','73533440','707',560067,'No 07& 8 Pride Orchid,Tubrahalli Village, Via Marathahalli,Varthur Road, Bangalore -560067',NULL,'AAECA1253A','U24233KA2002PTC030389','29AAECA1253A1Z9',NULL,NULL,NULL,NULL,'',2,1,'ALL SEASON HERBS PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(57,'Company','Company',NULL,NULL,NULL,NULL,'amarpharma107@gmail.com','7830456756','4999',251002,'555, South Civil Lines,Meerut Road, Muzaffarnagar',NULL,'ACDPG4025A','NA','9ACDPG4025A1ZB',NULL,NULL,NULL,NULL,'',2,1,'AMAR PHARMACEUTICALS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(58,'Company','Company',NULL,NULL,NULL,NULL,'vikas1185@gmail.com','8952955651','3378',302013,'B-237D, Road No-6-D, VKI Area,Jaipur-302013',NULL,'BRLPK7579M','NA','08BRLPK7579M1ZR',NULL,NULL,NULL,NULL,'',2,1,'AnkitFormulation',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(59,'Company','Company',NULL,NULL,NULL,NULL,'accounts@apolloingredients.com','7303420004','2739',401208,'A1/6,Nalanda, Mittal Enclave, Sector-2, Naigaon ,Dist: Palghar - 401208',NULL,'AABCO3946P','U24232MH2010PTC210747','27AABCO3946P1ZV',NULL,NULL,NULL,NULL,'',2,1,'APOLLO INGREDIENTS INDIA PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(60,'Company','Company',NULL,NULL,NULL,NULL,'mail@arjunanatural.com','9745752456','1925',683502,'INDUSTRIAL DEVELOPMENT AREA BINANIPURAM P.O EDAYAR-   KERALA',NULL,'AACCA8648K','U24239KL1992PLC006670 ','32AACCA8648K1ZI',NULL,NULL,NULL,NULL,'',2,1,'Arjuna Natural Limited',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(61,'Company','Company',NULL,NULL,NULL,NULL,'accounts@ayurvitaindia.com','9407655966','707',476001,'Krishna Plot No 287-307,Rsc-27,Gorai 2 ,Behind Maxus Mall Off Dr.Babasaheb Ambedka,Marg Borivali West Mumbai',NULL,'AAICA1116E','U36900MH2009PTC198042','27AAICA1116E1Z7',NULL,NULL,NULL,NULL,'',2,1,'Ayurvita Health Care Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(62,'Company','Company',NULL,NULL,NULL,NULL,'bhavichem@gmail.com','9820689620','707',400020,'76/5, Panchasar Building ,Grd Floor  F  Road Marine,Drive Mumbai',NULL,'AAEFB3019J','NA','27AAEFB3019J1ZN',NULL,NULL,NULL,NULL,'',2,1,'Bhavi Chem',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(63,'Company','Company',NULL,NULL,NULL,NULL,'accountsptjco@yahoo.com','9539070686','1930',682020,'No .253.Anugriha,14th Cross Road Girinagar,Kadavanthra Cochin -682020',NULL,'AACCB9714B','U74999KL2006PTC019802','32AACCB9714B1Z7',NULL,NULL,NULL,NULL,'',2,1,'Bhoomi Natural Products& Exports Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(64,'Company','Company',NULL,NULL,NULL,NULL,'sales@bioextract.co.in','9611877217','707',560048,'SM 62, NGEF Ancilliary industrial estate, Next to Bhuruka gases, Mahadevapura post Bengaluru (Bangalore)',NULL,'AAIFB0803A','NA','29AAIFB0803A1Z4',NULL,NULL,NULL,NULL,'',2,1,'Bioecxtract',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(65,'Company','Company',NULL,NULL,NULL,NULL,'dr.ravi@blissayurveda.com','9711133683','706',110092,'136, Surya Niketan, New Delhi-92, India',NULL,'AACCB8806A','U24233DL2006PTC149579','07AACCB8806A1Z3',NULL,NULL,NULL,NULL,'',2,1,'Bliss Ayurveda Pvt Ltd',NULL,NULL,'0120-2323420',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(66,'Company','Company',NULL,NULL,NULL,NULL,'info@calixherbal.com','9997146786','5252',201301,'C-261, Sector-63, Noida-201301',NULL,'','','U24232UP1997PLC022215',NULL,NULL,NULL,NULL,'',2,1,'Calix Herbal Ltd',NULL,NULL,'0120-4287220',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(67,'Company','Company',NULL,NULL,NULL,NULL,'manojkmadhav@biovedanaturals.com','8113028889','1668',670001,'TK 426, Z13, 1ST FLOOR,K P PLAZA, PARAKKANDY KANNUR,KERALA -670001',NULL,'AAOFB1086F','NA','32AAOFB1086F1ZO',NULL,NULL,NULL,NULL,'',2,1,'BIOVEDA NATURALS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(68,'Company','Company',NULL,NULL,NULL,NULL,'capl1@rediffmail.com','9927530189','707',243502,'PLOT NO: B-52-53, PARSAKHERA,INDUSTRIAL ESTATE, BAREILLY',NULL,'AAACC7357B','U41000KA1994PTC015420','09AAACC7357B1ZU',NULL,NULL,NULL,NULL,'',2,1,'CAUVERY AQUA PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(69,'Company','Company',NULL,NULL,NULL,NULL,'crt1968@yahoo.co.in','9323624162','707',401107,'79,1st Floor,Surya Shopping Centre,Srishati Comple,Mira Road (E) ,Thane Mumbai',NULL,'AADCC5940P','U24239MH2008PTC189135','27AADCC5940P1Z7',NULL,NULL,NULL,NULL,'',2,1,'Cell Life Therapeutics Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(70,'Company','Company',NULL,NULL,NULL,NULL,'purchase.hwr@deltaspharma.com','8392945530','5252',249401,'F-52 ,Old Industrial area,Haridwar-249401',NULL,'ACHPB2295H','NA','05ACHPB2295H1ZU',NULL,NULL,NULL,NULL,'',2,1,'Deltas Pharma',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:41',NULL,NULL,NULL,NULL),(71,'Company','Company',NULL,NULL,NULL,NULL,'vsp@nutraforlife.com','9841382261','3659',600017,'No. 8/34, Neelakanta Mehta Street, T. Nagar, Chennai - 600017',NULL,'AAFCD9452P','U74999TN2016PTC113760 ','33AAFCD9452P1Z4',NULL,NULL,NULL,NULL,'',2,1,'Dhanvantari Nano Ayushadi Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(72,'Company','Company',NULL,NULL,NULL,NULL,'INFO@botanosys.com','9828154500','707',334001,'Old Bikaner Wollen press building Rani Bazar Bikaner',NULL,'AAECM1703F','U17117RJ2005PTC020295','08AAECM1703F1ZW',NULL,NULL,NULL,NULL,'',2,1,'Dolcas Botanosys',NULL,NULL,'8239052000',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(73,'Company','Company',NULL,NULL,NULL,NULL,'elizence@yahoo.com','9810887781','1192',110063,'PLOT NO.1068/12, ROHTAK ROAD, GOHANA,Haryana',NULL,'AAACK3898D','U85110DL1976PLC008434','06AAACK3898D1ZI',NULL,NULL,NULL,NULL,'',2,1,'ELIZENCE LIFE CARE LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(74,'Company','Company',NULL,NULL,NULL,NULL,'energeiapurchase@gmail.com','9886792692','707',560077,'58, AYYAPPA TEMPLE STREET, BYRATHI,DODDAGUBBI POST,BANGALORE -560077',NULL,'AADCE5251D','U24239KA2010PTC052152','29AADCE5251D1ZU',NULL,NULL,NULL,NULL,'',2,1,'ENERGEIA LIFE SCIENCES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(75,'Company','Company',NULL,NULL,NULL,NULL,'vk.tripathi@yahoo.com','9811307341','1126',122001,'1134,HUDA, Sector -10A,Gurgaon -122001',NULL,'AADFF0578P','NA','06AADFF0578P1Z2',NULL,NULL,NULL,NULL,'',2,1,'FITOCHEM LABORATORIES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(76,'Company','Company',NULL,NULL,NULL,NULL,'info@flavourtrove.com','9916093012','707',560099,'B41/A Veerasandra,Industrial Estate Hosur road',NULL,'AGWPA0950D','NA','29AGWPA0950D1ZG',NULL,NULL,NULL,NULL,'',2,1,'Flavour Trove',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(77,'Company','Company',NULL,NULL,NULL,NULL,'snehal@fullife.co.in','989216739','1264',174103,'C/o Maneesh Pharmaceuticals Ltd,Khasra No.337-340,Village Balyana , Purgana Doon,Tehsil Kasouli Baddi Dist Solan,Baddi :174103',NULL,'AABCF4825G','U24232MH2010PTC199429','02AABCF4825G1Z3',NULL,NULL,NULL,NULL,'',2,1,'Fullife Health Care Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(78,'Company','Company',NULL,NULL,NULL,NULL,'rahulmarwal@grherbals.com','7312884422','2229',452004,'45 , Manik Chowk , Imli Bazaar ,   Near Rajwada, Indore - 452004 ( M.P.)',NULL,'ARRPM5120F','U24304MP2018PTC046077','23ARRPM5120F1ZY',NULL,NULL,NULL,NULL,'',2,1,'G R HERBALS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(79,'Company','Company',NULL,NULL,NULL,NULL,'srishanthas@gmail.com','9491042865','3659',600051,'NO.148 FIRST FLLOR WEST FACING,VEDHNDHA MURUGAPPA SALAI MAINR OAD SALAVOYALCHENNAI -600051',NULL,'DXIPS4170R','','33DXIPS4170R1ZO',NULL,NULL,NULL,NULL,'',2,1,'Genetics Life Sciences',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(80,'Company','Company',NULL,NULL,NULL,NULL,'sharkeyecreations@gmail.com','9871727573','706',110020,'C-86, Pocket -C, Okhla Industrial Area,Phase-1, Delhi -110020',NULL,'AAECH4409F','U74999DL2018PTC329638','07AAECH4409F1ZU',NULL,NULL,NULL,NULL,'',2,1,'Herbalfarm Lifecare Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(81,'Company','Company',NULL,NULL,NULL,NULL,'mismaeelkhan@gmail.com','9654049533','706',110034,'WZ-678 GF Shri Nagar Gali No-2,Near Mahendra Park Rani Bagh,New Delhi -110034',NULL,'AACCH8822L','U36990DL2012PTC233519','07AACCH8822L1ZA',NULL,NULL,NULL,NULL,'',2,1,'Herboveda Health Care Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(82,'Company','Company',NULL,NULL,NULL,NULL,'hbl_finance@yahoo.com','8071869187','706',173205,'Baddi Nalaghar road,Nichli Sandoli Baddi,Himachal Pradesh 173205',NULL,'AABCH1876K','U24233CH2001PLC024356','AABCH1876K',NULL,NULL,NULL,NULL,'',2,1,'Health Biotech Ltd',NULL,NULL,'8071869187',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(83,'Company','Company',NULL,NULL,NULL,NULL,'kumarrajinder@yahoo.com','9811255317','706',110091,'322, 3rd Floor, Vishal Tower Janak Puri, Distt. Centre, New Delhi - 110058, INDIA',NULL,'AGFPK5824P','NA','AGFPK5824P',NULL,NULL,NULL,NULL,'',2,1,'Herbal Solutions',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(84,'Company','Company',NULL,NULL,NULL,NULL,'herbochemad@rediffmail.com ','8048976796','4460',500037,'38 Technocrats industrial estate Balanagar Hyderabad.500037',NULL,'AAHFH3633D','NA','AAHFH3633D',NULL,NULL,NULL,NULL,'',2,1,'Herbochem',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(85,'Company','Company',NULL,NULL,NULL,NULL,'hindnatural@gmail.com','9314512534','3378',302002,'43, Godhhon Ka Rasta, Kishanpur Bazaar Jaipur 302002',NULL,'ADPPA3124R','NA','08ADPPA3124R1Z8',NULL,NULL,NULL,NULL,'',2,1,'Hind Natural Dyes',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(86,'Company','Company',NULL,NULL,NULL,NULL,'vinu@himalyanherbaria.com','9871859955','707',201301,'B-58, Sector 60,Noida ,UP,Noida ,UP',NULL,'ADIPC6505B','NA','09ADIPC6505B1Z1',NULL,NULL,NULL,NULL,'',2,1,'Himalayan Herbaria Inc',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(87,'Company','Company',NULL,NULL,NULL,NULL,'bharath@indoglobal.co.in','9845820838','707',560057,'Shed 1, Dalmia Estate, Site.7 & 8, Chikkabidarakallu, Nagasandra Post, Tumkur Road, 9th mile, Bangalore - 560 073',NULL,'AAFFI2024P','NA','29AAFFI 2024P1Z4',NULL,NULL,NULL,NULL,'',2,1,'Indoglobal Ingredients',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(88,'Company','Company',NULL,NULL,NULL,NULL,'irfan@indovedic.com','9999999999','707',560058,'PLOT NO: 96, 3RD PHASE, PEENYA IND AREA,BANGALORE-560058',NULL,'AACCI8313B','U51397KA2011PTC060032','29AACCI8313B1ZU',NULL,NULL,NULL,NULL,'',2,1,'INDOVEDIC NUTRIENTS PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(89,'Company','Company',NULL,NULL,NULL,NULL,'moni @jairadhesales.com','9925650031','783',380006,'309, Harikrupa Tower,Nr.Old Shardamandir Cross Road,Ellisbridge,Ahmedabad -380006',NULL,'AACFJ3905B','NA','24AACFJ3905B1Z1',NULL,NULL,NULL,NULL,'',2,1,'JAI RADHE SALES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(90,'Company','Company',NULL,NULL,NULL,NULL,'info.kaiwalbiotech@gmail.com','727493540','1072',396035,'PLOT. 720, NEW GIDC,GUNDLAV - 396 035,VALSAD',NULL,'AANFK3647G','NA','24AANFK3647G1Z8',NULL,NULL,NULL,NULL,'',2,1,'KAIWAL BIOTECH',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(91,'Company','Company',NULL,NULL,NULL,NULL,'krj@krishgen.com','8042957097','707',400018,'Unit No 3181319,3rd Floor, Shah & Nahar Estate,off Dr Emoses road worli Mumbai 400018',NULL,'AAQFK3689K','NA','27AAQFK3689K1ZG',NULL,NULL,NULL,NULL,'',2,1,'Krishkare Cosmed Llp',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(92,'Company','Company',NULL,NULL,NULL,NULL,'pawandubey456@gmail.com','9754442044','2229',452007,'221, 2nd Floor, Phadnis complex, 88/1, M.G. Road, Near Kothari Market, INDORE 452007 (M.P.)',NULL,'AAFCK7461H','U24100MP2015PTC033823','23AAFCK7461H1ZI',NULL,NULL,NULL,NULL,'',2,1,'Kshipra Biotech Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(93,'Company','Company',NULL,NULL,NULL,NULL,'kapil.garg@kuberimpex.com','9893499500','2229',452001,'304,305 The Magnate Tower 16/1New Palasia Indore-452001',NULL,'AABCK4980F','U52311MP1997PLC011825','23AABCK4980F1ZO',NULL,NULL,NULL,NULL,'',2,1,'Kuber Impex Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(94,'Company','Company',NULL,NULL,NULL,NULL,'krupallp387@gmail.com','91042554910','707',400058,'Persian Apt. Plot No.434, GR. Floor,V.P.Road, Andheri(West), Mumbai',NULL,'AADFK5233A','NA','27AADFK5233A3ZS',NULL,NULL,NULL,NULL,'',2,1,'Krupa Pharmaceuticals',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(95,'Company','Company',NULL,NULL,NULL,NULL,'kanchan@kudos.in','9211727306','1119',121005,'3231,Nangla Enclave,Subhash Chowk.N.I.T.Faridbad -121005,Haryana',NULL,'AEOPG7336K','NA','06AEOPG7336K1ZS',NULL,NULL,NULL,NULL,'',2,1,'Kudos Laboratories India - Haryana',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(96,'Company','Company',NULL,NULL,NULL,NULL,'info.luckyimpex@gmail.com','8712960353','288',522503,'OPP CITY CABLE, MANGALGIRI,VIJAYAWADA -522503',NULL,'BMOPD7794R','NA','37BMOPD7794R1ZT',NULL,NULL,NULL,NULL,'',2,1,'LUCKY IMPEX',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(97,'Company','Company',NULL,NULL,NULL,NULL,'tharmarketing@rediffmail.com','9810083948','1119',121004,'2/202 RAKSHAK HOUSESOUTH CITY GURGAON HARYANA HR 122001 IN',NULL,'AACCT0898G','U73100HR2004PTC035431','06AACCT0898G1Z7',NULL,NULL,NULL,NULL,'',2,1,'Manger Health Dynamics Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(98,'Company','Company',NULL,NULL,NULL,NULL,'manishasherbal@gmail.com','7893910657','4460',500070,'Plot No.90, Street No.6, D.No.5-1-26/14/1, Veeranjaneya Colony, Sahebnagar, Anjireddy Thota, Vanasthalipuram, Hyderabad -500070 ',NULL,'AAEPU8115E','NA','36AAEPU8115E1Z0',NULL,NULL,NULL,NULL,'',2,1,'Manishas Herbal ),Products',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(99,'Company','Company',NULL,NULL,NULL,NULL,'mehalherbs@gmail.com','8042962748','1096',134003,'1836/11, Moti Nagar, Ambala City-134003, Haryana    ',NULL,'AAICM4074D','U24233HR2013PTC048197','06AAICM4074DIZM',NULL,NULL,NULL,NULL,'',2,1,'Mehal Herbal Health Care Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(100,'Company','Company',NULL,NULL,NULL,NULL,'yamuna@natsollabs.com','9100995943','287',531019,'2nd Floor, Research & Development Building,Commercial Hub, Jawaharlal Nehru Pharma City,Parawada Mandal, Visakhapatnam -531019',NULL,'AADCN0951D','U24100TG2009PTC065408','37AADCN0951D1ZR',NULL,NULL,NULL,NULL,'',2,1,'NATSOL LABORATORIES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(101,'Company','Company',NULL,NULL,NULL,NULL,'finance@naturalremedy.com','9945310482','707',560100,'5B, veerasandra industrial Area 19th k. M. stone, hosur road , Electronic city Post Bangalore',NULL,'AAACN6090M','U24232KA1998PTC023573','29AAACN6090M1ZP',NULL,NULL,NULL,NULL,'',2,1,'NATURAL REMEDIES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(102,'Company','Company',NULL,NULL,NULL,NULL,'maqbool786@gmail.com','9379627038','706',110022,'C-23, 3rd Floor, Vardhman City-2 Plaza,Asaf Ali Road, New Delhi',NULL,'AACCN1558R','','07AACCN1558R1ZX',NULL,NULL,NULL,NULL,'',2,1,'Nature & Nurture Health Care Pvt Ltd -Delhi',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(103,'Company','Company',NULL,NULL,NULL,NULL,'nhlabs@gmail.com','9448087252','707',560062,'62, GOVARDAN GARDENS,J,C,INDUSTRIAL AREA,KANAKAPURA ROAD,BANGALORE-560062',NULL,'AADFN5188M','NA','29AADFN5188M1ZK',NULL,NULL,NULL,NULL,'',2,1,'NAVASHAKTHI HERBALS LABS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(104,'Company','Company',NULL,NULL,NULL,NULL,'sales@nectarphyto.com ','9667242238','707',201301,'816,8th Floor, Tower -A,The Ithum, A-40, Sectar -62,Noida -201301, UP',NULL,'ADDPN0474H','NA','09ADDPN0474H1ZJ',NULL,NULL,NULL,NULL,'',2,1,'NECTAR BIOCEUTICALS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(105,'Company','Company',NULL,NULL,NULL,NULL,'md@nectarphyto.com','9716446090','5236',246149,'Village Jhandi Char Tehsil Kotdwara,Uttarkhand -246149',NULL,'AAFCN0923M','U36912UP2015PTC074748','05AAFCN0923M1ZH',NULL,NULL,NULL,NULL,'',2,1,'Nectar Phytochems Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(106,'Company','Company',NULL,NULL,NULL,NULL,'kopparaharrys@gmail.com','9620177557','707',560090,'No.155, 2nd Cross, Lakshmipura Main Road,Abbigere, Bangalore,Pin Code:560090',NULL,'AADCN8239Q','U15410KA2011PTC061572','29AADCN8239Q1ZK',NULL,NULL,NULL,NULL,'',2,1,'Novel Nutrients Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(107,'Company','Company',NULL,NULL,NULL,NULL,'info@oceanicpharmachem.com','9999999999','707',400059,'607, Windfall, Sahar Plaza, Anheri (E),  Mumbai-400059',NULL,'AAACO3146Q','U24100MH1997PTC107746','27AAACO3146Q1Z2',NULL,NULL,NULL,NULL,'',2,1,'OCEANIC PHARMACHEM PVT LTD',NULL,NULL,'022 42128600',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(108,'Company','Company',NULL,NULL,NULL,NULL,'sales@optimumherbalextracts.com','9176448026','3659',600033,'G 3, Old No 23, New No 64,Balakrishnan Street Extension,West Mambalam, Chennai,Pin:600033',NULL,'AABCO8963C','U74999TN2013PTC092908','33AABCO8963C1ZI',NULL,NULL,NULL,NULL,'',2,1,'Optimum Herbals Extract Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(109,'Company','Company',NULL,NULL,NULL,NULL,'rmtiwarifcs@gmail.com','9997090859','5252',249404,'PATANJALI FOOD & HERBAL PARK,LAKSAR ROAD,PADARTHA,HARIDWAR -249404',NULL,'AAFCP2780G','U74900UR2009PTC033028','05AAFCP2780G1ZH',NULL,NULL,NULL,NULL,'',2,1,'Patanjali Coloroma Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(110,'Company','Company',NULL,NULL,NULL,NULL,'hariharan@phytotech.in','7829650999','707',562149,'103/103, 1ST FLOOR, SRI KRISHNA NAGAR,BYRATHI BANDE, HENNUR MAIN ROAD,KANNUR POST,BANGALORE-562149',NULL,'AABCP6759K','U24246KA1999PTC025306','29AABCP6759K1ZR',NULL,NULL,NULL,NULL,'',2,1,'Phytotech Extracts Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(111,'Company','Company',NULL,NULL,NULL,NULL,'vikasca35@yahoo.co.in','7834051021','1263',173001,'Vill Johron PO Puruwala, Nahan Road , Paonta Sahib Dist Sirmour 173001 H.P',NULL,'AAJCP4268K','U74999HP2017PLC006726','02AAJCP4268K1Z7',NULL,NULL,NULL,NULL,'',2,1,'Pontika Aerotech Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(112,'Company','Company',NULL,NULL,NULL,NULL,'rajeshkulkarni17@gmail.com','9885544472','707',585401,'Plot No 273 Road No 14,KIAD, Kohler Industrial Area,Bidar 585401',NULL,'AAFCP4518A','U40102TG2009PTC066177','29AAFCP4518A1ZN',NULL,NULL,NULL,NULL,'',2,1,'Praana Energy Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(113,'Company','Company',NULL,NULL,NULL,NULL,'pratisales@prakruti.com','9481365700','1684',581301,'Sagar Complex, Ground Floor,Maruti Temple Road,Karwar -581301',NULL,'AADCP8624P','U24239KA2006PTC038900','29AADCP8624P1ZN',NULL,NULL,NULL,NULL,'',2,1,'Prakruti Products Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(114,'Company','Company',NULL,NULL,NULL,NULL,'rajeshsingh.awgp@gmail.com','9686451459','707',560102,'32,26th Main Raod, Sector-1,2nd Floor, HSR Layout,Bangalore -560102',NULL,'AAJCP5781F','U74999KA2017PTC108666','29AAJCP5781F1ZY',NULL,NULL,NULL,NULL,'',2,1,'Pranik Health Solutions Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(115,'Company','Company',NULL,NULL,NULL,NULL,'farhanachippa@yahoo.com','9166663045','3378',302001,'H-908, RIICO INDUSTRIAL AREA, 3RD PHASE,SITAPURA, JAIPUR',NULL,'AATFP8778R','NA','08AATFP8778R1ZM',NULL,NULL,NULL,NULL,'',2,1,'PURE HERBALS SCIENCES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(116,'Company','Company',NULL,NULL,NULL,NULL,'quivercare@gmail.com','7892330364','707',560092,'490, Talacauvery Layout,3rd Floor, Amruthahalli Main Road,Amruthahalli, Bangalore-560092',NULL,'AAACQ3902E','U74900KA2015PTC081569','29AAACQ3902E1ZP',NULL,NULL,NULL,NULL,'',2,1,'Quiver Care Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(117,'Company','Company',NULL,NULL,NULL,NULL,'shrawan@krishnaaloevera','9950435626','3387',342003,'Plot No 1 Heavy Industrial Area,Jodhpur-342003',NULL,'ABWPD8809M','NA','08ABWPD8809M1ZU',NULL,NULL,NULL,NULL,'',2,1,'Rajputana Agrico',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(118,'Company','Company',NULL,NULL,NULL,NULL,'maqbool786@gmail.com','9379627038','706',110002,'305, 3rd Floor, Vardhman,City-2, ASAF ALI ROAD NEW DELHI-110002',NULL,'ABCPH7592R','U51220DL2012PTC243018','07ABCPH7592R1ZW',NULL,NULL,NULL,NULL,'',2,1,'Saamir International Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(119,'Company','Company',NULL,NULL,NULL,NULL,'dlalkotadia@sahmed.com','9099992597','1041',395004,'PLOT NO: 53 TO 57, SAHAJANAND EXTATE,NANI VEDI, VED ROAD, SURAJ',NULL,'AAFCS8803D','U24231GJ2001PTC039726','24AAFCS8803D1ZK',NULL,NULL,NULL,NULL,'',2,1,'SAHAJANAND LIFE SCIENCES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(120,'Company','Company',NULL,NULL,NULL,NULL,'renu.a@savaglobal.com','9881659068','1678',363160,'Plot No-107,108,109 3rd Phase,KIADB,Malur,Kolar -563160',NULL,'AAECA9456D','U24231GJ1989PLC011921','29AAECA9456D2ZH',NULL,NULL,NULL,NULL,'',2,1,'Sava Health Care  Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(121,'Company','Company',NULL,NULL,NULL,NULL,'shikha.shreedha@hotmail.com','9928078874','3378',302019,'2,3 Ved Vatika New Sanganer Road,Sodala Jaipur,Pin:302019',NULL,'CYHPM4346Q','NA','08CYHPM4346Q1ZN',NULL,NULL,NULL,NULL,'',2,1,'Shreedha Phyto Extracts',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(122,'Company','Company',NULL,NULL,NULL,NULL,'avprabhuji@gmail.com','4032569934','4460',500040,'B-12, INDUSTRIAL ESTATE, MOULA ALI,HYDERABAD',NULL,'AAJCS5572R','U52520TG2005PTC046407','36AAJCS5572R1ZE',NULL,NULL,NULL,NULL,'',2,1,'S.K BIO EXTRACTS & APPLICATIONS   PVT  LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(123,'Company','Company',NULL,NULL,NULL,NULL,'ganeshherbals@yahoo.com','9972473938','707',560072,'42, 2ND FLOOR, CANARA BANK COLONY,NAGARBHAVI ROAD,BANGALORE-560072',NULL,'ACGFS2246G','NA','29ACGFS2246G1Z0',NULL,NULL,NULL,NULL,'',2,1,'SRI SAI GANESH HERBALS LLP',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(124,'Company','Company',NULL,NULL,NULL,NULL,'arvind@stiritiventures.com','9491042865','4460',508116,'H.No.3-20, Cheekatmamidi Village,Bommalramaram Mandal,Yadadri -Bhongir Dist,Telangana -508116',NULL,'AAOCS1523R','U24232TG2010PTC068080','36AAOCS1523R1ZQ',NULL,NULL,NULL,NULL,'',2,1,'STIRITI AYUR THERAPIES PVT LTD - SALES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(125,'Company','Company',NULL,NULL,NULL,NULL,'corporate@sugunafoods.co.in','934589303','707',642201,'Kotamanglm-HD-HC, herbal Products,SF No 169/1, of No.23, Kottamangalam Village,642201',NULL,'AADCS0655F','U01222TZ1994PTC004951','33AADCS0655F1ZP',NULL,NULL,NULL,NULL,'',2,1,'Suguna Foods Private Limited',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(126,'Company','Company',NULL,NULL,NULL,NULL,'jayashree.ullal@himalayawellness.com','9731046677','707',562162,'MAKALI, TUMKUR ROAD,BANGALORE-562162',NULL,'AADFT3025B','U24232KA1997PTC022261','29AADFT3025B2ZK',NULL,NULL,NULL,NULL,'',2,1,'Himalaya Drug Company Pvt Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(127,'Company','Company',NULL,NULL,NULL,NULL,'ashokrao@samilabs.com','9035396836','707',560058,'19/1 19/2, PEENYA INDUSTRIALAREA II PHASE CHOKKASANDRA VILLAGE, BANGALORE KA 560058 IN',NULL,'AADCS2549E','U24249KA1991PLC011880','29AADCS2549E1ZB',NULL,NULL,NULL,NULL,'',2,1,'Sami Labs Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(128,'Company','Company',NULL,NULL,NULL,NULL,'tulsiamrit@tulsiamrit.com','9981147802','2229',452015,'Plot No.18, Sector-D-2,Sanwar Road, Industraial Area,Indore -452015',NULL,'AABCT8040K','U29199MP1997PTC012482','23AABCT8040K1ZD',NULL,NULL,NULL,NULL,'',2,1,'TULSI AMRIT PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(129,'Company','Company',NULL,NULL,NULL,NULL,'accounts@unicornnature.com','9849152292','4460',500009,'228 & 229, GENOME VALLEY,TURKAPALLY SHAMEERPET- MANDAL,R.R.DIST,HYDERABAD -500009',NULL,'AAACU3357K','U15499TG2005PTC045406','36AAACU3357K1Z4',NULL,NULL,NULL,NULL,'',2,1,'UNICORN NATURAL PRODUCTS LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(130,'Company','Company',NULL,NULL,NULL,NULL,'admin@vipuldyes.com','9999999999','707',421501,'Unit 2, A-14, Amproad , MIDC,Ambernath-421501',NULL,'AAACV1710B','L24110MH1972PLC015857','27AAACV1710B1Z0',NULL,NULL,NULL,NULL,'',2,1,'Vipul Organics Ltd',NULL,NULL,'2266139999',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(131,'Company','Company',NULL,NULL,NULL,NULL,'office_deepakcgandhi@rediffmail.com','9099087270','783',382213,'423/98-B, Mahagujarat Industrail Estate,Sarkhej Bavla Highway, Village-Moraiya,Ta-Sanand,Dist -Ahmedabad - 382213',NULL,'AAACV6298E','U24230GJ1997PTC033375','24AAACV6298E1Z7',NULL,NULL,NULL,NULL,'',2,1,'VIRGO UAP PHARMA PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(132,'Company','Company',NULL,NULL,NULL,NULL,'vitalpurchase305@gmail.com','9574007298','707',391243,'361-362,GIDC, POR-RAMANGAMADI, POR, CITY-VADODARA,GUJARAT-391243',NULL,'AAACV6209P','U24110GJ1992PTC018634','24AAACV6209P1Z1',NULL,NULL,NULL,NULL,'',2,1,'VITAL CARE PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(133,'Company','Company',NULL,NULL,NULL,NULL,'manishajmera10@hotmail.com','9302121162','2229',452002,'21,Rajaswagram,Chhatribagh, Indore,Madhya Pradesh -452002',NULL,'AAJFV5582F','NA','23AAJFV5582F1ZZ',NULL,NULL,NULL,NULL,'',2,1,'Vostok Herbals',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(134,'Company','Company',NULL,NULL,NULL,NULL,'sandhya@vruddhiinc.com','9845427677','707',560026,'Akshobya Nilaya No 17,  Ground Floor,17th Main Road, Muneswara Block,Bangalore-560026',NULL,'AUBPS9712Q','NA','29AUBPS9712Q1ZP',NULL,NULL,NULL,NULL,'',2,1,'VRUDDHI INC',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(135,'Company','Company',NULL,NULL,NULL,NULL,'welex@welexcare.com','9833269846','707',400013,'A-1002, Marathon Innova Nextgen,Off.Ganpatro Kadam Marg,Lower Parel (W), Mumbai-400013',NULL,'AAACW0756A','U24230MH1979PTC021411','27AAACW0756A1ZP',NULL,NULL,NULL,NULL,'',2,1,'WELEX LABORATORIES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(136,'Company','Company',NULL,NULL,NULL,NULL,'cs@windlasbiotech.com','9999999999','5236',248110,'40/1, Mohabewala Industrial Area,Dehradun -248110,Uttarkhand',NULL,'AAACW3417C','U74899UR2001PTC033407','05AAACW3417C1ZV',NULL,NULL,NULL,NULL,'',2,1,'Windlas Biotech Private Limited',NULL,NULL,'135-6608000',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(137,'Company','Company',NULL,NULL,NULL,NULL,'info@ziranindia.com','8575755555','2786',416416,'289 Mahavir Nagar Wakharbhag Sangli (MH)- 416416',NULL,'AJSPP9639F','NA','27AJSPP9639F2ZD',NULL,NULL,NULL,NULL,'',2,1,'Ziran India',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(138,'Company','Company',NULL,NULL,NULL,NULL,'macbiosciences@gmail.com','9416681147','1167',134103,'PLOT NO.- 37 ALIPUR BARWALA HSIIDC INDUSTRIAL ESTATE PANCHUKLA, HARYANA-134103',NULL,'AAICM2979H','','06AAICM2979H1Z4',NULL,NULL,NULL,NULL,'',2,1,'MAC BIO SCIENCES PVT LTD',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(139,'Company','Company',NULL,NULL,NULL,NULL,'suryaherbal171@gmail.com','8427666004','1167',134103,'PLOT NO.- 115 ALIPUR BARWALA HSIIDC INDUSTRIAL ESTATE PANCHUKLA, HARYANA-134103',NULL,'ABHPK4661K','','06ABHPK4661K1ZG',NULL,NULL,NULL,NULL,'',2,1,'SURYA HERBAL LIFE SCIENCES',NULL,NULL,'8427666003',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(140,'Company','Company',NULL,NULL,NULL,NULL,'prosolpharma@gmail.com','7838380841','706',110085,'SHOP NO. -15-16-17 SARJA MARKET COMPLEX, NAHARPUR ROHINI SECTOR -7 NEW DELHI- 110085',NULL,'EFDPS7888C','','07EFDPS7888C1ZW',NULL,NULL,NULL,NULL,'',2,1,'PROSOL PHARMA',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(141,'Company','Company',NULL,NULL,NULL,NULL,'md.nbhealthcare@gmail.com','9216907372','3237',160062,'PLOT NO.- 966, JLPL ,SECTOR-82 MOHALI - PUNJAB-160062',NULL,'AQJPS8470R','','03AQJPS8470R1ZW',NULL,NULL,NULL,NULL,'',2,1,'NB HEALTH CARE',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(142,'Company','Company',NULL,NULL,NULL,NULL,'kkharbal@gmail.com','9779966966','594',160047,'GOPAL AYURVEDIC CENTER SCO-112,113, SECTOR-45,C CHANDIGARH(UT)- 160047',NULL,'CGMPP5582N','','03CGMPP5582N1Z0',NULL,NULL,NULL,NULL,'',2,1,'Gopal Store / KK Industries',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(143,'Company','Company',NULL,NULL,NULL,NULL,'bioliferemedies22@gmail.com','7018726027','3237',160062,'PLOT NO.- 728, 1ST FLOOR, IND. AREA PHASE-9 (SECTOR-63) MOHALI , PUNJAB- 160062',NULL,'ARBPN3839J','','03ARBPN3839J1ZS',NULL,NULL,NULL,NULL,'',2,1,'BIOLIFEREMEDIES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(144,'Company','Company',NULL,NULL,NULL,NULL,'vsingla@zoicpharma.com','9815620908','3237',160062,'PLOT NO.- 194, JLPL ,SECTOR-82 MOHALI - PUNJAB-160062',NULL,'BGNPS1275D','','03BGNPS1275D1ZG',NULL,NULL,NULL,NULL,'',2,1,'ZOIC',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:42',NULL,NULL,NULL,NULL),(145,'Company','Company',NULL,NULL,NULL,NULL,'deepak.tewari@brightlifecare.com','9910096378','1126',122901,'7TH FLOOR MOTOROLA BUILDING, SECTOR-14 GURUGRAM, HARYANA-122901',NULL,'AAECB5311J','','06AAECB5311J1ZY',NULL,NULL,NULL,NULL,'',2,1,'BRIGHT LIFE',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(146,'Company','Company',NULL,NULL,NULL,NULL,'logichembiotech@gmail.com','9896121111','1096',133001,'PLOT NO.- 24, IND. AREA, AMBALA CANT, HARYANA-133001',NULL,'AAHFL1070G','','06AAHFL1070G1ZM',NULL,NULL,NULL,NULL,'',2,1,'LOGICHEM BIOTECH/ MEDIOLOGY',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(147,'Company','Company',NULL,NULL,NULL,NULL,'info@ukgermanpharmaceutical.com ','9815984107','3276',148028,'U K GERMAN PHARMA SUNAM, DISTT.- SANGRUR PUNJAB-148028',NULL,'AKBPK9732C','','03AKBPK9732C1ZK',NULL,NULL,NULL,NULL,'',2,1,'UK GERMAN PHARMACEUTICALS',NULL,NULL,'9216200000',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(148,'Company','Company',NULL,NULL,NULL,NULL,'maulikremedies1@gmail.com','9041777752','3237',160062,'PLOT NO.- 184, 1ST FLOOR, IND. AREA PHASE-9 (SECTOR-63) MOHALI , PUNJAB- 160062',NULL,'ABEFM0606R','','03ABEFM0606R1Z9',NULL,NULL,NULL,NULL,'',2,1,'MAULIK REMEDIES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(149,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','9417266977','3237',140507,'PLOT NO.-40,HANSA IND. PARK, BARWALA ROAD DERABASSI SAS NAGAR MOHALI PUNJAB-140507',NULL,'ACEPK9089K','','03ACEPK9089K1Z7',NULL,NULL,NULL,NULL,'',2,1,'KUSHAL AYURVEDA',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(150,'Company','Company',NULL,NULL,NULL,NULL,'nadvedics@gmail.com','9501106344','594',140603,'HEALTH VITAL PVT. LTD. 6-7, FF,SCO 866,NAC, MANIMAJRA,CHANDIGARH(UT)-160101',NULL,'AGKPG9711A','','03AGKPG9711A1ZX',NULL,NULL,NULL,NULL,'',2,1,'HEALTH VITAL/ NUTRIENTS AND DERIVATIVES',NULL,NULL,'1724655867',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(151,'Company','Company',NULL,NULL,NULL,NULL,'sales@pharminoxmeditech.com','9876002885','3237',173205,'SHOP - 112, 1ST FLOOR, M1 PLAZA, JHARMAJRI, BADDI DISST. SOLAN H.P-173205',NULL,'AASFP3181F','','02AASFP3181F1Z9',NULL,NULL,NULL,NULL,'',2,1,'PHARMINOX MEDI-TECH',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(152,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','8295234348','1167',133303,'PLOT NO.- 56 HSIIDC, KALKA, DISTT- PANCHKULA HARYANA-133303',NULL,'AGEPB4295J','','06AGEPB4295J1ZE',NULL,NULL,NULL,NULL,'',2,1,'RISHI HERBALS',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(153,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','9855045415','3237',140507,'PLOT NO.-125,HANSA IND. PARK, BARWALA ROAD DERABASSI SAS NAGAR MOHALI PUNJAB-140507',NULL,'AAGCD1934M','','03AAGCD1934M1ZP',NULL,NULL,NULL,NULL,'',2,1,'DHARAMVIR AYURVEDA PVT. LTD.',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(154,'Company','Company',NULL,NULL,NULL,NULL,'setkoindia@gmail.com','9501591587','3237',160062,'PLOT NO.- 701, JLPL ,SECTOR-82 MOHALI - PUNJAB-160062',NULL,'AGKPK2018A','','03AGKPK2018A1Z7',NULL,NULL,NULL,NULL,'',2,1,'SETKOLIFESCIENCES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(155,'Company','Company',NULL,NULL,NULL,NULL,'vineet@sblifesciences.in','9805517346','1167',134113,'363, IInd Floor, Industrial Area, Phase-2, Panchkula, Haryana 134113',NULL,'AGBPV1999E','','05AGBPV1999E1Z5',NULL,NULL,NULL,NULL,'',2,1,'SB life Scrience',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(156,'Company','Company',NULL,NULL,NULL,NULL,'lewibhealthcare@gmail.com','8901424800','1167',134118,'Plot no 91, HSIIDC, Alipur Barwala, Dist panchkula, -134118, haryana',NULL,'AAHFL5920F','','06AAHFL5920F1ZH',NULL,NULL,NULL,NULL,'',2,1,'LEWIB HEALTHCARE',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(157,'Company','Company',NULL,NULL,NULL,NULL,'infoansalpharma@gmail.com ','9412274125','4545',202125,'f-259, upside tala nagri aligarh(U.P)-20215',NULL,'ADBPS7056E','','09ADBPS7056E2ZD',NULL,NULL,NULL,NULL,'',2,1,'ANSAL HERBS FORMULAtion',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(158,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','9814582715','594',140301,'SCO 27 GILLCO VALLY SEC 127 CHANDIGARH ROAD KHARAR PUNJAB-140301',NULL,'AAHCC3800C','','03AAHCC3800C1ZH',NULL,NULL,NULL,NULL,'',2,1,'MAGNIFINE HEALTH HERBALS SOLUTION PVT. LTD.',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(159,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','8683957885','1192',131001,'Maple bear per nursery candian school delhi road sonipat ( haryana)-131001',NULL,'ARMPK4574G','','06ARMPK4574G1ZJ',NULL,NULL,NULL,NULL,'',2,1,'ALIYANCE PHARMACEUTICAL',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(160,'Company','Company',NULL,NULL,NULL,NULL,'taksalifesciences@rediffmail.com','9779892404','3237',140507,'E-47,industrial area , focal point, derabassi, sas nager, mohali (punjab)-140507',NULL,'CPFPS9499D','','03CPFPS9499D1ZE',NULL,NULL,NULL,NULL,'',2,1,'TAKSA LIFE SCIENCES',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(161,'Company','Company',NULL,NULL,NULL,NULL,'na@test.com','9625086011','1232',176001,'VPO kachhiari, the & dist Kangra-176001',NULL,'ALTPC8132B','','02ALTPC8132B2ZJ',NULL,NULL,NULL,NULL,'',2,1,'BEEHIVE NATURAL HONEY',NULL,NULL,'7018363315',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(162,'Company','Company',NULL,NULL,NULL,NULL,'Info.atulyamedilink@gmail.com','8851180014','706',110034,'Off- 322 Prestige Mall,Pitampura Adjoine M2k,New Delhi-',NULL,'AAPCA5392P','U24304HR2017PTC068909','06AAPCA5392P1ZV',NULL,NULL,NULL,NULL,'',2,1,'Atulya Medilink Pvt.ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(163,'Company','Company',NULL,NULL,NULL,NULL,'nagpalayurveda@gmail.com ','9694165747','3368',335001,'9A,Kunj vihar 2,Sri Ganganagar,Rajasthan-',NULL,'AAMFN3346A','NA','08AAMFN3346A1ZG',NULL,NULL,NULL,NULL,'',2,1,'Nagpal Herbal',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(164,'Company','Company',NULL,NULL,NULL,NULL,'aloecaresales@gmail.com','8955507057','1253',331023,'B-6 RICCO INDUSTRIAL AREA CHURU ROAD,SADULPUR',NULL,'ALOPB1889R','NA','08ALOPB1889R1Z7',NULL,NULL,NULL,NULL,'',2,1,'ALOECARE  AROGYA LIFE',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(165,'Company','Company',NULL,NULL,NULL,NULL,'easternhealthcare007@gmail.com ','7290040048','706',110070,'Office address-1586/1792,Suran Farm avenue-13,New Delhi ',NULL,'AACFE0303Q','NA','05AACFE0303Q2ZO',NULL,NULL,NULL,NULL,'',2,1,'Eastern Health Care',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(166,'Company','Company',NULL,NULL,NULL,NULL,'info@prabhatayurvedicpharmacy.in','9815900424','3134',143001,'273-C,East Mohan Nagar,Amritsar-',NULL,'AAAFP9963B','NA','03AAAFP9963B1ZF',NULL,NULL,NULL,NULL,'',2,1,'Prabhat Ayurvedic Pharmacy',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(167,'Company','Company',NULL,NULL,NULL,NULL,'gagan.ayu@gmail.com ','7240790004','3368',335002,'H-1-386-387 Agro Food Park,Udyog Vihar RIICO,Sri Ganganagar (Raj.)-',NULL,'AAIFG9196K','NA','08AAIFG9196KIZM',NULL,NULL,NULL,NULL,'',2,1,'Gagan Pharmaceuticals',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(168,'Company','Company',NULL,NULL,NULL,NULL,'chandrayanherbal@gmail.com ','700065788','2232',483220,'Gram singod , Tehsil Panagar ,Jabalpur - M.P',NULL,'AAGCC7697C','U24304MH2016PTC289077','23AAGCC7697C1ZL',NULL,NULL,NULL,NULL,'',2,1,'Chandrayan herbal & Food pvt. Ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(169,'Company','Company',NULL,NULL,NULL,NULL,'rajendra.prasad@copmedpharma.com','9805000734','1263',173025,'plot no. 25,26 Industrial area gondpur ponta sahib , himachal pradesh  ',NULL,'AAACC6076B','U74899DL1988PTC033151','02AAACC6076B2Z9',NULL,NULL,NULL,NULL,'',2,1,'Copmed Pharmaceuticals pvt.ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(170,'Company','Company',NULL,NULL,NULL,NULL,'harbalfarm@gmail.com','9871727573','706',110020,'C-86,Okhla Industrial Area Phase-1,New Delhi-',NULL,'AAECH4409F','U74999DL2018PTC329638','07AAECH4409F1ZU',NULL,NULL,NULL,NULL,'',2,1,'Harbal Farm Life Care Pvt.ltd',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:43',NULL,NULL,NULL,NULL),(171,'Company','Company',NULL,NULL,NULL,NULL,'zanekapurchase123@gmail.com','7088168899','5252',249403,'plot no.88 , SECTOR -I.I.D.C SIDCUL , HARIDWAR (U.K)  ',NULL,'AACF02440G','NA','05AACF02440G2ZP',NULL,NULL,NULL,NULL,'',2,1,'ONUS ZANEKHA',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(172,'Company','Company',NULL,NULL,NULL,NULL,'herbalsamazon@gmail.com','9868021369','706',110027,'b-4/9 2nd floor marble market rajori garden ,new delhi,PIN-',NULL,'AQCPS9097F','NA','07AQCPS9097F2ZA',NULL,NULL,NULL,NULL,'',2,1,'NAVRAJ HEALTH CARE',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(173,'Company','Company',NULL,NULL,NULL,NULL,'singh@redhillherbals.com','9811619106','706',110014,'O-23(GF)Jangpura Extension, New Delhi -.',NULL,'AAFCR8010H','U24232DL2005PTC139180','05AAFCR8010H1ZM',NULL,NULL,NULL,NULL,'',2,1,'Redhill herbals',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(174,'Company','Company',NULL,NULL,NULL,NULL,'purchase@vxldrugs.com ','7042394400','707',201308,'kasna , B-1/A EPIP Site - V (Road No.-25) greater noida - 201308(u.p)',NULL,'AABCV3624M','U24239DL2000PTC104382','09AABCV3624M3ZZ',NULL,NULL,NULL,NULL,'',2,1,'Vee Excel Drugs & pharmaceuticals',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(175,'Company','Company',NULL,NULL,NULL,NULL,'ayurvite@gmail.com','7697789405','2328',476001,'477/2, sanjay  colony , 5th battalion road , MORENA ,  (M.P.)',NULL,'AAOCA5625J','U74999MP2016PTC041068','03AAOCA5625J1ZK',NULL,NULL,NULL,NULL,'',2,1,'Ayurvite Wellness pvt. Ltd.',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(176,'Company','Company',NULL,NULL,NULL,NULL,'nmpamrit@giloy.in','9643831908','3225',142026,'new krishna gaushala, agward khawaja Baju , Jargaon , ludhiana, punjab-142026',NULL,'AAEP27786N','','03AAEP27786N1ZQ',NULL,NULL,NULL,NULL,'',2,1,'NEELKANTH MEDI POINT',NULL,NULL,'',NULL,'Y',NULL,'2019-06-19 14:20:45',NULL,NULL,NULL,NULL),(177,'Shekhar','Chaturvedi',NULL,NULL,NULL,NULL,'shekhar@pranikhealth.com','9341045805','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-27 00:00:00',NULL,2,2,NULL,1,'shekhar@pranikhealth.com','9341045805','FULL','N',NULL,'2019-06-19 14:16:30','',0,NULL,1),(180,'Abhinav','Ghai',NULL,NULL,NULL,NULL,'abhinav@naturabt.com','9694718334','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,1,'abhinav@naturabt.com','9694718334','FULL','N',NULL,'2019-06-19 14:16:30','01/02/2019',4355000,NULL,NULL),(182,'Shekhar','Chaturvedi',NULL,NULL,NULL,NULL,'bd@naturabt.com','9341045805','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-27 00:00:00',NULL,NULL,2,NULL,NULL,NULL,'9341045805',NULL,'N',NULL,'2019-06-19 14:15:03',NULL,NULL,NULL,1),(183,'Test','Test',NULL,NULL,NULL,NULL,'test@example.com','7894563210','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-24 11:07:24',NULL,NULL,NULL,NULL),(184,'Test','Test',NULL,NULL,NULL,NULL,'','8956320147','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,1,'test@example.dom','6985471230','FULL','Y',NULL,'2019-06-24 12:08:20',NULL,NULL,NULL,NULL),(185,'Company','Company',NULL,NULL,NULL,NULL,'test@wexample.com','7894561230','1',456121,'test',NULL,'PAN456123','','GSTN1123',NULL,NULL,NULL,NULL,'',10,1,'test',NULL,NULL,NULL,NULL,'Y',NULL,'2019-06-24 13:09:42',NULL,NULL,NULL,NULL),(186,'test','test',NULL,NULL,NULL,NULL,'rohillapragya@gmail.com','9568419300','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,2,'',NULL,NULL,NULL,NULL,'Y',NULL,'2019-08-06 10:32:25',NULL,NULL,NULL,NULL),(187,'Vendor','Vendor',NULL,NULL,NULL,NULL,'testBusiness1@example.com','7894561230','302',789456,'sdfgewiuok',NULL,'TEST1PAN0002','TEST1CIN0002','TEST1GSTN0002',NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,1,3,'Test Business 1',NULL,NULL,NULL,NULL,'N',NULL,'2019-12-23 16:28:28',NULL,NULL,'TB1',1),(188,'test','test',NULL,NULL,NULL,NULL,'test@example.com','7894561230','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,1,2,NULL,NULL,'test@example.com','7894561230',NULL,'N',NULL,'2020-01-22 00:00:00',NULL,NULL,NULL,1),(189,'Test1','Test1',NULL,NULL,NULL,NULL,'test1@example.com','7894561230','1558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-03-23 00:00:00',NULL,1,2,NULL,NULL,'test1@example.com','7894561230',NULL,'N',NULL,'2020-01-30 00:00:00',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master_type`
--

DROP TABLE IF EXISTS `user_master_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_master_type` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master_type`
--

LOCK TABLES `user_master_type` WRITE;
/*!40000 ALTER TABLE `user_master_type` DISABLE KEYS */;
INSERT INTO `user_master_type` VALUES (1,'CUSTOMER'),(2,'USER'),(3,'VENDOR');
/*!40000 ALTER TABLE `user_master_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_monthly_target_details`
--

DROP TABLE IF EXISTS `user_monthly_target_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_monthly_target_details` (
  `id` int(11) NOT NULL,
  `user_monthly_target_master_id` int(11) NOT NULL,
  `target_amt` int(11) NOT NULL,
  `target_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `remarks` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_monthly_target_details`
--

LOCK TABLES `user_monthly_target_details` WRITE;
/*!40000 ALTER TABLE `user_monthly_target_details` DISABLE KEYS */;
INSERT INTO `user_monthly_target_details` VALUES (1,1,1000,'2019-05-01',1,'2020-03-27',NULL,NULL,'this is for test customer target'),(2,1,10000,'2019-06-01',1,'2020-03-27',NULL,NULL,'test entry for Session 2019-20'),(3,2,500,'2020-09-01',1,'2020-03-27',NULL,NULL,'testing for session 2020-2021'),(4,3,40000,'2019-04-01',6,'2020-03-27',NULL,NULL,'this is test entry for year 2019-2020  behalf of Guruprasad SE.'),(5,3,1000,'2019-09-01',6,'2020-03-27',NULL,NULL,'entry Sep 2019 amt 1000'),(6,4,500,'2020-05-01',6,'2020-03-27',NULL,NULL,'session 2020-2021'),(7,5,50000,'2022-09-01',6,'2020-03-27',NULL,NULL,'this is text entry');
/*!40000 ALTER TABLE `user_monthly_target_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_monthly_target_master`
--

DROP TABLE IF EXISTS `user_monthly_target_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_monthly_target_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `monthly_target` int(11) NOT NULL,
  `session` varchar(10) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_monthly_target_master`
--

LOCK TABLES `user_monthly_target_master` WRITE;
/*!40000 ALTER TABLE `user_monthly_target_master` DISABLE KEYS */;
INSERT INTO `user_monthly_target_master` VALUES (1,1,0,'2019-2020',1,'2020-03-27',1,'2020-03-27'),(2,1,0,'2020-2021',1,'2020-03-27',NULL,NULL),(3,6,4000000,'2019-2020',6,'2020-03-27',6,'2020-03-27'),(4,6,4000000,'2020-2021',6,'2020-03-27',NULL,NULL),(5,6,4000000,'2022-2023',6,'2020-03-27',NULL,NULL);
/*!40000 ALTER TABLE `user_monthly_target_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password_reset`
--

DROP TABLE IF EXISTS `user_password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password_reset` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `auth_type` int(11) NOT NULL,
  `auth_value` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password_reset`
--

LOCK TABLES `user_password_reset` WRITE;
/*!40000 ALTER TABLE `user_password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_map`
--

DROP TABLE IF EXISTS `user_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_map` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `Active` char(1) NOT NULL,
  `Created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_role_map_Role1_idx` (`role_id`),
  CONSTRAINT `fk_user_role_map_Role1` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_map`
--

LOCK TABLES `user_role_map` WRITE;
/*!40000 ALTER TABLE `user_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trade_reference`
--

DROP TABLE IF EXISTS `user_trade_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_trade_reference` (
  `user_Id` int(11) NOT NULL,
  `Company_name` varchar(45) DEFAULT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `account_opened_since` varchar(20) DEFAULT NULL,
  `credit_limit` varchar(20) DEFAULT NULL,
  `current_balance` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trade_reference`
--

LOCK TABLES `user_trade_reference` WRITE;
/*!40000 ALTER TABLE `user_trade_reference` DISABLE KEYS */;
INSERT INTO `user_trade_reference` VALUES (185,'','','','','','','','2019-06-24 13:09:42',NULL,1);
/*!40000 ALTER TABLE `user_trade_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wish_master`
--

DROP TABLE IF EXISTS `user_wish_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_wish_master` (
  `wish_id` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `application` varchar(500) DEFAULT NULL,
  `qunatity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `attachment` varchar(45) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `other_info` varchar(1000) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`wish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wish_master`
--

LOCK TABLES `user_wish_master` WRITE;
/*!40000 ALTER TABLE `user_wish_master` DISABLE KEYS */;
INSERT INTO `user_wish_master` VALUES ('NBT-WISH-2020020301',1,'Wish name 1','Wish Name 2',3,'wish application here',500,'',NULL,'WISH-CREATED','2020-02-03 00:00:00','2020-02-03 00:00:00','other information',NULL,1,1,1,9),('NBT-WISH-2020021701',1,'Wish name 2','Wish description 2',3,'application here',200,'',NULL,'WISH-CREATED','2020-02-17 00:00:00',NULL,'other information',NULL,1,NULL,2,9),('NBT-WISH-2020021801',1,'Wish name 1','dexfcgvhbj',4,'application here',5,'',NULL,'WISH-CREATED','2020-02-18 00:00:00',NULL,'',NULL,1,NULL,3,7);
/*!40000 ALTER TABLE `user_wish_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_section_details`
--

DROP TABLE IF EXISTS `vendor_section_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_section_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_section_master_id` int(11) NOT NULL,
  `key_que` varchar(45) NOT NULL,
  `key_ans` varchar(2000) NOT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_section_details`
--

LOCK TABLES `vendor_section_details` WRITE;
/*!40000 ALTER TABLE `vendor_section_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_section_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_section_master`
--

DROP TABLE IF EXISTS `vendor_section_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_section_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_section_master`
--

LOCK TABLES `vendor_section_master` WRITE;
/*!40000 ALTER TABLE `vendor_section_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_section_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_contacts_details`
--

DROP TABLE IF EXISTS `warehouse_contacts_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_contacts_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `primary_contacts_person_first_name` varchar(45) NOT NULL,
  `primary_contacts_person_last_name` varchar(45) DEFAULT NULL,
  `primary_contacts_person_mobile` varchar(15) DEFAULT NULL,
  `primary_contacts_person_phone_no` varchar(15) DEFAULT NULL,
  `primary_contacts_person_email` varchar(45) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_contacts_details`
--

LOCK TABLES `warehouse_contacts_details` WRITE;
/*!40000 ALTER TABLE `warehouse_contacts_details` DISABLE KEYS */;
INSERT INTO `warehouse_contacts_details` VALUES (1,1,'--',NULL,NULL,NULL,NULL,'2019-12-07',NULL),(2,2,'--',NULL,NULL,NULL,NULL,'2019-12-07',NULL);
/*!40000 ALTER TABLE `warehouse_contacts_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_master`
--

DROP TABLE IF EXISTS `warehouse_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'Y',
  `created_at` date DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_master`
--

LOCK TABLES `warehouse_master` WRITE;
/*!40000 ALTER TABLE `warehouse_master` DISABLE KEYS */;
INSERT INTO `warehouse_master` VALUES (1,'Bengaluru','Bengaluru','1558','Y','2019-12-07',NULL),(2,'Jaipur','Jaipur','3378','Y','2019-12-07',NULL);
/*!40000 ALTER TABLE `warehouse_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-01 15:09:11