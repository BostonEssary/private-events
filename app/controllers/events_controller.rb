class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to @event
    else
      render "new", status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
    if @event.creator_id == current_user.id
      render "edit"
    else
      render "access_denied"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.creator_id == current_user.id
      @event.destroy
      redirect_to events_path
    else
      flash.now[:error] = "Can't delete an event you did not create"
      render @event, status: :unprocessable_entity
    end
    
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date_time)
  end
end
