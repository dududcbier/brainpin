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
