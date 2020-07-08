# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.
# Exponentiation
# Write two versions of exponent that use two different recursions:

def range(start_point, end_point) 
    return [start_point] if start_point == end_point - 1 
    range(start_point, end_point - 1) << end_point - 1
end

# p range(1, 5) 
# p range(2, 7)
# # this is math, not Ruby methods.
def exp(num, exp)  #32 , 31 , 30, 29, 28 ..........
    if exp == 0 
        return 1  
    else
        num * exp(num, exp - 1)
    end 
end 

# p exp(2, 5)
# p exp(4, 4)
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
# exp(2, 4) = exp(2 * 2, 2)
# exp(2, 5) = 2 * exp(2 * 2, 2) 

def exp(num, exp)  #2 ^ 32     32 / 2 = 16    16 / 2 = 8   8 / 2 = 4   4/ 2 = 2   2 / 2 = 1
    if exp == 0 
        return 1 
    elsif exp.even? 
        return exp(num * num, exp /  2 )
    else  
        return num * exp(num * num, (exp - 1) /2 ) 
    end 
end 
# p exp(2, 5)
# p exp(4, 4)

# # recursion 2
# exp(b, 0) = 1 
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

# Deep dup
# The #dup method doesn't make a deep copy:
                    
def deep(array) 
    # return [] if array.empty?
    new_array = []

    array.each do |sub| 
        # new_array = []
        if sub.is_a?(Array) 
            new_array << deep(sub)
        else  
            new_array << sub  
        end 
    end 

    return new_array
end
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = deep(robot_parts)
# robot_parts[1] << 'LEDs'
# p robot_parts
# p robot_parts_copy

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# Fibonacci
def Fibonacci(num)
    if num == 0 
        return []
    elsif num == 1 
        return [1]
    elsif num == 2 
        return [1, 1]
    end 

    res = Fibonacci(num-1) 
    res << res[-1] + res[-2]
    res 
end 

# p Fibonacci(0)
# p Fibonacci(1) # 1 
# p Fibonacci(2) # 1 
# p Fibonacci(3) # 2  
# p Fibonacci(4) # 5 
# p Fibonacci(5) # 8 
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:
#low = 0
#high = length - 1
#mid = (low + high) / 2

# def binary_search_helper(array, target_num, low, high)
#     mid = (low + high) / 2

#     if array[mid] == target_num 
#         return mid
#     elsif high < low 
#         return nil 
#     end #

#     if array[mid] > target_num  
#         high = mid - 1 
#         return binary_search_helper(array, target_num, low, high)
#     elsif array[mid] < target_num 
#         low = mid + 1
#         return binary_search_helper(array, target_num, low, high)
#     end  
# end

# require "byebug"
def bsearch(array, target_num)
    mid = array.length / 2 #3

    if array.empty? 
        return nil
    elsif array[mid] == target_num 
        return mid 
    end 
    
    if array[mid] > target_num  
        res_left = bsearch(array.take(mid), target_num)
        return res_left  
    elsif array[mid] < target_num 
        search_right = bsearch(array.drop(mid + 1), target_num)
        if search_right != nil 
            return search_right + mid + 1
        else   
            return nil 
        end
    end  
end
# def bsearch(array, target_num) 
#     return binary_search_helper(array, target_num, 0, array.size - 1)
# end
#         lhm
# p bsearch([1, 2, 3], 0) # => 0
# p bsearch([2, 3, 4, 5, 7, 8], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # =>    3       
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5  (5 - 1) / 2 
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# Merge Sort
# Implement a method merge_sort that sorts an Array: merge_sort([3])
def merge(left, right)
    res = [] #[1, 2, 4, 4, 5]
    until left.empty? || right.empty? 
        if left.first < right.first 
            res << left.shift
        else left.first >= right.first 
            res << right.shift 
        end
    end 
    
    res + left + right
end

def merge_sort(array) #[3, 2, 1, 6, 5, 4] [3, 2, 1] [6, 5, 4]
                                        #[3] [2, 1]  [6]  [5, 4]
                                        #    [2][1]->[1, 2, 3]      [5][4]-> [4, 5, 6] [1, 2, 3, 4, 5, 6]            
     return array if array.length == 1 
    
    left_half = merge_sort(array.take(array.length / 2))
    right_half = merge_sort(array.drop(array.length / 2))
    return merge(left_half, right_half)
end        


# result = []
# arr = [6, 2, 0, -5, 3, 1, 7, 8, 943243543,45443,3412213214324,5555,656765756743543,232]  #left_half [], right_half = [11, 23]  merge(left_half, right_half) = [2, 6]
# p merge_sort(arr)

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.
# Array Subsets
# Write a method subsets that will return all subsets of an array.

def subsets(arr)
    
    return [[]] if arr.empty?

    original_arr = subsets(arr[1..-1]) 
    new_arr = [[]]
    # (0...original_arr.length).each do |i| 
    original_arr.map {|sub| new_arr << [arr[0]] + sub }
        # new_arr << [arr[0]]
    # end 
   new_arr
end 

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# class Array
#     def subsets
#       return [[]] if empty?
#       subs = take(count - 1).subsets
#       subs.concat(subs.map { |sub| sub + [last] })
#     end
#   end

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.
# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.
def permutations([1, 2, 3])

end 



# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.