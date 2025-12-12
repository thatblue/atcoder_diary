class Array
  def average
    sum(0.0) / length
  end
end

n, m = gets.chomp.split.map(&:to_i)

all_birds = Array.new(m + 1) { [] }
n.times do
  type, size = gets.chomp.split.map(&:to_i)
  all_birds[type] << size
end

all_birds[1..].each do |birds|
  puts birds.average
end
