class CreateMerchantItems < ActiveRecord::Migration
  def change
    create_table :merchant_items do |t|
      t.references :merchant, index: true
      t.references :item, index: true
      t.integer :price

      t.timestamps
    end
  end
end
