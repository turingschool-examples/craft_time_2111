require './lib/craft'

RSpec.describe Craft do
  it 'exists' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(craft).to be_an_instance_of(Craft)
  end
  it 'has a name' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(craft.name).to eq('knitting')
  end
  it 'has supplies required' do
    craft = Craft.new('knitting', { yarn: 20, scissors: 1, knitting_needles: 2 })
    expect(craft.supplies_required).to eq({ yarn: 20, scissors: 1, knitting_needles: 2 })
  end
end
