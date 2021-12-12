FactoryBot.define do
  factory :task do
    name { "MyString" }
    elapsed_time { 1 }
    running { "" }
    start_time { 1 }
    deleted { false }
  end
end
