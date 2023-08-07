n = gets.chomp.to_i

board = Array.new (n + 1) { Array.new( n + 1, true) }

(n-1).times do 
    r, c = gets.chomp.split.map(&:to_i)
    board[r] = Array.new(n + 1, false)
    (1..n).each do |i|
        board[i][c] = false
        distance = r - i
        board[i][c - distance] = false if (c - distance).between?(1, n)
        board[i][c + distance] = false if (c + distance).between?(1, n)
    end
end

(1..n).each do |i|
    (1..n).each do |j|
        if board[i][j]
            puts "#{i} #{j}"
            exit
        end
    end
end

puts -1
