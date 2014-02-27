class AddAccountToHero < ActiveRecord::Migration
  def change
    add_reference :heros, :account, index: true
  end
end
