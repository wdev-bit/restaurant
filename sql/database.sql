-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2020 at 05:00 PM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angorabynayabcha_pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `hno` text NOT NULL,
  `society` text NOT NULL,
  `area` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `landmark` text DEFAULT NULL,
  `type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `uid`, `hno`, `society`, `area`, `pincode`, `landmark`, `type`, `status`, `name`) VALUES
(1, 2, '64', 'Uyo', 'Oron road', 520101, 'GWT', 'Home', 1, 'Ekpri Nsukara');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(8) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `area_db`
--

CREATE TABLE `area_db` (
  `id` int(8) NOT NULL,
  `name` text NOT NULL,
  `dcharge` float NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area_db`
--

INSERT INTO `area_db` (`id`, `name`, `dcharge`, `status`) VALUES
(1, 'Oron road', 200, '1'),
(2, 'Nwaniba', 200, '1'),
(3, 'Aka Road', 200, '1'),
(4, 'Ifa Atai', 300, '1');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(8) NOT NULL,
  `bimg` text NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `bimg`, `cid`) VALUES
(4, 'banner/5f7dc2a7a481dlaptop-2838921_1920.jpg', 22),
(5, 'banner/5f818632ce8b2food.jpg', 24);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `catname` text NOT NULL,
  `catimg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `catname`, `catimg`) VALUES
(22, 'Food', 'product/thump_1601279630.jpg'),
(23, 'Groceries', 'product/thump_1601279657.jpg'),
(24, 'Pharmacy', 'product/thump_1602074953.jpg'),
(25, 'Kiddies', 'product/thump_1602075031.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `id` int(11) NOT NULL,
  `ccode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(8) NOT NULL,
  `uid` int(11) NOT NULL,
  `rate` text NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_setting`
--

CREATE TABLE `main_setting` (
  `id` int(11) NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_setting`
--

