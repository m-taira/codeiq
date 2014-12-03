def last_man_receive_at_last?(n)
  _last_man_receive_at_last?(n, n, :second)
end

def _last_man_receive_at_last?(m, w, s)
  # 男性の一人目から始まって人数が奇数の場合、最後の人が受け取ってしまう
  return false if (m%2) == 1 && s == :first

  # 男性の二人目から始まって人数が偶数の場合、最後の人が受け取ってしまう
  return false if (m%2) == 0 && s == :second

  # 半分は受け取って抜ける（奇数の場合、二人目から始まるから切り上げ）
  m = (m.to_f/2).ceil

  # 最後の男性ならOK
  return true if m == 1

  # 女性の数が偶数なら次回の男性は一人目が受け取る、奇数なら二人目が受け取る
  s = w.even? ? :first : :second

  # 女性の半分が抜ける
  w = (w.to_f / 2).floor

  # 次の周回
  _last_man_receive_at_last?(m, w, s)
end

p (6..Float::INFINITY).lazy.select{|n| last_man_receive_at_last?(n)}.first(5).join(", ")