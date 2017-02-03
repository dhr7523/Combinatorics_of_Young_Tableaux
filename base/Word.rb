require_relative "Composition"

class Array
	def to_word
		return Word.new(self)
	end
end

class Word < Array
	def initialize(x=0,*y)
		super(x,*y)
		unless self.empty? || self.all?{|item| item.is_a?(Integer) and item>0}
			raise "arg:"+String(self)
		end
	end

	def self.set(weight)
		unless weight.is_a?(Composition)
			raise "argument should be a composition."
		end
		if weight==[]
			return []
		elsif weight.all?{|item|item==0}
			return [Word.new()]
		else
			n=weight.size
			weight =weight.take(weight.rindex{|k| k>0}+1)
			temp=[]
			num = weight.length
			weight[num-1]-=1
			Word.set(weight).each{|preword|
				min = 0
				min = preword.rindex(num)+1 if preword.include?(num)
				for i in min..preword.length
					temp << Word.new(Array.new(preword).insert(i,num))
				end
			}
			return temp
		end
	end

	def weight
		weight=[]
		self.each{|k|
			if weight[k-1] then
				weight[k-1]+=1
			else
				weight[k-1]=1
			end
		}
		return weight.map{|item|item==nil ?	0: item}.to_composition
	end

	def reverse
		return super.to_word
	end
end



