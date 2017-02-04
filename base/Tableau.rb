require_relative "Partition"
require_relative "Word"

class Array
	def to_tableau
		return Tableau.new(self)
	end
end

class Tableau < Array
	def initialize(x=0,*y)
		super(x,*y)
		self.shape
	end

	def size
		return self.shape.size
	end

	def shape
		return Partition.new(self.collect{|i| i.length})
	end

	def weight
		temp = []
		self.flatten.each{|i|
			temp[i-1]? temp[i-1] += 1 : temp[i-1] =1
		}
		return temp.to_composition
	end

	def copy
		return Marshal.load(Marshal.dump(self)).to_tableau
	end

	def self.set(shape,weight)
		shape=shape.to_partition
		weight=weight.to_composition
		unless shape.size==weight.size
			raise "shape of size "+String(shape.size)+", weight of size "+String(weight.size)
		end
		set = [Tableau.new([])]
		for j in 0...weight.length do
			tempset=[]
			set.each{|tab|
				tab.shape.set_plus_horizontal_strip_of_size(weight[j]).each{|par|
					if par.length<=shape.length && Array.new(par.length){|m|m}.all?{|k| par[k]<=shape[k]}
						newtab = tab.copy
						for i in 0...par.length do
							if tab[i]  then
								(par[i]-tab.shape[i]).times{newtab[i]<<j+1}
							else
								newtab[i]=Array.new(par[i],j+1)
							end
						end
						tempset<<newtab
					end
				}
			}
			set=tempset
		end
		return set
	end

	def transpose
		return self if self.empty?
		temp = Tableau.new()
		self[0].length.times{temp<<Array.new()}
		for i in 0...self.length do
			for j in 0...self[i].length do
				temp[j][i]=self[i][j]
			end
		end
		return temp
	end

	def read
		return Word.new(self.reverse.flatten)
	end

	def read_row
		tab = self.copy
		temp=[]
		for i in 1..tab.weight.length  do
			for j in 1..tab.length do
				if tab[tab.length-j].include?(i)
					tab[tab.length-j].count(i).times{
						temp << tab.length-j+1
					}
				end
			end
		end
		return temp.to_word
	end

	def is_semistandard?
		flag=true
		for i in 0...self.length do
			for j in 0...self[i].length do
				if self[i][j+1] and self[i][j]>self[i][j+1] then
					flag=false
				end
				if self[i+1] and self[i+1][j] and self[i][j]>=self[i+1][j] then
					flag=false
				end
			end
		end
		return flag
	end

	def print_diagram
		print "φ\n" if self.empty?
		self.each{|k|
			k.each{|m|
				if m == nil
					print "@"
				else
					print m," "
				end
			}
			print "\n"
		}
	end
end

