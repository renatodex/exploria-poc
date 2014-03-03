class RenameItemTypeColumnFromItem < ActiveRecord::Migration
  def self.up
    rename_column :items, :item_type_id, :item_action_type_id
  end

  def self.down
    rename_column :items, :item_action_type_id, :item_type_id
  end
end
