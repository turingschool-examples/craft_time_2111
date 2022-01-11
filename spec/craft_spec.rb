require './lib/person.rb'
require './lib/craft.rb'
require './lib/event.rb'

RSpec.describe Craft do

  it 'exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft).to be_instance_of(Craft)
  end

  it 'has a name' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft.name).to eq('knitting')
  end

  it 'cheack supplies_required' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end


end
