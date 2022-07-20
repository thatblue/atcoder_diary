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
