# cf. https://atcoder.jp/contests/abc256/submissions/32569318
n = gets.chomp.to_i

sections = []
1.upto(n).each do
  l, r = gets.split(' ').map!(&:to_i)
  sections.push([l, r])
end

sections.sort!

merged_sections = []

sections.each do|section|
  end_of_sections = merged_sections.last
  if end_of_sections && end_of_sections[1] >= section[0]
    merged_sections[-1][1] = section[1] if end_of_sections[1] < section[1]
  else
    merged_sections.push(section)
  end
end

puts(merged_sections.map {|section| section.join(' ')})