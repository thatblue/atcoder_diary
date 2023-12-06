CHANGEABLE_CARDS = ['a', 't', 'c', 'o', 'd', 'e', 'r']

s = gets.chomp.chars.tally
t = gets.chomp.chars.tally
s.default = 0
t.default = 0

keys = s.keys + t.keys
keys.uniq!
keys.delete('@')

keys.each do |key|
  if s[key] == t[key]
    next
  end

  unless CHANGEABLE_CARDS.include?(key)
    puts 'No'
    exit
  end

  if s[key] > t[key]
    diff = s[key] - t[key]
    if t['@'] < diff
      puts 'No'
      exit
    end

    t[key] = s[key]
    t['@'] -= diff
  else
    diff = t[key] - s[key]
    if s['@'] < diff
      puts 'No'
      exit
    end

    s[key] = t[key]
    s['@'] -= diff
  end
end

puts 'Yes'
