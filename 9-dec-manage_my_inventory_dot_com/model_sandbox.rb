=begin
Features (for merchants)
  see all my items
  search for items within a price range
  not see other merchants' items unless they give me permission
  see quantity of a given item
  √ search by arbitrary item type
  can't see other merchants' items
  permission to access are determined by
    tier (ie purchased this feature)
    location (ie legally allowed to access this feature)


things we'd like to explore
  permissions based on tier and location
  more sophisticated searches (based on complex db structure)

----

Feature: Searching by

As a Neyeke tennis shoe vendor
I want to search my items
to determine whether my supply is low or high
so I can determine whether I need to manufacture more
or have a sale to clear up warehouse space.

Background information
  I'm logged in as the Neyeke tennis shoe vendor
  And I have 2 white shoes, 3 brown shoes, and 4 black shoes
  And the ReebaK vendor has 10 white shoes
  And I am on my search page

When I select "white" from the "colors" filter
And I click the "search" button
Then I see 2 white shoes.
=end



require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
ActiveRecord::Base.logger = Logger.new $stdout
ActiveSupport::LogSubscriber.colorize_logging = false

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :merchants do |t|
    t.string  :name
    t.integer :tier
    t.string  :location
  end

  create_table :items do |t|
    t.string    :name
    t.string    :description
    t.integer   :price,        default: 0
    t.integer   :merchant_id,  null: false
    t.datetime  :receive_date
    t.datetime  :sell_date
    t.datetime  :ship_date
  end

  create_table :item_to_characteristics do |t|
    t.integer :item_id
    t.integer :characteristic_id
  end

  create_table :characteristic_types do |t|
    t.string :name
  end

  create_table :characteristics do |t|
    t.integer :characteristic_type_id
    t.string  :name
  end
end


class Merchant < ActiveRecord::Base
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many   :item_to_characteristics
  has_many   :characteristics, through: :item_to_characteristics
end

class ItemToCharacteristic < ActiveRecord::Base
  belongs_to :item
  belongs_to :characteristic
end

class CharacteristicType < ActiveRecord::Base
  has_many :characteristics
end

class Characteristic < ActiveRecord::Base
  belongs_to :characteristic_type
  has_many   :item_to_characteristics
  has_many   :items, through: :item_to_characteristics
end


color = CharacteristicType.new name: 'color'
white = Characteristic.new name: 'white', characteristic_type: color

shoe        = CharacteristicType.new name: 'shoe'
tennis_shoe = Characteristic.new     name: 'Tennis Shoe', characteristic_type: shoe

neyeke = Merchant.create! do |merchant|
  merchant.name     = 'Neyeke'
  merchant.tier     = 3
  merchant.location = 'CO'

  merchant.items.build do |item|
    item.name         = 'Water Jordans'
    item.description  = 'Kinda like Jesus on Galilee... but better at hoops'
    item.price        = 150_00
    item.receive_date = 1.day.ago

    item.characteristics = [white, tennis_shoe]
  end
end

rebak = Merchant.create! do |m|
  m.name     = 'RebaK'
  m.tier     = 1
  m.location = 'TN'
end


color
  .characteristics
  .first
  .items
  .first
  .merchant
  .name
