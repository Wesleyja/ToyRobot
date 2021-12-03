require 'spec_helper'

RSpec.describe 'Robot Spec', type: :class do 

  describe 'initiate robot' do 
    let(:robot) { create(:robot) }

    it 'creates robot' do 
      expect(robot).to be_an(Robot)
    end
  
    it 'valid' do 
      expect(robot.valid?).to be true
    end
  end

  describe 'Error inputting' do 

    context 'inputs co-ordinates not valid' do 

      it 'x value' do 
        
      end

      it 'y value' do 

      end

      it 'Direction value' do 

      end


    end


  end

  describe 'robot assumptions' do 
    let(:empty_robot) { create(:robot) }
    let(:empty_robot_two) { create(:robot) }

    context 'Place command is first valid method' do 
      it 'commands before place command' do 
        empty_robot.right
        empty_robot.right
        empty_robot.move
        empty_robot.move
        expect([empty_robot.x, empty_robot.y, empty_robot.direction]).to eq([empty_robot_two.x, empty_robot_two.y, empty_robot_two.direction])
      end

    end

    context 'commands when not on table' do 

      it 'commands ignored' do 
        empty_robot.left
        empty_robot.right
        empty_robot.move
        empty_robot.left
        expect(empty_robot.report).to eq('The Robot hasnt been placed yet :)')
        expect([empty_robot.x, empty_robot.y, empty_robot.direction]).to eq([empty_robot_two.x, empty_robot_two.y, empty_robot_two.direction])
      end

    end

  end
  describe 'placed robot' do 

    context 'Example Input/Output' do 
      it 'PLACE 0,0,NORTH - MOVE - REPORT' do 
        robot = Robot.place( 0, 0, 'NORTH')
        robot.move
        expect(robot.report).to eq('0,1,NORTH')
      end 

      it 'PLACE 0,0,NORTH - LEFT - REPORT' do 
        robot = Robot.place(0, 0, 'NORTH')
        robot.left
        expect(robot.report).to eq('0,0,WEST')
      end

      it 'PLACE 1,2,EAST - MOVE - MOVE - LEFT - MOVE - REPORT' do 
        robot = Robot.place(1,2,'EAST')
        robot.move
        robot.move
        robot.left
        robot.move
        expect(robot.report).to eq('3,3,NORTH')
      end
    end 

    context 'large amount of commands' do 
      it 'PLACE 0,0,NORTH -> 4,4,SOUTH ' do 
        robot = Robot.place( 0, 0, 'NORTH')
        robot.left
        robot.left
        robot.left 
        # facing east
        robot.move
        robot.move
        robot.move
        # 3,0,east
        robot.right
        robot.right
        robot.right
        # facing north
        robot.move
        robot.move
        robot.move
        robot.move
        # 3,4,north
        robot.left
        # 3,4,west
        robot.move
        # 2,4,west
        robot.left
        # 2,4, south
        robot.move
        # 2,3 south
        robot.right
        robot.right
        # 2,3 north
        robot.move
        robot.move
        # 2,4 north
        robot.right
        # 2,4,east
        robot.move
        # 3,4 east
        robot.left
        # 3,4 north
        robot.right
        # 3,4, east
        robot.move
        # 4,4 east
        robot.right
        # 4,4 south
        expect(robot.report).to eq('4,4,SOUTH')
      end

    end

  end

end