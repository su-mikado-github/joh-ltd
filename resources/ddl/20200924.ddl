-- Project Name : �����w���T�C�g�i�O�b�h���C�t�j�d�q
-- Date/Time    : 2020/09/24 1:02:16
-- Author       : ���R�C��
-- RDBMS Type   : MySQL
-- Application  : A5:SQL Mk-2

/*
  BackupToTempTable, RestoreFromTempTable�^�����߂��t������Ă��܂��B
  ����ɂ��Adrop table, create table ����f�[�^���c��܂��B
  ���̋@�\�͈ꎞ�I�� $$TableName �̂悤�Ȉꎞ�e�[�u�����쐬���܂��B
*/

-- �㗝�X�⍇���g����
--* BackupToTempTable
drop table if exists `agent_inquirys` cascade;

--* RestoreFromTempTable
create table `agent_inquirys` (
  `id` VARCHAR(64) not null comment '�㗝�X�⍇��ID'
  , `inquiry_dtm` DATETIME not null comment '�⍇������'
  , `email_attr_id` VARCHAR(64) not null comment '���[���A�h���X����ID'
  , `progress` INT default 0 not null comment '�i��:0:�쐬 1:�Ǘ��Ҋm�F�ς� 2:�񓚍�'
  , `reply_dtm` DATETIME comment '�񓚓���'
  , `reply_user_id` VARCHAR(64) comment '�񓚒S����ID'
  , `reply_content` TEXT comment '�񓚓��e'
  , `user_id` VARCHAR(64) comment '���p��ID'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `agent_inquirys_PKC` primary key (`id`)
) comment '�㗝�X�⍇���g����' ;

-- �㗝�X�⍇�������g����
--* BackupToTempTable
drop table if exists `agent_inquiry_attrs` cascade;

--* RestoreFromTempTable
create table `agent_inquiry_attrs` (
  `agent_inquiry_id` VARCHAR(64) not null comment '�㗝�X�⍇��ID'
  , `attr_def_id` VARCHAR(64) not null comment '������`ID'
  , `attr_value` VARCHAR(1024) comment '�����l'
  , `publish` INT default 0 not null comment '���J��:0:�Ǘ��҂̂݌��J 1:�����Ɍ��J 2:���O���[�v�֌��J 9:�S���J'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `agent_inquiry_attrs_PKC` primary key (`agent_inquiry_id`,`attr_def_id`)
) comment '�㗝�X�⍇�������g����' ;

-- ���x���}�X�^
--* BackupToTempTable
drop table if exists `labels` cascade;

--* RestoreFromTempTable
create table `labels` (
  `group_id` VARCHAR(64) not null comment '�O���[�vID'
  , `id` VARCHAR(64) not null comment 'ID'
  , `locale` VARCHAR(64) not null comment '���P�[��:*:�f�t�H���g���P�[�� ja_JP��:�����I�ȃ��P�[��'
  , `label` VARCHAR(1024) comment '���x��'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `labels_PKC` primary key (`group_id`,`id`,`locale`)
) comment '���x���}�X�^' ;

-- ���̓}�X�^
--* BackupToTempTable
drop table if exists `documents` cascade;

--* RestoreFromTempTable
create table `documents` (
  `group_id` VARCHAR(64) not null comment '�O���[�vID'
  , `id` VARCHAR(64) not null comment 'ID'
  , `locale` VARCHAR(64) not null comment '���P�[��:*:�f�t�H���g���P�[�� ja_JP��:�����I�ȃ��P�[��'
  , `document` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `documents_PKC` primary key (`group_id`,`id`,`locale`)
) comment '���̓}�X�^' ;

-- ������`�O���[�v�}�X�^
--* BackupToTempTable
drop table if exists `attr_def_groups` cascade;

--* RestoreFromTempTable
create table `attr_def_groups` (
  `id` VARCHAR(64) not null comment '������`�O���[�vID'
  , `name` VARCHAR(255) comment '������`�O���[�v����'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `attr_def_groups_PKC` primary key (`id`)
) comment '������`�O���[�v�}�X�^' ;

