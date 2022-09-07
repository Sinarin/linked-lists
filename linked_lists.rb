class LinkedList
  attr_reader :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    #if list is empty assign node to head and make
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      #otherwise connect to tail
      @tail.next_node = Node.new(value)
    end
    @size += 1
  end


  def prepend(value)
    #if list is empty assign node to head and make
    if @head == nil
      @head = Node.new(value)
      @tail = @head
    else
      #add to front
      @head = Node.new(value, @head)
    end
    @size += 1
  end

  def at(index)
    #corner case, if not exist
    if @size == 0 || index + 1 > @size 
      puts "Node at this index does not exist."
    else
      #index starts at zero
      node = @head
      for i in 0..(index - 1) 
        node = node.next_node
      end
    node
    end
  end

  def pop
    #find new tail and assign point to nil
    if @size > 0
      @size -= 1
      @tail = at(@size - 1)
      @tail.next_node = nil
    else
      puts "Your linked list is already empty"
    end
  end

  def contains?(value)
    #iterate over each node to check value
    node = @head
    while node != nil
      if node.value == value
        return true
      end
      node = node.next_node
    end
    false
  end

  def find(value)
    #iterate over each node to find index of node that matches
    node = @head
    count = 0 
    while node != nil
      if node.value == value
        return count
      end
      node = node.next_node
      count += 1
    end
    nil
  end

  def to_s
    #shows string visual representation of linked list
    node = @head
    string = ""
    while node != nil
      string += "(#{node.value}) -> "
      node = node.next_node
    end
    puts string + "nil"
  end

  def insert_at(value, index)
    if index < 0
      puts "Please input positive number"
    elsif index > @size
      puts "you can't place a node here, no node before or after"
    elsif index == @size
      self.append(value)
      @size += 1
    elsif index == 0
      self.prepend(value)
    else
      #make a node pointing to current index and have index b4 point to new node 
      node = Node.new(value, self.at(index))
      self.at(index - 1).next_node = node
      @size += 1
    end
  end

  def remove_at(index)
    if index < 0
      puts "Please input positive number"
    elsif index > @size
      puts "node does not exist here"
    elsif index == 0
      #corner case case head pointer to the node after if deleting first node then delete node
      delete = self.at(index)
      @head = self.at(index + 1)
      delete.next_node = nil
      @size -= 1
    else
      #save the node to delete later... change prior node to point to node after index to delete then delete node
      delete = self.at(index)
      self.at(index - 1).next_node = self.at(index + 1)
      delete.next_node = nil
      @size -= 1
    end
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append("b")
list.prepend("a")
list.append("c")
list.to_s
puts list.size
puts list.find("c")
puts list.contains?("")
list.pop
list.to_s
puts list.at(1).value
puts list.tail.value
puts list.head.value
list.insert_at("insert", -1)
list.to_s
