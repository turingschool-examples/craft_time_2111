require './lib/person'
require 'pry'
RSpec.describe Person do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person).to be_a(Person)
  end

  it 'has a name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    # binding.pry
    expect(person.name).to eq("Hector")
  end
end
