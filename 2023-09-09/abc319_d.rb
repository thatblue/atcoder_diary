N, m = gets.chomp.split.map(&:to_i)
WORDS = gets.chomp.split.map(&:to_i)

minimum_sentence_length = WORDS.sum + (N - 1)

def dividable?(min_length, count)
  parts = []
  length = 0
  max_length = min_length
  WORDS.each_with_index do |word, i|
    length += word
    length += 1 if i < N - 1
    if length >= min_length
      length -= 1 if i < N - 1
      parts << length
      max_length = [max_length, length].max
      length = 0
    end
  end

  [parts.size >= count, parts.count, max_length]
end


min_length = 1
max_length = minimum_sentence_length
prev_ans = nil
ans = nil
pittari_ans = minimum_sentence_length
while min_length < max_length do
  center = (min_length + max_length + 1) / 2
  prev_ans = ans

  result, row_count, ans = dividable?(center, m)
  pittari_ans = [ans, pittari_ans].min if row_count == m
  if result
    min_length = center
  else
    max_length = center - 1
  end
end

puts row_count == m ? ans : pittari_ans