-- ������`�}�X�^
--* BackupToTempTable
drop table if exists `attr_defs` cascade;

--* RestoreFromTempTable
create table `attr_defs` (
  `attr_def_group_id` VARCHAR(64) not null comment '������`�O���[�vID'
  , `id` VARCHAR(64) not null comment '������`ID'
  , `name` VARCHAR(255) not null comment '������'
  , `example` TEXT comment '��:placefolder�����ɓW�J'
  , `hint` TEXT comment '�q���g:title�����ɓW�J'
  , `require_flag` TINYINT default 0 not null comment '�K�{�t���O'
  , `text_type` VARCHAR(1024) comment '�e�L�X�g���̓^�C�v:INPUT�^�O�ɓW�J�����ۂ�type�����̒l�B���w��ł́utext�v�ƂȂ�B�^��1�̏ꍇ�����L��'
  , `default_attr_value` VARCHAR(1024) comment '�f�t�H���g�����l'
  , `value_type` INT not null comment '�^:1:������ 11:�����s������ 2:���� 3:�������� 4:���t 5:���� 6:�敪�I�� 7:�摜 8:�t�@�C�� 99:���̑�'
  , `min_length` INT comment '�ŏ�����'
  , `max_length` INT comment '�ő包��'
  , `regex` VARCHAR(1024) comment '������p�^�[��'
  , `regex_unmatch` VARCHAR(1024) comment '������p�^�[���s��v'
  , `min_bigint_value` BIGINT comment '�����ŏ��l'
  , `max_bigint_value` BIGINT comment '�����ő�l'
  , `bigint_step_value` BIGINT comment '�����ϓ���:��ʂŃX�s���{�^���ŕύX�����ꍇ�̕ϓ��ʁi���w��̏ꍇ�A1�Ƃ݂Ȃ��j'
  , `min_double_value` DOUBLE comment '���������ŏ��l'
  , `max_double_value` DOUBLE comment '���������ő�l'
  , `double_step_value` DOUBLE comment '���������ϓ���:��ʂŃX�s���{�^���ŕύX�����ꍇ�̕ϓ��ʁi���w��̏ꍇ�A1.0�Ƃ݂Ȃ��j'
  , `start_date` DATE comment '�J�n���t'
  , `end_date` DATE comment '�I�����t'
  , `start_time` TIME comment '�J�n����'
  , `end_time` TIME comment '�I������'
  , `selector_division_id` VARCHAR(64) comment '�I�����敪ID'
  , `selector_pattern` INT comment '�I���`��:1:�h���b�v�_�E�����X�g�P��I�� 2:���W�I�{�^�� 3:�`�F�b�N�{�b�N�X 4:���X�g�{�b�N�X�P��I�� 5:���X�g�{�b�N�X�����I��'
  , `max_height_px` INT comment '�摜�ő卂�s�N�Z��'
  , `max_width_px` INT comment '�摜�ő啝�s�N�Z��'
  , `limit_file_size` INT comment '�ő�T�C�Y�iMB�j'
  , `accept_extents` VARCHAR(1024) comment '���g���q'
  , `other_type_name` VARCHAR(255) comment '���̑��^�C�v���ʖ�'
  , `input_width` INT comment '���͎��̗̈敝:���͍��ڂƂ��ĕ\�����Ă���ۂ́A�\�����𕶎����Ŏw�肷��'
  , `input_height` INT comment '���͎��̗̈捂:���͍��ڂƂ��ĕ\�����Ă���ۂ́A�\�������s���Ŏw�肷��'
  , `display_order` INT default 0 not null comment '�\����'
  , `publish` INT default 0 not null comment '���J��:0:�Ǘ��҂̂݌��J 1:�����Ɍ��J 2:���O���[�v�֌��J 9:�S���J'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `attr_defs_PKC` primary key (`attr_def_group_id`,`id`)
) comment '������`�}�X�^' ;

-- �V�X�e���|���V�[�}�X�^
--* BackupToTempTable
drop table if exists `system_policys` cascade;

--* RestoreFromTempTable
create table `system_policys` (
  `id` VARCHAR(64) not null comment '�V�X�e���|���V�[ID'
  , `name` VARCHAR(255) comment '�V�X�e���|���V�[����'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `system_policys_PKC` primary key (`id`)
) comment '�V�X�e���|���V�[�}�X�^' ;

