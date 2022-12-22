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

## ランレングス圧縮

`aabbbcccc`を`a2b3c4`に変換するアレ。
`String#squeeze` したいけど文字数の情報は欲しく、 `Array#tally` では順番の情報が潰れる、というときに使う。

```ruby
def rle(string)
  prev_char = string[0]
  count = 1
  length = string.length

  compressed = []
  1.upto(length - 1) do |i|
    if prev_char != string[i]
      compressed << [prev_char, count]
      count = 1
      prev_char = string[i]
      next
    end

    count += 1
  end
  compressed << [prev_char, count]
  compressed
end
```
