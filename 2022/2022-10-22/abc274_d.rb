n, x, y = gets.chomp.split.map(&:to_i)

x_diffs = []
y_diffs = []
gets.chomp.split.map.with_index do |value, index|
  x_diffs << value.to_i if index.even?
  y_diffs << value.to_i if index.odd?
end

def pos_available?(target, start, steps, memo, depth)
  if steps.length == 0
    return target == start
  end

  return memo[target][depth] unless memo[target].nil? || memo[target][depth].nil?

  current_step = steps[-1]
  prev_steps = steps[0..-2]

  memo[target] ||= {}
  memo[target][depth] = pos_available?(target - current_step, start, prev_steps, memo, depth + 1) || pos_available?(target + current_step, start, prev_steps, memo, depth + 1)
end

puts pos_available?(x, x_diffs[0], x_diffs[1..], {}, 0) && pos_available?(y, 0, y_diffs, {}, 0) ? 'Yes' : 'No'
