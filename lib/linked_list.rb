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
    current = head
    (index - 1).times do
      current = current.next_node
    end
    new_node.next_node = current.next_node
    current.next_node = new_node
  end

  def to_string
    return 'There are no beats!' if head.nil?
    current = @head
    string = ''
    string << current.data
    until current.next_node.nil?
      current = current.next_node
      string << " #{current.data}"
    end
    string
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
end
