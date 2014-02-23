class AddHpToHero < ActiveRecord::Migration
  def change
    add_column :heros, :hp, :integer
  end
end
