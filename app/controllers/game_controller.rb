class GameController < ApplicationController
	before_filter :layout_vars
	
  def scene
		redirect_to battle_scene_path if @logged_data.has_pending_monster?
		@scene_actions = logged_data.scene.scene_action.collect { |sa| [sa.id, sa.name]}
  end

	def battle_scene
		@selected_monster = @logged_data.last_pending_monster.monster
		@battle_actions = @logged_data.npc.battle_action
	rescue
		redirect_to scene_path
	end

	def take_action		
		if encounter?
			scene_monsters = @logged_data.scene.scene_monster
			selected_monster = scene_monsters[rand(scene_monsters.count)]
			MonsterInstance.create(:monster => selected_monster.monster, :hp => selected_monster.monster.npc.hp, :hero => @logged_data)
			redirect_to battle_scene_path
		else
			scene_action = SceneAction.find_by_id(params[:action_id])
			@logged_data.scene = scene_action.callback_scene
			@logged_data.save
			redirect_to scene_path
		end
	end
	
	private
	def encounter?
		rand(100) < @server_config.encounter_rate
	end
end
