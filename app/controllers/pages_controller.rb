class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_brain, only: %i[dashboard]
  before_action :set_booking, only: %i[dashboard]

  def home; end

  def dashboard
    @user = current_user
  end

  private

  def set_brain
    @brains = Brain.where(user_id: current_user)
  end

  def set_booking
    @bookings = Booking.where(user_id: current_user)
  end
end
