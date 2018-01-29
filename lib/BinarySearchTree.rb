require './lib/Node'

require 'pry';

class BinarySearchTree

  def initialize
    @root = nil
  end

  def insert(key, value, current_node=@root, depth=0)
    binding.pry
    if(@root == nil)
      @root = Node.new(key, value)
      return 0
    else
      if(current_node == nil)
        current_node = Node.new(key, value)
        depth
      else
        if(key < current_node.key) # left
          if(current_node.left == nil)
            current_node.left = Node.new(key, value)
            depth + 1
          else
             insert(key, value, current_node.left, depth + 1)
          end

        else
          if(current_node.right == nil)
            current_node.right = Node.new(key, value)
            depth + 1
          else
             insert(key, value, current_node.right, depth + 1)
          end
        end
      end
    end
  end

end
