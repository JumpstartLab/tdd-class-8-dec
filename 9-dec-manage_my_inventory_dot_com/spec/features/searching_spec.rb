require "rails_helper"


RSpec.describe "Searching", type: :feature do
  it "I can search by an characteristic", a:true do
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

    # And the RebaK vendor has 1 white shoe
    rebas_shoe = nil
    rekak = Merchant.create(FactoryGirl.attributes_for :merchant, name: 'rebak') do |merchant|
      rebas_shoe = FactoryGirl.build(:item, name: 'rebas white shoe', characteristics: [white])
      merchant.items = [rebas_shoe]
    end

    # And I am on my search page
    visit search_path

    # When I select "white" from the "colors" filter
    select 'white', from: 'Color'

    # And I click the "Search" button
    click_button 'Search'

    # Then I my see 2 white shoes.
    white_shoes.each do |shoe|
      expect(page).to have_content shoe.name
    end
    expect(page).to have_no_content rebas_shoe.name
  end
end
