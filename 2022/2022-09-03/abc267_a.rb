s = gets.chomp

diffs = {
  'Monday' => 5,
  'Tuesday' => 4,
  'Wednesday' => 3,
  'Thursday' => 2,
  'Friday' => 1,
}

puts diffs[s]
