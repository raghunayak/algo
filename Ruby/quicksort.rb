# Standard Quick Sort algorithm
# www.openguru.com

def quick_sort array, startIndex, endIndex
    if startIndex < endIndex
        p = parttion array, startIndex, endIndex

        # Recursively call quicksort with left part of the partitioned array
        if startIndex < p-1
            quick_sort array, startIndex, p-1
        end
        if endIndex > p
            quick_sort array, p+1, endIndex
        end
    end
    return array
end

def choose_pivot array, startIndex, endIndex
    return (startIndex + (endIndex - startIndex)/2).to_i
end

def parttion array, startIndex, endIndex
    pivot = choose_pivot array, startIndex, endIndex
    pivotValue = array[pivot]

    # Put pivot to endIndex
    array[endIndex], array[pivot] =  array[pivot], array[endIndex]

    storeIndex = startIndex

    for i in startIndex..endIndex-1
        if array[i] < pivotValue
            array[i], array[storeIndex] = array[storeIndex], array[i]
            storeIndex = storeIndex+1
        end
    end
    array[storeIndex], array[endIndex] = array[endIndex], array[storeIndex]
    return storeIndex
end

puts "Enter array to sort"
array = gets
array = array.split(' ').map(&:to_i)
puts "Given array = #{array.size}; #{array}"

array = quick_sort array, 0, array.size-1
puts "Sorted array = #{array.size}; #{array}"
