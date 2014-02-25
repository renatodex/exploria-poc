class AddUsableToItem < ActiveRecord::Migration
  def change
    add_column :items, :usable, :boolean
  end
end
