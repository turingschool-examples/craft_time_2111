require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  describe "Iteration 1" do
    let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}

    it "exists" do
      expect(person).to be_a(Person)
    end

    it "has attributes" do
      expect(person.name).to eq('Hector')      
    end



  end



end
