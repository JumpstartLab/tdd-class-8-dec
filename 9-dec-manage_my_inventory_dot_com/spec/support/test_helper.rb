module TestHelpers
  def login_as(merchant)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_merchant).and_return(merchant)
  end
  def color_characteristic_type
    @color_characteristic_type ||= (
      CharacteristicType.where(name: 'color').first ||
        CharacteristicType.create!(name: 'color')
    )
  end
  def white
    @white ||= (
      Characteristic.where(name: 'white', characteristic_type_id: color_characteristic_type.id).first ||
        Characteristic.create!(name: 'white', characteristic_type_id: color_characteristic_type.id)
    )
  end
  def brown
    @brown ||= (
      Characteristic.where(name: 'brown', characteristic_type_id: color_characteristic_type.id).first ||
        Characteristic.create!(name: 'brown', characteristic_type_id: color_characteristic_type.id)
    )
  end
  def black
    @black ||= (
      Characteristic.where(name: 'black', characteristic_type_id: color_characteristic_type.id).first ||
        Characteristic.create!(name: 'black', characteristic_type_id: color_characteristic_type.id)
    )
  end
end
