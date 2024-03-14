class Attendee < ApplicationRecord
    belongs_to :user
    belongs_to :event
    
    before_destroy :check_if_user_is_creator
    validates_uniqueness_of :user_id, :scope => :event_id


    private

    def check_if_user_is_creator
        if user_id == Event.find(event_id).creator.id
            errors.add(:base, "You can not leave an event you created, try deleting the event instead")
            throw :abort
        end
    end
end