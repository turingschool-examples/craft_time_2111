require './lib/craft'
require 'RSpec'

RSpec.describe Craft do
  describe "itteration 1" do
    it "craft exists" do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      expect(craft).to be_a(Craft)
    end
  end

end
