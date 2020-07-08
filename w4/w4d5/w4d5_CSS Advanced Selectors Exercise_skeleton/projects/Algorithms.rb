# my_min
# Given a list of integers find the smallest number in the list.

require "byebug"

# def n2_my_min(arr)
#     # debugger
#     arr.each_with_index do |el_1, i1|
#         smallest = true
#         arr.each_with_index do |el_2, i2| 
#             smallest = false if i2 > i1 && el_2 < el_1   
#         end

#         return el_1 if smallest
#     end 
# end


def n2_my_min(arr) 
    
    (0...arr.length).each do |i| 
      min = true 
      (i+1...arr.length).each do |j|
        min = false if arr[j] < arr[i] 
      end 
      return arr[i] if min 
    end 
end 


# list = [2,1,3,-1]
# p n2_my_min(list) 
# list = [0, 3, 5, 4, -5, 10, 1, 90]
# p n2_my_min(list)  # =>  -5
# res = arr.first


def linear_my_min(arr)
    res = arr.first 
  
    arr.each {|n| res = n if res > n} 
    res 
end

# list = [0, 3, 5, 4, -5, 10, 1, -100, 90]
# p linear_my_min(list)  # =>  -5


# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity?


# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous 
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays 
# and return the max.
# subset = [] 

# (0...list.length).each do |idx_1|
#     (idx_1...list.length).each do |idx_2| 
#         subset << list[idx_1..idx_2].sum 
#     end 
# end 
# subset.max 
# Example:

def n3_largest_contiguous_subsum(list)
    res = []

   (0...list.length).each do |i| 
      (i...list.length).each do |j| 
        res << list[i..j].sum 
      end 
    end
    
    res.max 
end 

# list = [5, 3, -7]
# p n3_largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p n3_largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p n3_largest_contiguous_subsum(list) # => -1 (from [-1])
# max_sum = list.first
# current_sum = 0

# #   debugger
# list.each do |num|
#   current_sum += num
#   if current_sum >= max_sum
#     max_sum = current_sum
#   elsif current_sum < 0   
#     current_sum = 0
#     max_sum = num if max_sum < num
#   end
# end

# max_sum

def linear_largest_contiguous_subsum(list)
    max = list.first 
    current = 0 
    
    list.each do |num| 
      current += num 
      if current > max 
         max = current 
      elsif current < 0 
         current = 0 
        max = num if max < num 
      end 
    end 
  max 
end

# list = [5, 3, -7]
# p linear_largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p linear_largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p linear_largest_contiguous_subsum(list) # => -1 (from [-1])


# max_sum = arr.first
# current_sum = ?? 
# arr.index current_max += arr[i]
  # if current_sum >
  #   max = current
# [1,-1,2] 
# current_sum = 2 
# max_sum = 2  
    # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 8
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

# Phase I
# Write a function that iterates through the array and finds all
# sub-arrays using nested loops. First make an array to hold all sub-arrays.
# Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, 
# consider using two variables. One variable should track the largest sum so far and 
# another to track the current sum. We'll leave the rest to you.
