class BookingsController < ApplicationController
  before_action :set_event, only: [:new, :create, :show, :update]
   before_action :set_user
   @seats_available = 0
  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.event = @event
    if check_availability == true
      if @booking.save
        redirect_to event_booking_path(@event, @booking)
      else
        render :new
      end
    else
      flash[:alert] = "Sorry not enough spots left,
        Taking you back to all the events"
      redirect_to events_path(current_user)
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
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
	  @booking.destroy
    flash[:alert] = "Your Reservation to #{@booking.event.name }
      for #{@booking.number_of_people} people has been cancelled!"
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
    @booking.event = @event
    max_p = @booking.event.max_p

    @event.bookings.each do |booking|
      seats_counter += booking.number_of_people
    end
    seats_counter += @booking.number_of_people
    @seats_available = max_p - seats_counter
    @seats_counter = seats_counter
    max_p > seats_counter

  end

end
