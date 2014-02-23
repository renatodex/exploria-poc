class SceneAction < ActiveRecord::Base
  belongs_to :scene
	belongs_to :callback_scene, :foreign_key => "scene_callback_id", :class_name => "Scene"
	has_many :metaparam, as: :model
end
