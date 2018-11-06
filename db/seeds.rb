User.delete_all

PASSWORD = "secret"

super_user = Teacher.create(
  name: "Orsi",
  email: "orsidoestest@gmail.com",
  password: PASSWORD
  # admin: true
)

10.times do
  name = Faker::OnePiece.character
  t = Teacher.create(
    name: name,
    email: "#{name.downcase}.teacher@example.com",
    password: PASSWORD
  )
end

5.times do
  name = Faker::Dota.hero
  s = Student.create(
    name: name,
    email: "#{name.downcase}.student@example.com",
    password: PASSWORD
  )
end