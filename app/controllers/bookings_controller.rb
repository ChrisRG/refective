class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update]
  
  def show
    @message = Message.new
    @markers = [{ lat: @booking.space.latitude, lng: @booking.space.longitude}]
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.space = Space.find(params[:space_id])
    @booking.user = current_user
    @booking.item_type = @booking.item_type
    if @booking.save
      msg = Message.new(content: @booking.comment)
      msg.booking = @booking
      msg.user = current_user
      msg.save
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
