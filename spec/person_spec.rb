'./lib/person'
RSpec.describe Person do

  it "exists" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_instance_of(Person)
  end

  it "has name" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.name).to eq('Hector')
  end

  it "has interests" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
  end
