class RenameItemTypeTable < ActiveRecord::Migration
  def self.up
      rename_table :item_types, :item_actions
  end 
  def self.down
      rename_table :item_actions, :item_types
  end
end