-- �V�X�e���|���V�[�ݒ�l�}�X�^
--* BackupToTempTable
drop table if exists `system_policy_values` cascade;

--* RestoreFromTempTable
create table `system_policy_values` (
  `system_policy_id` VARCHAR(64) not null comment '�V�X�e���|���V�[ID'
  , `id` VARCHAR(64) not null comment '�ݒ�lID'
  , `name` VARCHAR(255) comment '�ݒ�l����'
  , `description` TEXT comment '����'
  , `value` VARCHAR(1024) comment '�ݒ�l'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `system_policy_values_PKC` primary key (`system_policy_id`,`id`)
) comment '�V�X�e���|���V�[�ݒ�l�}�X�^' ;

-- ���o�^�g����
--* BackupToTempTable
drop table if exists `temporary_regists` cascade;

--* RestoreFromTempTable
create table `temporary_regists` (
  `id` VARCHAR(64) not null comment '���o�^ID'
  , `user_id` VARCHAR(64) not null comment '���p��ID'
  , `apply_dtm` DATETIME not null comment '���o�^����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `temporary_regists_PKC` primary key (`id`)
) comment '���o�^�g����' ;

-- ���j���[�O���[�v�֘A�}�X�^
--* BackupToTempTable
drop table if exists `menu_group_rels` cascade;

--* RestoreFromTempTable
create table `menu_group_rels` (
  `menu_group_id` VARCHAR(64) not null comment '���j���[�O���[�vID'
  , `menu_id` VARCHAR(64) not null comment '���j���[ID'
  , `display_order` INT not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `menu_group_rels_PKC` primary key (`menu_group_id`,`menu_id`)
) comment '���j���[�O���[�v�֘A�}�X�^' ;

-- ���j���[�O���[�v�}�X�^
--* BackupToTempTable
drop table if exists `menu_groups` cascade;

--* RestoreFromTempTable
create table `menu_groups` (
  `id` VARCHAR(64) not null comment '���j���[�O���[�vID'
  , `name` VARCHAR(255) comment '���j���[�O���[�v����'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `menu_groups_PKC` primary key (`id`)
) comment '���j���[�O���[�v�}�X�^' ;

-- �����N�O���[�v�}�X�^
--* BackupToTempTable
drop table if exists `link_groups` cascade;

--* RestoreFromTempTable
create table `link_groups` (
  `id` VARCHAR(64) not null comment '�����N�O���[�vID'
  , `name` VARCHAR(255) comment '�����N�O���[�v����'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `link_groups_PKC` primary key (`id`)
) comment '�����N�O���[�v�}�X�^' ;

-- �����N�O���[�v�֘A�}�X�^
--* BackupToTempTable
drop table if exists `link_group_rels` cascade;

--* RestoreFromTempTable
create table `link_group_rels` (
  `link_group_id` VARCHAR(64) not null comment '�����N�O���[�vID'
  , `link_id` VARCHAR(64) not null comment '�����NID'
  , `display_order` INT comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `link_group_rels_PKC` primary key (`link_group_id`,`link_id`)
) comment '�����N�O���[�v�֘A�}�X�^' ;

-- �����N�}�X�^
--* BackupToTempTable
drop table if exists `links` cascade;

--* RestoreFromTempTable
create table `links` (
  `id` VARCHAR(64) not null comment '�����NID'
  , `name` VARCHAR(255) comment '�����N����'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `links_PKC` primary key (`id`)
) comment '�����N�}�X�^' ;

-- �����N���ڃ}�X�^
--* BackupToTempTable
drop table if exists `link_items` cascade;

