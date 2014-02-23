class CreateAttackTypes < ActiveRecord::Migration
  def change
    create_table :attack_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
