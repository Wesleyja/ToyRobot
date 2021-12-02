FactoryBot.define do 

  factory :robot do 
    x { 0 }
    y { 0 }

    skip_create
    initialize_with { new(x, y) }
  end

end