# https://atcoder.jp/contests/abc255/tasks/abc255_a

r, c = gets.split(' ').map!(&:to_i)
a1 = gets.split(' ').map!(&:to_i)
a2 = gets.split(' ').map!(&:to_i)

a = [a1, a2]

p a[r - 1][c - 1]