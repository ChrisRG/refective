class SpacesController < ApplicationController
  before_action :set_space
  
  def show
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end
end
