require './lib/craft'

RSpec.describe do

  before :each do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@craft).to be_an_instance_of(Craft)
  end

  it 'has a name' do
    expect(@craft.name).to eq('knitting')
  end

  it 'requires supplies' do
    expect(@craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end

end
