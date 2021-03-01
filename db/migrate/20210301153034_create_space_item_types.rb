class CreateSpaceItemTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :space_item_types do |t|
      t.text :comment
      t.references :item_type, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
