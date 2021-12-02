require 'spec_helper'

RSpec.describe 'Robot Spec', type: :class do 

  let(:robot) { create(:robot) }
  let(:placed_robot) { robot.palce( 0, 0, 'NORTH') }

  describe 'initiate robot' do 
    it 'creates robot' do 
      expect(robot).to be_an(Robot)
    end
  
    it 'valid' do 
      expect(robot.valid?).to be true
    end
  end

  describe 'robot assumptions' do 
    context 'Place command if first valid method' do 
      it 'commands before place command' do 

      end

      specify do 

      end

    end

    context 'commands when not on table' do 
      it 'move command ignored when' do 
      
      end
    end

  end
  describe 'placed robot' do 

    context 'Example Input/Output' do 
      it 'PLACE 0,0,NORTH - MOVE - REPORT' do 

      end 

      it 'PLACE 0,0,NORTH - LEFT - REPORT' do 

      end

      it 'PLACE 1,2,EAST - MOVE - MOVE - LEFT - MOVE - REPORT' do 

      end
    end 

  end



end


# a)
# PLACE 0,0,NORTH
# MOVE
# REPORT
# Output: 0,1,NORTH

# b)
# PLACE 0,0,NORTH
# LEFT
# REPORT
# Output: 0,0,WEST

# c)
# PLACE 1,2,EAST
# MOVE
# MOVE
# LEFT
# MOVE
# REPORT
# Output: 3,3,NORTH