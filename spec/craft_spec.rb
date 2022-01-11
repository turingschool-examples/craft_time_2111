require './lib/craft'

RSpec.describe Craft do
  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end
  it 'will be an instance of Craft' do
    expect(@craft).to be_instance_of(Craft)
  end
  it 'will read in craft name' do
    expect(@craft.name).to eq('knitting')
  end
  it 'will read in the supplies required' do
    expect(@craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end
end
