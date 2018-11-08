User.delete_all

PASSWORD = "secret"

super_user = User.create(
  name: "Orsi",
  email: "orsidoestest@gmail.com",
  is_teacher: true,
  password: PASSWORD
  # admin: true
)

10.times do
  name = Faker::OnePiece.character
  t = User.create(
    name: name,
    email: "#{name.downcase}.teacher@example.com",
    is_teacher: true,
    password: PASSWORD
  )
end

5.times do
  name = Faker::Dota.hero
  s = User.create(
    name: name,
    email: "#{name.downcase}.student@example.com",
    password: PASSWORD
  )
end