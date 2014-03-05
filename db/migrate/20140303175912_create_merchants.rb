class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.references :npc, index: true
      t.references :scene, index: true

      t.timestamps
    end
  end
end
