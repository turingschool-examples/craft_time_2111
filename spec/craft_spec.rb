require 'rspec'
require 'pry'
require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Craft do
  describe '#iteration 1' do
    it 'exists' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft).to be_a(Craft)
    end

    it 'can read  the name' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft.name).to eq("knitting")
    end

    xit 'exists' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft).to be_a(Craft)
    end
    xit 'exists' do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft).to be_a(Craft)
    end
  end
end
