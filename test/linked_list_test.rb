require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test
  attr_reader :list
  attr_accessor :node

  def setup
    @list = LinkedList.new
    @node = Node.new('beep')
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
    list.append(node)
    assert_nil list.head.next_node
  end

  def test_list_counts_number_of_nodes
    list.append(node)
    assert_equal 1, list.count
  end

  def test_nodes_in_list_can_be_shown_as_string
    list.append('boop')
    list.append('beep')

    assert_equal 'boop beep', list.to_string
  end

  def test_when_list_is_empty_returns_error_message_to_string
    result = 'There are no beats!'
    assert_equal result, list.to_string
  end
end
