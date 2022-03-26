# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do |i|
  User.create!(
    name: "user#{rand(1..99)}",
    age: rand(18..99),
    phone: "09#{rand(11111111..99999999)}",
    email: "user_#{i}@gmail.com"
)
end