l1, r1, l2, r2 = gets.chomp.split.map(&:to_i)

if l1 <= l2
  left_pair = {"from" => l1, "to" => r1}
  right_pair = {"from" => l2, "to" => r2}
else
  left_pair = {"from" =>l2, "to" => r2}
  right_pair = {"from" =>l1, "to" => r1}
end

if left_pair["to"] <= right_pair["from"]
  p 0
  exit
end

if left_pair["to"] >= right_pair["to"]
  p right_pair["to"] - right_pair["from"]
  exit
end

p left_pair["to"] - right_pair["from"]
