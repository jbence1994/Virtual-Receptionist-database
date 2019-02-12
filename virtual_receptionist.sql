-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Feb 12. 12:47
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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Accomodation` (`AccomodationName`,`CompanyName`,`VATNumber`,`PhoneNumber`,`EmailAddress`),
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `accomodation`
--

INSERT INTO `accomodation` (`ID`, `AccomodationName`, `CompanyName`, `Contact`, `VATNumber`, `Headquarters`, `Site`, `PhoneNumber`, `EmailAddress`) VALUES
(1, 'Autós Panzió', 'Autóscsárda-Panzió Vendéglátó és Kereskedelmi Kft.', 'Szabó Norbert', '13542199-2-06', '6900 Makó, Deák Ferenc u. 28./B', '6900 Makó, Báló liget', '06 (62) 510 298', 'info@autospanzio.hu');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accomodation_profile`
--

DROP TABLE IF EXISTS `accomodation_profile`;
CREATE TABLE IF NOT EXISTS `accomodation_profile` (
  `Accomodation` int(11) NOT NULL AUTO_INCREMENT,
  `AccomodationID` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `Password` varchar(8) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`Accomodation`),
  UNIQUE KEY `Accomodation` (`AccomodationID`,`Password`),
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `accomodation_profile`
--

INSERT INTO `accomodation_profile` (`Accomodation`, `AccomodationID`, `Password`) VALUES
(1, 'AUTPNZ', 'norci71');

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
  UNIQUE KEY `BillingItem` (`BillingItemName`),
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
  `CountryName` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CountryName` (`CountryName`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `country`
--

INSERT INTO `country` (`ID`, `CountryName`) VALUES
(1, 'Afganisztán'),
(2, 'Albánia'),
(3, 'Algéria'),
(4, 'Amerikai Egyesült Államok'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Antigua és Barbuda'),
(8, 'Argentína'),
(9, 'Aruba'),
(10, 'Ausztrália'),
(11, 'Ausztria'),
(12, 'Azerbajdzsán'),
(13, 'Bahama-szigetek'),
(14, 'Bahrein'),
(15, 'Banglades'),
(16, 'Barbados'),
(17, 'Belarusz'),
(18, 'Belgium'),
(19, 'Belize'),
(20, 'Benin'),
(21, 'Bhután'),
(22, 'Bissau-Guinea'),
(23, 'Bolívia'),
(24, 'Bosznia-Hercegovina'),
(25, 'Botswana'),
(26, 'Brazília'),
(27, 'Brunei'),
(28, 'Bulgária'),
(29, 'Burkina Faso'),
(30, 'Burundi'),
(31, 'Chile'),
(32, 'Ciprus'),
(33, 'Comore-szigetek'),
(34, 'Costa Rica'),
(35, 'Csád'),
(36, 'Cseh Köztársaság'),
(37, 'Dánia'),
(38, 'Dél-afrikai Köztársaság'),
(39, 'Dél-Szudán'),
(40, 'Dominikai Közösség'),
(41, 'Dominikai Köztársaság'),
(42, 'Dzsibuti'),
(43, 'Ecuador'),
(44, 'Egyenlítoi Guinea'),
(45, 'Egyesült Arab Emírségek'),
(46, 'Egyiptom'),
(47, 'El Salvador'),
(48, 'Elefántcsontpart'),
(49, 'Eritrea'),
(50, 'Észtország'),
(51, 'Etiópia'),
(52, 'Fidzsi-szigetek'),
(53, 'Finnország'),
(54, 'Franciaország'),
(55, 'Fülöp-szigetek'),
(56, 'Gabon'),
(57, 'Gambia'),
(58, 'Ghána'),
(59, 'Görögország'),
(60, 'Grenada'),
(61, 'Grúzia'),
(62, 'Guatemala'),
(63, 'Guinea'),
(64, 'Guyana'),
(65, 'Haiti'),
(66, 'Hollandia'),
(67, 'Honduras'),
(68, 'Horvátország'),
(69, 'India'),
(70, 'Indonézia'),
(71, 'Irak'),
(72, 'Irán'),
(73, 'Írország'),
(74, 'Izland'),
(75, 'Izrael'),
(76, 'Jamaika'),
(77, 'Japán'),
(78, 'Jemen'),
(79, 'Jordánia'),
(80, 'Kambodzsa'),
(81, 'Kamerun'),
(82, 'Kanada'),
(83, 'Katar'),
(84, 'Kazahsztán'),
(85, 'Kelet-Timor'),
(86, 'Kenya'),
(87, 'Kínai Népköztársaság'),
(88, 'Kirgizisztán'),
(89, 'Kiribati'),
(90, 'Kolumbia'),
(91, 'Kongói Demokratikus Köztársaság'),
(92, 'Kongói Köztársaság'),
(93, 'Koreai Köztársaság'),
(94, 'Koreai Népi Demokratikus Köztársaság'),
(95, 'Koszovó'),
(96, 'Közép-afrikai Köztársaság'),
(97, 'Kuba'),
(98, 'Kuwait'),
(99, 'Laosz'),
(100, 'Lengyelország'),
(101, 'Lesotho'),
(102, 'Lettország'),
(103, 'Libanon'),
(104, 'Libéria'),
(105, 'Líbia'),
(106, 'Liechtenstein'),
(107, 'Litvánia'),
(108, 'Luxenburg'),
(109, 'Macedónia'),
(110, 'Madagaszkár'),
(111, 'Magyarország'),
(112, 'Malajzia'),
(113, 'Malawi'),
(114, 'Maldív-szigetek'),
(115, 'Mali'),
(116, 'Málta'),
(117, 'Marokkó'),
(118, 'Marshall-szigetek'),
(119, 'Mauritánia'),
(120, 'Mauritius'),
(121, 'Mexikó'),
(122, 'Mianmar'),
(123, 'Mikronéziai Szövetségi Államok'),
(124, 'Moldova'),
(125, 'Monaco'),
(126, 'Mongólia'),
(127, 'Montenegró'),
(128, 'Mozambik'),
(129, 'Nagy-Britannia'),
(130, 'Namíbia'),
(131, 'Nauru'),
(132, 'Németország'),
(133, 'Nepál'),
(134, 'Nicaragua'),
(135, 'Niger'),
(136, 'Nigéria'),
(137, 'Norvégia'),
(138, 'Olaszország'),
(139, 'Omán'),
(140, 'Oroszország'),
(141, 'Örményország'),
(142, 'Pakisztán'),
(143, 'Palau'),
(144, 'Panama'),
(145, 'Pápua Új-Guinea'),
(146, 'Paraguay'),
(147, 'Peru'),
(148, 'Portugália'),
(149, 'Románia'),
(150, 'Ruanda'),
(151, 'Saint Kitts és Nevis'),
(152, 'Saint Lucia'),
(153, 'Saint Vincent és a Grenadine-szigetek'),
(154, 'Salamon-szigetek'),
(155, 'San Marino'),
(156, 'São Tomé és Príncipe'),
(157, 'Seychelle-szigetek'),
(158, 'Sierra Leone'),
(159, 'Spanyolország'),
(160, 'Srí Lanka'),
(161, 'Suriname'),
(162, 'Svájc'),
(163, 'Svédország'),
(164, 'Szamoa'),
(165, 'Szaúd-Arábia'),
(166, 'Szenegál'),
(167, 'Szerbia'),
(168, 'Szingapúr'),
(169, 'Szíria'),
(170, 'Szlovákia'),
(171, 'Szlovénia'),
(172, 'Szomália'),
(173, 'Szudán'),
(174, 'Szváziföld'),
(175, 'Tadzsikisztán'),
(176, 'Tajvan'),
(177, 'Tanzánia'),
(178, 'Thaiföld'),
(179, 'Togó'),
(180, 'Tonga'),
(181, 'Törökország'),
(182, 'Trinidad és Tobago'),
(183, 'Tunézia'),
(184, 'Tuvalu'),
(185, 'Türkmenisztán'),
(186, 'Uganda'),
(187, 'Új-Zéland'),
(188, 'Ukrajna'),
(189, 'Uruguay'),
(190, 'Üzbegisztán'),
(191, 'Vanuatu'),
(192, 'Vatikán'),
(193, 'Venezuela'),
(194, 'Vietnam'),
(195, 'Zambia'),
(196, 'Zimbabwe'),
(197, 'Zöld-foki Köztársaság');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `guest`
--

INSERT INTO `guest` (`ID`, `Name`, `DocumentNumber`, `Citizenship`, `BirthDate`, `VATNumber`, `Country`, `ZipCode`, `City`, `Address`, `PhoneNumber`, `EmailAddress`) VALUES
(1, 'Juhász Bence', '134573AE', 'magyar', '1994-03-27', '', 111, '6900', 'Makó', 'Kálvária utca 48./A', '06 (20) / 294-4280', 'juhasz.bence@outlook.hu'),
(2, 'Autóscsárda-Panzió Kft.', '', '', NULL, '13542199-2-06', 111, '6900', 'Makó', 'Deák Ferenc utca 28./B', '06 (62) / 510-298', 'info@autospanzio.hu'),
(3, 'Duna-Döner Kft.', '', '', NULL, '14217395-2-06', 111, '6900', 'Makó', 'Hunyadi u. 4./A', '06 626 38 225', 'office@dunadoner.com'),
(4, 'Netsurf Távközlési Kft.', '', '', NULL, '12937626-2-06', 111, '6724', 'Szeged', 'Rókusi körút 42-64.', '06 (62) / 488-944', 'info@netsurfclub.hu'),
(5, 'Csipet és Társa Bt.', '', '', NULL, '24351283-2-06', 111, '6900', 'Makó', 'Bajza utca 14.', '', ''),
(6, 'KÖZGÉP Zrt.', '', '', NULL, '10950676-2-44', 111, '1239', 'Budapest', 'Haraszti út 44.', '06 (1) 286 0322', 'info@kozgep.hu'),
(7, 'Mészáros és Mészáros Kft.', '', '', NULL, '12671003-2-07', 111, '8086', 'Felcsút', '0311/5.hrsz.', '06 (30) / 849-6670', 'info@meszaroskft.hu'),
(8, 'FIDESZ - Magyar Polgári Szövetség', '', '', NULL, '19007225-2-42', 111, '1062', 'Budapest', 'Lendvay utca 28.', '06 (1) / 555-2000', 'fidesz@fidesz.hu'),
(9, 'Magyar Szocialista Párt', '', '', NULL, '19007081-2-42', 111, '1073', 'Budapest', 'Erzsébet körút 40-42. fszt I-1. ajtó', '06 (1) / 222-6797', 'info@mszp.hu'),
(10, 'Ábrahám Alajos', '122562AR', 'magyar', '1934-02-22', '', 111, '8900', 'Zalaegerszeg', 'Petőfi Sándor utca 114.', '06 (30) / 246-5256', 'abraham@t-online.hu'),
(11, 'Vakkas Tanner', 'UBNT23E', 'török', '1973-12-12', '', 181, '12345ED', 'Ankara', '22 Sulugöz Sk.', '+34 456 443 232', 'vakkas@turkeycom.tr');

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
  UNIQUE KEY `Number` (`Number`),
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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Category` (`CategoryName`),
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
-- Megkötések a táblához `accomodation_profile`
--
ALTER TABLE `accomodation_profile`
  ADD CONSTRAINT `accomodationid` FOREIGN KEY (`Accomodation`) REFERENCES `accomodation` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
