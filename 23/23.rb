
upper = 28123
lower = 12

def divisors_sum(x) 
  lim = Math.sqrt(x).floor
  sum = 0
  (1..lim).each do |i|
    if x % i == 0
      sum += i 
      sum += x/i if i != 1 and x/i != i
    end
  end
  sum
end

#find all abundant numbers
abundant = []
(lower..upper).each do |i|
  #print "%d, %d\n" % [i, divisors_sum(i)]
  abundant.push(i) if divisors_sum(i) > i
end

#p abundant.size
#p abundant

# way too slow
#possible_sums = []
#abundant.each do |x|
#  abundant.each do |y|
#    possible_sums.push(x+y) if (x+y) < upper and  not possible_sums.include?(x+y)
#  end
#end
#p possible_sums.size


def bsearch(arr, x) 
  if arr.empty?
    return false
  elsif arr.size == 1
    return (arr.first == x) ? true : false
  end
  
  h = (arr.size / 2).floor
  if arr[h] == x 
    return true
  end
  return bsearch(arr.slice(0..h-1), x) if x < arr[h]
  return bsearch(arr.slice(h+1..(arr.size - 1)), x) if x > arr[h]
end

total = 0
#find numbers cannot be written as sum of 2 abundant numbers
(1..upper).each do |i|
  #hm...this is pretty ugly
  found = false
  for k in 0..(abundant.size - 1)

    if abundant[k] > ((i/2).ceil + 1)
      break
    end

    # must use binary search...to speed things up
    if bsearch(abundant, (i-abundant[k])) 
      found = true
      break
    end

  end
  if not found
    total += i
  end
  p i if i % 1000 == 0
end
p total
