# Mergesort Algorithm
# www.openguru.com

def merge_sort array
    if array.size <= 1
        return array
    end

    middle = (array.size / 2).to_i
    left = array.slice(0, middle)
    right = array.slice(middle, array.size)

    left = merge_sort(left)
    right = merge_sort(right)

    return merge(left, right)
end

def merge left, right
    result = Array.new

    while left.size > 0 and right.size > 0
        if left[0] <= right[0]
            result.push left.slice!(0)
        else
            result.push right.slice!(0)
        end
    end
    result = result+left unless left.empty?
    result = result+right unless right.empty?

    return result
end

puts "Enter array to sort (space separated numbers)"
array = gets
array = array.split(' ').map(&:to_i)
puts "Given array: #{array}"

array = merge_sort array
puts "Sorted array = #{array}"
