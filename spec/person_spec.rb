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
end
end
