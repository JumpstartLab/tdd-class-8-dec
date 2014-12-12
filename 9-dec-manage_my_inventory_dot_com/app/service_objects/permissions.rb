class Permissions

  class << self
    attr_reader :before_1990_states, :price_range_states, :expensive_items_states,
      :before_1990_gt_tier, :price_range_gt_tier, :searches_per_day_ge_tier
  end
    
  @before_1990_states = %w{CO WI TX CA}
  @price_range_states = %w{AL MI FL OK RI MD NJ WV}
  @expensive_items_states = %w{OK ND ME AR MS}
  @before_1990_gt_tier = 2
  @price_range_gt_tier = 1
  @searches_per_day_ge_tier = 3

  def initialize(location, tier)
    @location = location
    @tier = tier
  end

  def search_before_1990? # receive_date
    @tier > Permissions.before_1990_gt_tier && 
      Permissions.before_1990_states.include?(@location)
  end

  def search_price_range?
    @tier > Permissions.price_range_gt_tier && 
      Permissions.price_range_states.include?(@location)
  end

  def sell_expensive_items?
    Permissions.expensive_items_states.include?(@location)
  end

  def can_search_by_color?
    true
  end

  def max_searches_per_day?
    @tier >= Permissions.searches_per_day_ge_tier
  end
end