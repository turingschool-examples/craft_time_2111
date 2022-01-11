require "./lib/craft"

RSpec.describe Craft do

  before(:each) do
    @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
  end

  it 'is an instance of Craft' do
    expect(@craft).to be_instance_of(Craft)
  end

  it 'can access craft name' do
    expect(@craft.name).to eq("knitting")
  end

  it 'can return required supplies for craft' do
    expected_hash = {yarn: 20, scissors: 1, knitting_needles: 2}
    expect(@craft.required_supplies).to eq(expected_hash)
  end

end
