class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attendees
  has_many :attended_events, :through => :attendees, :source => "event"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  def created_events_count
    return Event.where("creator_id = ?", self.id).size
  end



end
