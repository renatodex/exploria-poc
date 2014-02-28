class Hero < ActiveRecord::Base
  belongs_to :npc
	belongs_to :scene
	belongs_to :account
	
	has_many :metaparam, as: :model
	has_many :monster_instance
	has_many :hero_item
	has_many :item, through: :hero_item
	
	
	def last_pending_monster
		self.monster_instance.where("killed_at IS NULL").first
	end
	
	def has_pending_monster?
		self.monster_instance.count > 0 && self.monster_instance.where("killed_at IS NULL").count > 0
	end
	
	def apply_damage(value)
		if self.hp-value < 0
			self.hp = 0
		else
			self.hp -= value
		end
	end
	
	def hp_percentage
		(self.hp*100)/self.npc.hp
	end
	
	def hp_urgency
		if self.hp_percentage.between?(80,100)
			'good'
		elsif self.hp_percentage.between?(40,79)
			'average'
		elsif self.hp_percentage.between?(0,39)
			'critical'
		end
	end
	
	def items
		self.hero_item.where(used_at:nil)
	end
	
	def heal(hp)
		max_hp = self.npc.hp
		actual_hp = self.hp
		
		if actual_hp+hp > max_hp
			self.hp = max_hp
		else
			self.hp = actual_hp+hp
		end
	end
	
	def full_heal
		self.heal(self.npc.hp)
	end
	
	def level_up
		self.npc.level += 1
		self.npc.hp = self.npc.max_hp
		self.full_heal
		self.npc.save
	end
	
	def receive_xp(value)
		Rails.logger.info "[hero experience] the Hero #{self.npc.name} is receiving #{value}XP!!"
		exp = Experience.find_by_level(self.npc.level)
		
		if self.experience+value >= exp.value
			self.experience = 0
			self.level_up
		else
			self.experience += value
		end
		
		self.save
	end
end
