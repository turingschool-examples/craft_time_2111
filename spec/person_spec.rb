require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it 'has attributes' do
    expect(person.name).to eq("Hector")
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'does not have supplies by default' do
    expect(person.supplies).to eq({})
  end
end
