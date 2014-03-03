class RemoveItemValueFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :item_value, :integer
  end
end
