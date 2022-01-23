/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.26 : Database - secretspace
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secretspace` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `secretspace`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '博客编号',
  `headline` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客标题',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客作者',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客分类',
  `clicknum` int NOT NULL COMMENT '点击数',
  `commitnum` int NOT NULL COMMENT '回复数',
  `uptime` date NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `author_username` (`author`),
  KEY `type_name` (`type`),
  CONSTRAINT `author_username` FOREIGN KEY (`author`) REFERENCES `user` (`username`),
  CONSTRAINT `type_name` FOREIGN KEY (`type`) REFERENCES `type` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `blog` */

insert  into `blog`(`id`,`headline`,`author`,`content`,`type`,`clicknum`,`commitnum`,`uptime`) values 
(10,'周末洛阳一日漫游随拍','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=1368929450&amp;auto=0&amp;height=66\"></iframe></p><hr/><p><br/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/e39501df1ca6439e9d82ed7210619fb3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"100%\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">早上乘坐Z105次列车前往洛阳</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/60959b683de647d39a5bef679e571525.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">早餐——鲫鱼豆腐汤</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/2000b162ba32412b801a31e716671051.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">龙门石窟入口</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/a1a1455bbb284e52ac69cc0ef1443a13.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p style=\"text-align:center;\"><font size=\"2\">伊河大桥</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/1cf5240475684b62b617b0f2563949c4.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">西山石窟全景</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/6af0aed40e6d44c2bf83fbc7c7c238cf.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">东山上俯瞰</font></p><hr/><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/cebb0df74fe341568ca05072d2b665ef.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">洛阳关林</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/fdeb8b9eb2a14179baebb582142f1ab0.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><hr/><p><img src=\"https://img-blog.csdnimg.cn/1286165aebe94d67a74dc3c0d58110dd.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">老城丽景门</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/28612097c56547a29e663cf0242b498c.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">洛阳水席</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/c0994be65d7548eb99c75cc9f4a7ae7b.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">焦炸丸子</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/dbf5d4adab8841c794e5fab8ccbb1a03.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">连汤肉片</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/ea93a9ac3a784df29e160dd9790a225b.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">洛阳熬货</font></p><hr/><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/674b6895e26f469b9640c0cc93c1b8ae.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">夕阳西下，回家</font></p>','旅行',52,0,'2021-09-11'),
(12,'夏日郑州傍晚街头一组照片','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><br/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/deb4aa0d435949ad9069721bc6708c53.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">东风渠</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/2a1d0d4d1c5d457aaad826622e758902.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">天空</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/7be09c75e32145e988f7f9a2ff9fc2ca.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">运动的人们</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/37c6ba62ba5e4c0ea0ef554a939d687b.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">文化路口</font></p>','生活',12,0,'2021-07-22'),
(13,'分享两张美丽的天空和一首音乐','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=1407113422&amp;auto=0&amp;height=66\"></iframe></p><p style=\"line-height:1;\"><br/></p><p style=\"text-align:center;\"><font style=\"background-color: rgb(255, 255, 255);\" face=\"华文仿宋\" size=\"4\"><b style=\"\">云朵偷喝了我放在屋顶的酒，于是它脸红变成了晚霞。</b></font><span style=\"background-color: rgb(255, 255, 255);\"></span></p><p style=\"line-height:1;\"><br/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/4e809a3e3122477e9c0a2f7907eccb8a.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">拍摄于郑州大学新校区实验楼顶</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/37a502a23bd34a7ba272ca07b5238376.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">拍摄于郑州大学北校区9号楼外</font></p>','摄影',11,0,'2021-05-22'),
(15,'音乐分享——海边的梦','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=1447721226&amp;auto=0&amp;height=66\"></iframe></p><p><br/></p><p style=\"text-align:center;\">海边的梦</p><p style=\"text-align:center;\">我独自在海边徘徊，</p><p style=\"text-align:center;\">遥望着天边的霞彩，</p><p style=\"text-align:center;\">我想起了我的爱，</p><p style=\"text-align:center;\">不知她这时候何在？</p><p style=\"text-align:center;\">我在这儿等待——</p><p style=\"text-align:center;\">她为什么不来？</p><p style=\"text-align:center;\">我独自在海边发痴——</p><p style=\"text-align:center;\">沙滩里平添了无数的相思字。</p><p style=\"text-align:center;\">假使她在这儿伴着我，</p><p style=\"text-align:center;\">在这寂寥的海边散步？</p><p style=\"text-align:center;\">海鸥声里，</p><p style=\"text-align:center;\">听私语喁喁，</p><p style=\"text-align:center;\">浅沙滩里，</p><p style=\"text-align:center;\">印交错的脚踪，</p><p style=\"text-align:center;\">我唱一曲海边的恋歌，</p><p style=\"text-align:center;\">爱，你幽幽的低着嗓儿和！</p><p style=\"text-align:center;\">这海边还不是你我的家，</p><p style=\"text-align:center;\">你看那边鲜血似的晚霞；</p><p style=\"text-align:center;\">我们要寻死，</p><p style=\"text-align:center;\">我们交抱着往波心里跳，</p><p style=\"text-align:center;\">绝灭了这皮囊，</p><p style=\"text-align:center;\">好叫你我的恋魂悠久的逍遥。</p><p style=\"text-align:center;\">这时候的新来的双星挂上天堂，</p><p style=\"text-align:center;\">放射着不磨灭的爱的光芒。</p><p style=\"text-align:center;\">夕阳已在沉沉的淡化，</p><p style=\"text-align:center;\">这黄昏的美，</p><p style=\"text-align:center;\">有谁能描画？</p><p style=\"text-align:center;\">莽莽的天涯，</p><p style=\"text-align:center;\">哪里是我的家，</p><p style=\"text-align:center;\">哪里是我的家？</p><p style=\"text-align:center;\">爱人呀，我这般的想着你，</p><p style=\"text-align:center;\">你那里可也有丝毫的牵挂？</p><p data-we-empty-p=\"\" style=\"text-align:center;\">                                                                        </p><p style=\"text-align:center;\">（1925年11月28日《现代评论》第2卷第51期。）</p>','音乐',62,0,'2021-09-24'),
(16,'歌词分享——遥不可及的你','石硕灏','<p style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=450853439&amp;auto=0&amp;height=66\"></iframe></p><p><br/></p><p><br/></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">如果有一天我要去流浪</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">不是因为我厌倦了家乡</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">不是难忍这里的冬天太长</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">而是我终于得知了你的方向</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">如果有一天我不再感伤</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">不是因为我突然的成长</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">不是有天有人向我递一颗糖</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">而是我终于走到了你的身旁</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">我从前相信</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">这世上有一个温暖的人</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">只为我悲喜</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为我阻挡着人间的锋利</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为了找到你</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">从未放过任何蛛丝马迹</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">而事到如今</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">终于明白我命里没你</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">我曾遇到许多美丽故事</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">也曾以为那些是你的名字</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">我的执迷不悟感动了我自己</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">你却还是一样遥不可及</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">所以我开始向往着远方</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">想去那些曾经有你的地方</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">可我未曾想过的人海茫茫</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">让我没日没夜迷失方向</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">我从前相信</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">这世上有一个温暖的人</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">只为我悲喜</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为我阻挡着人间的锋利</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为了找到你</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">从未放过任何蛛丝马迹</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">而事到如今</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">终于明白我命里没你</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">我从前相信</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">这世上有一个温暖的人</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">只为我悲喜</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为我阻挡着人间的锋利</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">为了找到你</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">从未放过任何蛛丝马迹</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">而事到如今</font></b></p><p style=\"text-align:center;\"><b><font face=\"华文仿宋\" size=\"4\">终于明白我命里没你</font></b></p>','阅读',16,0,'2021-09-23'),
(17,'Java学习路线','石硕灏','<p style=\"text-align:left; padding-left:20em;\"><!--[if-->1.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Java SE 基础</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->2.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Java多线程</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->3.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Java注解和反射</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->4.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->MySQL数据库</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->5.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->HTML</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->6.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->CSS3</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->7.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->JavaScript</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->8.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Java Web</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->9.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->jQuery</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->10.&nbsp;&nbsp;\r\n<!--[endif]-->Ajax</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->11.&nbsp;&nbsp;\r\n<!--[endif]-->Json</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->12.&nbsp;&nbsp;\r\n<!--[endif]-->Junit</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->13.&nbsp;&nbsp;\r\n<!--[endif]-->Mybatis</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->14.&nbsp;&nbsp;\r\n<!--[endif]-->Spring5</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->15.&nbsp;&nbsp;\r\n<!--[endif]-->SpringMVC</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->16.&nbsp;&nbsp;\r\n<!--[endif]-->SpringBoot</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->17.&nbsp;&nbsp;\r\n<!--[endif]-->SpringCloud</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->18.&nbsp;&nbsp;\r\n<!--[endif]-->JVM</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->19.&nbsp;&nbsp;\r\n<!--[endif]-->JUC并发编程</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->20.&nbsp;&nbsp;\r\n<!--[endif]-->Linux入门</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->21.&nbsp;&nbsp;\r\n<!--[endif]-->Git</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->22.&nbsp;&nbsp;\r\n<!--[endif]-->23种设计模式</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->23.&nbsp;&nbsp;\r\n<!--[endif]-->Java IO</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->24.&nbsp;&nbsp;\r\n<!--[endif]-->集合框架</p><p data-we-empty-p=\"\" style=\"text-align:left; padding-left:20em;\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p style=\"text-align:left; padding-left:20em;\"><!--[if-->25.&nbsp;&nbsp;\r\n<!--[endif]-->红黑树</p>','学习',16,0,'2021-09-20'),
(18,'Java学习——集合框架知识点总结','石硕灏','<p style=\"text-align:left;\"><b>1.&nbsp;&nbsp;&nbsp;&nbsp;\r\n</b><b>ArrayList（）（重点）</b></p><p style=\"text-align:left;\">（1）特点：数组结构实现，必须要连续空间，查询快，增删慢</p><p style=\"text-align:left;\">（2）方法：</p><p style=\"text-align:left;\"><b>boolean add(E\r\ne)</b> 将指定的元素添加到此列表的尾部</p><p style=\"text-align:left;\"><b>void \r\nadd(int index, E e)</b> 在此列表中指定的位置插入指定的元素</p><p style=\"text-align:left;\"><b>E get(int index)</b> 返回此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>E remove(int index)</b> 移除此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>int size()</b> 返回此列表中的元素数</p><p style=\"text-align:left;\"><b>boolean isEmpty()</b> 如果此列表中没有元素，则返回true</p><p style=\"text-align:left;\"><b>void clear()</b>\r\n移除此列表中的所有元素</p><p style=\"text-align:left;\"><b>boolean contains(Object o)</b> 如果此列表中包含指定的元素，则返回true</p><p style=\"text-align:left;\"><b>E set(int index, E element)</b> 用指定的元素替代此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>Iterator&lt;E&gt; iterator()</b> 返回按适当顺序在列表的元素上进行迭代的迭代器</p><p style=\"text-align:left;\"><b>List&lt;E&gt; subList(int from, int to) </b>返回列表中指定的from（包括）和to（不包括）之间部分</p><p style=\"text-align:left;\"><b>&lt;T&gt; T[ ] toArray(T[ ] a) </b>返回包含列表中所有元素的数组</p><p style=\"text-align:left;\">（3）遍历：</p><p style=\"text-align:left;\"><b>①使用迭代器</b></p><p style=\"text-align:left;\"><b>Iterator</b> it\r\n= arrayList.iterator();</p><p style=\"text-align:left;\">while(it.hasNext()){</p><p style=\"text-align:left;\">&nbsp;\r\nStudent s = (Student)it.next(); </p><p style=\"text-align:left;\">}</p><p style=\"text-align:left;\"><b>②使用列表迭代器</b></p><p style=\"text-align:left;\"><b>ListIterator</b>\r\nli = arrayList.listIterator();</p><p style=\"text-align:left;\">while(li.hasNext()){</p><p style=\"text-align:left;\">&nbsp;\r\nStudent s = (Student)li.next(); //从前往后遍历</p><p style=\"text-align:left;\">}</p><p style=\"text-align:left;\">while(li.hasPrevious()){</p><p style=\"text-align:left;\">&nbsp;\r\nStudent s = (Student)li.previous();//从后往前遍历</p><p style=\"text-align:left;\">}</p><p style=\"text-align:left;\">2.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->LinkedList</p><p style=\"text-align:left;\">（1）特点：双向链表结构实现，无需连续空间，增删快，查询慢</p><p style=\"text-align:left;\">（2）方法：</p><p style=\"text-align:left;\"><b>boolean add(E\r\ne)</b> 将指定的元素添加到此列表的尾部</p><p style=\"text-align:left;\"><b>void \r\nadd(int index, E e)</b> 在此列表中指定的位置插入指定的元素</p><p style=\"text-align:left;\"><b>void \r\naddFirst(E e)</b> 将指定元素插入此列表的开头</p><p style=\"text-align:left;\"><b>void \r\naddLast(E e)</b> 将指定元素添加到此列表的结尾</p><p style=\"text-align:left;\"><b>E get(int index)</b> 返回此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>E getFirst()</b>\r\n返回此列表的第一个元素</p><p style=\"text-align:left;\"><b>E getLast()</b> 返回此列表的最后一个元素</p><p style=\"text-align:left;\"><b>E remove(int index)</b> 移除此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>E removeFirst()</b> 移除并返回此列表的第一个元素</p><p style=\"text-align:left;\"><b>E removeLast()</b> 移除并返回此列表的最后一个元素</p><p style=\"text-align:left;\"><b>int size()</b> 返回此列表中的元素数</p><p style=\"text-align:left;\"><b>boolean isEmpty()</b> 如果此列表中没有元素，则返回true</p><p style=\"text-align:left;\"><b>void clear()</b>\r\n移除此列表中的所有元素</p><p style=\"text-align:left;\"><b>boolean contains(Object o)</b> 如果此列表中包含指定的元素，则返回true</p><p style=\"text-align:left;\"><b>E set(int index, E element)</b> 用指定的元素替代此列表中指定位置上的元素</p><p style=\"text-align:left;\"><b>Iterator&lt;E&gt; iterator()</b> 返回按适当顺序在列表的元素上进行迭代的迭代器</p><p style=\"text-align:left;\"><b>List&lt;E&gt; subList(int from, int to) </b>返回列表中指定的from（包括）和to（不包括）之间部分</p><p style=\"text-align:left;\"><b>&lt;T&gt; T[ ] toArray(T[ ] a) </b>返回包含列表中所有元素的数组</p><p style=\"text-align:left;\">（3）遍历：</p><p style=\"text-align:left;\"><b>①使用迭代器</b></p><p style=\"text-align:left;\"><b>②使用列表迭代器</b></p><p style=\"text-align:left;\">3.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Vector（已淘汰）</p><p style=\"text-align:left;\">（1）特点：数组结构实现，查询快、增删慢</p><p style=\"text-align:left;\">（2）方法：</p><p style=\"text-align:left;\">除了ArrayList中的方法之外，还有一个枚举器<b>Enumeration en = vector.elements();</b></p><p style=\"text-align:left;\"><b>4.&nbsp;&nbsp;&nbsp;&nbsp;\r\n</b><!--[endif]--><b>HashSet（重点）</b></p><p style=\"text-align:left;\">（1）特点：无序、无下标、元素不可重复</p><p style=\"text-align:left;\">（2）存储结构：哈希表（数组+链表+红黑树）</p><p style=\"text-align:left;\">（3）存储过程（重复依据）：</p><p style=\"text-align:left;\">根据hashCode计算保存的位置，如果位置为空，直接保存，若不为空，进行第二步再执行equals方法，如果equals为true，则认为是重复，否则形成链表</p><p style=\"text-align:left;\">（4）方法：</p><p style=\"text-align:left;\"><b>boolean add(E\r\ne)</b> 如果此 set 中尚未包含指定元素，则添加指定元素</p><p style=\"text-align:left;\"><b>boolean remove(Object\r\no)</b> 如果指定元素存在于此 set 中，则将其移除</p><p style=\"text-align:left;\"><b>boolean contains(Object\r\no)</b> 如果此 set 包含指定元素，则返回 true</p><p style=\"text-align:left;\"><b>Iterator&lt;E&gt; iterator()</b> 返回对此 set 中元素进行迭代的迭代器</p><p style=\"text-align:left;\"><b>Void clear()</b>\r\n从此 set 中移除所有元素</p><p style=\"text-align:left;\"><b>boolean isEmpty()</b> 如果此 set 不包含任何元素，则返回\r\ntrue</p><p style=\"text-align:left;\"><b>int size()</b> 返回此 set 中的元素的数量（set 的容量）</p><p style=\"text-align:left;\">（5）遍历</p><p style=\"text-align:left;\">①增强型for循环：<b>for(\r\nType type : hashSet) </b>（与遍历数组相似）</p><p style=\"text-align:left;\">②使用迭代器：<b>Iterator&lt;Type&gt; it =\r\nhashSet.iterator( );</b></p><p style=\"text-align:left;\">5.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->TreeSet</p><p style=\"text-align:left;\">（1）特点：</p><p style=\"text-align:left;\">①基于排列顺序实现元素不重复</p><p style=\"text-align:left;\">②实现SortedSet接口，对集合元素自动排序</p><p style=\"text-align:left;\"><b>③元素对象的类型必须实现Comparable接口，指定排序规则</b></p><p style=\"text-align:left;\"><b>④通过CompareTo方法确定是否为重复元素</b></p><p style=\"text-align:left;\">（2）存储结构：红黑树</p><p style=\"text-align:left;\">（3）方法：</p><p style=\"text-align:left;\"><b>boolean add(E\r\ne)</b> 如果此 set 中尚未包含指定元素，则添加指定元素</p><p style=\"text-align:left;\"><b>boolean remove(Object\r\no)</b> 如果指定元素存在于此 set 中，则将其移除</p><p style=\"text-align:left;\"><b>boolean contains(Object\r\no)</b> 如果此 set 包含指定元素，则返回 true</p><p style=\"text-align:left;\"><b>Iterator&lt;E&gt; iterator()</b> 返回对此 set 中元素进行迭代的迭代器</p><p style=\"text-align:left;\"><b>Void clear()</b>\r\n从此 set 中移除所有元素</p><p style=\"text-align:left;\"><b>boolean isEmpty()</b> 如果此 set 不包含任何元素，则返回\r\ntrue</p><p style=\"text-align:left;\"><b>int size()</b> 返回此 set 中的元素的数量（set 的容量）</p><p style=\"text-align:left;\">（4）遍历（同HashSet）</p><p style=\"text-align:left;\">①增强型for循环</p><p style=\"text-align:left;\">②使用迭代器</p><p style=\"text-align:left;\">（5）补充：<b>Comparator</b> 实现定制比较（比较器）</p><p style=\"text-align:left;\"><b>6.&nbsp;&nbsp;&nbsp;&nbsp;\r\n</b><!--[endif]--><b>HashMap（重点）</b></p><p style=\"text-align:left;\">（1）特点：使用key可使hashCode和equals作为重复（与HashSet原理相同）</p><p style=\"text-align:left;\">（2）存储结构：哈希表（数组+链表+红黑树）</p><p style=\"text-align:left;\">（3）原码分析总结：</p><p style=\"text-align:left;\">①HashMap刚创建时，table是null，节省空间，当添加第一个元素时，table容量调整为16</p><p style=\"text-align:left;\">②当元素个数大于阈值（16*0.75 = 12）时，会进行扩容，扩容后的大小为原来的两倍，目的是减少调整元素的个数</p><p style=\"text-align:left;\">③jdk1.8 当每个链表长度\r\n&gt;8 ，并且数组元素个数 ≥64时，会调整成红黑树，目的是提高效率</p><p style=\"text-align:left;\">④jdk1.8 当链表长度 &lt;6\r\n时 调整成链表</p><p style=\"text-align:left;\">（4）方法</p><p style=\"text-align:left;\"><b>V put(K key, V value)</b> 在此映射中关联指定值与指定键</p><p style=\"text-align:left;\"><b>V get(K key)</b>\r\n返回指定键所映射的值</p><p style=\"text-align:left;\"><b>V remove(K key)</b> 从此映射中移除指定键的映射关系（如果存在）</p><p style=\"text-align:left;\"><b>boolean containsKey(K\r\nkey)</b> 如果此映射包含对于指定键的映射关系，则返回\r\ntrue</p><p style=\"text-align:left;\"><b>boolean containsValue(V\r\nvalue)</b> 如果此映射将一个或多个键映射到指定值，则返回 true</p><p style=\"text-align:left;\"><b>void clear()</b>\r\n从此映射中移除所有映射关系</p><p style=\"text-align:left;\"><b>boolean isEmpty()</b> 如果此映射不包含键-值映射关系，则返回\r\ntrue</p><p style=\"text-align:left;\"><b>int size()</b> 返回此映射中的键-值映射关系数</p><p style=\"text-align:left;\"><b>Set&lt;K&gt; keySet()</b> 返回此映射中所包含的键的 Set 视图</p><p style=\"text-align:left;\"><b>Set&lt;Map.Entry&lt;K,V&gt;&gt; entrySet()</b> 返回此映射所包含的映射关系的 Set 视图</p><p style=\"text-align:left;\"><b>（5）遍历（重点）</b></p><p style=\"text-align:left;\">①使用<b>keySet()</b>得到所有key的集合，然后用增强型for循环遍历整个set，通过get方法得到value</p><p style=\"text-align:left;\">②使用<b>entrySet()</b>方法得到一个<b>Set&lt;Map.Entry&lt;K,V&gt;&gt;</b>，然后用增强型for循环遍历整个set，其中每个元素都是<b>Map.Entry&lt;K,V&gt;</b>类的对象，然后调用Map.Entry&lt;K,V&gt;中的<b>getKey()</b>和<b>getValue()</b>方法，得到每一对key和value</p><p style=\"text-align:left;\">7.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Hashtable（已淘汰）</p><p style=\"text-align:left;\"><b>线程安全，运行效率慢；不允许null作为key或是value</b></p><p style=\"text-align:left;\">8.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->Properties</p><p style=\"text-align:left;\">HashTable的子类，要求key和value都是String，通常用于配置文件的读取</p><p style=\"text-align:left;\">9.&nbsp;&nbsp;\r\n<!--[endif]-->TreeMap</p><p style=\"text-align:left;\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p style=\"text-align:left;\"><b>实现了SortedMap接口（是map的子接口），可以对key自动排序</b>（类似于TreeSet）</p>','学习',16,0,'2021-08-21'),
(19,'郑州大学北校区的秋天一景','石硕灏','<p><img src=\"https://img-blog.csdnimg.cn/8b80be12d07d4a53ba5bd8d322304bfa.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">拍摄于郑州大学北校区三食堂前</font></p>','摄影',20,0,'2019-11-13'),
(20,'分享一首甜甜的日语歌','石硕灏','<p style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=518261075&amp;auto=0&amp;height=66\"></iframe></p><p><br/></p><p data-we-empty-p=\"\" style=\"text-align:center;\">作词 : maco<br/>作曲 : 山口隆志<br/>はじめまして<br/>初次见面<br/>なんて呼んだらいいですか？<br/>怎么称呼好呢？<br/>せわしない日々に咲いたこの出会い<br/>不太忙碌的日子灿烂的相遇<br/>お友達程度な関係と思ってた<br/>我以为我们之间是朋友程度的关系<br/></p><p style=\"text-align:center;\">そんな君にまさか恋をしてしまうなんて<br/>没想到会爱上这样的你<br/><br/>あの日君が言ってくれた<br/>那一天，你对我说<br/>一緒に帰ろうって<br/>一起回家吧~<br/>またあの言葉期待してる<br/>期待着你的那句话<br/>密かに私は待ってるんだけどなぁ<br/>只是静静地等着<br/><br/>朝もお昼も夢の中も<br/>早上也好中午也好梦里也好<br/>本当はそばにいたいんだよ<br/>真的很想在你身边<br/>君のことを考えすぎて<br/>太过想你了<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きだから<br/>因为很喜欢<br/>そんな毎日が楽しくて<br/>每天都这么地开心~<br/>輝きだしたこの世界は<br/>熠熠生辉的这个世界<br/>君がくれた贈り物だよ<br/>是你给我的礼物哦~<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きなんだから<br/>因为很喜欢<br/><br/>みんなの前じゃクールな姿でいるけど<br/>在大家的面前很高冷的样子<br/>さりげなく優しいところ知ってる<br/>不经意地知道了你温柔的地方<br/>ひとつふたつ交わす言葉が嬉しくて<br/>一句两句地交谈 很开心<br/>次の電車こないで<br/>下一班电车还没来<br/>このまま時よ止まれ<br/>就这样让时间停止<br/><br/>次の約束どうしようか？<br/>下一次约会是怎样的呢？<br/>どちらからともなく<br/>不知道去哪里<br/>誘い出せない<br/>约出来<br/>もどかしいなぁ<br/>等不及啦~<br/>密かに私は待ってるんだけどなぁ<br/>只是静静地等着<br/><br/>朝もお昼も夢の中も<br/>早上也好中午也好梦里也好<br/>本当はそばにいたいんだよ<br/>真的很想在你身边<br/>恥ずかしくて言えないけれど<br/>虽然⁄害羞不敢说出来(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きだから<br/>因为很喜欢<br/>こんな毎日が愛しくて<br/>这样每天都都爱着你<br/>いまも輝くこの世界は<br/>现在闪闪发亮的世界<br/>君がくれた贈り物だよ<br/>是你给我的礼物哦~<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きなんだから<br/>因为很喜欢<br/><br/>眠れなくて迎える朝は<br/>无法入眠  迎来第二天清晨<br/>恋のしわざだと知ると少し嬉しいの<br/>如果知道恋爱的工作的话会有点开心<br/>今日も君のことをずっと...<br/>今天也在想你的事情<br/><br/>朝もお昼も夢の中も<br/>早上也好中午也好梦里也好<br/>本当はそばにいたいんだよ<br/>真的很想在你身边<br/>君のことを考えすぎて<br/>太过想你了<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きだから<br/>因为很喜欢<br/>そんな毎日が楽しくて<br/>每天都这么地开心~<br/>輝きだしたこの世界は<br/>熠熠生辉的这个世界<br/>君がくれた贈り物だよ<br/>是你给我的礼物哦~<br/>好きで好きで<br/>喜欢你 喜欢你<br/>大好きなんだから<br/>因为很喜欢</p>','音乐',21,0,'2021-09-24'),
(21,'一组照片——春日里的郑州','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=1435225104&amp;auto=0&amp;height=66\"></iframe></p><p><img src=\"https://img-blog.csdnimg.cn/61603815d8334683ac6a731269fb319c.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">拍摄于郑州市北环路与花园路立交桥下</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/a0b96861b7b94eb7b4f175e696499287.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">拍摄于郑州市科学大道</font></p>','摄影',3,0,'2020-03-15'),
(22,'电影推荐——千与千寻','石硕灏','<p><b>&nbsp;一、剧情介绍</b></p><p>&nbsp; &nbsp; &nbsp; 千寻和爸爸妈妈一同驱车前往新家，在郊外的小路上不慎进入了神秘的隧道——他们去到了另外一个诡异世界—一个中世纪的小镇。远处飘来食物的香味，爸爸妈妈大快朵颐，孰料之后变成了猪！这时小镇上渐渐来了许多样子古怪、半透明的人。\n                                    <br/>\n                                　　千寻仓皇逃出，一个叫小白的人救了他，喂了她阻止身体消 失的药，并且告诉她怎样去找锅炉爷爷以及汤婆婆，而且必须获得一份工作才能不被魔法变成别的东西。\n                                    <br/>\n                                　　千寻在小白的帮助下幸运地获得了一份在浴池打杂的工作。渐渐她不再被那些怪模怪样的人吓倒，并从小玲那儿知道了小白是凶恶的汤婆婆的弟子。\n                                    <br/>\n                                　　一次，千寻发现小白被一群白色飞舞的纸人打伤，为了救受伤的小白，她用河神送给她的药丸驱出了小白身体内的封印以及守封印的小妖精，但小白还是没有醒过来。\n                                    <br/>\n                                　　为了救小白，千寻又踏上了她的冒险之旅。</p><p><br/></p><p><b>二、电影配乐</b></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=443860&amp;auto=0&amp;height=66\"></iframe></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\" style=\"\">主题曲</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=443899&amp;auto=0&amp;height=66\"></iframe></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">插曲</font></p><p><br/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\"><br/></font></p>','生活',19,0,'2021-08-24'),
(23,'家里养的花——玛格丽特','石硕灏','<p style=\"line-height:1.15; text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/b94c64be549142369aa8d58fc683878f.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"50%\"/><br/><br/><img src=\"https://img-blog.csdnimg.cn/a3fbd41804e047bab61884b1b35dcbc9.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"50%\"/><br/><br/><img src=\"https://img-blog.csdnimg.cn/c5c0b9c3fe494ae6aff6957e9b10a83b.jpg\" style=\"max-width:100%;\" contenteditable=\"false\" width=\"50%\"/><span style=\"font-size: small;\"><br/></span></p><p style=\"line-height:1.15; text-align:center;\"><span style=\"font-size: small;\">拍摄于家中小院</span></p><p style=\"line-height:1;\"><br/></p>','生活',6,0,'2020-05-01'),
(25,'开学前开封半日游','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=18110955&amp;auto=0&amp;height=66\"></iframe></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/6be4b542af4949319aeb6cb7c6696cb3.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">坐火车前往开封</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/589ccb8c98584df7b217f6941cdee88e.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">包公湖</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/51a5c3a073c944e38d197074a42f3c3f.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">湖边老店</font></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><img src=\"https://img-blog.csdnimg.cn/364908fad725413baa19093bf1bd7986.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\"><font size=\"2\">驴肉汤</font></p>','旅行',11,0,'2021-09-05'),
(26,'推荐一首日文歌','石硕灏','<p data-we-empty-p=\"\" style=\"text-align:center;\"><iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"330\" height=\"86\" src=\"//music.163.com/outchain/player?type=2&amp;id=663631&amp;auto=0&amp;height=66\"></iframe></p><p><br/></p><p>昨日の夢を追いかけて<br/>紧追昨日的梦<br/>今夜もひとりざわめきに遊ぶ<br/>今夜又一个人  游荡于尘嚣中<br/>昔の自分がなつかしくなり<br/>往昔的我    让人怀念呀<br/>酒をあおる<br/>大口呷着酒<br/>騒いで飲んでいるうちに<br/>在喧闹中喝酒时<br/>こんなにはやく時は過ぎるのか<br/>时光就如此快的溜走了吗？<br/></p><p>琥珀のグラスに浮かんで消える<br/>於琥珀色的酒杯中 漂浮着逝去<br/>虹色の夢<br/>七彩的梦<br/>紅い花<br/>红色的花<br/>想いを込めてささげた恋唄<br/>满怀眷恋 倾吐的恋歌<br/>あの日あの頃は今どこに<br/>那一天那一刻 此刻在何处<br/>いつか消えた夢ひとつ<br/>不知不觉消逝的梦<br/>悩んであとの苦笑い<br/>苦恼过后的苦笑<br/>くやんでみても時は戻らない<br/>就是悔恨 时光已不再来<br/>疲れた自分が愛しくなって<br/>疲惫的我  可怜啊<br/>酒にうたう<br/>把酒当歌<br/>いつしか外は雨の音<br/>不觉外面传来雨声<br/>乾いた胸が思い出に濡れて<br/>干枯的心被回忆淋湿<br/>灯りがチラチラ歪んでうつる<br/>灯火闪烁 歪扭着映过来<br/>あの日のように<br/>如那一天<br/>紅い花<br/>红色的花<br/>踏みにじられて流れた恋唄<br/>心被践踏 流逝的恋歌<br/>あの日あの頃は今どこに<br/>那一天那一刻 此刻在何处<br/>いつか消えた影ひとつ<br/>不知不觉消逝的孑然的影子<br/>女帝制作<br/>Chin制作<br/>紅い花<br/>红色的花<br/>暗闇の中むなしい恋唄<br/>漆黑之中 空虚的恋歌<br/>あの日あの頃は今どこに<br/>那一天那一刻 此刻在何处<br/>今日も消える夢ひとつ<br/>今日又消逝的一个梦<br/>今日も消える夢ひとつ<br/>今日又消逝的一个梦</p>','音乐',15,0,'2021-09-24'),
(27,'Java学习——《剑指offer》刷题总结','石硕灏','<p style=\"text-align:center;\"><font size=\"3\">（还有很多没掌握</font>?）</p><p style=\"text-align:left;\"><br/></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">1.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 03. 数组中重复的数字</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">2.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 04. 二维数组中的查找 &nbsp;（注意考虑空的情况 [ ]&nbsp; [ [ ] ] 两种以及越界情况）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">3.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 05. 替换空格</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">4.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 06. 从尾到头打印链表</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">5.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 07. 重建二叉树（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">6.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 09. 用两个栈实现队列</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">7.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 10- I. 斐波那契数列（动态规划）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">8.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 10- II. 青蛙跳台阶问题（动态规划）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">9.&nbsp;&nbsp;&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 11. 旋转数组的最小数字</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">10.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 12. 矩阵中的路径（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">11.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 13. 机器人的运动范围（思路错误）（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">12.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 14- I. 剪绳子（动态规划）（递推式要写全）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">13.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 14- II. 剪绳子 II（贪心）（<b>取余不好理解</b>）（结论：切成长度为3的多份最优）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">14.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 15. 二进制中1的个数（<b>Integer.bitCount()</b>可以统计二进制补码形式中1的个数）（<b>位运算，要掌握</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">15.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 16. 数值的整数次方（当求一个数的相反数的时候要考虑出界问题，同时注意时间优化）（<b>快速幂算法</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">16.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 17. 打印从1到最大的n位数</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">17.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 18. 删除链表的节点（链表问题注意考虑<b>特殊情况</b>：空表、head.val==val、如果表中没有要删除的值）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">18.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 19. 正则表达式匹配（<b>不理解题意</b>）（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">19.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 20. 表示数值的字符串</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">20.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 21. 调整数组顺序使奇数位于偶数前面（<b>使用前后双指针根据奇偶情况进行交换和移动更优</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">21.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 22. 链表中倒数第k个节点<b>（指针1先走k-1，然后指针2和指针1同时前进，当指针1到表尾，2即为所求）</b></font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">22.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 24. 反转链表（<b>查找1个指针，删除2个，创建2个</b>（从前（后）往后（前）均可），<b>本题查找创建在一层循环里即可</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">23.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 25. 合并两个排序的链表（注意局部变量的适用范围）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">24.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 26. 树的子结构（<b>不明白题意和方法</b>）（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">25.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 27. 二叉树的镜像</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">26.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 28. 对称的二叉树（逐层考虑，<b>在考虑当前层时不用考虑下一层的情况</b>，即不用考虑其左右子树）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">27.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 29. 顺时针打印矩阵（思路正确）（循环时注意边界条件控制，多画几种情况找共性）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">28.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 30. 包含min函数的栈（<b>栈的题要想到两个栈同时工作</b>）（思路接近但没有到）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">29.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 31. 栈的压入、弹出序列（双指针，要考虑先入再出和先出再入两种情况）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">30.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 32 - I. 从上到下打印二叉树</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">31.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 32 - II. 从上到下打印二叉树 II</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">32.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 32 - III. 从上到下打印二叉树 III</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">33.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 33. 二叉搜索树的后序遍历序列（递归，<b>Arrays.copyOfRange()方法</b>）（考虑要全面）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">34.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 34. 二叉树中和为某一值的路径</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">35.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 35. 复杂链表的复制（建立<b>原节点和新节点之间的映射</b>HashMap(Node,Node)，效率高）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">36.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 36. 二叉搜索树与双向链表（<b>中序遍历</b>得递增的序列，用list顺序记录每个节点，然后拼接）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">37.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 37. 序列化二叉树（<b>困难</b> <b>最后解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">38.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 38. 字符串的排列（<b>未解决</b>）（<b>回溯法 下一个排列 要学习</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">39.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 39. 数组中出现次数超过一半的数字</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">40.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 40. 最小的k个数（<b>Arrays.sort</b>(arry)和<b>Arrays.copyOfRange</b>(arry,from,to)）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">41.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 41. 数据流中的中位数（PriorityQueue()类，<b>困难</b>\r\n<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">42.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 42. 连续子数组的最大和（动态规划不理解怎么保证连续，<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">43.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 43. 1～n 整数中 1\r\n出现的次数（普通法时间复杂度太高，有巧方法）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">44.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 44. 数字序列中某一位的数字（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">45.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 45. 把数组排成最小的数</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">46.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 46. 把数字翻译成字符串（<b>未解决</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">47.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 47. 礼物的最大价值（动态规划，类似斐波那契数列，<b>分析时从任意一个位置入手写递推式</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">48.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 48. 最长不含重复字符的子字符串（需要再学习更好的算法）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">49.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 49. 丑数（动态规划 <b>转移方程的推导不明白</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">50.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 50. 第一个只出现一次的字符</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">51.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 51. 数组中的逆序对（<b>未解决</b>，超出时间限制）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">52.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 52. 两个链表的第一个公共节点（<b>考虑全面</b>按照0+0、0+1、1+1、1+2、2+2分别考虑交叉和不交叉）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">53.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 53 - I. 在排序数组中查找数字 I（<b>有序数组</b>查找注意使用<b>二分查找</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">54.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 53 - II. 0～n-1中缺失的数字</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">55.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 54. 二叉搜索树的第k大节点（<b>中序遍历</b>若按照<b>右中左</b>的顺序，则可以得到<b>二叉树搜索树的递减序列</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">56.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 55 - I. 二叉树的深度（<b>递归</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">57.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 55 - II. 平衡二叉树（<b>递归</b>，同时<b>需要写一个求二叉树深度的函数</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">58.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 56 - I. 数组中数字出现的次数（<b>分组异或</b>，分组方法很巧妙）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">59.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 56 - II. 数组中数字出现的次数 II（<b>巧妙方法不理解</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">60.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 57. 和为s的两个数字（<b>双指针</b>，思路有些类似于二分查找）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">61.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 57 - II. 和为s的连续正数序列（注意<b>ArrayList里的toArray(T [ ] t)</b>的使用方法）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">62.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 58 - I. 翻转单词顺序（String类中的<b>split()和trim()方法</b>，<b>字符串数组连接过程中为什么会在末尾出现多余空格</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">63.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 58 - II. 左旋转字符串</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">64.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 59 - II. 队列的最大值（<b>未知错误</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">65.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 60. n个骰子的点数（动态规划，<b>推导不理解</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">66.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 61. 扑克牌中的顺子（不连续包括跳过某些数和某些数重复出现两种情况）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">67.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 62. 圆圈中最后剩下的数字（约瑟夫环）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">68.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 63. 股票的最大利润（<b>典型题</b>，一次遍历即可，由某一天的情况得到整体思路）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">69.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 64. 求1+2+…+n（巧妙，通过&amp;&amp;运算符的特性来实现递归条件控制）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">70.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 65. 不用加减乘除做加法（<b>不理解</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">71.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 66. 构建乘积数组（双层for循环可以通过动态规划变为单层for循环降低时间复杂度）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">72.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 67. 把字符串转换成整数（<b>‘9’-‘0’等于9，这个关系在由字符串得到数字时很有用</b>）</font></p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">73.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 68 - I. 二叉搜索树的最近公共祖先（递归，利用二叉搜索树节点的值的大小关系判断位置）</font></p><p data-we-empty-p=\"\" style=\"text-align:left;\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p style=\"text-align:left;\"><!--[if--><font face=\"华文仿宋\">74.&nbsp;&nbsp;\r\n<!--[endif]-->剑指 Offer 68 - II. 二叉树的最近公共祖先（跟上题相比无法通过值直接获得左右关系，可以通过中序遍历的到list序列，然后判断两个节点的左右关系，更好的方法是用<b style=\"\">HashMap</b>存储每个节点对应的<b style=\"\">父节点</b>，然后循环找公共祖先）</font></p>','学习',8,0,'2021-08-16');

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收藏人',
  `blog_id` int NOT NULL COMMENT '收藏帖子编号',
  `date` date NOT NULL COMMENT '收藏日期',
  PRIMARY KEY (`id`),
  KEY `user_username` (`user`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `user_username` FOREIGN KEY (`user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `collect` */

