n, t, m = gets.chomp.split.map(&:to_i)

$tree = Hash.new { |h, k| h[k] = {} }
m.times do
  a, b = gets.chomp.split.map(&:to_i)
  $tree[a][b] = true
  $tree[b][a] = true
end

def is_dangerous?(team_members)
  length = team_members.length
  length.times do |i|
    (i + 1).upto(length - 1) do |j|
      return true if $tree[team_members[i]][team_members[j]] == true
    end
  end

  false
end

$team_count = {}

def search(candidates, team)
  count = candidates.length
  return 1 if count == 1

  if team == 1
    return $team_count[candidates] unless $team_count[candidates].nil?

    $team_count[candidates] = is_dangerous?(candidates) ? 0 : 1
    return $team_count[candidates]
  end

  tmp = 0
  1.upto(count - team + 1) do |i|
    candidates.combination(i).each do |team_members|
      next if is_dangerous?(team_members)

      tmp += search(candidates - team_members, team - 1)
    end
  end

  tmp
end

puts search((1..n).to_a, t) / 2
