-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-08-04 11:27:42
-- 服务器版本： 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypannel`
--

-- --------------------------------------------------------

--
-- 表的结构 `binds`
--

DROP TABLE IF EXISTS `binds`;
CREATE TABLE IF NOT EXISTS `binds` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `bindId` varchar(10) NOT NULL COMMENT '绑定页面',
  `styleJson` text NOT NULL,
  `dataJson` text NOT NULL,
  `layer` varchar(10) DEFAULT NULL COMMENT '图层顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='页面绑定控件表';

--
-- 转存表中的数据 `binds`
--

INSERT INTO `binds` (`id`, `uid`, `name`, `bindId`, `styleJson`, `dataJson`, `layer`) VALUES
(56, 'uid_3', '通用标题', '1', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题003\",\"fontValue\":\"罗马\",\"fontSize\":70,\"fontColor\":\"#F51111\",\"fontWeight\":50,\"textAlign\":\"center\",\"widgetWidth\":75.5,\"widgetHeight\":19.1,\"widgetLeft\":5.1,\"widgetTop\":2.3,\"url\":\"http://\",\"target\":\"_blank\",\"id\":56,\"uid\":\"uid_3\",\"dataJson\":\"\",\"layer\":\"3\",\"scrollamount\":0}', '', '3'),
(60, 'uid_2', '通用标题', '2', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题哦哦哦\",\"fontValue\":\"楷体\",\"fontSize\":44,\"fontColor\":\"#FF00F2\",\"fontWeight\":50,\"textAlign\":\"center\",\"widgetWidth\":43.5,\"widgetHeight\":18.1,\"widgetLeft\":0.9,\"widgetTop\":80.2,\"url\":\"http://\",\"target\":\"_blank\",\"id\":60,\"uid\":\"uid_2\",\"dataJson\":[\"\"],\"layer\":\"2\",\"scrollamount\":0}', '', '2'),
(65, 'uid_2', '通用标题', '5', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"url\":\"http://\",\"target\":\"_blank\",\"id\":65,\"uid\":\"uid_2\",\"dataJson\":\"\",\"layer\":\"2\"}', '', '2'),
(67, 'uid_1', '时间控件', '6', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":25,\"widgetTop\":50}', '0', '1'),
(68, 'uid_2', '通用标题', '6', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"url\":\"http://\",\"target\":\"_blank\"}', '', '2'),
(73, 'uid_1', '通用标题', '7', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":44.8,\"widgetTop\":25.7,\"url\":\"http://\",\"target\":\"_blank\",\"id\":73,\"uid\":\"uid_1\",\"dataJson\":\"\",\"layer\":\"1\"}', '', '1'),
(75, 'uid_1', '通用标题', '8', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":31.1,\"widgetTop\":23.3,\"url\":\"http://\",\"target\":\"_blank\",\"id\":75,\"uid\":\"uid_1\",\"dataJson\":\"\",\"layer\":\"1\"}', '', '1'),
(76, 'uid_2', '时间控件', '8', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":23.1,\"widgetTop\":64.8,\"id\":76,\"uid\":\"uid_2\",\"dataJson\":\"0\",\"layer\":\"2\"}', '0', '2'),
(77, 'uid_3', '通用标题', '8', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":19.1,\"widgetTop\":28.8,\"url\":\"http://\",\"target\":\"_blank\",\"id\":77,\"uid\":\"uid_3\",\"dataJson\":\"\",\"layer\":\"3\"}', '', '3'),
(78, 'uid_0', '通用标题', '9', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":8.7,\"widgetTop\":9.2,\"url\":\"http://\",\"target\":\"_blank\",\"id\":78,\"uid\":\"uid_0\",\"dataJson\":\"\",\"layer\":\"0\"}', '', '0'),
(79, 'uid_1', '时间控件', '9', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":3.3,\"widgetTop\":24.2,\"id\":79,\"uid\":\"uid_1\",\"dataJson\":\"0\",\"layer\":\"1\"}', '0', '1'),
(80, 'uid_1', '时间控件', '9', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":9.2,\"widgetTop\":49.6,\"id\":80,\"uid\":\"uid_1\",\"dataJson\":\"0\",\"layer\":\"1\"}', '0', '1'),
(81, 'uid_2', '通用标题', '9', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"url\":\"http://\",\"target\":\"_blank\"}', '', '2'),
(82, 'uid_0', '时间控件', '10', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":9,\"widgetTop\":8,\"id\":82,\"uid\":\"uid_0\",\"dataJson\":\"0\",\"layer\":\"0\"}', '0', '0'),
(84, 'uid_2', '时间控件', '10', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":11.2,\"widgetTop\":36,\"id\":84,\"uid\":\"uid_2\",\"dataJson\":\"0\",\"layer\":\"2\"}', '0', '2'),
(85, 'uid_3', '通用标题', '10', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":26.7,\"widgetTop\":39.2,\"url\":\"http://\",\"target\":\"_blank\",\"id\":85,\"uid\":\"uid_3\",\"dataJson\":\"\",\"layer\":\"3\"}', '', '3'),
(90, 'uid_8', '通用标题', '1', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题008\",\"fontValue\":\"楷体\",\"fontSize\":58,\"fontColor\":\"#000203\",\"fontWeight\":45,\"textAlign\":\"center\",\"widgetWidth\":48.2,\"widgetHeight\":13.1,\"widgetLeft\":27.6,\"widgetTop\":18.5,\"url\":\"http://\",\"target\":\"_blank\",\"id\":90,\"uid\":\"uid_8\",\"dataJson\":\"\",\"layer\":\"8\",\"scrollamount\":0}', '', '8'),
(96, 'uid_9', '时间控件', '1', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":37,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":4,\"widgetTop\":50,\"id\":96,\"uid\":\"uid_9\",\"dataJson\":\"0\",\"layer\":\"9\",\"scrollamount\":0}', '0', '9'),
(97, 'uid_10', '通用标题', '1', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":18.5,\"widgetTop\":69.6,\"url\":\"http://\",\"target\":\"_blank\",\"id\":97,\"uid\":\"uid_10\",\"dataJson\":\"\",\"layer\":\"10\",\"scrollamount\":0}', '', '10'),
(99, 'uid_5', '时间控件', '2', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":48.8,\"widgetTop\":83.6,\"id\":99,\"uid\":\"uid_5\",\"dataJson\":[\"0\"],\"layer\":\"5\",\"scrollamount\":0}', '0', '5'),
(100, 'uid_6', '通用标题', '2', '{\"attribute\":\"commonTitle\",\"name\":\"照骗墙\",\"fontValue\":\"楷体\",\"fontSize\":57,\"fontColor\":\"#00CCFF\",\"fontWeight\":50,\"textAlign\":\"center\",\"widgetWidth\":69.5,\"widgetHeight\":11.2,\"widgetLeft\":15,\"widgetTop\":0.1,\"url\":\"http://\",\"target\":\"_blank\",\"id\":100,\"uid\":\"uid_6\",\"dataJson\":[\"\"],\"layer\":\"6\",\"scrollamount\":0}', '', '6'),
(101, 'uid_0', '通用标题', '3', '{\"attribute\":\"commonTitle\",\"name\":\"DataShare--让数据互联\",\"fontValue\":\"楷体\",\"fontSize\":52,\"fontColor\":\"#00bbff\",\"fontWeight\":55,\"textAlign\":\"center\",\"widgetWidth\":86.8,\"widgetHeight\":7.9,\"widgetLeft\":7.2,\"widgetTop\":3.2,\"url\":\"http://\",\"target\":\"_blank\",\"id\":101,\"uid\":\"uid_0\",\"dataJson\":\"\",\"layer\":\"0\",\"scrollamount\":0}', '', '0'),
(103, 'uid_1', '时间控件', '3', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":55,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":21.9,\"widgetHeight\":6.8,\"widgetLeft\":77.5,\"widgetTop\":91.7,\"id\":103,\"uid\":\"uid_1\",\"dataJson\":\"0\",\"layer\":\"1\",\"scrollamount\":0}', '0', '1'),
(104, 'uid_2', '通用标题', '3', '{\"attribute\":\"commonTitle\",\"name\":\"做数据的主宰\",\"fontValue\":\"楷体\",\"fontSize\":86,\"fontColor\":\"#FF2A00\",\"fontWeight\":70,\"textAlign\":\"center\",\"widgetWidth\":71.5,\"widgetHeight\":26.9,\"widgetLeft\":12,\"widgetTop\":52.3,\"url\":\"http://\",\"target\":\"_blank\",\"id\":104,\"uid\":\"uid_2\",\"dataJson\":\"\",\"layer\":\"2\",\"scrollamount\":0}', '', '2'),
(110, 'uid_0', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":4.8,\"widgetTop\":7.2,\"id\":110,\"uid\":\"uid_0\",\"dataJson\":\"0\",\"layer\":\"0\",\"scrollamount\":0}', '0', '0'),
(112, 'uid_1', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":4.8,\"widgetTop\":16.7,\"id\":112,\"uid\":\"uid_1\",\"dataJson\":\"0\",\"layer\":\"1\",\"scrollamount\":0}', '0', '1'),
(113, 'uid_2', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy-MM-dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":5,\"widgetTop\":25.5,\"id\":113,\"uid\":\"uid_2\",\"dataJson\":\"0\",\"layer\":\"2\",\"scrollamount\":0}', '0', '2'),
(114, 'uid_3', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy-MM-dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":4.2,\"widgetTop\":34.4,\"id\":114,\"uid\":\"uid_3\",\"dataJson\":\"0\",\"layer\":\"3\",\"scrollamount\":0}', '0', '3'),
(115, 'uid_4', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy.MM.dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":3.3,\"widgetTop\":44.1,\"id\":115,\"uid\":\"uid_4\",\"dataJson\":\"0\",\"layer\":\"4\",\"scrollamount\":0}', '0', '4'),
(116, 'uid_5', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":1.3,\"widgetTop\":57.7,\"id\":116,\"uid\":\"uid_5\",\"dataJson\":\"0\",\"layer\":\"5\",\"scrollamount\":0}', '0', '5'),
(117, 'uid_6', '时间控件', '11', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":3.8,\"widgetTop\":72.4,\"id\":117,\"uid\":\"uid_6\",\"dataJson\":\"0\",\"layer\":\"6\",\"scrollamount\":0}', '0', '6'),
(124, 'uid_7', '滚动字幕', '2', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":57.7,\"widgetHeight\":7.7,\"widgetLeft\":20.1,\"widgetTop\":75.3,\"id\":124,\"uid\":\"uid_7\",\"dataJson\":[\"\"],\"layer\":\"7\",\"scrollamount\":9,\"text\":\"杀毒和空间撒谎都是\",\"behavior\":\"alternate\",\"direction\":\"left\"}', '', '7'),
(128, 'uid_4', '滚动字幕', '3', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"重要通知：一号屏幕出现未知故障请相关人员做好维护保障工作。\",\"fontValue\":\"楷体\",\"fontSize\":20,\"fontColor\":\"#FFFFFF\",\"fontWeight\":60,\"direction\":\"left\",\"widgetWidth\":100,\"widgetHeight\":3.6,\"widgetLeft\":0,\"widgetTop\":0,\"id\":128,\"uid\":\"uid_4\",\"dataJson\":\"\",\"layer\":\"4\",\"bgcolor\":\"#43D5C7\",\"scrollamount\":15,\"behavior\":\"scroll\",\"scroll\":\"right\"}', '', '4'),
(129, 'uid_5', '滚动字幕', '3', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是差不多先生，我的差不多是天生，我是差不多先生。\",\"fontValue\":\"楷体\",\"fontSize\":37,\"fontColor\":\"#6052FE\",\"fontWeight\":75,\"direction\":\"left\",\"widgetWidth\":100,\"widgetHeight\":5.5,\"widgetLeft\":0,\"widgetTop\":38.6,\"bgcolor\":\"#9A9999\",\"scrollamount\":20,\"behavior\":\"alternate\",\"id\":129,\"uid\":\"uid_5\",\"dataJson\":\"\",\"layer\":\"5\",\"scroll\":\"left\"}', '', '5'),
(130, 'uid_8', '通用标题', '2', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":65.7,\"widgetTop\":60.3,\"url\":\"http://\",\"target\":\"_blank\",\"id\":130,\"uid\":\"uid_8\",\"dataJson\":[\"\"],\"layer\":\"8\",\"scrollamount\":0}', '', '8'),
(131, 'uid_9', '滚动字幕', '2', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"left\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":10.3,\"widgetTop\":58.8,\"bgcolor\":\"\",\"scrollamount\":0,\"behavior\":\"scroll\",\"id\":131,\"uid\":\"uid_9\",\"dataJson\":[\"\"],\"layer\":\"9\"}', '', '9'),
(132, 'uid_10', '滚动卡片', '2', '{\"attribute\":\"scrollCards\",\"name\":\"滚动卡片\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":69.1,\"widgetHeight\":38.7,\"widgetLeft\":8.2,\"widgetTop\":14,\"id\":132,\"uid\":\"uid_10\",\"dataJson\":[\"\"],\"layer\":\"10\",\"scrollamount\":0}', '', '10'),
(133, 'uid_0', '滚动字幕', '13', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"right\",\"widgetWidth\":49.7,\"widgetHeight\":7.7,\"widgetLeft\":25.5,\"widgetTop\":0,\"bgcolor\":\"#64D31A\",\"scrollamount\":16,\"behavior\":\"alternate\",\"id\":133,\"uid\":\"uid_0\",\"dataJson\":[\"\"],\"layer\":\"0\",\"interval\":0}', '', '0'),
(134, 'uid_0', '滚动字幕', '12', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"right\",\"widgetWidth\":50.7,\"widgetHeight\":17.4,\"widgetLeft\":29,\"widgetTop\":37.2,\"bgcolor\":\"\",\"scrollamount\":18,\"behavior\":\"alternate\",\"id\":134,\"uid\":\"uid_0\",\"dataJson\":[\"\"],\"layer\":\"0\"}', '', '0'),
(135, 'uid_1', '通用标题', '12', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"url\":\"http://\",\"target\":\"_blank\"}', '', '1'),
(136, 'uid_11', '滚动字幕', '1', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"right\",\"widgetWidth\":42.1,\"widgetHeight\":12,\"widgetLeft\":39.6,\"widgetTop\":83,\"bgcolor\":\"\",\"scrollamount\":11,\"behavior\":\"scroll\",\"id\":136,\"uid\":\"uid_11\",\"dataJson\":\"\",\"layer\":\"11\"}', '', '11'),
(137, 'uid_12', '滚动字幕', '1', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"left\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":46.9,\"widgetTop\":62.2,\"bgcolor\":\"\",\"scrollamount\":0,\"behavior\":\"scroll\",\"id\":137,\"uid\":\"uid_12\",\"dataJson\":\"\",\"layer\":\"12\"}', '', '12'),
(138, 'uid_13', '滚动字幕', '1', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"left\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":39.9,\"bgcolor\":\"\",\"scrollamount\":0,\"behavior\":\"scroll\",\"id\":138,\"uid\":\"uid_13\",\"dataJson\":\"\",\"layer\":\"13\"}', '', '13'),
(139, 'uid_1', '滚动字幕', '13', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"left\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":41.7,\"widgetTop\":9.2,\"bgcolor\":\"\",\"scrollamount\":10,\"behavior\":\"scroll\",\"id\":139,\"uid\":\"uid_1\",\"dataJson\":[\"\"],\"layer\":\"1\",\"interval\":0}', '', '1'),
(147, 'uid_2', '滚动卡片', '13', '{\"attribute\":\"scrollCards\",\"name\":\"滚动卡片\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":55.3,\"widgetHeight\":42,\"widgetLeft\":22.6,\"widgetTop\":21,\"Type\":\"card\",\"interval\":30,\"id\":147,\"uid\":\"uid_2\",\"dataJson\":\"我是第一个, 第二个, 第三个, 第四个，弟弟\",\"layer\":\"2\",\"scrollamount\":0}', '我是第一个, 第二个, 第三个, 第四个 ', '2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
