
CREATE TABLE students (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (20), city VARCHAR (20));

INSERT INTO students(name, city) VALUES ("Véronique", "Paris");
INSERT INTO students(name, city) VALUES ("Steeven", "Lyon");
INSERT INTO students(name, city) VALUES ("Marc", "Marseille");
INSERT INTO students(name, city) VALUES ("Nour", "Lyon");
INSERT INTO students(name, city) VALUES ("Romain", "Paris");
INSERT INTO students(name, city) VALUES ("Sophie", "Paris");

CREATE TABLE languages (id INT AUTO_INCREMENT, name VARCHAR (30), PRIMARY KEY (id));
INSERT INTO languages(name) VALUES ("french");
INSERT INTO languages(name) VALUES ("english");
INSERT INTO languages(name) VALUES ("german");
INSERT INTO languages(name) VALUES ("spanish");
INSERT INTO languages(name) VALUES ("mandarin");

CREATE TABLE favorites (id INT PRIMARY KEY AUTO_INCREMENT, class VARCHAR(30), sport VARCHAR(30), student_id INT, CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id));
INSERT INTO favorites (class, sport, student_id) VALUES
	("Maths", "Cricket", 2),
	("Music", "Hip-hop", 6),
	("Arts", "Boxing", 1),
	("Literature", "Tennis", 3),
	("Computer-science", "Tennis", 5),
	("Arts", "Baseball", 4);

CREATE TABLE students_languages (id INT PRIMARY KEY AUTO_INCREMENT, student_id INT, language_id INT);
INSERT INTO students_languages (student_id, language_id) VALUES
	(1, 1),
	(1, 2),
	(2,1),
	(2,3),
	(3,1),
	(4,1),
	(4,2),
	(4,4),
	(4,5),
	(5,1),
	(5,5),
	(6,1),
	(6,2),
	(6,3);

-- Rappport lvl 1
-- 1. Récupérer toutes les colonnes de l’étudiant.e avec l’ID 3
SELECT * FROM students WHERE id = 3;
-- 2. Récupérer toutes les colonnes l’étudiant.e avec l’ID 6
SELECT * FROM students WHERE id = 6;
-- 3. Récupérer le nom et la ville de l’étudiant.e avec l’ID 1
SELECT name, city FROM students WHERE id = 1;
-- 4. Récupérer le nom de l’étudiant.e avec l’ID 2
SELECT name FROM students WHERE id = 2;
-- 5. Récupérer toutes les colonnes des étudiant.e.s de la ville de Paris
SELECT * FROM students WHERE city = 'Paris';
-- 6. Récupérer les noms des étudiant.es de la ville de Lyon
SELECT name FROM students WHERE city = 'Lyon';

--  Rapport lvl 2
-- 1. Pour l’étudiant.e d’ID 5, récupérer toutes les colonnes sur l’étudiant.e et ses activités favorites
SELECT * FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE students.id = 5;
-- 2. Pour l’étudiant.e d’ID 4, récupérer son nom et son sport préféré
SELECT name, sport FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE students.id = 4;
-- autre façon
SELECT students.name, favorites.sport FROM students, favorites WHERE students.id = 4 AND favorites.student_id = 4;
-- 3. Pour l’étudiant.e d’ID 1, récupérer son nom et sa matière préférée
SELECT name, class FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE students.id = 1;
-- 4. Récupérer toutes les colonnes de l’étudiant.e qui aime la musique
SELECT * FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE favorites.class = 'Music';
-- 5. Récupérer le nom des étudiant.e.s qui aime le tennis
SELECT name FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE favorites.sport = 'Tennis';
-- 6. Récupérer le nom des étudiant.e.s qui aime les matières artistiques
SELECT name FROM students INNER JOIN favorites ON students.id = favorites.student_id WHERE favorites.class = 'Arts';
-- 7. Récupérer le nombre d’étudiant.e.s de la ville de Paris
SELECT students.id, name, COUNT(*) as languagesCount FROM students INNER JOIN students_languages ON students_languages.student_id = students.id group by students.id

-- Rapport lvl 3
-- 1. Récupérer les langues et toutes les colonnes de l’étudiant.e d’ID 1
SELECT * FROM students
INNER JOIN students_languages ON students_languages.student_id = students.id
INNER JOIN languages ON languages.id = students_languages.language_id
WHERE students.id = 1
-- 2. Récupérer les langues et toutes les colonnes de l’étudiant.e d’ID 4
SELECT * FROM students
INNER JOIN students_languages ON students_languages.student_id = students.id
INNER JOIN languages ON languages.id = students_languages.language_id
WHERE students.id = 4
-- 3. Récupérer la colonne langue et le nom de l’étudiant.e d’ID 5
SELECT students.name, languages.name FROM students
INNER JOIN students_languages ON students_languages.student_id = students.id
INNER JOIN languages ON languages.id = students_languages.language_id
WHERE students.id = 5
-- 4. Pour chaque étudiant.e.s (6), faîtes une requêtes pour récupérer le nombre de langues parlées par cet étudiant.e.s avec leurs noms et le nombres de langues
SELECT students.name, COUNT(*) as nbLanguages FROM students
INNER JOIN students_languages ON students_languages.student_id = students.id
INNER JOIN languages ON languages.id = students_languages.language_id
WHERE students.id = 1
GROUP BY students.name

-- Bonus
SELECT name FROM students WHERE name LIKE '%e%'
SELECT name, sport FROM students JOIN favorites ON students.id = favorites.student_id WHERE name LIKE '%e%'
SELECT name, class, city FROM students JOIN favorites ON students.id = favorites.student_id WHERE city LIKE '%i%'

