class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.references :npc, index: true
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :experience

      t.timestamps
    end
  end
end
