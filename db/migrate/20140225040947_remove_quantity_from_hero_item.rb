class RemoveQuantityFromHeroItem < ActiveRecord::Migration
  def change
    remove_column :hero_items, :quantity, :integer
  end
end
