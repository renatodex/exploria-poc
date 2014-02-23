class Npc < ActiveRecord::Base
	has_many :hero
	has_many :monster
	has_many :metaparam, as: :model
	has_many :battle_action
end
