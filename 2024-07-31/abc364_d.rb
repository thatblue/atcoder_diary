@n, q = gets.chomp.split.map(&:to_i)
@a_array = gets.chomp.split.map(&:to_i).sort
@a_array_reverse = @a_array.reverse


def count_between_index(start_index, end_index)
  # 一番近い値がない場合はそっちの方向にはないので0を返す
  return 0 if start_index.nil?

  # end_indexがないということはそっち方向全体が範囲内になっている
  return @n - start_index if end_index.nil?

  # startとendがある場合はその範囲の個数が答え
  (start_index...end_index).count
end

def search(b, k)
  ok = 0
  ng = [(@a_array[0] - b).abs, (@a_array[-1]).abs].max + 1

  nearest_more_than = @a_array.bsearch_index { |v| v >= b }
  nearest_less_than = @a_array_reverse.bsearch_index { |v| v <= b }
  while ng - ok > 1
    center = (ok + ng) / 2

    more_than_b_index = @a_array.bsearch_index { |v| v > b + center }
    less_than_b_index = @a_array_reverse.bsearch_index { |v| v < b - center }

    more_than_count = count_between_index(nearest_more_than, more_than_b_index)
    less_than_count = count_between_index(nearest_less_than, less_than_b_index)

    if more_than_count + less_than_count <= k
      ok = center
    else
      ng = center
    end
  end

  ok
end

q.times do
  b_j, k_j = gets.chomp.split.map(&:to_i)

  puts search(b_j, k_j)
end
