collect_count = [1]

(1..Float::INFINITY).each do |n|
  break if collect_count.inject(&:+) >= 80_000_000
  collect_count[n] = 2 ** n
end

p collect_count.size