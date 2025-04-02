class Node

	attr_accessor :value, :next_node

	def initialize val,next_in_line
		@value = val
		@next_node = next_in_line
		puts "initialized a Node with Value : "+value.to_s
	end
end

class LinkedList
	def initialize val
		#initialize a new node at head
		@head = Node.new(val,nil)
	end

	def add(value)
		#traverse to the end of the list
		#insert a new node obver there with some data
		current = @head
		while current.next_node != nil
			current = current.next_node
		end
		current.next_node = Node.new(value,nil)
		self
	end

	def delete(val)
		current = @head
		if current.value == val 
			@head = @head.next_node
		else
			current = @head
			while (current!=nil)&&(current.next_node!=nil)&&(((current.next_node).val)!=val)
				current = current.next_node
			end

			if(current!= nil)&& (current.next_node!= nil)
				current.next_node= (current.next_node).next_node
			end
		end
	end

	def display
		#traversing to the end
		current = @head
		full_list = []
		while current.next_node != nil
			full_list += [current.value.to_s]
			current = current.next_node
		end
		full_list += [current.value.to_s]
		puts full_list.join("->")
	end
end


ll = LinkedList.new(5)

ll.add(10)
ll.add(20)

puts "Dsiplaying the Linked List"
ll.display

puts "Delete 10 and then display"
ll.delete(10)
ll.display

