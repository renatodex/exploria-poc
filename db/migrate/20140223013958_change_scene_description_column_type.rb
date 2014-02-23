class ChangeSceneDescriptionColumnType < ActiveRecord::Migration
  def change
		change_table :scenes do |t|
		  t.change :description, :text
		end
  end
end
