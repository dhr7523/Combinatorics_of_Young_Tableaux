require_relative "../base/Tableau"

module Operation
	def insertion (tableau,num)
		tab = tableau.copy
		if tab == []
			return Tableau.new([[num]])
		end

		for i in 0... tab.length
			if tab[i][tab[i].length - 1] <= num
				tab[i] << num
				return tab
			else
				for j in 0 ... tab[i].length
					if tab[i][j] > num
						temp = num
						num = tab[i][j]
						tab[i][j] = temp
						if i == tab.length - 1
							tab << [num]
							return tab
						end
						break
					end
				end
			end
		end
	end
	module_function :insertion

	def RSK (x,y)
		raise "args should be words." unless x.is_a?(Word) && y.is_a?(Word)
		raise "args have different length." unless  x.length==y.length
		tab = Tableau.new([])
		rec = Tableau.new([])
		for i in 0...x.length
			newtab=insertion(tab,x[i])

			if newtab.length>tab.length
				rec << [y[i]]
			else
				for j in 0...tab.length
					if newtab[j].length>tab[j].length
						rec[j] << y[i]
						break
					end
				end
			end
			tab = newtab
		end
		return [tab,rec]
	end
	module_function :RSK
end


