require_relative 'test_helper'
require './lib/BinarySearchTree.rb'

class BinarySearchTreeClassTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    @sorted_array = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    @large_tree = BinarySearchTree.new
    @large_tree.insert(98, "Animals United")
    @large_tree.insert(58, "Armageddon")
    @large_tree.insert(36, "Bill & Ted's Bogus Journey")
    @large_tree.insert(93, "Bill & Ted's Excellent Adventure")
    @large_tree.insert(86, "Charlie's Angels")
    @large_tree.insert(38, "Charlie's Country")
    @large_tree.insert(69, "Collateral Damage")
  end

  def test_search_tree_object_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_search_tree_inserts_correctly
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_search_tree_checks_inclusivity
    assert_equal true, @tree.include?(16)
    assert_equal false, @tree.include?(7)
  end

  def test_search_tree_returns_node_depth
    assert_equal 1, @tree.depth_of?(92)
    assert_equal 2, @tree.depth_of?(50)
  end

  def test_search_tree_finds_max_min
    assert_equal @sorted_array.last, @tree.max # @sorted_array.last is where {"Sharknado 3" => 92} lives
    assert_equal @sorted_array.first, @tree.min # @sorted_array.first is where {"Johnny English" => 16} lives
  end

  def test_search_tree_counts_below
    node = @large_tree.find_node_by_key(93)[:node]
    assert_equal 3, @large_tree.count_below(node)
  end

  def test_search_tree_gets_nodes_at_depth
    nodes = @large_tree.get_nodes_at_depth(2)
    
    assert_instance_of Array, nodes
    assert_equal 36, nodes[0].key
    assert_equal 93, nodes[1].key
  end

  def test_search_tree_returns_node_health
    skip

    assert_equal [[98, 7, 100]], @large_tree.health(0)
    assert_equal [[58, 6, 85]], @large_tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], @large_tree.health(2)
  end

  def test_search_tree_leaves_depth
    skip
    assert_equal 2, @tree.leaves
    asert_equal 3, @tree.height
  end

  def test_search_tree_deletes_nodes
    skip
    assert_nil @tree.delete(61)
    assert_nil @tree.delete(16)

    assert_equal false, @tree.include?(61)
    assert_equal false, @tree.include?(16)
  end

  def test_search_tree_sorts_nodes
    skip
    assert_equal @sorted_array, @tree.sort
  end

  def test_search_tree_loads_from_file
    skip
    new_tree = BinarySearchTree.new
    assert_equal 99, new_tree.load('./test/movies.txt')
  end

end