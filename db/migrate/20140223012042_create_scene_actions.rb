class CreateSceneActions < ActiveRecord::Migration
  def change
    create_table :scene_actions do |t|
      t.string :name
      t.references :scene, index: true
      t.integer :scene_callback_id

      t.timestamps
    end
  end
end
