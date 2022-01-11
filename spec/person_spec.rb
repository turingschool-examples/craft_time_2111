require './lib/person'
require 'pry'

RSpec.describe Person do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}


  it 'exists' do
    expect(person).to be_a Person
  end

  it 'has attributes' do
    expect(person.name).to eq("Hector")
    expect(person.interests).to eq (["sewing", "millinery", "drawing"])
    expect(person.supplies).to eq({})
  end
end
