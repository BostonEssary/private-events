FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "test@test.com" }
    password { "password" }
  end
end
