-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-08-06 02:48:22
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
-- 表的结构 `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(10) NOT NULL,
  `widgetsGroupId` int(5) NOT NULL COMMENT '从属于组件组别',
  `name` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `styleJson` text NOT NULL,
  `dataJson` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控件表';

--
-- 转存表中的数据 `widgets`
--

INSERT INTO `widgets` (`id`, `widgetsGroupId`, `name`, `img`, `styleJson`, `dataJson`) VALUES
(0, 5, '通用标题', '../../static/img/comman-title.png', '{\"attribute\":\"commonTitle\",\"name\":\"通用标题\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"url\":\"http://\",\"target\":\"_blank\"}', ''),
(2, 5, '时间控件', '../../static/img/time.png', '{\"attribute\":\"time\",\"name\":\"时间控件\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"format\":\"yyyy/MM/dd hh:mm:ss\",\"widgetWidth\":48,\"widgetHeight\":12,\"widgetLeft\":25,\"widgetTop\":50}', '0'),
(3, 5, '滚动字幕', '../../static/img/scrollText.png', '{\"attribute\":\"scrollText\",\"name\":\"滚动字幕\",\"text\":\"我是测试屏幕滚动文本\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#fff\",\"fontWeight\":40,\"direction\":\"left\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"bgcolor\":\"\",\"scrollamount\":10,\"behavior\":\"scroll\"}', NULL),
(4, 5, '滚动卡片', '../../static/img/scrollCards.png', '{\"attribute\":\"scrollCards\",\"name\":\"滚动卡片\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40,\"Type\":\"card\",\"interval\":30}', '我是第一个, 第二个, 第三个, 第四个 '),
(5, 1, '基础折线图', '../../static/img/line.png', '{\"attribute\":\"scrollCards\",\"name\":\"折线图\",\"fontValue\":\"宋体\",\"fontSize\":25,\"fontColor\":\"#00bbff\",\"fontWeight\":40,\"textAlign\":\"center\",\"widgetWidth\":24,\"widgetHeight\":12,\"widgetLeft\":45,\"widgetTop\":40}', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
