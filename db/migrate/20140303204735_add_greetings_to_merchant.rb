class AddGreetingsToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :greetings, :text
  end
end
