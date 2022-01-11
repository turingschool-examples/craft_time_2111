require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'
require 'RSpec'

RSpec.describe Person do
  describe "this will test the Person class" do
    it "checks the initialize" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person.name).to eq("Hector")
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(person.supplies).to eq({})
    end

    it "adds supplies" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)
      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})
    end
  end
end
