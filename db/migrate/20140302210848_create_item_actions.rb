class CreateItemActions < ActiveRecord::Migration
  def change
    create_table :item_actions do |t|
      t.references :item, index: true
      t.references :item_action_type, index: true
      t.integer :value

      t.timestamps
    end
  end
end
