V_MAX = 10 ** 5 + 1

n, w = gets.chomp.split.map(&:to_i)

cargos = []
n.times do
  cargos << gets.chomp.split.map(&:to_i)
end

weight_min = Array.new(n + 1) { Array.new(V_MAX + 1, Float::INFINITY)}
weight_min[0][0] = 0

cargos.each_with_index do |cargo, cargo_index|
  current_weight, current_value = cargo
  cargo_no = cargo_index + 1

  (0..V_MAX).each do |value|
    remain_value = value - current_value
    if remain_value < 0
      weight_min[cargo_no][value] = weight_min[cargo_no - 1][value]
    else
      weight_min[cargo_no][value] = [
        weight_min[cargo_no - 1][value],
        weight_min[cargo_no - 1][remain_value] + current_weight
      ].min
    end
  end
end

(V_MAX).downto(0).each do |value|
  if weight_min[n][value] <= w
    p value
    exit
  end
end
