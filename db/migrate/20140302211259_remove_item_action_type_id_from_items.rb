class RemoveItemActionTypeIdFromItems < ActiveRecord::Migration
  def change
		remove_column :items, :item_action_type_id, :integer
  end
end
