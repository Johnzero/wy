-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 11 月 26 日 11:27
-- 服务器版本: 5.5.38
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `thinkcmf`
--
CREATE DATABASE `thinkcmf` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `thinkcmf`;

-- --------------------------------------------------------

--
-- 表的结构 `sp_access`
--

CREATE TABLE IF NOT EXISTS `sp_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `g` varchar(20) NOT NULL COMMENT '项目',
  `m` varchar(20) NOT NULL COMMENT '模块',
  `a` varchar(20) NOT NULL COMMENT '方法',
  KEY `groupId` (`role_id`),
  KEY `gma` (`g`,`m`,`a`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_ad`
--

CREATE TABLE IF NOT EXISTS `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_asset`
--

CREATE TABLE IF NOT EXISTS `sp_asset` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_comments`
--

CREATE TABLE IF NOT EXISTS `sp_comments` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_common_action_log`
--

CREATE TABLE IF NOT EXISTS `sp_common_action_log` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `sp_common_action_log`
--

INSERT INTO `sp_common_action_log` (`id`, `user`, `object`, `action`, `count`, `last_time`, `ip`) VALUES
(1, 0, 'posts1', 'Portal-Article-index', 3, 1416972327, '127.0.0.1'),
(2, 0, 'posts2', 'Portal-Article-index', 9, 1415592223, '127.0.0.1'),
(3, 0, 'posts4', 'Portal-Article-index', 4, 1415351959, '127.0.0.1'),
(4, 0, 'posts', 'Portal-Article-index', 119, 1415672247, '127.0.0.1'),
(5, 0, 'posts3', 'Portal-Article-index', 34, 1415593664, '127.0.0.1'),
(6, 0, 'posts5', 'Portal-Article-index', 9, 1415593634, '127.0.0.1'),
(7, 0, 'posts7', 'Portal-Article-index', 3, 1415592237, '127.0.0.1'),
(8, 0, 'posts8', 'Portal-Article-index', 23, 1416972317, '127.0.0.1'),
(9, 0, 'posts6', 'Portal-Article-index', 12, 1415593476, '127.0.0.1'),
(10, 0, 'posts10', 'Portal-Article-index', 6, 1416972312, '127.0.0.1'),
(11, 0, 'posts9', 'Portal-Article-index', 1, 1415590666, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `sp_guestbook`
--

CREATE TABLE IF NOT EXISTS `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_links`
--

CREATE TABLE IF NOT EXISTS `sp_links` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_links`
--

INSERT INTO `sp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(1, 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_menu`
--

CREATE TABLE IF NOT EXISTS `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `data` char(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(50) DEFAULT NULL,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=564 ;

--
-- 转存表中的数据 `sp_menu`
--

INSERT INTO `sp_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(239, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(51, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 10),
(245, 51, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(299, 260, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(252, 239, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(253, 252, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(254, 252, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(260, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 30),
(262, 260, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(264, 262, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(265, 260, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(268, 262, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(270, 260, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(277, 51, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(301, 300, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(302, 300, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(300, 51, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(284, 239, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(285, 51, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(286, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 0),
(287, 289, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(288, 289, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(289, 286, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(290, 286, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(291, 290, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(292, 290, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(293, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 0),
(294, 293, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(295, 294, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(296, 294, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(297, 293, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(298, 239, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(319, 260, 'Admin', 'Backup', 'default', '', 1, 1, '备份管理', '', '', 0),
(480, 292, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(479, 292, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(478, 292, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(477, 245, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(476, 245, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(475, 245, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(474, 268, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(473, 268, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(472, 268, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(471, 264, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(470, 264, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(469, 264, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(467, 291, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(465, 291, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(464, 291, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(463, 291, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(462, 291, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(458, 302, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(457, 302, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(456, 285, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(455, 285, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(454, 285, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(452, 285, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(451, 285, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(450, 301, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(449, 301, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(448, 277, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(446, 277, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(445, 277, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(444, 296, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(443, 296, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(442, 296, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(441, 295, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(440, 295, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(439, 295, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(436, 297, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(434, 297, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(433, 297, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(432, 297, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(430, 270, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(429, 270, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(428, 270, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(424, 319, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(423, 319, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(422, 319, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(421, 319, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(420, 265, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(419, 265, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(418, 265, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(482, 288, 'Api', 'Oauthadmin', 'delete', '', 1, 0, '删除第三方用户', '', '', 1000),
(483, 287, 'Member', 'Indexadmin', 'delete', '', 1, 0, '删除用户', '', '', 1000),
(496, 319, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(497, 418, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(498, 419, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(499, 428, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(500, 429, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(501, 536, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(502, 434, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(503, 439, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(504, 440, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(505, 442, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(506, 443, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(507, 445, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(508, 446, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(509, 451, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(510, 452, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(511, 462, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(512, 464, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(513, 465, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(514, 284, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(515, 254, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(516, 469, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(517, 470, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(518, 472, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(519, 473, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(520, 475, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(521, 476, 'Portal', 'AdminTerm', 'edit_post', '', 1, 1, '提交编辑', '', '', 0),
(522, 478, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(523, 479, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(524, 253, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(525, 299, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(526, 533, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(527, 526, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(528, 533, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0),
(529, 528, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(533, 239, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(536, 297, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(546, 496, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(547, 270, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(548, 297, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(549, 295, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(550, 277, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(551, 285, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(552, 264, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(553, 245, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(554, 51, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(555, 554, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(557, 51, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(559, 557, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(560, 557, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(561, 287, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(562, 287, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(563, 288, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav`
--

CREATE TABLE IF NOT EXISTS `sp_nav` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `sp_nav`
--

INSERT INTO `sp_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', '', 1, 0, '0-1'),
(4, 1, 0, '关于我们', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-4'),
(5, 1, 0, '产品中心', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 0, '0-5'),
(6, 1, 0, '应用领域', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"10";}}', '', 1, 0, '0-6'),
(7, 1, 0, '工程案例', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"17";}}', '', 1, 0, '0-7'),
(8, 1, 0, '资讯中心', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"18";}}', '', 1, 0, '0-8'),
(31, 5, 0, '行业动态', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"20";}}', '', 1, 0, '0-31'),
(10, 1, 0, '人力资源', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"21";}}', '', 1, 0, '0-10'),
(27, 4, 0, '金属装饰线条', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 3, '0-27'),
(30, 5, 0, '公司动态', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"19";}}', '', 1, 0, '0-30'),
(28, 4, 0, '质感装饰砂浆', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"8";}}', '', 1, 5, '0-28'),
(29, 4, 0, '干混砂浆', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 4, '0-29'),
(26, 4, 0, '金属装饰板', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 2, '0-26'),
(25, 4, 0, '装饰板', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"5";}}', '', 1, 1, '0-25');

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav_cat`
--

CREATE TABLE IF NOT EXISTS `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sp_nav_cat`
--

INSERT INTO `sp_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航'),
(4, '产品导航', 0, '产品导航'),
(5, '公司动态', 0, '公司动态');

-- --------------------------------------------------------

--
-- 表的结构 `sp_oauth_user`
--

CREATE TABLE IF NOT EXISTS `sp_oauth_user` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_options`
--

CREATE TABLE IF NOT EXISTS `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sp_options`
--

INSERT INTO `sp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(2, 'site_options', '{"site_name":"\\u6211\\u7684\\u4e2a\\u4eba\\u7f51\\u7ad9","site_host":"http:\\/\\/localhost\\/cmf\\/","site_root":"\\/","site_tpl":"bs","site_adminstyle":"bluesky","site_icp":"","site_admin_email":"admin@qq.com","site_tongji":"","site_copyright":"","site_seo_title":"\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ad9\\u6a21\\u677f","site_seo_keywords":"\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ad9\\u6a21\\u677f","site_seo_description":"\\u5efa\\u7b51\\u4f01\\u4e1a\\u7ad9\\u6a21\\u677f","urlmode":"1","html_suffix":""}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_posts`
--

CREATE TABLE IF NOT EXISTS `sp_posts` (
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
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sp_posts`
--

INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`) VALUES
(1, 1, '干混砂浆', '2014-11-06 17:45:08', '<p>干混砂浆干混砂浆干混砂浆干混砂浆干混砂浆干混砂浆干混砂浆干混砂浆干混砂浆</p>', '干混砂浆', '干混砂浆\r\n', 1, 1, '2014-11-06 17:44:13', NULL, 0, NULL, '', 0, '{"thumb":"545b436fbd819.jpg","photo":[{"url":"545b43190b0c8.jpg","alt":"1-140Q11053280-L"}]}', 1, 0),
(2, 1, '某某石', '2014-11-06 17:46:12', '<p><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">某某石</span><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">某某石</span><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">某某石</span><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">某某石</span></p>', '某某石', '某某石某某石某某石某某石某某石某某石', 1, 1, '2014-11-06 17:45:10', NULL, 0, NULL, '', 0, '{"thumb":"545b43607e8c8.jpg","photo":[{"url":"545b4358068eb.jpg","alt":"1-140Q11404110-L"}]}', 1, 0),
(3, 1, '金属装饰板', '2014-11-06 17:47:58', '<p><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">金属装饰板</span><span style="color: rgb(59, 65, 69); font-family: &#39;Microsoft YaHei UI&#39;, &#39;Microsoft YaHei&#39;, Arial, SimSun, &#39;Segoe UI&#39;, Tahoma, Helvetica, sans-serif; font-size: 30px; font-weight: bold; line-height: 54px;">金属装饰板</span></p>', '金属装饰板', '金属装饰板', 1, 1, '2014-11-06 17:47:34', NULL, 0, NULL, '', 0, '{"thumb":"545b43cb05f74.jpg","photo":[{"url":"545b43c522efc.jpg","alt":"1-140Q11403100-L"}]}', 1, 0),
(4, 1, '建设路商业街', '2014-11-07 15:34:43', '<h3 style="margin: 0px; padding: 0px; color: rgb(97, 103, 106); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: 微软雅黑; font-size: 24px; font-style: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">建设路商业街</h3><p>&nbsp;</p>', '建设路商业街', '建设路商业街建设路商业街建设路商业街建设路商业街建设路商业街', 1, 1, '2014-11-07 15:33:07', NULL, 0, NULL, '', 0, '{"thumb":"545c760dc2436.jpg","photo":[{"url":"545c76053c995.jpg","alt":"1-140Q1163KL13"}]}', 1, 0),
(5, 1, '名人酒店', '2014-11-07 15:36:09', '<h3 style="margin: 0px; padding: 0px; color: rgb(97, 103, 106); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: 微软雅黑; font-size: 24px; font-style: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">名人酒店</h3><h3 style="margin: 0px; padding: 0px; color: rgb(97, 103, 106); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: 微软雅黑; font-size: 24px; font-style: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">名人酒店</h3><h3 style="margin: 0px; padding: 0px; color: rgb(97, 103, 106); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: 微软雅黑; font-size: 24px; font-style: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">名人酒店</h3><p></p>', '名人酒店', '名人酒店名人酒店名人酒店名人酒店名人酒店名人酒店', 1, 1, '2014-11-07 15:35:29', NULL, 0, NULL, '', 0, '{"thumb":"545c766166e6d.jpg","photo":[{"url":"545c765c4b3e0.jpg","alt":"1-140Q1164024450"}]}', 1, 0),
(6, 1, '丽花样', '2014-11-07 15:37:05', '<p></p><p><img src="http://localhost/cmf/data/upload/ueditor/545c91823ced7.jpg" style="float:none;" title="1-140Q1164024450.jpg"/></p><p><br/></p>', '丽花样', '丽花样丽花样丽花样丽花样丽花样', 1, 1, '2014-11-07 15:36:20', NULL, 0, NULL, '', 0, '{"thumb":"545c769dea1e3.jpg"}', 1, 0),
(10, 1, 'PHP开发工程师', '2014-11-10 11:28:17', '<p>PHP开发工程师PHP开发工程师PHP开发工程师</p>', 'PHP开发工程师', 'PHP开发工程师PHP开发工程师', 1, 1, '2014-11-10 11:13:34', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0),
(7, 1, '新疆自治区民政局大楼', '2014-11-07 15:37:38', '<h3 style="margin: 0px; padding: 0px; color: rgb(97, 103, 106); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: 微软雅黑; font-size: 24px; font-style: normal; font-variant: normal; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;">新疆自治区民政局大楼</h3><p></p>', '新疆自治区民政局大楼', '新疆自治区民政局大楼', 1, 1, '2014-11-07 15:37:21', NULL, 0, NULL, '', 0, '{"thumb":"545c76c013433.jpg","photo":[{"url":"545c76bb716fb.jpg","alt":"1-140Q1155SH18"}]}', 1, 0),
(8, 1, '装修难题装修难题', '2014-11-07 16:14:24', '<p style="text-align: center; ">装修难题装修难题装修难题</p><p style="text-align: center; "><img src="http://localhost/cmf/data/upload/ueditor/545c80b858599.jpg" style="float:none;" title="1_0Q21554322200.jpg"/></p><p style="text-align: center; "><img src="http://localhost/cmf/data/upload/ueditor/545c80b86394c.jpg" style="float:none;" title="1-140Q11415380-L.jpg"/></p><p><br/></p>', '“一种工艺解决所有装修难题”-----引领', '装修难题装修难题装修难题', 1, 1, '2014-11-07 16:13:03', NULL, 0, NULL, '', 0, '{"thumb":"545c7f5c87fbc.jpg","photo":[{"url":"545c7f24c575f.jpg","alt":"1-140Q1164024450"}]}', 1, 0),
(9, 1, '平面设计师', '2014-11-10 11:13:30', '<p>平面设计师平面设计师平面设计师平面设计师平面设计师</p>', '平面设计师', '平面设计师', 1, 1, '2014-11-10 11:12:59', NULL, 0, NULL, '', 0, '{"thumb":""}', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role`
--

CREATE TABLE IF NOT EXISTS `sp_role` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_role`
--

INSERT INTO `sp_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role_user`
--

CREATE TABLE IF NOT EXISTS `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide`
--

CREATE TABLE IF NOT EXISTS `sp_slide` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide_cat`
--

CREATE TABLE IF NOT EXISTS `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sp_term_relationships`
--

INSERT INTO `sp_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 5, 0, 1),
(2, 2, 5, 0, 1),
(3, 3, 6, 0, 1),
(4, 4, 17, 0, 1),
(5, 5, 17, 0, 1),
(6, 6, 17, 0, 1),
(7, 7, 17, 0, 1),
(8, 8, 19, 0, 1),
(9, 9, 21, 0, 1),
(10, 10, 21, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_terms`
--

CREATE TABLE IF NOT EXISTS `sp_terms` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `sp_terms`
--

INSERT INTO `sp_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(1, '列表演示', '', 'article', '', 0, 0, '0-1', '', '', '', 'list', 'article', 0, 1),
(2, '瀑布流', '', 'article', '', 0, 0, '0-2', '', '', '', 'list_masonry', 'article', 0, 1),
(3, '关于我们', '', 'article', '', 0, 0, '0-3', '', '', '', 'about', 'article', 0, 1),
(4, '产品中心', '', 'picture', '', 0, 0, '0-4', '', '', '', 'product', 'product_pic', 0, 1),
(5, '装饰板', '', 'picture', '', 4, 0, '0-4-5', '', '', '', 'product_list', 'product_pic', 0, 1),
(6, '金属装饰线条', '', 'picture', '', 4, 0, '0-4-6', '', '', '', 'product_list', 'product_pic', 0, 1),
(7, '金属装饰板', '', 'picture', '', 4, 0, '0-4-7', '', '', '', 'product_list', 'product_pic', 0, 1),
(8, '质感装饰砂浆', '', 'picture', '', 4, 0, '0-4-8', '', '', '', 'product_list', 'product_pic', 0, 1),
(9, '干混砂浆', '', 'picture', '', 4, 0, '0-4-9', '', '', '', 'product_list', 'product_pic', 0, 1),
(10, '应用领域', '', 'article', '', 0, 0, '0-10', '', '', '', 'yingyonglingyu', 'article', 0, 1),
(11, '建筑外墙保温领域', '', 'article', '', 10, 0, '0-10-11', '', '', '', 'list', 'article', 0, 1),
(12, '公共内装领域', '', 'article', '', 10, 0, '0-10-12', '', '', '', 'list', 'article', 0, 1),
(13, '家庭装饰领域', '', 'article', '', 10, 0, '0-10-13', '', '', '', 'list', 'article', 0, 1),
(14, '地下空间领域', '', 'article', '', 10, 0, '0-10-14', '', '', '', 'list', 'article', 0, 1),
(15, '钢结构建筑外围护领域', '', 'article', '', 10, 0, '0-10-15', '', '', '', 'list', 'article', 0, 1),
(16, '洁净房领域', '', 'article', '', 10, 0, '0-10-16', '', '', '', 'list', 'article', 0, 1),
(17, '工程案例', '', 'article', '', 0, 0, '0-17', '', '', '', 'case', 'case_article', 0, 1),
(18, '资讯中心', '', 'article', '', 0, 0, '0-18', '', '', '', 'news_list', 'news_article', 0, 1),
(19, '公司动态', '', 'article', '', 18, 0, '0-18-19', '', '', '', 'news', 'news_article', 0, 1),
(20, '行业动态', '', 'article', '', 18, 0, '0-18-20', '', '', '', 'news', 'news_article', 0, 1),
(21, '人力资源', '', 'article', '', 0, 0, '0-21', '', '', '', 'join', 'join_article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_user_favorites`
--

CREATE TABLE IF NOT EXISTS `sp_user_favorites` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_users`
--

CREATE TABLE IF NOT EXISTS `sp_users` (
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
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_users`
--

INSERT INTO `sp_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `role_id`, `score`, `user_type`) VALUES
(1, 'admin', 'c535018ee94621232f297a57a5a743894a0e4a801fc389af', 'admin', 'admin@qq.com', '', NULL, 0, NULL, NULL, '127.0.0.1', '2014-11-11 10:17:14', '2014-11-06 04:59:25', '', 1, 1, 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
