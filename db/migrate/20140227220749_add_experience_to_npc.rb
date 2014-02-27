class AddExperienceToNpc < ActiveRecord::Migration
  def change
    add_column :npcs, :experience, :integer
  end
end
