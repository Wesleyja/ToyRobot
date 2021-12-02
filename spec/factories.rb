FactoryBot.define do 

  DIRECTIONS = [ 'NORTH', 'SOUTH', 'EAST', 'WEST']

  factory :robot do 
    x { rand(0..4) }
    y { rand(0..4) }
    direction { DIRECTIONS.sample }

    skip_create
    initialize_with { new(x, y, direction) }
  end

end