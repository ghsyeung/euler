

f = Proc.new { |x|
  if x.class == Array
    k = x.map { |y| f.call(y) }
  else 
    k = x.to_i
  end
  k
}

a = [ "1", ["2", "3"]]
d = f.call(a) 
p d
