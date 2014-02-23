class MonsterInstance < ActiveRecord::Base
  belongs_to :monster
	belongs_to :hero
	has_many :metaparam, as: :model
	has_one :npc, through: :monster
	
	def apply_damage(value)
		if self.hp-value < 0
			self.hp = 0
		else
			self.hp -= value
		end
	end
end
