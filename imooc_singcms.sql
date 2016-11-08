/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : imooc_singcms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-11-07 18:00:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `admin_id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `lastloginip` varchar(15) DEFAULT '0',
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`admin_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` VALUES ('1', 'admin', 'd099d126030d3207ba102efa8e60630a', '0', '1477727915', 'tracywxh0830@126.com', 'singwa', '1');
INSERT INTO `cms_admin` VALUES ('2', 'singwa', 'a8ea3a23aa715c8772dd5b4a981ba6f4', '0', '1458139801', '', '王新华', '-1');
INSERT INTO `cms_admin` VALUES ('3', 'singwa', 'a8ea3a23aa715c8772dd5b4a981ba6f4', '0', '0', '', '', '-1');
INSERT INTO `cms_admin` VALUES ('4', 'singwa3', '79d4026540fdd95e4a0b627c77e6fa44', '0', '1458144621', '', 'singwa', '0');
INSERT INTO `cms_admin` VALUES ('5', 'singwa', '5ec68e6f496115b92ba5662a35922611', '0', '0', '', '1', '-1');
INSERT INTO `cms_admin` VALUES ('6', 'singwa222', '6f071d49b5122a7352d8f2cc21680079', '0', '0', '', 'singwa', '-1');
INSERT INTO `cms_admin` VALUES ('7', 'singwa222', '5ec68e6f496115b92ba5662a35922611', '0', '0', '', '1', '-1');
INSERT INTO `cms_admin` VALUES ('8', 'singwa123', '204c93175e725ca51d28633055536e09', '0', '1458485298', 'singcms@singwa.com', 'singcms123', '1');
INSERT INTO `cms_admin` VALUES ('9', 'Mediter', '4a52fdd649e85659fb4635b0cf96cb1e', '0', '1477723827', 'abc@abc.com', '常鹏飞', '1');

-- ----------------------------
-- Table structure for `cms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) NOT NULL DEFAULT '',
  `f` varchar(20) NOT NULL DEFAULT '',
  `data` varchar(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`f`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '菜单管理', '0', 'admin', 'menu', 'index', '', '10', '1', '1');
INSERT INTO `cms_menu` VALUES ('2', '文章管理', '0', 'admin', 'Content', 'index', '', '0', '-1', '1');
INSERT INTO `cms_menu` VALUES ('3', '体育', '0', 'home', 'cat', 'index', '', '3', '1', '0');
INSERT INTO `cms_menu` VALUES ('4', '科技', '0', 'home', 'cat ', 'index', '', '0', '-1', '0');
INSERT INTO `cms_menu` VALUES ('5', '汽车', '0', 'home', 'cat', 'index', '', '0', '-1', '0');
INSERT INTO `cms_menu` VALUES ('6', '文章管理', '0', 'admin', 'content', 'index', '', '9', '1', '1');
INSERT INTO `cms_menu` VALUES ('7', '用户管理', '0', 'admin', 'user', 'index', '', '0', '-1', '1');
INSERT INTO `cms_menu` VALUES ('8', '科技', '0', 'home', 'cat', 'index', '', '2', '1', '0');
INSERT INTO `cms_menu` VALUES ('9', '推荐位管理', '0', 'admin', 'position', 'index', '', '4', '1', '1');
INSERT INTO `cms_menu` VALUES ('10', '推荐位内容管理', '0', 'admin', 'positioncontent', 'index', '', '1', '1', '1');
INSERT INTO `cms_menu` VALUES ('11', '基本管理', '0', 'admin', 'basic', 'index', '', '12', '1', '1');
INSERT INTO `cms_menu` VALUES ('12', '新闻', '0', 'home', 'cat', 'index', '', '0', '-1', '0');
INSERT INTO `cms_menu` VALUES ('13', '用户管理', '0', 'admin', 'admin', 'index', '', '0', '-1', '1');
INSERT INTO `cms_menu` VALUES ('14', 'sss', '0', 'aaa', 'bbb', 'ccc', '', '0', '-1', '1');
INSERT INTO `cms_menu` VALUES ('15', '用户管理', '0', 'admin', 'admin', 'index', '', '0', '1', '1');

