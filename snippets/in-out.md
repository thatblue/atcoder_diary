# 入出力

## 標準入力の受け取り

### 整数として値を1つ受け取る
```ruby
n = gets.chomp.to_i
```

### 文字列として値を1つ受け取る
```ruby
s = gets.chomp
```

### 文字列として値を受け取り、1文字ずつに分解する
```ruby
s = gets.chomp.chars
```

### 数値としてスペースで区切った複数の値を受け取る
#### 個数が分かっていて、個別に変数として取得したい場合

```ruby
n, m = gets.chomp.split.map(&:to_i)
```

#### 配列としてまとめて取得したい場合
```ruby
array = gets.chomp.split.map(&:to_i)
```

#### 取得しながら累積和を計算したい場合
```ruby
total = 0
cumu_sum = gets.chomp.split.map { |value| total += value.to_i }
```

#### 最初の要素を捨てたい場合

```ruby
*, m = gets.chomp.split.map(&:to_i)
```

#### 先頭と末尾以外の要素を捨てたい場合

```ruby
n, *, m = gets.chomp.split.map(&:to_i)
```

#### 不定な複数行の値を受け取りたい場合
```ruby
n = gets.chomp.to_i

array = []
n.times do
  array << gets.chomp.split.map(&:to_i)
end
```

## 標準出力への書き出し

### 数値1つを出力

```ruby
puts num
```

### 配列の値を結合して文字列として出力する
#### 区切り文字が不要な場合
```ruby
puts array.join
```

#### 区切り文字が必要な場合
```ruby
puts array.join ' '
```
