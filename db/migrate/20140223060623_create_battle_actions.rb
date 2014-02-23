class CreateBattleActions < ActiveRecord::Migration
  def change
    create_table :battle_actions do |t|
      t.references :npc, index: true
      t.string :name
      t.integer :base_attack
      t.integer :base_damage
      t.references :attack_type, index: true
      t.string :image

      t.timestamps
    end
  end
end
