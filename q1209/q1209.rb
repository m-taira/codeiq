class Integer
  def devisor
    r = (1..(self ** (1.0/2.0)).to_i).inject([]){|arr, i| arr << i if self % i == 0; arr}
    rr = r.inject([]){ |r, x| r << self / x; r}
    r.concat(rr).sort.uniq
  end
end

p 472.devisor.count


p 1073741824.devisor.count


p 3572947927495273.devisor.count
