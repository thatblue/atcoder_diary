# https://atcoder.jp/contests/abc227/submissions/27238150

n = gets.chomp.to_i

count = 0
a = 1
while a * a * a <= n do
  b = a
  while a * b * b <= n do
    count += (n / (a * b) - b + 1)
    b += 1
  end
  a += 1
end

p count
