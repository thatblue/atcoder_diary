@n = gets.chomp.to_i
@s = gets.chomp + '..'
@t = gets.chomp + '..'

if @s.count('B') != @t.count('B')
  # 石の数が合わなければ絶対に無理
  puts -1
  exit
end

@memo = {}
@visited = {}
def dfs(current_s)
  return @memo[current_s] if @memo.key?(current_s)
  return 0 if current_s == @t

  blank_index = current_s.index('.')
  start_index = if blank_index == 0
    2
  elsif blank_index == 1
    3
  else
    0
  end

  result = Float::INFINITY
  (start_index..@n).each do |i|
    replace = current_s[i, 2]
    next if replace.include?('.')

    next_s = current_s.sub('..', replace)
    if i == 0
      next_s = '..' + next_s[2..]
    elsif i == @n
      next_s = next_s[0..@n-1] + '..'
    else
      next_s = next_s[0..i-1] + '..' + next_s[i+2..]
    end

    # 回り道するだけなので探索しない
    next if @visited[next_s]

    @visited[next_s] = true
    result = [result, dfs(next_s) + 1].min
    @visited[next_s] = false
  end

  @memo[current_s] = result
end

@visited[@s] = true
puts dfs(@s)
