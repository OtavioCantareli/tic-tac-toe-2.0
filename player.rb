class Player
  attr_reader :name

  @@instances = 0
  def initialize(name)
    @name = name
    @@instances += 1
  end

  def self.count
    @@instances
  end
end
