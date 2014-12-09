class Cup
  def initialize(color)
    @color = color
  end

  def color
    @color
  end

  def ==(cup)
    color == cup.color
  end
end
