class BookingsController < ApplicationController
  before_action :set_event, only: [:new, :create, :show]
  before_action :set_user, only: [:index]
  def index
    @bookings = Booking.all
	end

	def new
		@booking = Booking.new
	end

	def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
		if @booking.save
      redirect_to event_booking_path(@event, @booking)
    else
      render :new
    end
	end

	def edit
  end

	def update
	  @booking
    if @booking.save
      @booking.update(booking_params)
      redirect_to event_bookings_path
    else
      render :edit
    end
  end

	def show
   
  end

	def destroy
    @booking = Booking.find(params[:id])
	  @booking.destroy
    redirect_to events_bookings_path(@booking.event)
  end

	private

  def booking_params
		params.require(:booking).permit(:number_of_people)
	end

  def set_event
    @event = Event.find(params[:event_id])
  end
  
  def set_user
    @user = current_user
  end



end
