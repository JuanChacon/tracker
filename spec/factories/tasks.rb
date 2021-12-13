FactoryBot.define do
  factory :task do
    name {Faker::Lorem.word} 
    elapsed_time 1
    running false
    start_time 1
    deleted false
    project_id nil
  end
end
