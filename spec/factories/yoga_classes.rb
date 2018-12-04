FactoryBot.define do
  factory :yoga_class do
    title { "#{['Kundalini', 'Hatha', 'Yengar', 'Ashtanga', 'Prenatal'].sample} yoga for #{['beginner', 'intermediate', 'advanced'].sample} students" }
    description {Faker::Lorem.paragraph(15)}
    association(:user, factory: :user)
    association(:location, factory: :location)
  end
end
