class Hero < ActiveRecord::Base
  belongs_to :npc
	belongs_to :scene
	
	has_many :metaparam, as: :model
	has_many :monster_instance
	
	def last_pending_monster
		self.monster_instance.where("killed_at IS NULL").first
	end
	
	def has_pending_monster?
		self.monster_instance.count > 0 && self.monster_instance.first.try(:killed_at) == nil
	end
	
	def physical_modifier
		self.npc.level + Modifier.calculate(self.strength)
	end
	
	def magical_modifier
		self.npc.level + Modifier.calculate(self.intelligence)
	end
end
