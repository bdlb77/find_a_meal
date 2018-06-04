class EventsController < ApplicationController
 before_action :find_event, only: [:show, :edit, :destroy]

  def index
    @events = Event.all
  end

  def show
  end


  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
     if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
     if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

   def destroy
    @event.destroy
    redirect_to events_path
  end

private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :date, :time, :min_p, :max_p, :description, :photo)
  end

end
