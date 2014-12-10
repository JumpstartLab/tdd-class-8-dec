class Characteristic < ActiveRecord::Base
  attr_accessible :name, :characteristic_type_id

  belongs_to :characteristic_type
  has_many   :item_to_characteristics
  has_many   :items, through: :item_to_characteristics
end
