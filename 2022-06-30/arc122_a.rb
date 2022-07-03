def summary(a, n)
  formula_counts = []
  prev_summary = nil
  prev_summary_lower = nil
  (1..n).each do |i|
    index = i - 1
    if i == 1
      formula_counts[index] = 1
      summary_upper = a[0]
      summary_lower = 0
    elsif i == 2
      formula_counts[index] = 2
      summary_upper = a[0] + a[1]
      summary_lower = a[0] - a[1]
    else
      formula_count_prev = formula_counts[index - 1]
      formula_count_prev2 = formula_counts[index - 2]
      formula_counts[index] = formula_count_prev + formula_count_prev2
      summary_upper = prev_summary + a[index] * formula_count_prev
      summary_lower = prev_summary - prev_summary_lower - a[index] * formula_count_prev2
    end

    prev_summary = summary_upper + summary_lower
    prev_summary_lower = summary_lower
  end

  prev_summary % 1000000007
end

n = gets.chomp.to_i
a = gets.split(' ').map!(&:to_i)

p summary(a, n)