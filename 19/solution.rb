
regular = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

first = [1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6]

def isLeap(i) 
  i % 4 == 0 and not ( i % 100 == 0 and not i % 400 == 0)
end

def days(year, month) 
  if (isLeap(year) and month >= 3) or (isLeap(year-1) and month <= 2)
    366
  else
    365
  end
end

c = 0
for year in 1901..2000
  for month in 1..12
    first[month-1] += days(year, month)
    first[month-1] %= 7
  end
  c += (first.reduce(0) { |c, a| (a%7 == 0)? c+1 : c })
end
p c
