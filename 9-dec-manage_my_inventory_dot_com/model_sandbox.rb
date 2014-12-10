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
