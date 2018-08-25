class AddPrecisionScalePriceToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :price, :decimal, precision: 15, scale: 2, null: false, default: 0.0
  end

  def down
    change_column :items, :price, :decimal, null: true, default: nil
  end
end
