class GameController < ApplicationController
	before_filter :layout_vars
	
  def scene
		redirect_to battle_scene_path if @logged_data.has_pending_monster?
		@scene_actions = logged_data.scene.scene_action.collect { |sa| [sa.id, sa.name]}
  end

	def battle_scene
		if @logged_data.has_pending_monster?
			@selected_monster = @logged_data.last_pending_monster
			@battle_actions = @logged_data.npc.battle_action
		else
			redirect_to scene_path
		end
	rescue
		redirect_to scene_path
	end
	
	def battle_victory
		redirect_to scene_path
	end
	
	def battle_gameover
	end
	
	def battle_physical_attack
		if @logged_data.has_pending_monster?
			monster_instance = @logged_data.last_pending_monster
			proccess_attack(@logged_data, monster_instance)
			proccess_attack(monster_instance, @logged_data)
		
			if @logged_data.hp == 0
				redirect_to battle_gameover_path
			elsif monster_instance.hp == 0
				redirect_to battle_victory_path
			else
				redirect_to battle_scene_path
			end
		else
			redirect_to scene_path
		end
	end
	
	def battle_run
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
		Dice.d100 < @server_config.encounter_rate
	end
	
	def proccess_attack(source, target)
		attack_result = Dice.d20 + source.npc.physical_modifier
		if attack_result > target.npc.class_armor
			attack_damage = Dice.d6 + source.npc.physical_modifier		
			
			target.apply_damage(attack_damage)
			target.save
						
			Rails.logger.info "[battle] #{source.npc.name} acertou um ataque fisico contra #{target.npc.name} e causou #{attack_damage} de dano!!"
		else
			Rails.logger.info "[battle] #{source.npc.name} errou um ataque contra #{target.npc.name}"
		end
	end
end
