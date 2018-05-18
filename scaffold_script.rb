rails generate scaffold AvatarRequirement id_avatar:integer id_learnable:integer min_level:integer --no-migration;

rails generate scaffold Avatar avatar_name:string img:binary --no-migration;

rails generate scaffold Coordinator  --no-migration;

rails generate scaffold Course  --no-migration;

rails generate scaffold CoursesTeacher id_course:integer id_teacher:integer start_date:date end_date:date --no-migration;

rails generate scaffold Learnable id_coordinator:integer learnable_name:string max_level:integer --no-migration;

rails generate scaffold LevelsPoint level:integer id_learnable:integer points:integer --no-migration;

rails generate scaffold Material id_teacher:integer id_subtopic:integer description:string url:string file:binary rating:decimal --no-migration;

rails generate scaffold MaterialsRating id_student:integer id_material:integer rating:integer --no-migration;

rails generate scaffold Question id_registrant:integer --no-migration;

rails generate scaffold Registrant  --no-migration;

rails generate scaffold StudentLevel id_learnable:integer id_student:integer level:integer points:integer --no-migration;

rails generate scaffold Student interest:string school_year:integer birth_date:date --no-migration;

rails generate scaffold StudySession start_date:date id_student:integer id_subtopic:integer end_date:date num_correct:integer num_questions:integer --no-migration;

rails generate scaffold Subtopic id_topic:integer --no-migration;

rails generate scaffold SubtopicsQuestion id_question:string id_subtopic:integer --no-migration;

rails generate scaffold Teacher id_coordinator:integer office:string --no-migration;

rails generate scaffold TeachersTitle id_teacher:integer title:string --no-migration;

rails generate scaffold Topic id_course:integer --no-migration;

rails generate scaffold User id_avatar:integer name:string password:string phone:string cpf:string email:string --no-migration;
