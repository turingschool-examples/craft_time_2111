require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'

RSpec.describe Craft do
  describe 'Iteration 1' do
    let(:craft) {Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})}

    it "exists" do
      expect(craft).to be_a(Craft)      
    end



  end



end
