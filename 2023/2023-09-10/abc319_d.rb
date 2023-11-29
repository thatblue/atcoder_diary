n, m = gets.chomp.split.map(&:to_i)
words = gets.chomp.split.map { |v|
    v.to_i + 1
}

min = words.max - 1
max = words.sum
while min + 1 < max
    center = (min + max) / 2

    lines = 1
    line_length = 0
    words.each do |word|
        line_length += word
        if line_length > center
            lines += 1
            line_length = word
        end
    end

    if lines > m
        # 規定行数で収めるには行あたりの文字数が足りない
        min = center
    else
        max = center
    end
end

puts max - 1
