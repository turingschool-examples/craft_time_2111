require './lib/person'


RSpec.describe do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  it "exits" do
    expect(person).to be_a Person
  end

  it "initializes" do
    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(person.supplies).to eq({})
  end
end
