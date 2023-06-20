class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy show]
  before_action :set_user

  def index
    @bookings = Booking.all
  end

  def new
    @brain = Brain.find(params[:brain_id])
    @booking = Booking.new
  end

  def show; end

  def create
    params[:booking][:user_id] = current_user.id
    params[:booking][:brain_id] = @brain.id
    @booking = Booking.new(booking_params)
    @booking.brain = @brain
    if @booking.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to brain_path(@booking.brain), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :brain_id, :start_date, :end_date)
  end

  def set_user
    @user = current_user
  end
end
