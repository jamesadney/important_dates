class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Event has been created."
      redirect_to(@event)
    end
  end

  def show
  end
end
