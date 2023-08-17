n, M, D = gets.chomp.split.map(&:to_i)

aoki_candidates = gets.chomp.split.map(&:to_i).sort.reverse!
$snuke_candidates = gets.chomp.split.map(&:to_i).sort.reverse!

def search_snuke(current_aoki)
  snuke_index = $snuke_candidates.bsearch_index { |snuke| snuke - current_aoki <= D }

  return nil if snuke_index.nil?

  return ($snuke_candidates[snuke_index] - current_aoki).abs <= D ? $snuke_candidates[snuke_index] : nil
end

ans = -1
aoki_candidates.each do |current_aoki|
  current_snuke = search_snuke(current_aoki)

  next if current_snuke.nil?

  ans = [ans, current_snuke + current_aoki].max
end

puts ans
