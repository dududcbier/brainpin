# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{name: "Harry Potter", password: "senha", phone: "12345678", cpf: "12345678910", email: "hp@email.com"}, 
					{name: "Dumbledore", password: "senha", phone: "12345678", cpf: "12345672910", email: "d@email.com"}
				])

registrant = Registrant.create(user_id: users.last.id)

teacher = Teacher.create(registrant_id: registrant.id, office: '1234')

student = Student.create(user_id: users.first.id, school_year: 8, birth_date: Time.now, interest: "Math")

learnables = Learnable.create([{name: "Math"},
								{name: "Biology"},
								{name: "Geometry"},
								{name: "Statistics"},
								{name: "Genetics"},
								{name: "Triangles"},
								{name: "Circles"},
								{name: "Probability"},
								{name: "DNA"}
							])

courses = Course.create([{learnable_id: Learnable.find_by_name("Math").id},
							{learnable_id: Learnable.find_by_name("Biology").id}
						])

topics = Topic.create([{learnable_id: Learnable.find_by_name("Geometry").id, course_id: courses.first.id},
							{learnable_id: Learnable.find_by_name("Statistics").id, course_id: courses.first.id},
							{learnable_id: Learnable.find_by_name("Genetics").id, course_id: courses.last.id}
						])

subtopics = Subtopic.create([{learnable_id: Learnable.find_by_name("Triangles").id, topic_id: topics.first.id},
							{learnable_id: Learnable.find_by_name("Circles").id, topic_id: topics.first.id},
							{learnable_id: Learnable.find_by_name("Probability").id, topic_id: topics.second.id},
							{learnable_id: Learnable.find_by_name("DNA").id, topic_id: topics.last.id}
						])

material = Material.create(teacher_id: teacher.id, subtopic_id: subtopics.first.id, description: "Pythagorean Theorem", url: "https://en.wikipedia.org/wiki/Pythagorean_theorem")

