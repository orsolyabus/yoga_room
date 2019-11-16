FactoryBot.define do
  factory :yoga_class do
    title { "#{['Kundalini', 'Hatha', 'Yengar', 'Ashtanga', 'Prenatal'].sample} yoga for #{['beginner', 'intermediate', 'advanced'].sample} students" }
    description {Faker::Lorem.paragraph}
    association(:profile, factory: :profile)
    association(:location, factory: :location)
  end
end
