class CreateServerConfigs < ActiveRecord::Migration
  def change
    create_table :server_configs do |t|
      t.integer :encounter_rate

      t.timestamps
    end
  end
end
