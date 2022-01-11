require './lib/person'
require 'pry'

RSpec.describe Person do
  let(:person) {Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})}


  it 'exists' do
    expect(person).to be_a Person
  end
