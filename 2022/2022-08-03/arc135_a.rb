# cf. https://atcoder.jp/contests/arc135/submissions/32824502

VERY_LARGE_PRIME = 998244353

x = gets.chomp.to_i

FRAGMENTS = {}

def fragments(x)
  if x <= 4
    return x
  end

  if FRAGMENTS[x]
    return FRAGMENTS[x]
  end

  if x.even?
    FRAGMENTS[x] = fragments(x / 2) ** 2 % VERY_LARGE_PRIME
  else
    FRAGMENTS[x] = (fragments(x / 2) * fragments(x / 2 + 1)) % VERY_LARGE_PRIME
  end
end

p fragments(x)
