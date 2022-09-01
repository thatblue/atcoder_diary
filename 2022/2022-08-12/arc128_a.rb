DP_GOLD = 0
DP_SILVER = 1

n = gets.chomp.to_i

rates = gets.chomp.split.map(&:to_i)
rates.unshift(0)

current_gold = 1
current_silver = 0
results = []
1.upto(n - 1) do |day|
  if current_gold > 0
    if rates[day] > rates[day + 1]
      current_silver = current_gold * rates[day]
      current_gold = 0
      results << 1
    else
      results << 0
    end
  else
    if rates[day] < rates[day + 1]
      current_gold = current_silver.to_f / rates[day]
      current_silver = 0
      results << 1
    else
      results << 0
    end
  end
end

if current_gold > 0
  results << 0
else
  results << 1
end

puts results.join(' ')