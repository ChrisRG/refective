class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :destroy, :update]
  
  def index
    @spaces = Space.all

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude
      }
    end
  end
  
  def show
    @booking = Booking.new
    @markers = [{ lat: @space.latitude, lng: @space.longitude}]
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    # TODO: Add Item Type field to form: f.association :item_Type
    space_item = SpaceItemType.new
    space_item.item_type = ItemType.last
    space_item.space = @space
    space_item.save
    if @space.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  def update
    @space.update(space_params)
    redirect_to dashboard_path, notice: "Space saved"
  end

  def destroy
    @space.destroy
    redirect_to dashboard_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :description, :availability, :phone_number)
  end

  def set_space
    @space = Space.find(params[:id])
  end 
end
