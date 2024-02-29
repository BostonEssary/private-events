FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "test1@test.com" }
    password { "password" }
  end
end