/*Table structure for table `commit` */

DROP TABLE IF EXISTS `commit`;

CREATE TABLE `commit` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `blog_id` int NOT NULL COMMENT '帖子编号',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论作者',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `uptime` date NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `blog_id_id` (`blog_id`),
  KEY `author_author` (`author`),
  CONSTRAINT `author_author` FOREIGN KEY (`author`) REFERENCES `user` (`username`),
  CONSTRAINT `blog_id_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `commit` */

/*Table structure for table `findpsd` */

DROP TABLE IF EXISTS `findpsd`;

CREATE TABLE `findpsd` (
  `question` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题',
  PRIMARY KEY (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `findpsd` */

insert  into `findpsd`(`question`) values 
('你出生的城市是哪里？'),
('你最喜欢的城市是哪里？'),
('你最喜欢的电影是哪部？');

/*Table structure for table `focus` */

DROP TABLE IF EXISTS `focus`;

CREATE TABLE `focus` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '关注编号',
  `username_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关注者',
  `username_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '被关注者',
  PRIMARY KEY (`id`),
  KEY `focus_from` (`username_from`),
  KEY `focus_to` (`username_to`),
  CONSTRAINT `focus_from` FOREIGN KEY (`username_from`) REFERENCES `user` (`username`),
  CONSTRAINT `focus_to` FOREIGN KEY (`username_to`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `focus` */

/*Table structure for table `hobby` */

DROP TABLE IF EXISTS `hobby`;

CREATE TABLE `hobby` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户搜索内容编号',
  `username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `content` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户搜索内容',
  PRIMARY KEY (`id`),
  KEY `username_hobby_username` (`username`),
  CONSTRAINT `username_hobby_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hobby` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '更新日志的编号',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志版本号',
  `date` date NOT NULL COMMENT '更新日期',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `log` */

