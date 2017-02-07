require_relative "../base/Tableau"

module Operation
	def evacuation(tableau)
		tab = tableau.copy
		temp=[]
		tab.shape.each{|k|
			temp << Array.new(k)
		}

		tableau.size.times do
			num=tab[0][0]
			i=0
			j=0
			loop{
				if tab[i][j+1]#右にある
					if tab[i+1] && tab[i+1][j]#下にもある
						if tab[i][j]<tab[i+1][j]#普通のtableau
							if tab[i][j+1] < tab[i+1][j]#←の場合
								tab[i][j]=tab[i][j+1]
								j+=1
							else#↑の場合
								tab[i][j]=tab[i+1][j]
								i+=1
							end
						else#逆のtableau
							if tab[i][j+1] > tab[i+1][j]#←の場合
								tab[i][j]=tab[i][j+1]
								j+=1
							else#↑の場合
								tab[i][j]=tab[i+1][j]
								i+=1
							end
						end
					else#下にない
						tab[i][j]=tab[i][j+1]
						j+=1
					end
				else#右にない
					if tab[i+1] && tab[i+1][j]#下にある
						tab[i][j]=tab[i+1][j]
						i+=1
					else#右にも下にも無い
						tab[i].delete_at(j)
						temp[i][j]=num#REC
						break
					end
				end
			}
		end
		return Tableau.new(temp)
	end
	module_function :evacuation

	def evacuation_relabeled(tableau)
		max=tableau.flatten.max unless tableau.flatten.empty?
		tab=evacuation(tableau)
		for i in 0...tab.length
			for j in 0...tab[i].length
				tab[i][j]=max-tab[i][j]+1
			end
		end
		return tab
	end
	module_function :evacuation_relabeled
end