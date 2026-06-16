/*
 Navicat Premium Dump SQL

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 90300 (9.3.0)
 Source Host           : localhost:3306
 Source Schema         : form_builder

 Target Server Type    : MySQL
 Target Server Version : 90300 (9.3.0)
 File Encoding         : 65001

 Date: 16/06/2026 13:03:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (25, 'Can add section', 7, 'add_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (26, 'Can change section', 7, 'change_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (27, 'Can delete section', 7, 'delete_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (28, 'Can view section', 7, 'view_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (29, 'Can add form', 8, 'add_form');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (30, 'Can change form', 8, 'change_form');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (31, 'Can delete form', 8, 'delete_form');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (32, 'Can view form', 8, 'view_form');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (33, 'Can add field choice', 9, 'add_fieldchoice');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (34, 'Can change field choice', 9, 'change_fieldchoice');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (35, 'Can delete field choice', 9, 'delete_fieldchoice');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (36, 'Can view field choice', 9, 'view_fieldchoice');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (37, 'Can add field', 10, 'add_field');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (38, 'Can change field', 10, 'change_field');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (39, 'Can delete field', 10, 'delete_field');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (40, 'Can view field', 10, 'view_field');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (10, 'form_builder', 'field');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (9, 'form_builder', 'fieldchoice');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (8, 'form_builder', 'form');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (7, 'form_builder', 'section');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1, 'contenttypes', '0001_initial', '2026-05-20 17:02:29.073935');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2, 'auth', '0001_initial', '2026-05-20 17:02:29.289851');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3, 'admin', '0001_initial', '2026-05-20 17:02:29.368878');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2026-05-20 17:02:29.390009');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2026-05-20 17:02:29.396837');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2026-05-20 17:02:29.470342');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2026-05-20 17:02:29.501302');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2026-05-20 17:02:29.523011');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9, 'auth', '0004_alter_user_username_opts', '2026-05-20 17:02:29.531374');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2026-05-20 17:02:29.561007');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2026-05-20 17:02:29.564187');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2026-05-20 17:02:29.573360');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2026-05-20 17:02:29.609121');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2026-05-20 17:02:29.642724');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2026-05-20 17:02:29.657458');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16, 'auth', '0011_update_proxy_permissions', '2026-05-20 17:02:29.666257');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2026-05-20 17:02:29.698498');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18, 'sessions', '0001_initial', '2026-05-20 17:02:29.716674');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (19, 'form_builder', '0001_initial', '2026-05-21 15:29:15.885685');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (20, 'form_builder', '0002_alter_fieldchoice_field', '2026-05-22 11:47:51.343026');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (21, 'form_builder', '0003_alter_field_field_type', '2026-06-12 14:30:37.390020');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for form_builder_field
-- ----------------------------
DROP TABLE IF EXISTS `form_builder_field`;
CREATE TABLE `form_builder_field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `field_type` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `section_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_builder_field_section_id_e56b4ab7_fk_form_buil` (`section_id`),
  CONSTRAINT `form_builder_field_section_id_e56b4ab7_fk_form_buil` FOREIGN KEY (`section_id`) REFERENCES `form_builder_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of form_builder_field
-- ----------------------------
BEGIN;
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (83, 'First Name', 'text', '2026-06-12 16:46:44.141372', '2026-06-12 16:46:44.141401', 38);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (84, 'Last Name', 'text', '2026-06-12 16:46:44.143856', '2026-06-12 16:46:44.143881', 38);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (85, 'Gender', 'radio', '2026-06-12 16:46:44.146700', '2026-06-12 16:46:44.146733', 38);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (86, 'Poid', 'checkbox', '2026-06-12 16:46:44.151608', '2026-06-12 16:46:44.151628', 38);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (87, 'First Name', 'text', '2026-06-16 10:20:16.138164', '2026-06-16 10:20:16.138191', 39);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (88, 'Last Name', 'text', '2026-06-16 10:20:16.140874', '2026-06-16 10:20:16.140902', 39);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (89, 'Gender', 'select', '2026-06-16 10:20:16.143469', '2026-06-16 10:20:16.143496', 39);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (90, 'Name', 'text', '2026-06-16 10:20:16.163455', '2026-06-16 10:20:16.163482', 40);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (91, 'Taille', 'radio', '2026-06-16 10:20:16.165700', '2026-06-16 10:20:16.165725', 40);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (92, 'First Name', 'text', '2026-06-16 10:22:23.349172', '2026-06-16 10:22:23.349200', 41);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (93, 'First Name', 'text', '2026-06-16 10:22:23.353320', '2026-06-16 10:22:23.353346', 41);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (94, 'Wight', 'text', '2026-06-16 10:22:23.355245', '2026-06-16 10:22:23.355268', 41);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (95, 'Password', 'password', '2026-06-16 10:22:23.358223', '2026-06-16 10:22:23.358252', 41);
INSERT INTO `form_builder_field` (`id`, `label`, `field_type`, `created_at`, `updated_at`, `section_id`) VALUES (96, 'Gendre', 'radio', '2026-06-16 10:22:23.360455', '2026-06-16 10:22:23.360480', 41);
COMMIT;

-- ----------------------------
-- Table structure for form_builder_fieldchoice
-- ----------------------------
DROP TABLE IF EXISTS `form_builder_fieldchoice`;
CREATE TABLE `form_builder_fieldchoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(255) NOT NULL,
  `choice_value` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `field_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_builder_fieldch_field_id_2f574409_fk_form_buil` (`field_id`),
  CONSTRAINT `form_builder_fieldch_field_id_2f574409_fk_form_buil` FOREIGN KEY (`field_id`) REFERENCES `form_builder_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of form_builder_fieldchoice
-- ----------------------------
BEGIN;
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (47, 'Male', '', '2026-06-12 16:46:44.149131', '2026-06-12 16:46:44.149156', 85);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (48, 'Female', '', '2026-06-12 16:46:44.150399', '2026-06-12 16:46:44.150421', 85);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (49, '>70', '', '2026-06-12 16:46:44.153740', '2026-06-12 16:46:44.153763', 86);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (50, '<70', '', '2026-06-12 16:46:44.154932', '2026-06-12 16:46:44.154952', 86);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (51, '=70', '', '2026-06-12 16:46:44.156267', '2026-06-12 16:46:44.156289', 86);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (52, 'Male', '', '2026-06-16 10:20:16.154788', '2026-06-16 10:20:16.154815', 89);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (53, 'Female', '', '2026-06-16 10:20:16.158238', '2026-06-16 10:20:16.158267', 89);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (54, 'up 1.80', '', '2026-06-16 10:20:16.168032', '2026-06-16 10:20:16.168056', 91);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (55, 'Under 1.80', '', '2026-06-16 10:20:16.171131', '2026-06-16 10:20:16.171194', 91);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (56, 'Male', '', '2026-06-16 10:22:23.362472', '2026-06-16 10:22:23.362496', 96);
INSERT INTO `form_builder_fieldchoice` (`id`, `choice_text`, `choice_value`, `created_at`, `updated_at`, `field_id`) VALUES (57, 'Female', '', '2026-06-16 10:22:23.363852', '2026-06-16 10:22:23.363874', 96);
COMMIT;

-- ----------------------------
-- Table structure for form_builder_form
-- ----------------------------
DROP TABLE IF EXISTS `form_builder_form`;
CREATE TABLE `form_builder_form` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of form_builder_form
-- ----------------------------
BEGIN;
INSERT INTO `form_builder_form` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (11, 'info Questionnaire', '', '2026-06-04 11:17:56.647176', '2026-06-12 16:46:44.135932');
INSERT INTO `form_builder_form` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (16, 'Questionnaire Perso', '', '2026-06-08 10:54:09.572415', '2026-06-16 10:20:16.114978');
INSERT INTO `form_builder_form` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (19, 'Check Form', '', '2026-06-16 10:20:58.054598', '2026-06-16 10:22:23.344781');
COMMIT;

-- ----------------------------
-- Table structure for form_builder_section
-- ----------------------------
DROP TABLE IF EXISTS `form_builder_section`;
CREATE TABLE `form_builder_section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `form_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_builder_section_form_id_ee266ef3_fk_form_builder_form_id` (`form_id`),
  CONSTRAINT `form_builder_section_form_id_ee266ef3_fk_form_builder_form_id` FOREIGN KEY (`form_id`) REFERENCES `form_builder_form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of form_builder_section
-- ----------------------------
BEGIN;
INSERT INTO `form_builder_section` (`id`, `name`, `created_at`, `updated_at`, `form_id`) VALUES (38, 'Personal Informations', '2026-06-12 16:46:44.138131', '2026-06-12 16:46:44.138157', 11);
INSERT INTO `form_builder_section` (`id`, `name`, `created_at`, `updated_at`, `form_id`) VALUES (39, 'Personal Information', '2026-06-16 10:20:16.135471', '2026-06-16 10:20:16.135529', 16);
INSERT INTO `form_builder_section` (`id`, `name`, `created_at`, `updated_at`, `form_id`) VALUES (40, 'Section 02', '2026-06-16 10:20:16.160601', '2026-06-16 10:20:16.160628', 16);
INSERT INTO `form_builder_section` (`id`, `name`, `created_at`, `updated_at`, `form_id`) VALUES (41, 'Question 01', '2026-06-16 10:22:23.346629', '2026-06-16 10:22:23.346653', 19);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
