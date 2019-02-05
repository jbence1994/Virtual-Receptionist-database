TRUNCATE TABLE `guest`;

INSERT INTO `guest` (`id`, `name`, `documentnumber`, `citizenship`, `birthdate`, `vatnumber`, `country`, `zipcode`, `city`, `address`, `phonenumber`, `emailaddress`)
VALUES (NULL, 'Juhász Bence', '134573AE', 'magyar', '1994-03-27', NULL, '111', '6900', 'Makó', 'Kálvária utca 48./A', '06 (20) / 294-4280', 'juhasz.bence@outlook.hu'),
(NULL, 'Autóscsárda-Panzió Kft.', '', '', NULL, '13542199-2-06', '111', '6900', 'Makó', 'Deák Ferenc utca 28./B', '06 (62) / 510-298', 'info@autospanzio.hu'),
(NULL, 'Duna-Döner Kft.', '', '', NULL, '14217395-2-06', '111', '6900', 'Makó', 'Hunyadi u. 4./A', '06 626 38 225', 'office@dunadoner.com'),
(NULL, 'Netsurf Távközlési Kft.', '', '', NULL, '12937626-2-06', '111', '6724', 'Szeged', 'Rókusi körút 42-64.', '06 (62) / 488-944', 'info@netsurfclub.hu'),
(NULL, 'Csipet és Társa Bt.', '', '', NULL, '24351283-2-06', '111', '6900', 'Makó', 'Bajza utca 14.', NULL, NULL),
(NULL, 'KÖZGÉP Zrt.', '', '', NULL, '10950676-2-44', '111', '1239', 'Budapest', 'Haraszti út 44.', '06 (1) 286 0322', 'info@kozgep.hu'),
(NULL, 'Mészáros és Mészáros Kft.', '', '', NULL, '12671003-2-07', '111', '8086', 'Felcsút', '0311/5.hrsz.', '06 (30) / 849-6670', 'info@meszaroskft.hu'),
(NULL, 'FIDESZ - Magyar Polgári Szövetség', '', '', NULL, '19007225-2-42', '111', '1062', 'Budapest', 'Lendvay utca 28.', '06 (1) / 555-2000', 'fidesz@fidesz.hu'),
(NULL, 'Magyar Szocialista Párt', '', '', NULL, '19007081-2-42', '111', '1073', 'Budapest', 'Erzsébet körút 40-42. fszt I-1. ajtó', '06 (1) / 222-6797', 'info@mszp.hu'),
(NULL, 'Ábrahám Alajos', '122562AR', 'magyar', '1934-02-22', NULL, '111', '8900', 'Zalaegerszeg', 'Petőfi Sándor utca 114.', '06 (30) / 246-5256', 'abraham@t-online.hu'),
(NULL, 'Vakkas Tanner', 'UBNT23E', 'török', '1973-12-12', NULL, '181', '12345ED', 'Ankara', '22 Sulugöz Sk.', '+34 456 443 232', 'vakkas@turkeycom.tr');
