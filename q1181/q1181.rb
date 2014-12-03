magic_circle = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]

total_list = (1..16).inject({}) do |t, x|
  magic_circle.combination(x).inject(t) do |tt, xx|
    total = xx.inject(&:+)
    tt[total.to_s] ||= 0
    tt[total.to_s] += 1
    tt
  end
end

p total_list.max {|x, y| x[1] <=> y[1] }