class BrainsController < ApplicationController
  before_action :set_brain, except: %i[new create index]
  before_action :set_user
  before_action :set_booking, only: %i[show]
  before_action :booking_date, only: %i[show]

  def new
    @brain = Brain.new
  end

  def create
    params[:brain][:user_id] = current_user.id
    @brain = Brain.new(brain_params)
    if @brain.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @brains = Brain.all
  end

  def show
    @booking = Booking.new
  end

  def edit; end

  def update
    @brain.update(brain_params)
    redirect_to brain_path(@brain)
  end

  def destroy
    @brain.destroy
    redirect_to brains_path, status: :see_other
  end

  private

  def brain_params
    params.require(:brain).permit(:name, :description, :price, :user_id)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_booking
    @list_booking = Booking.find_by(brain_id: @brain.id)
    @size_booking = Booking.where(brain_id: @brain.id, user_id: @user.id).size
  end

  def booking_date
    @booking_date = []
    if Booking.where(brain_id: @brain.id).size == 1
      @booking_date += (@list_booking.start_date..@list_booking.end_date).to_a
      @list_booking.each do |booking|
        @booking_date += (booking.start_date..booking.end_date).to_a
      end
      @booking_date.flatten!
    end
    @booking_date unless @booking_date.empty?
  end
end
