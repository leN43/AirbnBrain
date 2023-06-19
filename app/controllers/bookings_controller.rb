class BookingsController < ApplicationController
  before_action :set_destroy, only: [:destroy]
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.brain = @brain
    if @booking.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @bookig.destroy
    redircte_to brains_path, status: :see_other
  end

  private

  def set_booking
    @booking = Bookng.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:brain_id, :user_id)
  end
end
