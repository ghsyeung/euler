class StringNumber
    
  def initialize(x)
    @x = x.to_s
    raise "InvalidArgument" if (@x =~ /[^0-9]/) != nil
  end

  def to_s 
    @x
  end

  def + (y) 
    k = simple_add(@x, y)
    #p k
    StringNumber.new(propagate(k))
  end

  def * (y) 
    x = @x.to_s.split('')
    y = y.to_s.split('')

    z = "" 
    y.each do |j|
      t = []
      z << "0"
      x.each do |i|
        t.push(i.to_i * j.to_i)
      end
      p = propagate(t.reverse)
      q = simple_add(z, p)
      p q
      z = propagate(q)
    end
    z
  end

  def simple_add(x, y)
    i = 0
    x = x.to_s.split('').reverse
    y = y.to_s.split('').reverse
    while true
      if x[i].nil?
        if y[i].nil? # both are of same length
          break
        else # y is longer, push the rest of y
           x.push(y[i..-1].map {|x| x.to_i})
        end
      else 
        if y[i].nil? # x is longer
          x.map! {|x| x.to_i}
        else # normal case
          # REVISIT: hm...may not be the best impl casting back to str
          x[i] = (x[i].to_i + y[i].to_i).to_s
        end
      end
      i += 1
    end
    p x
    x
  end
  def propagate(x) 
    carry = 0
    x.each_index { |i| 
      t = x[i] + carry
      carry, x[i] = t.divmod 10
    }
    # add the extra carry
    if carry != 0
      x.push(carry)
    end
    x.reverse.join
  end
end

p StringNumber.new("12345") + StringNumber.new("0")
StringNumber.new("12345") * StringNumber.new("12345")
