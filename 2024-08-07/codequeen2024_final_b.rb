n = gets.chomp.to_i

ans = []
n.times do
  signal = gets.chomp.chars
  chunks = signal.slice_when { |before, after| before != after }.to_a
  first_char = signal[0]

  if chunks.count == 1 && first_char == '-'
    ans << 0
  elsif first_char == '.'
    ans << chunks[0].count
  else
    ans << 5 + chunks[0].count
  end
end

puts ans.join
