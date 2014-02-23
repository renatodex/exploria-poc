class AddNameToServerConfig < ActiveRecord::Migration
  def change
    add_column :server_configs, :name, :string
  end
end
