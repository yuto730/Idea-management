FactoryBot.define do
  factory :category do
    name {Faker::Name.initials(number: 2)}
  end
end
