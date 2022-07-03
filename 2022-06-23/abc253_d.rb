def summary_upto(upto)
  (1 + upto) * upto / 2
end

def multiples_summary(x, upto)
  div = upto / x
  summary_upto(div) * x
end

n, a, b = gets.split.map!(&:to_i)

sum = summary_upto(n)

a_multiples_summary = multiples_summary(a, n)
b_multiples_summary = multiples_summary(b, n)
a_b_multiples_summary = multiples_summary(a.lcm(b), n)

p sum - ((a_multiples_summary + b_multiples_summary) - a_b_multiples_summary)
