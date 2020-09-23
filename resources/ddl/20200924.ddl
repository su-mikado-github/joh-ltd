-- Project Name : 共同購入サイト（グッドライフ）ＥＲ
-- Date/Time    : 2020/09/24 1:02:16
-- Author       : 牛山修二
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

/*
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
*/

-- 代理店問合せトラン
--* BackupToTempTable
drop table if exists `agent_inquirys` cascade;

--* RestoreFromTempTable
create table `agent_inquirys` (
  `id` VARCHAR(64) not null comment '代理店問合せID'
  , `inquiry_dtm` DATETIME not null comment '問合せ日時'
  , `email_attr_id` VARCHAR(64) not null comment 'メールアドレス属性ID'
  , `progress` INT default 0 not null comment '進捗:0:作成 1:管理者確認済み 2:回答済'
  , `reply_dtm` DATETIME comment '回答日時'
  , `reply_user_id` VARCHAR(64) comment '回答担当者ID'
  , `reply_content` TEXT comment '回答内容'
  , `user_id` VARCHAR(64) comment '利用者ID'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `agent_inquirys_PKC` primary key (`id`)
) comment '代理店問合せトラン' ;

-- 代理店問合せ属性トラン
--* BackupToTempTable
drop table if exists `agent_inquiry_attrs` cascade;

--* RestoreFromTempTable
create table `agent_inquiry_attrs` (
  `agent_inquiry_id` VARCHAR(64) not null comment '代理店問合せID'
  , `attr_def_id` VARCHAR(64) not null comment '属性定義ID'
  , `attr_value` VARCHAR(1024) comment '属性値'
  , `publish` INT default 0 not null comment '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `agent_inquiry_attrs_PKC` primary key (`agent_inquiry_id`,`attr_def_id`)
) comment '代理店問合せ属性トラン' ;

-- ラベルマスタ
--* BackupToTempTable
drop table if exists `labels` cascade;

--* RestoreFromTempTable
create table `labels` (
  `group_id` VARCHAR(64) not null comment 'グループID'
  , `id` VARCHAR(64) not null comment 'ID'
  , `locale` VARCHAR(64) not null comment 'ロケール:*:デフォルトロケール ja_JP等:明示的なロケール'
  , `label` VARCHAR(1024) comment 'ラベル'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `labels_PKC` primary key (`group_id`,`id`,`locale`)
) comment 'ラベルマスタ' ;

-- 文章マスタ
--* BackupToTempTable
drop table if exists `documents` cascade;

--* RestoreFromTempTable
create table `documents` (
  `group_id` VARCHAR(64) not null comment 'グループID'
  , `id` VARCHAR(64) not null comment 'ID'
  , `locale` VARCHAR(64) not null comment 'ロケール:*:デフォルトロケール ja_JP等:明示的なロケール'
  , `document` TEXT comment '文章'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `documents_PKC` primary key (`group_id`,`id`,`locale`)
) comment '文章マスタ' ;

-- 属性定義グループマスタ
--* BackupToTempTable
drop table if exists `attr_def_groups` cascade;

--* RestoreFromTempTable
create table `attr_def_groups` (
  `id` VARCHAR(64) not null comment '属性定義グループID'
  , `name` VARCHAR(255) comment '属性定義グループ名称'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `attr_def_groups_PKC` primary key (`id`)
) comment '属性定義グループマスタ' ;

-- 属性定義マスタ
--* BackupToTempTable
drop table if exists `attr_defs` cascade;

