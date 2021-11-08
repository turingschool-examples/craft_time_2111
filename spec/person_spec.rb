require './lib/person'

describe Person do
  before(:each) do
    @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@person).to be_instance_of(Person)
    end
  end
end  
