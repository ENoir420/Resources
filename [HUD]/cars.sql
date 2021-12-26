-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.17-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- gtav_rp2 için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `zap412940-2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `zap412940-2`;

-- tablo yapısı dökülüyor gtav_rp2.characters_cars
CREATE TABLE IF NOT EXISTS `characters_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `data` text NOT NULL,
  `vehicle_state` text DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `name` varchar(50) DEFAULT NULL,
  `engine_damage` bigint(19) DEFAULT 1000,
  `body_damage` bigint(20) DEFAULT 1000,
  `degredation` longtext DEFAULT '100,100,100,100,100,100,100,100',
  `current_garage` varchar(50) DEFAULT NULL,
  `server_number` varchar(50) DEFAULT NULL,
  `financed` int(11) DEFAULT 0,
  `last_payment` int(11) DEFAULT 0,
  `phone_number` text DEFAULT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `harness` varchar(50) DEFAULT '',
  `payments_left` int(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- gtav_rp2.characters_cars: ~18 rows (yaklaşık) tablosu için veriler indiriliyor
/*!40000 ALTER TABLE `characters_cars` DISABLE KEYS */;
INSERT INTO `characters_cars` (`id`, `owner`, `cid`, `purchase_price`, `model`, `data`, `vehicle_state`, `fuel`, `name`, `engine_damage`, `body_damage`, `degredation`, `current_garage`, `server_number`, `financed`, `last_payment`, `phone_number`, `coords`, `license_plate`, `harness`, `payments_left`) VALUES
	(32, 'steam:1100001113b37ba', 1, 115000, 'washington', '', 'Normal Impound', 100, 'WASHINGTON', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 79063, 0, NULL, NULL, '68PLX154', NULL, 11),
	(33, 'steam:1100001113b37ba', 1, 115000, 'glendale', '', 'In', 65, 'GLENDALE', 1000, 1000, '100,100,100,100,100,100,100,100', 'Q', NULL, 79063, 0, NULL, NULL, '43RPH211', NULL, 11),
	(34, 'steam:1100001113b37ba', 1, 115000, 'bobcatxl', '', 'Normal Impound', 100, 'BOBCATXL', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 79063, 0, NULL, NULL, '65FPL611', NULL, 11),
	(35, 'steam:1100001113b37ba', 1, 4000, 'taxi', '', 'Normal Impound', 100, 'TAXI', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 0, 0, NULL, '[266.8704833984375,-352.62548828125,44.38508605957031]', '61DHZ807', NULL, 0),
	(36, 'steam:11000013bd84d46', 32, 115000, 'glendale', '', 'In', 100, 'GLENDALE', 1000, 1000, '100,100,100,100,100,100,100,100', 'Q', NULL, 86250, 0, NULL, '[-61.193912506103519,-1107.878173828125,26.1021728515625]', '89QEJ281', NULL, 12),
	(37, 'steam:1100001113b37ba', 1, 9200, 'blazer', '{"extracolors":[0,156],"oldLiveries":0,"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"wheeltype":4,"interColour":0,"plateIndex":5,"platestyle":5,"colors":[12,0],"smokecolor":[255,255,255],"dashColour":0,"neon":{"1":false,"2":1,"3":1,"0":1},"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":2,"12":2,"13":2,"14":44,"15":2,"16":2,"17":false,"18":1,"19":false,"20":false,"21":false,"22":1,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"lights":[255,0,255],"xenonColor":255,"tint":1}', 'Normal Impound', 45, 'BLAZER', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 0, 0, NULL, '[270.08038330078127,-341.5466003417969,44.322120666503909]', '60DRS717', NULL, 0),
	(40, 'steam:1100001113b37ba', 1, 241500, 'baller3', '{"oldLiveries":0,"smokecolor":[255,255,255],"extras":[0,0,0,0,0,0,0,0,0,1,0,1],"xenonColor":255,"wheeltype":3,"extracolors":[2,7],"platestyle":1,"interColour":156,"colors":[12,0],"neon":{"1":false,"2":false,"3":false,"0":false},"tint":1,"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":2,"12":2,"13":2,"14":-1,"15":2,"16":2,"17":false,"18":1,"19":false,"20":false,"21":false,"22":1,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"plateIndex":1,"lights":[255,0,255],"dashColour":8}', 'In', 80, 'BALLER3', 890, 900, '94,100.0,99.0,99.0,50,99.0,99.0,99.0', 'Q', NULL, 166031, 0, NULL, NULL, '86PHL390', NULL, 11),
	(52, 'steam:1100001113b37ba', 1, 115000, 'surfer', '', 'In', 100, 'SURFER', 1000, 1000, '100,100,100,100,100,100,100,100', 'Q', NULL, 79063, 0, NULL, NULL, '23QEI098', NULL, 11),
	(53, 'steam:1100001113b37ba', 1, 109250, 'kuruma', '', 'Normal Impound', 65, 'KURUMA', 995, 905, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 40849, 0, NULL, '[-515.7181396484375,-494.3680725097656,25.036771774291993]', '08PEF419', NULL, 4),
	(54, 'steam:110000117d6c788', 19, 115000, 'gauntlet', '{"dashColour":0,"tint":-1,"extracolors":[3,156],"extras":[0,0,0,0,0,0,0,0,0,1,0,0],"interColour":0,"lights":[255,0,255],"plateIndex":0,"platestyle":0,"wheeltype":1,"smokecolor":[255,255,255],"neon":{"1":false,"2":false,"3":false,"0":false},"xenonColor":255,"colors":[7,65],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":2,"12":2,"13":2,"14":-1,"15":2,"16":2,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"oldLiveries":-1}', 'In', 65, 'GAUNTLET', 1000, 1000, '100,100,100,100,100,100,100,100', 'T', NULL, 86250, 0, NULL, NULL, '45BBR789', NULL, 12),
	(55, 'steam:110000115669977', 21, 17250, 'washington', '{"oldLiveries":-1,"lights":[255,0,255],"extracolors":[0,0],"platestyle":3,"smokecolor":[255,255,255],"colors":[145,0],"extras":[0,0,0,0,0,0,0,0,0,0,1,0],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":2,"12":2,"13":2,"14":-1,"15":-1,"16":2,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"dashColour":0,"neon":{"1":false,"2":false,"3":false,"0":false},"wheeltype":0,"interColour":0,"plateIndex":3,"tint":1,"xenonColor":255}', 'Normal Impound', 65, 'WASHINGT', 1000, 997, '100,99,99,100,100,99,99,99', 'Impound Lot', NULL, 4554, 0, NULL, NULL, '40PVK894', NULL, 0),
	(56, 'steam:110000115669977', 21, 114425, 'coquette3', '', 'Normal Impound', 100, 'COQUETTE3', 1000, 990, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 85818, 0, NULL, NULL, '07DEP982', NULL, 12),
	(57, 'steam:110000117d6c788', 41, 150, 'bmx', '', 'Normal Impound', 100, 'BMX', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 0, 0, NULL, NULL, '25JLD714', NULL, 0),
	(58, 'steam:110000117d6c788', 41, 4000, 'taxi', '', 'In', 65, 'TAXI', 1000, 951, '100,100,100,98,100,100,100,100', 'T', NULL, 0, 0, NULL, NULL, '48XDE579', NULL, 0),
	(59, 'steam:11000010a65b9f0', 50, 25300, 'brioso', '{"oldLiveries":-1,"lights":[255,0,255],"extracolors":[0,0],"platestyle":0,"smokecolor":[255,255,255],"dashColour":111,"colors":[148,148],"mods":{"1":2,"2":0,"3":-1,"4":-1,"5":-1,"6":-1,"7":2,"8":-1,"9":-1,"10":2,"11":2,"12":2,"13":2,"14":2,"15":2,"16":2,"17":false,"18":1,"19":false,"20":false,"21":false,"22":1,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":1},"wheeltype":5,"tint":1,"interColour":111,"plateIndex":0,"neon":{"1":false,"2":false,"3":false,"0":false},"xenonColor":255,"extras":[0,0,0,0,0,0,0,0,0,0,0,0]}', 'Normal Impound', 65, 'BRIOSO', 1000, 1000, '100,100,100,100,100,100,100,100', 'Impound Lot', NULL, 18975, 0, NULL, NULL, '68SUP007', NULL, 12),
	(61, 'steam:1100001113b37ba', 1, 402500, 'LWGTR', '{"tint":1,"smokecolor":[255,255,255],"mods":{"1":-1,"2":3,"3":-1,"4":2,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":2,"12":2,"13":2,"14":-1,"15":2,"16":2,"17":false,"18":1,"19":false,"20":false,"21":false,"22":1,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":0,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":0,"47":-1,"48":-1,"0":-1},"dashColour":0,"lights":[222,222,255],"neon":{"1":1,"2":1,"3":1,"0":1},"colors":[13,13],"interColour":0,"extracolors":[13,12],"xenonColor":8,"oldLiveries":3,"plateIndex":1,"wheeltype":0,"extras":[1,0,0,0,0,0,0,0,0,0,0,0],"platestyle":1}', 'Normal Impound', 36, 'LWGTR', 1000, 977, '71,59,90,71,37,93,94,98', 'Impound Lot', NULL, 301875, 0, NULL, '[487.07012939453127,-1797.7247314453126,27.678804397583009]', '66TRN568', NULL, 12),
	(62, 'steam:1100001360d2ff7', 18, 115000, 'dubsta3', '{"xenonColor":255,"smokecolor":[255,255,255],"dashColour":0,"oldLiveries":-1,"wheeltype":4,"extracolors":[0,0],"neon":{"1":false,"2":false,"3":false,"0":false},"interColour":0,"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":1,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"tint":-1,"colors":[0,0],"plateIndex":0,"lights":[255,0,255],"platestyle":0}', 'Normal Impound', 77, 'DUBSTA3', 0, 195, '100,100,99,96,98,98,100,95', 'Impound Lot', NULL, 86250, 0, NULL, NULL, '49AFX724', NULL, 12),
	(63, 'steam:110000117d6c788', 19, 4000, 'flatbed', '', 'Normal Impound', 95, 'FLATBED', 985, 812, '97,98,99,98,98,97,96,98', 'Impound Lot', NULL, 0, 0, NULL, '[186.93287658691407,-892.2359008789063,31.2015380859375]', '01UNW163', NULL, 0);
/*!40000 ALTER TABLE `characters_cars` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