--* RestoreFromTempTable
create table `attr_defs` (
  `attr_def_group_id` VARCHAR(64) not null comment '属性定義グループID'
  , `id` VARCHAR(64) not null comment '属性定義ID'
  , `name` VARCHAR(255) not null comment '属性名'
  , `example` TEXT comment '例:placefolder属性に展開'
  , `hint` TEXT comment 'ヒント:title属性に展開'
  , `require_flag` TINYINT default 0 not null comment '必須フラグ'
  , `text_type` VARCHAR(1024) comment 'テキスト入力タイプ:INPUTタグに展開される際のtype属性の値。無指定では「text」となる。型が1の場合だけ有効'
  , `default_attr_value` VARCHAR(1024) comment 'デフォルト属性値'
  , `value_type` INT not null comment '型:1:文字列 11:複数行文字列 2:整数 3:浮動小数 4:日付 5:時刻 6:区分選択 7:画像 8:ファイル 99:その他'
  , `min_length` INT comment '最小桁数'
  , `max_length` INT comment '最大桁数'
  , `regex` VARCHAR(1024) comment '文字列パターン'
  , `regex_unmatch` VARCHAR(1024) comment '文字列パターン不一致'
  , `min_bigint_value` BIGINT comment '整数最小値'
  , `max_bigint_value` BIGINT comment '整数最大値'
  , `bigint_step_value` BIGINT comment '整数変動量:画面でスピンボタンで変更した場合の変動量（未指定の場合、1とみなす）'
  , `min_double_value` DOUBLE comment '浮動小数最小値'
  , `max_double_value` DOUBLE comment '浮動小数最大値'
  , `double_step_value` DOUBLE comment '浮動小数変動量:画面でスピンボタンで変更した場合の変動量（未指定の場合、1.0とみなす）'
  , `start_date` DATE comment '開始日付'
  , `end_date` DATE comment '終了日付'
  , `start_time` TIME comment '開始時刻'
  , `end_time` TIME comment '終了時刻'
  , `selector_division_id` VARCHAR(64) comment '選択肢区分ID'
  , `selector_pattern` INT comment '選択形式:1:ドロップダウンリスト単一選択 2:ラジオボタン 3:チェックボックス 4:リストボックス単一選択 5:リストボックス複数選択'
  , `max_height_px` INT comment '画像最大高ピクセル'
  , `max_width_px` INT comment '画像最大幅ピクセル'
  , `limit_file_size` INT comment '最大サイズ（MB）'
  , `accept_extents` VARCHAR(1024) comment '許可拡張子'
  , `other_type_name` VARCHAR(255) comment 'その他タイプ識別名'
  , `input_width` INT comment '入力時の領域幅:入力項目として表示している際の、表示幅を文字数で指定する'
  , `input_height` INT comment '入力時の領域高:入力項目として表示している際の、表示高を行数で指定する'
  , `display_order` INT default 0 not null comment '表示順'
  , `publish` INT default 0 not null comment '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `attr_defs_PKC` primary key (`attr_def_group_id`,`id`)
) comment '属性定義マスタ' ;

-- システムポリシーマスタ
--* BackupToTempTable
drop table if exists `system_policys` cascade;

--* RestoreFromTempTable
create table `system_policys` (
  `id` VARCHAR(64) not null comment 'システムポリシーID'
  , `name` VARCHAR(255) comment 'システムポリシー名称'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `system_policys_PKC` primary key (`id`)
) comment 'システムポリシーマスタ' ;

-- システムポリシー設定値マスタ
--* BackupToTempTable
drop table if exists `system_policy_values` cascade;

--* RestoreFromTempTable
create table `system_policy_values` (
  `system_policy_id` VARCHAR(64) not null comment 'システムポリシーID'
  , `id` VARCHAR(64) not null comment '設定値ID'
  , `name` VARCHAR(255) comment '設定値名称'
  , `description` TEXT comment '説明'
  , `value` VARCHAR(1024) comment '設定値'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `system_policy_values_PKC` primary key (`system_policy_id`,`id`)
) comment 'システムポリシー設定値マスタ' ;

-- 仮登録トラン
--* BackupToTempTable
drop table if exists `temporary_regists` cascade;

--* RestoreFromTempTable
create table `temporary_regists` (
  `id` VARCHAR(64) not null comment '仮登録ID'
  , `user_id` VARCHAR(64) not null comment '利用者ID'
  , `apply_dtm` DATETIME not null comment '仮登録日時'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `temporary_regists_PKC` primary key (`id`)
) comment '仮登録トラン' ;

-- メニューグループ関連マスタ
--* BackupToTempTable
drop table if exists `menu_group_rels` cascade;

--* RestoreFromTempTable
create table `menu_group_rels` (
  `menu_group_id` VARCHAR(64) not null comment 'メニューグループID'
  , `menu_id` VARCHAR(64) not null comment 'メニューID'
  , `display_order` INT not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `menu_group_rels_PKC` primary key (`menu_group_id`,`menu_id`)
) comment 'メニューグループ関連マスタ' ;

