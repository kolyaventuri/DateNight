require './lib/Node'
require 'pry';
class BinarySearchTree

  attr_reader :height

  def initialize
    @root = nil
    @num_nodes = 0
    @height = 0
  end

  def insert(key, value, current_node=@root, depth=0)

    if(@root.nil?) then
      @root = Node.new(key,value)
      @num_nodes = 1
      @height = 1
      return 0
    end
    if(key < current_node.key)
      if(!current_node.left.nil?)
        return insert(key, value, current_node.left, depth + 1)
      end
      current_node.left = Node.new(key, value)
    else
      if(!current_node.right.nil?) then
        return insert(key, value, current_node.right, depth + 1)
      end
      current_node.right = Node.new(key, value)
    end

    @num_nodes += 1
    depth += 1
    if(depth+1 > @height)
      @height = depth+1
    end
    depth
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
    node_list = get_nodes_at_depth(depth)
    node_health_list = []

    node_list.each do |node|
      node_health = []
      node_health.push(node.key)

      count = count_below(node)
      node_health.push(count)

      percentage = (count / @num_nodes.to_f) * 100
      node_health.push(percentage.to_i)

      node_health_list.push(node_health)
    end

    node_health_list
  end

  def leaves(current_node=@root)
    leaf_count = 0

    if(current_node == nil)
      leaf_count
    elsif(current_node.left.nil? && current_node.right.nil?)
      leaf_count += 1
    else
      leaf_count += leaves(current_node.left)
      leaf_count += leaves(current_node.right)
    end

    leaf_count
  end

  def load(file_name)
    lines = []
    File.open(file_name, 'r') do |file|
      lines = file.read.split("\n")
    end

    tracker = []

    lines.each do |line|
      values = line.split(', ')
      if(!tracker.include?(values[0]))
        tracker.push(values[0])
        insert(values[0].to_i, values[1].strip)
      end

    end
    tracker.length
  end

  def sort(current_node=@root)
    sorted = []
    if(current_node.nil?)
      sorted
    else
      if(!current_node.left.nil?)
        sort(current_node.left).each do |node|
          sorted.push(node.to_hash)
        end
      end

      sorted.push(current_node.to_hash)

      if(!current_node.right.nil?)
        sort(current_node.right).each do |node|
          sorted.push(node.to_hash)
        end
      end

      sorted
    end
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
