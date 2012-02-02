nn = 1000000

d = 10

nn -= 1
def fac(x) 
  (1..x).to_a.reduce(1, :*) 
end

digits = (0..(d-1)).to_a

(0..(d-1)).reverse_each do |n|
    x, y = nn.divmod fac(n)
    p digits[x]
    digits.delete_at(x)
    nn = y
end