-- メニューグループマスタ
--* BackupToTempTable
drop table if exists `menu_groups` cascade;

--* RestoreFromTempTable
create table `menu_groups` (
  `id` VARCHAR(64) not null comment 'メニューグループID'
  , `name` VARCHAR(255) comment 'メニューグループ名称'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `menu_groups_PKC` primary key (`id`)
) comment 'メニューグループマスタ' ;

-- リンクグループマスタ
--* BackupToTempTable
drop table if exists `link_groups` cascade;

--* RestoreFromTempTable
create table `link_groups` (
  `id` VARCHAR(64) not null comment 'リンクグループID'
  , `name` VARCHAR(255) comment 'リンクグループ名称'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `link_groups_PKC` primary key (`id`)
) comment 'リンクグループマスタ' ;

-- リンクグループ関連マスタ
--* BackupToTempTable
drop table if exists `link_group_rels` cascade;

--* RestoreFromTempTable
create table `link_group_rels` (
  `link_group_id` VARCHAR(64) not null comment 'リンクグループID'
  , `link_id` VARCHAR(64) not null comment 'リンクID'
  , `display_order` INT comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `link_group_rels_PKC` primary key (`link_group_id`,`link_id`)
) comment 'リンクグループ関連マスタ' ;

-- リンクマスタ
--* BackupToTempTable
drop table if exists `links` cascade;

--* RestoreFromTempTable
create table `links` (
  `id` VARCHAR(64) not null comment 'リンクID'
  , `name` VARCHAR(255) comment 'リンク名称'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `links_PKC` primary key (`id`)
) comment 'リンクマスタ' ;

-- リンク項目マスタ
--* BackupToTempTable
drop table if exists `link_items` cascade;

--* RestoreFromTempTable
create table `link_items` (
  `link_id` VARCHAR(64) not null comment 'リンクID'
  , `link_item_id` VARCHAR(64) not null comment 'リンク項目ID'
  , `link_item_type` INT default 0 not null comment 'リンク項目タイプ:0:ラベル 1:画面リンク 2:クライアント処理実行 3:サーバー処理実行 9:セパレータ'
  , `name` VARCHAR(255) comment 'リンク項目名称'
  , `link_item_value` VARCHAR(1024) comment 'リンク項目値'
  , `child_link_id` VARCHAR(64) comment '下位リンクID'
  , `display_order` INT default 0 not null comment '表示順'
  , `guest_enable_flag` TINYINT default 0 not null comment 'ゲスト時有効フラグ:0:ゲスト時は無効 1:ゲスト時に有効'
  , `certified_enable_flag` TINYINT default 0 not null comment '認証時有効フラグ:0:認証時無効 1:認証時有効'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `link_items_PKC` primary key (`link_id`,`link_item_id`)
) comment 'リンク項目マスタ' ;

-- メニュー項目マスタ
--* BackupToTempTable
drop table if exists `menu_items` cascade;

--* RestoreFromTempTable
create table `menu_items` (
  `menu_id` VARCHAR(64) not null comment 'メニューID'
  , `menu_item_id` VARCHAR(64) not null comment 'メニュー項目ID'
  , `menu_item_type` INT default 0 not null comment 'メニュー項目タイプ:0:ラベル 1:画面リンク 2:クライアント処理実行 3:サーバー処理実行 9:セパレータ'
  , `name` VARCHAR(255) comment 'メニュー項目名称'
  , `menu_item_value` VARCHAR(1024) comment 'メニュー項目値'
  , `child_menu_id` VARCHAR(64) comment '下位メニューID'
  , `display_order` INT default 0 not null comment '表示順'
  , `guest_enable_flag` TINYINT default 0 not null comment 'ゲスト時有効フラグ:0:ゲスト時は無効 1:ゲスト時に有効'
  , `certified_enable_flag` TINYINT default 0 not null comment '認証時有効フラグ:0:認証時無効 1:認証時有効'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `menu_items_PKC` primary key (`menu_id`,`menu_item_id`)
) comment 'メニュー項目マスタ' ;

-- システムマスタ
--* BackupToTempTable
drop table if exists `systems` cascade;

