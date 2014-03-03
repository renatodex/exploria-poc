class AddDefaultValueToEquipedColumnFromHeroItem < ActiveRecord::Migration
  def change
		change_column :hero_items, :equiped, :boolean, default: false
  end
end
