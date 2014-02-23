class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.references :npc, index: true

      t.timestamps
    end
  end
end
