require './lib/event'
require './lib/craft'
require './lib/person'
require 'rspec'

RSpec.describe Event do

  let(:event) {Event.new("Carla's Craft Connection", [craft], [person])}
