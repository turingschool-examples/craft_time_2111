require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'exists' do
    expect(@craft).to be_an_instance_of(Craft)
  end

  it '#attributes' do
    expect(@craft.name).to eq('knitting')
    expect(@craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end