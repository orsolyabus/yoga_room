Teacher.delete_all

PASSWORD = "secret"

super_user = Teacher.create(
  name: "Orsi",
  spiritual_name: "Paramdev",
  email: "orsidoestest@gmail.com",
  password: PASSWORD,
  admin: true
)

10.times do
  name = Faker::Name.first_name
  spiritual_name = Faker::Space.star

  t = Teacher.create(
    name: name,
    spiritual_name: spiritual_name,
    email: "#{name.downcase}.#{spiritual_name.downcase}@example.com",
    password: PASSWORD,
    image_url: Faker::Avatar.image("my-own-slug"),
    introduction: Faker::Lorem.paragraph,
    phone: Faker::PhoneNumber.cell_phone
  )

  teachers = Teacher.all
  
end

puts "generated #{teachers.count} teachers"