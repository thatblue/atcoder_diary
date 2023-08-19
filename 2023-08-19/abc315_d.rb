h, w = gets.chomp.split.map(&:to_i)

cookies = []
h.times do
  cookies << gets.chomp.chars
end

cookies_count = h * w
current_h = h
current_w = w
if h < w
  cookies = cookies.transpose if h < w
  current_h = w
  current_w = h
end

loop do
  next_cookies = []
  next_h = 0
  next_w = 0
  cookies.each do |row|
    next_w = row.length
    squeezed = row.join.squeeze.length
    next if next_w > 1 && squeezed == 1

    next_cookies << row
    next_h += 1
  end

  current_cookies_count = next_h * next_w
  if cookies_count == current_cookies_count
    puts current_cookies_count
    exit
  end

  cookies_count = current_cookies_count
  cookies = next_cookies.transpose
end
