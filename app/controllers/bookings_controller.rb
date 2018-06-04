class BookingsController < ApplicationController
	def index
		@bookings = Booking.all
	end

	def new
		@booking = Booking.new
	end

	def create
    Booking.new(booking_params)
		if @booking.save
      redirect_to booking_path(@booking)
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
      redirect_to bookings_path
    else
      render :edit
    end
  end

	def show
  end

	def delete
	  @booking.destroy
    redirect_to bookings_path
  end

	private

	def booking_params
		@booking = params.require(:booking).permit(:event, :user)
	end
	
	def set_booking
   	@booking = Bookking.find(params[:id])
 	end
end
