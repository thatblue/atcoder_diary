h, w = gets.chomp.split.map(&:to_i)

@grid_a = []
h.times do
  @grid_a << gets.chomp.split.map(&:to_i)
end

@grid_b = []
h.times do
  @grid_b << gets.chomp.split.map(&:to_i)
end

def bubble_sort(array)
  exchange_count = 0

  array_size = array.size
  exchanged = true
  while exchanged
    exchanged = false
    1.upto(array_size - 1) do |i|
      next if array[i - 1] < array[i]

      exchange_count += 1
      array[i - 1], array[i] = array[i], array[i - 1]
      exchanged = true
    end
  end

  exchange_count
end

def compare_swapped(swap_i_array, swap_j_array)
  swap_i_array.each_with_index do |swap_i, i|
    swap_j_array.each_with_index do |swap_j, j|
      return nil unless @grid_a[swap_i][swap_j] == @grid_b[i][j]
    end
  end

  bubble_sort(swap_i_array) + bubble_sort(swap_j_array)
end

ans = h * w + 1
(0...h).to_a.permutation.to_a.each do |swap_i_array|
  (0...w).to_a.permutation.to_a.each do |swap_j_array|
    current_swap_count = compare_swapped(swap_i_array, swap_j_array)
    ans = [ans, current_swap_count].min unless current_swap_count.nil?
  end
end

puts ans == h * w + 1 ? -1 : ans
