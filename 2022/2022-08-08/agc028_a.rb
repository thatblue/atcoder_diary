n, m = gets.chomp.split.map(&:to_i)

s = gets.chomp.chars
t = gets.chomp.chars

lcm = n.lcm(m)
gcd = n.gcd(m)

if gcd == 1
  p s[0] == t[0] ? lcm : -1
  exit
end

if n < m
  shorter, longer = n, m
  shorter_str, longer_str = s, t
else
  shorter, longer = m, n
  shorter_str, longer_str = t, s
end

(0..n - 1).each do |shorter_index|
  str_index = shorter_index * (lcm / shorter)
  longer_index, mod = str_index.divmod(lcm / longer)
  if mod == 0 && shorter_str[shorter_index] != longer_str[longer_index]
    p -1
    exit
  end
end

p lcm