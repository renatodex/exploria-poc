class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.integer :hp
      t.integer :level
      t.string :name
      t.string :image
      t.integer :fortitude
      t.integer :class_armor
      t.integer :will
      t.integer :reflex

      t.timestamps
    end
  end
end
