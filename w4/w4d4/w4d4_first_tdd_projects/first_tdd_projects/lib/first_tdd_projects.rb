# Remove dups
# Array has a uniq method that removes duplicates from an array. 
# It returns the unique elements in the order in which they first appeared:
# Write your own version of this method called my_uniq; 
# it should take in an Array and return a new array.
# Example
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]

class Array 

    def my_uniq
        new_array = [] 
        self.each {|el| new_array << el unless new_array.include?(el)}
        new_array 
    end 

end 

# arr = [1,2,3,4,4,4,3,2,6,7,7,8,8,9]
# arr.my_uniq


# Two sum
# Write a new Array#two_sum method that finds all pairs of positions 
# where the elements at those positions sum to zero.
# NB: ordering matters. 
# We want each of the pairs to be sorted smaller index before bigger index. 
# We want the array of pairs to be sorted "dictionary-wise":
# Example
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)

class Array

    def two_sum
        pairs=[]
        (0...self.length).each do |i|
            (i...self.length).each do |j|
                pairs<<[i,j] if (self[i]+self[j]).zero? 
            end
        end
        pairs
    end
end

def my_transpose(matrix)
    height = matrix.length
    (0...height).map do |i| 
        matrix.map.with_index do |el,j| 
            matrix[j][i] 
        end 
    end 
end 


# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), 
# and outputs the most profitable pair of days on which to first buy the stock 
# and then sell the stock. Remember, you can't sell stock before you buy it!

def stock_picker(arr)
    profit=0
    i=0
    while i < arr.length
        j=i+1
        while j < arr.length
            if arr[j]-arr[i]>profit
                profit=arr[j]-arr[i]
                buy_day=i
                sell_day=j
            end
            j+=1
        end
        i+=1
    end
    [buy_day,sell_day]
end




class Towers 
    attr_reader :n, :discs, :board

    def initialize(n)
        @n = n
        @discs = (1..n).to_a 
        @board = Hash.new {|h,k| h[k] = []} 
        %i(A B C).each { |el| el==:A ? @board[el]=@discs : @board[el] }
    end 

    def move 
        input = gets.chomp.map(&:to_sym).split("")
        start, last = input # start= :A or :B or :C  and last= :A or :B or :C
        
        until @board[start].nil?   
            puts "The starting position was empty, please choose another spot"
            input = gets.chomp.map(&:to_sym).split("")
            start, last = input 
        end 
        
        if @board[last].empty?
            disc = @board[start].shift 
            @board[last].unshift(disk)
            return
        end

        unless @board[start].first > @board[last].first 
            disc = @board[start].shift 
            @board[last].unshift(disk)  
        end 
    end 
    

end 