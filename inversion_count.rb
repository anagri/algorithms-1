def read_input
  file = File.new("inversion_count.txt", "r")
  numbers = []
  while (n = file.gets)
    numbers << n.to_i
  end
  numbers
end

def merge_and_count(arr1, arr2, count)
  i,j=0, 0
  sorted = []
  while i+j<=arr1.size+arr2.size-1
    if arr2[j].nil? || (arr1[i] && arr1[i] < arr2[j])
      sorted << arr1[i]
      i+=1
    else
      sorted << arr2[j]
      count+=arr1.size-i
      j+=1
    end
  end
  [sorted, count]
end

def merge_sort(arr, count)
  return [arr, 0] if arr.size == 1

  half = arr.size/2
  left_half, left_count=merge_sort(arr[0...half], 0)
  right_half, right_count=merge_sort(arr[half...arr.size], 0)

  merge_and_count(left_half, right_half, count+left_count+right_count)
end

numbers = read_input
sorted, inv_count = merge_sort(numbers, 0)

puts inv_count

