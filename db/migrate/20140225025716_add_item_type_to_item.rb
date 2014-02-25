class AddItemTypeToItem < ActiveRecord::Migration
  def change
    add_reference :items, :item_type, index: true
  end
end
