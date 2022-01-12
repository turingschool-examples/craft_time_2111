require './spec_helper'

describe Craft do
before :each do
  @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

end

  it 'exists and has attributes' do
    expect(@craft).to be_a(Craft)
    expect(@craft.name).to eq('knitting')
    expect(@craft.supplies).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end

end
