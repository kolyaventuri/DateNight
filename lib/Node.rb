class Node
  attr_accessor :left,
                :right

  attr_reader :key,
              :value

  def initialize(key, value)
    @key = key
    @value = value

    @left = nil
    @right = nil
  end

end