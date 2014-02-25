class AddItemValueToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_value, :integer
  end
end
