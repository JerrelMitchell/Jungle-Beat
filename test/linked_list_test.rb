require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  attr_reader :list
  attr_accessor :node

  def setup
    @list = LinkedList.new
    @node = Node.new('blub')
  end

  def test_list_exists
    assert_instance_of LinkedList, list
  end

  def test_list_has_a_nil_head_by_default
    assert_nil list.head
  end

  def test_list_uses_append_to_add_node_to_head
    assert_equal 'doodlydoo', list.append('doodlydoo')
  end

  def test_list_next_node_after_head_equals_nil
    assert_nil list.head.next_node
  end

  def test_list_counts_number_of_nodes
    assert_equal 1, list.count
  end

end