--* RestoreFromTempTable
create table `link_items` (
  `link_id` VARCHAR(64) not null comment '�����NID'
  , `link_item_id` VARCHAR(64) not null comment '�����N����ID'
  , `link_item_type` INT default 0 not null comment '�����N���ڃ^�C�v:0:���x�� 1:��ʃ����N 2:�N���C�A���g�������s 3:�T�[�o�[�������s 9:�Z�p���[�^'
  , `name` VARCHAR(255) comment '�����N���ږ���'
  , `link_item_value` VARCHAR(1024) comment '�����N���ڒl'
  , `child_link_id` VARCHAR(64) comment '���ʃ����NID'
  , `display_order` INT default 0 not null comment '�\����'
  , `guest_enable_flag` TINYINT default 0 not null comment '�Q�X�g���L���t���O:0:�Q�X�g���͖��� 1:�Q�X�g���ɗL��'
  , `certified_enable_flag` TINYINT default 0 not null comment '�F�؎��L���t���O:0:�F�؎����� 1:�F�؎��L��'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `link_items_PKC` primary key (`link_id`,`link_item_id`)
) comment '�����N���ڃ}�X�^' ;

-- ���j���[���ڃ}�X�^
--* BackupToTempTable
drop table if exists `menu_items` cascade;

--* RestoreFromTempTable
create table `menu_items` (
  `menu_id` VARCHAR(64) not null comment '���j���[ID'
  , `menu_item_id` VARCHAR(64) not null comment '���j���[����ID'
  , `menu_item_type` INT default 0 not null comment '���j���[���ڃ^�C�v:0:���x�� 1:��ʃ����N 2:�N���C�A���g�������s 3:�T�[�o�[�������s 9:�Z�p���[�^'
  , `name` VARCHAR(255) comment '���j���[���ږ���'
  , `menu_item_value` VARCHAR(1024) comment '���j���[���ڒl'
  , `child_menu_id` VARCHAR(64) comment '���ʃ��j���[ID'
  , `display_order` INT default 0 not null comment '�\����'
  , `guest_enable_flag` TINYINT default 0 not null comment '�Q�X�g���L���t���O:0:�Q�X�g���͖��� 1:�Q�X�g���ɗL��'
  , `certified_enable_flag` TINYINT default 0 not null comment '�F�؎��L���t���O:0:�F�؎����� 1:�F�؎��L��'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `menu_items_PKC` primary key (`menu_id`,`menu_item_id`)
) comment '���j���[���ڃ}�X�^' ;

-- �V�X�e���}�X�^
--* BackupToTempTable
drop table if exists `systems` cascade;

--* RestoreFromTempTable
create table `systems` (
  `id` VARCHAR(64) not null comment 'ID'
  , `logo_url` VARCHAR(1024) comment '���SURI'
  , `name` VARCHAR(255) comment '�V�X�e������'
  , `short_name` VARCHAR(128) comment '�V�X�e������'
  , `tel_no` VARCHAR(14) comment '�d�b�ԍ�'
  , `reception_time` TEXT comment '��t����'
  , `source_company` VARCHAR(64) comment '�񋟉��:�V�X�e����񋟌��J���Ă�����'
  , `proprietary_company` VARCHAR(64) comment '�Ǘ����:�V�X�e�����Ǘ����Ă�����'
  , `welcome_message_prefix` TEXT comment '�E�F���J�����b�Z�[�W�O'
  , `welcome_message_suffix` TEXT comment '�E�F���J�����b�Z�[�W��'
  , `certified_welcome_message_suffix` TEXT comment '�F�؍σE�F���J�����b�Z�[�W��'
  , `copyright` VARCHAR(1024) comment '�R�s�[���C�g'
  , `description` TEXT comment '�V�X�e������'
  , `theme_id` VARCHAR(64) default '*' not null comment '�K�p�e�[�}ID:�V�X�e���ɓK�p���Ă���e�[�}��ID'
  , `site` VARCHAR(1024) not null comment '�T�C�g'
  , `catchphrase` TEXT comment '�L���b�`�t���[�Y'
  , `from_email` VARCHAR(128) default 'joh.test.notifier@gmail.com' not null comment '�ʒm�����[���A�h���X:�ʒm���[���𑗂�ۂ̑��M�����[���A�h���X'
  , `from_email_name` VARCHAR(255) default 'GoodLife�ʒm' not null comment '�ʒm������:���[���N���C�A���g�ł̒ʒm���[���̃A�h���X�̕\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `systems_PKC` primary key (`id`)
) comment '�V�X�e���}�X�^' ;