--* RestoreFromTempTable
create table `systems` (
  `id` VARCHAR(64) not null comment 'ID'
  , `logo_url` VARCHAR(1024) comment 'ロゴURI'
  , `name` VARCHAR(255) comment 'システム名称'
  , `short_name` VARCHAR(128) comment 'システム略称'
  , `tel_no` VARCHAR(14) comment '電話番号'
  , `reception_time` TEXT comment '受付時間'
  , `source_company` VARCHAR(64) comment '提供会社:システムを提供公開している会社'
  , `proprietary_company` VARCHAR(64) comment '管理会社:システムを管理している会社'
  , `welcome_message_prefix` TEXT comment 'ウェルカムメッセージ前'
  , `welcome_message_suffix` TEXT comment 'ウェルカムメッセージ後'
  , `certified_welcome_message_suffix` TEXT comment '認証済ウェルカムメッセージ後'
  , `copyright` VARCHAR(1024) comment 'コピーライト'
  , `description` TEXT comment 'システム説明'
  , `theme_id` VARCHAR(64) default '*' not null comment '適用テーマID:システムに適用しているテーマのID'
  , `site` VARCHAR(1024) not null comment 'サイト'
  , `catchphrase` TEXT comment 'キャッチフレーズ'
  , `from_email` VARCHAR(128) default 'joh.test.notifier@gmail.com' not null comment '通知元メールアドレス:通知メールを送る際の送信元メールアドレス'
  , `from_email_name` VARCHAR(255) default 'GoodLife通知' not null comment '通知元名称:メールクライアントでの通知メールのアドレスの表示名'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `systems_PKC` primary key (`id`)
) comment 'システムマスタ' ;

-- テーママスタ
--* BackupToTempTable
drop table if exists `themes` cascade;

--* RestoreFromTempTable
create table `themes` (
  `id` VARCHAR(64) not null comment 'テーマID'
  , `name` VARCHAR(255) comment 'テーマ名'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `themes_PKC` primary key (`id`)
) comment 'テーママスタ' ;

-- 色マスタ
--* BackupToTempTable
drop table if exists `colors` cascade;

--* RestoreFromTempTable
create table `colors` (
  `theme_id` VARCHAR(64) not null comment 'テーマID'
  , `category` VARCHAR(128) not null comment '分類'
  , `id` VARCHAR(64) not null comment '色ID'
  , `fore_color` VARCHAR(32) comment '前景色'
  , `back_color` VARCHAR(32) comment '背景色'
  , `border_color` VARCHAR(32) comment '境界線色'
  , `descrption` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `colors_PKC` primary key (`theme_id`,`category`,`id`)
) comment '色マスタ' ;

-- 中区分値マスタ
--* BackupToTempTable
drop table if exists `medium_division_values` cascade;

--* RestoreFromTempTable
create table `medium_division_values` (
  `division_id` VARCHAR(64) not null comment '区分ID'
  , `medium_division_id` VARCHAR(64) not null comment '中区分ID'
  , `id` VARCHAR(64) not null comment '中区分値ID'
  , `name` VARCHAR(255) comment '中区分値名称'
  , `value` VARCHAR(1024) comment '中区分値'
  , `public_flag` TINYINT default 0 not null comment '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `medium_division_values_PKC` primary key (`division_id`,`medium_division_id`,`id`)
) comment '中区分値マスタ' ;

-- 中区分マスタ
--* BackupToTempTable
drop table if exists `medium_divisions` cascade;

--* RestoreFromTempTable
create table `medium_divisions` (
  `division_id` VARCHAR(64) not null comment '区分ID'
  , `medium_division_id` VARCHAR(64) not null comment '中区分ID'
  , `name` VARCHAR(255) comment '中区分名称'
  , `public_flag` TINYINT default 0 not null comment '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `medium_divisions_PKC` primary key (`division_id`,`medium_division_id`)
) comment '中区分マスタ' ;

-- 会社別勤務日マスタ
--* BackupToTempTable
drop table if exists `caompany_workdays` cascade;

--* RestoreFromTempTable
create table `caompany_workdays` (
  `id` VARCHAR(64) not null comment '会社ID'
  , `year` INT not null comment '年'
  , `month` INT not null comment '月'
  , `day` INT not null comment '日'
  , `name` VARCHAR(255) comment '名称'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `caompany_workdays_PKC` primary key (`id`,`year`,`month`,`day`)
) comment '会社別勤務日マスタ:休日及び祭日、会社休日に設定されている休日を勤務日として上書き設定する' ;

