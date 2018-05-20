class DbExampleController < ApplicationController
	
	def index 
		dumbledore = User.find_by name: 'Dumbledore'
		triangles = Learnable.find_by learnable_name: 'Triangles'
		math = Learnable.find_by learnable_name: 'Math'

		circles = Learnable.create(coordinator_id: dumbledore.user_id, learnable_name: "Circlse")
		
		# Update in postgreSQL
		circles.update(learnable_name: 'Circles')

		Topic.create(topic_id: circles.learnable_id, course_id: math.learnable_id)

		question_mongo1 = QuestionMongo.create(difficulty: 5, points: 50, rating: 3, text: "No triângulo retângulo da figura abaixo, determine a medida de x:")
		question1 = Question.create(registrant_id: dumbledore.user_id, question_id: question_mongo1._id)
		subtopics_question1 = SubtopicsQuestion.create(question_id: question1.question_id, subtopic_id: triangles.learnable_id)

		question_mongo2 = QuestionMongo.create(difficulty: 1, points: 10, rating: 1, text: "Os triângulos podem ser classificados com relação aos seus ângulos ou com relação aos seus lados. Dois triângulos colocados lado a lado possuem as seguintes características: o primeiro possui um ângulo de 90°01' e o segundo possui três lados iguais. As classificações respectivamente corretas para esses triângulos são:")
		question2 = Question.create(registrant_id: dumbledore.user_id, question_id: question_mongo2._id)
		subtopics_question2 = SubtopicsQuestion.create(question_id: question2.question_id, subtopic_id: triangles.learnable_id)

		question_mongo3 = QuestionMongo.create(difficulty: 10, points: 100, rating: 4.5, text: "Na figura, as retas r e s são paralelas, o ângulo 1 mede 45o e o ângulo 2 mede 55o. A medida, em graus, do ângulo 3 é:")
		question3 = Question.create(registrant_id: dumbledore.user_id, question_id: question_mongo3._id)
		subtopics_question3 = SubtopicsQuestion.create(question_id: question3.question_id, subtopic_id: triangles.learnable_id)
		
		# Finding the number of questions each topic has
		Topic.find_each do |topic|
			n = SubtopicsQuestion.joins(:subtopic).where("subtopics.topic_id = ?", topic.topic_id).count()
			p Learnable.find(topic.topic_id).learnable_name() + " - " + n.to_s
		end

		# Update in mongoDB
		question_mongo1.comments = []
		question_mongo1.comments.push({text: "Too easy!", date: "2018-05-20", user_id: 1})
		question_mongo1.comments.push({text: "Help! What was the formula again?", date: "2018-05-20", user_id: 2, comments: [{text: "a^2 + b^2 = c^2", date: "2018-05-20", user_id: 1}]}) 
		question_mongo1.save

		p question_mongo1

		# Deleting a single record
		# SQL was needed because rails doesn't like tables with composite primary keys
		sql = "DELETE FROM subtopics_questions WHERE question_id = '" + subtopics_question3.question_id + "' AND subtopic_id = " + subtopics_question3.subtopic_id.to_s
		ActiveRecord::Base.connection.execute(sql)
		question3.destroy
		# It's the same for mongoDB
		question_mongo3.destroy

		# Deleting multiple records
		sql = "DELETE FROM subtopics_questions"
		ActiveRecord::Base.connection.execute(sql)
		Question.where(registrant_id: dumbledore.user_id).destroy_all
		QuestionMongo.destroy_all(:difficulty.gte => 0)
	end

end