-- �e�[�}�}�X�^
--* BackupToTempTable
drop table if exists `themes` cascade;

--* RestoreFromTempTable
create table `themes` (
  `id` VARCHAR(64) not null comment '�e�[�}ID'
  , `name` VARCHAR(255) comment '�e�[�}��'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `themes_PKC` primary key (`id`)
) comment '�e�[�}�}�X�^' ;

-- �F�}�X�^
--* BackupToTempTable
drop table if exists `colors` cascade;

--* RestoreFromTempTable
create table `colors` (
  `theme_id` VARCHAR(64) not null comment '�e�[�}ID'
  , `category` VARCHAR(128) not null comment '����'
  , `id` VARCHAR(64) not null comment '�FID'
  , `fore_color` VARCHAR(32) comment '�O�i�F'
  , `back_color` VARCHAR(32) comment '�w�i�F'
  , `border_color` VARCHAR(32) comment '���E���F'
  , `descrption` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `colors_PKC` primary key (`theme_id`,`category`,`id`)
) comment '�F�}�X�^' ;

-- ���敪�l�}�X�^
--* BackupToTempTable
drop table if exists `medium_division_values` cascade;

--* RestoreFromTempTable
create table `medium_division_values` (
  `division_id` VARCHAR(64) not null comment '�敪ID'
  , `medium_division_id` VARCHAR(64) not null comment '���敪ID'
  , `id` VARCHAR(64) not null comment '���敪�lID'
  , `name` VARCHAR(255) comment '���敪�l����'
  , `value` VARCHAR(1024) comment '���敪�l'
  , `public_flag` TINYINT default 0 not null comment '���J�t���O:0:�Ǘ��҂̂݌��J 1:�Ǘ��҈ȊO�֌��J'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `medium_division_values_PKC` primary key (`division_id`,`medium_division_id`,`id`)
) comment '���敪�l�}�X�^' ;

-- ���敪�}�X�^
--* BackupToTempTable
drop table if exists `medium_divisions` cascade;

--* RestoreFromTempTable
create table `medium_divisions` (
  `division_id` VARCHAR(64) not null comment '�敪ID'
  , `medium_division_id` VARCHAR(64) not null comment '���敪ID'
  , `name` VARCHAR(255) comment '���敪����'
  , `public_flag` TINYINT default 0 not null comment '���J�t���O:0:�Ǘ��҂̂݌��J 1:�Ǘ��҈ȊO�֌��J'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `medium_divisions_PKC` primary key (`division_id`,`medium_division_id`)
) comment '���敪�}�X�^' ;

-- ��ЕʋΖ����}�X�^
--* BackupToTempTable
drop table if exists `caompany_workdays` cascade;

--* RestoreFromTempTable
create table `caompany_workdays` (
  `id` VARCHAR(64) not null comment '���ID'
  , `year` INT not null comment '�N'
  , `month` INT not null comment '��'
  , `day` INT not null comment '��'
  , `name` VARCHAR(255) comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `caompany_workdays_PKC` primary key (`id`,`year`,`month`,`day`)
) comment '��ЕʋΖ����}�X�^:�x���y�эՓ��A��Ћx���ɐݒ肳��Ă���x�����Ζ����Ƃ��ď㏑���ݒ肷��' ;

-- ��ЕʍՓ��}�X�^
--* BackupToTempTable
drop table if exists `company_holidays` cascade;

--* RestoreFromTempTable
create table `company_holidays` (
  `id` VARCHAR(64) not null comment '���ID'
  , `year` INT not null comment '�N'
  , `month` INT not null comment '��'
  , `day` INT not null comment '��'
  , `name` VARCHAR(255) comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `company_holidays_PKC` primary key (`id`,`year`,`month`,`day`)
) comment '��ЕʍՓ��}�X�^' ;

-- �Փ��}�X�^
--* BackupToTempTable
drop table if exists `holidays` cascade;

--* RestoreFromTempTable
create table `holidays` (
  `year` INT not null comment '�N'
  , `month` INT not null comment '��'
  , `day` INT not null comment '��'
  , `name` VARCHAR(255) comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `holidays_PKC` primary key (`year`,`month`,`day`)
) comment '�Փ��}�X�^' ;

