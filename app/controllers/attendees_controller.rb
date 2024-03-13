class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(user_id: current_user.id, event_id: params[:event_id]) 
    if @attendee.save
      redirect_to events_path
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @event = Event.find(@attendee.event_id)
    if @attendee.destroy
      redirect_to events_path
    elsif @event.creator.id == current_user.id
      flash[:error] = "Unable to leave an event you are the creator of. Try deleting the event instead"
      redirect_to @event
    else
      flash[:error] = "Oops, all errors! Try again"
      redirect_to events_path
    end
  end
  
end
