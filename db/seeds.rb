Info.delete_all
Schedule.delete_all
YogaClass.delete_all
Location.delete_all


User.delete_all

PASSWORD = "secret"

super_user = User.create(
  name: "Orsi",
  email: "orsidoestest@gmail.com",
  is_teacher: true,
  password: PASSWORD
  # admin: true
)
# users + infos
10.times do
  name = Faker::Name.first_name
  t = User.create(
    name: name,
    email: "#{name.downcase}.teacher@example.com",
    is_teacher: true,
    password: PASSWORD
  )
  spiritual_name = Faker::Artist.name
  introduction = Faker::Lorem.paragraph(2)
  phone = Faker::PhoneNumber.phone_number
  webpage = "www.#{spiritual_name}.com"

  info = Info.create(
    user_id: t.id,
    spiritual_name: spiritual_name,
    webpage: webpage,
    introduction: introduction,
    phone: phone,
    public_contact: true
  )

end

teachers = User.all

# 5.times do
#   name = Faker::Dota.hero
#   s = User.create(
#     name: name,
#     email: "#{name.downcase}.student@example.com",
#     password: PASSWORD
#   )
# end

# location
10.times do 
  city = Faker::Address.city
  address = Faker::Address.street_address
  studio = Faker::LordOfTheRings.location
  country = Faker::Address.country

  l = Location.create(
    country: country,
    city: city,
    address: address,
    studio: studio
  )
end

locations = Location.all
classtypes = ["regular", "course", "workshop"]

# yoga class + schedule
30.times do
  title = Faker::WorldOfWarcraft.quote
  description = Faker::Lorem.paragraph(3)
  location = locations.sample
  teacher = teachers.sample
  yc =YogaClass.create(
    title: title,
    description: description,
    user_id: teacher.id,
    location_id: location.id
  )
  s = Schedule.create(
    yoga_class_id: yc.id ,
    class_type: classtypes.sample,
    duration: 60,
    start: Faker::Time.forward(23, :all),
    end: Faker::Time.forward(100, :all)
  )

end

puts "seeding done"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?