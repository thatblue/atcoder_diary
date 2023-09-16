# cf. https://atcoder.jp/contests/abc320/submissions/45624536
require 'ac-library-rb/priority_queue'

n, m = gets.chomp.split.map(&:to_i)

events = []

presence = AcLibraryRb::PriorityQueue.new([*1..n]) { |a, b| a < b }
comeback = AcLibraryRb::PriorityQueue.new { |a, b| a[0] < b[0] }
gain_somens = Array.new(n + 1, 0)
m.times do
  time, somen, return_time = gets.chomp.split.map(&:to_i)

  while comeback.get && comeback.get[0] <= time do
    _, returned_person = comeback.pop
    presence.push(returned_person)
  end

  next if presence.empty?

  gain_person = presence.pop
  gain_somens[gain_person] += somen

  comeback.push([time + return_time, gain_person])
end

puts gain_somens[1..n]
