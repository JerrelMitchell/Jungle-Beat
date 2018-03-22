require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

# tests methods created in linked list class
class LinkedListTest < Minitest::Test
  attr_reader :list
  def setup
    @list = LinkedList.new
  end

  def test_list_exists
    assert_instance_of LinkedList, list
  end

  def test_has_a_nil_head_by_default
    assert_nil list.head
  end

  def test_empty_list_uses_append_to_add_node_to_head
    list.append('doodlydoo')
    assert_equal 'doodlydoo', list.head.data
  end

  def test_next_node_after_head_equals_nil
    list.append('beep')
    assert_nil list.head.next_node
  end

  def test_uses_append_to_add_node_to_end_of_list
    list.append('beep')
    list.append('boop')
    list.append('woop')
    assert_equal 'beep', list.head.data
    assert_equal 'boop', list.head.next_node.data
    assert_equal 'woop', list.head.next_node.next_node.data
  end

  def test_empty_list_uses_prepend_to_add_node_to_head
    list.prepend('doodlybop')
    assert_equal 'doodlybop', list.head.data
  end

  def test_uses_prepend_to_add_node_to_start_of_list
    list.prepend('beep')
    list.prepend('boop')
    list.prepend('whip')
    assert_equal 'whip', list.head.data
    assert_equal 'boop', list.head.next_node.data
    assert_equal 'beep', list.head.next_node.next_node.data
  end

  def test_empty_list_uses_insert_to_add_node_to_head
    list.insert(1, 'womp')
    assert_equal 'womp', list.head.data
  end

  def test_uses_insert_to_add_node_to_set_node_in_list
    list.insert(1, 'beep')
    list.insert(1, 'boop')
    list.insert(2, 'woop')
    assert_equal 'boop', list.head.next_node.data
  end

  def test_counts_number_of_nodes
    list.append('blop')
    assert_equal 1, list.count

    list.append('beep')
    list.append('doomp')
    assert_equal 3, list.count

    list.append('skipa')
    list.append('scoot')
    assert_equal 5, list.count
  end

  def test_when_empty_returns_error_message_to_string
    result = 'There are no beats!'
    assert_equal result, list.to_string
  end

  def test_nodes_in_list_can_be_shown_as_string
    list.append('boop')
    list.append('beep')
    list.append('bump')
    list.append('woodlydoop')
    assert_equal 'boop beep bump woodlydoop', list.to_string
  end

  def test_uses_find_to_locate_specified_nodes_by_index
    skip
    list.prepend('blub')
    list.prepend('bop')
    list.append('skog')

    assert_equal 'skog', list.find(3, 1)
    assert_equal 'bop skog', list.find(2, 2)
  end

  def test_list_uses_includes_to_determine_if_sound_exists
    list.append('beep')
    list.append('bump')
    list.append('shoop')

    assert list.includes?('bump')
    assert list.includes?('beep')
    refute list.includes?('doop')
  end
end
