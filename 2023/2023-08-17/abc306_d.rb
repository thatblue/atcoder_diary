HARAITA = 0
NOT_HARAITA = 1

$n = gets.chomp.to_i

$dishes = []
$dishes << {:poison => false, :yummy => 0}
$n.times do
  x, y = gets.chomp.split.map(&:to_i)

  $dishes << {:poison => x == 1, :yummy => y}
end

$memo = Array.new($n + 1) { Array.new(2) }
def simulation(dish, haraita)
  return $memo[dish][haraita] unless $memo[dish][haraita].nil?

  if dish == $n
    if haraita == HARAITA && $dishes[dish][:poison]
        # 腹痛状態で毒入りが回ってきたら食べない一択
        return $memo[dish][haraita] = 0
    end
    return $memo[dish][haraita] = [0, $dishes[dish][:yummy]].max
  end

  if $dishes[dish][:poison]
    # 腹痛状態で毒入りが回ってきたら食べない一択
    return $memo[dish][haraita] = simulation(dish + 1, HARAITA) if haraita == HARAITA

    # 腹痛でなければ食べることを選択できる
    return $memo[dish][haraita] = [
      $dishes[dish][:yummy] + simulation(dish + 1, HARAITA),
      simulation(dish + 1, NOT_HARAITA)
    ].max
  end

  return $memo[dish][haraita] = [
    $dishes[dish][:yummy] + simulation(dish + 1, NOT_HARAITA),
    simulation(dish + 1, haraita)
  ].max
end

puts simulation(1, NOT_HARAITA)
