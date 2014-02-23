class CreateMetaparams < ActiveRecord::Migration
  def change
    create_table :metaparams do |t|
      t.string :name
      t.string :value
      t.references :model, polymorphic: true, index: true

      t.timestamps
    end
  end
end
