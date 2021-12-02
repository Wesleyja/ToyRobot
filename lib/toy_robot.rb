require_relative 'models/robot'

class ToyRobot
  def initialize()
    @robot = Robot.new()
    @running = true
  end

  def run
    while @running
      print_menu
      choice = gets.chomp.split(' ')
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
    puts 'EXIT'
    print '> '
  end

  def route_action(choice)
    if choice[0].upcase.include?('PLACE')
      values = choice[1].split(',')
    end
    case choice[0].upcase.to_sym
    when :PLACE then @robot = Robot.place(values[0].to_i, values[1].to_i, values[2])
    when :MOVE then @robot.move
    when :LEFT then @robot.left
    when :RIGHT then @robot.right
    when :REPORT then puts @robot.report
    when :EXIT then stop!
    else puts 'Try again...'
    end
  end

  def stop!
    @running = false
  end
end

application = ToyRobot.new()

application.run