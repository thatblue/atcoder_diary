def h_candidates(h, w)
  candidates = []
  i1_upto = [(h-2), w[0] - 2].min
  1.upto(i1_upto) do |i1|
    i2_upto = [(h - i1 - 1), w[1] - 2].min
    1.upto(i2_upto)do|i2|
      if h - (i1 + i2) <= w[2] - 2
        candidates.push([i1, i2, h - (i1 + i2)])
      end
    end
  end
  candidates
end

def valid_w(w, i1, i2, i3)
  i1 + i2 + i3 == w
end

input = gets.split(' ').map!(&:to_i)
h = input[0..2]
w = input[3..6]

h0_candidates = h_candidates(h[0], w)
h1_candidates = h_candidates(h[1], w)

count = 0
h0_candidates.each do|h0_candidate|
  h1_candidates.each do |h1_candidate|
    i0j2 = w[0] - (h0_candidate[0] + h1_candidate[0])
    i1j2 = w[1] - (h0_candidate[1] + h1_candidate[1])
    i2j2 = w[2] - (h0_candidate[2] + h1_candidate[2])

    if i0j2 > 0 && i1j2 > 0 && i2j2 > 0 && i0j2 + i1j2 + i2j2 == h[2]
      count += 1
    end
  end
end

p count