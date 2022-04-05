# person= FakePerson.new
# 10.times do |i|
#   User.create(
#     name: person.name,
#     email: person.free_email_address,
#     password: 'Duong123'
#   )
# end
# Create a main sample user.
User.create(name: "Deki",
             email: "duonggoku2000@gmail.org",
             password: "Duong123",
             password_confirmation: "Duong123")
# Generate a bunch of additional users.
99.times do |n|
  person = FakePerson.new
  name = person.name
  email = person.free_email_address
  password = "Duong123"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
