class RemoveEncounterRateFromServerConfig < ActiveRecord::Migration
  def change
    remove_column :server_configs, :encounter_rate, :integer
  end
end
