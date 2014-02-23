class GameController < ApplicationController
	before_filter :layout_vars
	
  def scene
		@scene_actions = logged_data.scene.scene_action.collect { |sa| [sa.id, sa.name]}
  end

	def take_action
		if encounter?
			
		else
			scene_action = SceneAction.find_by_id(params[:action_id])
			@logged_data.scene = scene_action.callback_scene
			@logged_data.save
			redirect_to scene_path
		end
	end
	
	private
	def encounter?
		rand(100) > @server_config.encounter_rate
	end
end
