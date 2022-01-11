require './lib/person'
require 'rspec'

RSpec.describe Person do

  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

  context 'iteration I' do

    it 'exists and in instantiated with an attributes hash' do

    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
    expect(person.supplies).to eq({})
  end

  it '#add_supply' do

    expect(person.supplies).to eq({})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    person.add_supply('fabric', 3)
    expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})

  end
end
end
