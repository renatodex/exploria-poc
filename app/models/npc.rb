class Npc < ActiveRecord::Base
	has_many :hero
	has_many :monster
end
