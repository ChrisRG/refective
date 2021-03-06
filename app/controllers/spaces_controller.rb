class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :destroy, :update]

  def index
    @spaces = policy_scope(Space)

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        # image_url: helpers.asset_url()
      }
    end
  end

  def show
    @reviews = @space.reviews
    @booking = Booking.new
    @markers = [{ lat: @space.latitude, lng: @space.longitude}]
  end

  def new
    @space = Space.new
    @item_types = ItemType.all
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    authorize @space
    @space.user = current_user
    params[:space][:item_type_ids].each do |item|
      unless item.empty?
        space_item = SpaceItemType.new
        space_item.item_type = ItemType.find(item)
        space_item.space = @space
        space_item.save
      end
    end
    if @space.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  def update
    if @space.update(space_params)
      redirect_to dashboard_path(tab: "space"), notice: "Space saved"
    else
      redirect_to dashboard_path, alert: "There was a problem modifying your space."
    end
  end

  def destroy
    @space.destroy
    redirect_to dashboard_path, notice: "Space was successfully deleted."
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :description, :availability, :phone_number, :photo)
  end

  def set_space
    @space = Space.find(params[:id])
    authorize @space
  end
end
