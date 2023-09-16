require 'set'

n, m = gets.chomp.split.map(&:to_i)

events = []
presence = SortedSet.new((1..n).to_a)
comeback = Hash.new {|hash, key| hash[key] = []}
gain_somens = Array.new(n + 1, 0)
m.times do
  time, somen, return_time = gets.chomp.split.map(&:to_i)

  comeback.keys.sort.each do |comeback_time|
    next if time < comeback_time

    comeback[comeback_time].each do |returned_person|
      presence.add(returned_person)
    end
    comeback.delete(comeback_time)
  end

  next if presence.empty?

  gain_person = presence.first
  gain_somens[gain_person] += somen

  comeback[time + return_time] << gain_person
  presence.delete(gain_person)
end

puts gain_somens[1..n]
