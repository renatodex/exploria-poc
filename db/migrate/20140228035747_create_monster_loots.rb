class CreateMonsterLoots < ActiveRecord::Migration
  def change
    create_table :monster_loots do |t|
      t.references :monster, index: true
      t.references :item, index: true
      t.float :rate

      t.timestamps
    end
  end
end
