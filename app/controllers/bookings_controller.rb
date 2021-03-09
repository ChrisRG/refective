class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :update]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.space = Space.find(params[:space_id])
    @booking.user = current_user
    @booking.item_type = @booking.item_type
    if @booking.save
      redirect_to dashboard_path, notice: "Booking created!"
    else
      render "spaces/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: "Booking deleted!"
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path, notice: "Booking updated!"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:item_type_id, :item_description, :comment, :date)
  end
end
