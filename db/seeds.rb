# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = User.create(first_name: "Geyvin", last_name: "Ediezca", email: "vinediezca@layawsuroy.com", password: "1234567890", password_confirmation: "1234567890", role: "admin")
admin2 = User.create(first_name: "Bernie", last_name: "Itang", email: "bernieitang@layawsuroy.com", password: "1234567890", password_confirmation: "1234567890", role: "admin")
admin3 = User.create(first_name: "Jensen", last_name: "Jumatay", email: "jensenjumatay@layawsuroy.com", password: "1234567890", password_confirmation: "1234567890", role: "admin")
admin3 = User.create(first_name: "Rick Brian", last_name: "Espena", email: "rbespena@layawsuroy.com", password: "1234567890", password_confirmation: "1234567890", role: "admin")