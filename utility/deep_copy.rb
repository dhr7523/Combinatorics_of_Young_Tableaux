class Array
	def deep_copy
		return Marshal.load(Marshal.dump(self))
	end
end

class Array
	def deep_copy_
		if self.instance_of?(Array)
			newarr=[]
			for i in self
				if i.instance_of?(Array)
					newarr << i.deep_copy_
				else
					newarr << i
				end
			end
			return newarr
		else
			return self
		end
	end
end
