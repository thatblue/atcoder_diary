## メモ化再帰バージョン ネスト深すぎてREになるやつ
VERY_LARGE_PRIME = 10 ** 9 + 7
n = gets.chomp.to_i

$fibos = Hash.new
$fibos[1] = 1
$fibos[2] = 1

def fibo(num)
  return $fibos[num] if $fibos.has_key?(num)

  $fibos[num] = (fibo(num - 1) + fibo(num - 2)) % VERY_LARGE_PRIME

  $fibos[num]
end

puts fibo(n)
