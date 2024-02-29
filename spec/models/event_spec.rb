require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    subject {Event.new(title: "Block Party", 
    location: "The Block", 
    event_date_time: Time.new(2024, 3, 13, 13, 30)
   )}

    it "is invalid with no title" do
      subject.title = nil
      expect(subject).not_to be_valid
    end
  
    it "is invalid with no location" do
      subject.location = nil
      expect(subject).not_to be_valid
    end

    it "is invalid with no Date and Time" do
      subject.event_date_time = nil
      expect(subject).not_to be_valid
    end

    it "is invalid if the Event Date is in the past" do
      subject.event_date_time = Time.new(2024, 2, 28, 13, 30)
      expect(subject).not_to be_valid
    end
  end
end
