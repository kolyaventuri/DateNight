require 'pry';

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

  def to_hash
    node_hash = Hash.new
    node_hash[@value] = @key
    node_hash
  end

end