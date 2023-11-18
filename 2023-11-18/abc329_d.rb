require 'sorted_set'

n, m = gets.chomp.split.map(&:to_i)
votes = gets.chomp.split.map(&:to_i)

scores = {}
ranking = Hash.new { |hash, key| hash[key] = SortedSet.new }
max_vote = 0
votes.each do |candidate|
  scores[candidate] = 0 unless scores.include?(candidate)
  ranking[scores[candidate]].delete(candidate)
  scores[candidate] += 1
  ranking[scores[candidate]].add(candidate)

  max_vote = [scores[candidate], max_vote].max

  puts ranking[max_vote].first
end
