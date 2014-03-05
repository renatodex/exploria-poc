class Merchant < ActiveRecord::Base
  belongs_to :npc
  belongs_to :scene
	has_many :merchant_item
	has_many :item, through: :merchant_item
	
	def sells?(item)
		self.item.where(id: item).count > 0
	end
end
