

def readInput(filename)
  f = File.open(filename, "r")
  array = []
  if not f.nil?
    while line = f.gets
      array.push(line.split.map { |x| x.to_i })
    end
  end
  array
end

def dynamicProg(a) 
  r = []
  for i in 0..(a.size - 1)
    k = []
    if i == 0
      k = a[i]
    else 
      for j in 0..(a[i].size - 1)
        if j == 0
          k.push(r[i-1][j] + a[i][j])
        elsif j == (a[i].size - 1)
          k.push(r[i-1][j-1] + a[i][j])
        else
          q = r[i-1][j-1] + a[i][j]
          p = r[i-1][j] + a[i][j]
          k.push([p, q].max)
        end
      end
    end
    r.push k
  end
  r
end

require 'yaml'
require 'pry'
a = [ ["1"] , [ "2", "3"] ] 
a = [ [1] , [ 2, 3] ] 
a = [[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]
p dynamicProg a
a = readInput 'input' 
p a
p dynamicProg a



