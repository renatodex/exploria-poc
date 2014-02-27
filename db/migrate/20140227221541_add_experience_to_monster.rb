class AddExperienceToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :experience, :integer
  end
end
