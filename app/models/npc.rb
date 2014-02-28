class Npc < ActiveRecord::Base
	has_many :hero
	has_many :monster
	has_many :metaparam, as: :model
	has_many :battle_action
	
	def fortitude
		10 + self.level + Modifier.calculate(self.strength)
	end
	
	def will
		10 + self.level + Modifier.calculate(self.intelligence)
	end
	
	def reflex
		10 + self.level + Modifier.calculate(self.agility)
	end
	
	def class_armor
		fortitude
	end	
	
	def physical_modifier
		self.level + Modifier.calculate(self.strength)
	end
	
	def magical_modifier
		self.level + Modifier.calculate(self.intelligence)
	end
	
	def max_hp
		(self.level-1)*4 + 30
	end
end
