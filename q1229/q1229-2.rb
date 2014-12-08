class DeliveryRoute
  COST_MATRIX = [
      [ 0, 7, 12, 8, 11, 7 ],
      [ 3, 0, 10, 7, 13, 2 ],
      [ 4, 8, 0, 9, 12, 3 ],
      [ 6, 6, 9, 0, 10, 7 ],
      [ 7, 7, 11, 10, 0, 5 ],
      [ 9, 7, 8, 9, 10, 0 ],
  ]

  def initialize
    @min_cost = Float::INFINITY
    @route = []
  end

  def solve(total_cost, current, rest, route)
    rest.each.with_index do |r, i|
      nokori = rest.reject.with_index {|r, j| i == j }
      tugi = rest.find.with_index {|r, j| i == j }

      route << tugi

      if @min_cost < total_cost
        route.pop
        return
      end

      total_cost += COST_MATRIX[current][tugi]

      if nokori.size == 0
        total_cost += COST_MATRIX[tugi][0]

        if total_cost < @min_cost
          route << 0
          @min_cost = total_cost
          @min_route = route.dup
          route.pop
        end
      else
        solve(total_cost, tugi, nokori, route)
      end

      route.pop
      total_cost -= COST_MATRIX[current][tugi]
    end
  end

  def answer
    [@min_route, @min_cost]
  end
end

r = DeliveryRoute.new
r.solve(0, 0, [1,2,3,4,5], [0])

ans = r.answer

printf "route: %s, energy: %s ¥n", ans.first.join(" -> "), ans.last
