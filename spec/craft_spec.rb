require './lib/person'
require './lib/craft'
require './lib/event'

RSpec. describe do Craft

  it 'craft class exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    expect(craft).to be_an_instance_of(Craft)
  end

  it 'craft has a name' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    expect(craft.name).to eq("knitting")
  end


end
