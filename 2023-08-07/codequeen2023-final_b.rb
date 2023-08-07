n = gets.chomp.to_i

r_candidates = (1..n).to_a.map { |i| [i, true] }.to_h
c_candidates = (1..n).to_a.map { |i| [i, true] }.to_h

queens = {}

(n-1).times do
    r, c = gets.chomp.split.map(&:to_i)
    r_candidates.delete(r)
    c_candidates.delete(c)
    queens[[r, c]] = true
end


r_candidate = r_candidates.keys[0]
c_candidate = c_candidates.keys[0]

(1..n).each do |i|
    distance = r_candidate - i
    if queens.include?([i, c_candidate - distance]) || queens.include?([i, c_candidate + distance])
        puts -1
        exit
    end
end

puts "#{r_candidate} #{c_candidate}"
