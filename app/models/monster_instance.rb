class MonsterInstance < ActiveRecord::Base
  belongs_to :monster
	belongs_to :hero
	has_many :metaparam, as: :model
end
