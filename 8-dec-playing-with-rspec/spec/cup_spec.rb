require 'cup'

# this defines a suite named "Cup"
# a suite is a group of related tests
RSpec.describe 'Cup' do
  it 'has a color' do
    cup = Cup.new :brown
    expect(cup.color).to eq :brown
    # Break down that syntax
    #   self.expect(cup.color()).to(self.eq(:brown))
    #   eq means `==` returns true
    # Translate to old style
    #   cup.color.should == :brown
  end

  example 'look at other matchers' do
    expect("a").to eq "a"
    expect("abc").to match /a.c/
    expect(["a", "b", "c"]).to include "b"
  end

  describe 'equality' do
    it 'is equal if colors are the same' do
      cup1 = Cup.new :white
      cup2 = Cup.new :white
      cup3 = Cup.new :green
      expect(cup1).to     eq cup2
      expect(cup1).to_not eq cup3
    end

    it 'is equal if cups have the same fullness' do
      pending
      cup1 = Cup.new :white, full: true
      cup2 = Cup.new :white, full: true
      cup3 = Cup.new :white, full: false
      expect(cup1).to     eq cup2
      expect(cup1).to_not eq cup3
    end
  end
end
