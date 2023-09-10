n, l = gets.chomp.split.map(&:to_i)
k = gets.chomp.to_i
prev_length = 0
yokans = gets.chomp.split.map { |v|
    current_length = v.to_i - prev_length
    prev_length += current_length
    current_length
}

parts_count = k + 1
ok = yokans.min
ng = l
while (ng - ok) > 1
    pp [ok, ng]
    center = (ok + ng) / 2

    count = 1
    current_length = 0
    yokans.each do |yokan|
        if current_length >= center
            # 直近の長さが所定の長さ以上になっていれば現在の切れ目で切り離す
            count += 1
            current_length = 0
        end

        current_length += yokan
    end

    if count >= parts_count && current_length >= center
        ok = center
    else
        # parts_count個に分けるには1個あたりが長すぎる
        ng = center
    end
end

puts ok