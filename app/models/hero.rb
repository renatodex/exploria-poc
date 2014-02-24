class Hero < ActiveRecord::Base
  belongs_to :npc
	belongs_to :scene
	
	has_many :metaparam, as: :model
	has_many :monster_instance
	
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
end
