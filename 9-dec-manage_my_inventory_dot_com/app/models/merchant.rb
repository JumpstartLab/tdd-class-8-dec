class Merchant < ActiveRecord::Base
  attr_accessible :name, :location, :tier

  validates :name,     uniqueness: true, presence: true
  validates :location, presence: true

  has_many :items
end