insert  into `log`(`id`,`version`,`date`,`content`) values 
(6,'v1.0.0','2021-09-03','<ol style=\"text-align:left;\"><li>完成了三个界面，实现了登录注册功能，连接了MySQL数据库。</li><li>部署至云服务器。</li></ol>'),
(7,'v2.0.0','2021-09-24','<ol style=\"text-align:left;\"><li>完成了个人博客系统的基本结构和功能。</li><li>项目部署至云服务器，绑定域名为www.secretspace.cn</li><li>截至目前使用技术HTML5、CSS3、JavaScript、Servlet、MySQL等</li><li>项目角色为：超级管理员（我自己）、管理员、用户、游客</li><li>游客功能：查看帖子标题、注册、查看网站日志等</li><li>用户功能：注册、登录、完善个人信息、修改密码、修改头像、阅读帖子、发表评论、收藏帖子、申请成为管理员、找回密码等</li><li>管理员功能：发布帖子、发布网站日志、管理普通用户、管理帖子、修改帖子、管理密保问题、管理板块、审核用户成为管理员等</li><li>超级管理员：所有权限，可以从直接修改数据库</li><li>下一版本将更新功能：用户私信、好友、验证码、邮箱验证等</li></ol>');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '私信编号',
  `username_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发件人',
  `username_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收件人',
  `headline` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '私信标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '私信内容',
  `sendtime` date NOT NULL COMMENT '私信时间',
  `state` int NOT NULL COMMENT '0代表未读，1代表已读',
  PRIMARY KEY (`id`),
  KEY `from` (`username_from`),
  KEY `to` (`username_to`),
  CONSTRAINT `from` FOREIGN KEY (`username_from`) REFERENCES `user` (`username`),
  CONSTRAINT `to` FOREIGN KEY (`username_to`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `message` */

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `state` int NOT NULL COMMENT '0代表固定，1代表可变',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `type` */

insert  into `type`(`name`,`state`) values 
('学习',1),
('摄影',0),
('旅行',0),
('生活',0),
('阅读',0),
('音乐',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地区',
  `headphoto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `question` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题',
  `answer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密保问题答案',
  `role` int NOT NULL COMMENT '0是用户，1是管理员，2是待审核管理员',
  PRIMARY KEY (`username`),
  KEY `question_question` (`question`),
  CONSTRAINT `question_question` FOREIGN KEY (`question`) REFERENCES `findpsd` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`sex`,`birthday`,`area`,`headphoto`,`question`,`answer`,`role`) values 
('石硕灏','1233210456abc','男','2000-11-29','河南郑州','1632974345428石硕灏head.jpg','你出生的城市是哪里？','郑州',1);

/* Trigger structure for table `commit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `commitInsertTrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `commitInsertTrigger` AFTER INSERT ON `commit` FOR EACH ROW begin
	UPDATE `blog` 
	SET `commitnum`=`commitnum`+1 
	WHERE `id`=new.`blog_id`;
end */$$


DELIMITER ;

/* Trigger structure for table `commit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `commitDeleteTrigger` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `commitDeleteTrigger` AFTER DELETE ON `commit` FOR EACH ROW BEGIN
	UPDATE `blog` 
	SET `commitnum`=`commitnum`-1 
	WHERE `id`=old.`blog_id`;
END */$$


DELIMITER ;

/* Procedure structure for procedure `deleteBlog` */

/*!50003 DROP PROCEDURE IF EXISTS  `deleteBlog` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBlog`(IN blogId Int)
BEGIN
		delete from collect where blog_id=blogId;
		delete from `commit` where blog_id=blogId;
		delete from blog where id=blogId;
	END */$$
DELIMITER ;

/*Table structure for table `commit_user` */

DROP TABLE IF EXISTS `commit_user`;

/*!50001 DROP VIEW IF EXISTS `commit_user` */;
/*!50001 DROP TABLE IF EXISTS `commit_user` */;

/*!50001 CREATE TABLE  `commit_user`(
 `id` int ,
 `blog_id` int ,
 `author` varchar(20) ,
 `content` mediumtext ,
 `uptime` date ,
 `password` varchar(50) ,
 `sex` varchar(10) ,
 `birthday` date ,
 `area` varchar(50) ,
 `headphoto` varchar(50) ,
 `question` varchar(50) ,
 `answer` varchar(50) ,
 `role` int 
)*/;

/*View structure for view commit_user */

/*!50001 DROP TABLE IF EXISTS `commit_user` */;
/*!50001 DROP VIEW IF EXISTS `commit_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `commit_user` AS select `commit`.`id` AS `id`,`commit`.`blog_id` AS `blog_id`,`commit`.`author` AS `author`,`commit`.`content` AS `content`,`commit`.`uptime` AS `uptime`,`user`.`password` AS `password`,`user`.`sex` AS `sex`,`user`.`birthday` AS `birthday`,`user`.`area` AS `area`,`user`.`headphoto` AS `headphoto`,`user`.`question` AS `question`,`user`.`answer` AS `answer`,`user`.`role` AS `role` from (`commit` join `user`) where (`commit`.`author` = `user`.`username`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
