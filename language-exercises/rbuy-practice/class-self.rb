<<<<<<< HEAD
class String 
	def is_all_uppercase?
		return self == self.upcase 
	end
end

str1 = "abdc"
=======
class String
	def is_all_uppercase?
		return self == self.upcase
	end
end

str1 = "abcd"
>>>>>>> 120f6d62ca2c79ec8990226df626bc07d0699be6
str2 = "aBcD"
str3 = "ABCD"

puts "str1 is all uppercase : #{str1.is_all_uppercase?}"
puts "str2 is all uppercase : #{str2.is_all_uppercase?}"
puts "str3 is all uppercase : #{str3.is_all_uppercase?}"

<<<<<<< HEAD

puts 
puts "*************"
puts 
=======
puts "******"
>>>>>>> 120f6d62ca2c79ec8990226df626bc07d0699be6

class Person
	attr_accessor :fullname
	attr_accessor :age

<<<<<<< HEAD
	def initialize(name,age)
=======
	def initialize(name, age)
>>>>>>> 120f6d62ca2c79ec8990226df626bc07d0699be6
		@fullname = name
		@age = age
	end

	def to_s
		"#{@fullname}, age #{@age}"
	end

	def capitalize_name
		return @fullname.upcase
	end
<<<<<<< HEAD
end

=======

	def capitalize_name!
		@fullname = @fullname.upcase
		return @fullname.upcase
	end

	def is_same_person?(p)
		return self.to_s == p.to_s
	end

end

p = Person.new("SHREYAS GUNE",24)
puts p
puts p.capitalize_name
puts p
puts p.capitalize_name!
puts p

puts "*******************"

p2 = Person.new("Mastodon",42)
p3 = Person.new("SHREYAS GUNE",24)

puts "p and p2 are the same person: #{p.is_same_person?(p2)}"
puts "p and p3 are the same person: #{p.is_same_person?(p3)}"


>>>>>>> 120f6d62ca2c79ec8990226df626bc07d0699be6

