class CreateHeroItems < ActiveRecord::Migration
  def change
    create_table :hero_items do |t|
      t.references :hero, index: true
      t.references :item, index: true
      t.integer :quantity
      t.datetime :used_at
      t.boolean :equiped

      t.timestamps
    end
  end
end
