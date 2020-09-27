-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: joh_ltd_com
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `agent_inquiry_attrs`
--

DROP TABLE IF EXISTS `agent_inquiry_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_inquiry_attrs` (
  `agent_inquiry_id` varchar(64) NOT NULL COMMENT '代理店問合せID',
  `attr_def_id` varchar(64) NOT NULL COMMENT '属性定義ID',
  `attr_value` varchar(1024) DEFAULT NULL COMMENT '属性値',
  `publish` int(11) NOT NULL DEFAULT 0 COMMENT '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`agent_inquiry_id`,`attr_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理店問合せ属性トラン';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_inquiry_attrs`
--

LOCK TABLES `agent_inquiry_attrs` WRITE;
/*!40000 ALTER TABLE `agent_inquiry_attrs` DISABLE KEYS */;
INSERT INTO `agent_inquiry_attrs` VALUES ('5f70ac6eca226','address','東京都新宿区○－○－○　××ビル１０Ｆ',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','charge_person_name','牛山修二',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','charge_person_name_kana','ウシヤマシュウジ',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','company_name','株式会社サンプル',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','contact_email','shuji.ushiyama@gmail.com',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','contact_tel_no','09012345678',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','message','これはテストです。',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0),('5f70ac6eca226','zip_no','1234567',1,1601219694,'*',1601219694,'*','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `agent_inquiry_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_inquirys`
--

DROP TABLE IF EXISTS `agent_inquirys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_inquirys` (
  `id` varchar(64) NOT NULL COMMENT '代理店問合せID',
  `inquiry_dtm` datetime NOT NULL COMMENT '問合せ日時',
  `email_attr_id` varchar(64) NOT NULL COMMENT 'メールアドレス属性ID',
  `progress` int(11) NOT NULL DEFAULT 0 COMMENT '進捗:0:作成 1:管理者確認済み 2:回答済',
  `reply_dtm` datetime DEFAULT NULL COMMENT '回答日時',
  `reply_user_id` varchar(64) DEFAULT NULL COMMENT '回答担当者ID',
  `reply_content` text DEFAULT NULL COMMENT '回答内容',
  `user_id` varchar(64) DEFAULT NULL COMMENT '利用者ID',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理店問合せトラン';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_inquirys`
--

LOCK TABLES `agent_inquirys` WRITE;
/*!40000 ALTER TABLE `agent_inquirys` DISABLE KEYS */;
INSERT INTO `agent_inquirys` VALUES ('5f70ac6eca226','2020-09-28 00:14:54','contact_email',0,NULL,NULL,NULL,'5f70b7399f0e2',1601219694,'*',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `agent_inquirys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attr_def_groups`
--

DROP TABLE IF EXISTS `attr_def_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attr_def_groups` (
  `id` varchar(64) NOT NULL COMMENT '属性定義グループID',
  `name` varchar(255) DEFAULT NULL COMMENT '属性定義グループ名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='属性定義グループマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_def_groups`
--

LOCK TABLES `attr_def_groups` WRITE;
/*!40000 ALTER TABLE `attr_def_groups` DISABLE KEYS */;
INSERT INTO `attr_def_groups` VALUES ('agent','代理店情報属性','代理店情報として保持する属性',0,'*',0,'*','*',0),('user','会員情報属性','会員情報として保持する属性',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `attr_def_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attr_def_rels`
--

DROP TABLE IF EXISTS `attr_def_rels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attr_def_rels` (
  `attr_def_group_id_1` varchar(64) NOT NULL COMMENT '属性定義グループID①',
  `attr_def_id_1` varchar(64) NOT NULL COMMENT '属性定義ID①',
  `attr_def_group_id_2` varchar(64) NOT NULL COMMENT '属性定義グループID②',
  `attr_def_id_2` varchar(64) NOT NULL COMMENT '属性定義ID②',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`attr_def_group_id_1`,`attr_def_id_1`,`attr_def_group_id_2`,`attr_def_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='属性定義属性種類関連マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_def_rels`
--

LOCK TABLES `attr_def_rels` WRITE;
/*!40000 ALTER TABLE `attr_def_rels` DISABLE KEYS */;
INSERT INTO `attr_def_rels` VALUES ('agent','charge_person_name','user','full_name',0,'*',0,'*','*',0),('agent','charge_person_name_kana','user','full_name_kana',0,'*',0,'*','*',0),('agent','company_name','user','company_name',0,'*',0,'*','*',0),('agent','contact_tel_no','user','tel_no',0,'*',0,'*','*',0),('user','company_name','agent','company_name',0,'*',0,'*','*',0),('user','full_name','agent','charge_person_name',0,'*',0,'*','*',0),('user','full_name_kana','agent','charge_person_name_kana',0,'*',0,'*','*',0),('user','tel_no','agent','contact_tel_no',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `attr_def_rels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attr_defs`
--

DROP TABLE IF EXISTS `attr_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attr_defs` (
  `attr_def_group_id` varchar(64) NOT NULL COMMENT '属性定義グループID',
  `id` varchar(64) NOT NULL COMMENT '属性定義ID',
  `name` varchar(255) NOT NULL COMMENT '属性名',
  `example` text DEFAULT NULL COMMENT '例:placefolder属性に展開',
  `hint` text DEFAULT NULL COMMENT 'ヒント:title属性に展開',
  `require_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '必須フラグ',
  `text_type` varchar(1024) DEFAULT NULL COMMENT 'テキスト入力タイプ:INPUTタグに展開される際のtype属性の値。無指定では「text」となる。型が1の場合だけ有効',
  `default_attr_value` varchar(1024) DEFAULT NULL COMMENT 'デフォルト属性値',
  `value_type` int(11) NOT NULL COMMENT '型:1:文字列 11:複数行文字列 2:整数 3:浮動小数 4:日付 5:時刻 6:区分選択 7:画像 8:ファイル 9:フラグ 99:その他',
  `min_length` int(11) DEFAULT NULL COMMENT '最小桁数',
  `max_length` int(11) DEFAULT NULL COMMENT '最大桁数',
  `regex` varchar(1024) DEFAULT NULL COMMENT '文字列パターン',
  `regex_unmatch` varchar(1024) DEFAULT NULL COMMENT '文字列パターン不一致',
  `min_bigint_value` bigint(20) DEFAULT NULL COMMENT '整数最小値',
  `max_bigint_value` bigint(20) DEFAULT NULL COMMENT '整数最大値',
  `bigint_step_value` bigint(20) DEFAULT NULL COMMENT '整数変動量:画面でスピンボタンで変更した場合の変動量（未指定の場合、1とみなす）',
  `min_double_value` double DEFAULT NULL COMMENT '浮動小数最小値',
  `max_double_value` double DEFAULT NULL COMMENT '浮動小数最大値',
  `double_step_value` double DEFAULT NULL COMMENT '浮動小数変動量:画面でスピンボタンで変更した場合の変動量（未指定の場合、1.0とみなす）',
  `start_date` date DEFAULT NULL COMMENT '開始日付',
  `end_date` date DEFAULT NULL COMMENT '終了日付',
  `start_time` time DEFAULT NULL COMMENT '開始時刻',
  `end_time` time DEFAULT NULL COMMENT '終了時刻',
  `selector_division_id` varchar(64) DEFAULT NULL COMMENT '選択肢区分ID',
  `selector_pattern` int(11) DEFAULT NULL COMMENT '選択形式:1:ドロップダウンリスト単一選択 2:ラジオボタン 3:チェックボックス 4:リストボックス単一選択 5:リストボックス複数選択',
  `max_height_px` int(11) DEFAULT NULL COMMENT '画像最大高ピクセル',
  `max_width_px` int(11) DEFAULT NULL COMMENT '画像最大幅ピクセル',
  `limit_file_size` int(11) DEFAULT NULL COMMENT '最大サイズ（MB）',
  `accept_extents` varchar(1024) DEFAULT NULL COMMENT '許可拡張子',
  `other_type_name` varchar(255) DEFAULT NULL COMMENT 'その他タイプ識別名',
  `input_width` int(11) DEFAULT NULL COMMENT '入力時の領域幅:入力項目として表示している際の、表示幅を文字数で指定する',
  `input_height` int(11) DEFAULT NULL COMMENT '入力時の領域高:入力項目として表示している際の、表示高を行数で指定する',
  `flag_label` text DEFAULT NULL COMMENT 'フラグ文言:チェックボックスのラベル',
  `flag_false_label` text DEFAULT NULL COMMENT 'フラグ文言（否定）:チェックボックスがチェックされない場合に表示される文言',
  `flag_label_display` int(11) DEFAULT NULL COMMENT 'フラグ文言表示:0:文言非表示 1:チェックボックスの左側に表示 2:チェックボックスの右側に表示',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `publish` int(11) NOT NULL DEFAULT 0 COMMENT '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`attr_def_group_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='属性定義マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_defs`
--

LOCK TABLES `attr_defs` WRITE;
/*!40000 ALTER TABLE `attr_defs` DISABLE KEYS */;
INSERT INTO `attr_defs` VALUES ('agent','address','住所','例：都道府県○○市○○町1丁目1-1 建物名','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,NULL,NULL,NULL,NULL,6,1,0,'*',0,'*','*',0),('agent','charge_person_name','ご担当者名','ご担当者名を入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,NULL,NULL,NULL,2,1,0,'*',0,'*','*',0),('agent','charge_person_name_kana','フリガナ','フリガナを入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,NULL,NULL,NULL,3,1,0,'*',0,'*','*',0),('agent','company_name','会社名','会社名を入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,NULL,NULL,NULL,1,1,0,'*',0,'*','*',0),('agent','contact_email','連絡先E-mail','Eメールアドレスを入力してください','※半角英数字',1,'email','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,NULL,NULL,NULL,NULL,7,1,0,'*',0,'*','*',0),('agent','contact_tel_no','連絡先電話番号','例：08012345678','',1,'tel','',1,NULL,NULL,'^[0-9]+[\\-]?[0-9]+[\\-]?[0-9]+$','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,NULL,NULL,NULL,4,1,0,'*',0,'*','*',0),('agent','message','メッセージ','最大1000文字','',0,'','',11,NULL,1000,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,5,NULL,NULL,NULL,8,1,0,'*',0,'*','*',0),('agent','zip_no','郵便番号','例：1234567','',1,'','',1,NULL,7,'^[0-9]{7}$','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',10,NULL,NULL,NULL,NULL,5,1,0,'*',0,'*','*',0),('user','company_name','会社名',NULL,NULL,1,NULL,'',1,NULL,256,'',NULL,NULL,NULL,NULL,-9.9,9.9,0.1,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,4,NULL,NULL,NULL,6,1,0,'*',0,'*','*',0),('user','company_name_kana','会社名（フリガナ）',NULL,NULL,1,NULL,'',1,NULL,256,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,NULL,NULL,NULL,7,1,0,'*',0,'*','*',0),('user','employee_cout','従業員数',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'employee_cout',1,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,8,1,0,'*',0,'*','*',0),('user','full_name','お名前',NULL,NULL,1,NULL,'',1,NULL,64,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,NULL,NULL,NULL,1,1,0,'*',0,'*','*',0),('user','full_name_kana','フリガナ',NULL,NULL,1,NULL,'',1,NULL,64,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,NULL,NULL,NULL,2,1,0,'*',0,'*','*',0),('user','industry','業種',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'industries',1,NULL,NULL,NULL,'','',NULL,5,NULL,NULL,NULL,9,1,0,'*',0,'*','*',0),('user','prefecture','都道府県',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'prefectures',1,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,4,1,0,'*',0,'*','*',0),('user','purpose_use','ご利用の目的',NULL,NULL,1,NULL,NULL,6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'purpose_use',2,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,5,1,0,'*',0,'*','*',0),('user','qa_how_know','GoodLifeを知ったきっかけ',NULL,NULL,1,NULL,'',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'how_know_answer',3,NULL,NULL,NULL,'','',40,NULL,NULL,NULL,NULL,11,1,0,'*',0,'*','*',0),('user','qa_post_is_first','ポスト投稿は初めてですか？',NULL,NULL,1,NULL,'',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'post_is_first_answer',2,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,10,1,0,'*',0,'*','*',0),('user','tel_no','電話番号',NULL,NULL,1,'tel','',1,NULL,14,'^[0-9]+[\\-]?[0-9]+[\\-]?[0-9]+$',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',12,NULL,NULL,NULL,NULL,3,1,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `attr_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campanys`
--

DROP TABLE IF EXISTS `campanys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campanys` (
  `id` varchar(64) NOT NULL COMMENT '会社ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `logo_path` varchar(1024) DEFAULT NULL COMMENT '会社ロゴ画像:ロゴ画像の格納先のパス',
  `tel_no` varchar(14) DEFAULT NULL COMMENT '電話番号',
  `zip_no` varchar(7) DEFAULT NULL COMMENT '郵便番号',
  `address` varchar(255) DEFAULT NULL COMMENT '住所',
  `building` varchar(255) DEFAULT NULL COMMENT '建物',
  `business_hours` varchar(1024) DEFAULT NULL COMMENT '営業時間',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会社マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campanys`
--

LOCK TABLES `campanys` WRITE;
/*!40000 ALTER TABLE `campanys` DISABLE KEYS */;
INSERT INTO `campanys` VALUES ('*','株式会社JOH',NULL,'03-6869-3787','107-006','東京都港区南青山二丁目2番15号','ウィン青山942','平日9:00～17:30',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `campanys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caompany_workdays`
--

DROP TABLE IF EXISTS `caompany_workdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caompany_workdays` (
  `id` varchar(64) NOT NULL COMMENT '会社ID',
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL COMMENT '日',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会社別勤務日マスタ:休日及び祭日、会社休日に設定されている休日を勤務日として上書き設定する';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caompany_workdays`
--

LOCK TABLES `caompany_workdays` WRITE;
/*!40000 ALTER TABLE `caompany_workdays` DISABLE KEYS */;
/*!40000 ALTER TABLE `caompany_workdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `theme_id` varchar(64) NOT NULL COMMENT 'テーマID',
  `category` varchar(128) NOT NULL COMMENT '分類',
  `id` varchar(64) NOT NULL COMMENT '色ID',
  `fore_color` varchar(32) DEFAULT NULL COMMENT '前景色',
  `back_color` varchar(32) DEFAULT NULL COMMENT '背景色',
  `border_color` varchar(32) DEFAULT NULL COMMENT '境界線色',
  `descrption` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`theme_id`,`category`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='色マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES ('*','border','Separated',NULL,NULL,'#cccccc',NULL,0,'*',0,'*','*',0),('*','button','Main','white','#00a0e8','#00a0e8',NULL,0,'*',0,'*','*',0),('*','button','Sub','#00a0e8','white','#00a0e8',NULL,0,'*',0,'*','*',0),('*','button','TypeA','white','#d81243',NULL,NULL,0,'*',0,'*','*',0),('*','button','TypeB','white','#1b5a9d',NULL,NULL,0,'*',0,'*','*',0),('*','button','TypeC','black','white','#555555',NULL,0,'*',0,'*','*',0),('*','default','All','black','white',NULL,NULL,0,'*',0,'*','*',0),('*','form','Text','black','white','#cccccc',NULL,0,'*',0,'*','*',0),('*','label','Copyright','white','transparent',NULL,NULL,0,'*',0,'*','*',0),('*','label','MenuItem','#4472c4',NULL,NULL,NULL,0,'*',0,'*','*',0),('*','label','WarningText','#ffc000',NULL,NULL,NULL,0,'*',0,'*','*',0),('*','label','Welcome','black',NULL,NULL,NULL,0,'*',0,'*','*',0),('*','link','Text','#0000ff',NULL,NULL,NULL,0,'*',0,'*','*',0),('*','panel','Footer','white','#7f7f7f',NULL,NULL,0,'*',0,'*','*',0),('*','panel','MenuBar',NULL,'#f2f2f2',NULL,NULL,0,'*',0,'*','*',0),('*','panel','Separator',NULL,NULL,'#4472c4',NULL,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_holidays`
--

DROP TABLE IF EXISTS `company_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_holidays` (
  `id` varchar(64) NOT NULL COMMENT '会社ID',
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL COMMENT '日',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会社別祭日マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_holidays`
--

LOCK TABLES `company_holidays` WRITE;
/*!40000 ALTER TABLE `company_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dates` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `reference_date` date NOT NULL COMMENT '基準日',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日付マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES ('*','2020-08-24',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_values`
--

DROP TABLE IF EXISTS `division_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division_values` (
  `division_id` varchar(64) NOT NULL COMMENT '区分ID',
  `id` varchar(64) NOT NULL COMMENT '区分値ID',
  `name` varchar(255) DEFAULT NULL COMMENT '区分値名称',
  `value` varchar(1024) DEFAULT NULL COMMENT '区分値',
  `public_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`division_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区分値マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_values`
--

LOCK TABLES `division_values` WRITE;
/*!40000 ALTER TABLE `division_values` DISABLE KEYS */;
INSERT INTO `division_values` VALUES ('agent_applies','apply','代理店として申請する','apply',1,1,0,'*',0,'*','*',0),('employee_cout','*','従業員数を選択してください','0',1,0,0,'*',0,'*','*',0),('employee_cout','1','個人事業主','1',1,1,0,'*',0,'*','*',0),('employee_cout','2','10人未満','2',1,2,0,'*',0,'*','*',0),('employee_cout','3','10人以上50人未満','3',1,3,0,'*',0,'*','*',0),('employee_cout','4','50人以上100人未満','4',1,4,0,'*',0,'*','*',0),('employee_cout','5','100人以上','5',1,5,0,'*',0,'*','*',0),('how_know_answer','1','紹介（社内・口コミ）','1',1,1,0,'*',0,'*','*',0),('how_know_answer','10','その他','10',1,10,0,'*',0,'*','*',0),('how_know_answer','2','ソーシャルメディア','2',1,2,0,'*',0,'*','*',0),('how_know_answer','3','インターネット上の記事','3',1,3,0,'*',0,'*','*',0),('how_know_answer','4','テレビCM','4',1,4,0,'*',0,'*','*',0),('how_know_answer','5','テレビ番組','5',1,5,0,'*',0,'*','*',0),('how_know_answer','6','ニュース新聞記事','6',1,6,0,'*',0,'*','*',0),('how_know_answer','7','広告雑誌記事','7',1,7,0,'*',0,'*','*',0),('how_know_answer','8','広告インターネット','8',1,8,0,'*',0,'*','*',0),('how_know_answer','9','広告イベント','9',1,9,0,'*',0,'*','*',0),('industries','*','業種を選択してください','0',1,0,0,'*',0,'*','*',0),('industries','1','飲食','1',1,1,0,'*',0,'*','*',0),('industries','10','学校教育','10',1,10,0,'*',0,'*','*',0),('industries','11','その他教育・保育','11',1,11,0,'*',0,'*','*',0),('industries','12','人材サービス','12',1,12,0,'*',0,'*','*',0),('industries','13','弁護士・会計士等士業','13',1,13,0,'*',0,'*','*',0),('industries','14','コンサルティング','14',1,14,0,'*',0,'*','*',0),('industries','15','マスコミ・広告','15',1,15,0,'*',0,'*','*',0),('industries','16','デザイン・アート','16',1,16,0,'*',0,'*','*',0),('industries','17','印刷 IT・通信','17',1,17,0,'*',0,'*','*',0),('industries','18','電気・ガス・水道','18',1,18,0,'*',0,'*','*',0),('industries','19','製造・運輸','19',1,19,0,'*',0,'*','*',0),('industries','2','小売・卸売','2',1,2,0,'*',0,'*','*',0),('industries','20','農業・林業・漁業','20',1,20,0,'*',0,'*','*',0),('industries','21','土木・建設','21',1,21,0,'*',0,'*','*',0),('industries','22','金融・保険','22',1,22,0,'*',0,'*','*',0),('industries','23','商社 官公庁','23',1,23,0,'*',0,'*','*',0),('industries','24','宗教法人','24',1,24,0,'*',0,'*','*',0),('industries','25','団体・組合','25',1,25,0,'*',0,'*','*',0),('industries','3','美容・エステ','3',1,3,0,'*',0,'*','*',0),('industries','4','不動産','4',1,4,0,'*',0,'*','*',0),('industries','5','旅行・宿泊','5',1,5,0,'*',0,'*','*',0),('industries','6','レジャー・娯楽','6',1,6,0,'*',0,'*','*',0),('industries','7','スポーツ','7',1,7,0,'*',0,'*','*',0),('industries','8','冠婚葬祭','8',1,8,0,'*',0,'*','*',0),('industries','9','医療・福祉','9',1,9,0,'*',0,'*','*',0),('industries','99','その他','99',1,99,0,'*',0,'*','*',0),('post_is_first_answer','no','いいえ','no',1,2,0,'*',0,'*','*',0),('post_is_first_answer','yes','はい、初めてです','yes',1,1,0,'*',0,'*','*',0),('prefectures','*','都道府県を選択してください','00',1,0,0,'*',0,'*','*',0),('prefectures','01','北海道','01',1,1,0,'*',0,'*','*',0),('prefectures','02','青森県','02',1,2,0,'*',0,'*','*',0),('prefectures','03','岩手県','03',1,3,0,'*',0,'*','*',0),('prefectures','04','宮城県','04',1,4,0,'*',0,'*','*',0),('prefectures','05','秋田県','05',1,5,0,'*',0,'*','*',0),('prefectures','06','山形県','06',1,6,0,'*',0,'*','*',0),('prefectures','07','福島県','07',1,7,0,'*',0,'*','*',0),('prefectures','08','茨城県','08',1,8,0,'*',0,'*','*',0),('prefectures','09','栃木県','09',1,9,0,'*',0,'*','*',0),('prefectures','10','群馬県','10',1,10,0,'*',0,'*','*',0),('prefectures','11','埼玉県','11',1,11,0,'*',0,'*','*',0),('prefectures','12','千葉県','12',1,12,0,'*',0,'*','*',0),('prefectures','13','東京都','13',1,13,0,'*',0,'*','*',0),('prefectures','14','神奈川県','14',1,14,0,'*',0,'*','*',0),('prefectures','15','新潟県','15',1,15,0,'*',0,'*','*',0),('prefectures','16','富山県','16',1,16,0,'*',0,'*','*',0),('prefectures','17','石川県','17',1,17,0,'*',0,'*','*',0),('prefectures','18','福井県','18',1,18,0,'*',0,'*','*',0),('prefectures','19','山梨県','19',1,19,0,'*',0,'*','*',0),('prefectures','20','長野県','20',1,20,0,'*',0,'*','*',0),('prefectures','21','岐阜県','21',1,21,0,'*',0,'*','*',0),('prefectures','22','静岡県','22',1,22,0,'*',0,'*','*',0),('prefectures','23','愛知県','23',1,23,0,'*',0,'*','*',0),('prefectures','24','三重県','24',1,24,0,'*',0,'*','*',0),('prefectures','25','滋賀県','25',1,25,0,'*',0,'*','*',0),('prefectures','26','京都府','26',1,26,0,'*',0,'*','*',0),('prefectures','27','大阪府','27',1,27,0,'*',0,'*','*',0),('prefectures','28','兵庫県','28',1,28,0,'*',0,'*','*',0),('prefectures','29','奈良県','29',1,29,0,'*',0,'*','*',0),('prefectures','30','和歌山県','30',1,30,0,'*',0,'*','*',0),('prefectures','31','鳥取県','31',1,31,0,'*',0,'*','*',0),('prefectures','32','島根県','32',1,32,0,'*',0,'*','*',0),('prefectures','33','岡山県','33',1,33,0,'*',0,'*','*',0),('prefectures','34','広島県','34',1,34,0,'*',0,'*','*',0),('prefectures','35','山口県','35',1,35,0,'*',0,'*','*',0),('prefectures','36','徳島県','36',1,36,0,'*',0,'*','*',0),('prefectures','37','香川県','37',1,37,0,'*',0,'*','*',0),('prefectures','38','愛媛県','38',1,38,0,'*',0,'*','*',0),('prefectures','39','高知県','39',1,39,0,'*',0,'*','*',0),('prefectures','40','福岡県','40',1,40,0,'*',0,'*','*',0),('prefectures','41','佐賀県','41',1,41,0,'*',0,'*','*',0),('prefectures','42','長崎県','42',1,42,0,'*',0,'*','*',0),('prefectures','43','熊本県','43',1,43,0,'*',0,'*','*',0),('prefectures','44','大分県','44',1,44,0,'*',0,'*','*',0),('prefectures','45','宮崎県','45',1,45,0,'*',0,'*','*',0),('prefectures','46','鹿児島県','46',1,46,0,'*',0,'*','*',0),('prefectures','47','沖縄県','47',1,47,0,'*',0,'*','*',0),('purpose_use','company','会社利用','company',1,1,0,'*',0,'*','*',0),('purpose_use','private','プライベート利用','private',1,2,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `division_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `id` varchar(64) NOT NULL COMMENT '区分ID',
  `name` varchar(255) DEFAULT NULL COMMENT '区分名称',
  `public_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区分マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES ('agent_applies','代理店申請',1,7,0,'*',0,'*','*',0),('employee_cout','従業員人数',1,3,0,'*',0,'*','*',0),('how_know_answer','GoodLifeを知ったきっかけ',1,6,0,'*',0,'*','*',0),('industries','業種',1,4,0,'*',0,'*','*',0),('post_is_first_answer','ポスト投稿は初めてですか？',1,5,0,'*',0,'*','*',0),('prefectures','都道府県',1,1,0,'*',0,'*','*',0),('purpose_use','利用目的',1,2,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `group_id` varchar(64) NOT NULL COMMENT 'グループID',
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `locale` varchar(64) NOT NULL COMMENT 'ロケール:*:デフォルトロケール ja_JP等:明示的なロケール',
  `document` text DEFAULT NULL COMMENT '文章',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`group_id`,`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES ('agent_regist','description','*','下記の必須項目をご入力いただき、「確認画面へ」ボタンをクリックしてください。お問い合わせ内容を確認次第、お客様へお電話をさせて頂きます。',0,'*',0,'*','*',0),('agent_regist','query.description','*','お問い合わせ内容に関してお電話にてご説明します',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL COMMENT '日',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='祭日マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integer_values`
--

DROP TABLE IF EXISTS `integer_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integer_values` (
  `integer_id` int(11) NOT NULL COMMENT '整数ID',
  `value` int(11) NOT NULL COMMENT '整数値',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`integer_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='整数値マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integer_values`
--

LOCK TABLES `integer_values` WRITE;
/*!40000 ALTER TABLE `integer_values` DISABLE KEYS */;
INSERT INTO `integer_values` VALUES (10,0,0,'*',0,'*','*',0),(10,1,0,'*',0,'*','*',0),(10,2,0,'*',0,'*','*',0),(10,3,0,'*',0,'*','*',0),(10,4,0,'*',0,'*','*',0),(10,5,0,'*',0,'*','*',0),(10,6,0,'*',0,'*','*',0),(10,7,0,'*',0,'*','*',0),(10,8,0,'*',0,'*','*',0),(10,9,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `integer_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integers`
--

DROP TABLE IF EXISTS `integers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integers` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '整数名',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='整数マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integers`
--

LOCK TABLES `integers` WRITE;
/*!40000 ALTER TABLE `integers` DISABLE KEYS */;
INSERT INTO `integers` VALUES (10,'0～9の10個の整数',NULL,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `integers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `group_id` varchar(64) NOT NULL COMMENT 'グループID',
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `locale` varchar(64) NOT NULL COMMENT 'ロケール:*:デフォルトロケール ja_JP等:明示的なロケール',
  `label` varchar(1024) DEFAULT NULL COMMENT 'ラベル',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`group_id`,`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ラベルマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_group_rels`
--

DROP TABLE IF EXISTS `link_group_rels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_group_rels` (
  `link_group_id` varchar(64) NOT NULL COMMENT 'リンクグループID',
  `link_id` varchar(64) NOT NULL COMMENT 'リンクID',
  `display_order` int(11) DEFAULT NULL COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`link_group_id`,`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='リンクグループ関連マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_group_rels`
--

LOCK TABLES `link_group_rels` WRITE;
/*!40000 ALTER TABLE `link_group_rels` DISABLE KEYS */;
INSERT INTO `link_group_rels` VALUES ('footer_a','footer_a_column1',1,0,'*',0,'*','*',0),('footer_a','footer_a_column2',2,0,'*',0,'*','*',0),('footer_a','footer_a_column3',3,0,'*',0,'*','*',0),('footer_a','footer_a_column4',4,0,'*',0,'*','*',0),('footer_b','footer_b_column1',1,0,'*',0,'*','*',0),('footer_b','footer_b_column2',2,0,'*',0,'*','*',0),('footer_b','footer_b_column3',3,0,'*',0,'*','*',0),('footer_b','footer_b_column4',4,0,'*',0,'*','*',0),('footer_b','footer_b_column5',5,0,'*',0,'*','*',0),('footer_b','footer_b_column6',6,0,'*',0,'*','*',0),('footer_b','footer_b_column7',7,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `link_group_rels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_groups`
--

DROP TABLE IF EXISTS `link_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_groups` (
  `id` varchar(64) NOT NULL COMMENT 'リンクグループID',
  `name` varchar(255) DEFAULT NULL COMMENT 'リンクグループ名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='リンクグループマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_groups`
--

LOCK TABLES `link_groups` WRITE;
/*!40000 ALTER TABLE `link_groups` DISABLE KEYS */;
INSERT INTO `link_groups` VALUES ('footer_a','フッターリンク',NULL,0,'*',0,'*','*',0),('footer_b','フッターリンク',NULL,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `link_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_items`
--

DROP TABLE IF EXISTS `link_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_items` (
  `link_id` varchar(64) NOT NULL COMMENT 'リンクID',
  `link_item_id` varchar(64) NOT NULL COMMENT 'リンク項目ID',
  `link_item_type` int(11) NOT NULL DEFAULT 0 COMMENT 'リンク項目タイプ:0:ラベル 1:画面リンク 2:クライアント処理実行 3:サーバー処理実行 9:セパレータ',
  `name` varchar(255) DEFAULT NULL COMMENT 'リンク項目名称',
  `link_item_value` varchar(1024) DEFAULT NULL COMMENT 'リンク項目値',
  `child_link_id` varchar(64) DEFAULT NULL COMMENT '下位リンクID',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `guest_enable_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'ゲスト時有効フラグ:0:ゲスト時は無効 1:ゲスト時に有効',
  `certified_enable_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '認証時有効フラグ:0:認証時無効 1:認証時有効',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`link_id`,`link_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='リンク項目マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_items`
--

LOCK TABLES `link_items` WRITE;
/*!40000 ALTER TABLE `link_items` DISABLE KEYS */;
INSERT INTO `link_items` VALUES ('*','customer_support',1,'お客様サポート',NULL,NULL,1,1,1,0,'*',0,'*','*',0),('*','free_quote',1,'無料お見積り','free_quote',NULL,1,1,1,0,'*',0,'*','*',0),('*','here',1,'こちら','',NULL,5,1,1,0,'*',0,'*','*',0),('*','login',1,'ログイン','attest',NULL,2,1,0,0,'*',0,'*','*',0),('*','mypage',1,'マイページ','mypage',NULL,3,0,1,0,'*',0,'*','*',0),('*','registered',1,'既にアカウントをお持ちの方はこちら','attest',NULL,2,1,0,0,'*',0,'*','*',0),('*','top',1,'トップ','top',NULL,4,1,1,0,'*',0,'*','*',0),('*','user_regist',1,'こちら','user_regist',NULL,1,1,1,0,'*',0,'*','*',0),('footer_a_column1','item1',1,'運営会社について','uneikaisya_ni_tsuite','',1,1,1,0,'*',0,'*','*',0),('footer_a_column1','item2',1,'販売代理店について','habaidairiten_ni_tsuite','',2,1,1,0,'*',0,'*','*',0),('footer_a_column1','item3',1,'利用規約','riyou_kiyaku','',3,1,1,0,'*',0,'*','*',0),('footer_a_column2','item1',1,'ご利用ガイド','user_guids','',1,1,1,0,'*',0,'*','*',0),('footer_a_column2','item2',1,'取り組みについて','torikumi_ni_tsuite','',2,1,1,0,'*',0,'*','*',0),('footer_a_column2','item3',1,'プライバシーポリシー','privacy_policy','',3,1,1,0,'*',0,'*','*',0),('footer_a_column3','item1',1,'各種ヘルプ','help','',1,1,1,0,'*',0,'*','*',0),('footer_a_column3','item2',1,'ご利用ガイド','user_guids','',2,1,1,0,'*',0,'*','*',1),('footer_a_column3','item3',1,'利用規約','riyou_kiyaku','',3,1,1,0,'*',0,'*','*',1),('footer_a_column4','item1',1,'ご利用ガイド','user_guids','',1,1,1,0,'*',0,'*','*',1),('footer_a_column4','item2',1,'当サイトのご利用について','toussaito_goriyo_ni_tsuite','',2,1,1,0,'*',0,'*','*',0),('footer_a_column4','item3',1,'特定商取引法に基づく表記','tokuteisyou_torihikihou','',3,1,1,0,'*',0,'*','*',0),('footer_b_column1','item1',1,'冬休み','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column1','item10',1,'お花見','','',10,1,1,0,'*',0,'*','*',0),('footer_b_column1','item11',1,'春休み','','',11,1,1,0,'*',0,'*','*',0),('footer_b_column1','item12',1,'パンの日','','',12,1,1,0,'*',0,'*','*',0),('footer_b_column1','item13',1,'ゴールデンウイーク','','',13,1,1,0,'*',0,'*','*',0),('footer_b_column1','item14',1,'母の日','','',14,1,1,0,'*',0,'*','*',0),('footer_b_column1','item15',1,'運動会','','',15,1,1,0,'*',0,'*','*',0),('footer_b_column1','item16',1,'父の日','','',16,1,1,0,'*',0,'*','*',0),('footer_b_column1','item17',1,'和菓子の日','','',17,1,1,0,'*',0,'*','*',0),('footer_b_column1','item18',1,'世界ビールデー','','',18,1,1,0,'*',0,'*','*',0),('footer_b_column1','item19',1,'夏休み','','',19,1,1,0,'*',0,'*','*',0),('footer_b_column1','item2',1,'新年会','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column1','item20',1,'帰省の手土産','','',20,1,1,0,'*',0,'*','*',0),('footer_b_column1','item21',1,'お盆','','',21,1,1,0,'*',0,'*','*',0),('footer_b_column1','item22',1,'花火大会','','',22,1,1,0,'*',0,'*','*',0),('footer_b_column1','item23',1,'ハロウィン','','',23,1,1,0,'*',0,'*','*',0),('footer_b_column1','item24',1,'行楽','','',24,1,1,0,'*',0,'*','*',0),('footer_b_column1','item25',1,'秋の味覚','','',25,1,1,0,'*',0,'*','*',0),('footer_b_column1','item26',1,'紅葉','','',26,1,1,0,'*',0,'*','*',0),('footer_b_column1','item27',1,'七五三','','',27,1,1,0,'*',0,'*','*',0),('footer_b_column1','item28',1,'クリスマス','','',28,1,1,0,'*',0,'*','*',0),('footer_b_column1','item29',1,'年末年始','','',29,1,1,0,'*',0,'*','*',0),('footer_b_column1','item3',1,'帰省','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column1','item30',1,'お節','','',30,1,1,0,'*',0,'*','*',0),('footer_b_column1','item4',1,'バレンタインデー','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column1','item5',1,'ひな祭り','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column1','item6',1,'ホワイトデー','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column1','item7',1,'お花見','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column1','item8',1,'歓送迎会','','',8,1,1,0,'*',0,'*','*',0),('footer_b_column1','item9',1,'宴会','','',9,1,1,0,'*',0,'*','*',0),('footer_b_column2','item1',1,'飲食店、食品','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column2','item10',1,'IT、営業、コンサル','','',10,1,1,0,'*',0,'*','*',0),('footer_b_column2','item11',1,'製造、自動車','','',11,1,1,0,'*',0,'*','*',0),('footer_b_column2','item2',1,'小売、販売','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column2','item3',1,'教育、習い事','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column2','item4',1,'その他','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column2','item5',1,'サービス業','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column2','item6',1,'介護、福祉','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column2','item7',1,'医療、薬局','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column2','item8',1,'美容、ビューティー','','',8,1,1,0,'*',0,'*','*',0),('footer_b_column2','item9',1,'建築、不動産','','',9,1,1,0,'*',0,'*','*',0),('footer_b_column3','item1',1,'イベント、キャンペーン','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column3','item10',1,'その他','','',10,1,1,0,'*',0,'*','*',0),('footer_b_column3','item11',1,'カレンダー','','',11,1,1,0,'*',0,'*','*',0),('footer_b_column3','item2',1,'会社案内・施設案内','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column3','item3',1,'スタッフ募集','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column3','item4',1,'オープン、開業','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column3','item5',1,'お知らせ、掲示','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column3','item6',1,'セール、特売','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column3','item7',1,'パンフレット、メニュー','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column3','item8',1,'セミナー、講演会','','',8,1,1,0,'*',0,'*','*',0),('footer_b_column3','item9',1,'会報、ニュースレター','','',9,1,1,0,'*',0,'*','*',0),('footer_b_column4','item1',1,'タテ型','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column4','item2',1,'ヨコ型','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column5','item1',1,'イラストあり','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column5','item10',1,'和風','','',10,1,1,0,'*',0,'*','*',0),('footer_b_column5','item11',1,'洋風','','',11,1,1,0,'*',0,'*','*',0),('footer_b_column5','item12',1,'三つ折り','','',12,1,1,0,'*',0,'*','*',0),('footer_b_column5','item13',1,'二つ折り','','',13,1,1,0,'*',0,'*','*',0),('footer_b_column5','item2',1,'写真が使える','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column5','item3',1,'明るい','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column5','item4',1,'おしゃれ','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column5','item5',1,'落ち着いている','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column5','item6',1,'派手','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column5','item7',1,'かわいい','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column5','item8',1,'インパクト','','',8,1,1,0,'*',0,'*','*',0),('footer_b_column5','item9',1,'ナチュラル','','',9,1,1,0,'*',0,'*','*',0),('footer_b_column6','item1',1,'A4チラシ','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column6','item2',1,'A1ポスター','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column6','item3',1,'ポストカード','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column6','item4',1,'カード','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column6','item5',1,'名刺','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column6','item6',1,'A3チラシ','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column6','item7',1,'その他','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column7','item1',1,'白','','',1,1,1,0,'*',0,'*','*',0),('footer_b_column7','item10',1,'茶色','','',10,1,1,0,'*',0,'*','*',0),('footer_b_column7','item11',1,'灰色','','',11,1,1,0,'*',0,'*','*',0),('footer_b_column7','item12',1,'その他','','',12,1,1,0,'*',0,'*','*',0),('footer_b_column7','item2',1,'黒','','',2,1,1,0,'*',0,'*','*',0),('footer_b_column7','item3',1,'赤','','',3,1,1,0,'*',0,'*','*',0),('footer_b_column7','item4',1,'青','','',4,1,1,0,'*',0,'*','*',0),('footer_b_column7','item5',1,'緑','','',5,1,1,0,'*',0,'*','*',0),('footer_b_column7','item6',1,'黄色','','',6,1,1,0,'*',0,'*','*',0),('footer_b_column7','item7',1,'紫','','',7,1,1,0,'*',0,'*','*',0),('footer_b_column7','item8',1,'ピンク','','',8,1,1,0,'*',0,'*','*',0),('footer_b_column7','item9',1,'ベージュ','','',9,1,1,0,'*',0,'*','*',0),('header_left','qoupon_ichiran',1,'ご利用可能なクーポン一覧','qoupon_ichiran',NULL,1,0,1,0,'*',0,'*','*',0),('header_right','agent_regist',1,'代理店問合せ（デバッグ）','agent_regist',NULL,5,1,1,0,'*',0,'*','*',0),('header_right','chumon_ichiran',1,'注文一覧','chumon_ichiran',NULL,1,0,1,0,'*',0,'*','*',0),('header_right','kako_chumon',1,'過去の注文から増刷','kako_chumon',NULL,2,0,1,0,'*',0,'*','*',0),('header_right','logout',2,'ログアウト','logout',NULL,3,0,1,0,'*',0,'*','*',0),('header_right','user_regist',1,'新規会員登録(無料)','user_regist',NULL,4,1,0,0,'*',0,'*','*',0),('keyword','mail_domain',0,'@joh-ltd.com',NULL,NULL,1,1,1,0,'*',0,'*','*',0),('keyword','service_name',0,'JOHサービス',NULL,NULL,1,1,1,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `link_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` varchar(64) NOT NULL COMMENT 'リンクID',
  `name` varchar(255) DEFAULT NULL COMMENT 'リンク名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='リンクマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES ('*',NULL,NULL,0,'*',0,'*','*',0),('footer_a_column1',NULL,NULL,0,'*',0,'*','*',0),('footer_a_column2',NULL,NULL,0,'*',0,'*','*',0),('footer_a_column3',NULL,NULL,0,'*',0,'*','*',0),('footer_a_column4',NULL,NULL,0,'*',0,'*','*',0),('footer_b_column1','行事',NULL,0,'*',0,'*','*',0),('footer_b_column2','業種',NULL,0,'*',0,'*','*',0),('footer_b_column3','用途・シーン',NULL,0,'*',0,'*','*',0),('footer_b_column4','用紙の向き',NULL,0,'*',0,'*','*',0),('footer_b_column5','イメージ',NULL,0,'*',0,'*','*',0),('footer_b_column6','商品タイプ',NULL,0,'*',0,'*','*',0),('footer_b_column7','カラー',NULL,0,'*',0,'*','*',0),('header_left',NULL,NULL,0,'*',0,'*','*',0),('header_right',NULL,NULL,0,'*',0,'*','*',0),('keyword',NULL,NULL,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medium_division_values`
--

DROP TABLE IF EXISTS `medium_division_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medium_division_values` (
  `division_id` varchar(64) NOT NULL COMMENT '区分ID',
  `medium_division_id` varchar(64) NOT NULL COMMENT '中区分ID',
  `id` varchar(64) NOT NULL COMMENT '中区分値ID',
  `name` varchar(255) DEFAULT NULL COMMENT '中区分値名称',
  `value` varchar(1024) DEFAULT NULL COMMENT '中区分値',
  `public_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`division_id`,`medium_division_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='中区分値マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medium_division_values`
--

LOCK TABLES `medium_division_values` WRITE;
/*!40000 ALTER TABLE `medium_division_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `medium_division_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medium_divisions`
--

DROP TABLE IF EXISTS `medium_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medium_divisions` (
  `division_id` varchar(64) NOT NULL COMMENT '区分ID',
  `medium_division_id` varchar(64) NOT NULL COMMENT '中区分ID',
  `name` varchar(255) DEFAULT NULL COMMENT '中区分名称',
  `public_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`division_id`,`medium_division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='中区分マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medium_divisions`
--

LOCK TABLES `medium_divisions` WRITE;
/*!40000 ALTER TABLE `medium_divisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `medium_divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_group_rels`
--

DROP TABLE IF EXISTS `menu_group_rels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_group_rels` (
  `menu_group_id` varchar(64) NOT NULL COMMENT 'メニューグループID',
  `menu_id` varchar(64) NOT NULL COMMENT 'メニューID',
  `display_order` int(11) NOT NULL COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`menu_group_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='メニューグループ関連マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_group_rels`
--

LOCK TABLES `menu_group_rels` WRITE;
/*!40000 ALTER TABLE `menu_group_rels` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_group_rels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_groups`
--

DROP TABLE IF EXISTS `menu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_groups` (
  `id` varchar(64) NOT NULL COMMENT 'メニューグループID',
  `name` varchar(255) DEFAULT NULL COMMENT 'メニューグループ名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='メニューグループマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_groups`
--

LOCK TABLES `menu_groups` WRITE;
/*!40000 ALTER TABLE `menu_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `menu_id` varchar(64) NOT NULL COMMENT 'メニューID',
  `menu_item_id` varchar(64) NOT NULL COMMENT 'メニュー項目ID',
  `menu_item_type` int(11) NOT NULL DEFAULT 0 COMMENT 'メニュー項目タイプ:0:ラベル 1:画面リンク 2:クライアント処理実行 3:サーバー処理実行 9:セパレータ',
  `name` varchar(255) DEFAULT NULL COMMENT 'メニュー項目名称',
  `menu_item_value` varchar(1024) DEFAULT NULL COMMENT 'メニュー項目値',
  `child_menu_id` varchar(64) DEFAULT NULL COMMENT '下位メニューID',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `guest_enable_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'ゲスト時有効フラグ:0:ゲスト時は無効 1:ゲスト時に有効',
  `certified_enable_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '認証時有効フラグ:0:認証時無効 1:認証時有効',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`menu_id`,`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='メニュー項目マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` varchar(64) NOT NULL COMMENT 'メニューID',
  `name` varchar(255) DEFAULT NULL COMMENT 'メニュー名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='メニューマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` varchar(64) NOT NULL COMMENT 'ロールID',
  `name` varchar(255) DEFAULT NULL COMMENT 'ロール名称',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ロールマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('*','システム管理者',0,'*',0,'*','*',0),('Agent','代理店ユーザー',0,'*',0,'*','*',0),('GovernmentOffice','官庁・行政',0,'*',0,'*','*',0),('Guest','ゲスト',0,'*',0,'*','*',0),('User','一般ユーザー',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_roles`
--

DROP TABLE IF EXISTS `screen_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_roles` (
  `screen_id` varchar(64) NOT NULL COMMENT '画面ID',
  `role_id` varchar(64) NOT NULL COMMENT 'ロールID',
  `start_date` date NOT NULL COMMENT '開始日',
  `end_date` date NOT NULL DEFAULT '9999-12-31' COMMENT '終了日',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`screen_id`,`role_id`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='画面ロールマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_roles`
--

LOCK TABLES `screen_roles` WRITE;
/*!40000 ALTER TABLE `screen_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `id` varchar(64) NOT NULL COMMENT '画面ID',
  `url` varchar(1024) NOT NULL COMMENT 'URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'タイトル',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='画面マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES ('agent_regist','/scene/agent_regist','代理店問合せ',0,'*',0,'*','*',0),('attest','/scene/attest','ログイン',0,'*',0,'*','*',0),('mypage','/scene/mypage','マイページ',0,'*',0,'*','*',0),('new_agent_user','/scene/new_agent_user','代理店会員登録',0,'*',0,'*','*',0),('new_user','/scene/new_user','新規会員登録（無料）',0,'*',0,'*','*',0),('service_terms','/scene/service_terms','利用規約',0,'*',0,'*','*',0),('top','/scene/top','トップ',0,'*',0,'*','*',0),('user_regist','/scene/user_regist','会員登録',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_policy_values`
--

DROP TABLE IF EXISTS `system_policy_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_policy_values` (
  `system_policy_id` varchar(64) NOT NULL COMMENT 'システムポリシーID',
  `id` varchar(64) NOT NULL COMMENT '設定値ID',
  `name` varchar(255) DEFAULT NULL COMMENT '設定値名称',
  `description` text DEFAULT NULL COMMENT '説明',
  `value` varchar(1024) DEFAULT NULL COMMENT '設定値',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`system_policy_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='システムポリシー設定値マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_policy_values`
--

LOCK TABLES `system_policy_values` WRITE;
/*!40000 ALTER TABLE `system_policy_values` DISABLE KEYS */;
INSERT INTO `system_policy_values` VALUES ('security','regist_mail_expire_minutes','新規会員登録メールの発行後の有効期間','分単位の設定です。未設定の場合は、15分とみなします。','120',1,0,'*',0,'*','*',0),('secutiry','password_chars','パスワードで許容する文字群','パスワードで使用可能な文字を定義する。未設定の場合には、半角英数及び「-_%#+*,.=^|」です。英字は大文字小文字を区別します。','0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_',2,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `system_policy_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_policys`
--

DROP TABLE IF EXISTS `system_policys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_policys` (
  `id` varchar(64) NOT NULL COMMENT 'システムポリシーID',
  `name` varchar(255) DEFAULT NULL COMMENT 'システムポリシー名称',
  `display_order` int(11) NOT NULL DEFAULT 0 COMMENT '表示順',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='システムポリシーマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_policys`
--

LOCK TABLES `system_policys` WRITE;
/*!40000 ALTER TABLE `system_policys` DISABLE KEYS */;
INSERT INTO `system_policys` VALUES ('security','セキュリティ',1,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `system_policys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `logo_url` varchar(1024) DEFAULT NULL COMMENT 'ロゴURI',
  `name` varchar(255) DEFAULT NULL COMMENT 'システム名称',
  `short_name` varchar(128) DEFAULT NULL COMMENT 'システム略称',
  `tel_no` varchar(14) DEFAULT NULL COMMENT '電話番号',
  `reception_time` text DEFAULT NULL COMMENT '受付時間',
  `source_company` varchar(64) DEFAULT NULL COMMENT '提供会社:システムを提供公開している会社',
  `proprietary_company` varchar(64) DEFAULT NULL COMMENT '管理会社:システムを管理している会社',
  `welcome_message_prefix` text DEFAULT NULL COMMENT 'ウェルカムメッセージ前',
  `welcome_message_suffix` text DEFAULT NULL COMMENT 'ウェルカムメッセージ後',
  `certified_welcome_message_suffix` text DEFAULT NULL COMMENT '認証済ウェルカムメッセージ後',
  `copyright` varchar(1024) DEFAULT NULL COMMENT 'コピーライト',
  `description` text DEFAULT NULL COMMENT 'システム説明',
  `theme_id` varchar(64) NOT NULL DEFAULT '*' COMMENT '適用テーマID:システムに適用しているテーマのID',
  `site` varchar(1024) NOT NULL COMMENT 'サイト',
  `catchphrase` text DEFAULT NULL COMMENT 'キャッチフレーズ',
  `from_email` varchar(128) NOT NULL DEFAULT 'joh.test.notifier@gmail.com' COMMENT '通知元メールアドレス:通知メールを送る際の送信元メールアドレス',
  `from_email_name` varchar(255) NOT NULL DEFAULT 'GoodLife通知' COMMENT '通知元名称:メールクライアントでの通知メールのアドレスの表示名',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='システムマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
INSERT INTO `systems` VALUES ('*','/images/GoodLife_logo_typeB.png','GoodLife','グッドライフ','03-6869-3787','平日9:00～17:30','*','*','ようこそ','へ','さん','Copyright © 2020 JOH INC. All Rights Reserved.','<h1 class=\"JOH-Font-LL JOH-IPos-Center\">説明文が入ります</h1>\r\n<p class=\"JOH-MV-SSEM\">*******************************************<br>\r\n*******************************************<br>\r\n<br>\r\n*******************************************<br>\r\n</p>','*','http://localhost','ポスト投函ならGoodLife','joh.test.notifier@gmail.com','GoodLife通知',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_regists`
--

DROP TABLE IF EXISTS `temporary_regists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_regists` (
  `id` varchar(64) NOT NULL COMMENT '仮登録ID',
  `user_id` varchar(64) NOT NULL COMMENT '利用者ID',
  `apply_dtm` datetime NOT NULL COMMENT '仮登録日時',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仮登録トラン';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_regists`
--

LOCK TABLES `temporary_regists` WRITE;
/*!40000 ALTER TABLE `temporary_regists` DISABLE KEYS */;
INSERT INTO `temporary_regists` VALUES ('5f68c0146e087','5f68c0146e084','2020-09-22 00:00:36',1600700436,'5f68c0146e084',1600700436,'5f68c0146e084','App\\Models\\{closure}',0),('5f68c96d6bc03','5f68c96d6bbff','2020-09-22 00:40:29',1600702829,'5f68c96d6bbff',1600702829,'5f68c96d6bbff','App\\Models\\{closure}',0),('5f6b5a612a8ae','5f6b5a612a8ad','2021-09-23 23:23:29',1600871009,'5f6b5a612a8ad',1600871009,'5f6b5a612a8ad','App\\Models\\{closure}',0),('5f70b810255fd','5f70b810255fc','2020-09-28 01:04:32',1601222672,'5f70b810255fc',1601222672,'5f70b810255fc','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `temporary_regists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` varchar(64) NOT NULL COMMENT 'テーマID',
  `name` varchar(255) DEFAULT NULL COMMENT 'テーマ名',
  `description` text DEFAULT NULL COMMENT '説明',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='テーママスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES ('*','初期テーマ','初期値として設定してあるテーマ',0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attrs`
--

DROP TABLE IF EXISTS `user_attrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attrs` (
  `user_id` varchar(64) NOT NULL COMMENT '利用者ID',
  `attr_def_id` varchar(64) NOT NULL COMMENT '属性定義ID',
  `attr_value` varchar(1024) DEFAULT NULL COMMENT '属性値',
  `publish` int(11) NOT NULL DEFAULT 0 COMMENT '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`user_id`,`attr_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='利用者属性マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attrs`
--

LOCK TABLES `user_attrs` WRITE;
/*!40000 ALTER TABLE `user_attrs` DISABLE KEYS */;
INSERT INTO `user_attrs` VALUES ('5f70b7399f0e2','company_name','株式会社サンプル',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','company_name_kana','カブシキガイシャサンプル',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','employee_cout','5',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','full_name','牛山修二',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','full_name_kana','ウシヤマシュウジ',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','industry','11',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','prefecture','13',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','purpose_use','company',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','qa_how_know','3',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','qa_post_is_first','yes',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b7399f0e2','tel_no','09012345678',1,1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b810255fc','company_name','株式会社サンプルＢ',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','company_name_kana','カブシキガイシャサンプルビー',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','employee_cout','1',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','full_name','牛山修二',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','full_name_kana','ウシヤマシュウジ',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','industry','17',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','prefecture','13',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','purpose_use','private',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','qa_how_know','1,3,6,8,10',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','qa_post_is_first','yes',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0),('5f70b810255fc','tel_no','09012345678',1,1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `user_attrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_passwords`
--

DROP TABLE IF EXISTS `user_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_passwords` (
  `user_id` varchar(64) NOT NULL COMMENT '利用者ID',
  `password` varchar(64) NOT NULL COMMENT 'パスワード:ハッシュ化した状態で格納する事',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`user_id`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='利用者パスワード・トラン';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_passwords`
--

LOCK TABLES `user_passwords` WRITE;
/*!40000 ALTER TABLE `user_passwords` DISABLE KEYS */;
INSERT INTO `user_passwords` VALUES ('*','5f4dcc3b5aa765d61d8327deb882cf99',0,'*',0,'*','*',0),('5f68c0146e084','5f4dcc3b5aa765d61d8327deb882cf99',1600700992,'5f68c0146e084',1600700992,'5f68c0146e084','App\\Models\\{closure}',0),('5f68c96d6bbff','5f4dcc3b5aa765d61d8327deb882cf99',1600704348,'5f68c96d6bbff',1600704348,'5f68c96d6bbff','App\\Models\\{closure}',0),('5f70a157cae4e','5f4dcc3b5aa765d61d8327deb882cf99',1601216855,'5f70a157cae4e',1601216855,'5f70a157cae4e','App\\Models\\{closure}',0),('5f70aed9d95f6','5f4dcc3b5aa765d61d8327deb882cf99',1601220313,'5f70aed9d95f6',1601220313,'5f70aed9d95f6','App\\Models\\{closure}',0),('5f70b25f986f0','5f4dcc3b5aa765d61d8327deb882cf99',1601221215,'5f70b25f986f0',1601221215,'5f70b25f986f0','App\\Models\\{closure}',0),('5f70b3a9976ca','5f4dcc3b5aa765d61d8327deb882cf99',1601221545,'5f70b3a9976ca',1601221545,'5f70b3a9976ca','App\\Models\\{closure}',0),('5f70b44f8634d','5f4dcc3b5aa765d61d8327deb882cf99',1601221711,'5f70b44f8634d',1601221711,'5f70b44f8634d','App\\Models\\{closure}',0),('5f70b532d20fc','5f4dcc3b5aa765d61d8327deb882cf99',1601221938,'5f70b532d20fc',1601221938,'5f70b532d20fc','App\\Models\\{closure}',0),('5f70b5b6958f7','5f4dcc3b5aa765d61d8327deb882cf99',1601222070,'5f70b5b6958f7',1601222070,'5f70b5b6958f7','App\\Models\\{closure}',0),('5f70b66b68174','5f4dcc3b5aa765d61d8327deb882cf99',1601222251,'5f70b66b68174',1601222251,'5f70b66b68174','App\\Models\\{closure}',0),('5f70b6d12a5a8','5f4dcc3b5aa765d61d8327deb882cf99',1601222353,'5f70b6d12a5a8',1601222353,'5f70b6d12a5a8','App\\Models\\{closure}',0),('5f70b7399f0e2','5f4dcc3b5aa765d61d8327deb882cf99',1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b810255fc','5f4dcc3b5aa765d61d8327deb882cf99',1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `user_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` varchar(64) NOT NULL COMMENT '利用者ID',
  `role_id` varchar(64) NOT NULL COMMENT 'ロールID',
  `start_date` date NOT NULL COMMENT '開始日',
  `end_date` date NOT NULL DEFAULT '9999-12-31' COMMENT '終了日',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`user_id`,`role_id`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='利用者ロールマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('*','*','1971-01-01','9999-12-31',0,'*',0,'*','*',0),('5f68c96d6bbff','User','0001-01-01','9999-12-31',1600704348,'5f68c96d6bbff',1600704348,'5f68c96d6bbff','App\\Models\\{closure}',0),('5f70a157cae4e','Agent','0001-01-01','9999-12-31',1601216855,'5f70a157cae4e',1601216855,'5f70a157cae4e','App\\Models\\{closure}',0),('5f70aed9d95f6','Agent','0001-01-01','9999-12-31',1601220313,'5f70aed9d95f6',1601220313,'5f70aed9d95f6','App\\Models\\{closure}',0),('5f70b25f986f0','Agent','0001-01-01','9999-12-31',1601221215,'5f70b25f986f0',1601221215,'5f70b25f986f0','App\\Models\\{closure}',0),('5f70b3a9976ca','Agent','0001-01-01','9999-12-31',1601221545,'5f70b3a9976ca',1601221545,'5f70b3a9976ca','App\\Models\\{closure}',0),('5f70b44f8634d','Agent','0001-01-01','9999-12-31',1601221711,'5f70b44f8634d',1601221711,'5f70b44f8634d','App\\Models\\{closure}',0),('5f70b532d20fc','Agent','0001-01-01','9999-12-31',1601221938,'5f70b532d20fc',1601221938,'5f70b532d20fc','App\\Models\\{closure}',0),('5f70b5b6958f7','Agent','0001-01-01','9999-12-31',1601222070,'5f70b5b6958f7',1601222070,'5f70b5b6958f7','App\\Models\\{closure}',0),('5f70b66b68174','Agent','0001-01-01','9999-12-31',1601222251,'5f70b66b68174',1601222251,'5f70b66b68174','App\\Models\\{closure}',0),('5f70b6d12a5a8','Agent','0001-01-01','9999-12-31',1601222353,'5f70b6d12a5a8',1601222353,'5f70b6d12a5a8','App\\Models\\{closure}',0),('5f70b7399f0e2','Agent','0001-01-01','9999-12-31',1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b810255fc','User','0001-01-01','9999-12-31',1601222826,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(64) NOT NULL COMMENT '利用者ID',
  `nickname` varchar(255) DEFAULT NULL COMMENT 'ニックネーム',
  `email` varchar(128) NOT NULL COMMENT 'メールアドレス',
  `login_id` varchar(64) NOT NULL COMMENT '認証ID',
  `admin_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '管理者フラグ:0:非システム管理者 1:システム管理者',
  `retry_count` int(11) NOT NULL DEFAULT 0 COMMENT 'リトライ回数',
  `last_login_dtm` datetime DEFAULT NULL COMMENT '最終ログイン日時',
  `regist_dtm` datetime DEFAULT NULL COMMENT '本登録日時',
  `create_tm` int(11) NOT NULL COMMENT '作成タイムスタンプ',
  `create_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '作成者ID',
  `modify_tm` int(11) NOT NULL COMMENT '更新タイムスタンプ',
  `modify_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '更新者ID',
  `program` varchar(255) NOT NULL DEFAULT '*' COMMENT 'プログラム名:作成・更新したプログラムの識別子',
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='利用者マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('*','システム管理者','shuji.ushiyama@gmail.com','admin',1,0,'2020-09-23 23:42:45',NULL,0,'*',1600872165,'*','*',0),('5f70b7399f0e2',NULL,'shuji.ushiyama@gmail.com','shuji.ushiyama@gmail.com',0,0,'2020-09-28 01:00:57','2020-09-28 01:00:57',1601222457,'5f70b7399f0e2',1601222457,'5f70b7399f0e2','App\\Models\\{closure}',0),('5f70b810255fc',NULL,'shuji_ushiyama@hotmail.com','shuji_ushiyama@hotmail.com',0,0,'2020-09-28 01:07:06','2020-09-28 01:07:06',1601222672,'5f70b810255fc',1601222826,'5f70b810255fc','App\\Models\\{closure}',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-28  1:17:39
