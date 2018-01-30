require './lib/Node'
require 'pry';
class BinarySearchTree

  def initialize
    @root = nil
    @num_nodes = 0
  end

  def insert(key, value, current_node=@root, depth=0)
    @num_nodes += 1
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

  def include?(key)
    search_result = find_node_by_key(key)
    !search_result[:node].nil?
  end

  def depth_of?(key)
    search_result = find_node_by_key(key)
    search_result[:depth]
  end

  def min(current_node=@root)
    if(current_node.nil?)
      nil
    else
      if(current_node.left.nil?)
        current_node.to_hash
      else
        min(current_node.left)
      end
    end
  end

  def max(current_node=@root)
    if(current_node.nil?)
      nil
    else
      if(current_node.right.nil?)
        current_node.to_hash
      else
        min(current_node.right)
      end
    end
  end

  def health(depth)

  end

  def get_nodes_at_depth(target_depth, current_node=@root, current_depth=0)
    node_list = []
    if(current_node.nil?)
      node_list
    else
      if(current_depth == target_depth)
        node_list.push(current_node)
        node_list
      else
        if(!current_node.left.nil?)
          get_nodes_at_depth(target_depth, current_node.left, current_depth + 1).each do | node |
            node_list.push(node)
          end
        end
        if(!current_node.right.nil?)
          get_nodes_at_depth(target_depth, current_node.right, current_depth + 1).each do | node |
            node_list.push(node)
          end
        end
        node_list
      end

    end
  end

  def find_node_by_key(key, current_node=@root, depth=0)
    if(current_node.nil?)
      return {node: nil, depth: 0}
    end

    if(current_node.key == key)
      {node: current_node, depth: depth}
    else
      if(key < current_node.key)
        return find_node_by_key(key, current_node.left, depth + 1)
      else
        return find_node_by_key(key, current_node.right, depth + 1)
      end
    end
  end

  def count_below(current_node)
    result = 1
    if(current_node.nil?)
      0
    else
      result += count_below(current_node.left)
      result += count_below(current_node.right)
    end
  end

end
