class DbExampleController < ApplicationController
	
	def index 
		dumbledore = User.find_by name: 'Dumbledore'

		question_mongo = QuestionMongo.create(difficulty: 1, points: 10, rating: 5, text: "No triângulo retângulo da figura abaixo, determine as medidas de x e y indicadas")
		question = Question.create(id_registrant: dumbledore.id_user, id_mongo: question_mongo._id)
	end

	def save(record)
		begin 
			record.save 
		rescue ActiveRecord::RecordNotUnique
		end
	end
end
