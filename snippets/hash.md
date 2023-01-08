## Hashをeachしたいとき

```ruby
{1 => 2, 2 => 3, 3 => 4}.each do |key, value|
  puts "#{key} #{value}"
end
```