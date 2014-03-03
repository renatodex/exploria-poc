class Item < ActiveRecord::Base
	has_many :metaparam, as: :model
	has_many :item_action
end