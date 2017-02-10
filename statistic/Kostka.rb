require_relative "Statistic"
require_relative "Polynomial"

module Kostka
	def polynomial(shape,weight)
		temp=[0]
		Tableau.set(shape,weight).each{|tab|
			c=Statistic.charge(tab.read.reverse)
			if temp[c]
				temp[c]+=1
			else
				temp[c]=1
			end
		}
		return Polynomial.new(temp)
	end
	module_function :polynomial

	def modified(shape,weight)
		temp=[0]
		Tableau.set(shape,weight).each{|tab|
			c=Statistic.cocharge(tab.read.reverse)
			if temp[c]
				temp[c]+=1
			else
				temp[c]=1
			end
		}
		return Polynomial.new(temp)
	end
	module_function :modified
end

