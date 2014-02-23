class CreateMonsterInstances < ActiveRecord::Migration
  def change
    create_table :monster_instances do |t|
      t.references :monster, index: true
      t.integer :hp

      t.timestamps
    end
  end
end
