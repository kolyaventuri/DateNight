require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Node.rb'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new(1, "Abc")
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

  def test_node_has_data
    assert_equal 1, @node.key
    assert_equal "Abc", @node.value
  end

  def test_node_accepts_branches
    node_a = Node.new(0, "Cat")
    node_b = Node.new(2, "Dog")

    @node.left = node_a
    @node.right = node_b

    assert_equal "Cat", @node.left.value
    assert_equal "Dog", @node.right.value
  end

end