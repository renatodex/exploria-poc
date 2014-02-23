class CreateSceneMonsters < ActiveRecord::Migration
  def change
    create_table :scene_monsters do |t|
      t.references :scene, index: true
      t.references :monster, index: true

      t.timestamps
    end
  end
end
