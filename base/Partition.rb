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
		if self.empty?
			return [Partition.new([k])]
		end
		n=self.size
		temp = []
		Partition.set(n+k).each{ |par|
			flag = true
			unless par.length<=self.length+1 and par[0]>=self[0] then
				flag=false
			end
			for i in 1..self.length do
				if i == self.length then
					unless par[i]==nil or par[i]<=self[i-1] then
						flag = false
					end
				else
					unless (par[i]!=nil) and par[i]>=self[i] and par[i]<=self[i-1] then
						flag = false
					end
				end
			end
			if flag then
				temp<<par
			end
		}
		return temp
	end

	def set_plus_vertical_strip_of_size(k)
		return self.transpose.set_plus_horizontal_strip_of_size(k).map{|k| k.transpose}
	end

end


