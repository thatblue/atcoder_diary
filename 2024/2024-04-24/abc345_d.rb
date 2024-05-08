N, H, W = gets.chomp.split.map(&:to_i)

HEIGHT = 0
WIDTH = 1

def put_tile(board, h, w, start_i, start_j)
  (start_i...(start_i + h)).each do |i|
    (start_j...(start_j + w)).each do |j|
      # 範囲外なので置けない
      return nil if i >= H || j >= W

      # 既に別のタイルがあるので置けない
      return nil if board[i][j]

      board[i][j] = true
    end
  end

  board
end

@tiles = []
N.times do
  @tiles << gets.chomp.split.map(&:to_i)
end

def dfs(current_board, available_tiles, empty_positions)
  return true if empty_positions.zero? # 全部埋まったので探索終了

  return false if available_tiles.empty? # 全部埋まっていないのに候補のタイルがもうないので探索不可

  start_pos = []
  H.times do |i|
    W.times do |j|
      next if current_board[i][j]

      start_pos = [i, j]
      break
    end

    break unless start_pos.empty?
  end

  available_tiles.each do |tile_index|
    # 配置可能な一番上(？)の位置にタイルを置いてみて、置けたらさらに探索を続ける
    next_board = put_tile(current_board.map(&:dup), @tiles[tile_index][HEIGHT], @tiles[tile_index][WIDTH], start_pos[0], start_pos[1])
    next_board_trans = put_tile(current_board.map(&:dup), @tiles[tile_index][WIDTH], @tiles[tile_index][HEIGHT], start_pos[0], start_pos[1])

    result = dfs(next_board, available_tiles - [tile_index], empty_positions - @tiles[tile_index][HEIGHT] * @tiles[tile_index][WIDTH]) unless next_board.nil?
    result_trans = dfs(next_board_trans, available_tiles - [tile_index], empty_positions - @tiles[tile_index][HEIGHT] * @tiles[tile_index][WIDTH]) unless next_board_trans.nil?

    return true if result || result_trans
  end

  false
end

N.times do |first_tile_no|
  available_tiles = (0...N).to_a
  available_tiles.delete(first_tile_no)
  empty_positions = H * W - @tiles[first_tile_no][HEIGHT] * @tiles[first_tile_no][WIDTH]
  board = put_tile(Array.new(H) { Array.new(W, false) }, @tiles[first_tile_no][HEIGHT], @tiles[first_tile_no][WIDTH], 0, 0)
  if !board.nil? && dfs(board, available_tiles, empty_positions)
    puts 'Yes'
    exit
  end

  # 転置する方も試してみる
  board_trans = put_tile(Array.new(H) { Array.new(W, false) }, @tiles[first_tile_no][WIDTH], @tiles[first_tile_no][HEIGHT], 0, 0)
  if !board_trans.nil? && dfs(board_trans, available_tiles, empty_positions)
    puts 'Yes'
    exit
  end
end

puts 'No'
