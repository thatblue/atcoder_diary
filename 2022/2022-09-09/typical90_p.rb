N = gets.chomp.to_i
A, B, C = gets.chomp.split.map(&:to_i).sort

coins_min = 9999
i_max = [coins_min, N / C].min
i_max.downto(0) do |i|
  j_max = [coins_min - i, (N - C * i) / B].min
  j_max.downto(0) do |j|
    k, remain = (N - (C * i + B * j)).divmod(A)
    current_coins = i + j + k
    if remain.zero?
      coins_min = [coins_min, current_coins].min
      break
    elsif current_coins >= coins_min - 1
      # j区間のループを続けてもコインは増えるだけなのでbreakする
      break
    end
  end
end

p coins_min
