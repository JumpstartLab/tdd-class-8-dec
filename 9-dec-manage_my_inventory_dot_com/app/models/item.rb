class Item < ActiveRecord::Base
  attr_accessible :merchant_id, :name, :description, :price, :receive_date, :sell_date, :ship_date

  belongs_to :merchant
  has_many   :item_to_characteristics
  has_many   :characteristics, through: :item_to_characteristics
end
