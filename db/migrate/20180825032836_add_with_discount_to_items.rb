class AddWithDiscountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :with_discount, :boolean, null: false, default: false
  end
end
