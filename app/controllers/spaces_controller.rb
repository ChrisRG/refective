class SpacesController < ApplicationController
  before_action :set_space, only: :show
  
  def index
    @spaces = Space.all
  end
  
  def show
    @booking = Booking.new
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end 
end
