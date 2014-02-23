class Monster < ActiveRecord::Base
  belongs_to :npc
	has_many :metaparam, as: :model
end
