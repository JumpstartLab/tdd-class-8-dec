require "rails_helper"


RSpec.describe "Searching", type: :feature do
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

  def login_as(merchant)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_merchant).and_return(merchant)
  end

  it "I can search by an characteristic" do
    # As a Neyeke tennis shoe vendor
    # I want to search my items
    # to determine whether my supply is low or high
    # so I can determine whether I need to manufacture more
    # or have a sale to clear up warehouse space.

    # Background information
    # I'm logged in as the Neyeke tennis shoe vendor
    white_shoes = nil
    neyeke = Merchant.create(FactoryGirl.attributes_for :merchant, name: 'neyeke') do |merchant|
      # And I have 2 white shoes, 1 brown shoe, and 1 black shoe
      shoes = [
        FactoryGirl.build(:item, name: 'white shoe1', characteristics: [white]),
        FactoryGirl.build(:item, name: 'brown shoe',  characteristics: [brown]),
        FactoryGirl.build(:item, name: 'white shoe2', characteristics: [white]),
        FactoryGirl.build(:item, name: 'black shoe',  characteristics: [black]),
      ]
      white_shoes = [shoes[0], shoes[2]]
      merchant.items = shoes
    end
    login_as neyeke

    pending 'got this far'

    # And the RebaK vendor has 1 white shoes
    rebas_shoe = nil
    rekak = Merchant.create(FactoryGirl.attributes_for :merchant, name: 'rebak') do |merchant|
      rebas_shoe = FactoryGirl.build(:item, name: 'rebas white shoe', characteristics: [white]),
      merchant.items = [rebas_shoe]
    end

    # And I am on my search page
    visit search_path

    # When I select "white" from the "colors" filter
    select 'White', from: 'Colors'

    # And I click the "Search" button
    click_button 'Search'

    # Then I my see 2 white shoes.
    white_shoes.each do |shoe|
      expect(page).to have_content shoe.name
    end
    expect(page).to have_no_content rebas_shoe.name
  end
end
