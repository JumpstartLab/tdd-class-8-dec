require "rails_helper"

RSpec.describe Item, type: :model do
  it "creates an item" do
    item = Item.create do |item|
      item.name        = "Running Shoes"
      item.description = "Fast"
      item.price       = 10000
      item.merchant_id = 1
    end

    expect(item.name).to        eq "Running Shoes"
    expect(item.description).to eq "Fast"
    expect(item.price).to       eq 10000
    expect(item.merchant_id).to eq 1
  end

  it "has a merchant" do
    merchant = Merchant.create(name: "Jorge", location: "Denver", tier: 1)
    item     = merchant.items.create do |item|
      item.name        = "Running Shoes"
      item.description = "Fast"
      item.price       = 10000
      item.merchant_id = merchant.id
    end

    expect(item.merchant).to eq merchant
  end
end
