-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2021 lúc 09:27 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vscinema`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authorities`
--

CREATE TABLE `authorities` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Roleid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `authorities`
--

INSERT INTO `authorities` (`Id`, `Username`, `Roleid`) VALUES
(3, 'hieunnpc00795', 'MOD'),
(4, 'khuehnpc00516', 'MOD'),
(5, 'nhieuntpc00810', 'STA'),
(6, 'huyntpc00617', 'STA'),
(7, 'thainmpc00782', 'US'),
(8, 'hainnpc00645', 'US'),
(9, 'khuehnpc00516', 'STA'),
(10, 'staff', 'US'),
(11, 'staff', 'US'),
(12, 'staff', 'US'),
(13, 'staff', 'US'),
(14, 'staff', 'US'),
(16, 'khue', 'US'),
(17, 'nhieuntpc00810', 'US');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `censors`
--

CREATE TABLE `censors` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Showid` int(11) NOT NULL,
  `Createdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cinemas`
--

CREATE TABLE `cinemas` (
  `Id` int(11) NOT NULL,
  `Cityid` varchar(6) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cinemas`
--

INSERT INTO `cinemas` (`Id`, `Cityid`, `Name`, `Address`) VALUES
(2, '02HCM', 'CGV Aeon Tân Phú', 'Lầu 3, Aeon Mall 30 Bờ Bao Tân Thắng, P. Sơn Kỳ Quận Tân Phú TP. Hồ Chí Minh'),
(3, '55CT', 'CGV Vincom Hùng Vương', '02 Hùng Vương, Quận Ninh Kiều, TP. Cần Thơ'),
(4, '55CT', 'CGV Vincom Xuân Khánh', 'Tầng 5, Tòa nhà 209, Đường 30/04, Phường Xuân Khánh, Quận Ninh Kiều, Tp. Cần Thơ'),
(5, '55CT', 'CGV Sense Cities', 'Lầu 3, Sense Cities 1 Đại Lộ Hòa Bình Quận Ninh Kiều TP. Cần Thơ'),
(6, '02HCM', 'CGV Hùng Vương Plaza', 'Tầng 7 | Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cities`
--

CREATE TABLE `cities` (
  `Id` varchar(6) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cities`
--

INSERT INTO `cities` (`Id`, `Name`) VALUES
('01HN', 'Hà Nội'),
('02HCM', 'Hồ Chí Minh'),
('03HP', 'Hải Phòng'),
('04DN', 'Đà Nẵng'),
('10LS', 'Lạng Sơn'),
('12TN', 'Thái Nguyên'),
('13YB', 'Yên Bái'),
('14SL', 'Sơn La'),
('17QN', 'Quảng Ninh'),
('22HY', 'Hưng Yên'),
('29NA', 'Nghệ An'),
('30HT', 'Hà Tĩnh'),
('35QN', 'Quảng Ngãi'),
('36KT', 'Kontum'),
('37BD', 'Bình Định'),
('39PY', 'Phú Yên'),
('40DL', 'Đắk Lắk'),
('41KH', 'Khánh Hòa'),
('44BD', 'Bình Dương'),
('46TN', 'Tây Ninh'),
('48DN', 'Đồng Nai'),
('50DT', 'Đồng Tháp'),
('52BRVT', 'Bà Rịa – Vũng Tàu'),
('53TG', 'Tiền Giang'),
('54KG', 'Kiên Giang'),
('55CT', 'Cần Thơ'),
('57VL', 'Vĩnh Long'),
('58TV', 'Trà Vinh'),
('59ST', 'Sóc Trăng'),
('64HG', 'Hậu Giang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `Id` varchar(15) NOT NULL,
  `Createdate` date NOT NULL,
  `Expiry` date NOT NULL,
  `Discount` float NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `Id` int(11) NOT NULL,
  `Cinemasid` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  `Createdate` date NOT NULL,
  `Description` varchar(250) NOT NULL,
  `Active` bit(1) NOT NULL,
  `Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `foods`
--

INSERT INTO `foods` (`Id`, `Cinemasid`, `Name`, `Price`, `Createdate`, `Description`, `Active`, `Image`) VALUES
(1, 2, 'SNACK COMBO', 109000, '2021-05-10', '1 Bắp Lớn + 2 Nước Lớn + 1 Snack.', b'1', '6377b073.jpg'),
(2, 5, 'MILO COMBO 2021', 99000, '2021-05-10', '1 bắp Caramel lớn + 1 Milo hộp giấy + 1 nước ngọt', b'1', 'MILO_COMBO_2021.png'),
(3, 2, 'MY COMBO', 79000, '2021-05-10', '1 bắp vừa + 1 nước siêu lớn.', b'1', 'MY_COMBO.png'),
(4, 3, 'SNACK COMBO', 109000, '2021-05-10', '1 Bắp Lớn + 2 Nước Lớn + 1 Snack.', b'1', 'SNACK_COMBO.png'),
(5, 4, 'SNACK COMBO', 109000, '2021-05-10', '1 Bắp Lớn + 2 Nước Lớn + 1 Snack.', b'1', 'SNACK_COMBO.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genres`
--

CREATE TABLE `genres` (
  `Id` varchar(6) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `genres`
--

INSERT INTO `genres` (`Id`, `Name`) VALUES
('ACT', 'Hành Động'),
('ANI', 'Hoạt Hình'),
('ATQ', 'Cổ Trang'),
('CRMN', 'Hình Sự'),
('FIC', 'Viễn Tưởng'),
('FML', 'Gia Đình'),
('HOR', 'Kinh Dị'),
('HUMOR', 'Hài Hước'),
('LEGEND', 'Thần Thoại'),
('MRT', 'Võ Thuật'),
('MTLT', 'Tâm Lý'),
('WAR', 'Chiến Tranh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `Id` int(11) NOT NULL,
  `Genresid` varchar(6) NOT NULL,
  `Ratedsid` varchar(4) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Director` varchar(50) NOT NULL,
  `Cast` varchar(500) NOT NULL,
  `Releasedate` date NOT NULL,
  `Runningtime` time NOT NULL,
  `Language` varchar(50) NOT NULL,
  `Summary` varchar(1500) NOT NULL,
  `Poster` varchar(50) NOT NULL,
  `Trailer` varchar(50) NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`Id`, `Genresid`, `Ratedsid`, `Name`, `Director`, `Cast`, `Releasedate`, `Runningtime`, `Language`, `Summary`, `Poster`, `Trailer`, `Activity`) VALUES
(1, 'FML', 'C13', 'BỐ GIÀ', 'Vũ Ngọc Đãng & Trấn Thành', 'Trấn Thành, Tuấn Trần, Ngân Chi, NSND Ngọc Giàu, Lê Giang,...', '2021-03-12', '02:08:00', 'Tiếng Việt - Phụ đề Tiếng Anh', 'Phim sẽ xoay quanh lối sống thường nhật của một xóm lao động nghèo, ở đó có bộ tứ anh em Giàu - Sang - Phú - Quý với Ba Sang \nsẽ là nhân vật chính, hay lo chuyện bao đồng nhưng vô cùng thương con cái. Câu chuyện phim tập trung về hai cha con Ba Sang (Trấn Thành) \nvà Quắn (Tuấn Trần). Dù yêu thương nhau nhưng khoảng cách thế hệ đã đem đến những bất đồng lớn giữa hai cha con. Liệu cả hai có \nthể cho nhau cơ hội thấu hiểu đối phương, thu hẹp khoảng cách và tạo nên hạnh phúc từ sự khác biệt?', '1200x1800_1.jpg', 'PDp4Ic8ZGUM', b'1'),
(2, 'ACT', 'C18', 'MORTAL KOMBAT: CUỘC CHIẾN SINH TỬ', 'Simon McQuoid', 'Lewis Tan, Jessica McNamee, Josh Lawson, Joe Taslim, Tadanobu Asano, Mehcad Brooks', '2021-04-09', '01:50:00', 'Tiếng Anh - Phụ đề Tiếng Việt', 'Mortal Kombat: Cuộc Chiến Sinh Tử xoay quanh võ sĩ võ thuật tổng hợp Cole Young (Lewis Tan), người mang trên mình một vết chàm \nrồng đen bí ẩn - biểu tượng của Mortal Kombat. Cole Young không hề biết về dòng máu bí ẩn đang chảy trong người anh, hay vì sao \nanh lại bị tên sát thủ Sub-Zero (Joe Taslim) săn lùng. Vì sự an nguy của gia đình, Cole cùng với một nhóm những chiến binh đã được \ntuyển chọn để tham gia vào một trận chiến đẫm máu nhằm chống lại những kẻ thù đến từ Outworld.', 'mortal_kombat_vn_payoff_poster.jpg', 'Eu9G8nO5-Ug', b'1'),
(3, 'HOR', 'C18', 'BÀN TAY DIỆT QUỶ', 'Kim Joo Hwan', 'Park Seo Joon, Ahn Sung Ki, Woo Do Hwan, Choi Woo Sik…', '2021-04-09', '02:08:00', 'Tiếng Hàn - Phụ đề tiếng Việt', 'Sau khi bản thân bỗng nhiên sở hữu “Bàn tay diệt quỷ”, võ sĩ MMA Yong Hoo (Park Seo Joon thủ vai) đã dấn thân vào hành trình trừ tà, \ntrục quỷ đối đầu với Giám Mục Bóng Tối (Woo Do Hwan) – tên quỷ Satan đột lốt người. Từ đó sự thật về cái chết của cha Yong Hoo cũng \ndần được hé lộ cũng như nguyên nhân anh trở thành “người được chọn”.', 'btdq_main_poster_1.jpg', 'OuIxS_LlnQs', b'1'),
(4, 'ANI', 'P', 'ONG NHÍ PHIÊU LƯU KÝ: GIẢI CỨU CÔNG CHÚA KIẾN', 'Noel Cleary', 'Coco Jack Gillies, Evie Gillies, Benson Jack Anthony, Justine Clarke, Shane Dundas; David Collins', '2021-04-23', '01:28:00', 'Tiếng Anh - Phụ đề Tiếng Việt; Lồng tiếng', 'Quá háo hức chào đón mùa xuân, Maya và Willy đã thức dậy khỏi giấc ngủ đông sớm hơn thời gian dự định. Từ đây, đôi bạn vô \ntình phải nhận một nhiệm vụ đặc biệt – bảo vệ và đưa quả trứng vàng đến ngôi nhà mới. Tuy nhiên, mọi rắc rối bắt đầu ập đến \nkhi quả trứng nứt và cô công chúa kiến bé nhỏ ra đời. Maya, Willy và những người bạn đồng hành phải phối hợp cùng nhau để chăm sóc \nvà bảo vệ công chúa kiến khỏi vô vàn nguy hiểm xung quanh. Trong hành trình đầy bất ngờ và gian nan này, Willy dần dần khám phá \nđược một khía cạnh khác của bản thân – dịu dàng và kiên nhẫn \nvới cô công chúa nhỏ. Bộ đôi Maya và Willy cũng đã trưởng thành hơn và tình bạn giữa họ càng trở nên thêm khăng khít và gắn bó.', 'main_poster_mtb_1__1.jpg', 'tQceO8GpWNU', b'1'),
(5, 'HUMOR', 'P', 'CỤC NỢ HÓA CỤC CƯNG', 'Kang Dae Kyu', 'Sung Dong Il, Ha Ji Won, Kim Hiewon, Park Soi', '2021-10-09', '01:53:00', 'Tiếng Hàn - Phụ đề Tiếng Việt', 'Du-seok (Sung Dong Il) và Jong-bae (Kim Hiewon) là hai gã chuyên đòi nợ thuê có máu mặt. Để uy hiếp một con nợ, cả hai đã bắt \nSeung-yi (Park Soi) - một bé gái 9 tuổi làm vật thế chấp cho số nợ của mẹ cô bé. Tuy nhiên, mẹ của Seung-yi lại bị trục xuất về \nnước, và hai ông chú đành nhận trách nhiệm trông chừng Seung-yi đến khi cô bé được một gia đình giàu có nhận nuôi. Khi phát hiện \nra Seung-yi nhỏ bé bị bán đi làm công cho một bà chủ vô trách nhiệm, Du-seok đã tìm đến để chuộc lại cô bé. Mặc dù Seung-yi vốn là \n\"cục nợ\" Du-seok và Jong-bae không hề mong muốn, cô bé dần trở thành cục cưng yêu quý và cả 3 sống bên nhau như một gia đình. (CHIẾU LẠI từ 5/5/21)', 'rsz_main_poster_cncc_1.jpg', 'fZa5Cz4GJlY', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderfoods`
--

CREATE TABLE `orderfoods` (
  `Id` int(11) NOT NULL,
  `Orderid` varchar(10) NOT NULL,
  `Foodsid` int(11) NOT NULL,
  `Discount` float NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `Id` varchar(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Createdate` date NOT NULL,
  `Time` time NOT NULL,
  `Totalmoney` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`Id`, `Username`, `Createdate`, `Time`, `Totalmoney`, `Active`) VALUES
('OR1', 'thainmpc00782', '2021-10-21', '08:43:24', 218000, 1),
('OR2', 'thainmpc00782', '2021-10-21', '01:38:00', 200000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `price_history`
--

CREATE TABLE `price_history` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Foodsid` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Createdate` date NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `price_shows`
--

CREATE TABLE `price_shows` (
  `Id` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Createdate` date NOT NULL,
  `Expiry` date NOT NULL,
  `Timeslot` time NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `price_shows`
--

INSERT INTO `price_shows` (`Id`, `Price`, `Createdate`, `Expiry`, `Timeslot`, `Activity`) VALUES
(1, 60000, '2021-10-01', '2021-01-02', '08:30:00', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rateds`
--

CREATE TABLE `rateds` (
  `Id` varchar(4) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rateds`
--

INSERT INTO `rateds` (`Id`, `Name`) VALUES
('C13', 'C13 - PHIM CẤM KHÁN GIẢ DƯỚI 13 TUỔI'),
('C16', 'C16 - PHIM CẤM KHÁN GIẢ DƯỚI 16 TUỔI'),
('C18', 'C18 - PHIM CẤM KHÁN GIẢ DƯỚI 18 TUỔI'),
('P', 'P - PHIM DÀNH CHO MỌI ĐỐI TƯỢNG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `Id` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`Id`, `Name`) VALUES
('MOD', 'ROLE_MODERATOR'),
('STA', 'ROLE_STAFF'),
('US', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `Id` int(11) NOT NULL,
  `Cinemasid` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Totalcolumn` int(11) NOT NULL,
  `Totalrow` int(11) NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`Id`, `Cinemasid`, `Name`, `Totalcolumn`, `Totalrow`, `Activity`) VALUES
(1, 5, 'Phòng 1', 5, 5, b'1'),
(2, 6, 'Phòng 2', 5, 5, b'1'),
(3, 3, 'Phòng 3', 5, 5, b'1'),
(4, 5, 'Phòng 4', 5, 5, b'1'),
(5, 2, 'Phòng 5', 5, 5, b'1'),
(6, 4, 'Phòng 3', 5, 5, b'1'),
(7, 5, 'Phòng 2', 5, 5, b'1'),
(8, 4, 'Phòng 4', 5, 5, b'1'),
(9, 3, 'Phòng 5', 5, 5, b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `Id` int(11) NOT NULL,
  `Foodsid` int(11) NOT NULL,
  `Discount` float NOT NULL,
  `Startdate` date NOT NULL,
  `Enddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seats`
--

CREATE TABLE `seats` (
  `Id` int(11) NOT NULL,
  `Roomsid` int(11) NOT NULL,
  `Typesid` int(11) NOT NULL,
  `Rowposition` varchar(5) NOT NULL,
  `Colposition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `seats`
--

INSERT INTO `seats` (`Id`, `Roomsid`, `Typesid`, `Rowposition`, `Colposition`) VALUES
(1, 1, 2, 'A', 1),
(2, 1, 2, 'A', 2),
(3, 1, 2, 'A', 3),
(4, 1, 2, 'A', 4),
(5, 1, 2, 'A', 5),
(6, 1, 2, 'B', 1),
(7, 1, 2, 'B', 2),
(8, 1, 2, 'B', 3),
(9, 1, 2, 'B', 4),
(10, 1, 2, 'B', 5),
(11, 1, 1, 'C', 1),
(12, 1, 1, 'C', 2),
(13, 1, 1, 'C', 3),
(14, 1, 1, 'C', 4),
(15, 1, 1, 'C', 5),
(16, 1, 1, 'D', 1),
(17, 1, 1, 'D', 2),
(18, 1, 1, 'D', 3),
(19, 1, 1, 'D', 4),
(20, 1, 1, 'D', 5),
(21, 1, 1, 'E', 1),
(22, 1, 1, 'E', 2),
(23, 1, 1, 'E', 3),
(24, 1, 1, 'E', 4),
(25, 1, 1, 'E', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shows`
--

CREATE TABLE `shows` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Moviesid` int(11) NOT NULL,
  `Roomsid` int(11) NOT NULL,
  `Priceid` int(11) NOT NULL,
  `Showdate` date NOT NULL,
  `Starttime` time NOT NULL,
  `Endtime` time NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shows`
--

INSERT INTO `shows` (`Id`, `Username`, `Moviesid`, `Roomsid`, `Priceid`, `Showdate`, `Starttime`, `Endtime`, `Activity`) VALUES
(1, 'huyntpc00617', 1, 1, 1, '2020-10-05', '08:30:00', '10:00:00', b'0'),
(2, 'huyntpc00617', 5, 7, 1, '2021-10-25', '08:30:00', '10:00:00', b'0'),
(3, 'huyntpc00617', 5, 2, 1, '2021-10-25', '08:30:00', '10:00:00', b'0'),
(4, 'huyntpc00617', 3, 9, 1, '2021-10-25', '08:30:00', '10:00:00', b'0'),
(5, 'huyntpc00617', 1, 2, 1, '2021-10-25', '08:30:00', '10:00:00', b'1'),
(6, 'huyntpc00617', 1, 2, 1, '2021-10-25', '08:30:00', '10:30:00', b'1'),
(7, 'huyntpc00617', 2, 9, 1, '2021-10-25', '14:28:27', '15:30:00', b'1'),
(8, 'huyntpc00617', 2, 8, 1, '2021-10-25', '14:29:08', '15:30:00', b'1'),
(9, 'huyntpc00617', 1, 8, 1, '2021-10-25', '10:30:00', '13:30:00', b'1'),
(10, 'huyntpc00617', 1, 7, 1, '2021-10-25', '13:30:00', '15:30:00', b'1'),
(11, 'huyntpc00617', 1, 5, 1, '2021-10-26', '08:30:00', '10:30:00', b'1'),
(12, 'huyntpc00617', 1, 7, 1, '2021-10-26', '08:30:00', '10:30:00', b'1'),
(13, 'huyntpc00617', 4, 2, 1, '2021-10-26', '08:30:00', '10:30:00', b'1'),
(14, 'huyntpc00617', 4, 2, 1, '2021-10-26', '08:30:00', '10:30:00', b'1'),
(15, 'huyntpc00617', 1, 1, 1, '2021-10-27', '08:30:00', '10:30:00', b'1'),
(16, 'huyntpc00617', 1, 1, 1, '2021-10-27', '08:30:00', '10:30:00', b'1'),
(17, 'huyntpc00617', 1, 1, 1, '2021-11-03', '08:30:00', '10:30:00', b'1'),
(18, 'huyntpc00617', 1, 7, 1, '2021-11-03', '08:30:00', '10:30:00', b'1'),
(19, 'huyntpc00617', 2, 8, 1, '2021-11-03', '08:30:00', '10:30:00', b'1'),
(20, 'huyntpc00617', 1, 8, 1, '2021-11-03', '08:30:00', '10:30:00', b'1'),
(21, 'huyntpc00617', 1, 4, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(22, 'huyntpc00617', 1, 6, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(23, 'huyntpc00617', 5, 6, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(24, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(25, 'huyntpc00617', 2, 7, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(26, 'huyntpc00617', 1, 3, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(27, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(28, 'huyntpc00617', 1, 3, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(29, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(30, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(31, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(32, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(33, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(34, 'huyntpc00617', 1, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(35, 'huyntpc00617', 1, 1, 1, '2021-11-04', '09:30:00', '11:00:00', b'1'),
(36, 'huyntpc00617', 2, 3, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(37, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(38, 'huyntpc00617', 2, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(39, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(40, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(41, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(42, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(43, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(44, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(45, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(46, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(47, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(48, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(49, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(50, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(51, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(52, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(53, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(54, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(55, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(56, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(57, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(58, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(59, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(60, 'huyntpc00617', 1, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(61, 'huyntpc00617', 5, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(62, 'huyntpc00617', 5, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(63, 'huyntpc00617', 5, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(64, 'huyntpc00617', 3, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'0'),
(65, 'huyntpc00617', 3, 2, 1, '2021-11-04', '08:30:00', '10:30:00', b'0'),
(66, 'huyntpc00617', 3, 1, 1, '2021-11-04', '08:30:00', '10:30:00', b'1'),
(67, 'huyntpc00617', 1, 1, 1, '2021-11-05', '08:30:00', '10:30:00', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `Id` varchar(10) NOT NULL,
  `Orderid` varchar(10) NOT NULL,
  `Showsid` int(11) NOT NULL,
  `Seatid` int(11) NOT NULL,
  `Createdate` date NOT NULL,
  `Totalmoney` int(11) NOT NULL,
  `Ticketprice` int(11) NOT NULL,
  `Discount` float NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets_coupons`
--

CREATE TABLE `tickets_coupons` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Couponsid` varchar(15) NOT NULL,
  `Dateuse` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `Id` varchar(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Expiry` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `types`
--

CREATE TABLE `types` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surcharge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `types`
--

INSERT INTO `types` (`Id`, `Name`, `Surcharge`) VALUES
(1, 'VIP', 20000),
(2, 'Thường', 10000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `Username` varchar(30) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `CMND` varchar(12) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Gender` bit(1) NOT NULL,
  `Image` varchar(30) NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`Username`, `Fullname`, `Password`, `Email`, `Phone`, `CMND`, `Address`, `Gender`, `Image`, `Activity`) VALUES
('hainnpc00645', 'Nguyễn Ngọc Hải', '1234', 'hainnpc00645@fpt.edu.vn', '0867707413', '038159001769', 'Cần Thơ', b'0', 'a1.jpg', b'0'),
('hieunnpc00795', 'Nguyễn Ngọc Hiếu', '1234', 'hieunnpc00795@fpt.edu.vn', '0914688501', '001089000098', 'Kiên Giang', b'0', 'a2.jpg', b'0'),
('huyntpc00617', 'Nguyễn Thành Huy', '1234', 'huyntpc00617@fpt.edu.vn', '0767905592', '036087000067', 'Cần Thơ', b'0', 'a3.jpg', b'0'),
('khue', 'Khuê', '2566', 'khueho11a3@gmail.com', '0788979575', '52235', 'adad', b'1', 'user.png', b'1'),
('khuehnpc00516', 'Hồ Như Khuê', '1234', 'khuehnpc00516@fpt.edu.vn', '0788979575', '079201000046', 'Cần Thơ', b'0', 'a4.jpg', b'0'),
('nhieuntpc00810', 'Nguyễn Thanh Nhiều', '1234', 'nhieuntpc00810@fpt.edu.vn', '0396634180', '001183000001', 'Sóc Trăng', b'0', 'a5.jpg', b'0'),
('staff', 'Khuê', '5555', 'khuehnpc00516@fpt.edu.vn', '0788979575', '565644', '36 đường 3/2 Hưng Lợi Ninh Kiều Tp Cần Thơ', b'1', '6f48f7e8.jpg', b'1'),
('thainmpc00782', 'Nguyễn Minh Thái', '1234', 'thainmpc00782@fpt.edu.vn', '0933824823', '001304027098', 'Cần Thơ', b'0', 'c1.jpg', b'0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`),
  ADD KEY `Roleid` (`Roleid`);

--
-- Chỉ mục cho bảng `censors`
--
ALTER TABLE `censors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`),
  ADD KEY `Showid` (`Showid`);

--
-- Chỉ mục cho bảng `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Cityid` (`Cityid`);

--
-- Chỉ mục cho bảng `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Cinemasid` (`Cinemasid`);

--
-- Chỉ mục cho bảng `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Genresid` (`Genresid`),
  ADD KEY `Ratedsid` (`Ratedsid`);

--
-- Chỉ mục cho bảng `orderfoods`
--
ALTER TABLE `orderfoods`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Orderid` (`Orderid`),
  ADD KEY `Foodsid` (`Foodsid`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`);

--
-- Chỉ mục cho bảng `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`),
  ADD KEY `Foodsid` (`Foodsid`);

--
-- Chỉ mục cho bảng `price_shows`
--
ALTER TABLE `price_shows`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `rateds`
--
ALTER TABLE `rateds`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Cinemasid` (`Cinemasid`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Foodsid` (`Foodsid`);

--
-- Chỉ mục cho bảng `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Roomsid` (`Roomsid`),
  ADD KEY `Typesid` (`Typesid`);

--
-- Chỉ mục cho bảng `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`),
  ADD KEY `Moviesid` (`Moviesid`),
  ADD KEY `Roomsid` (`Roomsid`),
  ADD KEY `Priceid` (`Priceid`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Orderid` (`Orderid`),
  ADD KEY `Showsid` (`Showsid`),
  ADD KEY `Seatid` (`Seatid`);

--
-- Chỉ mục cho bảng `tickets_coupons`
--
ALTER TABLE `tickets_coupons`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`),
  ADD KEY `Couponsid` (`Couponsid`);

--
-- Chỉ mục cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Username` (`Username`);

--
-- Chỉ mục cho bảng `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authorities`
--
ALTER TABLE `authorities`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `censors`
--
ALTER TABLE `censors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orderfoods`
--
ALTER TABLE `orderfoods`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `price_history`
--
ALTER TABLE `price_history`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `price_shows`
--
ALTER TABLE `price_shows`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `seats`
--
ALTER TABLE `seats`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `shows`
--
ALTER TABLE `shows`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `tickets_coupons`
--
ALTER TABLE `tickets_coupons`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `types`
--
ALTER TABLE `types`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`),
  ADD CONSTRAINT `authorities_ibfk_2` FOREIGN KEY (`Roleid`) REFERENCES `roles` (`Id`);

--
-- Các ràng buộc cho bảng `censors`
--
ALTER TABLE `censors`
  ADD CONSTRAINT `censors_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`),
  ADD CONSTRAINT `censors_ibfk_2` FOREIGN KEY (`Showid`) REFERENCES `shows` (`Id`);

--
-- Các ràng buộc cho bảng `cinemas`
--
ALTER TABLE `cinemas`
  ADD CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`Cityid`) REFERENCES `cities` (`Id`);

--
-- Các ràng buộc cho bảng `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`Cinemasid`) REFERENCES `cinemas` (`Id`);

--
-- Các ràng buộc cho bảng `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`Genresid`) REFERENCES `genres` (`Id`),
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`Ratedsid`) REFERENCES `rateds` (`Id`);

--
-- Các ràng buộc cho bảng `orderfoods`
--
ALTER TABLE `orderfoods`
  ADD CONSTRAINT `orderfoods_ibfk_1` FOREIGN KEY (`Orderid`) REFERENCES `orders` (`Id`),
  ADD CONSTRAINT `orderfoods_ibfk_2` FOREIGN KEY (`Foodsid`) REFERENCES `foods` (`Id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`);

--
-- Các ràng buộc cho bảng `price_history`
--
ALTER TABLE `price_history`
  ADD CONSTRAINT `price_history_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`),
  ADD CONSTRAINT `price_history_ibfk_2` FOREIGN KEY (`Foodsid`) REFERENCES `foods` (`Id`);

--
-- Các ràng buộc cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`Cinemasid`) REFERENCES `cinemas` (`Id`);

--
-- Các ràng buộc cho bảng `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Foodsid`) REFERENCES `foods` (`Id`);

--
-- Các ràng buộc cho bảng `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`Roomsid`) REFERENCES `rooms` (`Id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`Typesid`) REFERENCES `types` (`Id`);

--
-- Các ràng buộc cho bảng `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`Moviesid`) REFERENCES `movies` (`Id`),
  ADD CONSTRAINT `shows_ibfk_3` FOREIGN KEY (`Roomsid`) REFERENCES `rooms` (`Id`),
  ADD CONSTRAINT `shows_ibfk_4` FOREIGN KEY (`Priceid`) REFERENCES `price_shows` (`Id`);

--
-- Các ràng buộc cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`Orderid`) REFERENCES `orders` (`Id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`Showsid`) REFERENCES `shows` (`Id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`Seatid`) REFERENCES `seats` (`Id`);

--
-- Các ràng buộc cho bảng `tickets_coupons`
--
ALTER TABLE `tickets_coupons`
  ADD CONSTRAINT `tickets_coupons_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`),
  ADD CONSTRAINT `tickets_coupons_ibfk_2` FOREIGN KEY (`Couponsid`) REFERENCES `coupons` (`Id`);

--
-- Các ràng buộc cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
