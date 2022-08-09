# cf. https://atcoder.jp/contests/arc144/submissions/33274850

n, a, b = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i).sort

max_of_min = array.sum / n
start_min = array[0]

min_avg = (start_min..max_of_min).bsearch do |tmp_avg|
  add_count = 0
  diff_count = 0
  array.each do |value|
    diff = value - tmp_avg
    if diff == 0
      next
    end

    if diff > 0
      # すべてがtmp_avg以上であることを満たすために値を減らすことが出来る回数
      diff_count += diff / b
    else
      # tmp_avg以上にするために必要な可算回数
      add_count += (diff / a).abs
    end
  end

  # 減算可能な回数を可算が必要な回数が上回るタイミングを知りたい
  diff_count < add_count
end

p min_avg == nil ? max_of_min : min_avg - 1