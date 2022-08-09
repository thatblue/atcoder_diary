n = gets.chomp.to_i

QUEUE = gets.chomp.split.map(&:to_i)

DP = Array.new(n) {Array.new(n)}
def deque(head, tail)
  return DP[head][tail] if DP[head][tail]

  if head == tail
    DP[head][tail] = QUEUE[head]
    return DP[head][tail]
  end

  DP[head][tail] = [
    QUEUE[head] - deque(head + 1, tail),
    QUEUE[tail] - deque(head, tail - 1),
  ].max

  DP[head][tail]
end

p deque(0, n - 1)