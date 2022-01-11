require './lib/person'
require './lib/event'
require './lib/craft'
require 'pry'

RSpec.describe Craft do #Iteration 1
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@craft).to be_instance_of Craft
  end

  it 'has a name' do
    expect(@craft.name).to eq "knitting"
  end

  it 'has required supplies' do
    expected = {:yarn=>20, :scissors=>1, :knitting_needles=>2}
    expect(@craft.supplies_required).to eq expected 
  end
end
