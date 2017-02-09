class Array
	def to_polynomial
		temp=[]
		self.each{|e|
			if e.is_a?(Array)
				temp << e.to_polynomial
			else
				temp << e
			end
		}
		return Polynomial.new(temp)
	end
end

class Polynomial < Array
	attr_reader :number_of_variables
	def initialize(x=0,*y)
		super(x,*y)
		@number_of_variables=1

		if !self.empty?
			e=self[self.index{|k| k}]
		end
		if e.instance_of?(Polynomial)
			@number_of_variables=e.number_of_variables+1
		end
		if e.class == Polynomial
			self.each{|item|
				unless item.class==e.class and item.number_of_variables==e.number_of_variables
					raise "different number of variables"
				end
			}
		else
			self.each{|item|
				if item and item.class!=e.class
					raise "different class"
				end
			}
		end
	end

	def + (other)
		raise "different number of variables." unless @number_of_variables==other.number_of_variables
		temp=[]
		for i in 0...[self.length,other.length].max
			if self[i]
				if other[i]
					temp[i] = self[i]+other[i]
				else
					temp[i] = self[i]
				end
			else
				temp[i] = other[i]
			end
		end
		return temp.to_polynomial
	end

	def * (other)
		raise "different number of variables." unless @number_of_variables==other.number_of_variables
		temp=[]
		for i in 0...self.length
			for j in 0...other.length
				if self[i] and other[j]
					if temp[i+j]
						temp[i+j]+=self[i]*other[j]
					else
						temp[i+j] = self[i]*other[j]
					end
				end
			end
		end
		return temp.to_polynomial
	end

	def print_(variables,log=[])
		raise "number of variables is too small." unless @number_of_variables<=variables.size
		for i in 0...self.length do
			if self[i]
				log_=log.dup
				log_.unshift(i)
				if self[i].instance_of?(Polynomial) then
					self[i].print_(variables,log_)
				else

#					p [self[i],log_]
					if self[i]!=0
						if self[i]>1
							print "+"
						end
						if log_.all?{|e| e==0}
							if self[i]==1
								print "+",self[i].to_s
							else self[i]==-1
								print self[i].to_s
							end
						elsif self[i]==1
							print "+"
						elsif self[i]==-1
							print "-"
						else
							print self[i].to_s
						end

						for i in 0...log_.length
							if log_[i]>0
								print variables[i]
								if log_[i]>1
									print "^"+log_[i].to_s
								end
							end
						end
						print " "
					end

				end
			end
		end
		print "\n" if log.empty?
	end
end


