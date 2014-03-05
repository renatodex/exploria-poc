class Item < ActiveRecord::Base
	has_many :metaparam, as: :model
	has_many :item_action
	
	def resale_price
		rp = ServerConfig.resale_rate('meteora')
		self.price*rp/100
	end
end