module Enumerable
	# Simple copy of the each method
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end

	# own solution for each_with_index
	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		self
	end

	# my select
	def my_select
       return self unless block_given?
       output=[]
       self.my_each {|x| output << x if yield(x)}
       return output  
    end

    # my_all? yes it is!
    def my_all?
    	return self unless block_given?
    	output=self.my_select {|x| yield(x)}
    	if output == self
    		return true
    	else
    		return false
    	end
    end

    # my_any? function righ away
    def my_any?
    	return self unless block_given?
    	output=self.my_select {|x| yield(x)}
    	return true unless output.length < 1
    	return false
    end

    # my_none? function
    def my_none?
    	return self unless block_given?
    	output=self.my_select {|x| yield(x)}
    	return true unless output.length > 0
    	return false
    end

    # my solution for the count function
    def my_count
    	return self.length unless block_given?
    	output = self.my_select {|x| yield(x)}
    	return output.length
    end

    # own solution to deal with map function
    def my_map
    	return self unless block_given?
    	output = []
    	output = self.my_each {|x| yield(x)}
    	return output
    end

    def my_map_with_proc
    	return self unless block_given?
    	output = []
    	output = self.my_each {|x| call(x)}
    	return output
    end

    # inject as never before
    def my_inject default=0
    	return default unless block_given?
    	result = default
    	self.my_each {|x| puts yield(default, x)}
    	return result
    end

end
# for testing my little inject
def multiply_els array
	return array.my_inject(1) {|x, y| x * y}
end

#puts [1,2,64,4,3].my_inject(4) {|x, y| x + y}
#puts multiply_els([2,4,5])