-- 会社別祭日マスタ
--* BackupToTempTable
drop table if exists `company_holidays` cascade;

--* RestoreFromTempTable
create table `company_holidays` (
  `id` VARCHAR(64) not null comment '会社ID'
  , `year` INT not null comment '年'
  , `month` INT not null comment '月'
  , `day` INT not null comment '日'
  , `name` VARCHAR(255) comment '名称'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `company_holidays_PKC` primary key (`id`,`year`,`month`,`day`)
) comment '会社別祭日マスタ' ;

-- 祭日マスタ
--* BackupToTempTable
drop table if exists `holidays` cascade;

--* RestoreFromTempTable
create table `holidays` (
  `year` INT not null comment '年'
  , `month` INT not null comment '月'
  , `day` INT not null comment '日'
  , `name` VARCHAR(255) comment '名称'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `holidays_PKC` primary key (`year`,`month`,`day`)
) comment '祭日マスタ' ;

-- 日付マスタ
--* BackupToTempTable
drop table if exists `dates` cascade;

--* RestoreFromTempTable
create table `dates` (
  `id` VARCHAR(64) not null comment 'ID'
  , `reference_date` DATE not null comment '基準日'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `dates_PKC` primary key (`id`)
) comment '日付マスタ' ;

-- メニューマスタ
--* BackupToTempTable
drop table if exists `menus` cascade;

--* RestoreFromTempTable
create table `menus` (
  `id` VARCHAR(64) not null comment 'メニューID'
  , `name` VARCHAR(255) comment 'メニュー名称'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `menus_PKC` primary key (`id`)
) comment 'メニューマスタ' ;

-- 画面ロールマスタ
--* BackupToTempTable
drop table if exists `screen_roles` cascade;

--* RestoreFromTempTable
create table `screen_roles` (
  `screen_id` VARCHAR(64) not null comment '画面ID'
  , `role_id` VARCHAR(64) not null comment 'ロールID'
  , `start_date` DATE not null comment '開始日'
  , `end_date` DATE default '9999-12-31' not null comment '終了日'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `screen_roles_PKC` primary key (`screen_id`,`role_id`,`start_date`)
) comment '画面ロールマスタ' ;

-- 画面マスタ
--* BackupToTempTable
drop table if exists `screens` cascade;

--* RestoreFromTempTable
create table `screens` (
  `id` VARCHAR(64) not null comment '画面ID'
  , `url` VARCHAR(1024) not null comment 'URL'
  , `title` VARCHAR(255) comment 'タイトル'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `screens_PKC` primary key (`id`)
) comment '画面マスタ' ;

-- 利用者パスワード・トラン
--* BackupToTempTable
drop table if exists `user_passwords` cascade;

--* RestoreFromTempTable
create table `user_passwords` (
  `user_id` VARCHAR(64) not null comment '利用者ID'
  , `password` VARCHAR(64) not null comment 'パスワード:ハッシュ化した状態で格納する事'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `user_passwords_PKC` primary key (`user_id`,`password`)
) comment '利用者パスワード・トラン' ;

-- 整数値マスタ
--* BackupToTempTable
drop table if exists `integer_values` cascade;

--* RestoreFromTempTable
create table `integer_values` (
  `integer_id` INT not null comment '整数ID'
  , `value` INT not null comment '整数値'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `integer_values_PKC` primary key (`integer_id`,`value`)
) comment '整数値マスタ' ;

-- 整数マスタ
--* BackupToTempTable
drop table if exists `integers` cascade;

--* RestoreFromTempTable
create table `integers` (
  `id` INT not null comment 'ID'
  , `name` VARCHAR(255) comment '整数名'
  , `description` TEXT comment '説明'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `integers_PKC` primary key (`id`)
) comment '整数マスタ' ;

-- 利用者ロールマスタ
--* BackupToTempTable
drop table if exists `user_roles` cascade;

--* RestoreFromTempTable
create table `user_roles` (
  `user_id` VARCHAR(64) not null comment '利用者ID'
  , `role_id` VARCHAR(64) not null comment 'ロールID'
  , `start_date` DATE not null comment '開始日'
  , `end_date` DATE default '9999-12-31' not null comment '終了日'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `user_roles_PKC` primary key (`user_id`,`role_id`,`start_date`)
) comment '利用者ロールマスタ' ;

