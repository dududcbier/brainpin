
CREATE TABLE avatars (
	avatar_id 		SERIAL PRIMARY KEY,
	avatar_name		VARCHAR(20) NOT NULL UNIQUE,
	img 			BYTEA NOT NULL
);

CREATE TABLE users (
	user_id 		SERIAL PRIMARY KEY,
	avatar_id		INT NOT NULL DEFAULT 0,
	name 			VARCHAR(70) NOT NULL,
	password 		VARCHAR(20) NOT NULL,
	phone	 		CHAR(10),
	cpf				CHAR(11) NOT NULL,
	email			VARCHAR(254) UNIQUE NOT NULL,
	FOREIGN KEY(avatar_id) REFERENCES avatars(avatar_id)
		ON DELETE SET DEFAULT 
		ON UPDATE CASCADE
);

CREATE TABLE students (
	student_id		INT PRIMARY KEY,
	interest	VARCHAR(20),
	school_year	INT NOT NULL,
	birth_date	DATE NOT NULL,
	FOREIGN KEY (student_id) REFERENCES users(user_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE registrants (
	registrant_id		INT PRIMARY KEY,
	FOREIGN KEY (registrant_id) REFERENCES users(user_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE coordinators (
	coordinator_id		INT PRIMARY KEY,
	FOREIGN KEY (coordinator_id) REFERENCES registrants(registrant_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE teachers (
	teacher_id		INT PRIMARY KEY,
	coordinator_id		INT NOT NULL,
	office				VARCHAR(10) NOT NULL,
	FOREIGN KEY (teacher_id) REFERENCES registrants(registrant_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (coordinator_id) REFERENCES coordinators(coordinator_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE teachers_titles (
	teacher_id		INT NOT NULL,
	title			VARCHAR(15) NOT NULL,
	FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (teacher_id, title)
);

CREATE TABLE learnables (
	learnable_id 		SERIAL PRIMARY KEY,
	coordinator_id		INT NOT NULL,
	learnable_name		VARCHAR(20) NOT NULL,
	max_level			INT NOT NULL DEFAULT 10,
	FOREIGN KEY (coordinator_id) REFERENCES coordinators(coordinator_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE levels_points (
	level			INT NOT NULL,
	learnable_id	INT NOT NULL,
	points			INT NOT NULL,
	FOREIGN KEY (learnable_id) REFERENCES learnables(learnable_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(level, learnable_id)
);

CREATE TABLE avatar_requirements (
	avatar_id		INT NOT NULL,
	learnable_id	INT NOT NULL,
	min_level		INT NOT NULL,
	FOREIGN KEY (avatar_id) REFERENCES avatars(avatar_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (learnable_id) REFERENCES learnables(learnable_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	PRIMARY KEY(avatar_id, learnable_id)
);

CREATE TABLE student_levels (
	learnable_id	INT NOT NULL,
	student_id		INT NOT NULL,
	level			INT NOT NULL DEFAULT 1,
	points			INT NOT NULL DEFAULT 0,
	FOREIGN KEY (student_id) REFERENCES students(student_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (learnable_id) REFERENCES learnables(learnable_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(learnable_id, student_id)
);

CREATE TABLE courses (
	course_id	INT PRIMARY KEY,
	FOREIGN KEY (course_id) REFERENCES learnables(learnable_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE courses_teachers (
	course_id		INT NOT NULL,
	teacher_id		INT NOT NULL,
	start_date		DATE NOT NULL,
	end_date		DATE,
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(course_id, teacher_id, start_date)
);

CREATE TABLE topics (
	topic_id	INT PRIMARY KEY,
	course_id		INT NOT NULL,
	FOREIGN KEY (topic_id) REFERENCES learnables(learnable_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses(course_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE subtopics (
	subtopic_id		INT PRIMARY KEY,
	topic_id			INT NOT NULL,
	FOREIGN KEY (subtopic_id) REFERENCES learnables(learnable_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (topic_id) REFERENCES topics(topic_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE questions (
	question_id			VARCHAR(50) PRIMARY KEY,
	registrant_id		INT NOT NULL,
	FOREIGN KEY (registrant_id) REFERENCES registrants(registrant_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE subtopics_questions (
	question_id		VARCHAR(50) NOT NULL,
	subtopic_id		INT NOT NULL,
	FOREIGN KEY (subtopic_id) REFERENCES subtopics(subtopic_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (question_id) REFERENCES questions(question_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	PRIMARY KEY(question_id, subtopic_id)
);

CREATE TABLE materials (
	material_id			SERIAL PRIMARY KEY,
	teacher_id			INT NOT NULL,
	subtopic_id			INT NOT NULL,
	description			VARCHAR(400) NOT NULL,
	url					VARCHAR(100),
	file				BYTEA,
	rating				DECIMAL,
	FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	FOREIGN KEY (subtopic_id) REFERENCES subtopics(subtopic_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE materials_ratings (
	student_id		INT NOT NULL,
	material_id		INT NOT NULL,
	rating			INT NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(student_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (material_id) REFERENCES materials(material_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY (student_id, material_id)
);

CREATE TABLE study_sessions (
	study_session_id	SERIAL PRIMARY KEY,
	start_date			DATE NOT NULL,
	student_id			INT NOT NULL,
	subtopic_id			INT	NOT NULL,
	end_date			DATE,
	num_correct			INT,
	num_questions		INT,
	FOREIGN KEY (student_id) REFERENCES students(student_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (subtopic_id) REFERENCES subtopics(subtopic_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	UNIQUE(start_date, student_id)
);

CREATE TABLE questions_study_sessions (
	question_id			VARCHAR(50) NOT NULL,
	study_session_id	INT NOT NULL,
	status			VARCHAR(15) NOT NULL DEFAULT 'not answered',
	FOREIGN KEY (study_session_id) REFERENCES study_sessions(study_session_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (question_id) REFERENCES questions(question_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	PRIMARY KEY(question_id, study_session_id)
);
