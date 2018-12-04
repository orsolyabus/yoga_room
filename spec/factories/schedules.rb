FactoryBot.define do
  factory :schedule do
    duration {[45, 60, 90, 120].sample}
    start { Faker::Time.forward(23, :afternoon)}
    class_type { "regular"}
    association(:yoga_class, factory: :yoga_class)
  end
end
