require './lib/craft'
RSpec.describe Craft do
  it 'exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    # binding.pry
    expect(craft).to be_a(Craft)
  end

  it 'has a name' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    # binding.pry
    expect(craft.name).to be_a("knitting")
  end
end
