class MerchantItem < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :item
end
