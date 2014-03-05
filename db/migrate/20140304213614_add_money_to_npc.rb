class AddMoneyToNpc < ActiveRecord::Migration
  def change
    add_column :npcs, :money, :float
  end
end
