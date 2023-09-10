# 二分探索

`Array#bsearch`や`Array#bsearch_index`では解決できないパターン。

じっくり読みたい場合はこの記事を参照のこと。
https://zenn.dev/forcia_tech/articles/20191223_advent_calendar

## 何らかの最大値を見つけたい

```ruby
ok = min # 可能性としてありうる最小の値をセットしておく
ng = max + 1 # 絶対にありえない最小の値をセットしておく

while (ng - ok) > 1
    center = (ok + ng) / 2

    # ... 何らかの検証処理

    if is_ok?(center)
        # 条件を満たしているので探索下限を引き上げる
        ok = center
    else
        # 条件を満たしていないので探索上限を引き下げる
        ng = center
    end
end

puts ok
```

## 何らかの最小値を見つけたい

```ruby
ng = min - 1 # 絶対にありえない最大の値をセットしておく
ok = max # 可能性としてありうる最大の値をセットしておく

while (ok - ng) > 1
    center = (ok + ng) / 2

    # ... 何らかの検証処理

    if is_ok?(center)
        # 条件を満たしているので探索下限を引き下げる
        ok = center
    else
        # 条件を満たしていないので探索上限を引き上げる
        ng = center
    end
end

puts ok
```
