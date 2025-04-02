class Qaudro
	def num_sides
		4
	end
end

class Square < Qaudro
	def sides_parallel
		true
	end

	def sides_equal_length
		true
	end
end

class Trapez < Qaudro
	def sides_parallel
		false
	end

	def sides_equal_length
		false
	end
end

puts ''
puts '*****'
puts ''

quad = Qaudro.new    # same as Quadrilateral quad = new Quadrilateral(); in java


puts "I am a quadrilateral"
print "I have this many sides:"
puts quad.num_sides 

puts '*****'

sq = Square.new

puts "I am a Square"
print "I have this many sides"
puts sq.num_sides
print "All of my opposite sides are parallel: "
puts sq.sides_parallel
print "All of my opposite sides are equal in length: "
puts sq.sides_equal_length

puts '******'

trap = Trapez.new

puts "I am a Trapezoid"
print "I havbe this many sides"
puts trap.num_sides
print "All of my opposite sides are parallel: "
puts trap.sides_parallel
print "All of my opposite sides are equal length: "
puts trap.sides_equal_length

puts ' '
puts '*****'
puts ' '