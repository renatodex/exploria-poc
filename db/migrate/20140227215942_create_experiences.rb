class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :level
      t.integer :value

      t.timestamps
    end
  end
end
