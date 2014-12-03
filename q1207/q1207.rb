prev = []
zero_count = 0
row_count = 0

while zero_count < 2014 do
  row_count += 1
  current = [1]
  prev.each.with_index do |x, i|
    if i == prev.size - 1
      current << 1
    else
      a = x
      b = prev[i+1]
      current << (a ^ b)
    end
  end
  zero_count += current.count(0)
  prev = current
end

p row_count