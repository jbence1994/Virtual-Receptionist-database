-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Jan 31. 00:01
-- Kiszolgáló verziója: 10.1.32-MariaDB
-- PHP verzió: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `virtual_receptionist`
--

DROP DATABASE IF EXISTS `virtual_receptionist`;
CREATE DATABASE IF NOT EXISTS `virtual_receptionist` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `virtual_receptionist`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accomodation`
--

DROP TABLE IF EXISTS `accomodation`;
CREATE TABLE IF NOT EXISTS `accomodation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccomodationName` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `CompanyName` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `Contact` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `VATNumber` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Headquarters` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `Site` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `PhoneNumber` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `EmailAddress` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `AccomodationID` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  `Password` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AccomodationName` (`AccomodationName`,`CompanyName`,`VATNumber`,`PhoneNumber`,`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `accomodation`
--

INSERT INTO `accomodation` (`ID`, `AccomodationName`, `CompanyName`, `Contact`, `VATNumber`, `Headquarters`, `Site`, `PhoneNumber`, `EmailAddress`, `AccomodationID`, `Password`) VALUES
(1, 'Autós Panzió', 'Autóscsárda-Panzió Vendéglátó és Kereskedelmi Kft.', 'Szabó Norbert', '135-42199-2-06', '6900 Makó, Deák Ferenc u. 28./B', '6900 Makó, Kemping sor 1.', '06 (62) 510 298', 'info@autospanzio.hu', 'AUTPNZ', 'norci71');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `billing_item`
--

