require_relative 'test_helper'

require './lib/Node.rb'
require 'pry'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new(1, "Abc")

    node_a = Node.new(0, "Cat")
    node_b = Node.new(2, "Dog")

    @node.left = node_a
    @node.right = node_b
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

  def test_node_has_data
    assert_equal 1, @node.key
    assert_equal "Abc", @node.value
  end

  def test_node_accepts_branches


    assert_equal "Cat", @node.left.value
    assert_equal "Dog", @node.right.value
  end

  def find(key, current_node=@node)
    #binding.pry

    if(current_node == nil) then return nil end

    if(current_node.key == key)
      current_node
    else
      if(key < current_node.key)
        find(key, current_node.left)
      else
        find(key, current_node.left)
      end
    end
  end

  def test_can_traverse_node
    assert_nil find(6)
    assert_equal "Dog", find(2).value
    assert_equal "Cat", find(1).value
  end

end