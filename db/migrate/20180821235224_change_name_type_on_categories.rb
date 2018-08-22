class ChangeNameTypeOnCategories < ActiveRecord::Migration[5.2]
  def up
    enable_extension "citext"

    change_table :categories do |t|
      t.change :name, :citext
    end

    add_index :categories, :name, unique: true
  end

  def down
    remove_index :categories, :name

    change_table :categories do |t|
      t.change :name, :string
    end
  end
end
