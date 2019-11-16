FactoryBot.define do
  factory :info do
    association(:user, factory: :user)

    spiritual_name { Faker::Space.constellation }
    image_url { Faker::Avatar.image }
    webpage { "www.#{Faker::Internet.domain_name}" }
    introduction { Faker::Lorem.paragraph }
    phone { Faker::PhoneNumber.phone_number }
    public_contact { false }
  end
end