INSERT INTO `main_setting` (`id`, `data`) VALUES
(1, '\r\n<script src=\"app-assets/vendors/js/core/jquery-3.2.1.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/core/popper.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/core/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n\r\n   <script src=\"app-assets/vendors/js/perfect-scrollbar.jquery.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/prism.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/jquery.matchHeight-min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/screenfull.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/pace/pace.min.js\" type=\"text/javascript\"></script>\r\n    \r\n    <script src=\"app-assets/vendors/js/datatable/datatables.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/dataTables.buttons.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/buttons.flash.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/jszip.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/pdfmake.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/vfs_fonts.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/buttons.php5.min.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/vendors/js/datatable/buttons.print.min.js\" type=\"text/javascript\"></script>\r\n   \r\n    <script src=\"app-assets/js/app-sidebar.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/js/notification-sidebar.js\" type=\"text/javascript\"></script>\r\n    <script src=\"app-assets/js/customizer.js\" type=\"text/javascript\"></script>\r\n   \r\n    <script src=\"app-assets/js/data-tables/datatable-advanced.js\" type=\"text/javascript\"></script>\r\n	<script src=\"app-assets/js/tag.js\"></script>\r\n	\r\n\r\n\r\n	<style>.customizer[_ngcontent-rta-c5]{width:400px;right:-400px;padding:0;background-color:#fff;z-index:1051;position:fixed;top:0;bottom:0;height:100vh;-webkit-transition:right .4s cubic-bezier(.05,.74,.2,.99);transition:right .4s cubic-bezier(.05,.74,.2,.99);-webkit-backface-visibility:hidden;backface-visibility:hidden;border-left:1px solid rgba(0,0,0,.05);box-shadow:0 0 8px rgba(0,0,0,.1)}.customizer.open[_ngcontent-rta-c5]{right:0}.customizer[_ngcontent-rta-c5]   .customizer-content[_ngcontent-rta-c5]{position:relative;height:100%}.customizer[_ngcontent-rta-c5]   a.customizer-toggle[_ngcontent-rta-c5]{background:#fff;color:theme-color(\"primary\");display:block;box-shadow:-3px 0 8px rgba(0,0,0,.1)}.customizer[_ngcontent-rta-c5]   a.customizer-close[_ngcontent-rta-c5]{color:#000}.customizer[_ngcontent-rta-c5]   .customizer-close[_ngcontent-rta-c5]{position:absolute;right:10px;top:10px;padding:7px;width:auto;z-index:10}.customizer[_ngcontent-rta-c5]   #rtl-icon[_ngcontent-rta-c5]{position:absolute;right:-1px;top:35%;width:54px;height:50px;text-align:center;cursor:pointer;line-height:50px;margin-top:50px}.customizer[_ngcontent-rta-c5]   .customizer-toggle[_ngcontent-rta-c5]{position:absolute;top:35%;width:54px;height:50px;left:-54px;text-align:center;line-height:50px;cursor:pointer}.customizer[_ngcontent-rta-c5]   .color-options[_ngcontent-rta-c5]   a[_ngcontent-rta-c5]{white-space:pre}.customizer[_ngcontent-rta-c5]   .cz-bg-color[_ngcontent-rta-c5]{margin:0 auto}.customizer[_ngcontent-rta-c5]   .cz-bg-color[_ngcontent-rta-c5]   span[_ngcontent-rta-c5]:hover{cursor:pointer}.customizer[_ngcontent-rta-c5]   .cz-bg-color[_ngcontent-rta-c5]   span.white[_ngcontent-rta-c5]{color:#ddd!important}.customizer[_ngcontent-rta-c5]   .cz-bg-color[_ngcontent-rta-c5]   .selected[_ngcontent-rta-c5], .customizer[_ngcontent-rta-c5]   .cz-tl-bg-color[_ngcontent-rta-c5]   .selected[_ngcontent-rta-c5]{box-shadow:0 0 10px 3px #009da0;border:3px solid #fff}.customizer[_ngcontent-rta-c5]   .cz-bg-image[_ngcontent-rta-c5]:hover{cursor:pointer}.customizer[_ngcontent-rta-c5]   .cz-bg-image[_ngcontent-rta-c5]   img.rounded[_ngcontent-rta-c5]{border-radius:1rem!important;border:2px solid #e6e6e6;height:100px;width:50px}.customizer[_ngcontent-rta-c5]   .cz-bg-image[_ngcontent-rta-c5]   img.rounded.selected[_ngcontent-rta-c5]{border:2px solid #ff586b}.customizer[_ngcontent-rta-c5]   .tl-color-options[_ngcontent-rta-c5]{display:none}.customizer[_ngcontent-rta-c5]   .cz-tl-bg-image[_ngcontent-rta-c5]   img.rounded[_ngcontent-rta-c5]{border-radius:1rem!important;border:2px solid #e6e6e6;height:100px;width:70px}.customizer[_ngcontent-rta-c5]   .cz-tl-bg-image[_ngcontent-rta-c5]   img.rounded.selected[_ngcontent-rta-c5]{border:2px solid #ff586b}.customizer[_ngcontent-rta-c5]   .cz-tl-bg-image[_ngcontent-rta-c5]   img.rounded[_ngcontent-rta-c5]:hover{cursor:pointer}.customizer[_ngcontent-rta-c5]   .bg-hibiscus[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,left top,right bottom,from(#f05f57),color-stop(#c83d5c),color-stop(#99245a),color-stop(#671351),to(#360940));background-image:linear-gradient(to right bottom,#f05f57,#c83d5c,#99245a,#671351,#360940);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .bg-purple-pizzazz[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,left top,right bottom,from(#662d86),color-stop(#8b2a8a),color-stop(#ae2389),color-stop(#cf1d83),to(#ed1e79));background-image:linear-gradient(to right bottom,#662d86,#8b2a8a,#ae2389,#cf1d83,#ed1e79);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .bg-blue-lagoon[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,left top,right bottom,from(#144e68),color-stop(#006d83),color-stop(#008d92),color-stop(#00ad91),to(#57ca85));background-image:linear-gradient(to right bottom,#144e68,#006d83,#008d92,#00ad91,#57ca85);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .bg-electric-violet[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,right bottom,left top,from(#4a00e0),color-stop(#600de0),color-stop(#7119e1),color-stop(#8023e1),to(#8e2de2));background-image:linear-gradient(to left top,#4a00e0,#600de0,#7119e1,#8023e1,#8e2de2);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .bg-portage[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,right bottom,left top,from(#97abff),color-stop(#798ce5),color-stop(#5b6ecb),color-stop(#3b51b1),to(#123597));background-image:linear-gradient(to left top,#97abff,#798ce5,#5b6ecb,#3b51b1,#123597);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .bg-tundora[_ngcontent-rta-c5]{background-image:-webkit-gradient(linear,right bottom,left top,from(#474747),color-stop(#4a4a4a),color-stop(#4c4d4d),color-stop(#4f5050),to(#525352));background-image:linear-gradient(to left top,#474747,#4a4a4a,#4c4d4d,#4f5050,#525352);background-size:100% 100%;background-attachment:fixed;background-position:center;background-repeat:no-repeat;-webkit-transition:background .3s;transition:background .3s}.customizer[_ngcontent-rta-c5]   .cz-bg-color[_ngcontent-rta-c5]   .col[_ngcontent-rta-c5]   span.rounded-circle[_ngcontent-rta-c5]:hover, .customizer[_ngcontent-rta-c5]   .cz-tl-bg-color[_ngcontent-rta-c5]   .col[_ngcontent-rta-c5]   span.rounded-circle[_ngcontent-rta-c5]:hover{cursor:pointer}[dir=rtl]   [_nghost-rta-c5]     .customizer{left:-400px;right:auto;border-right:1px solid rgba(0,0,0,.05);border-left:0}[dir=rtl]   [_nghost-rta-c5]     .customizer.open{left:0;right:auto}[dir=rtl]   [_nghost-rta-c5]     .customizer .customizer-close{left:10px;right:auto}[dir=rtl]   [_nghost-rta-c5]     .customizer .customizer-toggle{right:-54px;left:auto}</style>\r\n<style>\r\n	.label-info, .badge-info {\r\n    background-color: #3a87ad;\r\n}\r\n\r\n.bootstrap-tagsinput {\r\n    width: 100%;\r\n}\r\n.label, .badge {\r\n    display: inline-block;\r\n    padding: 2px 4px;\r\n    font-size: 11.844px;\r\n    font-weight: bold;\r\n    line-height: 14px;\r\n    color: #fff;\r\n    text-shadow: 0 -1px 0 rgba(0,0,0,0.25);\r\n    white-space: nowrap;\r\n    vertical-align: baseline;\r\n    \r\n}\r\n	</style>\r\n\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `noti`
--

CREATE TABLE `noti` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `img` text NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(8) NOT NULL,
  `oid` text NOT NULL,
  `uid` int(11) NOT NULL,
  `pname` text NOT NULL,
  `pid` text NOT NULL,
  `ptype` text NOT NULL,
  `pprice` text NOT NULL,
  `ddate` text NOT NULL,
  `timesloat` text NOT NULL,
  `order_date` date NOT NULL,
  `status` text NOT NULL,
  `qty` text NOT NULL,
  `total` float NOT NULL,
  `rate` int(11) NOT NULL DEFAULT 0,
  `p_method` text DEFAULT NULL,
  `rid` int(11) NOT NULL DEFAULT 0,
  `a_status` int(11) NOT NULL DEFAULT 0,
  `photo` longtext DEFAULT NULL,
  `s_photo` longtext DEFAULT NULL,
  `r_status` varchar(200) DEFAULT 'Not Assigned',
  `pickup` text DEFAULT NULL,
  `tax` int(11) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `tid` text DEFAULT NULL,
  `coupon_id` int(11) NOT NULL,
  `cou_amt` int(11) NOT NULL,
  `wal_amt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `oid`, `uid`, `pname`, `pid`, `ptype`, `pprice`, `ddate`, `timesloat`, `order_date`, `status`, `qty`, `total`, `rate`, `p_method`, `rid`, `a_status`, `photo`, `s_photo`, `r_status`, `pickup`, `tax`, `address_id`, `tid`, `coupon_id`, `cou_amt`, `wal_amt`) VALUES
(1, '#5f7c6c0ac54e8', 1, 'd', 'd', 'd', 'd', '--10-12-2020', '2', '2020-10-06', 'pending', 'd', 0, 0, 'card', 1, 1, NULL, NULL, 'Assigned', 'Surat Gujrat', 0, 1, '10', 0, 2000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_list`
--

CREATE TABLE `payment_list` (
  `id` int(11) NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cred_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cred_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_list`
--

INSERT INTO `payment_list` (`id`, `img`, `title`, `cred_title`, `cred_value`, `status`) VALUES
(1, 'payment/thump_1589451371.png', 'Razorpay', 'RAZORPAY_API_KEY', 'xxxxxxxxxx', 0),
(2, 'payment/thump_1589451385.png', 'Paypal', 'Sendbox', 'xxxxxxxx', 0),
(3, 'payment/thump_1601916266.png', 'Paystack', 'PAYSTACK_SECRET', 'sk_test_88c0798ad874e234be01308b8da501dbbc473a1f', 1),
(4, 'payment/thump_1589451400.png', 'Cash On Delivery', '-', '-', 1),
(5, 'payment/thump_1589451416.png', 'Pickup Myself', '-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `pname` text NOT NULL,
  `seller_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `psdesc` text NOT NULL,
  `pgms` text NOT NULL,
  `pprice` text NOT NULL,
  `status` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `pimg` text NOT NULL,
  `prel` longtext DEFAULT NULL,
  `date` datetime NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `popular` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `pname`, `seller_id`, `cid`, `sid`, `psdesc`, `pgms`, `pprice`, `status`, `stock`, `pimg`, `prel`, `date`, `discount`, `popular`) VALUES
(52, 'Meat Pizza Small', 15, 22, 36, 'Pizza', 'pcs', '70', 1, 1, 'product/thump_1601283570.jpg', 'product/0item_856766.jpg', '2020-09-28 14:29:30', 5, 0),
(53, 'Cheez Pizza Large', 16, 22, 37, 'Pizza', 'pcs', '80', 1, 1, 'product/thump_1601291188.jpg', 'product/0item_856766.jpg', '2020-09-28 16:36:28', 10, 0),
(54, 'Zinger Burger Small', 16, 23, 39, 'Burger', 'pcs', '50', 1, 1, 'product/thump_1601291490.jpg', 'product/0default_item_img.jpg', '2020-09-28 16:41:30', 10, 0),
(55, 'Tower Burger', 16, 23, 38, 'Burger', 'pcs', '80', 1, 1, 'product/thump_1601291559.jpg', '', '2020-09-28 16:42:39', 10, 0),
(56, 'Zinger Burger Cheezy', 15, 23, 39, 'Burger', 'pcs', '70', 1, 1, 'product/thump_1601291731.jpg', 'product/0item_155.jpg', '2020-09-28 16:45:31', 0, 0),
(57, 'Tower Burger', 15, 23, 38, 'Burger', 'pcs', '60', 1, 1, 'product/thump_1601291796.jpg', 'product/0item_35.jpg', '2020-09-28 16:46:36', 0, 0),
(58, 'Tower Burger', 16, 23, 38, 'Burger', 'pcs', '80', 1, 1, 'product/thump_1601292123.jpg', '', '2020-09-28 16:52:03', 10, 0),
(59, 'Harmburger', 15, 23, 38, 'Best Hamburger', '1 gms$;250 gms', '1$;10', 1, 1, 'product/thump_1601293863.jpeg', '', '2020-09-28 17:21:03', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate_order`
--

CREATE TABLE `rate_order` (
  `id` int(8) NOT NULL,
  `oid` text NOT NULL,
  `uid` int(11) NOT NULL,
  `msg` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aid` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reject` int(11) NOT NULL DEFAULT 0,
  `accept` int(11) NOT NULL DEFAULT 0,
  `complete` int(11) NOT NULL DEFAULT 0,
  `a_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider`
--

INSERT INTO `rider` (`id`, `name`, `mobile`, `email`, `aid`, `address`, `status`, `password`, `reject`, `accept`, `complete`, `a_status`) VALUES
(1, 'Company Delivery', '07030740617', 'cazewonder@gmail.com', 1, 'Oron road', 1, '1234567890', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rnoti`
--

CREATE TABLE `rnoti` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `msg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rnoti`
--

INSERT INTO `rnoti` (`id`, `rid`, `msg`, `date`) VALUES
(1, 1, 'You have an order assigned to you.', '2020-10-10 15:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `saddress` text NOT NULL,
  `slogo` varchar(255) NOT NULL,
  `sbanner` varchar(255) NOT NULL,
  `rating` decimal(2,2) DEFAULT 0.00,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `sname`, `saddress`, `slogo`, `sbanner`, `rating`, `created_at`) VALUES
(15, 'Cheetah', 'Faisalabad , PB , PK', 'uploads/seller/logo/thump_1601287725.png', 'uploads/seller/banner/thump_1601286288.jpg', 0.00, '2020-09-28 13:35:39'),
(16, 'Foodpanda', 'Faisalabad, PB,  PK', 'uploads/seller/logo/thump_1601291055.png', 'uploads/seller/banner/thump_1601291055.png', 0.00, '2020-09-28 16:34:15'),
(17, 'Testing Seller', 'jbjkbk', 'uploads/seller/logo/thump_1601387261.png', 'uploads/seller/banner/thump_1601387261.png', 0.00, '2020-09-29 19:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `one_key` text NOT NULL,
  `one_hash` text NOT NULL,
  `r_key` text NOT NULL,
  `r_hash` text NOT NULL,
  `currency` text CHARACTER SET utf8 NOT NULL,
  `privacy_policy` longtext NOT NULL,
  `about_us` longtext NOT NULL,
  `contact_us` longtext NOT NULL,
  `o_min` int(11) NOT NULL,
  `timezone` text NOT NULL,
  `tax` int(11) NOT NULL,
  `logo` text NOT NULL,
  `favicon` text NOT NULL,
  `title` text NOT NULL,
  `terms` text NOT NULL,
  `maintaince` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `one_key`, `one_hash`, `r_key`, `r_hash`, `currency`, `privacy_policy`, `about_us`, `contact_us`, `o_min`, `timezone`, `tax`, `logo`, `favicon`, `title`, `terms`, `maintaince`) VALUES
(1, 'XXXX', 'XXXX', 'XXXX', 'XXXX', '₹', '<p>XXXXXXXXX</p>\r\n', '<p>XXXXXXXXX</p>\r\n', '<p>XXXXXXXXX</p>\r\n', 100, 'Asia/Kolkata', 5, 'website/thump_1597913295.png', 'website/thump_1597913294.png', 'Hungry Grocery v1.5.1', '<p>XXXXXXXXX</p>\r\n', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `cat_id`, `name`, `img`) VALUES
(36, 22, 'Meat Pizza', 'product/thump_1601279903.jpg'),
(37, 22, 'Cheese Pizza', 'product/thump_1601279941.jpg'),
(38, 23, 'Tower Burger', 'product/thump_1601291318.jpg'),
(39, 23, 'Zinger Burger', 'product/thump_1601291387.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `id` int(11) NOT NULL,
  `c_img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cdate` date NOT NULL,
  `c_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ctitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `id` int(11) NOT NULL,
  `mintime` text NOT NULL,
  `maxtime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`id`, `mintime`, `maxtime`) VALUES
(1, '09:00', '10:30'),
(2, '09:00', '10:30'),
(3, '11:30', '12:30');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `card_type` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `fees` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `trx_id`, `reference`, `amount`, `channel`, `card_type`, `bank`, `country_code`, `currency`, `message`, `fees`, `status`, `date`) VALUES
(16, 1, '837715862', 'k1hfkrefid', 100000, 'card', 'visa ', 'TEST BANK', 'NG', 'NGN', 'Successfully paid with card', 1500, 'success', '2020-10-06 18:02:13'),
(17, 1, '838533376', 'z9vezxml89', 100000, 'card', 'visa ', 'TEST BANK', 'NG', 'NGN', 'Authentication Required: 3DS', 1500, 'success', '2020-10-07 13:13:58'),
(18, 2, '839015397', 'my65tjiki7', 100000, 'card', 'verve ', 'TEST BANK', 'NG', 'NGN', 'Filled this field: card expiry', 1500, 'success', '2020-10-07 21:35:58'),
(19, 2, '839041026', 'aqplaved29', 100000, 'card', 'visa ', 'TEST BANK', 'NG', 'NGN', 'Authentication Required: 3DS', 1500, 'success', '2020-10-07 21:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `uread`
--

CREATE TABLE `uread` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `nid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `imei` text NOT NULL,
  `email` text NOT NULL,
  `ccode` text NOT NULL,
  `mobile` text NOT NULL,
  `rdate` datetime NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `pin` text DEFAULT NULL,
  `wallet` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `imei`, `email`, `ccode`, `mobile`, `rdate`, `password`, `status`, `pin`, `wallet`) VALUES
(1, 'Muhammad Faiz', '1000322388882333', 'faizshah167@gmail.com', 'Fx77sD8bdsxa', '03216641175', '2020-10-05 11:29:13', '1234567890', 1, '12345', 0),
(2, 'Mbuodile Obiosio', '1000323232323', 'cazewonder@gmail.com', '12345', '07030740617', '2020-10-06 10:50:25', '1234567890', 1, '12345', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `card_holder_name` varchar(255) NOT NULL,
  `cvc` varchar(255) NOT NULL,
  `expiry_month` varchar(255) NOT NULL,
  `expiry_year` varchar(255) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`id`, `user_id`, `card_number`, `card_holder_name`, `cvc`, `expiry_month`, `expiry_year`, `access_code`, `reference`) VALUES
(1, 1, '123456789765', 'faiz wahab', '222', '09', '20', 'ydwdbjw', 'ydwdbjw'),
(2, 2, '5399411147254483', 'Mbuodile Obiosio', '411', '08', '2021', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area_db`
--
ALTER TABLE `area_db`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_setting`
--
ALTER TABLE `main_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noti`
--
ALTER TABLE `noti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_list`
--
ALTER TABLE `payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ibfk_1` (`seller_id`);

--
-- Indexes for table `rate_order`
--
ALTER TABLE `rate_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rnoti`
--
ALTER TABLE `rnoti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `uread`
--
ALTER TABLE `uread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area_db`
--
ALTER TABLE `area_db`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_setting`
--
ALTER TABLE `main_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `noti`
--
ALTER TABLE `noti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_list`
--
ALTER TABLE `payment_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `rate_order`
--
ALTER TABLE `rate_order`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider`
--
ALTER TABLE `rider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rnoti`
--
ALTER TABLE `rnoti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timeslot`
--
ALTER TABLE `timeslot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `uread`
--
ALTER TABLE `uread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_detail`
--
ALTER TABLE `user_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
