class Either
  def initialize(value)
    @value = value
  end

  def self.left(value)
    Left.new(value)
  end

  def self.right(value)
    Right.new(value)
  end

  def either(left_block, right_block)
    if is_left?
      left_block.call(@value)
    elsif is_right?
      right_block.call(@value)
    end
  end

  def is_left?
    instance_of?(Left)
  end

  def is_right?
    instance_of?(Right)
  end
end

class Left < Either; end

class Right < Either; end
