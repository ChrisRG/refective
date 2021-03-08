class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.booking = @booking
    @message.save
    respond_to do |format|
      format.js
    end
  end
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
