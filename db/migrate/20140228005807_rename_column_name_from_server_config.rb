class RenameColumnNameFromServerConfig < ActiveRecord::Migration
  def self.up
    rename_column :server_configs, :name, :server
  end

  def self.down
    rename_column :server_configs, :server, :name
  end
end