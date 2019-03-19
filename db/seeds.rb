require 'factory_bot'
# require '/spec/factories/infos'
# require 'spec/factories/locations'
# require 'spec/factories/saved_searches'
# require 'spec/factories/schedules'
# require 'spec/factories/users'
# require 'spec/factories/yoga_classes'

SavedSearch.delete_all
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
  password: PASSWORD,
  default_country: "Ca"
)
# users + infos
10.times do
  u = FactoryBot.create(:user)
  i = FactoryBot.create(:info, user: u)
end

teachers = User.all

# location
10.times do 
  l = FactoryBot.create(:location)
end

locations = Location.all

# yoga class + schedule
30.times do
  yc = FactoryBot.build(:yoga_class, user: teachers.sample)
  yc.location = locations.sample
  yc.save
  s = FactoryBot.create(:schedule, yoga_class: yc)
end

# saved search
30.times do
  s = FactoryBot.create(:saved_search, user: teachers.sample)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "seeding done"