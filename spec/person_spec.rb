require 'rspec'
require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  describe '#iteration 1' do
    it 'exists' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person).to be_a Person
    end

    it 'can read a name' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person.name).to eq("Hector")
    end

    it 'can read interests' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person.interests).to eq(["sewing", "millinery", "drawing"])
    end

    it 'can read supplies' do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person.supplies).to eq({})
    end
  end
end
