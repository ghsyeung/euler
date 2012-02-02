
filename = "names.txt"

f = File.open(filename, "r+")

A = []
while k = f.gets(',')
  k.gsub!(/[\",]/, '')
  A.push(k)
end

A.sort!

total = 0
count = 1
A.each do |s| 
  temp = 0
  s.each_byte {|c| temp += (c - 'A'.bytes.first + 1) }
  p s << ", " << temp.to_s
  total += (count * temp)
  count += 1
end

p total
