# require 'byebug'
require 'active_model' 
class Robot

  DIRECTION_CONVERT = {
    'NORTH' => 0,
    'SOUTH' => 180,
    'EAST' => 90,
    'WEST' => 270
  }
  POSITION = (0..4).to_a

  include ActiveModel::Validations
  include ActiveModel::Dirty
  include ActiveModel::AttributeMethods

  attr_accessor :x, :y, :direction
  define_attribute_methods :x, :y
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

    unless robot.valid?
      puts 'Invalid Coordinates'
      return robot = self.new()
    end

    if (DIRECTION_CONVERT.keys.include?(direction.upcase))
      robot.direction = DIRECTION_CONVERT[direction.upcase]
    end

    robot
  end

  def placed? 
    !self.direction.nil?
  end

  def trueDirection 
    return unless self.placed?

    self.direction = self.direction%360
  end

  def move 
    return unless self.placed?

    case self.trueDirection
    when 0 
      y_will_change!
      self.y += 1
    when 90
      x_will_change!
      self.x += 1
    when 180 
      y_will_change!
      self.y -= 1
    when 270
      x_will_change!
      self.x -= 1
    end

    unless self.valid?
      restore_attributes
    end
    changes_applied
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
    unless self.placed?
      return 'The Robot hasnt been placed yet :)'
    end

    return "#{self.x},#{self.y},#{DIRECTION_CONVERT.key((self.trueDirection))}"
  end

end 