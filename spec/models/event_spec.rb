require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Validations" do
    let!(:new_user) {create(:user)}
    subject {Event.create(title: "Block Party", 
    location: "The Block", 
    event_date_time: Time.new(2024, 3, 13, 13, 30),
    creator_id: new_user.id
   )}

    it "is valid with correct params" do
      expect(subject).to be_valid
    end

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

    it "is invalid if the there is no creator id" do
      subject.creator_id = nil
      expect(subject).not_to be_valid
    end

    it "has a creator name of John" do
      expect(subject.creator.first_name).to eq("John")
    end
  end
end
