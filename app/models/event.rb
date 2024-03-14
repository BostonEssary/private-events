class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendees, dependent: :delete_all
    has_many :attenders, :through => :attendees, :source => "user", dependent: :destroy
    
    validates :title, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :event_date_time, presence: true
    validate :event_date_time_cannot_be_in_past

    scope :past, -> { where("event_date_time < ?", Time.now)}
    scope :future, -> { where("event_date_time > ?", Time.now)}
    

    after_create :add_creator_to_attenders


    
    private

    def event_date_time_cannot_be_in_past
        if event_date_time.present? and event_date_time < Time.now
            errors.add(:event_date_time, "Event can not be in the past")
        end
    end

    def add_creator_to_attenders
        Attendee.create(user_id: creator.id, event_id: id)
    end
end
