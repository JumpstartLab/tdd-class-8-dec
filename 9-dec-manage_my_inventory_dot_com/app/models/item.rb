class Item < ActiveRecord::Base
  attr_accessible :merchant_id

  belongs_to :merchant
end
