FactoryBot.define do
    factory :event do
      title { "Test Title" }
      location { "Test Location" }
      description { "This is the test description" }
      event_date_time { Time.now.tomorrow }
      creator_id { nil }
    end
  end
  