require './lib/person'
require './lib/craft'
require './lib/event'

describe Person do
  before(:each) do
    @person = Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']
      })
  end

  describe '#initialize' do
    it 'returns an instance of Person' do
      expect(@person).to be_a Person
    end

    it 'stores and returns the name' do
      expect(@person.name).to eq("Hector")
    end

    it 'stores and returns the interests' do
      expect(@person.interests).to eq('sewing', 'millinery', 'drawing'])
    end

    it 'stores and returns the supplies' do
      expect(@person.supplies).to eq({})
    end
