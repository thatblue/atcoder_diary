n = gets.chomp.to_i

voters = []
aoki_voters = 0
n.times do
  current_town_voters = gets.chomp.split.map(&:to_i)
  voters << current_town_voters
  aoki_voters += current_town_voters[0]
end

voters.sort! {|a, b| b[0] + b[1] <=> a[0] + a[1]}

takahashi_voters = 0
speech_town_count = 0
voters.each do |current_town_voters|
  takahashi_voters += current_town_voters.sum
  aoki_voters -= current_town_voters[0]
  speech_town_count += 1

  if takahashi_voters > aoki_voters
    p speech_town_count
    exit
  end
end
