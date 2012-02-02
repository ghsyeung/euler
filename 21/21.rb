
N = 10000

def factorize(x)
  k = Math.sqrt(x) 
  k = k.floor.to_i

  f = []
  (1..k).each do |i|
    if x % i == 0
      f.push(i)
      f.push(x/i) if x/i != i and i != 1
    end
  end
  f
end

def amica(x) 
  f = factorize(x)
  f.reduce(0, :+)
end

A = []
(1..N).each do |x|
  y = amica(x)
  #print "%d %d\n" % [x, y]
  if x != y and x == amica(y)
    #unless A.include? x then A.push(x) else p "#{x} already in A" end
    A.push(x) unless A.include? x 
    #unless A.include? y then A.push(y) else p "#{y} already in A" end
    A.push(y) unless A.include? y 
  end
end

p A
p A.reduce(:+)
