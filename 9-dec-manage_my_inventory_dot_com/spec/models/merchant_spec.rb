require "rails_helper"

RSpec.describe Merchant, type: :model do
  it "has a name" do
    merchant = Merchant.create(name: "Jorge")

    expect(merchant.name).to eq("Jorge")
  end

  it "has a location" do
    merchant = Merchant.create(location: "Denver")

    expect(merchant.location).to eq("Denver")
  end

  it "has a tier" do
    merchant = Merchant.create(tier: 1)

    expect(merchant.tier).to eq(1)
  end

  it "cannot have two merchants with the same name" do
    Merchant.create(name: "Jorge")
    merchant = Merchant.create(name: "Jorge")

    expect(merchant).not_to be_valid
  end

  it "is invalid without a name" do
    merchant = Merchant.create(location: "Denver", tier: 1)

    expect(merchant).not_to be_valid
    # expect(merchant).to be_invalid
  end

  it "is invalid without a location" do
    merchant = Merchant.create(name: "Jorge", tier: 1)

    expect(merchant).not_to be_valid
  end

  it "has many items" do
    merchant = Merchant.create(name: "Jorge", location: "Denver", tier: 1)
    item     = Item.create(merchant_id: merchant.id)

    expect(merchant.items).to include(item)
  end
end
