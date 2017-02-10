class Array
	def to_polynomial
		lens=self.map{|e| e[1].length}.uniq
		unless lens.length==1
			raise "different number of variables. arg:"+self.to_s
		end
		temp=[]
		if lens[0]==0
			return self[0][0]
		else
			self.map{|term| term[1].last}.uniq.each{|d|
				temp[d]=self.select{|term|term[1].last==d}.map{|term| [term[0],term[1].first(term[1].length-1)]}.to_polynomial
			}
		end
		return Polynomial.new(temp)
	end
end

class Polynomial < Array
	attr_reader :number_of_variables
	def initialize(x=0,*y)
		super(x,*y)
		@number_of_variables=1

		self << nil if self.empty?

		for i in 0...self.length
			if self[i] and self[i].is_a?(Array)
				self[i] = Polynomial.new(self[i])
				@number_of_variables=self[i].number_of_variables+1
			elsif self[i]==0
				self[i]=nil
			end
		end
		if @number_of_variables>1
			self.each{|item|
				if item and (!item.instance_of?(Polynomial) or item.number_of_variables!=@number_of_variables-1)
					raise "different number of variables. arg:"+self.to_s
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
		return Polynomial.new(temp)
	end

	def - (other)
		raise "different number of variables." unless @number_of_variables==other.number_of_variables
		temp=[]
		for i in 0...[self.length,other.length].max
			if self[i]
				if other[i]
					temp[i] = self[i]-other[i]
				else
					temp[i] = self[i]
				end
			else
				temp[i] = -other[i]
			end
		end
		return Polynomial.new(temp)
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
		return Polynomial.new(temp)
	end

	def to_array(log=[])
		temp=[]
		for i in 0...self.length do
			if self[i]
				log_=log.dup
				log_.unshift(i)
				if self[i].instance_of?(Polynomial) then
					temp.concat(self[i].to_array(log_))
				elsif self[i] and self[i]!=0
					temp << [self[i],log_]
				end
			end
		end
		return temp
	end

	def permute_variables(perm)
		unless perm.sort==Array.new(@number_of_variables){|i| i}
			raise "incrrect permutation:"+ perm.to_s
		end
		arr=self.to_array
		for i in 0...arr.length
			term=Array.new(@number_of_variables){|g| arr[i][1][perm.index(g)]}
			arr[i]=[arr[i][0],term]
		end
		return arr.to_polynomial
	end

	def degree_of_leading_terms
		arr= self.to_array
		max_deg=arr.max{|a,b| a[1].inject(:+) <=> b[1].inject(:+)}[1].inject(:+)
		return arr.select{|a| a[1].inject(:+)==max_deg}.map{|a| a[1]}
	end
	def to_string(variables)
		if variables.is_a?(Array)
			if @number_of_variables>variables.size
				raise "number of variables is too small."
			end
		else
			variables=Array.new(@number_of_variables){|h| variables+"_"+(h+1).to_s}
		end

		temp=""
		arr=self.to_array
		for i in 0...arr.length

			temp += " "

			if i!=0 and arr[i][0]>0
				temp += "+"
			elsif arr[i][0]<0
				temp += "-"
			end

			if arr[i][1].all?{|e| e==0}
				if arr[i][0]==1 or arr[i][0]==-1
					temp +=arr[i][0].to_s
				end
			elsif arr[i][0]==1
			elsif arr[i][0]==-1
			else
				temp += arr[i][0].abs.to_s
			end

			for j in 0...arr[i][1].length
				if arr[i][1][j]>0
					temp += variables[j]
					if arr[i][1][j]>1
						temp += "^"+arr[i][1][j].to_s
					end
				end
			end
		end
		if temp==""
			return " 0"
		else
			 return temp
		end
	end
end


