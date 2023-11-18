n, m = gets.chomp.split.map(&:to_i)
s = gets.chomp.chars
t = gets.chomp.chars

replacable_chars = t + ['#']

buffer = []
char_count = 0
s.each do |char|
  unless replacable_chars.include?(char)
    puts 'No'
    exit
  end

  buffer << char
  char_count += 1
  next if buffer.size < m

  latest_m_chars = buffer.last(m)
  matched = true
  matched_count = 0
  m.times do |i|
    break matched = false if latest_m_chars[i] != "#" && latest_m_chars[i] != t[i]
    matched_count += 1 if latest_m_chars[i] == t[i]
  end

  next unless matched

  buffer.pop(m)
  buffer += Array.new(m, "#")
  char_count -= matched_count

  unless char_count.zero?
    loop do
      rollback_char = buffer.pop
      break if rollback_char.nil?
      unless rollback_char == '#'
        puts 'No'
        exit
      end

      latest_m_chars = buffer.last(m)
      matched = true
      matched_count = 0
      m.times do |i|
        break matched = false if latest_m_chars[i] != "#" && latest_m_chars[i] != t[i]
        matched_count += 1 if latest_m_chars[i] == t[i]
      end

      next unless matched

      buffer.pop(m)
      buffer += Array.new(m, "#")
      char_count -= matched_count
    end
  end

end

puts char_count.zero? ? 'Yes' : 'No'