-- ���t�}�X�^
--* BackupToTempTable
drop table if exists `dates` cascade;

--* RestoreFromTempTable
create table `dates` (
  `id` VARCHAR(64) not null comment 'ID'
  , `reference_date` DATE not null comment '���'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `dates_PKC` primary key (`id`)
) comment '���t�}�X�^' ;

-- ���j���[�}�X�^
--* BackupToTempTable
drop table if exists `menus` cascade;

--* RestoreFromTempTable
create table `menus` (
  `id` VARCHAR(64) not null comment '���j���[ID'
  , `name` VARCHAR(255) comment '���j���[����'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `menus_PKC` primary key (`id`)
) comment '���j���[�}�X�^' ;

-- ��ʃ��[���}�X�^
--* BackupToTempTable
drop table if exists `screen_roles` cascade;

--* RestoreFromTempTable
create table `screen_roles` (
  `screen_id` VARCHAR(64) not null comment '���ID'
  , `role_id` VARCHAR(64) not null comment '���[��ID'
  , `start_date` DATE not null comment '�J�n��'
  , `end_date` DATE default '9999-12-31' not null comment '�I����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `screen_roles_PKC` primary key (`screen_id`,`role_id`,`start_date`)
) comment '��ʃ��[���}�X�^' ;

-- ��ʃ}�X�^
--* BackupToTempTable
drop table if exists `screens` cascade;

--* RestoreFromTempTable
create table `screens` (
  `id` VARCHAR(64) not null comment '���ID'
  , `url` VARCHAR(1024) not null comment 'URL'
  , `title` VARCHAR(255) comment '�^�C�g��'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `screens_PKC` primary key (`id`)
) comment '��ʃ}�X�^' ;

-- ���p�҃p�X���[�h�E�g����
--* BackupToTempTable
drop table if exists `user_passwords` cascade;

--* RestoreFromTempTable
create table `user_passwords` (
  `user_id` VARCHAR(64) not null comment '���p��ID'
  , `password` VARCHAR(64) not null comment '�p�X���[�h:�n�b�V����������ԂŊi�[���鎖'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `user_passwords_PKC` primary key (`user_id`,`password`)
) comment '���p�҃p�X���[�h�E�g����' ;

-- �����l�}�X�^
--* BackupToTempTable
drop table if exists `integer_values` cascade;

--* RestoreFromTempTable
create table `integer_values` (
  `integer_id` INT not null comment '����ID'
  , `value` INT not null comment '�����l'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `integer_values_PKC` primary key (`integer_id`,`value`)
) comment '�����l�}�X�^' ;

-- �����}�X�^
--* BackupToTempTable
drop table if exists `integers` cascade;

--* RestoreFromTempTable
create table `integers` (
  `id` INT not null comment 'ID'
  , `name` VARCHAR(255) comment '������'
  , `description` TEXT comment '����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `integers_PKC` primary key (`id`)
) comment '�����}�X�^' ;

-- ���p�҃��[���}�X�^
--* BackupToTempTable
drop table if exists `user_roles` cascade;

--* RestoreFromTempTable
create table `user_roles` (
  `user_id` VARCHAR(64) not null comment '���p��ID'
  , `role_id` VARCHAR(64) not null comment '���[��ID'
  , `start_date` DATE not null comment '�J�n��'
  , `end_date` DATE default '9999-12-31' not null comment '�I����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `user_roles_PKC` primary key (`user_id`,`role_id`,`start_date`)
) comment '���p�҃��[���}�X�^' ;

-- ���[���}�X�^
--* BackupToTempTable
drop table if exists `roles` cascade;

--* RestoreFromTempTable
create table `roles` (
  `id` VARCHAR(64) not null comment '���[��ID'
  , `name` VARCHAR(255) comment '���[������'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `roles_PKC` primary key (`id`)
) comment '���[���}�X�^' ;

-- ���p�ґ����}�X�^
--* BackupToTempTable
drop table if exists `user_attrs` cascade;

