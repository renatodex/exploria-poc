class HeroItem < ActiveRecord::Base
  belongs_to :hero
  belongs_to :item
	#has_many :item_action, through: :item

	def unequip_item
		self.equiped = false
		self.save
	end

	def equip_item
		self.equiped = true
		self.save
	end

	def use_item		
		self.item.item_action.each do |ia|
			send(build_effect_method(ia.item_action_type.name), ia.value)
		end
		
		self.used_at = Time.now
		self.save
	end
	
	def build_effect_method(action_name)
		"effect_#{action_name}".to_sym
	end
	
	def effect_healing_potion(value)
		self.hero.heal(value)
		self.hero.save
	end
end
