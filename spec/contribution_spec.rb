require 'spec_helper'

describe Contribution do
  before do
    @contribution = Contribution.new
  end
  it 'has a name' do
    @contribution.should respond_to(:name)
  end
  it 'can assign the name' do
    @contribution.name = 'bob'
    @contribution.name.should == 'bob'
  end
end