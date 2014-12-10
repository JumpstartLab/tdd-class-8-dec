require "rails_helper"

RSpec.describe "User Feature", type: :feature do
  it "can see all merchants in merchants page" do
    Merchant.create(name: "Jorge", location: "Denver", tier: 1)
    Merchant.create(name: "John", location: "New York", tier: 1)
    Merchant.create(name: "Josh", location: "Chicago", tier: 1)

    visit "/"
    expect(page).to have_content "MyInventory.com"
    expect(page).to have_content "Jorge"
    expect(page).to have_content "John"
    expect(page).to have_content "Josh"
  end

  it "can create a merchant" do
    visit "/merchants/new"
    fill_in "Name",     with: "Rachel"
    fill_in "Location", with: "Alaska"
    click_button "Create"

    expect(page).to have_content "Rachel"
  end

  it "cannot create a merchant if it doesn't have a name" do
    visit "/merchants/new"
    fill_in "Location", with: "Alaska"
    click_button "Create"

    expect(page).not_to have_content "Rachel"
  end

  it "can edit a merchant" do
    Merchant.create(name: "Jorge", location: "Denver", tier: 1)

    visit "/"
    click_link "edit"

    fill_in "Name",     with: "Jeff"
    fill_in "Location", with: "DC"
    click_button "Edit"

    expect(page).to have_content "Jeff"
  end

  it "cannot edit a merchant if it doesn's have a name" do
    merchant = Merchant.create(name: "Jorge", location: "Denver", tier: 1)

    visit "/"
    click_link "edit"

    fill_in "Name",     with: ""
    fill_in "Location", with: "DC"
    click_button "Edit"

    expect(page).to have_no_content "Jeff"
    expect(page.current_path).to eq merchant_path(merchant)
  end
end
