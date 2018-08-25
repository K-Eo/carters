class AddDiscountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :discount, :integer, null: false, default: 0
  end
end
