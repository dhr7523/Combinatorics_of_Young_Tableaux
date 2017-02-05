def check_with_error_expected(error_is_expected)
	puts "==========Start=========="
	begin
		yield
		if error_is_expected
			puts "##########Error is expected!##########"
		else
			puts "==========OK=========="
		end
	rescue=>e
		if error_is_expected
			print "==========Expected Error==========\n"
			puts e.backtrace[0]
			puts e.message
		else
			print "##########Unexpected Error!##########\n"
			puts e.backtrace[0]
			puts e.message
		end
	end
end
