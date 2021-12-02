# require 'byebug'
require 'active_model' 
class Robot

  DIRECTIONS = ['NORTH', 'SOUTH', 'EAST', 'WEST']

  DIRECTION_CONVERT = {
    'NORTH' => 0,
    'SOUTH' => 180,
    'EAST' => 90,
    'WEST' => 270
  }
  POSITION = (0..4).to_a

  include ActiveModel::Validations

  attr_accessor :x, :y, :direction
  validates_presence_of :x, :y
  validates_presence_of :direction, allow_nil: true
  validates_inclusion_of :x, :y, in: POSITION

  def initialize(x = nil, y = nil)
    @x = x
    @y = y
    @direction = nil
  end

  def self.place(x, y, direction)
    robot = self.new(x, y)
    if (DIRECTIONS.include?(direction.upcase))
      robot.direction = DIRECTION_CONVERT[direction.upcase]
    end
  end

  def placed? 
    !robot.direction.nil?
  end

  def trueDirection 
    return unless self.placed?

    self.direction%360
  end

  def move 
    return unless self.placed?

    oldY = self.y
    oldX = self.x
    # Would rather have used ActiveModel::Dirty here :(
    case self.trueDirection
    when 0 
      self.y += 1
    when 90
      self.x += 1
    when 180 
      self.y -= 1
    when 270
      self.x -= 1
    end

    unless self.valid?
      self.y = oldY
      self.x = oldX
    end
  end

  def left 
    return unless self.placed?

    self.direction -= 90
  end

  def right
    return unless self.placed?

    self.direction += 90
  end

  def report
    return unless self.placed?

    return "#{self.x}, #{self.y}, #{DIRECTION_CONVERT.key((self.trueDirection))}"
  end

end 