# cf. https://atcoder.jp/contests/abc273/submissions/35695451
note = Hash.new

root = { parent: nil, number: nil }
current = root

q = gets.chomp.to_i
ans = []
q.times do
  operation, value = gets.chomp.split

  if operation == "ADD"
    child = { parent: current, value: value }
    ans << value
    current = child
  elsif operation == "DELETE"
    current = current[:parent] if current[:parent]
    ans << (current[:value] || -1)
  elsif operation == "SAVE"
    note[value] = current
    ans << (current[:value] || -1)
  else # operation == "LOAD"
    current = note[value] || root
    ans << (current[:value] || -1)
  end
end

puts ans.join(" ")
