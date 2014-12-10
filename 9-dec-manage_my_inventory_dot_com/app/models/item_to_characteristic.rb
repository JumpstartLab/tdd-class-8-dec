class ItemToCharacteristic < ActiveRecord::Base
  belongs_to :item
  belongs_to :characteristic
end
