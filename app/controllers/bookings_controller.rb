class BookingsController < ApplicationController
  before_action :set_event, only: [:new, :create, :show]
  # before_action :set_user, only: [:index]
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
    check_availability
    if check_availability == true
      if @booking.save
        redirect_to event_booking_path(@event, @booking)
      else
        render :new
      end
    else
      flash[:alert] = "All booked up! sorry! \n 
        Taking you back to your bookings. "
      redirect_to user_bookings_path(current_user)
    end
  end

  def edit
  end

  def update
    @booking    
    if @booking.save
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
    redirect_to user_bookings_path(current_user)
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

  def check_availability
    seats_counter = 0
    @bookings = Booking.all
    
    @booking.event = @event
    max_p = @booking.event.max_p
    
    @bookings.each do |booking|
      seats_counter += booking.number_of_people
    end

    availability = max_p > seats_counter ? true : false   
  end



end
