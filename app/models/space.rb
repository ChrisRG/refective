class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :space_item_types, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates_presence_of :name, :address, :description, :availability
end
