# https://atcoder.jp/contests/typical90/submissions/34453481

t = gets.chomp.to_i
l, x, y = gets.chomp.split.map(&:to_f)
q = gets.chomp.to_i

q.times do
  e_i = (gets.chomp.to_i % t).to_f
  theta = Math::PI * 2.0 * e_i / t
  wheel_y = -l / 2.0 * Math.sin(theta)
  wheel_z = l / 2.0 * (1.0 - Math.cos(theta))

  p Math.atan(wheel_z / Math.sqrt(x ** 2 + (y - wheel_y) ** 2)) * 180.0 / Math::PI
end
