require './lib/person'
require './lib/craft'

describe Craft do
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@craft).to be_a(Craft)
  end

  it 'has a name' do
    expect(@craft.name).to eq('knitting')
  end

  it 'has required supplies' do
    expect(@craft.supplies_required).to be_a(Hash)
    expect(@craft.supplies_required.count).to eq(3)
  end



end
