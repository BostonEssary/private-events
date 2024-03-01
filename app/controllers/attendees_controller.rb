class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(user_id: current_user.id, event_id: params[:event_id]) 
    if @attendee.save
      redirect_to events_path
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    redirect_to events_path
  end
  
end
