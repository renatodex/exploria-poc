class AddSceneToHero < ActiveRecord::Migration
  def change
    add_reference :heros, :scene, index: true
  end
end
