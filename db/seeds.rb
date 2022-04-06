User.create(name: "Deki",
             email: "duonggoku2000@gmail.com",
             admin:'1',
             activated: '1',
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
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
