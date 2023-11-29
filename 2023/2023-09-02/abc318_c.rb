n, pass_days, price = gets.chomp.split.map(&:to_i)
fees = gets.chomp.split.map(&:to_i).sort.reverse
otoku_price = price / pass_days

over_pass, under_pass = fees.partition { |v| v >= otoku_price }

# pass_countぶんは確実に周遊パスを買ってよい
pass_count, mod = over_pass.count.divmod(pass_days)

ans = pass_count * price
if mod > 0
  mod_sum = over_pass.last(mod).sum
  under_sum = under_pass.first(pass_days - mod).sum
  nokori = under_pass[(pass_days - mod)..].nil? ? 0 : under_pass[(pass_days - mod)..].sum
  ans += nokori
  # はみ出る分の合計が周遊パスの合計を下回るなら素直に払ったほうがよい
  ans += mod_sum + under_sum < price ? mod_sum + under_sum : price
  puts ans
else
  puts ans + under_pass.sum
end
