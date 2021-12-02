require 'spec_helper'

RSpec.describe 'Robot Spec', type: :class do 

  let(:robot) { create(:robot) }

  it 'creates robot' do 
    expect(robot).to be_an(Robot)
  end

end
