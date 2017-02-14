require_relative "Composition"

class Array
	def to_partition
		return Partition.new(self)
	end
end

class Partition < Composition
	def initialize(x=0,*y)
		super(x,*y)
		unless self.empty? || (self[0]>=1 and self==self.sort.reverse )
			raise "arg:"+String(self)
		end
	end

	def transpose
		return self if self.empty?
		temp = Array.new(self[0])
		for i in 0...self[0]
			num=0
			self.each{|j|
				if i+1<=j then
					num+=1
				end
			}
			temp[i]=num
		end
		return Partition.new(temp)
	end

	def + (other)
		return super(other).to_partition
	end

	def concat(other)
		return super(other).sort{|a, b| b <=> a }.to_partition
	end

	def outer_corners_indices
		temp = [0]
		if self.length != 0
			for i in 1...self.length
				if self[i] < self[i-1]
					temp << i
				end
			end
			temp << self.length
		end
		return temp
	end

	def self.set(n)
		if n==0 then
			return [Partition.new([])]
		else
			temp=[]
			self.set(n-1).each{|item|
				for j in item.outer_corners_indices
					new_partition = Array.new(item)
					if new_partition[j]
						new_partition[j] += 1
					else
						new_partition[j] = 1
					end
					new_partition = Partition.new(new_partition)
					if !temp.include?(new_partition) then
						temp << new_partition
					end
				end
			}
			return temp
		end
	end


	def set_plus_horizontal_strip_of_size(k)
				return self.transpose.set_plus_vertical_strip_of_size(k).map{|k| k.transpose}
	end

	def set_plus_vertical_strip_of_size(k,i=0)
		return [self]	if k==0
		temp=[]
		for j in i..self.length
			if j==0 or j==self.length or self[j-1]>self[j]
				new_p=Partition.new(self)
				new_p[j] = j==self.length ? 1 : new_p[j]+=1
				temp.concat(new_p.set_plus_vertical_strip_of_size(k-1,j+1))
			end
		end
		return temp
	end

	def set_minus_horizontal_strip_of_size(k)
				return self.transpose.set_minus_vertical_strip_of_size(k).map{|k| k.transpose}
	end

	def set_minus_vertical_strip_of_size(k,i=0)
		return [] if k > self.length
		return [self]	if k==0
		temp=[]
		for j_ in i...self.length
			j=self.length-j_-1
			if j==self.length-1 or self[j]>self[j+1]
				new_p=Partition.new(self)
				if self[j]==1
					new_p.pop
					j_-=1
				else
					new_p[j] -=1
				end
				temp.concat(new_p.set_minus_vertical_strip_of_size(k-1,j_+1))
			end
		end
		return temp
	end
end