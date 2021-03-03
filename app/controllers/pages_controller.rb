class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @spaces = current_user.spaces
  end
end
