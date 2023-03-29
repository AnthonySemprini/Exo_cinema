-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema_anthony
CREATE DATABASE IF NOT EXISTS `cinema_anthony` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `cinema_anthony`;

-- Listage de la structure de la table cinema_anthony. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int(11) NOT NULL AUTO_INCREMENT,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_acteur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_acteur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.acteur : ~12 rows (environ)
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(3, NULL),
	(6, NULL),
	(7, NULL),
	(8, NULL),
	(9, NULL),
	(10, NULL),
	(11, NULL),
	(12, NULL),
	(13, NULL),
	(14, NULL),
	(15, NULL),
	(16, NULL);
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. casting
CREATE TABLE IF NOT EXISTS `casting` (
  `id_acteur` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  KEY `id_acteur` (`id_acteur`),
  KEY `id_film` (`id_film`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `casting_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.casting : ~18 rows (environ)
/*!40000 ALTER TABLE `casting` DISABLE KEYS */;
INSERT INTO `casting` (`id_acteur`, `id_film`, `id_role`) VALUES
	(13, 7, 5),
	(8, 6, 9),
	(8, 2, 9),
	(12, 3, 12),
	(3, 5, 3),
	(3, 4, 3),
	(15, 1, 6),
	(7, 12, 13),
	(16, 1, 4),
	(9, 11, 10),
	(10, 2, 8),
	(11, 3, 11),
	(11, 10, 7),
	(14, 10, 14),
	(6, 8, 2),
	(6, 9, 2),
	(6, 15, 2),
	(3, 14, 3);
/*!40000 ALTER TABLE `casting` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. classer
CREATE TABLE IF NOT EXISTS `classer` (
  `id_film` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  KEY `id_film` (`id_film`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `classer_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `classer_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.classer : ~21 rows (environ)
/*!40000 ALTER TABLE `classer` DISABLE KEYS */;
INSERT INTO `classer` (`id_film`, `id_genre`) VALUES
	(1, 7),
	(1, 8),
	(2, 1),
	(2, 8),
	(3, 1),
	(3, 4),
	(4, 1),
	(4, 2),
	(5, 1),
	(5, 2),
	(6, 3),
	(7, 9),
	(8, 1),
	(8, 8),
	(9, 1),
	(9, 2),
	(10, 1),
	(10, 3),
	(11, 2),
	(12, 2),
	(12, 6);
/*!40000 ALTER TABLE `classer` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `anneeSortie` int(11) NOT NULL,
  `dureeMinutes` int(11) NOT NULL,
  `synopsis` text NOT NULL,
  `note` int(11) NOT NULL,
  `affiche` varchar(255) NOT NULL,
  `id_realisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.film : ~15 rows (environ)
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` (`id_film`, `titre`, `anneeSortie`, `dureeMinutes`, `synopsis`, `note`, `affiche`, `id_realisateur`) VALUES
	(1, 'Le silence des agneaux', 1991, 118, 'Un psychopathe connu sous le nom de Buffalo Bill sème la terreur dans le Middle West en kidnappant et en assassinant de jeunes femmes. Clarice Starling, une jeune agent du FBI, est chargée d\'interroger l\'ex-psychiatre Hannibal Lecter. Psychopathe redoutablement intelligent et porté sur le cannibalisme, Lecter est capable de lui fournir des informations concernant Buffalo Bill ainsi que son portrait psychologique. Mais il n\'accepte de l\'aider qu\'en échange d\'informations sur la vie privée de la jeune femme. Entre eux s\'établit un lien de fascination et de répulsion.\r\n', 4, 'https://www.ecranlarge.com/media/cache/1600x1200/uploads/image/001/203/fbjfvpmcmyghw3i8tcmef4cweuh-680.jpg', 1),
	(2, 'Speed', 1994, 116, 'Un jeune policier est aux prises avec un maître chanteur, artificier à la retraite, qui menace de faire sauter un autobus dans lequel il a placé une bombe qu\'il peut faire exploser à distance.', 3, 'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/B595D609DF84483CE4A6F8419D356325A690DF88F2C7267D556388ED618A86F2/scale?width=506&aspectRatio=2.00&format=jpeg', 2),
	(3, 'True Lies', 1994, 144, 'Comment un agent secret va reconquérir sa femme qui ignore tout des activités secrètes de son époux et le trouve bien fade en Monsieur-tout-le-monde...', 2, 'https://fr.web.img3.acsta.net/medias/nmedia/18/64/75/73/19224329.jpg', 3),
	(4, 'Les aventuriers de l\'arche perdue', 1981, 116, '1936. Parti à la recherche d\'une idole sacrée en pleine jungle péruvienne, l\'aventurier Indiana Jones échappe de justesse à une embuscade tendue par son plus coriace adversaire : le Français René Belloq.\r\nRevenu à la vie civile à son poste de professeur universitaire d\'archéologie, il est mandaté par les services secrets et par son ami Marcus Brody, conservateur du National Museum de Washington, pour mettre la main sur le Médaillon de Râ, en possession de son ancienne amante Marion Ravenwood, désormais tenancière d\'un bar au Tibet.\r\nCet artefact égyptien serait en effet un premier pas sur le chemin de l\'Arche d\'Alliance, celle-là même où Moïse conserva les Dix Commandements. Une pièce historique aux pouvoirs inimaginables dont Hitler cherche à s\'emparer...', 5, 'https://i0.wp.com/www.filmspourenfants.net/wp-content/uploads/2018/04/les-aventuriers-de-larche-perdue-a.jpg?fit=555%2C747&ssl=1', 4),
	(5, 'Indiana Jones et le temple maudit', 1984, 118, 'L\'archéologue aventurier Indiana Jones est de retour. Il poursuit une terrible secte qui a dérobé un joyau sacré doté de pouvoirs fabuleux. Une chanteuse de cabaret et un époustouflant gamin l\'aideront a affronter les dangers les plus insensés.\r\n', 5, 'https://i0.wp.com/www.filmspourenfants.net/wp-content/uploads/2018/04/indiana-jones-et-le-temple-maudit-a.jpg?fit=555%2C715&ssl=1', 4),
	(6, 'Bird box', 2020, 117, 'Alors qu\'une mystérieuse force décime la population mondiale, une seule chose est sûre : ceux qui ont gardé les yeux ouverts ont perdu la vie. Malgré la situation, Malorie trouve l\'amour, l\'espoir et un nouveau départ avant de tout voir s\'envoler. Désormais, elle doit prendre la fuite avec ses deux enfants, suivre une rivière périlleuse jusqu\'au seul endroit où ils peuvent encore se réfugier. Mais pour survivre, ils devront entreprendre ce voyage difficile les yeux bandés.\r\n', 3, 'https://fr.web.img6.acsta.net/pictures/18/10/24/16/32/3420946.jpg', 5),
	(7, '8 mile', 2003, 110, 'A Detroit, en 1995, Jimmy Smith Jr. a des rêves plein la tête, mais il lui manque encore les mots pour les exprimer. Sa vie d\'adolescent se déroule entre banlieue blanche et quartiers noirs, le long de cette ligne de démarcation que l\'on nomme 8 Mile Road. En dépit de tous ses efforts, Jimmy n\'a jamais franchi cette barrière symbolique et continue d\'accumuler les déboires familiaux, professionnels et sentimentaux.\r\n\r\nUn jour, il participe à un clash - une joute oratoire de rappeurs - où il doit faire face à Papa Doc, le chef de la bande des " Leaders du Monde Libre ". Paralysé par le trac, il reste muet et doit quitter la scène sous les huées de la foule. Cette nouvelle humiliation l\'oblige à un salutaire examen de conscience. Quelques jours plus tard, Jimmy se retrouve forcé de tenter un come-back...\r\n', 4, 'https://fr.web.img4.acsta.net/medias/nmedia/00/02/46/93/affiche.jpg', 6),
	(8, 'Piége de cristal', 1988, 135, 'John McClane, policier new-yorkais, est venu rejoindre sa femme Holly, dont il est séparé depuis plusieurs mois, pour les fêtes de Noël dans le secret espoir d\'une réconciliation. Celle-ci est cadre dans une multinationale japonaise, la Nakatomi Corporation. Son patron, M. Takagi, donne une soirée en l\'honneur de ses employés, à laquelle assiste McClane. Tandis qu\'il s\'isole pour téléphoner, un commando investit l\'immeuble et coupe toutes les communications avec l\'extérieur...', 4, 'https://www.ecranlarge.com/media/cache/1600x1200/uploads/image/001/122/omoh8uh4u5psmdw3dgtzco6eql8-427.jpg', 7),
	(9, 'Une journée en enfer', 1995, 145, 'Le lieutenant John McClane est de retour et il est demandé en personne par un terroriste, Simon, qui menace New York. Alors qu\'il fait équipe avec Zeus, un commerçant du quartier d\'Harlem embarqué dans l\'aventure malgré lui, McLane se livre à un petit jeu à travers toute la ville, devant résoudre des énigmes. S\'il rate son coup, une bombe explose, c\'est la règle imposée par Simon...\r\n', 4, 'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51bXwsdYQAL._AC_SY445_.jpg', 7),
	(10, 'Total Recall', 1990, 113, 'La planète Terre, 2048. Hanté par un cauchemar qui l’entraîne chaque nuit sur Mars, Doug Quaid s’adresse à un laboratoire, Rekall, qui lui offre de matérialiser son rêve grâce à un puissant hallucinogène. Mais l’expérience dérape : la drogue réveille en lui le souvenir d’un séjour bien réel sur Mars, à l’époque où il était l’agent le plus redouté du despote Cohaagen. Des tueurs désormais à ses trousses, Quaid décide de repartir sur la planète rouge où l’attendent d’autres souvenirs et bien d’autres dangers...\r\n', 4, 'https://fr.web.img2.acsta.net/pictures/20/09/07/11/16/5690971.jpg', 8),
	(11, 'Les autres', 2001, 132, 'En 1945, dans une immense demeure victorienne isolée sur l\'île de Jersey située au large de la Normandie, vit Grace, une jeune femme pieuse, et ses deux enfants, Anne et Nicholas. Les journées sont longues pour cette mère de famille qui passe tout son temps à éduquer ses enfants en leur inculquant ses principes religieux. Atteints d\'un mal étrange, Anne et Nicholas ne doivent en aucun cas être exposés à la lumière du jour. Ils vivent donc reclus dans ce manoir obscur, tous rideaux tirés.\r\nUn jour d\'épais brouillard, trois personnes frappent à la porte du manoir isolé, en quête d’un travail. Grace, qui a justement besoin d\'aide pour l\'entretien du parc ainsi que d’une nouvelle nounou pour ses enfants, les engage. Dès lors, des événements étranges surviennent dans la demeure...', 2, 'https://fr.web.img4.acsta.net/medias/nmedia/00/02/33/92/afflesautres.jpg', 9),
	(12, 'Robin des bois prince des voleurs', 1991, 140, 'En 1193, Le Roi d\'Angleterre Richard Coeur de Lion est retenu captif par les Autrichiens. Évadé d\'une geôle à Jérusalem après une croisade des plus périlleuses, Robin de Locksley retourne sur l\'île de Grande-Bretagne. Il est accompagné d\'Azeem, un Maure qu\'il a libéré. Mais Robin réalise avec horreur que ses terres natales ont été mises à feu et à sang. Le Shérif de Nottingham opprime les populations locales et agit comme un vrai tyran. Considéré comme un hors-la-loi, Robin se réfugie dans la forêt de Sherwood. Il y rencontre des brigands et s\'allie avec eux pour défier le Shérif, qui cherche à s\'emparer du trône royal.\r\n', 5, 'https://fr.web.img3.acsta.net/pictures/210/122/21012285_20130613120205794.jpg', 10),
	(13, 'Bopha', 2020, 120, 'En pleine Apartheid, les mésaventures d\'un policier noir en Afrique du Sud, qui subit le racisme de ses supérieurs...', 0, 'https://fr.web.img3.acsta.net/c_310_420/medias/nmedia/18/72/99/39/19185807.jpg', 11),
	(14, 'Les aventuriers de l\'arche perdue', 1989, 124, '1936. Parti à la recherche d\'une idole sacrée en pleine jungle péruvienne, l\'aventurier Indiana Jones échappe de justesse à une embuscade tendue par son plus coriace adversaire : le Français René Belloq.', 5, 'https://fr.web.img2.acsta.net/c_310_420/medias/nmedia/00/02/49/18/affiche.jpg', 4),
	(15, 'Belle journée pour mourir', 2013, 96, 'Bruce Willis est de retour dans son rôle le plus mythique : John McClane, le « vrai héros » par excellence, qui a le talent et la trempe de celui qui résiste jusqu’au bout.', 4, 'https://fr.web.img6.acsta.net/c_310_420/medias/nmedia/18/94/29/36/20417688.jpg', 7);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `nomGenre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.genre : ~9 rows (environ)
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id_genre`, `nomGenre`) VALUES
	(1, 'Action'),
	(2, 'Aventure'),
	(3, 'Science Fiction'),
	(4, 'Commedie'),
	(5, 'Thriller'),
	(6, 'Super hero'),
	(7, 'Horreur'),
	(8, 'Policier'),
	(9, 'Biopic');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sexe` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table cinema_anthony.personne : ~22 rows (environ)
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `sexe`, `DateNaissance`) VALUES
	(1, 'Demme', 'Jonathan', 'Homme', '1944-02-22'),
	(2, 'Graham', 'Yost', 'Homme', '1961-11-23'),
	(3, 'Cameron', 'James', 'Homme', '1954-08-16'),
	(4, 'Spielberg', 'Steven', 'Homme', '1946-12-18'),
	(5, 'Bier', 'Susanne', 'Femme', '1960-04-15'),
	(6, 'Hanson', 'Curtis', 'Homme', '1945-03-24'),
	(7, 'McTiernan', 'John', 'Homme', '1951-01-08'),
	(8, 'Verhoeven', 'Paul', 'Homme', '1938-07-18'),
	(9, 'amenabar', 'Alejandro', 'Homme', '1965-12-21'),
	(10, 'Reynolds', 'Kevin', 'Homme', '1952-01-17'),
	(11, 'Freeman', 'Morgan', 'Homme', '1937-06-01'),
	(12, 'Ford ', 'Harrisson', 'Homme', '1942-07-13'),
	(13, 'Willis', 'Bruce', 'Homme', '1955-03-25'),
	(14, 'Reeves', 'Keanu', 'Homme', '1964-09-02'),
	(15, 'Bullock', 'Sandra', 'Femme', '1964-07-26'),
	(16, 'Kidman', 'Nicole', 'Femme', '1967-06-20'),
	(17, 'Schwarzeneger', 'Arnold', 'Homme', '1947-07-30'),
	(18, 'Curtis', 'Jamie Lee', 'Femme', '1958-11-22'),
	(19, 'Basinger', 'Kim', 'Femme', '1953-12-08'),
	(20, 'Stone', 'Sharon', 'Femme', '1958-03-10'),
	(21, 'Foster', 'Jodie', 'Femme', '1962-11-19'),
	(22, 'Hopkins', 'Anthony', 'Homme', '1937-12-31');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int(11) NOT NULL AUTO_INCREMENT,
  `id_personne` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_realisateur`),
  KEY `id_personne` (`id_personne`),
  CONSTRAINT `FK_realisateur_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.realisateur : ~11 rows (environ)
/*!40000 ALTER TABLE `realisateur` DISABLE KEYS */;
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(5, NULL),
	(6, NULL),
	(7, NULL),
	(8, NULL),
	(9, NULL),
	(10, NULL),
	(11, NULL);
/*!40000 ALTER TABLE `realisateur` ENABLE KEYS */;

-- Listage de la structure de la table cinema_anthony. role
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nomRole` varchar(50) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Listage des données de la table cinema_anthony.role : ~14 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id_role`, `nomRole`) VALUES
	(1, 'Robin des bois'),
	(2, 'John Mc Lane'),
	(3, 'Indiana Jones'),
	(4, 'Hannibal Lecter'),
	(5, 'Mère de Eminem'),
	(6, 'Clarisse Starling'),
	(7, 'Doug Kaid'),
	(8, 'Jeune Policier'),
	(9, 'Malorie'),
	(10, 'Grace'),
	(11, 'Agent secret'),
	(12, 'Femme de l\'Agent secret'),
	(13, 'Azeem'),
	(14, 'Lori');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
