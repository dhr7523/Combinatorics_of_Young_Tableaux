class Array
	def to_composition
		return Composition.new(self)
	end
end

class Composition < Array
	def initialize(x=0,*y)
		super(x,*y)
		self.each_index{|i| self[i]=0 unless self[i] }

		unless self.empty? || self.all?{|item| item.is_a?(Integer) and item>=0}
			raise "arg:"+String(self)
		end
	end

	def size
		sum = 0
		self.each{|item| sum+=item}
		return sum
	end

	def print_diagram
		if self.empty?
			print "φ\n"
		else
			self.each{|item|
				item.times{print "□"}
				print "\n"
			}
		end
	end
end


