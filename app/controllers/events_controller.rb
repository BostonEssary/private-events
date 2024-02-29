class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end

  def new
    @event = Event.new
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date_time)
  end
end
