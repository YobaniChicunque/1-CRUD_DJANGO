/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - veterinaria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `veterinaria`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add persona',7,'add_persona'),
(26,'Can change persona',7,'change_persona'),
(27,'Can delete persona',7,'delete_persona'),
(28,'Can view persona',7,'view_persona'),
(29,'Can add vacuna',8,'add_vacuna'),
(30,'Can change vacuna',8,'change_vacuna'),
(31,'Can delete vacuna',8,'delete_vacuna'),
(32,'Can view vacuna',8,'view_vacuna'),
(33,'Can add mascota',9,'add_mascota'),
(34,'Can change mascota',9,'change_mascota'),
(35,'Can delete mascota',9,'delete_mascota'),
(36,'Can view mascota',9,'view_mascota');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$ExaBBuAqaDUM5YTxjAhOVe$dKRW8vBdYiMYg7LL0Na72TVjOstWGCDuOXcQPrAXixQ=','2023-05-20 19:21:30.328331',1,'admin','','','yobanichicunque@gmail.com',1,1,'2023-05-20 18:00:57.260338');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2023-05-20 18:11:10.868980','1','Vacuna object (1)',1,'[{\"added\": {}}]',8,1),
(2,'2023-05-20 18:11:18.305728','2','Vacuna object (2)',1,'[{\"added\": {}}]',8,1),
(3,'2023-05-20 18:11:28.893841','3','Vacuna object (3)',1,'[{\"added\": {}}]',8,1),
(4,'2023-05-20 18:11:32.632536','4','Vacuna object (4)',1,'[{\"added\": {}}]',8,1),
(5,'2023-05-20 18:12:02.885691','1','Persona object (1)',1,'[{\"added\": {}}]',7,1),
(6,'2023-05-20 18:12:36.985253','2','Persona object (2)',1,'[{\"added\": {}}]',7,1),
(7,'2023-05-20 18:13:00.438967','3','Persona object (3)',1,'[{\"added\": {}}]',7,1),
(8,'2023-05-20 18:56:14.557108','3','Sultan',1,'[{\"added\": {}}]',9,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(9,'mascotas','mascota'),
(7,'mascotas','persona'),
(8,'mascotas','vacuna'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-05-20 17:58:36.679380'),
(2,'auth','0001_initial','2023-05-20 17:58:50.878065'),
(3,'admin','0001_initial','2023-05-20 17:58:54.867584'),
(4,'admin','0002_logentry_remove_auto_add','2023-05-20 17:58:55.039924'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-05-20 17:58:55.246796'),
(6,'contenttypes','0002_remove_content_type_name','2023-05-20 17:58:56.726131'),
(7,'auth','0002_alter_permission_name_max_length','2023-05-20 17:58:58.044520'),
(8,'auth','0003_alter_user_email_max_length','2023-05-20 17:58:58.459287'),
(9,'auth','0004_alter_user_username_opts','2023-05-20 17:58:58.772580'),
(10,'auth','0005_alter_user_last_login_null','2023-05-20 17:58:59.680862'),
(11,'auth','0006_require_contenttypes_0002','2023-05-20 17:58:59.869472'),
(12,'auth','0007_alter_validators_add_error_messages','2023-05-20 17:59:00.004557'),
(13,'auth','0008_alter_user_username_max_length','2023-05-20 17:59:00.252402'),
(14,'auth','0009_alter_user_last_name_max_length','2023-05-20 17:59:00.517324'),
(15,'auth','0010_alter_group_name_max_length','2023-05-20 17:59:01.311499'),
(16,'auth','0011_update_proxy_permissions','2023-05-20 17:59:01.475031'),
(17,'auth','0012_alter_user_first_name_max_length','2023-05-20 17:59:03.034955'),
(18,'sessions','0001_initial','2023-05-20 17:59:03.703543'),
(19,'mascotas','0001_initial','2023-05-20 17:59:46.068725');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

/*Table structure for table `mascotas_mascota` */

DROP TABLE IF EXISTS `mascotas_mascota`;

CREATE TABLE `mascotas_mascota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `persona_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mascotas_mascota_persona_id_c7634f79_fk_mascotas_persona_id` (`persona_id`),
  CONSTRAINT `mascotas_mascota_persona_id_c7634f79_fk_mascotas_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `mascotas_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas_mascota` */

insert  into `mascotas_mascota`(`id`,`nombre`,`edad`,`foto`,`persona_id`) values 
(5,'Dalia',1,'imagenes/1.jpg',1),
(6,'Coco',2,'imagenes/2.jpg',2),
(7,'Espartano',3,'imagenes/3.jpg',3),
(8,'Firulais',4,'imagenes/4.jpg',3),
(9,'Orejas',5,'imagenes/5.jpg',2),
(10,'Chestri',6,'imagenes/6.jpg',1),
(11,'Cokis',7,'imagenes/7.jpg',1),
(12,'Zeus',8,'imagenes/8.jpg',1);

/*Table structure for table `mascotas_mascota_vacuna` */

DROP TABLE IF EXISTS `mascotas_mascota_vacuna`;

CREATE TABLE `mascotas_mascota_vacuna` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mascota_id` int(11) NOT NULL,
  `vacuna_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mascotas_mascota_vacuna_mascota_id_vacuna_id_e4a8989d_uniq` (`mascota_id`,`vacuna_id`),
  KEY `mascotas_mascota_vacuna_vacuna_id_c4ee45ea_fk_mascotas_vacuna_id` (`vacuna_id`),
  CONSTRAINT `mascotas_mascota_vac_mascota_id_37f2154c_fk_mascotas_` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas_mascota` (`id`),
  CONSTRAINT `mascotas_mascota_vacuna_vacuna_id_c4ee45ea_fk_mascotas_vacuna_id` FOREIGN KEY (`vacuna_id`) REFERENCES `mascotas_vacuna` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas_mascota_vacuna` */

insert  into `mascotas_mascota_vacuna`(`id`,`mascota_id`,`vacuna_id`) values 
(1,5,1),
(2,5,2),
(3,6,1),
(4,6,3),
(5,7,1),
(6,7,4),
(7,8,3),
(8,8,4),
(9,9,1),
(10,9,2),
(11,9,4),
(12,10,1),
(13,10,2),
(14,10,3),
(15,11,1),
(16,11,2),
(17,11,3),
(18,11,4),
(19,12,4);

/*Table structure for table `mascotas_persona` */

DROP TABLE IF EXISTS `mascotas_persona`;

CREATE TABLE `mascotas_persona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas_persona` */

insert  into `mascotas_persona`(`id`,`nombre`,`apellidos`,`edad`,`telefono`,`correo`,`direccion`) values 
(1,'Yobani','Chicunque',24,'3166769442','yobanichicunque@gmail.com','Barrio Jose Homero'),
(2,'Sandra','Herrera',26,'3172470955','sapatrich@gmail.com','Barrio Los Sauces'),
(3,'Mirian','Jajoy',40,'3217720626','mirianjajoy@gmail.com','Barrio Comercial');

/*Table structure for table `mascotas_vacuna` */

DROP TABLE IF EXISTS `mascotas_vacuna`;

CREATE TABLE `mascotas_vacuna` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mascotas_vacuna` */

insert  into `mascotas_vacuna`(`id`,`nombre`) values 
(1,'Antirrabica'),
(2,'Hepatitis'),
(3,'Parvovirus'),
(4,'Moquillo');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
