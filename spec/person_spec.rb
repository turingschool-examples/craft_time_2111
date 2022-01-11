require './lib/person'
require './lib/craft'
require './lib/event'

RSpec. describe do Person

  it 'person class exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    expect(person).to be_an_instance_of(Person)
  end


end
