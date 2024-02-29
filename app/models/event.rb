class Event < ApplicationRecord
    validates :title, presence: true
    validates :location, presence: true
    validates :event_date_time, presence: true

    private

    def event_date_time_cannot_be_in_past
        if event_date_time < Time.now
            errors.add(:event_date_time, "Event can not be in the past")
        end
    end
end
