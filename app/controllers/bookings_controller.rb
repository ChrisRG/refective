class BookingsController < ApplicationController
  before_action :set_space, only: :create

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    @booking.item_type = ItemType.last
    if @booking.save
      redirect_to @space
    else
      render "spaces/show"
    end
  end

  private

  def set_space
    @space = Space.find(params[:space_id])
  end

  def booking_params
    params.require(:booking).permit(:item_description, :comment, :date)
  end
end
