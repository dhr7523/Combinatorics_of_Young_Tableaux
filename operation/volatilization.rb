require_relative "../base/Tableau"

module Operation
	def volatilization(tableau)
		if tableau.length>1 && tableau[0][0]<tableau[1][0]
			normal_flag=true
		else
			normal_flag=false
		end
		max=tableau.flatten.sort.last
		tab = tableau.copy
		temp=[]
		tab.shape.each{|k|
			temp << Array.new(k)
		}
		tableau.size.times do
			num=max
			num=0 if normal_flag
			index=0
			tab.each_with_index{|row,h|
				if normal_flag
					if row.last && row.last>=num
						num=row.last
						index=h
					end
				else
					if row.last && row.last<=num
						num=row.last
						index=h
					end
				end
			}
			i=index
			j=tab[index].length-1

			loop{
				if j>0 && tab[i][j-1]#左にある
					if i>0 && tab[i-1] && tab[i-1][j]#上にもある
						if tab[i][j]>tab[i-1][j]#普通のtableau
							if tab[i][j-1] > tab[i-1][j]#→の場合
								tab[i][j]=tab[i][j-1]
								j-=1
							else#↓の場合
								tab[i][j]=tab[i-1][j]
								i-=1
							end
						else#逆のtableau
							if tab[i][j-1] < tab[i-1][j]#→の場合
								tab[i][j]=tab[i][j-1]
								j-=1
							else#↓の場合
								tab[i][j]=tab[i-1][j]
								i-=1
							end
						end
					else#上にない
						tab[i][j]=tab[i][j-1]
						j-=1
					end
				else#左にない
					if i>0 && tab[i-1] &&  tab[i-1][j]#上にある
						tab[i][j]=tab[i-1][j]
						i-=1
					else#左にも上にも無い
						tab[i][j]=nil
						temp[i][j]=num#REC
						break
					end
				end
			}
		end
		return Tableau.new(temp)
	end
	module_function :volatilization

	def volatilization_relabeled(tableau)
		max=tableau.flatten.max unless tableau.flatten.empty?
		tab=volatilization(tableau)
		for i in 0...tab.length
			for j in 0...tab[i].length
				tab[i][j]=max-tab[i][j]+1
			end
		end
		return tab
	end
	module_function :volatilization_relabeled
end
