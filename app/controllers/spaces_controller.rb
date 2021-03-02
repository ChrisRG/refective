class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end
end
