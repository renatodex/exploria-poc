class RemoveDefenseAttributesFromNpc < ActiveRecord::Migration
  def change
    remove_column :npcs, :fortitude, :integer
    remove_column :npcs, :class_armor, :integer
    remove_column :npcs, :reflex, :integer
    remove_column :npcs, :will, :integer
  end
end
