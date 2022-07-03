# https://atcoder.jp/contests/abc255/tasks/abc255_c

x, a, d, n = gets.split(' ').map!(&:to_i)

s_start = a
s_end = a + d * (n - 1)
smin = [s_start, s_end].min
smax = [s_start, s_end].max

if x < smin
  p (smin - x).abs
  exit
end

if x > smax
  p (x - smax).abs
  exit
end

if d == 0
  p (x - smin).abs
  exit
end

mod = (x - a).abs % d.abs

p [mod, (d.abs - mod).abs].min
