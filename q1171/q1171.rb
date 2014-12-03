children = {}
children[:a] = [:b, :c, :d, :e, :f, :g, :j]
children[:b] = [:a, :e, :g, :h]
children[:c] = [:a, :d, :e, :g, :j]
children[:d] = [:a, :c, :h, :i]
children[:e] = [:a, :b, :c, :g, :h, :j]
children[:f] = [:a, :g, :i]
children[:g] = [:a, :b, :c, :e, :f]
children[:h] = [:b, :d, :e, :i]
children[:i] = [:d, :f, :h]
children[:j] = [:a, :c, :e]

result = {}

children.each do |name, friends|
  friends_friends = children.reject {|x| x == name }.select{|x|friends.include?(x)}.inject([]){|h, x| h += x.last}.uniq.reject{|x| friends.include?(x)}.reject{|x| x == name}
  result[name] = friends_friends
end

p result.inject({}){|h,x| h[x.first] = x.last.count; h}.max {|x, y| x.last <=> y.last}