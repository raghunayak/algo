-- Standard Quick Sort algorithm
-- www.openguru.com

-- Function to do sorting using quick_sort
function quick_sort(array, startIndex, endIndex)
    if startIndex < endIndex then
        p = parttion(array, startIndex, endIndex)

        -- Recursively call quicksort with left part of the partitioned array
        if startIndex < p-1 then
            quick_sort(array, startIndex, p-1)
        end
        if endIndex > p then
            quick_sort(array, p+1, endIndex)
        end
    end
    return array
end

-- Selects the pivot, we select the mid element as pivot
function choose_pivot(array, startIndex, endIndex)
    return math.floor((startIndex + endIndex)/2)
end

function parttion(array, startIndex, endIndex)
    pivot = choose_pivot(array, startIndex, endIndex)
    pivotValue = array[pivot]

    -- Put pivot to endIndex
    array[endIndex], array[pivot] =  array[pivot], array[endIndex]

    storeIndex = startIndex

    for i=startIndex,endIndex-1 do
        if array[i] < pivotValue then
            array[i], array[storeIndex] = array[storeIndex], array[i]
            storeIndex = storeIndex+1
        end
    end
    array[storeIndex], array[endIndex] = array[endIndex], array[storeIndex]
    return storeIndex
end

-- Splits the string to number array
function split_string_to_number(inputstr)
    local sep = "%s"
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, tonumber(str))
    end
    return t
end

-- Prints the array
function print_array(array)
	for i=1,#array do
		io.write(array[i], " ")
	end
end

-- Main
print("Enter array to sort")
local str = io.read()
local array = split_string_to_number(str)

io.write("Given array: ")
print_array(array)

array = quick_sort(array, 1, #array)
io.write("\nSorted array: ")
print_array(array)
