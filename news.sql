/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-03-07 16:09:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gz_adminer
-- ----------------------------
DROP TABLE IF EXISTS `gz_adminer`;
CREATE TABLE `gz_adminer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '上次登录的ip地址',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录的时间',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '-1禁止，0待审核，1正常状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员的权限范围',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_2` (`username`),
  KEY `username` (`username`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_adminer
-- ----------------------------
INSERT INTO `gz_adminer` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '127.0.0.1', '1536218100', '1', '0', '1536218100', '');
INSERT INTO `gz_adminer` VALUES ('10', 'chenshu', 'e10adc3949ba59abbe56e057f20f883e', '127.0.0.1', '1551940943', '1', '1535957592', '1535957592', '');
INSERT INTO `gz_adminer` VALUES ('11', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', '0', '1', '1551685840', '0', '');

-- ----------------------------
-- Table structure for gz_category
-- ----------------------------
DROP TABLE IF EXISTS `gz_category`;
CREATE TABLE `gz_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类id',
  `cat_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_category
-- ----------------------------
INSERT INTO `gz_category` VALUES ('1', '0', '娱乐', '1551748635', '0');
INSERT INTO `gz_category` VALUES ('6', '0', '旅游', '1551770398', '0');
INSERT INTO `gz_category` VALUES ('3', '0', '军事', '1551753070', '0');
INSERT INTO `gz_category` VALUES ('4', '0', '体育', '1551753079', '0');

-- ----------------------------
-- Table structure for gz_comment
-- ----------------------------
DROP TABLE IF EXISTS `gz_comment`;
CREATE TABLE `gz_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新闻id',
  `content` varchar(300) NOT NULL DEFAULT '' COMMENT '评论内容',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论目标用户ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_comment
-- ----------------------------
INSERT INTO `gz_comment` VALUES ('7', '9', '17', '测试评论', '1', '1536652736', '1');
INSERT INTO `gz_comment` VALUES ('8', '1', '17', '新的回复', '0', '1551841376', '0');
INSERT INTO `gz_comment` VALUES ('20', '10', '17', '哇不错', '1', '1551849920', '0');
INSERT INTO `gz_comment` VALUES ('21', '10', '17', '可以的', '1', '1551849983', '8');
INSERT INTO `gz_comment` VALUES ('22', '10', '17', '你好', '1', '1551850058', '8');
INSERT INTO `gz_comment` VALUES ('23', '10', '17', '哈哈哈哈不错', '0', '1551850093', '0');
INSERT INTO `gz_comment` VALUES ('24', '1', '15', '抢楼', '0', '1551852366', '0');
INSERT INTO `gz_comment` VALUES ('25', '1', '18', '抢个楼', '0', '1551852739', '0');
INSERT INTO `gz_comment` VALUES ('26', '1', '18', '回复一下', '1', '1551852746', '25');
INSERT INTO `gz_comment` VALUES ('27', '1', '17', 'nmkkl', '1', '1551862473', '8');
INSERT INTO `gz_comment` VALUES ('28', '1', '17', '是的', '10', '1551940632', '23');
INSERT INTO `gz_comment` VALUES ('29', '1', '17', '我也这样觉得', '10', '1551940647', '23');

-- ----------------------------
-- Table structure for gz_news
-- ----------------------------
DROP TABLE IF EXISTS `gz_news`;
CREATE TABLE `gz_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `catid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '新闻标题图片',
  `content` text NOT NULL COMMENT '新闻内容',
  `description` varchar(200) NOT NULL COMMENT '新闻摘要',
  `is_position` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_allowcomments` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许评论',
  `listorder` int(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1正常 0审核',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_news
-- ----------------------------
INSERT INTO `gz_news` VALUES ('14', '新闻标题', '3', '/upload\\20190305\\43afa97936cf6fb192ad8c53fed9bfca.jpg', '<p>内容<img src=\"/ueditor/php/upload/image/20190305/1551766968130571.jpg\" title=\"1551766968130571.jpg\" alt=\"timg.jpg\"/></p>', '摘要', '1', '0', '0', '1551765307', '1551768796', '4', '0', '1');
INSERT INTO `gz_news` VALUES ('15', '李易峰与网红同游苏梅岛恋情曝光？女方:没有的事', '1', '/upload\\20190305\\0813cb7a2de23ae17133fd3e87a06123.jpg', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 38px; text-size-adjust: 100%; font-size: 16px; color: rgb(77, 79, 83); letter-spacing: 1px; line-height: 28px;\">网红湾湾在微博发文否认与李易峰的恋情传闻，称：“完全没有的事！”</p><p><span class=\"icon quotation-left\" style=\"background-image: -webkit-image-set(url(&quot;//n.sinaimg.cn/finance/page/ent/images/0908_zyc_icons.png&quot;) 1x, url(&quot;//n.sinaimg.cn/finance/page/ent/images/0908_zyc_icons2x.png&quot;) 2x); background-repeat: no-repeat; width: 28px; height: 24px; background-position: -268px -100px; position: absolute; top: 0px; left: 0px;\"></span></p><p><img alt=\"网红否认与李易峰恋情传闻\" src=\"/ueditor/php/upload/image/20190305/1551767231357163.png\" style=\"border: 0px none; vertical-align: middle; display: block; margin: 0px auto; max-width: 640px;\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">网红否认与李易峰恋情传闻</span></p><p><img alt=\"网红否认与李易峰恋情传闻\" src=\"/ueditor/php/upload/image/20190305/1551767232593580.png\" style=\"border: 0px none; vertical-align: middle; display: block; margin: 0px auto; max-width: 640px;\"/><span class=\"img_descr\" style=\"line-height: 20px; padding: 6px 0px; font-size: 16px; margin: 5px auto; display: inline-block; zoom: 1; text-align: left; font-weight: bold;\">网红否认与李易峰恋情传闻</span></p><p><a node-type=\"playArea\" style=\"outline: 0px; -webkit-tap-highlight-color: transparent; color: rgb(51, 51, 51); font-size: 14px; line-height: 22px; display: block; padding: 18px 0px; background: rgb(0, 0, 0);\"><img src=\"/ueditor/php/upload/image/20190305/1551767232585060.jpg\" style=\"border: 0px none; vertical-align: middle; width: 640px;\"/><span class=\"i-common i-play-b\" style=\"background-image: -webkit-image-set(url(&quot;//n.sinaimg.cn/finance/sinaPageWidgets2017/1105_zyc_video_icons.png&quot;) 1x, url(&quot;//n.sinaimg.cn/finance/sinaPageWidgets2017/1105_zyc_video_icons2x.png&quot;) 2x); position: absolute; width: 60px; height: 60px; background-position: -105px -107px; display: block; top: 150px; left: 290px;\"></span></a></p><p><a href=\"http://video.sina.com.cn/p/ent/2019-03-05/detail-ihrfqzkc1290877.d.html\" target=\"_blank\" style=\"text-decoration-line: none; outline: 0px; -webkit-tap-highlight-color: transparent; color: rgb(44, 163, 255); font-size: 20px; line-height: 22px;\">李易峰方否认与网红恋</a></p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%;\">　　新浪娱乐讯 3月5日凌晨，网红湾湾在微博发文否认与李易峰<a target=\"_blank\" href=\"http://weibo.com/1291477752?zw=ent\" class=\"wt_article_link\" style=\"text-decoration-line: none; outline: 0px; -webkit-tap-highlight-color: transparent; color: rgb(250, 83, 111);\">[微博]</a><a target=\"_blank\" href=\"http://weibo.com/1291477752?zw=ent\" class=\"wt_article_link\" style=\"text-decoration-line: none; outline: 0px; -webkit-tap-highlight-color: transparent; color: rgb(250, 83, 111);\">[微博]</a>的恋情传闻，称：“完全没有的事！”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近日，网曝李易峰与网红“Blase湾湾”同游苏梅岛，疑似恋情曝光。3月5日凌晨，女方在微博回复粉丝留言时对此进行了坚决否认，不仅严肃表示：“完全没有的事，我看到也一脸懵逼。”更是晒出了“否认三连”的表情包，称：“我没有，我不是，别瞎说！”</p><p style=\"margin-top: 0px; margin-bottom: 30px; padding: 0px; text-size-adjust: 100%;\"><br/></p><p><br/></p>', '新浪娱乐讯 3月5日凌晨，网红湾湾在微博发文否认与李易峰的恋情传闻，称：“完全没有的事！”', '1', '1', '15', '1551767293', '1551768794', '6', '0', '1');
INSERT INTO `gz_news` VALUES ('16', '外国卫星在广东兴宁机场发现4架轰6 距台仅450公里', '3', '/upload\\20190305\\1ca7802edf8a0dc5a9e98c5446f83136.jpg', '<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">[文/观察者网 童黎]</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　4日，以色列图像卫星国际公司ImageSat International（ISI）在社交媒体上传1日卫星图，称其数年来首次在广东兴宁机场发现（detected）4架轰6轰炸机，并说明此处离台湾海岸约450公里。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　不出意外，台媒对这一消息又开始“大惊小怪”了，并作出另一番解读。</p><p><img src=\"https://n.sinaimg.cn/mil/crawl/107/w550h357/20190305/aEu7-htwhfzs1793418.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　图自ISI</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　3月5日，《联合报》等多家岛内媒体称，ISI发布消息透露，中国大陆有4架轰6前推部署到了兴宁机场，这是数年来的第一次，且距离台湾仅有450公里。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　台湾绿媒“自由时报”在标题中声称，大陆“4架轰炸机首度进驻广东兴宁”，这与ISI谨慎地称其“数年来首次在兴宁机场发现4架轰6”存在出入。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　《联合报》还分析称，解放军出海训练的轰6，基本动作都是先自内陆机场转场到靠近海边的机场，整理和补充后再出海执行远海长途任务。近期多次经巴士海峡到菲律宾东边的轰6批次，应该就是自兴宁机场出发。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　台媒进一步猜测，兴宁机场本身有其他飞行部队驻防，轰6应该并非长期部署在此地。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　该报还提到，上月27日，台当局“国防部”曾发布解放军轰6信息称，“轰6型机下午由中国大陆广东沿海基地陆续出海，朝南海飞行后飞返驻地，进行例行性长航训练”。经研究判断，“广东沿海基地”可能就是兴宁机场。</p><p><img src=\"https://n.sinaimg.cn/mil/crawl/516/w327h189/20190305/9IvX-htwhfzs1793472.png\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　关于ISI公布的消息，台湾“国防部”尚未作出正式评论，但多家岛内媒体都强调此处“距台仅450公里”，还有的在标题中喊“惊！”</p><p><img src=\"https://n.sinaimg.cn/mil/crawl/594/w550h44/20190305/t1K1-htwhfzs1793541.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"https://n.sinaimg.cn/mil/crawl/590/w550h40/20190305/Neh5-htwhfzs1793611.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"https://n.sinaimg.cn/mil/crawl/590/w550h40/20190305/FGdC-htwhfzs1793723.jpg\" alt=\"\" style=\"margin: 0px auto; padding: 0px; border: 0px none; vertical-align: top; max-width: 640px; display: block;\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><ins class=\"sinaads sinaads-done\" id=\"Sinads49447\" data-ad-pdps=\"PDPS000000044089\" data-ad-status=\"done\" style=\"display: block; overflow: hidden; text-decoration-line: none;\"><ins style=\"text-decoration-line: none; margin: 0px auto; width: 300px; display: block; position: relative; overflow: hidden;\"><a href=\"http://saxn.sina.com.cn/dsp/click?t=MjAxOS0wMy0wNSAxNDo0NTo1OC43MzIJMTIxLjM1LjEwMS4xNzcJMTcyLjE2LjkyLjI3XzE1NTE3NjcxNzUuMzkzNzU1CWJhODVmODhiLTU4YmYtNDA3Yy04MDE4LTAxZWU5MjI5YmMyNQkzNDU1MTc2CTY5MTUxNjc2ODNfUElOUEFJLUNQQwkzMjAxMDM0CTk0NTAyCTAuMDAxMDk1MjQwMgkzCXRydWUJUERQUzAwMDAwMDA0NDA4OQkzOTc4ODYzCVBDCWltYWdlCS0JMHw3aHZOeXVoZExla1lFRnNoRWZPVVhMfG51bGx8bnVsbHxianwzNDU1MTc2fERRNFE0R0RSZ2M1bGpTTzVUYlU1WnwwfHx8fEN8fDB8bjE5Njg4XzFfMTEyNTgwfG5faHl8MC4wMjg0Nzc0fDF8MXwJCTEJLQktCS0JMAkxNzIuMTYuOTIuMjdfMTU1MTc2NzE3NS4zOTM3NTUJUENfSU1BR0UJLQlub3JtYWx8dXZmbS1ydAkJdXNlcl90YWc6MjA3Mzc6MC4wfHVzZXJfYWdlOjYwNDowLjB8dXNlcl9nZW5kZXI6NTAwOjAuMHx2X3pvbmU6MzA2MDAyOjAuMHxjcm93ZHM6fF9jcm93ZHM6CTAJMTAwMDAwCTUwMDAwCS0JCTAJCWFhMmY5MTE0LTEwOTktM2Y1OS1hMjM4LWQxMDg2YWJhNWNkYgkw&userid=172.16.92.27_1551767175.393755&auth=3d4be77e3fdf2cd4&p=Xl67P%2BlGOMez9RhHqpEEp6vZoPPLjskArsNO1w%3D%3D&url=http%3A%2F%2Fsaxn.sina.com.cn%2Fclick%3Fid%3D17%26t%3DNWU1ZWJiM2YtZTk0Ni0zOGM3LWIzZjUtMTg0N2FhOTEwNGE3CTE3CVBEUFMwMDAwMDAwNDQwODkJMzk3ODg2MwkxCVJUQgktCVY1LjAuMF9fX0JYXzEwLjEzLjIyNC4xMzIJCQlwcm92aW5jZTozMDYwMDB8Y2l0eTozMDYwMDJ8aXA6MTIxLjM1LjEwMS4xNzd8ZGV2aWNlaWQ6fGNvb2tpZToxNzIuMTYuOTIuMjdfMTU1MTc2NzE3NS4zOTM3NTV8ZGlkOnxwbGF0OnBjfHRzOjE1NTE3NjgzNTh8dGY6MHxkeW5hbWljYWQ6fG9yaWdpbmlwOjEwLjEzLjIyNC4xMzJ8dHJhZmZpYzpwb3J0YWx8cGRjb250cmFjdDotfHBkZGV0YWlsaWQ6LXxwcm9kdWN0aWQ6LXxwZHBhY2thZ2VpZDotCWFhMmY5MTE0LTEwOTktM2Y1OS1hMjM4LWQxMDg2YWJhNWNkYg%253D%253D%26type%3D2%26url%3Dhttp%253A%252F%252Fsg.shwatch.cn%252Fmobile%252FSH2019_Y_0225.php%253Fid%253DXFY02-syjm%2526SET_A%253DPDPS000000044089%2526SET_B%253D3455176%2526SET_C%253D3978863%2526SET_D%253Dba85f88b-58bf-407c-8018-01ee9229bc25%2526SET_E%253D3201034%2526SET_F%253D1%26sina_sign%3Dd03d7642ab3adc65&sign=91d740414ae83ef1\" target=\"_blank\" data-ss=\"1fe38ea414047d19=ngis&amp;56cda3ba2467d30dD3%ngis_anis62%1D352%F_TES6252%4301023D352%E_TES6252%52cb9229ee10-8108-c704-fb85-b88f58abD352%D_TES6252%3688793D352%C_TES6252%6715543D352%B_TES6252%980440000000SPDPD352%A_TES6252%mjys-20YFXD352%diF352%php.5220_Y_9102HSF252%elibomF252%nc.hctawhs.gsF252%F252%A352%ptthD3%lru62%2D3%epyt62%D352%D352%gYkNWNhJWY2gDMxQWL4MjMh1SO1Y2MtkTOwETL0ETM5YmMhFWCtoDZpV2Zht2YhBHZwxXL6QWa0NWdk9mcwxXL6QWaslWY0VGZkBHftoDdjFmc052bjRGc8xWY0J3bwpzYpZmZhJHd8JzMx4CNyIjLzEjLwEjOwlmbpdWay9Gf6QWYjlWbh5WekxHM6YGd8hTNzgjN3ETN1EjOzRHfjBnO0FGbwxnOklGZ8VTN3MTOz4SN3EzN2cTM1UTMfdjMuITOuYTMuIzNxoTZpt2bvNGf6QWalNWa2VGZ8dzNx4SMwEjL1MjLxITM6AXa8JDMwYDMzoTe0l2Y8BDMwYDMzoTZj5Wa29mcwlQCJIzMx4CNyIjLzEjLwEzXYJ0Xf9FMuAjL1YVCtkgQUJVCxkwM2gDO3kzMJkDOwQDNwADMwADMwMFUEBVC3ETC3EGNwETOhF2N0gTMtUjZzIWL3MGOz0iN0kTZtY2MiJWZ1UWND3%t62%71D3%diF3%kcilcF2%nc.moc.anis.nxasF2%F2%A3%ptth=lru&amp;D3%D3%w1ONsrAksjLPPoZv6pEEpqHhR9zeMOGlB2%P76lX=p&amp;4dc2fdf3e77eb4d3=htua&amp;557393.5717671551_72.29.61.271=diresu&amp;wkgYkNWNhJWY2gDMxQWL4MjMh1SO1Y2MtkTOwETL0ETM5YmMhFWCJATCJ0SCwADMwUTCwADMwATMJATC6MHZ39mcj9Ff6MHZ39mcjxHMuAjOyADM2AzM6Umbvp3X2xHMuAjOwATN6IXZk5WZn9lclNXd8BjLwoDNwYjOldWYfJXZzVHfw4CM6czM3AjM6cWY09lclNXdJkAdy1SbmZXd8xWYtJ3bulQLJU0RB1USfNEUJUTN3MTOz4SN3EzN2cTM1UTMfdjMuITOuYTMuIzNxkAMJ0SCtkQLJETCJwXM8FDf0czN0gjMw4CM8lHaf5GfwgTNyETMfFzX4gjN5Ejb8BDf8NEf8xHfwwnW1UlYUVzTTpGb1M2ZSR0R0EFNRREf2cTM1UDNzwnaixHbsVnb8xGb15GfMhVVPZWRoNnRFl1alxEZoVXeOZHa3wHMJ0SCldWYtlWCDBVCzYDO4cTOzkQO4ADN0ADMwADMwAzUQREUJUWdyRXCzkgMwQjM1kDMxADMuATCyATN0kTC0MDMxAjMzkwQQNULJFEUOlEUfNDO2cjNxUTM5YTC2cTM1UDNzkQNyMmY5IjM5UWZxATL4EDM40yY3ADNtYmY4UTLihDOmVDOhJWC1UzNzkzMuUzNxcjN3ETN1EzX3IjLykjL2EjLycTMJczNx4SMwEjL1MjLxITMJIzM34CO1oTN0oDNxASNw0yMw0SOxAjM=t?kcilc/psd/nc.moc.anis.nxas//:ptth\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(51, 51, 51); outline: none; display: block; line-height: 0;\"></a></ins></ins></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　台媒截图</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　针对这一让台媒大呼“惊讶”的消息，观察者网军事评论员席亚洲表示，轰6航程达9000公里，打哪里都没问题，航程如此远的轰炸机部署到这个基地，恰恰表明并非“剑指”台湾，而是为在南海进行远海巡航考虑，否则它会部署在更深远的地区。只能说一些岛内媒体有“被害妄想症”，认为任何部署都针对台湾。</p><p><br/></p>', '4日，以色列图像卫星国际公司ImageSat International（ISI）在社交媒体上传1日卫星图，称其数年来首次在广东兴宁机场发现（detected）4架轰6轰炸机，并说明此处离台湾海岸约450公里。', '0', '1', '0', '1551768430', '1551768791', '9', '0', '1');
INSERT INTO `gz_news` VALUES ('17', ' ESPN推出最新一期的球队实力榜', '4', '/upload\\20190305\\98fb430ebd32d8884f74e6b566905c5e.png', '<p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">腾讯体育3月5日讯（文/ESPN新闻网） ESPN推出最新一期的球队实力榜，雄鹿、勇士、猛龙和掘金仍然排名前四位，火箭升至第六，湖人则下降到第18。以下是本期实力榜的具体情况（括号内为当前战绩）——</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://inews.gtimg.com/newsapp_bt/0/7980900964/641\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle; max-width: 640px; display: block;\"/></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">1、雄鹿（48胜15负），上期排名：1</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">当遭遇伤病袭击的雄鹿在客场挑战爵士时，主教练布登霍尔泽派出了一套奇葩首发阵容——4名球员的身高达到6英尺10英寸，这是联盟自2003年以来的最高首发阵容。尽管雄鹿打出了11-0的开局，但米切尔砍下46分带领爵士胜出，他认为雄鹿的怪阵缺乏速度。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">2、勇士（44胜19负），上期排名：2</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">尽管勇士在过去3场比赛中输了2场，但是他们21胜11负的客场战绩仍然是西部最佳的，并且是西部联盟中唯一客场赢球场次超过18场的球队。勇士已经连续6个赛季的客场胜率超过50%，在最近6个赛季之前，他们队史上总共只有7个赛季的客场胜率超过50%。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">3、猛龙（46胜18负），上期排名：3</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">本赛季的猛龙一直是一支危险的球队，他们的新援让他们变得更加危险。在本赛季的大部分时间里，人们都在思考这个问题：这支重组的球队是否有足够的时间来充分发挥他们的潜力？答案显然是积极的，无论是小加索尔还是伊巴卡打中锋。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">4、掘金（42胜20负），上期排名：4</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">在上周日负于鹈鹕的比赛中，掘金的首发阵容是穆雷、哈里斯、巴顿、米尔萨普和约基奇，这是他们在赛季初的首选首发阵容。目前掘金排名西部第二，领先第三雷霆3.5个胜场，在本赛季剩余20场常规赛中，他们有时间和机会来磨合这套首发阵容。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">5、开拓者（39胜24负），上期排名：6</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">6、火箭（38胜25负），上期排名：7</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">在本赛季保罗送出10+次助攻的比赛里，火箭的战绩是12胜0负。在火箭目前这波五连胜中，保罗有3场送出10+次助攻，期间他场均还能贡献17.8分。保罗的侵略性减轻了哈登的负担，但哈登依然打出了疯狂的表现，他在复出后的4场比赛中场均能拿到39.5分。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">排名第7-17位的球队依次是：76人、雷霆、爵士、步行者、马刺、快船、凯尔特人、活塞、篮网、国王、魔术。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong style=\"margin: 0px; padding: 0px;\">18、湖人（30胜33负），上期排名：14</strong></p><p style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">湖人经常发表“赢球声明”，但是他们在上周日发出的声明是——输给在西部垫底的太阳。</p><p class=\"text\" style=\"margin-top: 0px; margin-bottom: 28px; padding: 0px; overflow-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">排名第19-30位的球队依次是：森林狼、热火、黄蜂、鹈鹕、奇才、独行侠、公牛、老鹰、灰熊、骑士、太阳、尼克斯。</p><p><br/></p>', '腾讯体育3月5日讯（文/ESPN新闻网） ESPN推出最新一期的球队实力榜，雄鹿、勇士、猛龙和掘金仍然排名前四位，火箭升至第六，湖人则下降到第18。', '1', '1', '30', '1551775917', '1551775931', '105', '0', '1');
INSERT INTO `gz_news` VALUES ('18', '石家庄将打造正定鹿泉平山旅游“金三角”', '6', '/upload\\20190306\\c4be962823afcf1f1cf7c0a18c978340.jpg', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; color: rgb(17, 17, 17); font-family: Verdana, Simsun, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal;\">日前，石家庄市政府办公室下发了《关于印发关于加强省会开放引领重点工作责任分解方案的通知》，未来该市将打造正定、鹿泉、平山旅游金三角，提高旅游业示范带动作用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; color: rgb(17, 17, 17); font-family: Verdana, Simsun, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal;\">　　据了解，未来，石家庄市将提升文化旅游领域国际化服务功能。突出文化特色，体现文化品位，新建石家庄市博物馆、石家庄市图书馆，谋划建设美术馆和大剧院等一批文化基础设施。加强与“一带一路”沿线国家在影视、传媒、戏剧等文化领域的合作，搭建多元化文件交流平台。推出更多省会特色文化品牌，充分利用国家对外文化交流项目以及河北文化周、河北文化月等宣介平台向外宣传推广石家庄。提升历史文化游、科技动感游、休闲生态游的国际影响力和吸引力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; color: rgb(17, 17, 17); font-family: Verdana, Simsun, Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal;\">　　石家庄市还将提高旅游业示范带动作用。创建省级全域旅游示范区，推动石家庄市旅游业全区域、全要素、全产业链发展。高质量持续举办文化和旅游产业发展大会，推动旅游项目建设，完善旅游产品供给，优化旅游发展环境。促进旅游与相关产业深度融合，在互动共生中发展旅游新业态，拓展旅游业发展空间。彰显地域文化特色，精心培育“古城古韵、自在正定”“绿水青山、多彩鹿泉”“金山银山、看看平山”等县域旅游品牌，打造石家庄旅游金三角。以省第四届文旅大会在石家庄市举办为契机，将旅游金三角的影响力和辐射面扩大延展到西部山区，提升旅游产业综合带动力，积极拓展旅游市场，加大休闲度假旅游产品开发打造力度，着力提升景区服务水平和承载能力，吸引域外游客自助休闲旅游。(记者 祁鹏娜)</p><p><br/></p>', '日前，石家庄市政府办公室下发了《关于印发关于加强省会开放引领重点工作责任分解方案的通知》，未来该市将打造正定、鹿泉、平山旅游金三角，提高旅游业示范带动作用。', '1', '1', '0', '1551852638', '1551852648', '6', '0', '1');

-- ----------------------------
-- Table structure for gz_user
-- ----------------------------
DROP TABLE IF EXISTS `gz_user`;
CREATE TABLE `gz_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '用户头像',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_user
-- ----------------------------
INSERT INTO `gz_user` VALUES ('1', 'cshu', 'e10adc3949ba59abbe56e057f20f883e', '\\20190305\\43afa97936cf6fb192ad8c53fed9bfca.jpg', '1504635742');
INSERT INTO `gz_user` VALUES ('2', 'wali', '15da5b87fbda7ab1a95e471a1247abce', '\\20190305\\43afa97936cf6fb192ad8c53fed9bfca.jpg', '1504635742');
INSERT INTO `gz_user` VALUES ('10', 'xuer', 'e10adc3949ba59abbe56e057f20f883e', '\\20190305\\43afa97936cf6fb192ad8c53fed9bfca.jpg', '1536633657');

-- ----------------------------
-- Table structure for gz_user_news
-- ----------------------------
DROP TABLE IF EXISTS `gz_user_news`;
CREATE TABLE `gz_user_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建新闻的用户id',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建新闻的id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建新闻的时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gz_user_news
-- ----------------------------
INSERT INTO `gz_user_news` VALUES ('1', '1', '5', '1505027446');
INSERT INTO `gz_user_news` VALUES ('2', '1', '4', '1505027779');
