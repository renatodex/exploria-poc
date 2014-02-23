class MonsterInstance < ActiveRecord::Base
  belongs_to :monster
	has_many :metaparam, as: :model
end
