class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.workshop = Workshop.find(params[:workshop_id])
    @booking.user = current_user
    if @booking.save
      flash[:success]= "Your spot in the #{@booking.workshop.name} from #{@booking.checkin} to #{@booking.checkout} has been booked"
      redirect_to profile_path(current_user.profile)
    else
      flash[:error] = "An error occured, please try again"
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :application, :accepted)
  end
end
