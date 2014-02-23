class AddKilledAtToMonsterInstance < ActiveRecord::Migration
  def change
    add_column :monster_instances, :killed_at, :datetime
  end
end
