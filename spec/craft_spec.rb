require './lib/person'
require './lib/craft'
require './lib/event'
require 'pry'
require 'RSpec'

RSpec.describe Craft do
  describe "this will test the Craft class" do
    it "checks the functionality" do
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      expect(craft.name).to eq("knitting")
      expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
    end
  end
end
