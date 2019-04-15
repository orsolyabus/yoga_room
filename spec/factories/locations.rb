FactoryBot.define do
  factory :location do
    country { ["Ca", "Hu"].sample }
    city { ["Richmond", "Vancouver", "Surrey", "Coquitlam"].sample }
    address { Faker::Address.street_address }
    studio { Faker::TvShows::StarTrek.location }
    association(:created_by, factory: :user)
  end
end
