class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :weight
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