-- ----------------------------
-- Table structure for `cms_news`
-- ----------------------------
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `news_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(80) NOT NULL DEFAULT '',
  `small_title` varchar(30) NOT NULL DEFAULT '',
  `title_font_color` varchar(250) DEFAULT NULL COMMENT '标题颜色',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL COMMENT '文章描述',
  `posids` varchar(250) NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `copyfrom` varchar(250) DEFAULT NULL COMMENT '来源',
  `username` char(20) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `status` (`status`,`listorder`,`news_id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`news_id`),
  KEY `catid` (`catid`,`status`,`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news
-- ----------------------------
INSERT INTO `cms_news` VALUES ('17', '3', 'test', 'test', '#5674ed', '/upload/2016/03/06/56dbdc0c483af.JPG', 'sss', 'sss', '', '1', '-1', '0', 'admin', '1455756856', '0', '0');
INSERT INTO `cms_news` VALUES ('18', '3', '你好ssss', '你好', '#ed568b', '/upload/2016/03/06/56dbdc015e662.JPG', '你好', '你好sssss  ss', '', '2', '-1', '3', 'admin', '1455756999', '0', '0');
INSERT INTO `cms_news` VALUES ('19', '8', '1', '11', '#5674ed', '/upload/2016/02/28/56d312b12ccec.png', '1', '1', '', '0', '-1', '0', 'admin', '1456673467', '0', '0');
INSERT INTO `cms_news` VALUES ('20', '3', '事实上', '11', '', '/upload/2016/02/28/56d3185781237.png', '1', '11', '', '0', '-1', '0', 'admin', '1456674909', '0', '0');
INSERT INTO `cms_news` VALUES ('21', '3', '222222习近平今日下午出席解放军代表团全体会议', '习近平出席解放军代表团全体会议', '#5674ed', '/upload/2016/10/27/5811c54a0a4e2.jpg', '中共中央总书记 国家主席 中央军委主席 习近平', '中共中央总书记', '', '2', '1', '1', 'admin', '1457854896', '0', '75');
INSERT INTO `cms_news` VALUES ('22', '8', '李克强让部长们当第一新闻发言人', '李克强让部长们当第一新闻发言人', '#5674ed', '/upload/2016/10/27/5811c53699984.jpg', '李克强  新闻发言人', '部长直接面对媒体回应关切，还能直接读到民情民生民意，而不是看别人的舆情汇报。', '', '0', '1', '0', 'admin', '1457855362', '0', '35');
INSERT INTO `cms_news` VALUES ('23', '3', '重庆美女球迷争芳斗艳', '重庆美女球迷争芳斗艳', '#5674ed', '/upload/2016/10/27/5811c5b21b34d.png', '重庆美女 球迷 争芳斗艳', '重庆美女球迷争芳斗艳', '', '0', '1', '0', 'admin', '1457855680', '0', '34');
INSERT INTO `cms_news` VALUES ('24', '3', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '#ed568d', '/upload/2016/10/27/5811c555dbfe8.jpg', '中超 汪嵩世界波  富力客场 1-0力擒泰达', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '', '1', '1', '0', 'admin', '1457856460', '0', '27');
INSERT INTO `cms_news` VALUES ('25', '3', ' 法师', '啊啊啊', '#5674ed', '', '地方萨芬', '嗷嗷啊', '', '0', '-1', '0', 'admin', '1476345171', '0', '0');
INSERT INTO `cms_news` VALUES ('26', '3', 'aaa', 'bbb', '#ed568d', '', 'eee', 'ddd', '', '0', '-1', '0', 'admin', '1476349186', '0', '0');
INSERT INTO `cms_news` VALUES ('29', '3', '2333车联网“红海”是玩家们的假象', '红海是假象23333', '#5674ed', '/upload/2016/10/17/580469526a3f3.jpg', '车联网2333', '每一辆车都要有一个唯一可识别标识23333', '', '11', '1', '3', 'admin', '1476670937', '0', '16');
INSERT INTO `cms_news` VALUES ('30', '3', '111', '222', '', '', '666', '444', '', '0', '-1', '0', 'admin', '1476685415', '0', '0');
INSERT INTO `cms_news` VALUES ('11', '4', '333', '444', '555', '666', '777', '888', '999', '0', '1', null, 'admin', '0', '0', '0');

-- ----------------------------
-- Table structure for `cms_news_content`
-- ----------------------------
DROP TABLE IF EXISTS `cms_news_content`;
CREATE TABLE `cms_news_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` mediumint(8) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news_content
-- ----------------------------
INSERT INTO `cms_news_content` VALUES ('7', '17', '&lt;p&gt;\r\n	gsdggsgsgsgsg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	sgsg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gsdgsg \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	       ggg\r\n&lt;/p&gt;', '1455756856', '0');
INSERT INTO `cms_news_content` VALUES ('8', '18', '&lt;p&gt;\r\n	你好\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	我很好dsggfg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gsgfgdfgd\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gggg\r\n&lt;/p&gt;', '1455756999', '0');
INSERT INTO `cms_news_content` VALUES ('9', '19', '111', '1456673467', '0');
INSERT INTO `cms_news_content` VALUES ('10', '20', '111', '1456674909', '0');
INSERT INTO `cms_news_content` VALUES ('11', '21', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;line-height:32px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 3月13日下午，中共中央总书记、国家主席、中央军委主席习近平出席十二届全国人大四次会议解放军代表团全体会议，并发表重要讲话。&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/10/29/5814612448947.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;', '1457854896', '1477730665');
INSERT INTO `cms_news_content` VALUES ('12', '22', '&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; “部长通道”是今年两会一大亮点，成为两会开放透明和善待媒体的一个象征。在这个通道上，以往记者拉着喊着部长接受采访的场景不见了，变为部长主动站出来回应关切，甚至变成部长排队10多分钟等着接受采访。媒体报道称，两会前李克强总理接连两次“发话”，要求各部委主要负责人“要积极回应舆论关切”。部长主动放料，使这个通道上传出了很多新闻，如交通部长对拥堵费传闻的回应，人社部部长称网传延迟退休时间表属误读等。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;/upload/2016/10/27/5811c5d45d5b2.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 记者之所以喜欢跑两会，原因之一是两会上高官云集，能“堵”到、“逮”到、“抢”到很多大新闻——现在不需要堵、逮和抢，部长们主动曝料，打通了各种阻隔，树立了开明开放的政府形象。期待“部长通道”不只在两会期间存在，最好能成为一种官媒交流、官民沟通的常态化新闻通道。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&lt;span style=&quot;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;line-height:32px;&quot;&gt;部长们多面对媒体多发言，不仅能提高自身的媒介素养，也带动部门新闻发言人，更加重视与媒体沟通。部长直接面对媒体回应关切，还能直接读到民情民生民意，而不是看别人的舆情汇报。&lt;/span&gt; \r\n&lt;/p&gt;', '1457855362', '1477559766');
INSERT INTO `cms_news_content` VALUES ('13', '23', '&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:\'Microsoft Yahei\', 微软雅黑, SimSun, 宋体, \'Arial Narrow\', serif;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 2016年3月13日，2016年中超联赛第2轮：重庆力帆vs河南建业，主场美女球迷争芳斗艳。&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:\'Microsoft Yahei\', 微软雅黑, SimSun, 宋体, \'Arial Narrow\', serif;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt;&lt;img src=&quot;/upload/2016/10/27/5811c5ac05710.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;', '1457855680', '1477559737');
INSERT INTO `cms_news_content` VALUES ('14', '24', '&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/10/27/5811c57197f56.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	新浪体育讯　　北京时间2016年3月12日晚7点35分，2016年中超联赛第2轮的一场比赛在天津水滴体育场进行。由天津泰达主场对阵广州富力。上半场双方机会都不多，&lt;strong&gt;下半场第57分钟，常飞亚左路护住皮球回做，汪嵩迎球直接远射世界波破门。随后天津泰达尽管全力进攻，但伊万诺维奇和迪亚涅都浪费了近在咫尺的机会&lt;/strong&gt;，最终不得不0-1主场告负。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	由于首轮中超对阵北京国安的比赛延期举行，因此本场比赛实际上是天津泰达本赛季的首次亮相。新援蒙特罗领衔锋线，两名外援中后卫均首发出场。另一方面，在首轮主场不敌中超新贵河北华夏之后，本赛季球员流失较多的广州富力也许不得不早早开始他们的保级谋划。本场陈志钊红牌停赛，澳大利亚外援吉安努顶替了上轮首发的肖智。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	广州富力显然更快地适应了比赛节奏。第3分钟，吉安努前插领球大步杀入禁区形成单刀，回防的赞纳迪内果断放铲化解险情。第8分钟，雷纳尔迪尼奥左路踩单车过人后低平球传中，约万诺维奇伸出大长腿将球挡出底线。第14分钟，富力队左路传中到远点，聂涛头球解围险些失误，送出本场比赛第一个角球。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	天津队中场的配合逐渐找到一些感觉。第23分钟，天津队通过一连串小配合打到左路，周海滨下底传中被挡出底线。角球被富力队顶出后天津队二次将球传到禁区前沿，蒙特罗转身后射门但软弱无力被程月磊得到。第27分钟，约万诺维奇断球后直塞蒙特罗，蒙特罗转身晃开后卫在禁区外大力轰门打高。第29分钟，瓦格纳任意球吊入禁区，程月磊出击失误没有击到球，天津队后点将球再次传中，姜至鹏在对方夹击下奋力将球顶出底线。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	双方都没有太好的打开僵局的办法，开始陷入苦战。第33分钟，常飞亚左路晃开空档突然起脚，皮球擦着近门柱稍稍偏出底线。第43分钟，白岳峰被雷纳尔迪尼奥断球得手，后者利用速度甩开约万诺维奇，低平球传中又躲过了赞纳迪内的滑铲，但吉安努门前近在咫尺的推射被杨启鹏神奇地单腿挡出！双方半场只得0-0互交白卷。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	中场休息双方都没有换人。第47分钟，蒙特罗前场扣过多名对方队员后将球交给周海滨，但周海滨传中时禁区内的胡人天越位在先。第51分钟，王嘉楠右路晃开聂涛下底，但传中球又高又远。第54分钟，雷纳尔迪尼奥中场拿球挑过李本舰，后者无奈将其放倒吃到黄牌。第57分钟，常飞亚左路护住皮球回做，汪嵩迎球直接远射，杨启鹏鞭长莫及，皮球呼啸着直挂远角！世界波！富力队客场1-0取得领先。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	第62分钟，瓦格纳任意球吊到禁区，程月磊再次拿球脱手，幸亏张耀坤将球踢出了边线。天津队率先做出调整，迪亚涅和周通两名前锋登场换下郭皓和瓦格纳。第64分钟，天津队右路传中，周通禁区内甩头攻门，程月磊侧扑将球得到。富力队并未保守。第66分钟，常飞亚左路连续盘带杀入禁区，小角度射门打偏。不过一分钟，雷纳尔迪尼奥禁区右角远射，皮球在门前反弹后稍稍偏出。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	第71分钟，吉安努禁区角上回做，常飞亚跟进远射，杨启鹏单掌将球托出。天津队马上打出反击，蒙特罗禁区内转身将球分到右路，胡人天的传中找到后排插上的周海滨，但后者的大力头球顶得太正被程月磊侯个正着。富力队肖智换下卢琳。第74分钟，迪亚涅依靠强壮的身体杀入禁区直塞，蒙特罗停球后射门被密集防守的后卫挡出。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	于洋换下雷纳尔迪尼奥，富力队加强防守。第81分钟，天津队角球开出，迪亚涅甩头攻门顶偏。天津队连续得到角球机会。第85分钟，天津队角球二次进攻，周通传中，蒙特罗后点头球回做，约万诺维奇离门不到两米处转身扫射竟然将球踢飞！\r\n&lt;/p&gt;\r\n&lt;div id=&quot;ad_33&quot; class=&quot;otherContent_01&quot; style=&quot;margin:10px 20px 10px 0px;padding:4px;&quot;&gt;\r\n	&lt;iframe width=&quot;300px&quot; height=&quot;250px&quot; frameborder=&quot;0&quot; src=&quot;http://img.adbox.sina.com.cn/ad/28543.html&quot;&gt;\r\n	&lt;/iframe&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;\r\n	天津队范柏群换下李本舰。富力队用宁安换下常飞亚。第88分钟，胡人天战术犯规吃到黄牌。天津队久攻不下，第90分钟，赞纳迪内40米开外远射打偏。第93分钟，蒙特罗左路传中，迪亚涅头球争顶下来之后顺势扫射，皮球贴着横梁高出。广州富力最终将优势保持到了终场取得三分。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	进球信息：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	天津泰达：无。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	广州富力：第58分钟，卢琳左路回做，汪嵩跟上远射破网。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	黄牌信息：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	天津泰达：第54分钟，李本舰。第88分钟，胡人天。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	广州富力：无。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	红牌信息：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	无。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	双方出场阵容：\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	天津泰达（4-5-1）：29-杨启鹏，23-聂涛、3-赞纳迪内、5-约万诺维奇、19-白岳峰，6-周海滨、7-李本舰（86分钟，28-范柏群）、8-胡人天、11-瓦格纳（63分钟，9-迪亚涅）、22-郭皓（63分钟，33-周通），10-蒙特罗；\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	广州富力（4-5-1）：1-程月磊，11-姜至鹏、5-张耀坤、22-张贤秀、28-王嘉楠，7-斯文森、21-常飞亚（88分钟，15-宁安）、23-卢琳（73分钟，29-肖智）、31-雷纳尔迪尼奥（77分钟，3-于洋）、33-汪嵩，9-吉安努。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	（卢小挠）\r\n&lt;/p&gt;\r\n&lt;div&gt;\r\n&lt;/div&gt;\r\n&lt;div style=&quot;font-size:0px;&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', '1457856460', '1477559671');
INSERT INTO `cms_news_content` VALUES ('15', '25', '&lt;p&gt;\r\n	服务而非撒热敷法萨芬\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	法师打发的撒\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	发的萨芬\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	法师打发的撒\r\n&lt;/p&gt;', '1476345171', '0');
INSERT INTO `cms_news_content` VALUES ('16', '26', 'ccc', '1476349186', '0');
INSERT INTO `cms_news_content` VALUES ('17', '29', '&lt;p style=&quot;font-family:&amp;quot;font-size:18px;vertical-align:baseline;color:#565656;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;span style=&quot;font-family:&amp;quot;&quot;&gt;巴金的《海上日出》，想必大家都不陌生。由于文字生动、形象，就仿佛自己身临其境一般。其中有一段文字：有时太阳走入云里，它的光线却仍从云里透射下来，直射到水面上。这时候，人要分辨出何处是水，何处是天，很不容易，因为只能够看见光亮的一片。可以想象，蔚蓝的大海在红色朝阳的照耀下，如同一片红海。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;曾经的车联网“红海”错觉&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	早在2012年前，大部分人都认为物联网过热，作为物联网产业分支之一的车联网也因此屡被诟病。然而，若看清物联网过热的真实原因，便可发现或许与《海上日出》的这一景象有几多相似之处。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/10/17/580435b8bc8b3.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	车联网一词自2010年被提出伊始，概念、论坛、专家言论不断充斥着人们的视觉、听觉和触觉，引得企业蜂拥而上。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	在某一个车联网论坛上，曾出现了这样一个有趣的争论：做平台软件的说自己是车联网公司，因为所有的应用都要在他们的平台上进行部署；做导航的也认为自己是车联网的核心企业，因为导航是全球卫星定位，可以实时看到车辆的位置；做车载电子产品认为他们才是车联网的最重要组成部分，因为没有电子终端，任何应用都无法到达用户。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	不仅如此，做软件的已经开始在硬件领域寻找战略合作伙伴；做导航的也在搜罗或开发更多的应用软件；做电子产品的也开始开发软件平台。而且，在做的同时唯求一个字就是“快”：“管它产品好不好，先要在车联网领域占据一席之地”；“产品不好，日后还可以再改，如果不能快速进入产业，未来可能连竞争的机会都没有了”。因而，争相在最短的时间内拿出车联网产品。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	置身其中，车联网似乎成了周一早上的地铁，整车厂商、电子厂商、软件厂商或举着，或抱着，或扛着自己没有远见、不够完善、仓促完工的产品往这趟列车上挤。一时间，车联网产业乱象丛生，业界感觉车联网行业的企业已经厮杀成一片，恍惚车联网的红海已经到来。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	然而，殊不知，置身其外远观，车联网行业实则是“乱花渐欲迷人眼，浅草才能没马蹄”。这趟列车才刚刚进站，各厂商有的是时间整理好自己的理念和产品，按照一定的规则和标准，排好队，优雅地上车。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	待到有一天，车联网行业的标准与潜规则已定，产业链各个环节的产品已经成熟，每个环节上供应商已经相对固定，各种产品的价格不再有大的起伏，利润微薄甚至负利，新的竞争者很难再进入，那时才是真正的红海。而今天的厮杀只是蓝海上的日出，是从业者的错觉，是人们无意识间制造的假象。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', '1476670937', '1476684562');
INSERT INTO `cms_news_content` VALUES ('18', '30', '333', '1476685415', '0');

-- ----------------------------
-- Table structure for `cms_position`
-- ----------------------------
DROP TABLE IF EXISTS `cms_position`;
CREATE TABLE `cms_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `description` char(100) DEFAULT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_position
-- ----------------------------
INSERT INTO `cms_position` VALUES ('1', '首页大图', '-1', '展示首页大图的推荐位1', '1455634352', '0');
INSERT INTO `cms_position` VALUES ('2', '首页大图', '1', '展示首页大图的', '1455634715', '0');
INSERT INTO `cms_position` VALUES ('3', '小图推荐', '1', '小图推荐位', '1456665873', '0');
INSERT INTO `cms_position` VALUES ('4', '首页后侧推荐位', '-1', '', '1457248469', '0');
INSERT INTO `cms_position` VALUES ('5', '右侧广告位', '1', '右侧广告位', '1457873143', '0');

-- ----------------------------
-- Table structure for `cms_position_content`
-- ----------------------------
DROP TABLE IF EXISTS `cms_position_content`;
CREATE TABLE `cms_position_content` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(5) unsigned NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL,
  `news_id` mediumint(8) unsigned NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_position_content
-- ----------------------------
INSERT INTO `cms_position_content` VALUES ('28', '2', '习近平今日下午出席解放军代表团全体会议', '/upload/2016/03/13/56e519a185c93.png', null, '21', '0', '1', '1457854896', '0');
INSERT INTO `cms_position_content` VALUES ('27', '2', '文章18测试sss', '/upload/2016/03/07/56dcc0158f70e.JPG', '', '18', '0', '-1', '1457306930', '0');
INSERT INTO `cms_position_content` VALUES ('26', '2', 'ss', '/upload/2016/03/07/56dcbce02cab9.JPG', 'http://sina.com.cn', '0', '0', '-1', '1457306890', '0');
INSERT INTO `cms_position_content` VALUES ('25', '3', 'test', '/upload/2016/03/06/56dbdc0c483af.JPG', null, '17', '0', '-1', '1455756856', '0');
INSERT INTO `cms_position_content` VALUES ('23', '2', 'test', '/upload/2016/03/06/56dbdc0c483af.JPG', null, '17', '1', '-1', '1455756856', '0');
INSERT INTO `cms_position_content` VALUES ('24', '2', '你好ssss', '/upload/2016/03/06/56dbdc015e662.JPG', null, '18', '2', '-1', '1455756999', '0');
INSERT INTO `cms_position_content` VALUES ('29', '3', '李克强让部长们当第一新闻发言人', '/upload/2016/10/27/5811bb76bcf75.jpg', '', '22', '12', '1', '1457855362', '0');
INSERT INTO `cms_position_content` VALUES ('30', '3', '重庆美女球迷争芳斗艳', '/upload/2016/10/26/58107540484f4.jpg', '', '23', '13', '1', '1457855680', '0');
INSERT INTO `cms_position_content` VALUES ('31', '3', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '/upload/2016/10/26/581075247efc6.jpg', '', '24', '5', '1', '1457856460', '0');
INSERT INTO `cms_position_content` VALUES ('32', '5', '2015劳伦斯国际体坛精彩瞬间', '/upload/2016/10/27/5811c9364ef2c.jpg', 'http://sports.sina.com.cn/laureus/moment2015/', '0', '7', '1', '1457873220', '0');
INSERT INTO `cms_position_content` VALUES ('33', '5', 'singwa老师教您如何学PHP', '/upload/2016/10/27/5811c9605f024.jpg', 'http://t.imooc.com/space/teacher/id/255838', '0', '1', '0', '1457873435', '0');
INSERT INTO `cms_position_content` VALUES ('34', '2', '习近平今日下午出席解放军代表团全体会议', '/upload/2016/10/28/5813201385ff9.png', '', '21', '30', '1', '1457854896', '0');
INSERT INTO `cms_position_content` VALUES ('35', '2', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '/upload/2016/03/13/56e51fc82b13a.png', null, '24', '0', '1', '1457856460', '0');
INSERT INTO `cms_position_content` VALUES ('36', '5', '车联网“红海”是玩家们的假象', '/upload/2016/10/17/580469526a3f3.jpg', null, '29', '0', '1', '1476670937', '0');
INSERT INTO `cms_position_content` VALUES ('37', '2', '汽车行业变奏前夜，四大公司即将消亡？', '/upload/2016/10/26/5810604275454.jpg', 'http://www.45ck.com/index.php?m=content&c=index&a=show&catid=23&id=5567', '0', '23', '-1', '1477468231', '0');
INSERT INTO `cms_position_content` VALUES ('38', '5', '法师', '', '', '25', '0', '-1', '1477468315', '0');
