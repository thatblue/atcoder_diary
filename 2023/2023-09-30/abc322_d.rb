
def get_block
  block = []
  4.times do
    block << gets.chomp.chars.map { |v| v == '#' }
  end

  block
end

$blocks = []

$blocks << get_block
$blocks << get_block
$blocks << get_block

def in_grid(i, j)
  return i.between?(0, 3) && j.between?(0, 3)
end

def search_block_order(block_id, grid)
  current_block = $blocks[block_id]
  4.times do
    -3.upto(6) do |i_offset|
      -3.upto(6) do |j_offset|
        current_grid = grid.map(&:dup)
        hamidashi = false
        # 現在のオフセットでとりあえず現在のポリオミノを置けるか検証する
        4.times do |i|
          4.times do |j|
            # 実際のグリッド上の位置
            real_i = i + i_offset
            real_j = j + j_offset

            if !in_grid(real_i, real_j) && current_block[i][j]
              # ポリオミノがみ出している場合は探索打ち切り
              hamidashi = true
              break
            end
            if in_grid(real_i, real_j) && current_block[i][j]
              current_grid[real_i][real_j] += 1
            end
          end
          break if hamidashi
        end

        next if hamidashi

        if current_grid.flatten.max == 1
          if block_id == 2
            if current_grid.flatten.sum == 16
              puts 'Yes'
              exit
            else
              puts 'No'
              exit
            end
          else
            search_block_order(block_id + 1, current_grid)
          end
        end
      end
    end

    current_block = current_block.transpose.reverse
  end
end

search_block_order(0, Array.new(4) { Array.new(4, 0) })

puts 'No'