DROP TABLE IF EXISTS `billing_item`;
CREATE TABLE IF NOT EXISTS `billing_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BillingItemName` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `Category` int(11) NOT NULL,
  `Price` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `category` (`Category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `billing_item`
--

INSERT INTO `billing_item` (`ID`, `BillingItemName`, `Category`, `Price`) VALUES
(1, '1 szoba 1 főre', 1, '8700'),
(2, '1 szoba 2 főre', 1, '11400'),
(3, '1 szoba 3 főre', 1, '14100'),
(4, 'Apartman', 1, '16800'),
(5, 'Idegenforgalmi adó', 3, '300'),
(6, 'Idegenforgalmi adó mentes', 3, '0'),
(7, 'Reggeli', 2, '1500'),
(8, 'Mosás', 4, '1000');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `billing_item_category`
--

DROP TABLE IF EXISTS `billing_item_category`;
CREATE TABLE IF NOT EXISTS `billing_item_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BillingItemCategoryName` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  `VAT` float NOT NULL,
  `Unit` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `billing_item_category`
--

INSERT INTO `billing_item_category` (`ID`, `BillingItemCategoryName`, `VAT`, `Unit`) VALUES
(1, 'Szállás', 18, 'éjszaka'),
(2, 'Fogyasztás (étel, ital)', 18, 'alkalom'),
(3, 'Tárgyi adó mentes', 0, 'darab'),
(4, 'Egyéb szolgáltatás', 27, 'alkalom');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(2) COLLATE utf8_hungarian_ci NOT NULL,
  `CountryName` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`CountryName`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `country`
--

INSERT INTO `country` (`ID`, `CountryCode`, `CountryName`) VALUES
(1, 'AD', 'Andorra'),
(2, 'AE', 'Egyesült Arab Emírségek'),
(3, 'AF', 'Afganisztán'),
(4, 'AG', 'Antigua és Barbuda'),
(5, 'AL', 'Albánia'),
(6, 'AM', 'Örményország'),
(7, 'AO', 'Angola'),
(8, 'AR', 'Argentína'),
(9, 'AT', 'Ausztria'),
(10, 'AU', 'Ausztrália'),
(11, 'AW', 'Aruba'),
(12, 'AZ', 'Azerbajdzsán'),
(13, 'BA', 'Bosznia-Hercegovina'),
(14, 'BB', 'Barbados'),
(15, 'BD', 'Banglades'),
(16, 'BE', 'Belgium'),
(17, 'BF', 'Burkina Faso'),
(18, 'BG', 'Bulgária'),
(19, 'BH', 'Bahrein'),
(20, 'BI', 'Burundi'),
(21, 'BJ', 'Benin'),
(22, 'BN', 'Brunei'),
(23, 'BO', 'Bolívia'),
(24, 'BR', 'Brazília'),
(25, 'BS', 'Bahama-szigetek'),
(26, 'BT', 'Bhután'),
(27, 'BW', 'Botswana'),
(28, 'BY', 'Belarusz'),
(29, 'BZ', 'Belize'),
(30, 'CA', 'Kanada'),
(31, 'CD', 'Kongói Demokratikus Köztársaság'),
(32, 'CF', 'Közép-afrikai Köztársaság'),
(33, 'CG', 'Kongói Köztársaság'),
(34, 'CH', 'Svájc'),
(35, 'CI', 'Elefántcsontpart'),
(36, 'CL', 'Chile'),
(37, 'CM', 'Kamerun'),
(38, 'CN', 'Kínai Népköztársaság'),
(39, 'CO', 'Kolumbia'),
(40, 'CR', 'Costa Rica'),
(41, 'CU', 'Kuba'),
(42, 'CV', 'Zöld-foki Köztársaság'),
(43, 'CY', 'Ciprus'),
(44, 'CZ', 'Cseh Köztársaság'),
(45, 'DE', 'Németország'),
(46, 'DJ', 'Dzsibuti'),
(47, 'DK', 'Dánia'),
(48, 'DM', 'Dominikai Közösség'),
(49, 'DO', 'Dominikai Köztársaság'),
(50, 'DZ', 'Algéria'),
(51, 'EC', 'Ecuador'),
(52, 'EE', 'Észtország'),
(53, 'EG', 'Egyiptom'),
(54, 'ER', 'Eritrea'),
(55, 'ES', 'Spanyolország'),
(56, 'ET', 'Etiópia'),
(57, 'FI', 'Finnország'),
(58, 'FJ', 'Fidzsi-szigetek'),
(59, 'FM', 'Mikronéziai Szövetségi Államok'),
(60, 'FR', 'Franciaország'),
(61, 'GA', 'Gabon'),
(62, 'GB', 'Nagy-Britannia'),
(63, 'GD', 'Grenada'),
(64, 'GE', 'Grúzia'),
(65, 'GH', 'Ghána'),
(66, 'GM', 'Gambia'),
(67, 'GN', 'Guinea'),
(68, 'GQ', 'Egyenlítoi Guinea'),
(69, 'GR', 'Görögország'),
(70, 'GT', 'Guatemala'),
(71, 'GW', 'Bissau-Guinea'),
(72, 'GY', 'Guyana'),
(73, 'HN', 'Honduras'),
(74, 'HR', 'Horvátország'),
(75, 'HT', 'Haiti'),
(76, 'HU', 'Magyarország'),
(77, 'ID', 'Indonézia'),
(78, 'IE', 'Írország'),
(79, 'IL', 'Izrael'),
(80, 'IN', 'India'),
(81, 'IQ', 'Irak'),
(82, 'IR', 'Irán'),
(83, 'IS', 'Izland'),
(84, 'IT', 'Olaszország'),
(85, 'JM', 'Jamaika'),
(86, 'JO', 'Jordánia'),
(87, 'JP', 'Japán'),
(88, 'KE', 'Kenya'),
(89, 'KG', 'Kirgizisztán'),
(90, 'KH', 'Kambodzsa'),
(91, 'KI', 'Kiribati'),
(92, 'KM', 'Comore-szigetek'),
(93, 'KN', 'Saint Kitts és Nevis'),
(94, 'KP', 'Koreai Népi Demokratikus Köztársaság'),
(95, 'KR', 'Koreai Köztársaság'),
(96, 'KW', 'Kuwait'),
(97, 'KZ', 'Kazahsztán'),
(98, 'LA', 'Laosz'),
(99, 'LB', 'Libanon'),
(100, 'LC', 'Saint Lucia'),
(101, 'LI', 'Liechtenstein'),
(102, 'LK', 'Srí Lanka'),
(103, 'LR', 'Libéria'),
(104, 'LS', 'Lesotho'),
(105, 'LT', 'Litvánia'),
(106, 'LU', 'Luxenburg'),
(107, 'LV', 'Lettország'),
(108, 'LY', 'Líbia'),
(109, 'MA', 'Marokkó'),
(110, 'MC', 'Monaco'),
(111, 'MD', 'Moldova'),
(112, 'ME', 'Montenegró'),
(113, 'MG', 'Madagaszkár'),
(114, 'MH', 'Marshall-szigetek'),
(115, 'MK', 'Macedónia'),
(116, 'ML', 'Mali'),
(117, 'MM', 'Mianmar'),
(118, 'MN', 'Mongólia'),
(119, 'MR', 'Mauritánia'),
(120, 'MT', 'Málta'),
(121, 'MU', 'Mauritius'),
(122, 'MV', 'Maldív-szigetek'),
(123, 'MW', 'Malawi'),
(124, 'MX', 'Mexikó'),
(125, 'MY', 'Malajzia'),
(126, 'MZ', 'Mozambik'),
(127, 'NA', 'Namíbia'),
(128, 'NE', 'Niger'),
(129, 'NG', 'Nigéria'),
(130, 'NI', 'Nicaragua'),
(131, 'NL', 'Hollandia'),
(132, 'NO', 'Norvégia'),
(133, 'NP', 'Nepál'),
(134, 'NR', 'Nauru'),
(135, 'NZ', 'Új-Zéland'),
(136, 'OM', 'Omán'),
(137, 'PA', 'Panama'),
(138, 'PE', 'Peru'),
(139, 'PG', 'Pápua Új-Guinea'),
(140, 'PH', 'Fülöp-szigetek'),
(141, 'PK', 'Pakisztán'),
(142, 'PL', 'Lengyelország'),
(143, 'PT', 'Portugália'),
(144, 'PW', 'Palau'),
(145, 'PY', 'Paraguay'),
(146, 'QA', 'Katar'),
(147, 'RO', 'Románia'),
(148, 'RS', 'Szerbia'),
(149, 'RU', 'Oroszország'),
(150, 'RW', 'Ruanda'),
(151, 'SA', 'Szaúd-Arábia'),
(152, 'SB', 'Salamon-szigetek'),
(153, 'SC', 'Seychelle-szigetek'),
(154, 'SD', 'Szudán'),
(155, 'SE', 'Svédország'),
(156, 'SG', 'Szingapúr'),
(157, 'SI', 'Szlovénia'),
(158, 'SK', 'Szlovákia'),
(159, 'SL', 'Sierra Leone'),
(160, 'SM', 'San Marino'),
(161, 'SN', 'Szenegál'),
(162, 'SO', 'Szomália'),
(163, 'SR', 'Suriname'),
(164, 'SS', 'Dél-Szudán'),
(165, 'ST', 'São Tomé és Príncipe'),
(166, 'SV', 'El Salvador'),
(167, 'SY', 'Szíria'),
(168, 'SZ', 'Szváziföld'),
(169, 'TD', 'Csád'),
(170, 'TG', 'Togó'),
(171, 'TH', 'Thaiföld'),
(172, 'TJ', 'Tadzsikisztán'),
(173, 'TL', 'Kelet-Timor'),
(174, 'TM', 'Türkmenisztán'),
(175, 'TN', 'Tunézia'),
(176, 'TO', 'Tonga'),
(177, 'TR', 'Törökország'),
(178, 'TT', 'Trinidad és Tobago'),
(179, 'TV', 'Tuvalu'),
(180, 'TW', 'Tajvan'),
(181, 'TZ', 'Tanzánia'),
(182, 'UA', 'Ukrajna'),
(183, 'UG', 'Uganda'),
(184, 'US', 'Amerikai Egyesült Államok'),
(185, 'UY', 'Uruguay'),
(186, 'UZ', 'Üzbegisztán'),
(187, 'VA', 'Vatikán'),
(188, 'VC', 'Saint Vincent és a Grenadine-szigetek'),
(189, 'VE', 'Venezuela'),
(190, 'VN', 'Vietnam'),
(191, 'VU', 'Vanuatu'),
(192, 'WS', 'Szamoa'),
(193, 'XK', 'Koszovó'),
(194, 'YE', 'Jemen'),
(195, 'ZA', 'Dél-afrikai Köztársaság'),
(196, 'ZM', 'Zambia'),
(197, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `desktop_log`
--

DROP TABLE IF EXISTS `desktop_log`;
CREATE TABLE IF NOT EXISTS `desktop_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Client` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `OS_Version` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `LoginDate` varchar(25) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `LogoutDate` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `DocumentNumber` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Citizenship` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `VATNumber` varchar(25) COLLATE utf8_hungarian_ci NOT NULL,
  `Country` int(11) NOT NULL,
  `ZipCode` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `City` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `PhoneNumber` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `EmailAddress` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`),
  KEY `countryid` (`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GuestID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `NumberOfGuests` int(10) NOT NULL,
  `ArrivalDate` date NOT NULL,
  `DepartureDate` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `roomid` (`RoomID`),
  KEY `guestid` (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `Number` int(3) NOT NULL,
  `Category` int(11) NOT NULL,
  `Capacity` int(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `categoryid` (`Category`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `room`
--

INSERT INTO `room` (`ID`, `Name`, `Number`, `Category`, `Capacity`) VALUES
(1, 'Háromágyas', 1, 1, 3),
(2, 'Háromágyas', 2, 1, 3),
(3, 'Családi', 3, 2, 4),
(4, 'Családi', 4, 2, 4),
(5, 'Franciaágyas', 6, 3, 2),
(6, 'Franciaágyas', 7, 3, 2),
(7, 'Franciaágyas', 8, 3, 2),
(8, 'Háromágyas', 9, 1, 3),
(9, 'Háromágyas', 10, 1, 3),
(10, 'Háromágyas', 11, 1, 3),
(11, 'Háromágyas', 12, 1, 3),
(12, 'Franciaágyas', 14, 4, 2),
(13, 'Külön ágyas', 15, 5, 2),
(14, 'Apartman', 16, 6, 4),
(15, 'Apartman', 17, 6, 4),
(16, 'Külön ágyas', 18, 5, 2),
(17, 'Franciaágyas', 19, 4, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `room_category`
--

DROP TABLE IF EXISTS `room_category`;
CREATE TABLE IF NOT EXISTS `room_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `room_category`
--

INSERT INTO `room_category` (`ID`, `CategoryName`) VALUES
(1, 'Földszinti háromágyas'),
(2, 'Földszinti családi négyágyas'),
(3, 'Földszinti franciaágyas'),
(4, 'Emeleti franciaágyas'),
(5, 'Emeleti külön ágyas'),
(6, 'Apartman');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `billing_item`
--
ALTER TABLE `billing_item`
  ADD CONSTRAINT `category` FOREIGN KEY (`Category`) REFERENCES `billing_item_category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `countryid` FOREIGN KEY (`Country`) REFERENCES `country` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `guestid` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `roomid` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Megkötések a táblához `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `categoryid` FOREIGN KEY (`Category`) REFERENCES `room_category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
