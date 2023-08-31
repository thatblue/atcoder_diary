h, w = gets.chomp.split.map(&:to_i)

top = {}
h.times do |i|
  has_cookies = false
  start_of_cookies = nil
  end_of_cookies = nil
  gets.chomp.chars.each_with_index do |v, j|
    is_cookie = v == '#'

    if is_cookie
      has_cookies = true
      start_of_cookies ||= [i, j]
      unless end_of_cookies.nil?
        # 一度クッキー列が切れた後に復活したらそこの左隣が食べたところ
        puts "#{i + 1} #{j}"
        exit
      end

      end_of_cookies = [i, j] if j == w - 1
    else
      end_of_cookies = [i, j - 1] unless start_of_cookies.nil?
    end
  end

  if has_cookies
    # クッキーの配置は2 * 2以上のサイズがあるので、食べた行も必ず1枚以上のクッキーがあるはず
    if top.empty?
      top[:left] = start_of_cookies
      top[:right] = end_of_cookies
      next
    end

    # 一番上の列と比べて両端が欠けてないかの検証
    if top[:left][1] != start_of_cookies[1]
      eaten = top[:left][1] < start_of_cookies[1] ? start_of_cookies : top[:left]
      puts "#{eaten[0] + 1} #{eaten[1]}"
      exit
    end

    if top[:right][1] != end_of_cookies[1]
      eaten = top[:right][1] < end_of_cookies[1] ? top[:right] : end_of_cookies
      puts "#{eaten[0] + 1} #{eaten[1] + 2}"
      exit
    end
  end
end
