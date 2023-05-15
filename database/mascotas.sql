/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - mascotas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mascotas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `mascotas`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(25,'Can add mascota',7,'add_mascota'),
(26,'Can change mascota',7,'change_mascota'),
(27,'Can delete mascota',7,'delete_mascota'),
(28,'Can view mascota',7,'view_mascota'),
(29,'Can add vacunas',8,'add_vacunas'),
(30,'Can change vacunas',8,'change_vacunas'),
(31,'Can delete vacunas',8,'delete_vacunas'),
(32,'Can view vacunas',8,'view_vacunas');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$HFHJP0iCtiba5PWFwcHV0P$z3yxROFZt9cSMcfU8wosrYHP9bIdX04sNoFNeIZzKlE=','2023-04-28 07:58:32.222475',1,'admin','yobani','chicunque','yobanichicunque@gmail.com',1,1,'2023-04-28 07:12:27.722587');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2023-04-28 07:47:38.045861','1','vacunas object (1)',1,'[{\"added\": {}}]',8,1),
(2,'2023-04-28 07:47:45.370711','2','vacunas object (2)',1,'[{\"added\": {}}]',8,1),
(3,'2023-04-28 07:47:55.960968','3','vacunas object (3)',1,'[{\"added\": {}}]',8,1),
(4,'2023-04-28 07:48:07.660642','4','vacunas object (4)',1,'[{\"added\": {}}]',8,1),
(5,'2023-04-28 07:48:14.038139','5','vacunas object (5)',1,'[{\"added\": {}}]',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'mascotas','mascota'),
(8,'mascotas','vacunas'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-04-28 07:08:48.387215'),
(2,'auth','0001_initial','2023-04-28 07:09:01.808089'),
(3,'admin','0001_initial','2023-04-28 07:09:04.218568'),
(4,'admin','0002_logentry_remove_auto_add','2023-04-28 07:09:04.283769'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-04-28 07:09:04.387756'),
(6,'contenttypes','0002_remove_content_type_name','2023-04-28 07:09:05.968587'),
(7,'auth','0002_alter_permission_name_max_length','2023-04-28 07:09:08.930388'),
(8,'auth','0003_alter_user_email_max_length','2023-04-28 07:09:11.209449'),
(9,'auth','0004_alter_user_username_opts','2023-04-28 07:09:11.306588'),
(10,'auth','0005_alter_user_last_login_null','2023-04-28 07:09:13.532266'),
(11,'auth','0006_require_contenttypes_0002','2023-04-28 07:09:13.599844'),
(12,'auth','0007_alter_validators_add_error_messages','2023-04-28 07:09:13.782504'),
(13,'auth','0008_alter_user_username_max_length','2023-04-28 07:09:13.930412'),
(14,'auth','0009_alter_user_last_name_max_length','2023-04-28 07:09:14.113268'),
(15,'auth','0010_alter_group_name_max_length','2023-04-28 07:09:15.423390'),
(16,'auth','0011_update_proxy_permissions','2023-04-28 07:09:15.519773'),
(17,'auth','0012_alter_user_first_name_max_length','2023-04-28 07:09:15.703659'),
(18,'mascotas','0001_initial','2023-04-28 07:09:16.327322'),
(19,'mascotas','0002_mascota','2023-04-28 07:09:19.546005'),
(20,'mascotas','0003_auto_20230427_1855','2023-04-28 07:09:19.994298'),
(21,'mascotas','0004_delete_vacuna','2023-04-28 07:09:21.250523'),
(22,'sessions','0001_initial','2023-04-28 07:09:24.012614'),
(23,'mascotas','0005_vacunas','2023-04-28 07:45:01.483164'),
(24,'mascotas','0006_mascota_relacion','2023-04-28 07:54:02.383536');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `django_session` */

/*Table structure for table `mascotas_mascota` */

DROP TABLE IF EXISTS `mascotas_mascota`;

CREATE TABLE `mascotas_mascota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `vacuna` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mascotas_mascota` */

insert  into `mascotas_mascota`(`id`,`nombre`,`edad`,`foto`,`vacuna`) values 
(1,'Dalia',1,'imagenes/5ec787464764f945348147.jpg','Antirrabica'),
(2,'Coco',3,'imagenes/57f671c488c99a4726772c3796c11b6d.jpg','Hepatitis'),
(3,'Sultán',1,'imagenes/cachorros.jpg','Parvovirus'),
(4,'Cokis',1,'imagenes/Consejos-para-cuidar-perros-de-raza-pequena.jpg','Moquillo'),
(5,'Tobi',2,'imagenes/fb52380525d257ed09aaa215db86a9fd.jpg','Antibacterias'),
(6,'Chestri',4,'imagenes/perritos-de-instagram-1616062929.jpg','Hepatitis'),
(7,'Teo',6,'imagenes/perro_papillon_23762_4_600.jpg','Antibacterias'),
(8,'Espartano',2,'imagenes/top_6_de_perros_pequenos_de_pelo_corto_8319_600_square.jpg','Moquillo');

/*Table structure for table `mascotas_mascota_relacion` */

DROP TABLE IF EXISTS `mascotas_mascota_relacion`;

CREATE TABLE `mascotas_mascota_relacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mascota_id` int(11) NOT NULL,
  `vacunas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mascotas_mascota_relacion_mascota_id_vacunas_id_54f281fa_uniq` (`mascota_id`,`vacunas_id`),
  KEY `mascotas_mascota_rel_vacunas_id_37308538_fk_mascotas_` (`vacunas_id`),
  CONSTRAINT `mascotas_mascota_rel_mascota_id_f6bfcf38_fk_mascotas_` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas_mascota` (`id`),
  CONSTRAINT `mascotas_mascota_rel_vacunas_id_37308538_fk_mascotas_` FOREIGN KEY (`vacunas_id`) REFERENCES `mascotas_vacunas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mascotas_mascota_relacion` */

/*Table structure for table `mascotas_vacunas` */

DROP TABLE IF EXISTS `mascotas_vacunas`;

CREATE TABLE `mascotas_vacunas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mascotas_vacunas` */

insert  into `mascotas_vacunas`(`id`,`nombre`) values 
(1,'Antirrábica'),
(2,'Hepatitis'),
(3,'Parvovirus'),
(4,'Moquillo'),
(5,'Antibacterias');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
