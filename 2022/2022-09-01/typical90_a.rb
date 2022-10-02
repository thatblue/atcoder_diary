_, l = gets.chomp.split.map(&:to_i)
k = gets.chomp.to_i

last_edge = 0
FRAGMENTS = gets.chomp.split.map {|next_edge|
  next_fragment = next_edge.to_i - last_edge
  last_edge = next_edge.to_i
  next_fragment
}

FRAGMENTS << l - last_edge

def dividable?(min_length, count)
  parts = []
  length = 0
  FRAGMENTS.each do |fragment|
    length += fragment
    if length >= min_length
      parts << length
      length = 0
    end
  end

  parts.size >= count
end

min_fragment = 1
max_fragment = l / (k + 1)

while min_fragment < max_fragment do
  center = (min_fragment + max_fragment + 1) / 2

  if dividable?(center, k + 1)
    min_fragment = center
  else
    max_fragment = center - 1
  end
end

p min_fragment