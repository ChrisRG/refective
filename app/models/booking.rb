class Booking < ApplicationRecord
  belongs_to :item_type
  belongs_to :user
  belongs_to :space
  has_many :messages
  has_one :review

  validates_presence_of :date, :item_description, :comment
end
