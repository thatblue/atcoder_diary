n = gets.chomp.to_i

frequencies = {}
frequencies.default = 0
n.times do
  s = gets.chomp

  s_freq = frequencies[s]

  if s_freq == 0
    puts s
  else
    puts s + "(" + s_freq.to_s + ")"
  end

  frequencies[s] = s_freq + 1
end
