class EventsController < ApplicationController
 before_action :find_event, only: [:show, :edit, :destroy]
 skip_before_action :authenticate_user!, only: [:index, :show]
  def home
        @events1 = Event.all
        @events = @events1.first(3)
  end

  def index
    # bookings = Booking.all
    # @events = Event.all
    # @events.each do |event|
    #   event.available = true
    # end
    # counter = 0
    # @available_events = []
    # @events.each do |e|
    #   counter = 0
    #   bookings.each do |b|
    #     if e.id == b.event_id
    #       counter += b.number_of_people
    #     end
    #   end
    #   if counter >= e.max_p
    #     e.available = false
    #     @available_events << e
    #   end
    # end
    #   @events = @available_events
    #   raise

      if params[:date].present?
        @events = Event.where(date: params[:date])
        events_marker = @events.where.not(latitude: nil, longitude: nil)
        @markers = events_marker.map do |event|
          {
            lat: event.latitude,
            lng: event.longitude,
          }
        end
      else
        # @events = @events
        @events = Event.all
        events_marker = Event.where.not(latitude: nil, longitude: nil)
        @markers = events_marker.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
        }
        end
      end
    end


def show
  @user = User.find(current_user.id)
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
  params.require(:event).permit(:name, :address, :date, :time, :min_p, :max_p, :description, :photo)
end

end
