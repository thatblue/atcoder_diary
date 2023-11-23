# ループ操作

## N回繰り返す(何回目であるかの情報は不要)

```ruby
n.times do
  puts "Hello, World!"
end
```

## N回繰り返す(0-indexで何回目かが分かる)

```ruby
n.times do |i|
  puts "Hello, World" + "!" * i
end
```

## N回繰り返す(1-indexで何回目かが分かる)

```ruby
(1..n).each do |count|
  puts "Hello, World" + "!" * count
end
```

## 無限ループ

```ruby
loop do
  puts 'Hi!'
end
```

## ランレングス圧縮

`aabbbcccc`を`a2b3c4`に変換するアレ。
`String#squeeze` したいけど文字数の情報は欲しく、 `Array#tally` では順番の情報が潰れる、というときに使う。

```ruby
def rle(string)
  chunks = []
  string.chars.chunk { |char| char }.each do |char, ary|
    chunks << [char, ary.size]
  end

  chunks.map { |char, size| char + size.to_s }.join
end
```
