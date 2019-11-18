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
Profile.delete_all

User.delete_all
AdminUser.delete_all if Rails.env.development?

PASSWORD = "secret"

super_user = User.create(
  name: "Orsi",
  email: "orsidoestest@gmail.com",
  is_teacher: true,
  password: PASSWORD,
  default_country: "Ca"
)
# users + profiles
10.times do
  u = FactoryBot.create(:user)
  profile = FactoryBot.create(:profile, user: u)
  n = [0,1,2,3,4].sample
  n.times do
    FactoryBot.create(:location, profile: profile)
  end
end
puts "users and profiles and locations seeded"

teachers = Profile.all

# yoga class + schedule
40.times do
  t = teachers.sample
  yc = FactoryBot.build(:yoga_class, profile: t)
  yc.location = t.locations.sample
  yc.save
  s = FactoryBot.create(:schedule, yoga_class: yc)
end
puts "yoga classes seeded"

# saved search
30.times do
  s = FactoryBot.create(:saved_search, user: User.all.sample)
end

AdminUser.create!(email: 'admin@example.com', password: PASSWORD, password_confirmation: PASSWORD) if Rails.env.development?

puts "seeding done"