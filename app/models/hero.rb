class Hero < ActiveRecord::Base
  belongs_to :npc
	belongs_to :scene
	
	has_many :metaparam, as: :model
end
