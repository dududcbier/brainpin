# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

avatar = Avatar.create(avatar_name: 'Einstein', img: "imagem")

users = User.create([{name: "Harry Potter", password: "senha", phone: "12345678", cpf: "12345678910", email: "hp@email.com", avatar_id: avatar.avatar_id}, 
					{name: "Dumbledore", password: "senha", phone: "12345678", cpf: "12345672910", email: "d@email.com", avatar_id: avatar.avatar_id}
				])

registrant = Registrant.create(registrant_id: users.last.user_id)

coordinator = Coordinator.create(coordinator_id: registrant.registrant_id)
		
teacher = Teacher.create(teacher_id: registrant.registrant_id, coordinator_id: coordinator.coordinator_id, office: "hmt01")

learnables = Learnable.create([{coordinator_id: coordinator.coordinator_id, learnable_name: "Math"}, 
						{coordinator_id: coordinator.coordinator_id, learnable_name: "Geometry"},
						{coordinator_id: coordinator.coordinator_id, learnable_name: "Triangles"}])

course = Course.create(course_id: learnables.first.learnable_id)

topic = Topic.create(topic_id: learnables[1].learnable_id, course_id: course.course_id)

subtopic = Subtopic.create(subtopic_id: learnables.last.learnable_id, topic_id: topic.topic_id)
