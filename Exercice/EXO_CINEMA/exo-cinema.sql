-- A. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur

SELECT f.id_film, f.titre, f.anneeSortie, p.nom, p.prenom, 
DATE_FORMAT( SEC_TO_TIME(f.dureeMinutes*60) , "%H:%i") AS dureeHeureMinute
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne

-- B. Liste des films dont la durée excède 2h15 classés par durée (du plus long au plus court

SELECT f.titre, DATE_FORMAT( SEC_TO_TIME(f.dureeMinutes*60) , "%H:%i") AS dureeHeureMinute
FROM film f
WHERE f.dureeMinutes >= 135
ORDER BY id_film

-- C. Liste des films d’un réalisateur (en précisant l’année de sortie)

SELECT  p.nom, p.prenom, f.titre, f.anneeSortie
FROM realisateur r
INNER JOIN film f ON r.id_realisateur = f.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
ORDER  BY r.id_realisateur

-- D. Nombre de films par genre (classés dans l’ordre décroissant)

SELECT g.nomGenre, count(g.id_genre) AS nbrFilm
FROM film f
INNER JOIN classer c ON f.id_film = c.id_film
INNER JOIN genre g ON c.id_genre = g.id_genre
GROUP BY g.id_genre
ORDER BY nbrFilm DESC 

-- E. Nombre de films par réalisateur (classés dans l’ordre décroissant)

SELECT p.nom, COUNT(f.id_realisateur) AS nbrFilm
FROM realisateur r
INNER JOIN film f ON r.id_realisateur = f.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
GROUP BY r.id_realisateur
ORDER BY nbrFilm DESC

-- F. Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

SELECT p.nom, p.prenom, p.sexe
FROM acteur a
INNER JOIN casting c ON a.id_acteur = c.id_acteur
INNER JOIN personne p ON a.id_personne = p.id_personne
WHERE c.id_film = 2

-- G. Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

SELECT f.titre , f.anneeSortie, r.nomRole
FROM film f
INNER JOIN casting c ON f.id_film = c.id_film
INNER JOIN acteur a ON c.id_acteur = a.id_acteur
INNER JOIN role r ON c.id_role  = r.id_role
WHERE a.id_acteur = 6

-- H. Listes des personnes qui sont à la fois acteurs et réalisateurs

SELECT p.nom, p.prenom
FROM personne p
INNER JOIN acteur a ON p.id_personne = a.id_personne
INNER JOIN realisateur r ON p.id_personne = r.id_personne

-- I. Liste des films qui ont moins de 20 ans (classés du plus récent au plus ancien)

SELECT f.titre
FROM film f
WHERE f.anneeSortie >= 2019
ORDER BY f.anneeSortie DESC 

-- J. Nombre d’hommes et de femmes parmi les acteurs

SELECT SUM(p.sexe = 'Homme') AS nbrHomme, SUM(p.sexe = 'Femme') AS nbrFemme
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne


-- K. Liste des acteurs ayant plus de 70 ans (âge révolu et non révolu)

SELECT p.nom AS Nom, p.prenom AS Prenom, ROUND(DATEDIFF( NOW(), p.dateNaissance)/365) AS age
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
HAVING  age >= 70

-- L. Acteurs ayant joué dans 3 films ou plus

SELECT p.nom, p.prenom, COUNT(c.id_acteur) AS nbrFilm
FROM acteur a
INNER JOIN casting c ON a.id_acteur = c.id_acteur
INNER JOIN personne p ON a.id_personne = p.id_personne
GROUP BY c.id_acteur
HAVING nbrFilm >=3