require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
  context 'Iteration I' do
    let(:person) {Person.new({
      name: 'Hector',
      interests: ['sewing', 'millinery', 'drawing']})}

    describe 'Person' do
      it 'exists' do

        expect(person).to be_a(Person)
      end

      it 'has attributes' do

        expect(person.name).to eq("Hector")
        expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
        expect(person.supplies).to eq({})
      end
    end
  end
end
