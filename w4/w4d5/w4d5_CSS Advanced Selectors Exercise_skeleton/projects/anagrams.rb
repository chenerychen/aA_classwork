def first_anagram?(str_1, str_2)
    arr_1 = str_1.split("")
    arr_1.permutation.to_a.include?(str_2.split(""))
end 


# arr_1 = str_1.split("")
# arr_1.permutation.to_a.include?(str_2.split(""))
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# Phase I:
# Write a method #first_anagram? that willclear  generate and store 
# all the possible anagrams of the first string. 
# Check if the second string is one of these.

# n*m
def second_anagram?(str_1, str_2)
    
    (0...str_1.length).each do |i| 
      return false if str_2.index(str_1[i]) == nil 
        str_2[str_2.index(str_1[i])] = '' 
      end 
    str_2 == ""
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# # return false unless str_1.length == str_2.length  #n^2

# (0...str_1.length).each do |i|
#   return false if str_2.index(str_1[i]) == nil

#   str_2[str_2.index(str_1[i])] = ""
# end

# str_2 == ""
# Phase II:
# Write a method #second_anagram?
#  that iterates over the first string. For each letter in the first string, 
#  find the index of that letter in the second string 
#  (hint: use Array#find_index) and delete at that index. 
#  The two strings are anagrams if an index is found for every letter 
#  and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between
#  #first_anagram? and #second_anagram??

# Hints:

# For testing your method, start with small input strings, 
# otherwise you might wait a while
# If you're having trouble generating the possible anagrams, 
# look into this method.
# What is the time complexity of this solution? What happens 
# if you increase the size of the strings?

#  n ^ 2    
def third_anagram?(str_1, str_2)
    str_1 = str_1.split("").sort 
    str_2 = str_2.split("").sort


    str_1 == str_2 
#   (str_1.length - 1).downto(0).each do |i|
#     str_2.delete_at(i) if str_1[i] == str_2[i]
#   end
#   str_2.empty?
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# def fourth_anagram?(str_1, str_2)
#   hash1 = Hash.new(0)
#   hash2 = Hash.new(0)

#   (0...str_1.length).each do |i|
#     hash1[str_1[i]] += 1
#     hash2[str_2[i]] += 1
#   end

#   hash1 == hash2
# end

def fourth_anagram?(str_1, str_2)
  hash = Hash.new(0)
  
  (0...str_1.length).each do |i|
    hash[str_1[i]] += 1
    hash[str_2[i]] -= 1
  end

  hash.all? { |_,v| v == 0 }
end
    
# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true


# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to
#  store the number of times each letter appears in both words. 
#  Compare the resulting hashes.

# What is the time complexity?

# Discuss the time complexity of your solutions together, 
# then call over your TA to look at them.