def bit_on_count_of_binary_and_binary_coded_decimal_same?(n)
  n.to_s.each_char.map{|x| x.to_i.to_s(2)}.join.count("1") == n.to_s(2).each_char.count("1")
end

p (10..99).select{|x| bit_on_count_of_binary_and_binary_coded_decimal_same?(x)}.count