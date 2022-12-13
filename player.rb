class Player
  attr_reader :name, :marker

  @@instances = 0
  def initialize(name, marker)
    @name = name
    @marker = marker
    @@instances += 1
  end

  def self.count
    @@instances
  end
end
