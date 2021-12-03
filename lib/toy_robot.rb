require_relative 'models/robot'

class ToyRobot
  def initialize()
    @robot = Robot.new()
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp
      route_action(choice)
    end
  end

  private

  def print_menu
    puts '------- Toy Robot -------'
    puts 'Please choose an option - Case Insensitive'
    puts 'PLACE X,Y,Direction  example: PLACE 0,0,NORTH'
    puts 'MOVE'
    puts 'LEFT'
    puts 'RIGHT'
    puts 'REPORT'
    puts 'EXIT'
    print '> '
  end
  
  def route_action(choice)

    if choice.downcase.include?('place')
      input = 'place'
      inputs = /^place\s(.*)/i.match(choice)[1].gsub(' ', '').split(',') rescue nil
    else 
      input = choice.gsub(' ', '')
    end

    case input.upcase.to_sym
    when :PLACE then @robot = robot_place(inputs[0],inputs[1], inputs[2])
    when :MOVE then @robot.move
    when :LEFT then @robot.left
    when :RIGHT then @robot.right
    when :REPORT then puts @robot.report
    when :EXIT then stop!
    else puts 'Try again...'
    end
  end

  def robot_place(x, y, direction)
    robot = Robot.place(x, y, direction)
    unless robot.valid?
      puts 'Invalid input'
    end 
    robot
  end

  def stop!
    @running = false
  end
end

application = ToyRobot.new()

application.run