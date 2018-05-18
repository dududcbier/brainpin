
CREATE TABLE avatars (
	id_avatar 		SERIAL PRIMARY KEY,
	avatar_name		VARCHAR(20) NOT NULL UNIQUE,
	img 			BYTEA NOT NULL
);

CREATE TABLE users (
	id_user 		SERIAL PRIMARY KEY,
	id_avatar		INT NOT NULL DEFAULT 0,
	name 			VARCHAR(70) NOT NULL,
	password 		VARCHAR(20) NOT NULL,
	phone	 		CHAR(10),
	cpf				CHAR(11) NOT NULL,
	email			VARCHAR(254) UNIQUE NOT NULL,
	FOREIGN KEY(id_avatar) REFERENCES avatars(id_avatar)
		ON DELETE SET DEFAULT 
		ON UPDATE CASCADE
);

CREATE TABLE students (
	id_user		INT PRIMARY KEY,
	interest	VARCHAR(20),
	school_year	INT NOT NULL,
	birth_date	DATE NOT NULL,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE registrants (
	id_user		INT PRIMARY KEY,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE coordinators (
	id_registrant		INT PRIMARY KEY,
	FOREIGN KEY (id_registrant) REFERENCES registrants(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE teachers (
	id_registrant		INT PRIMARY KEY,
	id_coordinator		INT NOT NULL,
	office				VARCHAR(10) NOT NULL,
	FOREIGN KEY (id_registrant) REFERENCES registrants(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_coordinator) REFERENCES coordinators(id_registrant)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE teachers_titles (
	id_teacher		INT NOT NULL,
	title			VARCHAR(15) NOT NULL,
	FOREIGN KEY (id_teacher) REFERENCES teachers(id_registrant)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (id_teacher, title)
);

CREATE TABLE learnables (
	id_learnable 		SERIAL PRIMARY KEY,
	id_coordinator		INT NOT NULL,
	learnable_name		VARCHAR(20) NOT NULL,
	max_level			INT NOT NULL DEFAULT 10,
	FOREIGN KEY (id_coordinator) REFERENCES coordinators(id_registrant)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE levels_points (
	level			INT NOT NULL,
	id_learnable	INT NOT NULL,
	points			INT NOT NULL,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(level, id_learnable)
);

CREATE TABLE avatar_requirements (
	id_avatar		INT NOT NULL,
	id_learnable	INT NOT NULL,
	min_level		INT NOT NULL,
	FOREIGN KEY (id_avatar) REFERENCES avatars(id_avatar)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	PRIMARY KEY(id_avatar, id_learnable)
);

CREATE TABLE student_levels (
	id_learnable	INT NOT NULL,
	id_student		INT NOT NULL,
	level			INT NOT NULL DEFAULT 1,
	points			INT NOT NULL DEFAULT 0,
	FOREIGN KEY (id_student) REFERENCES students(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(id_learnable, id_student)
);

CREATE TABLE courses (
	id_learnable	INT PRIMARY KEY,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE courses_teachers (
	id_course		INT NOT NULL,
	id_teacher		INT NOT NULL,
	start_date		DATE NOT NULL,
	end_date		DATE,
	FOREIGN KEY (id_course) REFERENCES courses(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_teacher) REFERENCES teachers(id_registrant)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(id_course, id_teacher, start_date)
);

CREATE TABLE topics (
	id_learnable	INT PRIMARY KEY,
	id_course		INT NOT NULL,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_course) REFERENCES courses(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE subtopics (
	id_learnable		INT PRIMARY KEY,
	id_topic			INT NOT NULL,
	FOREIGN KEY (id_learnable) REFERENCES learnables(id_learnable)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_topic) REFERENCES topics(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE questions (
	id_mongo			VARCHAR(50) PRIMARY KEY,
	id_registrant		INT NOT NULL,
	FOREIGN KEY (id_registrant) REFERENCES registrants(id_user)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE subtopics_questions (
	id_question		VARCHAR(50) NOT NULL,
	id_subtopic		INT NOT NULL,
	FOREIGN KEY (id_subtopic) REFERENCES subtopics(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_question) REFERENCES questions(id_mongo)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	PRIMARY KEY(id_question, id_subtopic)
);

CREATE TABLE materials (
	id_material			SERIAL PRIMARY KEY,
	id_teacher			INT NOT NULL,
	id_subtopic			INT NOT NULL,
	description			VARCHAR(400) NOT NULL,
	url					VARCHAR(100),
	file				BYTEA,
	rating				DECIMAL,
	FOREIGN KEY (id_teacher) REFERENCES teachers(id_registrant)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (id_subtopic) REFERENCES subtopics(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE materials_ratings (
	id_student		INT NOT NULL,
	id_material		INT NOT NULL,
	rating			INT NOT NULL,
	FOREIGN KEY (id_student) REFERENCES students(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_material) REFERENCES materials(id_material)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (id_student, id_material)
);

CREATE TABLE study_sessions (
	start_date			DATE NOT NULL,
	id_student			INT NOT NULL,
	id_subtopic			INT	NOT NULL,
	end_date			DATE,
	num_correct			INT,
	num_questions		INT,
	FOREIGN KEY (id_student) REFERENCES students(id_user)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_subtopic) REFERENCES subtopics(id_learnable)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	PRIMARY KEY(start_date, id_student)
);

CREATE TYPE status_tp AS ENUM ('not answered', 'incorrect', 'correct');

CREATE TABLE questions_study_sessions (
	id_question		VARCHAR(50) NOT NULL,
	start_date		DATE NOT NULL,
	id_student		INT NOT NULL,
	status			status_tp NOT NULL DEFAULT 'not answered',
	FOREIGN KEY (id_student, start_date) REFERENCES study_sessions(id_student, start_date)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (id_question) REFERENCES questions(id_mongo)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(id_question, start_date, id_student)
);



