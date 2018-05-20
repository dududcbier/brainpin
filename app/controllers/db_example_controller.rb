class DbExampleController < ApplicationController
	
	def index 
		dumbledore = User.find_by name: 'Dumbledore'

		question_mongo = QuestionMongo.create(difficulty: 1, points: 10, rating: 5, text: "No triângulo retângulo da figura abaixo, determine as medidas de x e y indicadas")
		question = Question.create(registrant_id: dumbledore.user_id, question_id: question_mongo._id)

		# Finding the number of questions each subject has
		# p Topic.joins(:course)
	end

end
