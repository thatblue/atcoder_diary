# cf. https://atcoder.jp/contests/abc325/submissions/46907126
require 'ac-library-rb/priority_queue'

IN = 0
OUT = 1

n = gets.chomp.to_i

products = []
n.times do
  in_usec, duration = gets.chomp.split.map(&:to_i)
  out_usec = in_usec + duration
  products << [in_usec, out_usec]
end

products.sort!

queue = AcLibraryRb::PriorityQueue.min([])
printed_count = 0
products_index = 0
current_time = 0
loop do
  if queue.empty?
    break if products_index == n

    current_time = products[products_index][IN]
  end

  # 通り過ぎた商品を全てpopする
  queue.pop while queue.size.positive? && queue.get < current_time

  # 現在時刻に印字範囲に入ってきた商品をすべてキューに入れる
  while products_index < n && products[products_index][IN] == current_time
    queue << products[products_index][OUT]
    products_index += 1
  end

  unless queue.empty?
    queue.pop
    printed_count += 1
  end

  current_time += 1
end

puts printed_count
