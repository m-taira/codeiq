cost_matrix = [
    [ 0, 7, 12, 8, 11, 7 ],
    [ 3, 0, 10, 7, 13, 2 ],
    [ 4, 8, 0, 9, 12, 3 ],
    [ 6, 6, 9, 0, 10, 7 ],
    [ 7, 7, 11, 10, 0, 5 ],
    [ 9, 7, 8, 9, 10, 0 ],
]

delivery_point = [1,2,3,4,5]

cost = delivery_point.permutation(5).inject({}) do |r, x|
  x.unshift(0)
  x.push(0)

  r[x] = x.each_cons(2).each.inject(0) do |rr, y|
    rr += cost_matrix[y.first][y.last]
  end
  r
end

min_cost = cost.min {|x, y| x.last <=> y.last }

printf "route: %s, energy: %s ¥n", min_cost.first.join(" -> "), min_cost.last
