class Scene < ActiveRecord::Base
	has_many :scene_action
	has_many :scene_node
end
