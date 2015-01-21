/*
Navicat MySQL Data Transfer

Source Server         : 121.42.11.124
Source Server Version : 50614
Source Host           : 121.42.11.124:3306
Source Database       : thinkcmf

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2015-01-21 09:37:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sp_access
-- ----------------------------
DROP TABLE IF EXISTS `sp_access`;
CREATE TABLE `sp_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `g` varchar(20) NOT NULL COMMENT '项目',
  `m` varchar(20) NOT NULL COMMENT '模块',
  `a` varchar(20) NOT NULL COMMENT '方法',
  KEY `groupId` (`role_id`),
  KEY `gma` (`g`,`m`,`a`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_access
-- ----------------------------
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'Content', 'default');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'Setting', 'default');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'Setting', 'password');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'Setting', 'password_post');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'Setting', 'userdefault');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'User', 'userinfo');
INSERT INTO `sp_access` VALUES ('2', 'Admin', 'User', 'userinfo_post');
INSERT INTO `sp_access` VALUES ('2', 'Api', 'Guestbookadmin', 'delete');
INSERT INTO `sp_access` VALUES ('2', 'Api', 'Guestbookadmin', 'index');
INSERT INTO `sp_access` VALUES ('2', 'Comment', 'Commentadmin', 'check');
INSERT INTO `sp_access` VALUES ('2', 'Comment', 'Commentadmin', 'delete');
INSERT INTO `sp_access` VALUES ('2', 'Comment', 'Commentadmin', 'index');

-- ----------------------------
-- Table structure for sp_ad
-- ----------------------------
DROP TABLE IF EXISTS `sp_ad`;
CREATE TABLE `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_ad
-- ----------------------------
INSERT INTO `sp_ad` VALUES ('1', '一', '', '1');

-- ----------------------------
-- Table structure for sp_asset
-- ----------------------------
DROP TABLE IF EXISTS `sp_asset`;
CREATE TABLE `sp_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `unique` varchar(14) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_asset
-- ----------------------------

-- ----------------------------
-- Table structure for sp_comments
-- ----------------------------
DROP TABLE IF EXISTS `sp_comments`;
CREATE TABLE `sp_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_comments
-- ----------------------------
INSERT INTO `sp_comments` VALUES ('1', 'posts', '1', 'index.php?g=&amp;m=article&amp;a=index&amp;id=1', '1', '0', 'admin', 'wangsong12332@sina.com', '2015-01-08 10:45:30', 'asdasd', '1', '0', '0-1', '1');
INSERT INTO `sp_comments` VALUES ('2', 'posts', '2', 'index.php?g=&amp;m=article&amp;a=index&amp;id=2', '3', '0', 'test', 'wangsong123327212126@126.com', '2015-01-14 14:18:39', 'asd', '1', '0', '0-2', '1');

-- ----------------------------
-- Table structure for sp_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_common_action_log`;
CREATE TABLE `sp_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_common_action_log
-- ----------------------------
INSERT INTO `sp_common_action_log` VALUES ('1', '1', 'posts1', 'Portal-Article-do_like', '3', '1420685114', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('2', '1', 'posts1', 'Portal-Article-index', '1', '1420685127', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('3', '0', 'posts1', 'Portal-Article-index', '1', '1420685138', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('4', '0', 'posts2', 'Portal-Article-index', '6', '1421218604', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('5', '3', 'posts2', 'Portal-Article-index', '78', '1421222654', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('6', '3', 'posts2', 'Portal-Article-do_like', '4', '1421216305', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('7', '3', 'posts', 'Portal-Article-index', '10', '1421222594', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('8', '3', 'posts37', 'Portal-Article-index', '1', '1421220889', '0.0.0.0');
INSERT INTO `sp_common_action_log` VALUES ('9', '0', 'posts2', 'Portal-Article-index', '1', '1421466956', '121.42.11.124');
INSERT INTO `sp_common_action_log` VALUES ('10', '0', 'posts2', 'Portal-Article-index', '2', '1421467015', '101.47.33.139');
INSERT INTO `sp_common_action_log` VALUES ('11', '0', 'posts2', 'Portal-Article-index', '1', '1421467073', '114.96.147.231');
INSERT INTO `sp_common_action_log` VALUES ('12', '0', 'posts38', 'Portal-Article-index', '5', '1421544275', '101.47.33.36');
INSERT INTO `sp_common_action_log` VALUES ('13', '0', 'posts38', 'Portal-Article-index', '1', '1421587954', '101.47.33.192');
INSERT INTO `sp_common_action_log` VALUES ('14', '0', 'posts2', 'Portal-Article-index', '3', '1421632309', '60.166.145.115');
INSERT INTO `sp_common_action_log` VALUES ('15', '0', 'posts38', 'Portal-Article-index', '2', '1421632377', '60.166.145.115');
INSERT INTO `sp_common_action_log` VALUES ('16', '0', 'posts39', 'Portal-Article-index', '2', '1421654473', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('17', '0', 'posts40', 'Portal-Article-index', '2', '1421655500', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('18', '0', 'posts41', 'Portal-Article-index', '6', '1421722602', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('19', '0', 'posts42', 'Portal-Article-index', '1', '1421649663', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('20', '0', 'posts41', 'Portal-Article-index', '3', '1421654581', '60.166.136.47');
INSERT INTO `sp_common_action_log` VALUES ('21', '0', 'posts46', 'Portal-Article-index', '1', '1421653327', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('22', '0', 'posts45', 'Portal-Article-index', '2', '1421654202', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('23', '0', 'posts46', 'Portal-Article-index', '2', '1421653772', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('24', '0', 'posts2', 'Portal-Article-index', '4', '1421655107', '60.166.136.47');
INSERT INTO `sp_common_action_log` VALUES ('25', '0', 'posts46', 'Portal-Article-index', '2', '1421654899', '60.166.136.47');
INSERT INTO `sp_common_action_log` VALUES ('26', '0', 'posts45', 'Portal-Article-index', '2', '1421654378', '60.166.136.47');
INSERT INTO `sp_common_action_log` VALUES ('27', '0', 'posts45', 'Portal-Article-index', '2', '1421654813', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('28', '0', 'posts41', 'Portal-Article-index', '1', '1421654772', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('29', '0', 'posts55', 'Portal-Article-index', '2', '1421804237', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('30', '0', 'posts54', 'Portal-Article-index', '1', '1421655459', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('31', '0', 'posts53', 'Portal-Article-index', '1', '1421655478', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('32', '0', 'posts52', 'Portal-Article-index', '2', '1421804156', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('33', '0', 'posts51', 'Portal-Article-index', '9', '1421804152', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('34', '0', 'posts47', 'Portal-Article-index', '2', '1421656401', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('35', '0', 'posts49', 'Portal-Article-index', '1', '1421655611', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('36', '0', 'posts50', 'Portal-Article-index', '2', '1421804245', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('37', '0', 'posts2', 'Portal-Article-index', '65', '1421766624', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('38', '0', 'posts51', 'Portal-Article-index', '18', '1421766564', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('39', '0', 'posts52', 'Portal-Article-index', '12', '1421761499', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('40', '0', 'posts40', 'Portal-Article-index', '13', '1421763506', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('41', '0', 'posts53', 'Portal-Article-index', '5', '1421763547', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('42', '0', 'posts54', 'Portal-Article-index', '5', '1421763552', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('43', '0', 'posts47', 'Portal-Article-index', '16', '1421763777', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('44', '0', 'posts49', 'Portal-Article-index', '12', '1421764390', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('45', '0', 'posts56', 'Portal-Article-index', '5', '1421745896', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('46', '0', 'posts46', 'Portal-Article-index', '2', '1421745719', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('47', '0', 'posts39', 'Portal-Article-index', '1', '1421727046', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('48', '0', 'posts2', 'Portal-Article-index', '32', '1421803898', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('49', '0', 'posts2', 'Portal-Article-index', '3', '1421753461', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('50', '0', 'posts47', 'Portal-Article-index', '1', '1421735153', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('51', '0', 'posts55', 'Portal-Article-index', '7', '1421758159', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('52', '0', 'posts38', 'Portal-Article-index', '2', '1421756361', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('53', '0', 'posts57', 'Portal-Article-index', '3', '1421743047', '60.166.37.183');
INSERT INTO `sp_common_action_log` VALUES ('54', '0', 'posts50', 'Portal-Article-index', '6', '1421764552', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('55', '0', 'posts57', 'Portal-Article-index', '2', '1421755449', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('56', '0', 'posts41', 'Portal-Article-index', '3', '1421765366', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('57', '4', 'posts53', 'Portal-Article-index', '3', '1421763540', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('58', '4', 'posts56', 'Portal-Article-index', '1', '1421757893', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('59', '4', 'posts2', 'Portal-Article-index', '8', '1421768273', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('60', '4', 'posts52', 'Portal-Article-index', '5', '1421763868', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('61', '4', 'posts39', 'Portal-Article-index', '1', '1421758675', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('62', '4', 'posts51', 'Portal-Article-index', '11', '1421767580', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('63', '0', 'posts58', 'Portal-Article-index', '3', '1421763299', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('64', '0', 'posts59', 'Portal-Article-index', '7', '1421763657', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('65', '4', 'posts40', 'Portal-Article-index', '4', '1421763885', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('66', '4', 'posts54', 'Portal-Article-index', '1', '1421761956', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('67', '4', 'posts47', 'Portal-Article-index', '3', '1421763923', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('68', '4', 'posts50', 'Portal-Article-index', '3', '1421763993', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('69', '4', 'posts59', 'Portal-Article-index', '1', '1421762270', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('70', '4', 'posts49', 'Portal-Article-index', '2', '1421763962', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('71', '4', 'posts41', 'Portal-Article-index', '2', '1421765290', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('72', '0', 'posts61', 'Portal-Article-index', '2', '1421766712', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('73', '0', 'posts60', 'Portal-Article-index', '3', '1421766698', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('74', '0', 'posts64', 'Portal-Article-index', '3', '1421766693', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('75', '0', 'posts51', 'Portal-Article-index', '1', '1421766304', '115.28.126.18');
INSERT INTO `sp_common_action_log` VALUES ('76', '4', 'posts64', 'Portal-Article-index', '3', '1421766622', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('77', '4', 'posts62', 'Portal-Article-index', '1', '1421766606', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('78', '0', 'posts62', 'Portal-Article-index', '2', '1421766689', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('79', '0', 'posts63', 'Portal-Article-index', '1', '1421766675', '60.166.159.66');
INSERT INTO `sp_common_action_log` VALUES ('80', '0', 'posts2', 'Portal-Article-index', '2', '1421802938', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('81', '0', 'posts64', 'Portal-Article-index', '1', '1421802795', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('82', '0', 'posts51', 'Portal-Article-index', '1', '1421802812', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('83', '0', 'posts54', 'Portal-Article-index', '1', '1421802822', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('84', '0', 'posts47', 'Portal-Article-index', '1', '1421802827', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('85', '0', 'posts62', 'Portal-Article-index', '1', '1421802953', '114.96.150.70');
INSERT INTO `sp_common_action_log` VALUES ('86', '0', 'posts40', 'Portal-Article-index', '1', '1421802965', '114.96.150.70');

-- ----------------------------
-- Table structure for sp_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `sp_guestbook`;
CREATE TABLE `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_guestbook
-- ----------------------------
INSERT INTO `sp_guestbook` VALUES ('1', 'zero', 'wangson@12.com', '123123', 'asdfasf', '2015-01-08 11:09:51', '1');

-- ----------------------------
-- Table structure for sp_links
-- ----------------------------
DROP TABLE IF EXISTS `sp_links`;
CREATE TABLE `sp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_links
-- ----------------------------
INSERT INTO `sp_links` VALUES ('2', 'http://weibo.com/p/1006065454998491/home?from=page_100606&amp;mod=TAB#place', '微博', 'http://weiyingkj.com/static/img/link/1.jpg', '_blank', '阿萨德发', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('3', 'http://tieba.baidu.com/f?ie=utf-8&amp;kw=%E5%BE%AE%E8%B5%A2%E7%94%9F%E7%89%A9%E7%A7%91%E6%8A%80%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8&amp;fr=ibaidu&amp;qq-pf-to=pcqq.c2c', '微赢生物科技有限公司', 'http://weiyingkj.com/static/img/link/3.jpg', '_blank', '', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('4', 'http://blog.sina.com.cn/u/5454998491', '新浪博客', 'http://weiyingkj.com/static/img/link/4.jpg', '_blank', '', '1', '0', '', '0');
INSERT INTO `sp_links` VALUES ('5', 'http://www.douban.com/people/120095444/?qq-pf-to=pcqq.c2c', ' 豆瓣', 'http://weiyingkj.com/static/img/link/2.jpg', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for sp_menu
-- ----------------------------
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_menu
-- ----------------------------
INSERT INTO `sp_menu` VALUES ('239', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `sp_menu` VALUES ('51', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '10');
INSERT INTO `sp_menu` VALUES ('245', '51', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `sp_menu` VALUES ('299', '260', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `sp_menu` VALUES ('252', '239', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('253', '252', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('254', '252', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `sp_menu` VALUES ('260', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '30');
INSERT INTO `sp_menu` VALUES ('262', '260', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `sp_menu` VALUES ('264', '262', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('265', '260', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `sp_menu` VALUES ('268', '262', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `sp_menu` VALUES ('270', '260', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `sp_menu` VALUES ('277', '51', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `sp_menu` VALUES ('301', '300', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `sp_menu` VALUES ('302', '300', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `sp_menu` VALUES ('300', '51', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `sp_menu` VALUES ('284', '239', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `sp_menu` VALUES ('285', '51', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `sp_menu` VALUES ('286', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '0');
INSERT INTO `sp_menu` VALUES ('287', '289', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `sp_menu` VALUES ('288', '289', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `sp_menu` VALUES ('289', '286', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `sp_menu` VALUES ('290', '286', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `sp_menu` VALUES ('291', '290', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('292', '290', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('293', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '0');
INSERT INTO `sp_menu` VALUES ('294', '293', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('295', '294', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('296', '294', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `sp_menu` VALUES ('297', '293', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('298', '239', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `sp_menu` VALUES ('319', '260', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('480', '292', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('479', '292', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('478', '292', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('477', '245', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('476', '245', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('475', '245', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('474', '268', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('473', '268', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('472', '268', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('471', '264', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('470', '264', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('469', '264', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('467', '291', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('465', '291', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('464', '291', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('463', '291', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('462', '291', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('458', '302', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('457', '302', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('456', '285', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('455', '285', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('454', '285', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('452', '285', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('451', '285', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('450', '301', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('449', '301', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('448', '277', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('446', '277', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('445', '277', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('444', '296', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('443', '296', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('442', '296', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('441', '295', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('440', '295', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('439', '295', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('436', '297', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('434', '297', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('433', '297', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('432', '297', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('430', '270', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('429', '270', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('428', '270', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('424', '319', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('423', '319', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('422', '319', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('421', '319', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `sp_menu` VALUES ('420', '265', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('419', '265', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('418', '265', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `sp_menu` VALUES ('496', '319', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `sp_menu` VALUES ('497', '418', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('498', '419', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('499', '428', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('500', '429', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('501', '536', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('502', '434', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('503', '439', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('504', '440', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('505', '442', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('506', '443', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('507', '445', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('508', '446', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('509', '451', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('510', '452', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('511', '462', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('512', '464', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('513', '465', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('514', '284', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `sp_menu` VALUES ('515', '254', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `sp_menu` VALUES ('516', '469', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('517', '470', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('518', '472', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('519', '473', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('520', '475', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('521', '476', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('522', '478', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('523', '479', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('524', '253', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('525', '299', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('526', '533', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('527', '526', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('528', '533', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `sp_menu` VALUES ('529', '528', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `sp_menu` VALUES ('533', '239', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `sp_menu` VALUES ('536', '297', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `sp_menu` VALUES ('546', '496', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `sp_menu` VALUES ('547', '270', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('548', '297', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('549', '295', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('550', '277', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('551', '285', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('552', '264', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('553', '245', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('554', '51', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `sp_menu` VALUES ('555', '554', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `sp_menu` VALUES ('557', '51', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `sp_menu` VALUES ('559', '557', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `sp_menu` VALUES ('560', '557', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `sp_menu` VALUES ('561', '287', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('562', '287', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `sp_menu` VALUES ('563', '288', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('564', '284', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `sp_menu` VALUES ('565', '284', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `sp_menu` VALUES ('566', '565', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('567', '284', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `sp_menu` VALUES ('568', '567', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `sp_menu` VALUES ('569', '284', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `sp_menu` VALUES ('572', '284', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `sp_menu` VALUES ('573', '284', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `sp_menu` VALUES ('574', '284', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `sp_menu` VALUES ('588', '260', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');

-- ----------------------------
-- Table structure for sp_nav
-- ----------------------------
DROP TABLE IF EXISTS `sp_nav`;
CREATE TABLE `sp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_nav
-- ----------------------------
INSERT INTO `sp_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `sp_nav` VALUES ('2', '1', '0', '走进微赢', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `sp_nav` VALUES ('3', '1', '0', '品牌动态', '_blank', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for sp_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `sp_nav_cat`;
CREATE TABLE `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_nav_cat
-- ----------------------------
INSERT INTO `sp_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for sp_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_oauth_user`;
CREATE TABLE `sp_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for sp_options
-- ----------------------------
DROP TABLE IF EXISTS `sp_options`;
CREATE TABLE `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_options
-- ----------------------------
INSERT INTO `sp_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `sp_options` VALUES ('2', 'site_options', '{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_host\":\"http:\\/\\/dns.hfnacai.com\\/\",\"site_root\":\"\\/\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"\",\"site_admin_tel\":\"0551-68998601\",\"site_authorize\":\"123456\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u5fae\\u8d62\\u751f\\u7269\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_keywords\":\"\\u5fae\\u8d62\\u751f\\u7269\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_description\":\"\\u5fae\\u8d62\\u751f\\u7269\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"urlmode\":\"0\",\"html_suffix\":\"\"}', '1');
INSERT INTO `sp_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');

-- ----------------------------
-- Table structure for sp_plugins
-- ----------------------------
DROP TABLE IF EXISTS `sp_plugins`;
CREATE TABLE `sp_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of sp_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for sp_posts
-- ----------------------------
DROP TABLE IF EXISTS `sp_posts`;
CREATE TABLE `sp_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_posts
-- ----------------------------
INSERT INTO `sp_posts` VALUES ('2', '1', '微赢简介', '2015-01-15 15:36:20', '<p style=\"text-align: center;\"><img src=\"http://weiyingkj.com/data/upload/ueditor/20150120/54be403ac6e8e.jpg\" title=\"未标题-2-01.jpg\" alt=\"未标题-2-01.jpg\" width=\"613\" height=\"423\" style=\"width: 613px; height: 423px;\"/></p><p><br/></p><p><span style=\"font-family: 宋体; font-size: 19px;\">&nbsp; &nbsp; 微赢生物科技有限公司成立于2014年，注册资本金1000万，是华东地区专业的移动电商生物科技公司。</span><br/></p><p><span style=\"font-family: 宋体; font-size: 19px;\"><br/></span></p><p style=\"text-indent: 37px\"><span style=\"font-size:19px;font-family:宋体\">公司秉承“微信，让世界认识你。”的企业宗旨，紧跟时代步伐，自主创新，依托强大的互联网平台，结合顶尖产品研发团队，</span><span style=\"font-size:19px;font-family:宋体\">通过整合移动领域核心技术、</span><span style=\"font-size:19px;font-family:宋体\">微营销、互联网、</span><span style=\"font-size: 19px;font-family:宋体\">顶级策划人才、运营人才、高级工程师、优质资源</span><span style=\"font-size:19px;font-family:宋体\">打破传统商业模式，实现</span><span style=\"font-size:19px;font-family:宋体;background:white\">线上线下同步推广销售，让每一位消费者以最便捷的方式最合理的价格，用上好产品。</span></p><p style=\"text-indent: 37px\"><span style=\"font-size:19px;font-family:宋体;color:#111111;background:white\"><br/></span></p><p style=\"text-indent: 37px\"><span style=\"font-size:19px;font-family:宋体\">微赢专注于微营销领域，擅长传统商业结合社会化媒体进行互动营销的组织与策划，凭借自身先进生物科研技术的移动互联网产品研发能力，联合数千家垂直行业平台及上百家地方联盟，为全国各地消费者及合作伙伴提供优质的产品与微营销服务。为企业及个人提供微商课程课程、微营销咨询、移动营销、移动电子商务、O2O服务为一体的移动营销服务平台及解决方案。打造国内最专业的传统商业结合社会化媒体进行互动营销团队。</span></p><p style=\"text-indent: 37px\"><span style=\"font-size:19px;font-family:宋体\"><br/></span></p><p><strong><span style=\"font-size:19px\">微赢使命 </span></strong></p><p><strong><span style=\"font-size:19px\"><br/></span></strong></p><p><span style=\"font-size:19px;font-family:宋体\">帮助微赢所有经销商客户实现财务自由，帮助80后90后实现创业梦想！</span></p><p><span style=\"font-size:19px;font-family:宋体\"><br/></span></p><p><strong><span style=\"font-size:19px\">微赢价值观 </span></strong></p><p><strong><span style=\"font-size:19px\"><br/></span></strong></p><p><span style=\"font-size:19px\">诚信——诚实正直，言行坦荡 </span></p><p><span style=\"font-size:19px\">激情——乐观向上，永不放弃 </span></p><p><span style=\"font-size:19px\">信任——相互合作，团结一心</span></p><p><span style=\"font-size:19px\">创新——敢为人先，超越自我</span></p><p><span style=\"font-size:19px\"><br/></span></p><p><strong><span style=\"font-size:19px;font-family:宋体\">微赢的行动观</span></strong></p><p><strong><span style=\"font-size:19px;font-family:宋体\"><br/></span></strong></p><p><span style=\"font-size:19px;font-family:宋体\">简单、复制、马上执行！</span></p><p><span style=\"font-size:19px;font-family:宋体\"><br/></span></p><p><strong><span style=\"font-size:19px;font-family:宋体\">微赢的经营观</span></strong></p><p><strong><span style=\"font-size:19px;font-family:宋体\"><br/></span></strong></p><p><span style=\"font-size:19px;font-family:宋体\">为80后、90后微商创业者提供好的产品、好的培训。</span></p><p><span style=\"font-size:19px;font-family:宋体\"><br/></span></p><p><strong><span style=\"font-size:19px;font-family:宋体\">微赢的目标</span></strong></p><p><strong><span style=\"font-size:19px;font-family:宋体\"><br/></span></strong></p><p><span style=\"font-size:19px;font-family:宋体\">1</span><span style=\"font-size:19px;font-family:宋体\">、2015年实现年营业额1.2个亿，把微赢打造成中国成长最快的微商企业。</span></p><p><span style=\"font-size:19px;font-family:宋体\">2</span><span style=\"font-size:19px;font-family:宋体\">、把微赢微商学院打造成中国微商的黄埔军校，成为行业培训标杆。</span></p><p><span style=\"font-size:19px;font-family:宋体\">3</span><span style=\"font-size:19px;font-family:宋体\">、微赢团队到2016年团队规模2年内拓展到100000人。</span></p><p><br/></p>', '微赢简介', '微赢生物科技有限公司成立于2014年，注册资本金1000万，是华东地区专业的移动电商生物科技公司。', '1', '1', '2015-01-13 15:34:49', null, '0', null, '', '1', '{\"thumb\":\"54b4caf067993.jpg\",\"photo\":[{\"url\":\"54b4cadad17fa.jpg\",\"alt\":\"slider0\"},{\"url\":\"54b4cae700320.jpg\",\"alt\":\"slider2\"}]}', '12', '1', '0', '0');
INSERT INTO `sp_posts` VALUES ('39', '1', '微赢商学院', '2015-01-19 13:46:11', '<h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><h4 style=\"box-sizing: border-box; font-family: &#39;Microsoft YaHei&#39;, sans-serif; font-weight: normal; line-height: 1.1; margin-top: 10px; margin-bottom: 10px; font-size: 18px; color: rgb(102, 102, 102); text-shadow: rgba(0, 0, 0, 0.00784314) 0px 0px 1px; white-space: normal; background-color: rgb(250, 250, 250);\">微赢商学院</h4><p><br/></p>', '微赢商学院', '微赢商学院微赢商学院微赢商学院微赢商学院微赢商学院', '1', '1', '2015-01-19 13:45:57', null, '0', null, '', '0', '{\"thumb\":\"54bc9a48c776b.png\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('38', '1', '联系我们', '2015-01-18 09:22:20', '<p>&nbsp;</p><h4 style=\"margin: 0px 21px; padding: 0px; font-size: 16px; font-weight: normal; height: 93px; border-bottom-width: 1px; border-bottom-color: rgb(165, 161, 150); border-bottom-style: solid; overflow: hidden; background: url(http://img.sibu.cn/newsibu/images/contactus/phone_ico.png) 0% 23px no-repeat;\"><span style=\"margin: 44px 0px 0px 100px; display: block; font-family: 微软雅黑;\">谢谢您对思埠集团的关注。<br/>如果您有任何问题或意见请通过以下方式和我们联络。</span></h4><p class=\"p_kefu\" style=\"margin-top: 30px; margin-bottom: 0px; margin-left: 22px; padding: 0px; text-align: justify; font-size: 14px;\">客服电话服务时间为 早上：<span class=\"span_red\" style=\"color: rgb(235, 0, 0);\">9：00-12：00</span>&nbsp;下午：<span class=\"span_red\" style=\"color: rgb(235, 0, 0);\">13：00-18：00</span></p><h5 class=\"span_red\" style=\"margin: 18px 0px 0px; padding: 0px; font-size: 16px; font-weight: normal; color: rgb(235, 0, 0); width: 171px; height: 38px; line-height: 38px; text-indent: 22px; border-top-left-radius: 0px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 0px; background: rgb(242, 241, 238);\">思埠集团客服部</h5><ul class=\"ul_dh list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>咨询热线：020-22969999</p></li></ul><p>&nbsp;</p><p><br/></p>', '联系我们', '联系我们', '1', '1', '2015-01-18 09:22:02', null, '0', null, '', '0', '{\"thumb\":\"\"}', '4', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('40', '1', '品牌介绍', '2015-01-19 14:02:48', '<p>品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍品牌介绍</p>', '品牌介绍', '品牌介绍品牌介绍品牌介绍', '1', '1', '2015-01-19 14:02:22', null, '0', null, '', '0', '{\"thumb\":\"54bc9e0629bcc.png\"}', '4', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('41', '1', '微赢生物 CEO 康咏铧 微信营销 趋势发展', '2015-01-19 14:27:17', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">移动浪潮正席卷而来。用户行为变了，从电脑到手机;市场变了，移动应用浮现大量商机;商业模式变了，传统的已没落，新型的正在兴起，从不断迭代的现象可以看出，我们已经进入一个移动互联网时代!<br/><br/>　　对于大家来说，现在处于红利阶段，谁先找对方法，谁就先站稳脚跟，未来就是谁的天下。在过去的几年里微信可以说是所向披靡，横扫千军，7亿的用户群，让它稳坐移动社交的头把交椅。因为庞大的用户群，所以微信蕴含着无限的商机。<br/><br/>　　如今，众多厂商介入到微信，是制造噱头也好，是商业模式的探索也好，其实质都是颠覆与变革，如果说2014年是020元年的话，那么2015年就是微商的元年，那么，我们就来分析一下微商的模式和未来的趋势。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150119/54bca39c0aece.jpg\" alt=\" 微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" isflag=\"1\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px none;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　当下微时代的“自商业”必将成为O2O云生活的主流业态，并成为精准聚合，人人参与其中的商业互动服务经济模式。在移动电商里，微商是最值得关注的一部分群体，微信电商的成功与否很大一部分取决于微商。从微信电商到微电商再到微商，它带来的是一个去中心化的社会化移动生态的转变。<br/><br/>　　社群经济模式是微商的基本模式，是打破传统渠道代理模式的一种全新的商业模式，其运营模式不再是利益捆绑，而是具有共同价值观的人群的高度聚合，在微商的平台上可以通过远程协作，完成了传统模式无法实现的效率最大化。但同样微商也面临着挑战和困境，目前，微商的大多都是个体化发展，没有系统化的运作体系，管理上会存在很多漏洞。任何一个行业要健康发展，都离不开系统专业化的运作以及强大的教育培训体系。<br/><br/>　　微赢生物科技有限公司旗下的微赢商学院致力为80后90后提供系统化的微信营销培训并扶持80后90后创业的一个培训机构，是联合安徽省大学生在就业中心、安徽省下岗再就业中心、安徽省教育厅共同打造的商学院。目的通过将自己打造一个专业的微营销培训导师来帮助下面的经销商成长。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150119/54bca39c61798.jpg\" alt=\"微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" isflag=\"1\" data-bd-imgshare-binded=\"1\" style=\"margin: 0px; padding: 0px; border: 0px none;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\">　　未来自媒体模式会越来越热，做的人越来越多，但是却不用担心相互竞争。因为每个人都有自己的特点，不同的性格和兴趣，将自己的资源、个性的地方融入到你的微信营销形象里，那你就是独一无二的。这种模式产生的效果远比大家都刷一样的图文要好很多，也更容易吸收到忠粉。作为创业者，如果我们平时积累了不错的经验、人脉和资源，那么你离成功也将不远了。经验、人脉、资源对于创业者很重要，而每个人长时间积累下来的肯定都会不一样，这个就是你创业，做微信营销，做自媒体的特性。别人模仿不来，只有你做得到。这种模式只是自媒体的雏形，坚持下去，就能够打造你自己的自媒体，总之要做好微信营销商，必须跟随专业的团队，以及接受系统的教育指导，认真对待每一位潜在客户，悉心指导每一位经销商，给出合理的建议帮助他们成长。<br/><br/>　　虽然前期需要花大量的时间和精力筛选潜在客户，定制销售策略，但等到他们能够独当一面的时候，你就能够腾出很多的时间去开发新的市场或者开始边享受生活边创业。创业都是一个漫长的过程，前期都是很幸苦的，只有打好了粉丝这个基础才会有以后好的发展。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 20px; font-stretch: normal; font-size: medium; font-family: 宋体; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><span class=\"ss02\" style=\"color: rgb(153, 153, 153); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 12px; line-height: 22px; background-color: rgb(255, 255, 255);\">来源：</span><span itemprop=\"publisher\" itemscope=\"\" itemtype=\"http://schema.org/Organization\" style=\"color: rgb(153, 153, 153); font-family: simsun, arial, helvetica, clean, sans-serif; font-size: 12px; line-height: 22px; background-color: rgb(255, 255, 255);\"><span itemprop=\"name\" class=\"ss03\"><a href=\"http://yueyu.cntv.cn/2015/01/06/ARTI1420534590580931.shtml\">中国网</a></span></span></p>', '微赢生物科技CEO康咏铧谈2015微信营销趋势发展', '微赢生物科技CEO康咏铧谈2015微信营销趋势发展', '1', '1', '2015-01-19 14:25:14', null, '0', null, '', '0', '{\"thumb\":\"54bca3bfe3bef.jpg\"}', '5', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('42', '1', '微赢生物科技', '2015-01-19 14:40:59', '<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">几个月前，微赢生物是谁都不知道的Nothing，但是经过短暂的时间，康总的运营团队发生了翻天覆地的变化，目前微赢生物成为中国发展最快的微商企业之一。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">康咏铧是谁?他为什么有这么大的能量能够改变一切?</p><p class=\"detailPic\" style=\"margin: 0px auto 10px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: center; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><img width=\"331\" height=\"499\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150119/54bca6cbb576e.jpg\" id=\"11260568\" alt=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">他是微赢生物科技有限公司CEO、微赢微商学院院长、中国著名微信营销实战导师、中国精细化营销创始人、中国NegotationDreamDirection创始人。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">从表面上看，丝毫不能相信气度非凡，成熟洒脱的康总竟然是90后。当记者问及创业历程，康总无限唏嘘。“那时候微商还被称为代购，因为朋友圈刷屏，被不少好友删除，常常等在手机面前，有时候甚至能熬到两三点。”</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">一路走来，用“不经一番寒彻骨，哪得梅花扑鼻香。”这句话来形容康总再合适不过了。从最底层做起，不断自我提升，开拓进取，康总用他过人的智慧，创造了同龄人难以企及的成功。康总也深知孤木难成林，面对记者的提问，他坚定的说，他的目标是把微商学院打造成中国微商的黄埔军校，使其成为行业培训标杆。他要帮助80与90后们实现创业的梦想，帮助相信微赢的经销商客户们实现财务自由。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">康总对记者说：“我成功的秘诀只有两点，那就是诚信和激情。用诚信对人，用激情感动人。”康总用这两点秘诀践行着他认为创业者最重要的品质——信任和创新。他说“很多人都渴望成功，然而很多人只是渴望，没有行动。”微赢就是要教会那些80和90后微商创业者们：简单，复制，马上执行的先进理念。帮助他们真正意义上的实现梦想。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">记者也十分荣幸能够当面采访康总，他的办公地点在安徽省合肥市财富广场一家5A级写字楼，整个公司团队协调工作，策划部，设计部，财务部，营销部，网络推广部，教育部，人力资源部，招商部，没有一个部门不在努力奋斗，为实现2015年营业额达1.2亿的目标。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">我们祝福康总，也祝福他的公司，能够在2015年实现质的飞跃。&nbsp;<span class=\"ifengLogo\"><a href=\"http://www.ifeng.com/\" target=\"_blank\" style=\"text-decoration: none; color: rgb(0, 66, 118); font-weight: bold;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150119/54bca6cbd65e1.gif\" width=\"15\" height=\"17\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; padding-top: 3px;\"/></a></span></p><p><br/></p>', '访中国微信营销风云人物——微赢生物科技CEO康咏铧', '访中国微信营销风云人物——微赢生物科技CEO康咏铧', '1', '1', '2015-01-19 14:39:58', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('43', '1', '', '2015-01-19 15:32:48', '<p style=\"text-align:center;line-height:150%\"><span style=\"font-family: 黑体; font-size: 19px; line-height: 150%; text-indent: 24px;\"></span></p><p style=\"line-height: 150%;\"><span style=\"font-family: 黑体; font-size: 19px; line-height: 150%; text-indent: 24px;\">&nbsp;&nbsp;&nbsp;&nbsp;很多人说，不知道什么是自媒体，对自媒体创业，那就更是闻所未闻了。这也倒是实话。自媒体这个名词确实是最近几年才在社会上流行起来的。可是，自媒体也好，自媒体创业也好，都不是什么全新的概念。这些概念的原型，古往今来早已有之。 &nbsp;</span><br/></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体;background:yellow;background:yellow\">人物故事</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">阿丁老师，一位在美容界叱咤风云的人物。也许很多人都会觉得好奇，为什么一位年薪过80万的美容界标杆人物会加入微商团队。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">阿丁老师表示，腾讯公布QQ同时在线账户突破2亿的里程碑，让我看到了QQ从PC向移动互联网成功转型的标志。而且，百度董事长兼CEO李彦宏断定：“移动的大潮势不可当，它在改变一切，改变我们所有用户的行为，改变技术，改变我们的商业模式，改变我们公司的运营方式。”</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">　微信公众平台兴起之后，当时媒体新锐程苓峰的微信公众平台开始卖广告一天收入一两万，从那时候开始业内就开始谈论起微信公众平台来了，越来越多的人也开始加入微信公众平台大军。而最近，大批明星和名人也开始玩微信公众号收费。而像招商、海底捞等这些微营销中非常成功的案例，已在业内掀起了很大的风波，也给广大屌丝和业内朋友一个信号，微信营销或许会成为移动网营销的主要手段，微商必将成为一个时代的趋势。 </span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">自己错过了十年前的淘宝，现在不能再次错过今天的微商。就这样，他毅然决然的加入了微赢做起了微商。目前他的月收入已经成功突破10万，而且，他的业绩还在持续攀升。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体;color:blue;background:yellow;background:yellow\">微商秘笈</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">产品效果最具说服力</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">“我坚持使用自己的产品，如果连自己都信不过这个产品，那还能说服谁来购买自己卖的产品呢?”阿丁老师表示，向消费者亲自展示产品效果是运营微商最好的营销方式之一。一段不经意的日常生活独白，配上一幅使用前后的对比图，尽管有时候效果不太明显，但亲自使用产品的诚意会给其他消费者带去充分的说服力和信任感。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">做好终端服务是立足微营销的根本</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">任何微信营销都需要三个基础条件，一是足够多的好友数量，二是与微信好友之间拥有紧密的关系，三是个人信用有保障。其次，终端营销其实就是做好五个环节的问题。终端拦截，顾客牵引，促销包装，竞争层次，顾客流动。最为重要的一点是真正站在消费者的角度思考问题，知其所需，解其所困，用诚对人，用心对人，用信对人。</span></p><p><br/></p>', '不嫌微小，抓住商机，定能成就微商', '不嫌微小，抓住商机，定能成就微商。很多人说，不知道什么是自媒体，对自媒体创业，那就更是闻所未闻了。这也倒是实话。自媒体这个名词确实是最近几年才在社会上流行起来的。可是，自媒体也好，自媒体创业也好，都不是什么全新的概念。这些概念的原型，古往今来早已有之。 ', '1', '1', '2015-01-19 15:31:44', null, '0', null, '', '0', '{\"thumb\":\"54bcb31c666ba.jpg\"}', '0', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('44', '1', '我的梦想由你实现', '2015-01-19 15:33:45', '<p style=\"text-align:center;text-indent:40px\"><strong><span style=\"font-size:20px;font-family:宋体;background:white\">我的梦想由你实现——微赢微商学院</span></strong></p><p style=\"text-align:center;text-indent:40px\"><strong><span style=\"font-size:20px;font-family:宋体;background:white\">90</span></strong><strong><span style=\"font-size:20px;font-family:宋体;background:white\">后女大学生的创业传奇路</span></strong></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">创业是很多人孜孜以求的理想。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">然而，有的人永远把创业当成梦想，终觉时机不成；有的人却一直在行动，不论成功失败。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height: 150%;font-family:新宋体;color:#333333;background:white\">Jordan</span><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">，一个来自西安的90后平凡女孩，2014年走出校门后在职场上的失意让她埋藏在心里的创业梦想再一次萌生。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">目前全球正以迅雷不及掩耳的速度，从传统的PC电商转向移动电商，而移动电商最重要的代表就是微商，微商可以推动全球电子商务的发展，同时改变电商全球格局。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">这个看起来古灵精怪的北方女孩看到了微商的未来发展前景，她毅然决然辞去了自己朝九晚五的都市白领工作。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">她通过网络收集大量做微商的相关资料和熟悉微信各功能的使用方法。一个月后，她成为了一名微商。</span></p><p style=\"line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">&nbsp; &nbsp; </span><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">一切似乎都是顺风顺水，她的面膜生意给她带来较为可观的收入。然而，好景不长。她遇到了众多微商都会遇到的加粉难、终端销售难、朋友圈打造难、团队建设难、无利润等各种难题。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">而且，面膜在微商界和电商界竞争已进入白炽化阶段；再加上初涉创业的90后女孩Jordan缺少社会阅历、缺少微营销专业知识、缺少对产品市场的准确定位等各种成功创业必须具备的相关知识与经验。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">俗话说：“天无绝人之路，天生我才必有用”！在她走投无路，深感迷茫甚至要放弃做微商重新过起朝九晚五的城市白领生活的时候，她通过一位微商朋友的介绍来到了由微赢生物科技有限公司联合全国工商联美容化妆品商会、安徽省教育厅大学生再就业中心，安徽省下岗再就业中心创建的微营销教育培训平台——微赢微商学院。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height: 150%;font-family:新宋体;color:#333333;background:white\">Jordan</span><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">告诉记者，当时她只是抱着去看看、试试的心态去微赢微商学院咨询微营销相关培训的内容及流程。但她当第一次进到微赢的办公区时，那个的工作场景她惊呆了，所有的人都在忙碌着。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">行政人员正准备领她进入接待室时，微赢微商学院的院长康咏铧先生碰巧与她遇见。Jordan说她与康总的遇见是自己这么多年以来最为幸运的事，康总是她事业能够如此成功必不可少的一位贵人。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">微赢微商学院根据Jordan个人情况为她私人定制一套教学方案，一对一的专业指导。并且，在微赢微商学院的建议下、她销售的产品由无专利的面膜转变成有专利的蓝莓虾青素眼贴。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">在短短两个月的时间内，她在微营销方面的进步可以说是突飞猛进。随之而来的便是她的客户越来越多，业绩也越来越高。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">她是90后平凡女孩，一个从来没有想过当大老板的人,在事业低谷期选择加入微赢微商学院，结果竟出乎意料的好。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\";line-height: 150%;font-family:新宋体;color:#333333;background:white\">&nbsp;</span><span style=\";line-height:150%;font-family:新宋体;color:#333333;background:white\">编后语：初涉创业的人，以年青人居多，普遍面临思想观念、资金经验、项目信息、实战经验等方面的困挠。因此，年轻人创业需要社会各界的扶持。同时，也希望社会上能有更多像微赢微商学院这样以帮助8090后实现创业梦想为使命的培训平台来帮助年轻人实现创业梦想。</span></p><p><br/></p>', '90后女大学生的创业传奇路', '90后女大学生的创业传奇路', '1', '1', '2015-01-19 15:32:50', null, '0', null, '', '0', '{\"thumb\":\"54bcb3556a4c4.jpg\"}', '0', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('45', '1', '', '2015-01-19 15:34:19', '<p style=\"text-align:center;text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family:黑体\">留法博士华丽转身：成功往往就是选对了团队</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">法国留学归来的樊斌有着香水、香料、化妆品工程研发工程师和巴黎工商私立学院企业行政管理和策略管理研究生的身份，本来以优越的自身条件完全可以在国外闯出一片天地，但为了创业的梦想,他毅然选择了回国创业，加入了微赢，投身到微商创业大军中，并成就了一番大事业。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体;background:yellow;background:yellow\">人物故事</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">法国留学8年期间的樊斌在比利时某化妆品公司做DIOR、CHANEL、LANCOME产品研发，自主研发持久不褪色唇膏、唇彩各一项，自主研发防水睫毛膏一项，团队研发对照圣罗兰粉底液一项。、</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family:黑体\">2008</span><span style=\"font-size:19px;line-height:150%;font-family:黑体\">年至2013年，樊斌选择了在法国创业于是他投资了一家日本餐馆。与此同时，他还和温州华人圈联合做日本动漫展，当时算得上是业内做得最好的外贸和展销商。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">鉴于国内移动互联网用户快速增长，微信用户数早已突破6亿，这个巨大平台所蕴含的商机已经不言而喻。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">而且，前几年的微信示范效应就像当年北美洲西部淘金热挖到的金矿一样，让后来者感到恐慌，仿佛不去微信捞一笔都对不起生在了这个时代。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">为了将自己国外所学到的各项技能带回国内，为了在移动互联网时代打出自己一片天，更为了自己创业的梦想,他毅然选择了回国创业，投身到微商创业大军中。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体;background:yellow;background:yellow\">微商秘笈</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">成功没有捷径，成功从来都不是靠运气的，上天只会眷顾勤奋努力的人。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">线上线下有机融合</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">在社交媒体时代，通过转载与分享，信息就在关系链中流动起来，随之而来的就是发现了新的商机，“微营销”已经成为一种不容忽视的新营销模式。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">人脉是无形的资源和财富</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">“创业初期，我的社交圈多以之前的同事和客户为主，大家都常在线下活动，比较少用微信、微博、QQ等网络社交工具。”樊斌坦言，由于身边的亲朋好友在观念上还未能充分认识和接受微商的概念，所以创业受到了不少限制。为了克服这一困难，樊斌在微赢微商学院不断学习微商课程，大胆地去接触与结交新朋友，拓展自己的好友圈子，使得销售成绩获得了突破性增长。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">真诚相待，注重客户体验感受</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family: 黑体\">微商不是比谁走得快，而是比谁走得更远。一个好的品牌，一定要注重用户的体验感受。樊斌认为经营最重要的是站在对方的角度先为消费者着想，诚信第一，用心待人，再加上自己相关的专业基础，必能获得相应的回报。</span></p><p style=\"text-indent:37px;line-height:150%\"><span style=\"font-size:19px;line-height:150%;font-family:黑体\">&nbsp;</span><span style=\"font-size:19px;line-height:150%;font-family:黑体\">樊斌表示做任何事情都有个积累和沉淀的过程，不要抱着一夜创富的心态，而坚持就是迈向成功的关键所在，成功的人往往是比别人多坚持了那么几步。</span></p><p><br/></p>', '留法博士华丽转身：成功往往就是选对了团队', '法国留学归来的樊斌有着香水、香料、化妆品工程研发工程师和巴黎工商私立学院企业行政管理和策略管理研究生的身份，本来以优越的自身条件完全可以在国外闯出一片天地，但为了创业的梦想,他毅然选择了回国创业，加入了微赢，投身到微商创业大军中，并成就了一番大事业。', '1', '1', '2015-01-19 15:33:46', null, '0', null, '', '0', '{\"thumb\":\"54bcb378d006b.jpg\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('46', '1', '', '2015-01-19 15:35:55', '<p style=\"white-space: normal; text-align: center; text-indent: 40px;\"><strong><span style=\"font-size: 20px; font-family: 宋体; background: white;\">我的梦想由你实现——微赢微商学院</span></strong></p><p style=\"white-space: normal; text-align: center; text-indent: 40px;\"><strong><span style=\"font-size: 20px; font-family: 宋体; background: white;\">90</span></strong><strong><span style=\"font-size: 20px; font-family: 宋体; background: white;\">后女大学生的创业传奇路</span></strong></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">创业是很多人孜孜以求的理想。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">然而，有的人永远把创业当成梦想，终觉时机不成；有的人却一直在行动，不论成功失败。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">Jordan</span><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">，一个来自西安的90后平凡女孩，2014年走出校门后在职场上的失意让她埋藏在心里的创业梦想再一次萌生。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">目前全球正以迅雷不及掩耳的速度，从传统的PC电商转向移动电商，而移动电商最重要的代表就是微商，微商可以推动全球电子商务的发展，同时改变电商全球格局。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">这个看起来古灵精怪的北方女孩看到了微商的未来发展前景，她毅然决然辞去了自己朝九晚五的都市白领工作。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">她通过网络收集大量做微商的相关资料和熟悉微信各功能的使用方法。一个月后，她成为了一名微商。</span></p><p style=\"white-space: normal; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">&nbsp; &nbsp;&nbsp;</span><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">一切似乎都是顺风顺水，她的面膜生意给她带来较为可观的收入。然而，好景不长。她遇到了众多微商都会遇到的加粉难、终端销售难、朋友圈打造难、团队建设难、无利润等各种难题。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">而且，面膜在微商界和电商界竞争已进入白炽化阶段；再加上初涉创业的90后女孩Jordan缺少社会阅历、缺少微营销专业知识、缺少对产品市场的准确定位等各种成功创业必须具备的相关知识与经验。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">俗话说：“天无绝人之路，天生我才必有用”！在她走投无路，深感迷茫甚至要放弃做微商重新过起朝九晚五的城市白领生活的时候，她通过一位微商朋友的介绍来到了由微赢生物科技有限公司联合全国工商联美容化妆品商会、安徽省教育厅大学生再就业中心，安徽省下岗再就业中心创建的微营销教育培训平台——微赢微商学院。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">Jordan</span><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">告诉记者，当时她只是抱着去看看、试试的心态去微赢微商学院咨询微营销相关培训的内容及流程。但她当第一次进到微赢的办公区时，那个的工作场景她惊呆了，所有的人都在忙碌着。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">行政人员正准备领她进入接待室时，微赢微商学院的院长康咏铧先生碰巧与她遇见。Jordan说她与康总的遇见是自己这么多年以来最为幸运的事，康总是她事业能够如此成功必不可少的一位贵人。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">微赢微商学院根据Jordan个人情况为她私人定制一套教学方案，一对一的专业指导。并且，在微赢微商学院的建议下、她销售的产品由无专利的面膜转变成有专利的蓝莓虾青素眼贴。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">在短短两个月的时间内，她在微营销方面的进步可以说是突飞猛进。随之而来的便是她的客户越来越多，业绩也越来越高。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">她是90后平凡女孩，一个从来没有想过当大老板的人,在事业低谷期选择加入微赢微商学院，结果竟出乎意料的好。</span></p><p style=\"white-space: normal; text-indent: 28px; line-height: 24px;\"><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">&nbsp;</span><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\">编后语：初涉创业的人，以年青人居多，普遍面临思想观念、资金经验、项目信息、实战经验等方面的困挠。因此，年轻人创业需要社会各界的扶持。同时，也希望社会上能有更多像微赢微商学院这样以帮助8090后实现创业梦想为使命的培训平台来帮助年轻人实现创业梦想。</span></p><p><span style=\"font-family: 新宋体; color: rgb(51, 51, 51); background: white;\"><br/></span></p><p><br/></p>', '90后女大学生的创业传奇路', '创业是很多人孜孜以求的理想。\r\n然而，有的人永远把创业当成梦想，终觉时机不成；有的人却一直在行动，不论成功失败。\r\nJordan，一个来自西安的90后平凡女孩，2014年走出校门后在职场上的失意让她埋藏在心里的创业梦想再一次萌生。\r\n目前全球正以迅雷不及掩耳的速度，从传统的PC电商转向移动电商，而移动电商最重要的代表就是微商，微商可以推动全球电子商务的发展，同时改变电商全球格局。', '1', '1', '2015-01-19 15:35:36', null, '0', null, '', '0', '{\"thumb\":\"54bcb3d90b7f2.jpg\"}', '4', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('47', '1', '', '2015-01-19 16:12:53', '<p style=\"text-align: center;\"><span style=\";font-family:黑体;font-weight:bold;font-size:27px\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be5ee007ca0.png\" title=\"blob.png\" alt=\"blob.png\" width=\"410\" height=\"392\" style=\"width: 410px; height: 392px;\"/></span></p><p><span style=\";font-family:黑体;font-weight:bold;font-size:27px\">微赢微商学院简介：</span></p><p style=\"text-indent:32px\"><span style=\";font-family:黑体;font-size:16px\">微赢微商学院是微赢生物科技有限公司联合全国工商联美容化妆品商会、安徽省教育厅大学生再就业中心，安徽省下岗再就业中心做的微营销教育培训平台。微赢微商学院拥有强大的师资力量，聚集了国内顶尖的微营销实战专家，课程内容涵盖</span><span style=\"font-family: 黑体;font-size: 16px\">微营销咨询、微商实用技能、移动电子商务、O2O服务为一体的移动营销服务平台及解决方案。目前学员人数已超过</span><span style=\"font-family: 黑体;font-size: 16px\">20万人，遍及全国31省市自治区，为中国最权威的微营销培训学院。曾经荣获“中国十大微营销教育学院”“中国微商十大教育学院”，微赢微商学院致力于打造中国微商的黄埔军校！</span></p><p style=\"text-indent:32px\"><span style=\";font-family:黑体;font-size:16px\">&nbsp;</span></p><p><span style=\"font-family: 黑体;font-size: 16px\">&nbsp;</span></p><p><span style=\"font-family: 黑体;font-size: 16px\">&nbsp;</span></p><p><span style=\";font-family:黑体;font-weight:bold;font-size:27px\">做微商选择微赢微商学院的8大理由</span></p><p><span style=\"font-family:黑体;font-size:14px\">1、</span><span style=\";font-family:黑体;font-size:14px\">独家录制音频教程</span></p><p><span style=\"font-family:黑体;font-size:14px\">2、</span><span style=\";font-family:黑体;font-size:14px\">一对一指导服务</span></p><p><span style=\"font-family:黑体;font-size:14px\">3、</span><span style=\";font-family:黑体;font-size:14px\">一次加入终身服务</span></p><p><span style=\"font-family:黑体;font-size:14px\">4、</span><span style=\";font-family:黑体;font-size:14px\">定期举办微商交流会</span></p><p><span style=\"font-family:黑体;font-size:14px\">5、</span><span style=\";font-family:黑体;font-size:14px\">课程资源众多，免费听取</span></p><p><span style=\"font-family:黑体;font-size:14px\">6、</span><span style=\";font-family:黑体;font-size:14px\">VIP尊贵身份</span></p><p><span style=\"font-family:黑体;font-size:14px\">7、</span><span style=\";font-family:黑体;font-size:14px\">独家微商案例分析</span></p><p><span style=\"font-family:黑体;font-size:14px\">8、</span><span style=\";font-family:黑体;font-size:14px\">专家现场答疑</span></p><p><span style=\";font-family:黑体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:黑体;font-weight:bold;font-size:27px\">加入微赢微商学院6大特权</span></p><p><span style=\"font-family:黑体;font-size:14px\">1、</span><span style=\";font-family:黑体;font-size:14px\">免费学习上百期微商营销知识</span></p><p><span style=\"font-family:黑体;font-size:14px\">2、</span><span style=\";font-family:黑体;font-size:14px\">免费听取最新微商营销课程</span></p><p><span style=\"font-family:黑体;font-size:14px\">3、</span><span style=\";font-family:黑体;font-size:14px\">免费提供一对一问题解答</span></p><p><span style=\"font-family:黑体;font-size:14px\">4、</span><span style=\";font-family:黑体;font-size:14px\">定期免费提供专家现场答疑</span></p><p><span style=\"font-family:黑体;font-size:14px\">5、</span><span style=\";font-family:黑体;font-size:14px\">定期免费参与微赢微商学院会员营销交流会</span></p><p><span style=\"font-family:黑体;font-size:14px\">6、</span><span style=\";font-family:黑体;font-size:14px\">终身享受微赢微商学院贵宾服务</span></p><p><span style=\";font-family:黑体;font-size:14px\">&nbsp;</span></p><p><span style=\";font-family:黑体;font-weight:bold;font-size:27px\">两大权威保障&nbsp;100%零风险</span></p><p><span style=\"font-family:黑体;font-size:15px\">1、</span><span style=\";font-family:黑体;font-size:15px\">国家工商备案（企业营业执照，税务登记证，组织机构代码证等）</span></p><p><span style=\";font-family:黑体;font-size:15px\">2、学习无效100%退款</span></p><p><br/></p>', '微赢微商学院', '微赢微商学院是微赢生物科技有限公司联合全国工商联美容化妆品商会、安徽省教育厅大学生再就业中心，', '1', '1', '2015-01-19 16:12:33', null, '0', null, '', '0', '{\"thumb\":\"\"}', '5', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('48', '1', '师资团队', '2015-01-19 16:13:07', '<p>师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队师资团队</p>', '师资团队', '师资团队', '1', '1', '2015-01-19 16:12:54', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('49', '1', '', '2015-01-19 16:14:06', '<p><span style=\";font-family:黑体;font-weight:bold;font-size:14px\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be604b8439a.png\" title=\"blob.png\" alt=\"blob.png\" width=\"401\" height=\"281\" style=\"width: 401px; height: 281px; float: left;\"/></span></p><p><br/></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px; text-decoration: none;\">刘兴隆</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">安徽省微赢生物科技有限公司董事长</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国著名实战微营销专家</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">微赢微商学院荣誉院长</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">85后创业楷模</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">国家心理咨询师</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">国家高级公共营养师</span></p><p><br/></p><p><br/></p><p><br/></p><p><span style=\"font-family: 黑体; font-size: 24px;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be610b15f6d.png\" title=\"blob.png\" alt=\"blob.png\" style=\"width: 260px; height: 344px; float: right;\" width=\"260\" height=\"344\"/></span></p><p><span class=\"edui-editor-imagescale-hand0\" style=\"position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: nw-resize; top: 0px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; line-height: 20px;\"></span><span class=\"edui-editor-imagescale-hand1\" style=\"position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: n-resize; top: 0px; margin-top: -4px; left: 147.5px; margin-left: -4px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; line-height: 20px;\"></span><span class=\"edui-editor-imagescale-hand2\" style=\"position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: ne-resize; top: 0px; margin-top: -4px; left: 295px; margin-left: -3px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; line-height: 20px;\"></span><span class=\"edui-editor-imagescale-hand3\" style=\"position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: w-resize; top: 172px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; line-height: 20px;\"></span><span class=\"edui-editor-imagescale-hand4\" style=\"position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: e-resize; top: 172px; margin-top: -4px; left: 295px; margin-left: -3px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; line-height: 20px;\"></span></p><p><span style=\"font-family: 黑体; font-size: 24px; text-indent: 48px; font-weight: bold;\">康咏铧</span></p><p><span style=\"font-family: 黑体; font-size: 24px; text-indent: 48px;\">安徽省微赢生物科技有限公司总经理</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">安徽省微商学院&nbsp;&nbsp;院长</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国著名微营销专家</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">80、90后创业导师</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国精细化营销创始人</span></p><p><span style=\"font-size: 24px; font-family: 黑体;\">中国negotiation&nbsp;&nbsp;dream &nbsp;direction创始人</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">移动互联网粉丝经济协会理事会员</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-size: 24px;\"><br/></span></p><p><br/></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be66324291f.jpg\" title=\"袁老师-01.jpg\" alt=\"袁老师-01.jpg\" width=\"272\" height=\"356\" style=\"width: 272px; height: 356px; float: right;\"/></span></p><p></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\">袁启明</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">微营销业绩男神</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">微信C2C加粉全国冠军</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国著名高端室内设计师</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国著名室内设计实战培训专家</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国足球协会超级联赛解说员</span></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be667d0861b.png\" title=\"blob.png\" alt=\"blob.png\" width=\"283\" height=\"413\" style=\"width: 283px; height: 413px; float: left;\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\"><br/></span></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\"><br/></span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\">许博慧</span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-size: 24px;\">中国著名营销策划师</span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-size: 24px;\">体验式微营销特聘讲师</span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-size: 24px;\">微营销终端零售业绩标兵</span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-size: 24px;\">微信C2C加粉全国冠军</span></p><p style=\"text-align: left;\"><span style=\"font-family: 黑体; font-size: 24px;\">移动互联网粉丝经济协会理事会员</span></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><span style=\"font-family: 黑体; font-weight: bold; font-size: 24px;\">JORDAN</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">微营销业绩女神</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">中国著名实战微营销培训顾问</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">移动互联网粉丝经济协会理事会员</span></p><p><span style=\"font-family: 黑体; font-size: 24px;\">皮肤美容资深导师</span></p><p><br/></p>', '雄厚的师资力量', '雄厚的师资力量', '1', '1', '2015-01-19 16:13:57', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('50', '1', '', '2015-01-19 16:14:22', '<p><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be67b686d25.jpg\" title=\"海报修改.jpg\" alt=\"海报修改.jpg\"/></p>', '课程大纲', '课程大纲', '1', '1', '2015-01-19 16:14:08', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('51', '1', '                 ', '2015-01-19 16:15:05', '<p style=\"text-align: left;\"><span style=\"font-family: 宋体; font-size: 19px; text-indent: 37px;\">微赢专注于微营销领域，擅长传统商业结合社会化媒体进行互动营销的组织与策划，凭借自身先进生物科研技术的移动互联网产品研发能力，联合数千家垂直行业平台及上百家地方联盟，为全国各地消费者及合作伙伴提供优质的产品与微营销服务。为企业及个人提供微商课程课程、微营销咨询、移动营销、移动电子商务、O2O服务为一体的移动营销服务平台及解决方案。打造国内最专业的传统商业结合社会化媒体进行互动营销团队。</span></p><p style=\"text-align: center;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6ea8a6904.jpg\" title=\"QQ图片20150120211345.jpg\" alt=\"QQ图片20150120211345.jpg\" width=\"693\" height=\"462\" style=\"width: 693px; height: 462px;\"/></p><p style=\"text-align:center\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6ea8aee89.jpg\" title=\"$JSON5)2FE~]X69TVC0ADTE.jpg\" alt=\"$JSON5)2FE~]X69TVC0ADTE.jpg\" width=\"698\" height=\"445\" style=\"text-align: center; text-indent: 37px; white-space: normal; width: 698px; height: 445px;\"/></p><p style=\"text-align: center;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6ea8b4647.jpg\" title=\"}X_8}2$I}YM(%LNVGJ8]B72.jpg\" alt=\"}X_8}2$I}YM(%LNVGJ8]B72.jpg\" width=\"696\" height=\"405\" style=\"width: 696px; height: 405px;\"/></p>', '微赢团队', '                           ', '1', '1', '2015-01-19 16:14:55', null, '0', null, '', '0', '{\"thumb\":\"\"}', '5', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('52', '1', '微赢风貌', '2015-01-19 16:15:16', '<p>微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌</p>', '微赢风貌', '微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌微赢风貌', '1', '1', '2015-01-19 16:15:06', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('53', '1', '品牌专利', '2015-01-19 16:16:05', '<p>品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利品牌专利</p>', '品牌专利', '品牌专利', '1', '1', '2015-01-19 16:15:36', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('54', '1', '产品安全', '2015-01-19 16:16:17', '<p>产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全产品安全</p>', '产品安全', '产品安全', '1', '1', '2015-01-19 16:16:06', null, '0', null, '', '0', '{\"thumb\":\"\"}', '4', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('55', '1', '授权查询', '2015-01-19 16:16:42', '<p>授权查询授权查询授权查询授权查询授权查询授权查询授权查询授权查询授权查询授权查询授权查询授权查询</p>', '授权查询', '授权查询', '1', '1', '2015-01-19 16:16:29', null, '0', null, '', '0', '{\"thumb\":\"\"}', '2', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('56', '1', '加盟政策', '2015-01-19 16:16:57', '<p>加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策</p>', '加盟政策', '加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策加盟政策', '1', '1', '2015-01-19 16:16:43', null, '0', null, '', '0', '{\"thumb\":\"\"}', '2', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('60', '1', '', '2015-01-20 22:50:51', '<h2 style=\"text-align: center;\">微赢生物科技CEO康咏铧谈2015微信营销趋势发展</h2><p>&nbsp;</p><p>　　移动浪潮正席卷而来。用户行为变了，从电脑到手机;市场变了，移动应用浮现大量商机;商业模式变了，传统的已没落，新型的正在兴起，从不断迭代的现象可以看出，我们已经进入一个移动互联网时代!<br/><br/>　　对于大家来说，现在处于红利阶段，谁先找对方法，谁就先站稳脚跟，未来就是谁的天下。在过去的几年里微信可以说是所向披靡，横扫千军，7亿的用户群，让它稳坐移动社交的头把交椅。因为庞大的用户群，所以微信蕴含着无限的商机。<br/><br/>　　如今，众多厂商介入到微信，是制造噱头也好，是商业模式的探索也好，其实质都是颠覆与变革，如果说2014年是020元年的话，那么2015年就是微商的元年，那么，我们就来分析一下微商的模式和未来的趋势。</p><p>&nbsp;</p><p style=\"TEXT-ALIGN: center\"><img alt=\" 微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6a8435dd1.jpg\" isflag=\"1\" tangram_guid=\"TANGRAM_10\" data-bd-imgshare-binded=\"1\"/></p><p style=\"TEXT-ALIGN: center\">&nbsp;</p><p>　　当下微时代的“自商业”必将成为O2O云生活的主流业态，并成为精准聚合，人人参与其中的商业互动服务经济模式。在移动电商里，微商是最值得关注的一部分群体，微信电商的成功与否很大一部分取决于微商。从微信电商到微电商再到微商，它带来的是一个去中心化的社会化移动生态的转变。<br/><br/>　　社群经济模式是微商的基本模式，是打破传统渠道代理模式的一种全新的商业模式，其运营模式不再是利益捆绑，而是具有共同价值观的人群的高度聚合，在微商的平台上可以通过远程协作，完成了传统模式无法实现的效率最大化。但同样微商也面临着挑战和困境，目前，微商的大多都是个体化发展，没有系统化的运作体系，管理上会存在很多漏洞。任何一个行业要健康发展，都离不开系统专业化的运作以及强大的教育培训体系。<br/><br/>　　微赢生物科技有限公司旗下的微赢商学院致力为80后90后提供系统化的微信营销培训并扶持80后90后创业的一个培训机构，是联合安徽省大学生在就业中心、安徽省下岗再就业中心、安徽省教育厅共同打造的商学院。目的通过将自己打造一个专业的微营销培训导师来帮助下面的经销商成长。</p><p>&nbsp;</p><p style=\"TEXT-ALIGN: center\"><img alt=\"微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6a8485f9b.jpg\" isflag=\"1\" tangram_guid=\"TANGRAM_11\" data-bd-imgshare-binded=\"1\"/></p><p style=\"TEXT-ALIGN: center\">&nbsp;</p><p>　　未来自媒体模式会越来越热，做的人越来越多，但是却不用担心相互竞争。因为每个人都有自己的特点，不同的性格和兴趣，将自己的资源、个性的地方融入到你的微信营销形象里，那你就是独一无二的。这种模式产生的效果远比大家都刷一样的图文要好很多，也更容易吸收到忠粉。作为创业者，如果我们平时积累了不错的经验、人脉和资源，那么你离成功也将不远了。经验、人脉、资源对于创业者很重要，而每个人长时间积累下来的肯定都会不一样，这个就是你创业，做微信营销，做自媒体的特性。别人模仿不来，只有你做得到。这种模式只是自媒体的雏形，坚持下去，就能够打造你自己的自媒体，总之要做好微信营销商，必须跟随专业的团队，以及接受系统的教育指导，认真对待每一位潜在客户，悉心指导每一位经销商，给出合理的建议帮助他们成长。<br/><br/>　　虽然前期需要花大量的时间和精力筛选潜在客户，定制销售策略，但等到他们能够独当一面的时候，你就能够腾出很多的时间去开发新的市场或者开始边享受生活边创业。创业都是一个漫长的过程，前期都是很幸苦的，只有打好了粉丝这个基础才会有以后好的发展。</p><p><span style=\"font-size: 12px;\"><br/></span></p><p><span style=\"font-size: 12px;\">来源：<a href=\"http://yueyu.cntv.cn/2015/01/06/ARTI1420534590580931.shtml\" target=\"_self\">CCTV央视网</a></span><br/></p><p><br/></p>', '微赢生物科技CEO康咏铧谈2015微信营销趋势发展', '　移动浪潮正席卷而来。用户行为变了，从电脑到手机;市场变了', '1', '1', '2015-01-20 22:47:25', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('57', '1', '微商如赛场，没有执行力又怎能带球突破？', '2015-01-20 16:25:55', '<p style=\"text-align:center\"><span style=\"font-size:19px;font-family:宋体\">微商如赛场，没有执行力又怎能带球突破？</span></p><p style=\"text-align: center;\"><span style=\"font-size:19px;font-family:宋体\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://weiyingkj.com/data/upload/ueditor/20150120/54be1263e63ec.jpg\" title=\"QQ图片20150120162924.jpg\" alt=\"QQ图片20150120162924.jpg\"/></span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">她曾经是河南省一家知名中医院的临床医生，是医学界的一名实力干将，所在科室多次得到病人家属的褒奖。十年的西医临床工作经验，练就了她对工作严肃和高度认真的态度。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">虽然一直奋战在医院的前线，但王利敏曾经的创业梦想还在。之后，她带着不服输的冲劲走上了创业的道路，她开办了一家商贸公司，虽然月收入十几万，但沉闷工作状态迫使她选择重新开始一个新的创业项目。如今，她转战微商，在这个挑战与机遇并存的新兴平台上追逐全新的梦想。她是王利敏，一位美丽与智慧并存的知性优雅的年轻创业者，也是微商世界中正茁壮成长的美丽前锋。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体;background:yellow;background:yellow\">人物故事</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">每个人都有一个创业梦，就像每个人都期待生活越来越好一样，以美好生活的期许和心中那种不甘平庸、不肯服舒的精神一次次撞击着你的心灵。可是，当你认真考虑创业问题时，总会有这样那样的纠结。放下一份虽然不是十分满意但相对稳定的收入，投身创业大军是需要勇气的。对绝大数人来说，创业仅仅是想想而已，但是王利敏就这样毫不犹豫的选择了微赢，做起了微商。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">王利敏表示自己转战微商是因为对微赢生物科技有限公司的董事长刘兴隆的信任，他们是多年的朋友。她相信刘总的市场判断、相信刘总的专业性、相信刘总的做事严谨的态度、更相信刘总领导下的优秀团队。所以，她毅然决然的选择了微赢，进入了微商的行列。</span></p><p style=\"text-indent: 32px; line-height: 150%; text-align: center;\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\"><img src=\"http://weiyingkj.com/data/upload/ueditor/20150120/54be127f9947c.jpg\" title=\"QQ图片20150120162919.jpg\" alt=\"QQ图片20150120162919.jpg\"/></span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体;background:yellow;background:yellow\">微商秘笈</span></p><p style=\"text-indent: 32px;line-height: 150%\"><strong><span style=\"font-size:16px;line-height:150%;font-family:宋体\">朋友圈维护——自然、真实、质朴</span></strong></p><p style=\"text-indent: 24px;line-height: 150%\">　<span style=\"font-size:16px;line-height:150%;font-family:宋体\">王利敏向大家简单的介绍了自己发朋友圈遵循的几条规则：</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">不卑不亢。我不是你的上级，你也不是我的上帝，即便是总代也没有高高在上的权利。我们是一起分享方法、经验的朋友关系。不要把手机那边的人当做没有脾气！</span><span style=\"font-size:16px;line-height:150%;font-family:&#39;Arial&#39;,&#39;sans-serif&#39;\"><br/> 2</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、不要无节操夸大产品的效果。夸张的广告词最好不要写。因为手机那边的人不是白痴，反而会显得你的像个白痴。别把所有人的智商想的和你一样了。</span><span style=\"font-size:16px;line-height:150%;font-family:&#39;Arial&#39;,&#39;sans-serif&#39;\"><br/> 3</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、洗脑的烂图求求你们别发了。今天打开微信第一条就是跟着我有钱赚。好好看清楚自己到底是什么样子，凭什么扛得起别人的人生？不要把手机那头的人当傻子！</span></p><p style=\"text-indent: 32px;line-height: 150%\"><strong><span style=\"font-size:16px;line-height:150%;font-family:宋体\">朋友圈时间节点的把控</span></strong></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size:16px;line-height:150%;font-family:宋体\">做微商只有两种下场 ：一种是笑话 ，一种是神话。如果你半途而废 只能成为朋友眼中的笑话，但如果你成功了 ，你就变她们眼中的神话了。为了不做笑话做神话，王利敏给出了自己的一套朋友圈时间节点方案。</span></p><p style=\"text-indent:28px;line-height:150%\"><span style=\"font-family:宋体\">每天发朋友圈</span>6-9<span style=\"font-family:宋体\">条就可以了，不要超过</span>10<span style=\"font-family:宋体\">条，发的时间，发的内容很重要！</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\">1</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、7-9点&nbsp; 切记发产品广告! 正能量信息才是我们不二的选择。谁愿意早上醒来打开手机就被你满屏的广告刷屏，别人第一反应就是好烦。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\">2</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、12-13点&nbsp; 刚好都下班，有时间拿手机，又正在吃饭，这个点就是你的产品广告时间，例如产品有什么功效，或上了什么媒体，一边吃饭一边玩手机的习惯应该是我们都有的吧。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\">3</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、16-18点&nbsp; 5点半左右最好，这个点大家基本都下班了，这个点发你的发货照，晒你的收入照，如果你的朋友都没看到你卖出去产品，她会买你的产品吗？再好的东西她都不会觉得好，现在酒香不怕巷子深的时代已经过去了，必须要有宣传！</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\">4</span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">、21:30-22:30&nbsp; 发自己的生活照，看电影、吃大餐、旅游、晒豪车等高大上的信息。让别人知道你是个有品位的人，是有生活质感，对生活有追求的人。这样，你自己都在使用并且推荐给朋友的产品。别人会觉得你都在用，产品肯定不会差的，也才会有一种信任感。</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\">&nbsp;</span></p><p style=\"text-indent: 32px;line-height: 150%\"><span style=\"font-size: 16px;line-height:150%;font-family:宋体\"><br/> </span><span style=\"font-size:16px;line-height:150%;font-family:宋体\">　　&nbsp;</span></p><p><br/></p>', '微商如赛场，没有执行力又怎能带球突破？', '她曾经是河南省一家知名中医院的临床医生，是医学界的一名实力干将，所在科室多次得到病人家属的褒奖。十年的西医临床工作经验，练就了她对工作严肃和高度认真的态度。', '1', '1', '2015-01-20 16:25:23', null, '0', null, '', '0', '{\"thumb\":\"54be15e316550.jpg\"}', '2', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('58', '1', '', '2015-01-20 21:03:25', '<p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;text-align:center;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">微赢商学院第三届微商交流会”圆满结束</span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;text-align:center;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">三位微商大咖现场签约</span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">12月27日，由微赢生物科技有限公司举办的“微赢商学院第三届微商交流会”圆满结束。此次交流会共21微商大咖出席，由中国著名实战微营销培训顾问Jordan主持，微赢CEO康咏铧先生担任主讲嘉宾。</span></p><p dir=\"ltr\" style=\"text-align: center;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be52620fb60.jpg\" title=\"图片1.jpg\" alt=\"图片1.jpg\" width=\"1\" height=\"1\" style=\"width: 1px; height: 1px;\"/>&nbsp;<img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be52620fb60.jpg\" title=\"图片1.jpg\" alt=\"图片1.jpg\" width=\"344\" height=\"467\" style=\"width: 344px; height: 467px;\"/></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">&nbsp;作为80.90后创业导师的康总曾多次接受凤凰网、人民网等各大媒体的专访，并被媒体誉为“中国微营销风云人物”。</span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;会上，康总根据自己多年的营销实战经验及对微商市场的调查分析指出2015年将是微商元年更是微商的洗牌年。</span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">微商作为中国新兴行业，他们没有丰富的微营销实战经验更没有接受过相关的专业培训。因此，微商在经营过程中加粉、朋友圈打造、终端销售、怎么发展团队、怎样领导团队问题、无利润、被屏蔽拉黑等各种问题将不断地出现。瓶颈期便成了众多微商不可避免的一个阶段。</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px; line-height: 150%; text-align: center;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be53767d1d3.jpg\" title=\"图片2.jpg\" alt=\"图片2.jpg\" width=\"710\" height=\"436\" style=\"width: 710px; height: 436px;\"/></span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">对此，作为中国著名微营销专家的康总给出了自己一套独特的解决方案。康总每提出一个解决方案就会得到现场20多位微商大咖一致认同与频频赞许。在康总眼里只有卖不出去产品的人，没有卖不出去的产品。</span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;康总以实际可行的方案及个人独到的见解实时与大家互动交流，会上就有三位微商大咖现场签约一生美蓝莓虾青素眼贴，成为微赢蓝莓虾青素眼贴的省级代理。</span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;line-height:150%\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">历时3个多小时的交流会在铿锵的音乐声中结束，从会议室走出的微商大咖们对康总连连称赞并表示受益匪浅愿意加入微赢团队。</span></p><p dir=\"ltr\" style=\"text-align: center;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be54186cfd3.jpg\" title=\"图片3.jpg\" alt=\"图片3.jpg\" width=\"764\" height=\"518\" style=\"width: 764px; height: 518px;\"/></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">注：康咏铧&nbsp;&nbsp;&nbsp;（微信号：kangyonghua347)</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">安徽省微赢生物科技有限公司总经理</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">安徽省微商学院院长</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">中国著名微营销专家</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">80、90后创业导师</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">中国精细化营销创始人</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">中国negotiation&nbsp;&nbsp;dream &nbsp;direction</span><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">&nbsp;创始人</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 0px; line-height: 150%; text-align: right;\"><span style=\";font-family:黑体;font-weight:bold;font-size:16px\">移动互联网粉丝经济协会理事会员</span></p><p dir=\"ltr\"><br/></p>', '“微赢商学院第三届微商交流会”圆满结束', '12月27日，由微赢生物科技有限公司举办的“微赢商学院第三届微商交流会”圆满结束。', '1', '1', '2015-01-20 21:02:17', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('59', '1', '', '2015-01-20 21:36:26', '<p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;text-align:center;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">微赢中小型美容院跨界经营发布会首战告捷</span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;text-align:center;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">蚌埠站</span></p><p style=\"margin-right:0;margin-left:0;text-indent:0;text-autospace:ideograph-numeric;text-align:center;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">&nbsp;</span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;text-align:justify;text-justify:inter-ideograph;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">1<span style=\"font-family:宋体\">月</span><span style=\"font-family:Times New Roman\">18</span><span style=\"font-family:宋体\">日，微赢中小型美容院跨界经营发布会蚌埠站圆满结束。此次发布会到场美业精英</span><span style=\"font-family:Times New Roman\">27</span><span style=\"font-family:宋体\">位，现场成功签单</span><span style=\"font-family:Times New Roman\">14</span><span style=\"font-family:宋体\">位。</span></span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;text-align:justify;text-justify:inter-ideograph;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">发布会由中国微营销培训专家<span style=\"font-family:Times New Roman\">Jordan</span><span style=\"font-family:宋体\">主持，中国著名实战微营销专家，安徽省微赢生物科技有限公司刘兴隆和中国著名微营销专家、微赢微商学院院长康咏铧做主讲嘉宾。</span></span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;text-align:justify;text-justify:inter-ideograph;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">会上，刘总为大家分析了中国未来美容业的发展趋势并提供了一套完备的美容院转型营销方案。届时，康总以自己多年的营销经验给在场的美业嘉宾分享了<span style=\"font-family:Times New Roman\">90</span><span style=\"font-family:宋体\">后的自己是如何一步步走到今天</span><span style=\"font-family:Times New Roman\">CEO</span><span style=\"font-family:宋体\">的位置，并得到凤凰网、央视网、新华网等各大媒体的争相报道的成功历程。</span></span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;text-align:justify;text-justify:inter-ideograph;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">最后，康总在为大家揭晓了最新、最优惠的微赢加盟政策时，全场欢呼。政策公布后，通过短暂的洽淡<span style=\"font-family:Times New Roman\">14</span><span style=\"font-family:宋体\">名美业精英现场签单，其中前三名签单的客户均得到微赢赠送的神秘大礼。</span></span></p><p style=\"margin-right:0;margin-left:0;text-indent:32px;text-autospace:ideograph-numeric;text-align:justify;text-justify:inter-ideograph;line-height:150%\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\">此次发布会由安徽省微赢生物科技有限公司、微赢微商学院主办；协办单位凤凰网、新华网、央视网、中国中小型企业协会。</span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px; text-align: center; line-height: 150%;\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be5ad99e954.JPG\" title=\"DSC_5829.JPG\" alt=\"DSC_5829.JPG\" width=\"687\" height=\"465\" style=\"width: 687px; height: 465px;\"/></span></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px; line-height: 150%; text-align: center;\"><span style=\";font-family:宋体;font-weight:bold;font-size:16px\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be5c266a405.JPG\" title=\"DSC_5839.JPG\" alt=\"DSC_5839.JPG\" width=\"693\" height=\"479\" style=\"width: 693px; height: 479px;\"/></span></p><p style=\"text-align: center;\"><span style=\";font-family:宋体;font-size:14px\">&nbsp;</span></p><p><br/></p>', '微赢中小型美容院跨界经营发布会首战告捷', '1月18日，微赢中小型美容院跨界经营发布会蚌埠站圆满结束。', '1', '1', '2015-01-20 21:35:51', null, '0', null, '', '0', '{\"thumb\":\"\"}', '2', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('61', '1', '', '2015-01-20 22:51:24', '<h2 style=\"text-align: center;\">微赢生物科技CEO康咏铧谈2015微信营销趋势发展</h2><p>&nbsp;</p><p>　　移动浪潮正席卷而来。用户行为变了，从电脑到手机;市场变了，移动应用浮现大量商机;商业模式变了，传统的已没落，新型的正在兴起，从不断迭代的现象可以看出，我们已经进入一个移动互联网时代!<br/><br/>　　对于大家来说，现在处于红利阶段，谁先找对方法，谁就先站稳脚跟，未来就是谁的天下。在过去的几年里微信可以说是所向披靡，横扫千军，7亿的用户群，让它稳坐移动社交的头把交椅。因为庞大的用户群，所以微信蕴含着无限的商机。<br/><br/>　　如今，众多厂商介入到微信，是制造噱头也好，是商业模式的探索也好，其实质都是颠覆与变革，如果说2014年是020元年的话，那么2015年就是微商的元年，那么，我们就来分析一下微商的模式和未来的趋势。</p><p>&nbsp;</p><p style=\"TEXT-ALIGN: center\"><img alt=\" 微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6a8435dd1.jpg\" isflag=\"1\" tangram_guid=\"TANGRAM_10\" data-bd-imgshare-binded=\"1\"/></p><p style=\"TEXT-ALIGN: center\">&nbsp;</p><p>　　当下微时代的“自商业”必将成为O2O云生活的主流业态，并成为精准聚合，人人参与其中的商业互动服务经济模式。在移动电商里，微商是最值得关注的一部分群体，微信电商的成功与否很大一部分取决于微商。从微信电商到微电商再到微商，它带来的是一个去中心化的社会化移动生态的转变。<br/><br/>　　社群经济模式是微商的基本模式，是打破传统渠道代理模式的一种全新的商业模式，其运营模式不再是利益捆绑，而是具有共同价值观的人群的高度聚合，在微商的平台上可以通过远程协作，完成了传统模式无法实现的效率最大化。但同样微商也面临着挑战和困境，目前，微商的大多都是个体化发展，没有系统化的运作体系，管理上会存在很多漏洞。任何一个行业要健康发展，都离不开系统专业化的运作以及强大的教育培训体系。<br/><br/>　　微赢生物科技有限公司旗下的微赢商学院致力为80后90后提供系统化的微信营销培训并扶持80后90后创业的一个培训机构，是联合安徽省大学生在就业中心、安徽省下岗再就业中心、安徽省教育厅共同打造的商学院。目的通过将自己打造一个专业的微营销培训导师来帮助下面的经销商成长。</p><p>&nbsp;</p><p style=\"TEXT-ALIGN: center\"><img alt=\"微赢生物科技CEO康咏铧谈2015微信营销趋势发展\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6a8485f9b.jpg\" isflag=\"1\" tangram_guid=\"TANGRAM_11\" data-bd-imgshare-binded=\"1\"/></p><p style=\"TEXT-ALIGN: center\">&nbsp;</p><p>　　未来自媒体模式会越来越热，做的人越来越多，但是却不用担心相互竞争。因为每个人都有自己的特点，不同的性格和兴趣，将自己的资源、个性的地方融入到你的微信营销形象里，那你就是独一无二的。这种模式产生的效果远比大家都刷一样的图文要好很多，也更容易吸收到忠粉。作为创业者，如果我们平时积累了不错的经验、人脉和资源，那么你离成功也将不远了。经验、人脉、资源对于创业者很重要，而每个人长时间积累下来的肯定都会不一样，这个就是你创业，做微信营销，做自媒体的特性。别人模仿不来，只有你做得到。这种模式只是自媒体的雏形，坚持下去，就能够打造你自己的自媒体，总之要做好微信营销商，必须跟随专业的团队，以及接受系统的教育指导，认真对待每一位潜在客户，悉心指导每一位经销商，给出合理的建议帮助他们成长。<br/><br/>　　虽然前期需要花大量的时间和精力筛选潜在客户，定制销售策略，但等到他们能够独当一面的时候，你就能够腾出很多的时间去开发新的市场或者开始边享受生活边创业。创业都是一个漫长的过程，前期都是很幸苦的，只有打好了粉丝这个基础才会有以后好的发展。</p><p><span style=\"font-size: 12px;\"><br/></span></p><p><span style=\"font-size: 12px;\">来源：<a href=\"http://yueyu.cntv.cn/2015/01/06/ARTI1420534590580931.shtml\" target=\"_self\">CCTV央视网</a></span><br/></p><p><br/></p>', '微赢生物科技CEO康咏铧谈2015微信营销趋势发展', '　移动浪潮正席卷而来。用户行为变了，从电脑到手机;市场变了', '1', '1', '2015-01-20 22:47:25', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('62', '1', '', '2015-01-20 22:55:51', '<h1 itemprop=\"headline\" id=\"artical_topic\" style=\"margin: 0px; padding: 0px 0px 20px; font-size: 24px; font-family: 宋体; letter-spacing: -1.5px; color: rgb(43, 43, 43); white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">访中国微信营销风云人物——微赢生物科技CEO康咏铧</h1><p><br/><iframe class=\"miniseebox js_weixin_iframe\" frameborder=\"0\" scrolling=\"no\" src=\"about:blank\" style=\"width: 232px; height: 0px; position: absolute; left: -36px; bottom: 42px; z-index: 102;\"></iframe></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">几个月前，微赢生物是谁都不知道的Nothing，但是经过短暂的时间，康总的运营团队发生了翻天覆地的变化，目前微赢生物成为中国发展最快的微商企业之一。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">康咏铧是谁?他为什么有这么大的能量能够改变一切?</p><p class=\"detailPic\" style=\"margin: 0px auto 10px; padding: 0px; text-indent: 28px; text-align: center;\"><img width=\"331\" height=\"499\" src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6be327fcd.jpg\" id=\"11260568\" alt=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto;\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">他是微赢生物科技有限公司CEO、微赢微商学院院长、中国著名微信营销实战导师、中国精细化营销创始人、中国NegotationDreamDirection创始人。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">从表面上看，丝毫不能相信气度非凡，成熟洒脱的康总竟然是90后。当记者问及创业历程，康总无限唏嘘。“那时候微商还被称为代购，因为朋友圈刷屏，被不少好友删除，常常等在手机面前，有时候甚至能熬到两三点。”</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">一路走来，用“不经一番寒彻骨，哪得梅花扑鼻香。”这句话来形容康总再合适不过了。从最底层做起，不断自我提升，开拓进取，康总用他过人的智慧，创造了同龄人难以企及的成功。康总也深知孤木难成林，面对记者的提问，他坚定的说，他的目标是把微商学院打造成中国微商的黄埔军校，使其成为行业培训标杆。他要帮助80与90后们实现创业的梦想，帮助相信微赢的经销商客户们实现财务自由。康总对记者说：“我成功的秘诀只有两点，那就是诚信和激情。用诚信对人，用激情感动人。”康总用这两点秘诀践行着他认为创业者最重要的品质——信任和创新。他说“很多人都渴望成功，然而很多人只是渴望，没有行动。”微赢就是要教会那些80和90后微商创业者们：简单，复制，马上执行的先进理念。帮助他们真正意义上的实现梦想。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">记者也十分荣幸能够当面采访康总，他的办公地点在安徽省合肥市财富广场一家5A级写字楼，整个公司团队协调工作，策划部，设计部，财务部，营销部，网络推广部，教育部，人力资源部，招商部，没有一个部门不在努力奋斗，为实现2015年营业额达1.2亿的目标。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\">我们祝福康总，也祝福他的公司，能够在2015年实现质的飞跃。&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px;\"><span style=\"font-size: 12px;\">来源</span>：<a href=\"http://nb.ifeng.com/qyzx/detail_2014_12/26/3344379_0.shtml\" target=\"_self\"><span style=\"font-size: 12px;\">凤凰网</span></a><br/></p><p><br/></p>', '访中国微信营销风云人物——微赢生物科技CEO康咏铧', '几个月前，微赢生物是谁都不知道的Nothing', '1', '1', '2015-01-20 22:52:37', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('63', '1', '', '2015-01-20 23:01:27', '<h1 id=\"p_title\" style=\"margin: 20px 20px 10px; padding: 0px; text-align: center; line-height: 36px; font-family: &#39;Microsoft YaHei&#39;, SimHei, SimSun; font-size: 2rem;\"><span style=\"font-size: 24px;\">微赢CEO康咏铧谈互联网浪潮下80和90后的创业</span></h1><p><br/></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">　　“这是一个最困难的时代，也是一个黄金时代！”，微赢生物科技有限公司总经理康咏铧如是说。<br/>　　康咏铧自身对互联网创业有很深的感悟，他说从历史角度来看，传统创业集中在60，70后。依靠“实体创业”安身立命。当然僧多粥少，加上资源的有限和稀缺性，一旦市场趋于饱和。边际收益就难以满足所有从业者了。而且传统创业资金压力大，寻常80,90后根本无法延续前辈们的创业神话。<br/>　　随着阿里巴巴在美上市，互联网公司的先进生产力已经有目共睹。“电子商务”这个不再新鲜的词汇再一次走俏。<br/>　　康咏铧感言，他觉得从经济学角度看，电子商务有传统创业难以企及的三点优势：<br/>　　<strong>第一、</strong>劳动者信息获取，传递，处理及运用的能力划时代增强。<br/>　　<strong>第二、</strong>劳动工具的网络化，智能化以及隐含在内部的信息与知识份量的爆炸，信息网络本身也成为了公用或专用的重要劳动工具。<br/>　　<strong>第三、</strong>使不可缺少的生产要素劳动对象能够得到更好的利用，扩大了涵盖的范围。数据，信息，知识，都成为了新的劳动对象。<br/>　　其实很好理解，随着中国网民数量的剧增，80和90后已经占据了中国网民基数的很大比重，他们已经成为网络的主导者，相对于还不会运用网络的60，70后，80与90后拥有更快的接受新事物的能力，以及敢于创新的勇气。</span></p><p style=\"text-align:center;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6cfc2fa10.jpg\" style=\"border: none;\"/></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">　　有了互联网的思维，没有市场也会出现巧妇难为无米之炊的情况。不过康咏铧说这个问题根本不需要过多担心。党的十六大报告指出：“信息化是我国加快实现工业化和现代化的必然选择。坚持以信息化带动工业化，以工业化促进信息化的……新型工业化道路。”因此各级政府为促进当地网络经济的发展出台了一系列优惠政策，比如，2009年国家提出了《电子信息产业调整和振兴规划》。市场为互联网创业打开了方便之门，对80和90后来说，这既是机遇也是挑战。<br/>　　当然，在市场和机遇二者都满足的前提下，也应该看见80和90后在互联网创业中的局限性。尤其是90后，他们缺乏稳重的创业心态，商业知识不扎实，危机处理能力低，在投资项目上容易盲目跟风，最重要的是原始资本的积累不够，这很容易造成沉船。<br/>　　因此，康咏铧创建的微赢微商学院应运而生，它给创业者提供一个新商业及移互联网开发、应用、营销推广传播教育学习平台，引导创业者在联网浪潮下创规避风险；用经验帮助创业者少走弯路。<br/></span></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">&nbsp; &nbsp; &nbsp; <span style=\"font-size: 12px;\">来源：</span><a href=\"http://hn.people.com.cn/n/2014/1224/c356343-23329740.html\" target=\"_self\"><span style=\"font-size: 12px;\">人民网</span></a></span></p>', '微赢CEO康咏铧谈互联网浪潮下80和90后的创业', '“这是一个最困难的时代，也是一个黄金时代！”，微赢生物科技有限公司总经理康咏铧如是说。', '1', '1', '2015-01-20 22:58:00', null, '0', null, '', '0', '{\"thumb\":\"\"}', '1', '0', '0', '0');
INSERT INTO `sp_posts` VALUES ('64', '1', '', '2015-01-20 23:02:28', '<h1 id=\"p_title\" style=\"margin: 20px 20px 10px; padding: 0px; text-align: center; line-height: 36px; font-family: &#39;Microsoft YaHei&#39;, SimHei, SimSun; font-size: 2rem;\"><span style=\"font-size: 24px;\">微赢CEO康咏铧谈互联网浪潮下80和90后的创业</span></h1><p><br/></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">　　“这是一个最困难的时代，也是一个黄金时代！”，微赢生物科技有限公司总经理康咏铧如是说。<br/>　　康咏铧自身对互联网创业有很深的感悟，他说从历史角度来看，传统创业集中在60，70后。依靠“实体创业”安身立命。当然僧多粥少，加上资源的有限和稀缺性，一旦市场趋于饱和。边际收益就难以满足所有从业者了。而且传统创业资金压力大，寻常80,90后根本无法延续前辈们的创业神话。<br/>　　随着阿里巴巴在美上市，互联网公司的先进生产力已经有目共睹。“电子商务”这个不再新鲜的词汇再一次走俏。<br/>　　康咏铧感言，他觉得从经济学角度看，电子商务有传统创业难以企及的三点优势：<br/>　　<strong>第一、</strong>劳动者信息获取，传递，处理及运用的能力划时代增强。<br/>　　<strong>第二、</strong>劳动工具的网络化，智能化以及隐含在内部的信息与知识份量的爆炸，信息网络本身也成为了公用或专用的重要劳动工具。<br/>　　<strong>第三、</strong>使不可缺少的生产要素劳动对象能够得到更好的利用，扩大了涵盖的范围。数据，信息，知识，都成为了新的劳动对象。<br/>　　其实很好理解，随着中国网民数量的剧增，80和90后已经占据了中国网民基数的很大比重，他们已经成为网络的主导者，相对于还不会运用网络的60，70后，80与90后拥有更快的接受新事物的能力，以及敢于创新的勇气。</span></p><p style=\"text-align:center;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><img src=\"http://dns.hfnacai.com/data/upload/ueditor/20150120/54be6cfc2fa10.jpg\" style=\"border: none;\"/></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">　　有了互联网的思维，没有市场也会出现巧妇难为无米之炊的情况。不过康咏铧说这个问题根本不需要过多担心。党的十六大报告指出：“信息化是我国加快实现工业化和现代化的必然选择。坚持以信息化带动工业化，以工业化促进信息化的……新型工业化道路。”因此各级政府为促进当地网络经济的发展出台了一系列优惠政策，比如，2009年国家提出了《电子信息产业调整和振兴规划》。市场为互联网创业打开了方便之门，对80和90后来说，这既是机遇也是挑战。<br/>　　当然，在市场和机遇二者都满足的前提下，也应该看见80和90后在互联网创业中的局限性。尤其是90后，他们缺乏稳重的创业心态，商业知识不扎实，危机处理能力低，在投资项目上容易盲目跟风，最重要的是原始资本的积累不够，这很容易造成沉船。<br/>　　因此，康咏铧创建的微赢微商学院应运而生，它给创业者提供一个新商业及移互联网开发、应用、营销推广传播教育学习平台，引导创业者在联网浪潮下创规避风险；用经验帮助创业者少走弯路。<br/></span></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 25px; font-family: 宋体; font-size: 1.4rem; word-wrap: break-word;\"><span style=\"font-size: 16px;\">&nbsp; &nbsp; &nbsp; <span style=\"font-size: 12px;\">来源：</span><a href=\"http://hn.people.com.cn/n/2014/1224/c356343-23329740.html\" target=\"_self\"><span style=\"font-size: 12px;\">人民网</span></a></span></p>', '人民网：微赢CEO康咏铧谈互联网浪潮下80和90后的创业', '“这是一个最困难的时代，也是一个黄金时代！”，微赢生物科技有限公司总经理康咏铧如是说。', '1', '1', '2015-01-20 22:58:00', null, '0', null, '', '0', '{\"thumb\":\"\"}', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for sp_role
-- ----------------------------
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role
-- ----------------------------
INSERT INTO `sp_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');
INSERT INTO `sp_role` VALUES ('2', '教育厅', null, '1', '教育厅', '0', '0', '0');

-- ----------------------------
-- Table structure for sp_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sp_role_user`;
CREATE TABLE `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sp_route
-- ----------------------------
DROP TABLE IF EXISTS `sp_route`;
CREATE TABLE `sp_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_route
-- ----------------------------

-- ----------------------------
-- Table structure for sp_slide
-- ----------------------------
DROP TABLE IF EXISTS `sp_slide`;
CREATE TABLE `sp_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_slide
-- ----------------------------

-- ----------------------------
-- Table structure for sp_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `sp_slide_cat`;
CREATE TABLE `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for sp_terms
-- ----------------------------
DROP TABLE IF EXISTS `sp_terms`;
CREATE TABLE `sp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_terms
-- ----------------------------
INSERT INTO `sp_terms` VALUES ('1', '走进微赢', '', 'article', '走进微赢', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('3', '品牌动态', '', 'article', '品牌动态', '0', '0', '0-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('4', '微赢商学院', '', 'article', '微赢商学院', '0', '0', '0-4', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('5', '会员中心', '', 'article', '会员中心', '0', '0', '0-5', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('6', '创业故事', '', 'article', '创业故事', '4', '0', '0-4-6', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `sp_terms` VALUES ('7', '微赢动态', '', 'article', '微赢动态', '1', '0', '0-1-7', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for sp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `sp_term_relationships`;
CREATE TABLE `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_term_relationships
-- ----------------------------
INSERT INTO `sp_term_relationships` VALUES ('1', '1', '2', '0', '0');
INSERT INTO `sp_term_relationships` VALUES ('2', '2', '1', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('23', '48', '1', '0', '0');
INSERT INTO `sp_term_relationships` VALUES ('22', '47', '4', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('21', '46', '6', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('20', '45', '6', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('19', '44', '1', '0', '0');
INSERT INTO `sp_term_relationships` VALUES ('18', '43', '6', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('17', '42', '1', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('16', '41', '1', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('15', '40', '3', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('14', '39', '4', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('13', '38', '5', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('24', '49', '4', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('25', '50', '4', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('26', '51', '1', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('27', '52', '1', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('28', '53', '3', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('29', '54', '3', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('30', '55', '5', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('31', '56', '5', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('32', '57', '6', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('33', '58', '7', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('34', '59', '7', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('35', '60', '1', '0', '0');
INSERT INTO `sp_term_relationships` VALUES ('36', '61', '7', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('37', '62', '7', '0', '1');
INSERT INTO `sp_term_relationships` VALUES ('38', '63', '1', '0', '0');
INSERT INTO `sp_term_relationships` VALUES ('39', '64', '7', '0', '1');

-- ----------------------------
-- Table structure for sp_users
-- ----------------------------
DROP TABLE IF EXISTS `sp_users`;
CREATE TABLE `sp_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `role_id` smallint(6) DEFAULT NULL COMMENT '用户角色id',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `authorize` text,
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_users
-- ----------------------------
INSERT INTO `sp_users` VALUES ('1', 'admin', 'c535018ee946e10adc3949ba59abbe56e057f20f883e89af', 'admin', 'wangsong12332@sina.com', '', null, '0', null, null, '60.166.37.183', '2015-01-21 08:18:15', '2015-01-07 04:24:04', '', '1', '1', '0', '1', null);
INSERT INTO `sp_users` VALUES ('2', '汪松', 'c535018ee946202cb962ac59075b964b07152d234b7089af', '', 'wangsong1233276@sina.com', '', null, '0', null, null, '0.0.0.0', '2015-01-08 11:14:27', '0000-00-00 00:00:00', '', '1', '2', '0', '1', null);
INSERT INTO `sp_users` VALUES ('3', 'test', 'c535018ee946c415b069d516eace04d5a76b242150b589af', 'test', 'wangsong123327212126@126.com', '', null, '0', null, null, '0.0.0.0', '2015-01-13 15:43:14', '2015-01-13 15:43:14', '', '1', null, '0', '2', null);
INSERT INTO `sp_users` VALUES ('4', 'zero', 'c535018ee946e10adc3949ba59abbe56e057f20f883e89af', 'zero', 'wangsong121113327212126@126.com', '', null, '0', null, null, '60.166.159.66', '2015-01-20 20:24:42', '2015-01-15 15:46:46', '', '1', null, '0', '2', '<p style=\"text-align: center;\"><img src=\"http://weiyingkj.com/data/upload/ueditor/20150120/54be49ab4d6cc.jpg\" title=\"未标题-2-01.jpg\" alt=\"未标题-2-01.jpg\"/></p>');
INSERT INTO `sp_users` VALUES ('5', 'hhsdf', 'c535018ee946e10adc3949ba59abbe56e057f20f883e89af', 'hhsdf', '526046543@qq.com', '', null, '0', null, null, '114.96.147.231', '2015-01-17 12:26:00', '2015-01-17 12:26:00', '', '1', null, '0', '2', null);

-- ----------------------------
-- Table structure for sp_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `sp_user_favorites`;
CREATE TABLE `sp_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user_favorites
-- ----------------------------
INSERT INTO `sp_user_favorites` VALUES ('1', '1', 'asda', '/index.php?g=portal&amp;m=article&amp;a=index&amp;id=1', null, 'posts', '1', '1420685119');
INSERT INTO `sp_user_favorites` VALUES ('2', '3', '微赢简介', '/old/index.php?g=portal&amp;m=article&amp;a=index&amp;id=2', null, 'posts', '2', '1421216305');
