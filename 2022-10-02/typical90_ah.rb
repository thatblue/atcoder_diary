# cf. https://atcoder.jp/contests/typical90/submissions/23936258

n, k = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)

chars = Hash.new(0)
max = 0
chars_kinds = 0
l = 0
r = 0

while r < n
  add_value = array[r]
  if chars[add_value] == 0
    chars_kinds += 1
  end
  chars[add_value] += 1

  while chars_kinds > k
    delete_value = array[l]
    chars[delete_value] -= 1
    if chars[delete_value] == 0
      chars_kinds -= 1
    end
    l += 1
  end

  max = [max, r - l + 1].max

  r += 1
end

p max
