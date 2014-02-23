class SceneMonster < ActiveRecord::Base
  belongs_to :scene
  belongs_to :monster
end
