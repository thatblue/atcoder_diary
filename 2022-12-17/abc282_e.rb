N, M = gets.chomp.split.map(&:to_i)

BALLS = gets.chomp.split.map(&:to_i)
ranking = Hash.new { Array.new }

(0..N-1).to_a.combination(2) do |pair|
  point = (BALLS[pair[0]] ** BALLS[pair[1]] + BALLS[pair[1]] ** BALLS[pair[0]]) % M
  ranking[point] = ranking[point] + [pair]
end

def play(eaten_balls, current_ranking)
  if eaten_balls.length == N - 1
    return 0
  end

  (M-1).downto(0) do |point|
    pairs = current_ranking[point]
    if pairs.length == 0
      next
    end

    max_sum = 0
    pairs.each do |pair|
      if eaten_balls.include?(pair[0]) || eaten_balls.include?(pair[1])
        current_ranking[point].delete(pair)
        next
      end
      max_sum = [
        point + play(eaten_balls + [pair[0]], current_ranking),
        point + play(eaten_balls + [pair[1]], current_ranking),
        max_sum
      ].max
    end
    return max_sum if max_sum > 0
  end

  0
end

puts play([], ranking)