class SpaceItemType < ApplicationRecord
  belongs_to :item_type
  belongs_to :space
end
