require "spec_helper"
require "permissions"

RSpec.describe Permissions, type: :model, perms: true do

  def permission_for(permission, location, tier)
    Permissions.new(location, tier)
      .__send__(permission)
  end    

  def assert_can(*args)
    expect(permission_for *args).to be_truthy
  end

  def assert_cant(*args)
    expect(permission_for *args).to be_falsey
  end

  describe 'search_before_1990?' do
    it "can search_before_1990? if tier > #{Permissions.before_1990_gt_tier}
        and location not in [#{Permissions.before_1990_states.join(', ')}]" do
      assert_can :search_before_1990?, 'TX', 3
      assert_cant :search_before_1990?, 'TX', 1
      assert_cant :search_before_1990?, 'TN', 1
      assert_cant :search_before_1990?, 'TN', 3
    end
  end

  describe "search_price_range?" do
    it "can search_price_range? if tier > #{Permissions.price_range_gt_tier}
        and location in [#{Permissions.price_range_states.join(', ')}]" do
      assert_can :search_price_range?, 'OK', 3
      assert_cant :search_price_range?, 'OK', 1
      assert_cant :search_price_range?, 'TN', 3
    end
  end

end