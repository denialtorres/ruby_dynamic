require 'pry'

# The Node class has been simplified, and unnecessary instance variables have been removed. It now has only data and next attributes, which are accessed using attr_accessor.
#
# The LinkedList class is renamed from Node, as it better represents the actual data structure.
#
# The insert_data method is renamed to insert for clarity.
#
# The cat method is renamed to concatenate for better readability.
#
# The remove method has been simplified by removing unnecessary checks and making the logic more straightforward.
#
# The clear method now directly sets @head to nil, effectively clearing the list.
#
# The includes? method has been simplified by removing unnecessary checks.
#
# The find_first method now uses a more concise and idiomatic syntax for defining a block (&predicate).
#
# The each method is simplified by removing unnecessary checks.
#
# The print method uses the each method to iterate over the nodes and print the data.

# Node class represents a single node in the linked list
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

# LinkedList class represents a linked list
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Inserts a new node with the provided data at the end of the linked list
  def insert(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next while current.next
      current.next = new_node
    end
  end

  # Removes the specified node from the linked list
  def remove(node)
    return if node.nil?
    return if @head.nil?

    if node == @head
      @head = @head.next
    else
      current = @head
      while current && current.next != node
        current = current.next
      end
      current.next = node.next if current
    end
  end

  # Concatenates another linked list at the end of the current list
  def concatenate(list)
    return if list.nil?

    if @head.nil?
      @head = list.head
    else
      current = @head
      current = current.next while current.next
      current.next = list.head
    end
  end

  # Clears the linked list by setting the head to nil
  def clear
    @head = nil
  end

  # Checks if the linked list contains a node with the specified data
  def includes?(data)
    current = @head
    while current
      return true if current.data == data
      current = current.next
    end
    false
  end

  # Finds the first node in the linked list that satisfies the given predicate
  def find_first(&predicate)
    return unless block_given?

    current = @head
    while current
      return current if predicate.call(current)
      current = current.next
    end
  end

  # Iterates over each node in the linked list and yields it to the provided block
  def each
    return unless block_given?

    current = @head
    while current
      yield current
      current = current.next
    end
  end

  # Prints the data stored in each node of the linked list
  def print
    if @head.nil?
      puts "empty"
    else
      each { |node| puts node.data }
    end
  end
end

# Create a new linked list
list = LinkedList.new

# Insert nodes into the list
list.insert(10)
list.insert(20)
list.insert(30)

# Print the list
list.print
# Output:
# 10
# 20
# 30

# Check if the list includes a specific value
puts list.includes?(20)
# Output: true

puts list.includes?(40)
# Output: false

# Find the first node that satisfies a condition
even_node = list.find_first { |node| node.data.even? }
puts even_node.data
# Output: 10

# Remove a node from the list
node_to_remove = list.head.next
list.remove(node_to_remove)

# Print the updated list
list.print
# Output:
# 10
# 30

# Create another linked list
other_list = LinkedList.new
other_list.insert(40)
other_list.insert(50)

# Concatenate the two lists
list.concatenate(other_list)

# Print the concatenated list
list.print
# Output:
# 10
# 30
# 40
# 50

# Clear the list
list.clear

# Print the cleared list
list.print
# Output: empty
