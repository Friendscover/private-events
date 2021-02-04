class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.creator_id = session[:user_id]

    if @event.save
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :description)
  end
end
