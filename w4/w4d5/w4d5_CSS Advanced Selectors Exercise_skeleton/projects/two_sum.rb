require 'byebug'

# two_sum?
# Given an array of unique integers and a target sum, 
# determine whether any two integers in the array sum to that amount.

def two_sum?(arr, target_sum)
    res = []
    (0...arr.length).each do |i| 
        (i+1...arr.length).each do |j| 
        res << [i,j] if arr[i] + arr[j] == target_sum
        end 
    end 
    
  res
end
# (0...arr.length).each do |i|
#   (i + 1...arr.length).each do |j|
#     return true if arr[i] + arr[j] == target_sum
#   end
# end

# false
# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false



def two_sum?(arr, target_sum)
    new_arr = arr.sort 
    res = [] 

    (0...new_arr.length-1).each do |i| 
      res << [i,i+1]  if new_arr[i] + new_arr[i+1] == target_sum 
    end 

   res
end
# new_arr = arr.sort 

# (0...new_arr.length - 1).each do |i| 
#   return true if new_arr[i] + new_arr[i+1] == target_sum
# end 

# false 
# arr = [0,5,7,1]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false




# Sorting
# As a person of elevated algorithmic sensibilities, the brute-force approach 
# is beneath you. Leave that nonsense to the riffraff. 
# Instead, you'll apply a refined and time-honored technique: sorting.

# Sort your data, then try to solve the problem.

# What does sorting do to the lower bound of your time complexity?
# How might sorting that make the problem easier?
# Write a second solution, called okay_two_sum?, which uses sorting.
# Make sure it works correctly.

# Hint: (There are a couple ways to solve this problem once it's sorted. 
# One way involves using a very cheap algorithm that can only be used on sorted 
# data sets. What are some such algorithms you know?)



# 5 => 5

# key
# whose value 5
# exists as another key



# Hash Map
# Finally, it's time to bust out the big guns: a hash map. 
# Remember, a hash map has O(1) #set and O(1) #get, 
# so you can build a hash out of each of the n elements in your array in O(n) 
# time. That hash map prevents you from having to repeatedly find values in the 
# array; now you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, 
# using your hash map.

# Once you're finished, make sure you understand the time complexity 
# of your solutions and then call over your TA and show them what you've got. 
# Defend to them why each of your solutions has the time complexity you claim 
# it does.

# Bonus (come back to this once you have completed
def two_sum?(arr, target_sum)
    hash = Hash.new 

    arr.each do |num| 
      return true if hash[target_sum - num]
      hash[num] = true 
    end 

    false 
end
# hash_map = {} 

# arr.each do |n| 
#   return true if hash_map[target_sum - n]
#   hash_map[n] = true 
# end 
# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false




def two_sum_indices(arr, target_sum)
    hash = Hash.new 
    res = [] 

    arr.each_with_index do |num, i| 
      res << [hash[target_sum- num], i] if hash[target_sum-num]
    hash[num] = i 
    end 

    res 
end

arr = [0, 1, 5, 7]
arr2 = [-4, 4, -5, 5]
p two_sum_indices(arr, 6) # => [[1,2]]
p two_sum_indices(arr, 0) # => should be false  
# hash_map = {} 
#     result = [] 

#     arr.each_with_index do |n, i| 
#       next_num = target_sum - n 
#       result << [hash_map[next_num],i] if hash_map[next_num]
#       hash_map[n] = i 
#     end 
    
#     result 
# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false


# def two_sum_indices(arr, target_sum)
#   complements = {}
#   arr.each_with_index do |el, i|
#     complement, j = complements[target_sum - el] # these will both be nil if the complement doesn't exist
#     return [j, i] if complement
#     complements[el] = [el, i]
#   end
#   nil
# end
  
# arr = [0, 1, 5, 7]
# arr2 = [-4, 4, -5, 5]
# p two_sum_indices(arr, 6) # => [[1,2]]
# p two_sum_indices(arr, 0) # => should be false  