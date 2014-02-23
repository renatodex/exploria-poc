class SceneNode < ActiveRecord::Base
  belongs_to :scene
	has_many :metaparam, as: :model
end
