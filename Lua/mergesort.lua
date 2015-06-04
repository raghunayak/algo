-- Mergesort Algorithm
-- www.openguru.com

-- Returns new array with array contents from start_index to end_index
function table.slice(t, start_index, end_index)
    -- validity check
    if end_index > #t then
        return t
    end
    if start_index < 1 then
        return t
    end
    local newt = {}
    for i=start_index,end_index do
        table.insert(newt,t[i])
    end
	return newt
end

-- Joins two tables
function table.join(t1, t2)
    local t = {}
    for i=1,#t1 do
        table.insert(t, t1[i])
    end
    for i=1,#t2 do
        table.insert(t, t2[i])
    end
    return t
end

-- Recursive merge sort
function merge_sort(array)
    if #array <= 1 then
        return array
    end

    local middle = math.floor(#array / 2)
    local left = table.slice(array, 1, middle)
    local right = table.slice(array, middle+1, #array)

    left = merge_sort(left)
    right = merge_sort(right)

    return merge(left, right)
end

-- Merges the two sorted arrays
function merge(left, right)
    local result = {}

    while #left > 0 and #right > 0 do
        if left[1] <= right[1] then
            table.insert(result, left[1])
            table.remove(left, 1)
        else
            table.insert(result, right[1])
            table.remove(right, 1)
        end
    end
    result = table.join(result, left)
    result = table.join(result, right)

    return result
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

print("Enter array to sort (space separated numbers)")
local str = io.read()
local array = split_string_to_number(str)

io.write("Given array: ")
print_array(array)

array = merge_sort(array)

io.write("\nSorted array: ")
print_array(array)
