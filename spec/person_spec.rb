require './lib/person'
require 'RSpec'
require 'pry'

RSpec.describe Person do
  describe "itteration 1" do
    it "person exists" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person).to be_a(Person)
    end

    it "adds supplies" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
      person.add_supply('fabric', 3)
      expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end
  

end
