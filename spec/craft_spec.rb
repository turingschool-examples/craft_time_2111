require './lib/person'
require './lib/craft'
require 'pry'
RSpec.describe do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}
  let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

  it "exists" do
    expect(craft).to be_a Craft
  end

  it "initializes" do
    expect(craft.name).to eq('knitting')
    expect(craft.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
  end
  
end
