require './lib/person'

RSpec.describe Person do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_instance_of Person
  end

  it 'initializes with a name, interests, and no supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.name).to eq("Hector")
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
    expect(person.supplies).to eq({})
  end

  it 'can add supplies' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    person.add_supply('fabric', 4)
    person.add_supply('scissors', 1)
    expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})

    person.add_supply('fabric', 3)

    expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
  end

  it 'can determine if Person is able to build a craft with current supplies' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})

    expect(hector.can_build?(sewing)).to be False
  end
end
