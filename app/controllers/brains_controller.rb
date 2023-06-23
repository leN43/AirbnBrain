class BrainsController < ApplicationController
  before_action :set_brain, except: %i[new create index]
  before_action :set_user
  before_action :set_booking, only: %i[show]
  before_action :booking_date, only: %i[show]
  before_action :booking_main, only: %i[show]
  after_action :booking_main, only: %i[create]

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
    params.require(:brain).permit(:name, :description, :price, :user_id, :category)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_booking
    Booking.where(brain_id: @brain.id).nil? ? @list_booking = [] : @list_booking = Booking.where(brain_id: @brain.id)
    @size_booking = Booking.where(brain_id: @brain.id).size
  end

  def set_list_booking
    @list_booking = Booking.where(brain_id: @brain.id)
    @list_booking = @list_booking.first if @list_booking.size == 1
    @list_booking
  end

  def booking_date
    @booking_date = []
    @list_booking = set_list_booking
    if @size_booking > 1
      @list_booking.each do |booking|
        (booking.start_date..booking.end_date).to_a.each do |date|
          @booking_date << date
        end
      end
    elsif @size_booking == 1
      @booking_date << (@list_booking.start_date..@list_booking.end_date).to_a
    end
  end

  def booking_main
    @booking_info = {}
    if @size_booking == 1
      @booking_info[@list_booking.id] = booking_info(@list_booking)
      @booking_info[@list_booking.id][:user] = user_info(@list_booking.user) if current_user.id != @brain.user_id
    elsif @size_booking > 1
      @list_booking.each do |booking|
        @booking_info[booking.id] = booking_info(booking)
        user = User.find(booking.user_id)
        @booking_info[booking.id][:user] = user_info(user) if current_user.id != @brain.user_id
      end
    end
    @booking_info
  end

  def booking_info(booking)
    {
      start_date: booking.start_date,
      end_date: booking.end_date,
      status: booking.status
    }
  end

  def user_info(user)
    {
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    }
  end
end
