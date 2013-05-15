class EventsController < ApplicationController
  before_filter :find_event, only: [:show, :edit, :update, :destroy]

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

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
