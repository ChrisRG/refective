class BookingsController < ApplicationController
  before_action :set_space, only: :create

  def create
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    @booking.item_type = ItemType.last
    if @booking.save
      redirect_to @space, notice: "Booking created!"
    else
      render "spaces/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: "Booking updated!"
  end

  private

  def set_space
    @space = Space.find(params[:space_id])
  end

  def booking_params
    params.require(:booking).permit(:item_type_id, :item_description, :comment, :date)
  end
end