--* RestoreFromTempTable
create table `user_attrs` (
  `user_id` VARCHAR(64) not null comment '���p��ID'
  , `attr_def_id` VARCHAR(64) not null comment '������`ID'
  , `attr_value` VARCHAR(1024) comment '�����l'
  , `publish` INT default 0 not null comment '���J��:0:�Ǘ��҂̂݌��J 1:�����Ɍ��J 2:���O���[�v�֌��J 9:�S���J'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `user_attrs_PKC` primary key (`user_id`,`attr_def_id`)
) comment '���p�ґ����}�X�^' ;

-- ���p�҃}�X�^
--* BackupToTempTable
drop table if exists `users` cascade;

--* RestoreFromTempTable
create table `users` (
  `id` VARCHAR(64) not null comment '���p��ID'
  , `nickname` VARCHAR(255) comment '�j�b�N�l�[��'
  , `email` VARCHAR(128) not null comment '���[���A�h���X'
  , `login_id` VARCHAR(64) not null comment '�F��ID'
  , `admin_flag` TINYINT default 0 not null comment '�Ǘ��҃t���O:0:��V�X�e���Ǘ��� 1:�V�X�e���Ǘ���'
  , `retry_count` INT default 0 not null comment '���g���C��'
  , `last_login_dtm` DATETIME comment '�ŏI���O�C������'
  , `regist_dtm` DATETIME comment '�{�o�^����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `users_PKC` primary key (`id`)
) comment '���p�҃}�X�^' ;

-- �敪�l�}�X�^
--* BackupToTempTable
drop table if exists `division_values` cascade;

--* RestoreFromTempTable
create table `division_values` (
  `division_id` VARCHAR(64) not null comment '�敪ID'
  , `id` VARCHAR(64) not null comment '�敪�lID'
  , `name` VARCHAR(255) comment '�敪�l����'
  , `value` VARCHAR(1024) comment '�敪�l'
  , `public_flag` TINYINT default 0 not null comment '���J�t���O:0:�Ǘ��҂̂݌��J 1:�Ǘ��҈ȊO�֌��J'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `division_values_PKC` primary key (`division_id`,`id`)
) comment '�敪�l�}�X�^' ;

-- �敪�}�X�^
--* BackupToTempTable
drop table if exists `divisions` cascade;

--* RestoreFromTempTable
create table `divisions` (
  `id` VARCHAR(64) not null comment '�敪ID'
  , `name` VARCHAR(255) comment '�敪����'
  , `public_flag` TINYINT default 0 not null comment '���J�t���O:0:�Ǘ��҂̂݌��J 1:�Ǘ��҈ȊO�֌��J'
  , `display_order` INT default 0 not null comment '�\����'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `divisions_PKC` primary key (`id`)
) comment '�敪�}�X�^' ;

-- ��Ѓ}�X�^
--* BackupToTempTable
drop table if exists `campanys` cascade;

--* RestoreFromTempTable
create table `campanys` (
  `id` VARCHAR(64) not null comment '���ID'
  , `name` VARCHAR(255) not null comment '����'
  , `logo_path` VARCHAR(1024) comment '��Ѓ��S�摜:���S�摜�̊i�[��̃p�X'
  , `tel_no` VARCHAR(14) comment '�d�b�ԍ�'
  , `zip_no` VARCHAR(7) comment '�X�֔ԍ�'
  , `address` VARCHAR(255) comment '�Z��'
  , `building` VARCHAR(255) comment '����'
  , `business_hours` VARCHAR(1024) comment '�c�Ǝ���'
  , `create_tm` INT not null comment '�쐬�^�C���X�^���v'
  , `create_id` VARCHAR(64) default 0 not null comment '�쐬��ID'
  , `modify_tm` INT not null comment '�X�V�^�C���X�^���v'
  , `modify_id` VARCHAR(64) default 0 not null comment '�X�V��ID'
  , `program` VARCHAR(255) default '*' not null comment '�v���O������:�쐬�E�X�V�����v���O�����̎��ʎq'
  , `delete_flag` TINYINT default 0 not null comment '�폜�t���O'
  , constraint `campanys_PKC` primary key (`id`)
) comment '��Ѓ}�X�^' ;

