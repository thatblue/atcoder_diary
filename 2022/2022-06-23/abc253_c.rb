q = gets.chomp.to_i

nums = {}
max = nil
min = nil
(1..q).each do
  query = gets.split.map!(&:to_i)

  if query[0] == 1
    max ||= query[1]
    min ||= query[1]

    nums[query[1]] ||= 0
    nums[query[1]] += 1
    # 安易にmax/minを使うとコストがそれなりに響く
    max = [max, query[1]].max
    min = [min, query[1]].min
  elsif query[0] == 2
    nums[query[1]] ||= 0
    nums[query[1]] -= query[2]
    if nums[query[1]] <= 0
      nums.delete(query[1])
      max = query[1] == max ? nums.keys.max : max
      min = query[1] == min ? nums.keys.min : min
    end
  elsif query[0] == 3
    p max - min
  end
end