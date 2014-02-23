class RemoveAttributesFromHero < ActiveRecord::Migration
  def change
    remove_column :heros, :strength, :integer
    remove_column :heros, :intelligence, :integer
    remove_column :heros, :agility, :integer
  end
end
