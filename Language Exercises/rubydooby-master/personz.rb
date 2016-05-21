class Person
	attr_accessor :fname
	attr_accessor :lname
	attr_accessor :age

	def initialize(f,l,a)
		@fname = f
		@lname = l
		@age = a
	end

	def to_s
		"#{@fname} #{@lname}, age #{@age}"
	end

	def over_the_hill?
		return false if @age < 20
		true
	end 
end


p = Person.new("Shreyas", "Gune", 25)
puts p

puts "#{p.fname} is over the hell : #{p.over_the_hill?}"
# p = Person.new
# p.fname = "Shreyas"
# p.lname = "Gune"
# p.age = 24
# puts p

# #change first name
# p.fname = "Shrey"

# #change age
# p.age = 25
# puts p

