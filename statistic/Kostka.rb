require_relative "Statistic"

def Kostka(shape,weight)
	temp=[0]
	Tableau.set(shape,weight).each{|tab|
		c=Statistic.charge(tab.read.reverse)
		if temp[c]
			temp[c]+=1
		else
			temp[c]=1
		end
	}
	return temp.map {|e| e ? e:0}
end

def modified_Kostka(shape,weight)
	temp=[0]
	Tableau.set(shape,weight).each{|tab|
		c=Statistic.cocharge(tab.read.reverse)
		if temp[c]
			temp[c]+=1
		else
			temp[c]=1
		end
	}
	return temp.map {|e| e ? e:0}
end


