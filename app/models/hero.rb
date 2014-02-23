class Hero < ActiveRecord::Base
  belongs_to :npc
	belongs_to :scene
end
