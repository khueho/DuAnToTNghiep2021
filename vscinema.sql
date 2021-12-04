-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2021 lúc 02:59 PM
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
(1, 'hieunnpc00795', 'MOD'),
(2, 'khuehnpc00516', 'MOD'),
(3, 'nhieuntpc00810', 'STA'),
(4, 'huyntpc00617', 'STA'),
(5, 'thainmpc00782', 'US'),
(6, 'hainnpc00645', 'US');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `censors`
--

CREATE TABLE `censors` (
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Showid` int(11) NOT NULL,
  `Createdate` date NOT NULL,
  `Status` int(11) NOT NULL
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
(1, '01HN', 'CGV Hồ Gươm Plaza', 'Tầng 3, TTTM Hồ Gươm Plaza, 110 Trần Phú, Phường Mỗ Lao, Quận Hà Đông, Hà Nội'),
(2, '01HN', 'CGV Vincom Center Bà Triệu', 'Tầng 6, Toà nhà VinCom Center Hà Nội 191 đường Bà Triệu Quận Hai Bà Trưng Hà Nội'),
(3, '01HN', 'CGV Vincom Royal City', 'Tầng B2- Khu R4, TTTM Vincom Mega Mall Royal City , 72A Nguyễn Trãi,Thanh Xuân, Hà Nội.'),
(4, '02HCM', 'CGV Hùng Vương Plaza', 'Tầng 7 | Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh'),
(5, '02HCM', 'CGV Aeon Tân Phú', 'Lầu 3, Aeon Mall 30 Bờ Bao Tân Thắng, P. Sơn Kỳ Quận Tân Phú TP. Hồ Chí Minh'),
(6, '02HCM', 'CGV Vivo City', 'Lầu 5, Trung tâm thương mại SC VivoCity - 1058 Nguyễn Văn Linh, Quận 7'),
(7, '55CT', 'CGV Vincom Hùng Vương', '02 Hùng Vương, Quận Ninh Kiều, TP. Cần Thơ'),
(8, '55CT', 'CGV Vincom Xuân Khánh', 'Tầng 5, Tòa nhà 209, Đường 30/04, Phường Xuân Khánh, Quận Ninh Kiều, Tp. Cần Thơ'),
(9, '55CT', 'CGV Sense City', 'Lầu 3, Sense City 1 Đại Lộ Hòa Bình Quận Ninh Kiều TP. Cần Thơ');

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

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`Id`, `Createdate`, `Expiry`, `Discount`, `Quantity`, `Activity`) VALUES
('CgO0xBkKrXr', '2021-08-09', '2021-10-27', 30, 20, b'1'),
('HoyjRQ8QtcA', '2021-09-09', '2021-10-31', 15, 10, b'1'),
('K5o8iLm9p1e', '2021-10-09', '2021-12-30', 25, 10, b'1'),
('nXK92NuqWTB', '2021-10-09', '2021-11-29', 10, 15, b'1'),
('p7PFOEXdfpL', '2021-09-09', '2021-12-28', 35, 0, b'1'),
('rQT1sVpfnUQ', '2021-09-09', '2021-11-27', 20, 10, b'1');

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
(1, 2, 'SNACK COMBO', 109000, '2021-05-10', '1 Bắp Lớn + 2 Nước Lớn + 1 Snack.', b'1', 'SNACK_COMBO.png'),
(2, 2, 'MILO COMBO 2021', 99000, '2021-05-10', '1 bắp Caramel lớn + 1 Milo hộp giấy + 1 nước ngọt', b'1', 'MILO_COMBO_2021.png'),
(3, 2, 'MY COMBO', 79000, '2021-05-10', '1 bắp vừa + 1 nước siêu lớn.', b'1', 'MY_COMBO.png'),
(4, 2, 'CGV COMBO', 99000, '2021-05-10', '1 bắp lớn + 2 nước lớn.', b'1', 'CGV_COMBO.png'),
(5, 2, 'FAST 9 SINGLE COMBO', 159000, '2021-05-10', '1 ly Fast 9 (kèm nước) + 1 bắp ngọt lớn.', b'1', 'FAST_9_SINGLE_COMBO.png');

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
  `Activity` bit(1) NOT NULL,
  `Banner` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`Id`, `Genresid`, `Ratedsid`, `Name`, `Director`, `Cast`, `Releasedate`, `Runningtime`, `Language`, `Summary`, `Poster`, `Trailer`, `Activity`, `Banner`) VALUES
(1, 'FML', 'C13', 'BỐ GIÀ', 'Vũ Ngọc Đãng & Trấn Thành', 'Trấn Thành, Tuấn Trần, Ngân Chi, NSND Ngọc Giàu, Lê Giang,...', '2021-03-12', '02:08:00', 'Tiếng Việt - Phụ đề Tiếng Anh', 'Phim sẽ xoay quanh lối sống thường nhật của một xóm lao động nghèo, ở đó có bộ tứ anh em Giàu - Sang - Phú - Quý với Ba Sang \nsẽ là nhân vật chính, hay lo chuyện bao đồng nhưng vô cùng thương con cái. Câu chuyện phim tập trung về hai cha con Ba Sang (Trấn Thành) \nvà Quắn (Tuấn Trần). Dù yêu thương nhau nhưng khoảng cách thế hệ đã đem đến những bất đồng lớn giữa hai cha con. Liệu cả hai có \nthể cho nhau cơ hội thấu hiểu đối phương, thu hẹp khoảng cách và tạo nên hạnh phúc từ sự khác biệt?', '1200x1800_1.jpg', 'PDp4Ic8ZGUM', b'1', NULL),
(2, 'ACT', 'C18', 'MORTAL KOMBAT: CUỘC CHIẾN SINH TỬ', 'Simon McQuoid', 'Lewis Tan, Jessica McNamee, Josh Lawson, Joe Taslim, Tadanobu Asano, Mehcad Brooks', '2021-04-09', '01:50:00', 'Tiếng Anh - Phụ đề Tiếng Việt', 'Mortal Kombat: Cuộc Chiến Sinh Tử xoay quanh võ sĩ võ thuật tổng hợp Cole Young (Lewis Tan), người mang trên mình một vết chàm \nrồng đen bí ẩn - biểu tượng của Mortal Kombat. Cole Young không hề biết về dòng máu bí ẩn đang chảy trong người anh, hay vì sao \nanh lại bị tên sát thủ Sub-Zero (Joe Taslim) săn lùng. Vì sự an nguy của gia đình, Cole cùng với một nhóm những chiến binh đã được \ntuyển chọn để tham gia vào một trận chiến đẫm máu nhằm chống lại những kẻ thù đến từ Outworld.', 'mortal_kombat_vn_payoff_poster.jpg', 'Eu9G8nO5-Ug', b'1', NULL),
(3, 'HOR', 'C18', 'BÀN TAY DIỆT QUỶ', 'Kim Joo Hwan', 'Park Seo Joon, Ahn Sung Ki, Woo Do Hwan, Choi Woo Sik…', '2021-04-09', '02:08:00', 'Tiếng Hàn - Phụ đề tiếng Việt', 'Sau khi bản thân bỗng nhiên sở hữu “Bàn tay diệt quỷ”, võ sĩ MMA Yong Hoo (Park Seo Joon thủ vai) đã dấn thân vào hành trình trừ tà, \ntrục quỷ đối đầu với Giám Mục Bóng Tối (Woo Do Hwan) – tên quỷ Satan đột lốt người. Từ đó sự thật về cái chết của cha Yong Hoo cũng \ndần được hé lộ cũng như nguyên nhân anh trở thành “người được chọn”.', 'btdq_main_poster_1.jpg', 'OuIxS_LlnQs', b'1', NULL),
(4, 'ANI', 'P', 'ONG NHÍ PHIÊU LƯU KÝ: GIẢI CỨU CÔNG CHÚA KIẾN', 'Noel Cleary', 'Coco Jack Gillies, Evie Gillies, Benson Jack Anthony, Justine Clarke, Shane Dundas; David Collins', '2021-04-23', '01:28:00', 'Tiếng Anh - Phụ đề Tiếng Việt; Lồng tiếng', 'Quá háo hức chào đón mùa xuân, Maya và Willy đã thức dậy khỏi giấc ngủ đông sớm hơn thời gian dự định. Từ đây, đôi bạn vô \ntình phải nhận một nhiệm vụ đặc biệt – bảo vệ và đưa quả trứng vàng đến ngôi nhà mới. Tuy nhiên, mọi rắc rối bắt đầu ập đến \nkhi quả trứng nứt và cô công chúa kiến bé nhỏ ra đời. Maya, Willy và những người bạn đồng hành phải phối hợp cùng nhau để chăm sóc \nvà bảo vệ công chúa kiến khỏi vô vàn nguy hiểm xung quanh. Trong hành trình đầy bất ngờ và gian nan này, Willy dần dần khám phá \nđược một khía cạnh khác của bản thân – dịu dàng và kiên nhẫn \nvới cô công chúa nhỏ. Bộ đôi Maya và Willy cũng đã trưởng thành hơn và tình bạn giữa họ càng trở nên thêm khăng khít và gắn bó.', 'main_poster_mtb_1__1.jpg', 'tQceO8GpWNU', b'1', NULL),
(5, 'HUMOR', 'P', 'CỤC NỢ HÓA CỤC CƯNG', 'Kang Dae Kyu', 'Sung Dong Il, Ha Ji Won, Kim Hiewon, Park Soi', '2021-10-09', '01:53:00', 'Tiếng Hàn - Phụ đề Tiếng Việt', 'Du-seok (Sung Dong Il) và Jong-bae (Kim Hiewon) là hai gã chuyên đòi nợ thuê có máu mặt. Để uy hiếp một con nợ, cả hai đã bắt \nSeung-yi (Park Soi) - một bé gái 9 tuổi làm vật thế chấp cho số nợ của mẹ cô bé. Tuy nhiên, mẹ của Seung-yi lại bị trục xuất về \nnước, và hai ông chú đành nhận trách nhiệm trông chừng Seung-yi đến khi cô bé được một gia đình giàu có nhận nuôi. Khi phát hiện \nra Seung-yi nhỏ bé bị bán đi làm công cho một bà chủ vô trách nhiệm, Du-seok đã tìm đến để chuộc lại cô bé. Mặc dù Seung-yi vốn là \n\"cục nợ\" Du-seok và Jong-bae không hề mong muốn, cô bé dần trở thành cục cưng yêu quý và cả 3 sống bên nhau như một gia đình. (CHIẾU LẠI từ 5/5/21)', 'rsz_main_poster_cncc_1.jpg', 'fZa5Cz4GJlY', b'1', NULL),
(6, 'ACT', 'C18', 'VENOM: ĐỐI MẶT TỬ THÙ', 'Andy Serkis', 'Tom Hardy, Michelle Williams, Woody Harrelson, Naomie Harris', '2021-12-31', '01:37:00', 'Tiếng Anh-  Phụ đề Tiếng việt', '18 tháng sau các sự kiện trong Venom (2018), phóng viên Eddie Brock cố gắng làm quen với việc sống như 1 vật chủ của sinh vật ngoài hành tinh Venom, kẻ ban cho anh siêu năng lực nhưng cũng khiến anh phải cảnh giác. Brock cố gắng xây dựng lại sự nghiệp của mình bằng cách phỏng vấn tên sát nhân Cletus Kasady, kẻ trở thành vật chủ của sinh vật Carnage và bỏ trốn khỏi nhà tù sau khi may mắn thoát khỏi hành quyết', 'venom2poster.jpg', 'EVWdzVtSh1I', b'1', 'venom2.jpg'),
(7, 'ACT', 'C18', 'NO TIME TO DIE:  KHÔNG PHẢI LÚC CHẾT', 'Cary Joji Fukunaga', 'Daniel Craig, Rami Malek, Léa Seydoux', '2021-12-31', '02:46:00', 'Tiếng Anh-  Phụ đề Tiếng việt', 'Phần 25 của bộ phim điệp viên huyền thoại 007 sẽ tiếp nối câu chuyện về James Bond cùng những pha hành động táo bạo và hoành tráng hơn bao giờ hết. Sau sự kiện đầy ám ảnh trong Spectre, Bond lui về ở ẩn tại đất nước Jamaica, sống một cuộc đời cô độc nhưng bình lặng. Bỗng một người bạn cũ từ CIA xuất hiện, cầu xin anh giúp đỡ. Bond bất đắc dĩ phải tái xuất, nhưng không hề biết mình sẽ đối đầu với thế lực nào. Chi tiết đáng chú ý nhất là chiếc mặt nạ trắng vỡ nửa, đánh dấu sự xuất hiện của tên ác nhân kì quái bậc nhất trong cả series 007. Màn chạm trán giữa Bond và kẻ thù nguy hiểm này sẽ vén màn những bí ẩn còn để ngỏ và tiếp theo đó, có thể là một cuộc đối đầu “sinh tử”.', 'notimetodieposter.jpg', 'N_gD9-Oa0fg', b'1', 'notimetodiebanner.jpg'),
(8, 'HOR', 'C16', 'VÙNG ĐẤT CÂM LẶNG II', 'John Krasinski', 'Cillian Murphy, Emily Blunt, Noah Jupe', '2021-12-31', '01:37:00', 'Tiếng Anh-  Phụ đề Tiếng việt', 'Phần hai tiếp nối các sự kiện xảy ra trong phần một, khi gia đình Abbot gồm người mẹ Evelyn (do Emily Blunt thủ vai) cùng ba con chạy trốn đến một thành phố tưởng như an toàn. Tuy nhiên, cả gia đình không ngờ rằng ở thế giới bên ngoài cũng đã bị những sinh vật ngoài hành tinh thâu tóm. Những sinh vật này khiếm khuyết về thị giác nhưng có thính giác siêu nhạy để săn mồi bằng cách lần theo âm thanh. “Vùng đất câm lặng” lúc này đã trở thành “thế giới câm lặng” khi những người sống sót tiếp tục phải lẩn trốn, không được tạo ra tiếng động mỗi khi di chuyển hay giao tiếp với nhau. Nhưng càng bước ra ngoài thế giới, gia đình Abbot sớm nhận ra rằng hiểm họa duy nhất không chỉ đến từ những sinh vật ngoài hành tinh. Những bí ẩn xung quanh cuộc đổ bộ của các giống loài này dần được hé lộ…', 'quietplace2poster.jpg', 'BpdDN9d9Jio', b'1', 'quietplace2banner.jpg'),
(9, 'ACT', 'C13', 'DUNE: HÀNH TINH CÁT', 'Denis Villeneuve', 'Timothée Chalamet, Rebecca Ferguson, Zendaya', '2021-12-31', '02:35:00', 'Tiếng Anh - Phụ đề Tiếng Việt', 'Là chuyến hành trình sử thi đầy cảm xúc của Paul Atreides – một chàng thanh niên trẻ tài ba xuất chúng được sinh ra với một sứ mệnh vĩ đại vượt ngoài tầm hiểu biết của chính bản thân anh. Paul đã phải du hành tới hành tinh nguy hiểm nhất trong Vũ trụ để đảm bảo được tương lai cho gia đình cũng như những người dân của anh ấy. Khi các thế lực tàn độc bắt đầu lao vào cuộc xung đột nhằm tranh giành độc quyền nguồn tài nguyên có giá trị nhất hành tinh – thứ nhiên liệu quý giá có khả năng kích hoạt những tiềm năng lớn nhất của nhân loại – chỉ những người chiến thắng được nỗi sợ hãi của mình mới có thể sống sót…', 'dune.jpg', '8g18jFHCLXk', b'1', 'dunebanner.jpg'),
(10, 'ACT', 'P', 'MISFITS', 'Renny Harlin', 'Jamie Chung, Pierce Brosnan, Tim Roth', '2021-12-31', '01:34:00', 'Tiếng Anh - Phụ đề Tiếng Việt', 'Tên tội phạm khét tiếng, Richard Pace, được tuyển mộ vào một băng cướp với nhiều thành phần bất hảo để tham gia một phi vụ trộm vàng có một không hai. Trớ trêu thay, sự thành bại của phi vụ này không chỉ ảnh hưởng đến tính mạng của những tên trộm mà còn liên quan đến sự sống còn của rất nhiều người.', 'misfits.jpg', 'lxhMLjt83KQ', b'1', 'misfitsbanner.jpg');

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

--
-- Đang đổ dữ liệu cho bảng `orderfoods`
--

INSERT INTO `orderfoods` (`Id`, `Orderid`, `Foodsid`, `Discount`, `Price`, `Quantity`) VALUES
(1, 'odr1', 1, 0, 109000, 1),
(2, 'odr2', 2, 0, 99000, 1),
(3, 'odr3', 3, 0, 79000, 1);

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
('odr1', 'nhieuntpc00810', '2021-10-05', '08:30:00', 300000, 1),
('odr2', 'nhieuntpc00810', '2021-10-05', '08:30:00', 300000, 1),
('odr3', 'huyntpc00617', '2021-10-06', '14:43:00', 300000, 1),
('ord4', 'huyntpc00617', '2021-12-03', '14:42:00', 600000, 1);

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
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `price_shows`
--

INSERT INTO `price_shows` (`Id`, `Price`, `Createdate`, `Expiry`, `Activity`) VALUES
(1, 60000, '2021-10-01', '2021-01-02', b'1');

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
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`Id`, `Cinemasid`, `Name`, `Activity`) VALUES
(1, 1, 'Phòng 1', b'1'),
(2, 1, 'Phòng 2', b'1'),
(3, 2, 'Phòng 3', b'1'),
(4, 2, 'Phòng 4', b'1'),
(5, 3, 'Phòng 5', b'1'),
(6, 3, 'Phòng 6', b'1'),
(7, 4, 'Phòng 7', b'1'),
(8, 4, 'Phòng 8', b'1'),
(9, 5, 'Phòng 9', b'1'),
(10, 5, 'Phòng 10', b'1'),
(11, 6, 'Phòng 11', b'1'),
(12, 6, 'Phòng 12', b'1'),
(13, 7, 'Phòng 13', b'1'),
(14, 7, 'Phòng 14', b'1'),
(15, 8, 'Phòng 15', b'1'),
(16, 8, 'Phòng 16', b'1'),
(17, 9, 'Phòng 17', b'1'),
(18, 9, 'Phòng 18', b'1');

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

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`Id`, `Foodsid`, `Discount`, `Startdate`, `Enddate`) VALUES
(1, 1, 20, '2021-05-10', '2021-06-10'),
(2, 1, 10, '2021-07-10', '2021-07-20'),
(3, 1, 25, '2021-09-10', '2021-09-20'),
(4, 1, 15, '2021-10-10', '2021-10-20'),
(5, 1, 5, '2021-11-10', '2021-12-20'),
(6, 2, 20, '2021-05-10', '2021-06-10'),
(7, 2, 10, '2021-07-10', '2021-07-20'),
(8, 2, 25, '2021-09-10', '2021-09-20'),
(9, 2, 15, '2021-10-10', '2021-10-20'),
(10, 2, 5, '2021-11-10', '2021-12-20'),
(11, 5, 20, '2021-05-10', '2021-06-10'),
(12, 5, 10, '2021-07-10', '2021-07-20'),
(13, 5, 25, '2021-09-10', '2021-09-20'),
(14, 5, 15, '2021-10-10', '2021-10-20'),
(15, 5, 5, '2021-11-10', '2021-11-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seats`
--

CREATE TABLE `seats` (
  `Id` int(11) NOT NULL,
  `Roomsid` int(11) NOT NULL,
  `Typesid` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Position` int(11) NOT NULL,
  `Activity` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `seats`
--

INSERT INTO `seats` (`Id`, `Roomsid`, `Typesid`, `Name`, `Position`, `Activity`) VALUES
(1, 1, 2, 'A1', 9, b'1'),
(2, 1, 2, 'A2', 10, b'1'),
(3, 1, 2, 'A3', 11, b'1'),
(4, 1, 2, 'A4', 12, b'1'),
(5, 1, 2, 'A5', 13, b'1'),
(6, 1, 2, 'B1', 30, b'1'),
(7, 1, 2, 'B2', 31, b'1'),
(8, 1, 2, 'B3', 32, b'1'),
(9, 1, 2, 'B4', 33, b'1'),
(10, 1, 2, 'B5', 34, b'1'),
(11, 1, 2, 'C1', 51, b'1'),
(12, 1, 2, 'C2', 52, b'1'),
(13, 1, 2, 'C3', 53, b'1'),
(14, 1, 2, 'C4', 54, b'1'),
(15, 1, 2, 'C5', 55, b'1'),
(16, 1, 2, 'D1', 72, b'1'),
(17, 1, 2, 'D2', 73, b'1'),
(18, 1, 2, 'D3', 74, b'1'),
(19, 1, 2, 'D4', 75, b'1'),
(20, 1, 2, 'D5', 76, b'1'),
(21, 1, 1, 'E1', 93, b'1'),
(22, 1, 1, 'E2', 94, b'1'),
(23, 1, 1, 'E3', 95, b'1'),
(24, 1, 1, 'E4', 96, b'1'),
(25, 1, 1, 'E5', 97, b'1'),
(26, 2, 2, 'A1', 9, b'1'),
(27, 2, 2, 'A2', 10, b'1'),
(28, 2, 2, 'A3', 11, b'1'),
(29, 2, 2, 'A4', 12, b'1'),
(30, 2, 2, 'A5', 13, b'1'),
(31, 2, 2, 'B1', 30, b'1'),
(32, 2, 2, 'B2', 31, b'1'),
(33, 2, 2, 'B3', 32, b'1'),
(34, 2, 2, 'B4', 33, b'1'),
(35, 2, 2, 'B5', 34, b'1'),
(36, 2, 2, 'C1', 51, b'1'),
(37, 2, 2, 'C2', 52, b'1'),
(38, 2, 2, 'C3', 53, b'1'),
(39, 2, 2, 'C4', 54, b'1'),
(40, 2, 2, 'C5', 55, b'1'),
(41, 2, 2, 'D1', 72, b'1'),
(42, 2, 2, 'D2', 73, b'1'),
(43, 2, 2, 'D3', 74, b'1'),
(44, 2, 2, 'D4', 75, b'1'),
(45, 2, 2, 'D5', 76, b'1'),
(46, 2, 1, 'E1', 93, b'1'),
(47, 2, 1, 'E2', 94, b'1'),
(48, 2, 1, 'E3', 95, b'1'),
(49, 2, 1, 'E4', 96, b'1'),
(50, 2, 1, 'E5', 97, b'1'),
(51, 3, 2, 'A1', 9, b'1'),
(52, 3, 2, 'A2', 10, b'1'),
(53, 3, 2, 'A3', 11, b'1'),
(54, 3, 2, 'A4', 12, b'1'),
(55, 3, 2, 'A5', 13, b'1'),
(56, 3, 2, 'B1', 30, b'1'),
(57, 3, 2, 'B2', 31, b'1'),
(58, 3, 2, 'B3', 32, b'1'),
(59, 3, 2, 'B4', 33, b'1'),
(60, 3, 2, 'B5', 34, b'1'),
(61, 3, 2, 'C1', 51, b'1'),
(62, 3, 2, 'C2', 52, b'1'),
(63, 3, 2, 'C3', 53, b'1'),
(64, 3, 2, 'C4', 54, b'1'),
(65, 3, 2, 'C5', 55, b'1'),
(66, 3, 2, 'D1', 72, b'1'),
(67, 3, 2, 'D2', 73, b'1'),
(68, 3, 2, 'D3', 74, b'1'),
(69, 3, 2, 'D4', 75, b'1'),
(70, 3, 2, 'D5', 76, b'1'),
(71, 3, 1, 'E1', 93, b'1'),
(72, 3, 1, 'E2', 94, b'1'),
(73, 3, 1, 'E3', 95, b'1'),
(74, 3, 1, 'E4', 96, b'1'),
(75, 3, 1, 'E5', 97, b'1'),
(76, 4, 2, 'A1', 9, b'1'),
(77, 4, 2, 'A2', 10, b'1'),
(78, 4, 2, 'A3', 11, b'1'),
(79, 4, 2, 'A4', 12, b'1'),
(80, 4, 2, 'A5', 13, b'1'),
(81, 4, 2, 'B1', 30, b'1'),
(82, 4, 2, 'B2', 31, b'1'),
(83, 4, 2, 'B3', 32, b'1'),
(84, 4, 2, 'B4', 33, b'1'),
(85, 4, 2, 'B5', 34, b'1'),
(86, 4, 2, 'C1', 51, b'1'),
(87, 4, 2, 'C2', 52, b'1'),
(88, 4, 2, 'C3', 53, b'1'),
(89, 4, 2, 'C4', 54, b'1'),
(90, 4, 2, 'C5', 55, b'1'),
(91, 4, 2, 'D1', 72, b'1'),
(92, 4, 2, 'D2', 73, b'1'),
(93, 4, 2, 'D3', 74, b'1'),
(94, 4, 2, 'D4', 75, b'1'),
(95, 4, 2, 'D5', 76, b'1'),
(96, 4, 1, 'E1', 93, b'1'),
(97, 4, 1, 'E2', 94, b'1'),
(98, 4, 1, 'E3', 95, b'1'),
(99, 4, 1, 'E4', 96, b'1'),
(100, 4, 1, 'E5', 97, b'1'),
(101, 5, 2, 'A1', 9, b'1'),
(102, 5, 2, 'A2', 10, b'1'),
(103, 5, 2, 'A3', 11, b'1'),
(104, 5, 2, 'A4', 12, b'1'),
(105, 5, 2, 'A5', 13, b'1'),
(106, 5, 2, 'B1', 30, b'1'),
(107, 5, 2, 'B2', 31, b'1'),
(108, 5, 2, 'B3', 32, b'1'),
(109, 5, 2, 'B4', 33, b'1'),
(110, 5, 2, 'B5', 34, b'1'),
(111, 5, 2, 'C1', 51, b'1'),
(112, 5, 2, 'C2', 52, b'1'),
(113, 5, 2, 'C3', 53, b'1'),
(114, 5, 2, 'C4', 54, b'1'),
(115, 5, 2, 'C5', 55, b'1'),
(116, 5, 2, 'D1', 72, b'1'),
(117, 5, 2, 'D2', 73, b'1'),
(118, 5, 2, 'D3', 74, b'1'),
(119, 5, 2, 'D4', 75, b'1'),
(120, 5, 2, 'D5', 76, b'1'),
(121, 5, 1, 'E1', 93, b'1'),
(122, 5, 1, 'E2', 94, b'1'),
(123, 5, 1, 'E3', 95, b'1'),
(124, 5, 1, 'E4', 96, b'1'),
(125, 5, 1, 'E5', 97, b'1'),
(126, 6, 2, 'A1', 9, b'1'),
(127, 6, 2, 'A2', 10, b'1'),
(128, 6, 2, 'A3', 11, b'1'),
(129, 6, 2, 'A4', 12, b'1'),
(130, 6, 2, 'A5', 13, b'1'),
(131, 6, 2, 'B1', 30, b'1'),
(132, 6, 2, 'B2', 31, b'1'),
(133, 6, 2, 'B3', 32, b'1'),
(134, 6, 2, 'B4', 33, b'1'),
(135, 6, 2, 'B5', 34, b'1'),
(136, 6, 2, 'C1', 51, b'1'),
(137, 6, 2, 'C2', 52, b'1'),
(138, 6, 2, 'C3', 53, b'1'),
(139, 6, 2, 'C4', 54, b'1'),
(140, 6, 2, 'C5', 55, b'1'),
(141, 6, 2, 'D1', 72, b'1'),
(142, 6, 2, 'D2', 73, b'1'),
(143, 6, 2, 'D3', 74, b'1'),
(144, 6, 2, 'D4', 75, b'1'),
(145, 6, 2, 'D5', 76, b'1'),
(146, 6, 1, 'E1', 93, b'1'),
(147, 6, 1, 'E2', 94, b'1'),
(148, 6, 1, 'E3', 95, b'1'),
(149, 6, 1, 'E4', 96, b'1'),
(150, 6, 1, 'E5', 97, b'1'),
(151, 7, 2, 'A1', 9, b'1'),
(152, 7, 2, 'A2', 10, b'1'),
(153, 7, 2, 'A3', 11, b'1'),
(154, 7, 2, 'A4', 12, b'1'),
(155, 7, 2, 'A5', 13, b'1'),
(156, 7, 2, 'B1', 30, b'1'),
(157, 7, 2, 'B2', 31, b'1'),
(158, 7, 2, 'B3', 32, b'1'),
(159, 7, 2, 'B4', 33, b'1'),
(160, 7, 2, 'B5', 34, b'1'),
(161, 7, 2, 'C1', 51, b'1'),
(162, 7, 2, 'C2', 52, b'1'),
(163, 7, 2, 'C3', 53, b'1'),
(164, 7, 2, 'C4', 54, b'1'),
(165, 7, 2, 'C5', 55, b'1'),
(166, 7, 2, 'D1', 72, b'1'),
(167, 7, 2, 'D2', 73, b'1'),
(168, 7, 2, 'D3', 74, b'1'),
(169, 7, 2, 'D4', 75, b'1'),
(170, 7, 2, 'D5', 76, b'1'),
(171, 7, 1, 'E1', 93, b'1'),
(172, 7, 1, 'E2', 94, b'1'),
(173, 7, 1, 'E3', 95, b'1'),
(174, 7, 1, 'E4', 96, b'1'),
(175, 7, 1, 'E5', 97, b'1'),
(176, 8, 2, 'A1', 9, b'1'),
(177, 8, 2, 'A2', 10, b'1'),
(178, 8, 2, 'A3', 11, b'1'),
(179, 8, 2, 'A4', 12, b'1'),
(180, 8, 2, 'A5', 13, b'1'),
(181, 8, 2, 'B1', 30, b'1'),
(182, 8, 2, 'B2', 31, b'1'),
(183, 8, 2, 'B3', 32, b'1'),
(184, 8, 2, 'B4', 33, b'1'),
(185, 8, 2, 'B5', 34, b'1'),
(186, 8, 2, 'C1', 51, b'1'),
(187, 8, 2, 'C2', 52, b'1'),
(188, 8, 2, 'C3', 53, b'1'),
(189, 8, 2, 'C4', 54, b'1'),
(190, 8, 2, 'C5', 55, b'1'),
(191, 8, 2, 'D1', 72, b'1'),
(192, 8, 2, 'D2', 73, b'1'),
(193, 8, 2, 'D3', 74, b'1'),
(194, 8, 2, 'D4', 75, b'1'),
(195, 8, 2, 'D5', 76, b'1'),
(196, 8, 1, 'E1', 93, b'1'),
(197, 8, 1, 'E2', 94, b'1'),
(198, 8, 1, 'E3', 95, b'1'),
(199, 8, 1, 'E4', 96, b'1'),
(200, 8, 1, 'E5', 97, b'1'),
(201, 9, 2, 'A1', 9, b'1'),
(202, 9, 2, 'A2', 10, b'1'),
(203, 9, 2, 'A3', 11, b'1'),
(204, 9, 2, 'A4', 12, b'1'),
(205, 9, 2, 'A5', 13, b'1'),
(206, 9, 2, 'B1', 30, b'1'),
(207, 9, 2, 'B2', 31, b'1'),
(208, 9, 2, 'B3', 32, b'1'),
(209, 9, 2, 'B4', 33, b'1'),
(210, 9, 2, 'B5', 34, b'1'),
(211, 9, 2, 'C1', 51, b'1'),
(212, 9, 2, 'C2', 52, b'1'),
(213, 9, 2, 'C3', 53, b'1'),
(214, 9, 2, 'C4', 54, b'1'),
(215, 9, 2, 'C5', 55, b'1'),
(216, 9, 2, 'D1', 72, b'1'),
(217, 9, 2, 'D2', 73, b'1'),
(218, 9, 2, 'D3', 74, b'1'),
(219, 9, 2, 'D4', 75, b'1'),
(220, 9, 2, 'D5', 76, b'1'),
(221, 9, 1, 'E1', 93, b'1'),
(222, 9, 1, 'E2', 94, b'1'),
(223, 9, 1, 'E3', 95, b'1'),
(224, 9, 1, 'E4', 96, b'1'),
(225, 9, 1, 'E5', 97, b'1'),
(226, 10, 2, 'A1', 9, b'1'),
(227, 10, 2, 'A2', 10, b'1'),
(228, 10, 2, 'A3', 11, b'1'),
(229, 10, 2, 'A4', 12, b'1'),
(230, 10, 2, 'A5', 13, b'1'),
(231, 10, 2, 'B1', 30, b'1'),
(232, 10, 2, 'B2', 31, b'1'),
(233, 10, 2, 'B3', 32, b'1'),
(234, 10, 2, 'B4', 33, b'1'),
(235, 10, 2, 'B5', 34, b'1'),
(236, 10, 2, 'C1', 51, b'1'),
(237, 10, 2, 'C2', 52, b'1'),
(238, 10, 2, 'C3', 53, b'1'),
(239, 10, 2, 'C4', 54, b'1'),
(240, 10, 2, 'C5', 55, b'1'),
(241, 10, 2, 'D1', 72, b'1'),
(242, 10, 2, 'D2', 73, b'1'),
(243, 10, 2, 'D3', 74, b'1'),
(244, 10, 2, 'D4', 75, b'1'),
(245, 10, 2, 'D5', 76, b'1'),
(246, 10, 1, 'E1', 93, b'1'),
(247, 10, 1, 'E2', 94, b'1'),
(248, 10, 1, 'E3', 95, b'1'),
(249, 10, 1, 'E4', 96, b'1'),
(250, 10, 1, 'E5', 97, b'1'),
(251, 11, 2, 'A1', 9, b'1'),
(252, 11, 2, 'A2', 10, b'1'),
(253, 11, 2, 'A3', 11, b'1'),
(254, 11, 2, 'A4', 12, b'1'),
(255, 11, 2, 'A5', 13, b'1'),
(256, 11, 2, 'B1', 30, b'1'),
(257, 11, 2, 'B2', 31, b'1'),
(258, 11, 2, 'B3', 32, b'1'),
(259, 11, 2, 'B4', 33, b'1'),
(260, 11, 2, 'B5', 34, b'1'),
(261, 11, 2, 'C1', 51, b'1'),
(262, 11, 2, 'C2', 52, b'1'),
(263, 11, 2, 'C3', 53, b'1'),
(264, 11, 2, 'C4', 54, b'1'),
(265, 11, 2, 'C5', 55, b'1'),
(266, 11, 2, 'D1', 72, b'1'),
(267, 11, 2, 'D2', 73, b'1'),
(268, 11, 2, 'D3', 74, b'1'),
(269, 11, 2, 'D4', 75, b'1'),
(270, 11, 2, 'D5', 76, b'1'),
(271, 11, 1, 'E1', 93, b'1'),
(272, 11, 1, 'E2', 94, b'1'),
(273, 11, 1, 'E3', 95, b'1'),
(274, 11, 1, 'E4', 96, b'1'),
(275, 11, 1, 'E5', 97, b'1'),
(276, 12, 2, 'A1', 9, b'1'),
(277, 12, 2, 'A2', 10, b'1'),
(278, 12, 2, 'A3', 11, b'1'),
(279, 12, 2, 'A4', 12, b'1'),
(280, 12, 2, 'A5', 13, b'1'),
(281, 12, 2, 'B1', 30, b'1'),
(282, 12, 2, 'B2', 31, b'1'),
(283, 12, 2, 'B3', 32, b'1'),
(284, 12, 2, 'B4', 33, b'1'),
(285, 12, 2, 'B5', 34, b'1'),
(286, 12, 2, 'C1', 51, b'1'),
(287, 12, 2, 'C2', 52, b'1'),
(288, 12, 2, 'C3', 53, b'1'),
(289, 12, 2, 'C4', 54, b'1'),
(290, 12, 2, 'C5', 55, b'1'),
(291, 12, 2, 'D1', 72, b'1'),
(292, 12, 2, 'D2', 73, b'1'),
(293, 12, 2, 'D3', 74, b'1'),
(294, 12, 2, 'D4', 75, b'1'),
(295, 12, 2, 'D5', 76, b'1'),
(296, 12, 1, 'E1', 93, b'1'),
(297, 12, 1, 'E2', 94, b'1'),
(298, 12, 1, 'E3', 95, b'1'),
(299, 12, 1, 'E4', 96, b'1'),
(300, 12, 1, 'E5', 97, b'1'),
(301, 13, 2, 'A1', 9, b'1'),
(302, 13, 2, 'A2', 10, b'1'),
(303, 13, 2, 'A3', 11, b'1'),
(304, 13, 2, 'A4', 12, b'1'),
(305, 13, 2, 'A5', 13, b'1'),
(306, 13, 2, 'B1', 30, b'1'),
(307, 13, 2, 'B2', 31, b'1'),
(308, 13, 2, 'B3', 32, b'1'),
(309, 13, 2, 'B4', 33, b'1'),
(310, 13, 2, 'B5', 34, b'1'),
(311, 13, 2, 'C1', 51, b'1'),
(312, 13, 2, 'C2', 52, b'1'),
(313, 13, 2, 'C3', 53, b'1'),
(314, 13, 2, 'C4', 54, b'1'),
(315, 13, 2, 'C5', 55, b'1'),
(316, 13, 2, 'D1', 72, b'1'),
(317, 13, 2, 'D2', 73, b'1'),
(318, 13, 2, 'D3', 74, b'1'),
(319, 13, 2, 'D4', 75, b'1'),
(320, 13, 2, 'D5', 76, b'1'),
(321, 13, 1, 'E1', 93, b'1'),
(322, 13, 1, 'E2', 94, b'1'),
(323, 13, 1, 'E3', 95, b'1'),
(324, 13, 1, 'E4', 96, b'1'),
(325, 13, 1, 'E5', 97, b'1'),
(326, 14, 2, 'A1', 9, b'1'),
(327, 14, 2, 'A2', 10, b'1'),
(328, 14, 2, 'A3', 11, b'1'),
(329, 14, 2, 'A4', 12, b'1'),
(330, 14, 2, 'A5', 13, b'1'),
(331, 14, 2, 'B1', 30, b'1'),
(332, 14, 2, 'B2', 31, b'1'),
(333, 14, 2, 'B3', 32, b'1'),
(334, 14, 2, 'B4', 33, b'1'),
(335, 14, 2, 'B5', 34, b'1'),
(336, 14, 2, 'C1', 51, b'1'),
(337, 14, 2, 'C2', 52, b'1'),
(338, 14, 2, 'C3', 53, b'1'),
(339, 14, 2, 'C4', 54, b'1'),
(340, 14, 2, 'C5', 55, b'1'),
(341, 14, 2, 'D1', 72, b'1'),
(342, 14, 2, 'D2', 73, b'1'),
(343, 14, 2, 'D3', 74, b'1'),
(344, 14, 2, 'D4', 75, b'1'),
(345, 14, 2, 'D5', 76, b'1'),
(346, 14, 1, 'E1', 93, b'1'),
(347, 14, 1, 'E2', 94, b'1'),
(348, 14, 1, 'E3', 95, b'1'),
(349, 14, 1, 'E4', 96, b'1'),
(350, 14, 1, 'E5', 97, b'1'),
(351, 15, 2, 'A1', 9, b'1'),
(352, 15, 2, 'A2', 10, b'1'),
(353, 15, 2, 'A3', 11, b'1'),
(354, 15, 2, 'A4', 12, b'1'),
(355, 15, 2, 'A5', 13, b'1'),
(356, 15, 2, 'B1', 30, b'1'),
(357, 15, 2, 'B2', 31, b'1'),
(358, 15, 2, 'B3', 32, b'1'),
(359, 15, 2, 'B4', 33, b'1'),
(360, 15, 2, 'B5', 34, b'1'),
(361, 15, 2, 'C1', 51, b'1'),
(362, 15, 2, 'C2', 52, b'1'),
(363, 15, 2, 'C3', 53, b'1'),
(364, 15, 2, 'C4', 54, b'1'),
(365, 15, 2, 'C5', 55, b'1'),
(366, 15, 2, 'D1', 72, b'1'),
(367, 15, 2, 'D2', 73, b'1'),
(368, 15, 2, 'D3', 74, b'1'),
(369, 15, 2, 'D4', 75, b'1'),
(370, 15, 2, 'D5', 76, b'1'),
(371, 15, 1, 'E1', 93, b'1'),
(372, 15, 1, 'E2', 94, b'1'),
(373, 15, 1, 'E3', 95, b'1'),
(374, 15, 1, 'E4', 96, b'1'),
(375, 15, 1, 'E5', 97, b'1'),
(376, 16, 2, 'A1', 9, b'1'),
(377, 16, 2, 'A2', 10, b'1'),
(378, 16, 2, 'A3', 11, b'1'),
(379, 16, 2, 'A4', 12, b'1'),
(380, 16, 2, 'A5', 13, b'1'),
(381, 16, 2, 'B1', 30, b'1'),
(382, 16, 2, 'B2', 31, b'1'),
(383, 16, 2, 'B3', 32, b'1'),
(384, 16, 2, 'B4', 33, b'1'),
(385, 16, 2, 'B5', 34, b'1'),
(386, 16, 2, 'C1', 51, b'1'),
(387, 16, 2, 'C2', 52, b'1'),
(388, 16, 2, 'C3', 53, b'1'),
(389, 16, 2, 'C4', 54, b'1'),
(390, 16, 2, 'C5', 55, b'1'),
(391, 16, 2, 'D1', 72, b'1'),
(392, 16, 2, 'D2', 73, b'1'),
(393, 16, 2, 'D3', 74, b'1'),
(394, 16, 2, 'D4', 75, b'1'),
(395, 16, 2, 'D5', 76, b'1'),
(396, 16, 1, 'E1', 93, b'1'),
(397, 16, 1, 'E2', 94, b'1'),
(398, 16, 1, 'E3', 95, b'1'),
(399, 16, 1, 'E4', 96, b'1'),
(400, 16, 1, 'E5', 97, b'1'),
(401, 17, 2, 'A1', 9, b'1'),
(402, 17, 2, 'A2', 10, b'1'),
(403, 17, 2, 'A3', 11, b'1'),
(404, 17, 2, 'A4', 12, b'1'),
(405, 17, 2, 'A5', 13, b'1'),
(406, 17, 2, 'B1', 30, b'1'),
(407, 17, 2, 'B2', 31, b'1'),
(408, 17, 2, 'B3', 32, b'1'),
(409, 17, 2, 'B4', 33, b'1'),
(410, 17, 2, 'B5', 34, b'1'),
(411, 17, 2, 'C1', 51, b'1'),
(412, 17, 2, 'C2', 52, b'1'),
(413, 17, 2, 'C3', 53, b'1'),
(414, 17, 2, 'C4', 54, b'1'),
(415, 17, 2, 'C5', 55, b'1'),
(416, 17, 2, 'D1', 72, b'1'),
(417, 17, 2, 'D2', 73, b'1'),
(418, 17, 2, 'D3', 74, b'1'),
(419, 17, 2, 'D4', 75, b'1'),
(420, 17, 2, 'D5', 76, b'1'),
(421, 17, 1, 'E1', 93, b'1'),
(422, 17, 1, 'E2', 94, b'1'),
(423, 17, 1, 'E3', 95, b'1'),
(424, 17, 1, 'E4', 96, b'1'),
(425, 17, 1, 'E5', 97, b'1'),
(426, 18, 2, 'A1', 9, b'1'),
(427, 18, 2, 'A2', 10, b'1'),
(428, 18, 2, 'A3', 11, b'1'),
(429, 18, 2, 'A4', 12, b'1'),
(430, 18, 2, 'A5', 13, b'1'),
(431, 18, 2, 'B1', 30, b'1'),
(432, 18, 2, 'B2', 31, b'1'),
(433, 18, 2, 'B3', 32, b'1'),
(434, 18, 2, 'B4', 33, b'1'),
(435, 18, 2, 'B5', 34, b'1'),
(436, 18, 2, 'C1', 51, b'1'),
(437, 18, 2, 'C2', 52, b'1'),
(438, 18, 2, 'C3', 53, b'1'),
(439, 18, 2, 'C4', 54, b'1'),
(440, 18, 2, 'C5', 55, b'1'),
(441, 18, 2, 'D1', 72, b'1'),
(442, 18, 2, 'D2', 73, b'1'),
(443, 18, 2, 'D3', 74, b'1'),
(444, 18, 2, 'D4', 75, b'1'),
(445, 18, 2, 'D5', 76, b'1'),
(446, 18, 1, 'E1', 93, b'1'),
(447, 18, 1, 'E2', 94, b'1'),
(448, 18, 1, 'E3', 95, b'1'),
(449, 18, 1, 'E4', 96, b'1');

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
  `Activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shows`
--

INSERT INTO `shows` (`Id`, `Username`, `Moviesid`, `Roomsid`, `Priceid`, `Showdate`, `Starttime`, `Endtime`, `Activity`) VALUES
(1, 'huyntpc00617', 1, 1, 1, '2021-11-30', '08:30:00', '10:30:00', 3),
(2, 'huyntpc00617', 1, 1, 1, '2021-11-30', '11:30:00', '13:30:00', 3),
(3, 'huyntpc00617', 1, 1, 1, '2021-11-30', '14:30:00', '16:30:00', 3),
(4, 'huyntpc00617', 1, 1, 1, '2021-11-30', '18:30:00', '20:00:00', 3),
(5, 'huyntpc00617', 1, 1, 1, '2021-11-30', '20:30:00', '22:30:00', 3),
(6, 'huyntpc00617', 1, 7, 1, '2021-11-30', '08:30:00', '10:30:00', 3),
(7, 'huyntpc00617', 1, 7, 1, '2021-11-30', '11:30:00', '13:30:00', 3),
(8, 'huyntpc00617', 1, 7, 1, '2021-11-30', '14:30:00', '16:30:00', 3),
(9, 'huyntpc00617', 1, 7, 1, '2021-11-30', '18:30:00', '20:00:00', 3),
(10, 'huyntpc00617', 1, 7, 1, '2021-11-30', '20:30:00', '22:30:00', 3),
(11, 'huyntpc00617', 1, 13, 1, '2021-11-30', '08:30:00', '10:30:00', 3),
(12, 'huyntpc00617', 1, 13, 1, '2021-11-30', '11:30:00', '13:30:00', 3),
(13, 'huyntpc00617', 1, 13, 1, '2021-11-30', '14:30:00', '16:30:00', 3),
(14, 'huyntpc00617', 1, 13, 1, '2021-11-30', '18:30:00', '20:00:00', 3),
(15, 'huyntpc00617', 1, 13, 1, '2021-11-30', '20:30:00', '22:30:00', 3),
(16, 'huyntpc00617', 1, 2, 1, '2021-12-01', '08:30:00', '10:30:00', 3),
(17, 'huyntpc00617', 2, 2, 1, '2021-12-01', '11:30:00', '13:30:00', 3),
(18, 'huyntpc00617', 3, 2, 1, '2021-12-01', '14:30:00', '16:30:00', 3),
(19, 'huyntpc00617', 4, 2, 1, '2021-12-01', '18:30:00', '20:00:00', 3),
(20, 'huyntpc00617', 5, 2, 1, '2021-12-01', '20:30:00', '22:30:00', 3),
(21, 'huyntpc00617', 1, 3, 1, '2021-12-02', '08:30:00', '10:30:00', 3),
(22, 'huyntpc00617', 2, 3, 1, '2021-12-02', '11:30:00', '13:30:00', 3),
(23, 'huyntpc00617', 3, 3, 1, '2021-12-02', '14:30:00', '16:30:00', 3),
(24, 'huyntpc00617', 4, 3, 1, '2021-12-02', '18:30:00', '20:00:00', 3),
(25, 'huyntpc00617', 5, 3, 1, '2021-12-02', '20:30:00', '22:30:00', 3),
(26, 'huyntpc00617', 1, 4, 1, '2021-12-03', '08:30:00', '10:30:00', 3),
(27, 'huyntpc00617', 2, 4, 1, '2021-12-03', '11:30:00', '13:30:00', 3),
(28, 'huyntpc00617', 3, 4, 1, '2021-12-03', '14:30:00', '16:30:00', 3),
(29, 'huyntpc00617', 4, 4, 1, '2021-12-03', '18:30:00', '20:00:00', 3),
(30, 'huyntpc00617', 5, 4, 1, '2021-12-03', '20:30:00', '22:30:00', 3),
(31, 'huyntpc00617', 1, 5, 1, '2021-12-04', '08:30:00', '10:30:00', 3),
(32, 'huyntpc00617', 2, 5, 1, '2021-12-04', '11:30:00', '13:30:00', 3),
(33, 'huyntpc00617', 3, 5, 1, '2021-12-04', '14:30:00', '16:30:00', 3),
(34, 'huyntpc00617', 4, 5, 1, '2021-12-04', '18:30:00', '20:00:00', 3),
(35, 'huyntpc00617', 5, 5, 1, '2021-12-04', '20:30:00', '22:30:00', 3),
(36, 'huyntpc00617', 1, 6, 1, '2021-12-05', '08:30:00', '10:30:00', 3),
(37, 'huyntpc00617', 2, 6, 1, '2021-12-05', '11:30:00', '13:30:00', 3),
(38, 'huyntpc00617', 3, 6, 1, '2021-12-05', '14:30:00', '16:30:00', 3),
(39, 'huyntpc00617', 4, 6, 1, '2021-12-05', '18:30:00', '20:00:00', 3),
(40, 'huyntpc00617', 5, 6, 1, '2021-12-05', '20:30:00', '22:30:00', 3),
(41, 'huyntpc00617', 1, 7, 1, '2021-12-06', '08:30:00', '10:30:00', 3),
(42, 'huyntpc00617', 2, 7, 1, '2021-12-06', '11:30:00', '13:30:00', 3),
(43, 'huyntpc00617', 3, 7, 1, '2021-12-06', '14:30:00', '16:30:00', 3),
(44, 'huyntpc00617', 4, 7, 1, '2021-12-06', '18:30:00', '20:00:00', 3),
(45, 'huyntpc00617', 5, 7, 1, '2021-12-06', '20:30:00', '22:30:00', 3),
(46, 'huyntpc00617', 1, 8, 1, '2021-12-07', '08:30:00', '10:30:00', 3),
(47, 'huyntpc00617', 2, 8, 1, '2021-12-07', '11:30:00', '13:30:00', 3),
(48, 'huyntpc00617', 3, 8, 1, '2021-12-07', '14:30:00', '16:30:00', 3),
(49, 'huyntpc00617', 4, 8, 1, '2021-12-07', '18:30:00', '20:00:00', 3),
(50, 'huyntpc00617', 5, 8, 1, '2021-12-07', '20:30:00', '22:30:00', 3),
(51, 'huyntpc00617', 1, 9, 1, '2021-12-08', '08:30:00', '10:30:00', 3),
(52, 'huyntpc00617', 2, 9, 1, '2021-12-08', '11:30:00', '13:30:00', 3),
(53, 'huyntpc00617', 3, 9, 1, '2021-12-08', '14:30:00', '16:30:00', 3),
(54, 'huyntpc00617', 4, 9, 1, '2021-12-08', '18:30:00', '20:00:00', 3),
(55, 'huyntpc00617', 5, 9, 1, '2021-12-08', '20:30:00', '22:30:00', 3),
(56, 'huyntpc00617', 1, 10, 1, '2021-12-09', '08:30:00', '10:30:00', 3),
(57, 'huyntpc00617', 2, 10, 1, '2021-12-09', '11:30:00', '13:30:00', 3),
(58, 'huyntpc00617', 3, 10, 1, '2021-12-09', '14:30:00', '16:30:00', 3),
(59, 'huyntpc00617', 4, 10, 1, '2021-12-09', '18:30:00', '20:00:00', 3),
(60, 'huyntpc00617', 5, 10, 1, '2021-12-09', '20:30:00', '22:30:00', 3);

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

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`Id`, `Orderid`, `Showsid`, `Seatid`, `Createdate`, `Totalmoney`, `Ticketprice`, `Discount`, `Activity`) VALUES
('tiket1', 'odr1', 1, 1, '2021-10-05', 300000, 300000, 20, b'1'),
('tiket2', 'odr2', 2, 2, '2021-10-05', 300000, 300000, 20, b'1'),
('tiket3', 'odr3', 2, 2, '2021-10-06', 300000, 300000, 20, b'1'),
('tiket4', 'ord4', 10, 2, '2021-12-03', 300000, 300000, 20, b'1');

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
  `Id` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Code` varchar(6) NOT NULL,
  `Expiry` datetime NOT NULL,
  `Category` int(11) NOT NULL,
  `Activity` bit(1) NOT NULL
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
('hainnpc00645', 'Nguyễn Ngọc Hải', '1234', 'hainnpc00645@fpt.edu.vn', '0867707413', '038159001769', 'Cần Thơ', b'0', 'avatar6.png', b'1'),
('hieunnpc00795', 'Nguyễn Ngọc Hiếu', '1234', 'hieunnpc00795@fpt.edu.vn', '0914688501', '001089000098', 'Kiên Giang', b'0', 'avatar1.png', b'1'),
('huyntpc00617', 'Nguyễn Thành Huy', '1234', 'huyntpc00617@fpt.edu.vn', '0767905592', '036087000067', 'Cần Thơ', b'0', 'avatar4.png', b'1'),
('khuehnpc00516', 'Hồ Như Khuê', '1234', 'khuehnpc00516@fpt.edu.vn', '0788979575', '079201000046', 'Cần Thơ', b'0', 'avatar2.png', b'1'),
('nhieuntpc00810', 'Nguyễn Thanh Nhiều', '1234', 'nhieuntpc00810@fpt.edu.vn', '0396634180', '001183000001', 'Sóc Trăng', b'0', 'avatar3.png', b'1'),
('thainmpc00782', 'Nguyễn Minh Thái', '1234', 'thainmpc00782@fpt.edu.vn', '0933824823', '001304027098', 'Cần Thơ', b'0', 'avatar5.png', b'1');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `censors`
--
ALTER TABLE `censors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orderfoods`
--
ALTER TABLE `orderfoods`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `seats`
--
ALTER TABLE `seats`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=450;

--
-- AUTO_INCREMENT cho bảng `shows`
--
ALTER TABLE `shows`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `tickets_coupons`
--
ALTER TABLE `tickets_coupons`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tokens`
--
ALTER TABLE `tokens`
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
