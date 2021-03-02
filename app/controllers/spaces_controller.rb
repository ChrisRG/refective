class SpacesController < ApplicationController
  before_action :set_space, only: :show
  
  def index
    @spaces = Space.all
  end
  
  def show
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    @space.item_type = ItemType.all.last
    if @space.save
      redirect_to space_path(@space)
    else
      render 'new'
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :description, :availability, :phone_number)
  end

  def set_space
    @space = Space.find(params[:id])
  end 
end
