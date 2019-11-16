FactoryBot.define do
  factory :profile do
    association(:user, factory: :user)

    name { Faker::Space.constellation }
    image_url { Faker::Avatar.image }
    web { "www.#{Faker::Internet.domain_name}" }
    intro { Faker::Lorem.paragraph }
    phone { Faker::PhoneNumber.phone_number }
    sequence(:contact) { |n| Faker::Internet.email.sub('@', "#{n}@") }
    public_contact { [true, false].sample}
    is_teacher { true }
  end
end
