require 'ac-library-rb/priority_queue'

n, k = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

if n == k
  pp '(1)'
  # nとkが一致しているなら全体をソートするしかない
  puts array.sort.join ' '
  exit
end

start_max_index = n - k
current_increase = 0
prev_value = 0
max_increase = 0
array.each do |value|
  if prev_value < value
    current_increase += 1
    max_increase = [current_increase, max_increase].max
  else
    current_increase = 1
  end
  prev_value = value
end

if max_increase >= k
  # 単調増加する区間が長さk以上あれば文字列を変化させないで済む
  pp '(2)'
  puts array.join ' '
  exit
end

original_last_k = array.last(k)
sorted_queue = AcLibraryRb::PriorityQueue.new(original_last_k.dup) { |a, b| a < b }

if original_last_k.first == sorted_queue.get
  # 末尾k個をソートして先頭が変わらないのであれば末尾をソートするのが最善
  pp '(3)'
  sorted_last_k = []
  until sorted_queue.empty?
    sorted_last_k << sorted_queue.pop
  end

  puts (array.first(n-k) + sorted_last_k).join ' '
  exit
end

# array[n - k]とその右側が単調増加していればその分ソート範囲を減らせる
offset_index = n - k
offset_count = 0
prev_value = array[n - k]
while array[offset_index - 1] < prev_value
  offset_count += 1
  offset_index -= 1
  prev_value = array[offset_index]
end

offset_sort_target = AcLibraryRb::PriorityQueue.new(original_last_k.first(offset_count).dup) { |a, b| a < b }

# TODO 多分オフセット分を全部比較しないと判断できない？
if original_last_k.first < offset_sort_target.get
  # オフセットした方が改善する
  offset_sort_array = []
  until offset_sort_target.empty?
    offset_sort_array << offset_sort_target.pop
  end
  pp '(4)'
  puts (array.first(n-k) + offset_sort_array + original_last_k.last(k-offset_count))
end

# やっぱり末尾をソートするのが最善だった
pp '(5)'
sorted_last_k = []
until sorted_queue.empty?
  sorted_last_k << sorted_queue.pop
end

puts (array.first(n-k) + sorted_last_k).join ' '
