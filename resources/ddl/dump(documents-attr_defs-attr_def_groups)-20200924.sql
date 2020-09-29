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
  `value_type` int(11) NOT NULL COMMENT '型:1:文字列 11:複数行文字列 2:整数 3:浮動小数 4:日付 5:時刻 6:区分選択 7:画像 8:ファイル 99:その他',
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
INSERT INTO `attr_defs` VALUES ('agent','address','住所','例：都道府県○○市○○町1丁目1-1 建物名','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,NULL,6,1,0,'*',0,'*','*',0),('agent','charge_person_name','ご担当者名','ご担当者名を入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,2,1,0,'*',0,'*','*',0),('agent','charge_person_name_kana','フリガナ','フリガナを入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,3,1,0,'*',0,'*','*',0),('agent','company_name','会社名','会社名を入力してください','',1,'','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,1,1,0,'*',0,'*','*',0),('agent','contact_email','連絡先E-mail','Eメールアドレスを入力してください','※半角英数字',1,'email','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,NULL,7,1,0,'*',0,'*','*',0),('agent','contact_tel_no','連絡先電話番号','例：08012345678','',1,'tel','',1,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,4,1,0,'*',0,'*','*',0),('agent','message','メッセージ','','',0,'','',11,NULL,1000,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',40,5,8,1,0,'*',0,'*','*',0),('agent','zip_no','郵便番号','例：1234567','',1,'','',1,NULL,7,'^[0-9]+$','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',10,NULL,5,1,0,'*',0,'*','*',0),('user','company_name','会社名',NULL,NULL,1,NULL,'',1,NULL,256,'',NULL,NULL,NULL,NULL,-9.9,9.9,0.1,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,4,6,1,0,'*',0,'*','*',0),('user','company_name_kana','会社名（フリガナ）',NULL,NULL,1,NULL,'',1,NULL,256,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',30,NULL,7,1,0,'*',0,'*','*',0),('user','employee_cout','従業員数',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'employee_cout',1,NULL,NULL,NULL,'','',NULL,NULL,8,1,0,'*',0,'*','*',0),('user','full_name','お名前',NULL,NULL,1,NULL,'',1,NULL,64,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,1,1,0,'*',0,'*','*',0),('user','full_name_kana','フリガナ',NULL,NULL,1,NULL,'',1,NULL,64,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',15,NULL,2,1,0,'*',0,'*','*',0),('user','industry','業種',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'industries',1,NULL,NULL,NULL,'','',NULL,5,9,1,0,'*',0,'*','*',0),('user','prefecture','都道府県',NULL,NULL,1,NULL,'*',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'prefectures',1,NULL,NULL,NULL,'','',NULL,NULL,4,1,0,'*',0,'*','*',0),('user','purpose_use','ご利用の目的',NULL,NULL,1,NULL,NULL,6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'purpose_use',2,NULL,NULL,NULL,'','',NULL,NULL,5,1,0,'*',0,'*','*',0),('user','qa_how_know','GoodLifeを知ったきっかけ',NULL,NULL,1,NULL,'',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'how_know_answer',3,NULL,NULL,NULL,'','',40,NULL,11,1,0,'*',0,'*','*',0),('user','qa_post_is_first','ポスト投稿は初めてですか？',NULL,NULL,1,NULL,'',6,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'post_is_first_answer',2,NULL,NULL,NULL,'','',NULL,NULL,10,1,0,'*',0,'*','*',0),('user','tel_no','電話番号',NULL,NULL,1,'tel','',1,NULL,14,'^[0-9]+[\\-]?[0-9]+[\\-]?[0-9]+$',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'','',12,NULL,3,1,0,'*',0,'*','*',0);
/*!40000 ALTER TABLE `attr_defs` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-24  1:28:25
