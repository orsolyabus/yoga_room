FactoryBot.define do
  factory :location do
    country { "Canada" }
    city { ["Richmond", "Vancouver", "Surrey", "Coquitlam"].sample }
    address { Faker::Address.street_address }
    studio { Faker::StarTrek.location }
  end
end
