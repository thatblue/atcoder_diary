## Hashをeachしたいとき

```ruby
{1 => 2, 2 => 3, 3 => 4}.each do |key, value|
  puts "#{key} #{value}"
end
```

## 1からNまでをキーにして全部にtrueを突っ込んだHashを作る

```ruby
hash = (1..n).to_a.map { |i| [i, true] }.to_h
```
