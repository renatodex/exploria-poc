class HeroItem < ActiveRecord::Base
  belongs_to :hero
  belongs_to :item

	def use_item
		effect = self.item.item_type.name
		
		if effect == 'healing_potion'
			effect_healing_potion
			self.used_at = Time.now
		end
		
		self.save
	end
	
	def effect_healing_potion
		self.hero.heal(self.item.item_value)
		self.hero.save
	end
end
