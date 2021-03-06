class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :space_item_types, dependent: :destroy
  has_many :item_types, -> { distinct }, through: :space_item_types
  has_many :reviews, -> { distinct }, through: :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates_presence_of :name, :address, :description, :availability
end
