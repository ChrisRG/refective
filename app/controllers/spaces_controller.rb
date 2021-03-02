class SpacesController < ApplicationController
  before_action :set_space
  
  def index
    @spaces = Space.all
  end
  
  def show
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end 
end
