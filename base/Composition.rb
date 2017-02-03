class Array
	def to_composition
		return Composition.new(self)
	end
end

class Composition < Array
	def initialize(x=0,*y)
		super(x,*y)
		self.each_index{|i| self[i]=0 unless self[i] }
		for i in 1..self.length
			if self[self.length-i]==0
				self[self.length-i]=nil
			else
				break
			end
		end
		self.compact!

		unless self.empty? || self.all?{|item| item.is_a?(Integer) and item>=0}
			raise "arg:"+String(self)
		end
	end

	def size
		sum = 0
		self.each{|item| sum+=item}
		return sum
	end

	def + (other)
		temp=[]
		for i in 0...[self.length,other.length].max
			if self[i]
				if other[i]
					temp << self[i]+other[i]
				else
					temp << self[i]
				end
			else
				temp << other[i]
			end
		end
		return temp.to_composition
	end

	def concat (other)
		return super(other).to_composition
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


