class MonsterInstance < ActiveRecord::Base
  belongs_to :monster
	belongs_to :hero
	has_many :metaparam, as: :model
	has_one :npc, through: :monster
	has_many :monster_loot, through: :monster
	
	def attack_modifier
		self.npc.physical_modifier
	end
	
	def class_armor
		self.npc.fortitude
	end
	
	def apply_damage(value)
		if self.hp-value <= 0
			self.hp = 0
			self.killed_at = Time.now
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
	
	def calculate_loot		
		self.monster_loot.each do |loot|
			dice = Dice.d100f
			if dice < loot.rate
				Rails.logger.info "[hero loot] The hero [#{self.hero.npc.name}] dropped [#{loot.item.name}]"
				self.hero.item << loot.item
			else
				Rails.logger.info "[hero loot] The hero [#{self.hero.npc.name}] test for [#{loot.item.name}] has failed (#{dice}) "
			end
		end
	end
end