-- ロールマスタ
--* BackupToTempTable
drop table if exists `roles` cascade;

--* RestoreFromTempTable
create table `roles` (
  `id` VARCHAR(64) not null comment 'ロールID'
  , `name` VARCHAR(255) comment 'ロール名称'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `roles_PKC` primary key (`id`)
) comment 'ロールマスタ' ;

-- 利用者属性マスタ
--* BackupToTempTable
drop table if exists `user_attrs` cascade;

--* RestoreFromTempTable
create table `user_attrs` (
  `user_id` VARCHAR(64) not null comment '利用者ID'
  , `attr_def_id` VARCHAR(64) not null comment '属性定義ID'
  , `attr_value` VARCHAR(1024) comment '属性値'
  , `publish` INT default 0 not null comment '公開先:0:管理者のみ公開 1:自分に公開 2:同グループへ公開 9:全公開'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `user_attrs_PKC` primary key (`user_id`,`attr_def_id`)
) comment '利用者属性マスタ' ;

-- 利用者マスタ
--* BackupToTempTable
drop table if exists `users` cascade;

--* RestoreFromTempTable
create table `users` (
  `id` VARCHAR(64) not null comment '利用者ID'
  , `nickname` VARCHAR(255) comment 'ニックネーム'
  , `email` VARCHAR(128) not null comment 'メールアドレス'
  , `login_id` VARCHAR(64) not null comment '認証ID'
  , `admin_flag` TINYINT default 0 not null comment '管理者フラグ:0:非システム管理者 1:システム管理者'
  , `retry_count` INT default 0 not null comment 'リトライ回数'
  , `last_login_dtm` DATETIME comment '最終ログイン日時'
  , `regist_dtm` DATETIME comment '本登録日時'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `users_PKC` primary key (`id`)
) comment '利用者マスタ' ;

-- 区分値マスタ
--* BackupToTempTable
drop table if exists `division_values` cascade;

--* RestoreFromTempTable
create table `division_values` (
  `division_id` VARCHAR(64) not null comment '区分ID'
  , `id` VARCHAR(64) not null comment '区分値ID'
  , `name` VARCHAR(255) comment '区分値名称'
  , `value` VARCHAR(1024) comment '区分値'
  , `public_flag` TINYINT default 0 not null comment '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `division_values_PKC` primary key (`division_id`,`id`)
) comment '区分値マスタ' ;

-- 区分マスタ
--* BackupToTempTable
drop table if exists `divisions` cascade;

--* RestoreFromTempTable
create table `divisions` (
  `id` VARCHAR(64) not null comment '区分ID'
  , `name` VARCHAR(255) comment '区分名称'
  , `public_flag` TINYINT default 0 not null comment '公開フラグ:0:管理者のみ公開 1:管理者以外へ公開'
  , `display_order` INT default 0 not null comment '表示順'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `divisions_PKC` primary key (`id`)
) comment '区分マスタ' ;

-- 会社マスタ
--* BackupToTempTable
drop table if exists `campanys` cascade;

--* RestoreFromTempTable
create table `campanys` (
  `id` VARCHAR(64) not null comment '会社ID'
  , `name` VARCHAR(255) not null comment '名称'
  , `logo_path` VARCHAR(1024) comment '会社ロゴ画像:ロゴ画像の格納先のパス'
  , `tel_no` VARCHAR(14) comment '電話番号'
  , `zip_no` VARCHAR(7) comment '郵便番号'
  , `address` VARCHAR(255) comment '住所'
  , `building` VARCHAR(255) comment '建物'
  , `business_hours` VARCHAR(1024) comment '営業時間'
  , `create_tm` INT not null comment '作成タイムスタンプ'
  , `create_id` VARCHAR(64) default 0 not null comment '作成者ID'
  , `modify_tm` INT not null comment '更新タイムスタンプ'
  , `modify_id` VARCHAR(64) default 0 not null comment '更新者ID'
  , `program` VARCHAR(255) default '*' not null comment 'プログラム名:作成・更新したプログラムの識別子'
  , `delete_flag` TINYINT default 0 not null comment '削除フラグ'
  , constraint `campanys_PKC` primary key (`id`)
) comment '会社マスタ' ;

