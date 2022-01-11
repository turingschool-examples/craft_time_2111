require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do

  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  it 'has attributes' do
    expect(craft.name).to eq("knitting")
    expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
  end
end
