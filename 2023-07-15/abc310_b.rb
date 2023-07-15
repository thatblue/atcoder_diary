n, m = gets.chomp.split.map(&:to_i)

products = []
n.times do |i|
  price, _, *functions = gets.chomp.split.map(&:to_i)

  products[i] = { :price => price, :functions => functions.sort }
end

n.times do |i|
  (i + 1).upto(n - 1) do |j|
    diff_ij = products[i][:functions] - products[j][:functions]
    diff_ji = products[j][:functions] - products[i][:functions]

    if diff_ij.empty? && diff_ji.empty? && products[i][:price] != products[j][:price]
      # 同一機能で価格差のある商品がある
      puts 'Yes'
      exit
    end

    if diff_ij.empty? && !diff_ji.empty? && products[i][:price] >= products[j][:price]
      # jの方が高機能
      puts 'Yes'
      exit
    end

    if diff_ji.empty? && !diff_ij.empty? && products[i][:price] <= products[j][:price]
      # iの方が高機能
      puts 'Yes'
      exit
    end
  end
end

puts 'No'
