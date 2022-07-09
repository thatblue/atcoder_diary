include Math


a, b, d = gets.chomp.split.map(&:to_i)
rad = d * Math::PI / 180


new_a = a * Math.cos(rad) - b * Math.sin(rad)
new_y = a * Math.sin(rad) + b * Math.cos(rad)

print "#{new_a} #{new_y}"