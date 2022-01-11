require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Person do
let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}


  it 'exists and has attributes' do
    expect(person).to be_a(Person)
    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(person.supplies).to eq({})
  end

end
