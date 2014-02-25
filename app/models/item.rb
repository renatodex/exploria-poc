class Item < ActiveRecord::Base
	has_many :metaparam, as: :model
	belongs_to :item_type
end