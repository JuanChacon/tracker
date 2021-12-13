FactoryBot.define do
  factory :project do
    name {Faker::Lorem.word} 
    deleted false
  end
end