require './lib/node'

# handles methods for organizing, adding, subtracting, and counting nodes.
class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    new_node = Node.new(data)
    return @head = new_node if head.nil?
    current = head
    current = current.next_node until current.next_node.nil?
    current.next_node = new_node
    data
  end

  def prepend(data)
    new_node = Node.new(data)
    return @head = new_node if head.nil?
    new_node.next_node = head
    @head = new_node
  end

  def insert(index, data)
    new_node = Node.new(data)
    return @head = new_node if head.nil?
    return append(data) if index >= count
    current = head
    (index - 1).times do
      current = current.next_node
    end
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def to_string
    return 'There are no beats!' if head.nil?
    current = head
    sounds = ''
    sounds += current.data
    until current.next_node.nil?
      current = current.next_node
      sounds += " #{current.data}"
    end
    sounds
  end

  def count
    count = 0
    current = head
    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def includes?(data)
    current = head
    return current.data == data if current.next_node.nil?
    until current.next_node.nil?
      current = current.next_node
      current.data == data
    end
  end

  def find(index, data_tally)
    return nil if index.zero? || data_tally.zero?
    current = head
    until data_tally.zero?
      data_tally -= 1
      (index - 1).times do
        current = current.next_node
      end
      current.data
    end
  end
end
