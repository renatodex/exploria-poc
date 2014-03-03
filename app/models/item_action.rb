class ItemAction < ActiveRecord::Base
  belongs_to :item
  belongs_to :item_action_type
end
