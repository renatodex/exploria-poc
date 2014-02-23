class Item < ActiveRecord::Base
	has_many :metaparam, as: :model
end
