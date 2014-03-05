class GameController < ApplicationController
	before_filter :layout_vars
	
  def scene
		redirect_to battle_scene_path if @logged_data.has_pending_monster?
		@scene_actions = logged_data.scene.scene_action.collect { |sa| [sa.id, sa.name]}
		@max_xp_for_level = Experience.find_by_level(@logged_data.npc.level).value
		@merchants = logged_data.scene.merchant
  end

	def unequip_item
		hero_item = HeroItem.find_by_id(params[:hero_item_id])
		hero_item.unequip_item
		
		redirect_to scene_path
	end

	def use_item
		hero_item = HeroItem.find_by_id(params[:hero_item_id])
		if hero_item.item.usable
			hero_item.use_item
		else
			hero_item.equip_item
		end
		
		redirect_to scene_path
	end

	def battle_scene
		if @logged_data.has_pending_monster?
			@selected_monster = @logged_data.last_pending_monster
			@battle_actions = @logged_data.npc.battle_action
			@max_xp_for_level = Experience.find_by_level(@logged_data.npc.level).value
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
				@logged_data.receive_xp(monster_instance.monster.experience)
				monster_instance.calculate_loot
				@logged_data.receive_gigs(monster_instance.npc.money)
				@logged_data.save
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
			if scene_monsters.count > 0
				selected_monster = scene_monsters[rand(scene_monsters.count)]
				MonsterInstance.create(:monster => selected_monster.monster, :hp => selected_monster.monster.npc.hp, :hero => @logged_data)
				redirect_to battle_scene_path
			else
				redirect_to scene_path
			end
		else
			scene_action = SceneAction.find_by_id(params[:action_id])
			@logged_data.scene = scene_action.callback_scene
			@logged_data.save
			redirect_to scene_path
		end
	end
	
	private
	def encounter?
		Dice.d100 < @encounter_rate
	end
	
	def proccess_attack(source, target)
		attack_result = Dice.d20 + source.attack_modifier
		if attack_result > target.class_armor
			attack_damage = Dice.d6 + source.npc.physical_modifier		
			
			target.apply_damage(attack_damage)
			target.save
						
			Rails.logger.info "[battle] #{source.npc.name} acertou um ataque fisico contra #{target.npc.name} e causou #{attack_damage} de dano!!"
		else
			Rails.logger.info "[battle] #{source.npc.name} errou um ataque contra #{target.npc.name}"
		end
	end
end
