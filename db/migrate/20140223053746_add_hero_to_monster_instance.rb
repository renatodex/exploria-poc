class AddHeroToMonsterInstance < ActiveRecord::Migration
  def change
    add_reference :monster_instances, :hero, index: true
  end
end
