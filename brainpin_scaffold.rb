rails generate scaffold AvatarRequirement avatar:references learnable:references min_level:integer --no-migration;

rails generate scaffold Avatar avatar_name:string img:binary --no-migration;

rails generate scaffold Coordinator  --no-migration;

rails generate scaffold Course  --no-migration;

rails generate scaffold CoursesTeacher course:references teacher:references start_date:date end_date:date --no-migration;

rails generate scaffold Learnable coordinator:references learnable_name:string max_level:integer --no-migration;

rails generate scaffold LevelsPoint level:integer learnable:references points:integer --no-migration;

rails generate scaffold Material teacher:references subtopic:references description:string url:string file:binary rating:decimal --no-migration;

rails generate scaffold MaterialsRating student:references material:references rating:integer --no-migration;

rails generate scaffold Question registrant:references --no-migration;

rails generate scaffold QuestionsStudySession question:references study_session:references status:string --no-migration;

rails generate scaffold Registrant  --no-migration;

rails generate scaffold StudentLevel learnable:references student:references level:integer points:integer --no-migration;

rails generate scaffold Student interest:string school_year:integer birth_date:date --no-migration;

rails generate scaffold StudySession start_date:date student:references subtopic:references end_date:date num_correct:integer num_questions:integer --no-migration;

rails generate scaffold Subtopic topic:references --no-migration;

rails generate scaffold SubtopicsQuestion question:references subtopic:references --no-migration;

rails generate scaffold Teacher coordinator:references office:string --no-migration;

rails generate scaffold TeachersTitle teacher:references title:string --no-migration;

rails generate scaffold Topic course:references --no-migration;

rails generate scaffold User avatar:references name:string password:string phone:string cpf:string email:string --no-migration;