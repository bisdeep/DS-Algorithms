#Problems 1, 2 taken from Brennan Fradelis on Youtube

#Problem 1: Max sum of any contiguous subarray of size K
#--------------------------------------------------------


def max_sum_subarray(arr, k)
    max_sum = -1.0/0
    start = 0
    curr_sum = 0

    arr.each_with_index do |val, idx|
        curr_sum += val

        if ((idx-start+1)==k)

            max_sum = [max_sum, curr_sum].max
            curr_sum -= arr[start]
            start+=1

        end
    end

    return max_sum
end


arr = [2,3,4,1,5]
k = 3
puts max_sum_subarray(arr, k)

#--------------------------------------------------------
#Problem 2: Given an array of positive numbers find the size of the smallest contiguous subarray with a sum >= s(given)
#--------------------------------------------------------

def smallest_gte_s(arr, s)
    sum = s
    smallest_size = 1.0/0
    start = 0
    curr_sum = 0

    arr.each_with_index do |val, idx|
        curr_sum += val

        while curr_sum >= sum

            smallest_size = [smallest_size, (idx-start+1)].min
            curr_sum -= arr[start]
            start += 1

        end

    end
    return smallest_size
end

arr = [2,4,2,5,1]
s = 7
puts smallest_gte_s(arr, s)

#--------------------------------------------------------
#Question 3(taken from Michael Muinos, Youtube)
#Given a string, find longest substring without repeating characters
#--------------------------------------------------------

def longest_substring(str)
    start, current_max = 0, 0
    curr_substring = []
    str.chars.each_with_index do |char, ending|
        #ending => index
        unless (char==' ')
            while curr_substring.include?(char)
                #since we are dealing with substrings and NOT subsequences, 
                #we can simply remove the first char, 
                #as substrings are never in this format => sub=str[0]+str[2..-1] (they basically cannot trim off chars in the middle)
                curr_substring = curr_substring[1..-1]
                #move the front window up
                start+=1

            end
            curr_substring << char
            current_max = [current_max, ending-start+1].max
        end
        #iterate to the next end window
    end
    return current_max

end

# def longest_substring(str)
#     i,j, current_max = 0, 0, 0
#     curr_substring = []
#     while i<str.length
#         char = str[i]
#         while curr_substring.include?(char)
#             #since we are dealing with substrings and NOT subsequences, 
#             #we can simply remove the first char, 
#             #as substrings are never in this format => sub=str[0]+str[2..-1] (they basically cannot trim off chars in the middle)
#             curr_substring = curr_substring[1..-1]
#             #move the front window up
#             j+=1

#         end
#         curr_substring << char
#         current_max = [current_max, i-j+1].max
#         #iterate the end window
#         i+=1
#     end
#     return current_max

# end

str = "pwwkew"
puts longest_substring(str)

# str = " "
# puts longest_substring(str)

# str = "abcabcbb"
# puts longest_substring(str)

# str = "bbbbb"
# puts longest_substring(str)

# puts "expect return value of 3"
#--------------------------------------------------------
#these problems have a specific format:
#firstly, we declare necessary variables:
#the returned min/max value which is defaulted to inf/-inf respectively (when dealing with summations)
#min --> default to inf
#max --> default to -inf
#if we aren't summing, default it to size = 0
#initialize our starting window to 0
#curr_sum initialized to 0;

#create our enumerable with indexes, to act as our ending windows
#iterate through the array, 
#and add each value to the current sum

#once we reach a specific point, we enter an if/while conditional:
#within this conditional, we have to take the maximum/minimum relative to what
#we already have, versus the current sum
#now that we have entered this conditional and found the current max/min
#we will bump up the "start"-ing window to the right
#which means subtract the value from the arr[start]
#and then increment the value of "start"
#depending on the problem, we want to keep looping through this conditional,
#which is common for dynamic size related problems;

#else exit conditional,
#well move on to the next iteration of the enum where the "end" window
#now is also moved down one index, repeat the above process from line 69

#once weve gone through all indexes, we have found the max/min, which we return;