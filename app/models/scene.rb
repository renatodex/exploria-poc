class Scene < ActiveRecord::Base
	has_many :scene_action
	has_many :scene_node
	has_many :scene_monster
	has_many :metaparam, as: :model
end
