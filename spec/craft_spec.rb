require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'

RSpec.describe Craft do
  before(:each) do
  @craft = Craft.new('Knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

  end

  it 'exists and has retrievable key:value pairs' do
    # binding.pry
    expect(@craft).to be_a(Craft)
    expect(@craft.name).to eq('Knitting')
    expect(@craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end
