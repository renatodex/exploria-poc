class CreateSceneNodes < ActiveRecord::Migration
  def change
    create_table :scene_nodes do |t|
      t.references :scene, index: true
      t.integer :neighbor_scene_id

      t.timestamps
    end
  end
end
