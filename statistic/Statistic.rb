require_relative "../base/Tableau"

module Statistic
	def a_function(lambda)
		raise "not composition:"+lambda.to_s unless lambda.is_a?(Composition)
		sum=0
		for i in 0...lambda.length
			sum += i*lambda[i] if lambda[i]
		end
		return sum
	end
	module_function :a_function

	def charge(w)
		word=w.dup
		raise "not Word:"+word.class.to_s	unless word.is_a?(Word)
		begin
			weight_t = Partition.new(word.weight).transpose
		rescue
			raise "weight is not partition:"+word.weight.to_s
		end
		charge = 0
		weight_t.each{|max|
			current = 1
			loop = 0
			while current != max+1
				for index in 0...word.length
					if word[index] == current
						current +=1
						word[index] = nil
						charge += loop
					end
				end
				loop += 1
			end
		}
		return charge
	end
	module_function :charge

	def cocharge(word)
		return a_function(word.weight)-charge(word)
	end
	module_function :cocharge

	def major_sum(word)
		sum = 0
		for i in 1...word.length
			if word[i-1] > word[i]
				sum+=i
			end
		end
		return sum
	end
	module_function :major_sum

	def inversion_sum(word)
		num=0
		for i in 0 ... word.length-1
			for j in i+1 ... word.length
				if word[i] > word[j]
					num+=1
				end
			end
		end
		return num
	end
	module_function :inversion_sum
end

