require './lib/node'
require 'pry'

class LinkedList
  attr_reader :head, :count, :current_node

  def initialize(head = nil)
    @head = head
    @current_node = current_node
    @count = 0
  end

  def append(data)
    @count += 1
    if @head.nil?
      @head = Node.new(data)
    else
      @current_node = @head
      @current_node = @current_node.next_node until @current_node.next_node.nil?
      @current_node = Node.new(data)
    end
    data
  end

  # def prepend(data)
  #   @count += 1
  #   return @head = Node.new(data) if @head.nil?
  # end
  #
  # def insert(index, data)
  #   @count += 1
  #   (index - 1).times do
  #     @current_node = @current_node.next_node
  #   end
  #   new_node = Node.new(data)
  #   new_node.next_node = @current_node.next_node
  #   @current_node.next_node = new_node
  # end
  #
  # def to_string
  #   return 'There are no beats!' if @head.nil?
  #   sounds = @head.data
  #   if @count > 1
  #     (@count - 1).times do
  #       sounds += ' ' + @head.next_node.data
  #     end
  #   end
  #   sounds
  # end
end
