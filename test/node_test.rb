require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

# tests for Node class methods
class NodeTest < Minitest::Test
  attr_reader :node
  def setup
    @node = Node.new('plop')
  end

  def test_node_exists
    assert_instance_of Node, node
  end

  def test_node_stores_data
    assert_equal 'plop', node.data
  end

  def test_node_stores_other_data
    new_node = Node.new('blub')

    assert_equal 'blub', new_node.data
  end

  def test_next_node_is_nil_by_default
    assert_nil node.next_node
  end
end
