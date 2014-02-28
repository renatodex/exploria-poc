class AddKeyValueToServerConfig < ActiveRecord::Migration
  def change
    add_column :server_configs, :key, :string
    add_column :server_configs, :value, :integer
  end
end
