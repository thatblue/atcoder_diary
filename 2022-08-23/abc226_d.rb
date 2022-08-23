require 'set'

n = gets.chomp.to_i

towns = []
n.times do
  towns << gets.chomp.split.map(&:to_i)
end

magics = Set.new

(n - 1).times do |i|
  (i + 1).upto(n - 1) do |j|
    diff_x = towns[i][0] - towns[j][0]
    diff_y = towns[i][1] - towns[j][1]
    gcd = diff_x.gcd(diff_y)

    magics.add([diff_x / gcd, diff_y / gcd])
    magics.add([-diff_x / gcd, -diff_y / gcd])
  end
end

p magics.length