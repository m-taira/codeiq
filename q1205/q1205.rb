stamps = [1,2,10,52,82,280]
result = []

(1..Float::INFINITY).each do |x|
  stamps.repeated_combination(x) do |c|
    result << c if c.inject(&:+) == 2007
  end
  break if result.size > 0
end

result.each do |x|
  p stamps.map {|s|
      x.count(s)
    }
end