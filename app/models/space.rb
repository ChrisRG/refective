class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :space_item_types
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates_presence_of :name, :address, :description, :availability
end
