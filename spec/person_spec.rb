require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'

RSpec.describe Person do
  before(:each) do
  @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

  end

  it 'exists and has retrievable key:value pairs' do
    # binding.pry
    expect(@person).to be_a(Person)
    expect(@person.name).to eq('Hector')
    expect(@person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(@person.supplies).to eq({})
  end
end
