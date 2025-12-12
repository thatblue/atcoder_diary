n, q = gets.chomp.split.map(&:to_i)
x = gets.chomp.split.map(&:to_i)

boxes = Array.new(n + 1, 0)
boxes[0] = q + 1 # 使わないので大きな値を入れておく

ans = Array.new(q + 1, 0)
ball_min = 0
ball_min_index = 1
x.each_with_index do |box_no, index|
  task_no = index + 1
  if box_no > 0
    boxes[box_no] += 1 
    ans[task_no] = box_no
  else
    boxes[ball_min_index] += 1
    ans[task_no] = ball_min_index
  end

  ball_min = boxes.min
  ball_min_index = boxes.index(ball_min)
end

puts ans[1..].join(' ')