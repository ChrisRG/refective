class Booking < ApplicationRecord
  belongs_to :item_type
  belongs_to :user
  belongs_to :space
  has_many :messages, dependent: :destroy
  has_one :review, dependent: :destroy
  has_one_attached :photo

  validates_presence_of :date, :item_description, :comment
end
