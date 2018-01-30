require './lib/Node'
require 'pry';
class BinarySearchTree

  def initialize
    @root = nil
  end

  def insert(key, value, current_node=@root, depth=0)
    if(@root.nil?) then
      @root = Node.new(key,value)
      return 0
    end
    if(key < current_node.key)
      if(!current_node.left.nil?)
        return insert(key, value, current_node.left, depth + 1)
      end
      current_node.left = Node.new(key, value)
      depth + 1
    else
      if(!current_node.right.nil?) then
        return insert(key, value, current_node.right, depth + 1)
      end
      current_node.right = Node.new(key, value)
      depth + 1
    end
  end

end
