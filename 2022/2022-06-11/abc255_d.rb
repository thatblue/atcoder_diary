# https://atcoder.jp/contests/abc255/tasks/abc255_d

n, q = gets.split(' ').map!(&:to_i)
a = gets.split(' ').map!(&:to_i).sort
t = 0
sum = a.map { |ai| t += ai }.unshift(0)

q.times do
  x = gets.to_i

  first_more_index = a.bsearch_index{ |v| v > x } || n
  diff_less = x * first_more_index - sum[first_more_index]
  diff_more = (sum[n] - sum[first_more_index]) - x * (n - first_more_index)
  p diff_less.abs + diff_more.abs
end
