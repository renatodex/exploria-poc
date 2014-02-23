class AddAttributesToNpc < ActiveRecord::Migration
  def change
    add_column :npcs, :strength, :integer
    add_column :npcs, :intelligence, :integer
    add_column :npcs, :agility, :integer
  end
end
