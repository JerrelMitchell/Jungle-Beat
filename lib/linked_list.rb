require './lib/node'
require 'pry'

class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
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

  def append(data)
    return @head = Node.new(data) if head.nil?
    current = head
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(data)
    data
  end

  def prepend(data)
    return @head = Node.new(data) if head.nil?
    current = head

    until current.next_node.nil?


    # current.next_node = head
    # current.next_node.next_node = current.next_node
    # current.next_node.next_node.next_node = current.next_node.next_node
  end

  # def insert(index, data)
  #   @count += 1
  #   (index - 1).times do
  #     @current_node = @current_node.next_node
  #   end
  #   new_node = Node.new(data)
  #   new_node.next_node = @current_node.next_node
  #   @current_node.next_node = new_node
  # end

  def to_string
    return 'There are no beats!' if @head.nil?
    current = @head
    string = ''
    string << current.data
    until current.next_node.nil?
      current = current.next_node
      string << " #{current.data}"
    end
    string
  end
end
