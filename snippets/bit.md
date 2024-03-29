# ビット演算

## 基本的な演算子
- ` | ` 論理和
    - ` |= ` 論理和して代入
- ` & ` 論理積
    - ` &= `論理積して代入
- ` << ` 左にビットシフト
    - `bits << n`
- ` >> ` 右にビットシフト(2^0の位未満になった桁は消える)

## n桁目(0-index)のビットを立てる
```ruby
bits |= (1 << n)
```

## n桁目(0-index)のビット

2^0の位(`to_s`したときに右端に来る方)が0になることに注意

```ruby
bits[n]
```

## 立っているビットを数え上げる

`bit`が2進数で`n`桁以内であると分かっている場合
```ruby
active_bits = []
n.times do |i|
    active_bits << i + 1 if bit[i] == 1
end
```

## リストで示した桁のビットを立てた値を作る

```ruby
bit = bits.inject(0) { |result, digit| result (1 << (digit-1)) }
```

## n桁のビット全探索
```ruby
search_max = 2**n-1
(0..search_max).each do |bit|
    puts bit.to_s(2)
end
```
