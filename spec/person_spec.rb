require './lib/person.rb'
require './lib/craft.rb'
require './lib/event.rb'


RSpec.describe Person do

  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_instance_of(Person)
  end

  it 'person has a name' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.name).to eq("Hector")
  end

  it 'person has interests' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end

  it 'person has supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.supplies).to eq({})
  end


end
