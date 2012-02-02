require "pry"

n = 100
acc = "1"


def multiply(acc, x)
  m = []
  # multply each digit and perform rolling addition
  acc.split("").each do |k|
    temp = k.to_i * x
    m.push(temp)
  end

  total = []
  rolling = 0
  m.reverse.each do |p|
    p = p + rolling
    total.push(p.to_i % 10)
    rolling = p.to_i / 10
  end
  total.push(rolling) if rolling != 0
  total.reverse.join
end

def sum_digits(x) 
  x.split("").map { |i| i.to_i }.reduce(0, :+)
end

(1..n).each do |x|
  acc = multiply(acc, x)
  print acc + " " + sum_digits(acc).to_s + "\n"
end

