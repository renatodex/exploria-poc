class AddEquipableToItem < ActiveRecord::Migration
  def change
    add_column :items, :equipable, :boolean
  end
end
