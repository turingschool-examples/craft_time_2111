require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'
require 'RSpec'

RSpec.describe Person do
  describe "this will test the Person class" do
    it "checks the functionality" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      expect(person.name).to eq("Hector")
      expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(person.supplies).to eq({})
    end

  end
end
