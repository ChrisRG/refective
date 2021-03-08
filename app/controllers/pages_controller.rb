class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @item_types = ItemType.all
  end

  def dashboard
    @bookings = current_user.bookings
    @spaces = current_user.spaces
    @message = Message.new
  end
end
