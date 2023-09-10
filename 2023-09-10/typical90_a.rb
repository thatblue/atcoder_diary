n, l = gets.chomp.split.map(&:to_i)
k = gets.chomp.to_i
prev_length = 0
yokans = gets.chomp.split.map { |v|
    current_length = v.to_i - prev_length
    prev_length += current_length
    current_length
}

# 最後の一切れをカウント
yokans << l - prev_length

parts_count = k + 1
ok = yokans.min
ng = l
while (ng - ok) > 1
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

    if current_length < center
        # 最後のようかんがcenter未満の場合はその1つ前のようかんにくっつける
        count -= 1
    end

    if count >= parts_count
        # 所定個数以上に分割できるので、もっと長くできる可能性がある
        ok = center
    else
        # parts_count個に分けるには1個あたりが長すぎる
        ng = center
    end
end

puts ok
