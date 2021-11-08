require './lib/person'

RSpec.describe Person do

  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe '#initialize' do
    it 'has attributes' do
      expect(@person.name).to eq("Hector")
      expect(@person.interests).to eq(["sewing", "millinery", "drawing"])
      expect(@person.supplies).to eq({})
    end
  end



end
