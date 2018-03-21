require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = LinkedList.new
  end

  def test_list_exists
    assert_instance_of LinkedList, list
  end

  def test_list_has_a_nil_head_by_default
    assert_nil list.head
  end

  def test_list_uses_append_to_add_node_to_head
    list.append('doodlydoo')
    assert_equal 'doodlydoo', list.head.data
  end

  def test_list_next_node_after_head_equals_nil
    list.append('beep')
    assert_nil list.head.next_node
  end

  def test_list_uses_append_to_add_node_to_end_of_list
    list.append('beep')
    list.append('boop')
    list.append('woop')
    assert_equal 'beep', list.head.data
    assert_equal 'woop', list.head.next_node.next_node.data
  end

  def test_list_uses_prepend_to_add_node_to_head
    skip
    list.prepend('doodlybop')
    assert_equal 'doodlybop', list.head.data
  end

  def test_list_uses_prepend_to_add_node_to_start_of_list
    list.prepend('beep')
    list.prepend('boop')
    list.prepend('whip')
    assert_equal 'whip', list.head.data
    assert_equal 'boop', list.head.next_node.data
    assert_equal 'beep', list.head.next_node.next_node.data
  end

  def test_list_counts_number_of_nodes
    list.append('blop')
    assert_equal 1, list.count

    list.append('beep')
    list.append('doomp')
    assert_equal 3, list.count

    list.append('skipa')
    list.append('scoot')
    assert_equal 5, list.count
  end

  def test_nodes_in_list_can_be_shown_as_string
    list.append('boop')
    list.append('beep')
    list.append('bump')
    list.append('woodlydoop')
    assert_equal 'boop beep bump woodlydoop', list.to_string
  end

  def test_when_list_is_empty_returns_error_message_to_string
    result = 'There are no beats!'
    assert_equal result, list.to_string
  end
end
