class Npc < ActiveRecord::Base
	has_many :hero
	has_many :monster
	has_many :metaparam, as: :model
end
