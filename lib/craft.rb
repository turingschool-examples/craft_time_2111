class Craft
  attr_reader :name, :supplies
  def initialize(name, supplies)
    @name = name
    @supplies = supplies
  end

  def supply_count
    @supplies.count
  end

  def all_supplies
    supplies = []
    @supplies.keys.each do |key|
     supplies << key.to_s
   end
   return supplies
  end
end
