class RenameItemActionTable < ActiveRecord::Migration
  def self.up
      rename_table :item_actions, :item_action_types
  end 
  def self.down
      rename_table :item_action_types, :item_actions
  end
end
