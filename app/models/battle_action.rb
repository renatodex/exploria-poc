class BattleAction < ActiveRecord::Base
  belongs_to :npc
  belongs_to :attack_type
end
