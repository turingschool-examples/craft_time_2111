require './lib/person'
require './lib/craft'
require './lib/event'

describe Craft do
  before(:each) do
    @craft = Craft.new(
      'knitting',
      {yarn: 20,
        scissors: 1,
        knitting_needles: 2}
      )
  end

  describe '#initialize' do
    it 'returns an instance of Craft' do
      expect(@craft).to be_a Craft
    end

    it 'stores and returns the name' do
      expect(@craft.name).to eq("knitting")
    end

    it 'returns the quantity of each suppli needed' do
      expect(@craft.supplies_required)
    end
  end
end
