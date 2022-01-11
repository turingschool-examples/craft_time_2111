class Person
  attr_reader :name, :interests, :supplies

  def initialize(info)
    @name = info.fetch(:name)
    @interests = info.fetch(:interests)
    @supplies = {}
  end

  def add_supply(s_name, num)
    if !@supplies.include? s_name
      @supplies[s_name] = num
    elsif @supplies.include? s_name
      @supplies[s_name] += num
    end
  end


end
