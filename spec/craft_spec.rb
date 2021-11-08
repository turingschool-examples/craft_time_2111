require './lib/craft'

RSpec.describe Craft do
  before :each do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it "exists" do
    expect(@craft).to be_a(Craft)
  end

  it "checks the attributes" do
    expect(@craft.name).to eq('knitting')
    expect(@craft.supplies_required).to eq({})
  end
  it "adds supplies " do
    @craft.add_supplies(yarn: 20)
    @craft.add_supplies(scissors: 1)
    @craft.add_supplies(knitting_needles: 2)
    expect(@craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end

  
end
