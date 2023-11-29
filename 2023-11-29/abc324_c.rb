n, t_dash = gets.chomp.split
n = n.to_i
t_dash_size = t_dash.size

def diff_str(shorter, longer)
  shorter_index = 0
  shorter_size = shorter.size
  longer_index = 0
  longer_size = longer.size
  diff_size = 0

  while shorter_index < shorter_size && longer_index < longer_size
    unless shorter[shorter_index] == longer[longer_index]
      diff_size += 1
      longer_index += 1
      next
    end

    shorter_index += 1
    longer_index += 1
  end

  diff_size.zero? ? 1 : diff_size
end

candidates = []
n.times do |index|
  no = index + 1
  candidate = gets.chomp

  if candidate == t_dash
    candidates << no
  elsif candidate.size == t_dash.size
    # 異なっている文字が1字だけであるかを検証
    char_diff = 0
    t_dash_size.times do |char_index|
      char_diff += 1 unless candidate[char_index] == t_dash[char_index]
    end
    candidates << no if char_diff == 1
  elsif candidate.size == t_dash.size + 1
    # 余計な文字が1文字挿入されている可能性がある
    candidates << no if diff_str(t_dash, candidate) == 1
  elsif candidate.size + 1 == t_dash.size
    # 1文字足りない可能性がある
    candidates << no if diff_str(candidate, t_dash) == 1
  end
end

puts candidates.size
puts candidates.join ' '
