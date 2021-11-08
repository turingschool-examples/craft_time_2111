require "./lib/person"
RSpec.describe Person do

  it "exists" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_a(Person)
    end

  it "attributes" do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(["sewing", "millinery", "drawing"])
    expect(person.supplies).to eq({})
  end
end




#=> true
 person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
#=> #<Person:0x00007fd379b96028...>
 person.name
#=> "Hector"
 person.interests
#=> ["sewing", "millinery", "drawing"]
 person.supplies