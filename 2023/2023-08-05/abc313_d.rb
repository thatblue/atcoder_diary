$stdout.sync = true

n, k = gets.chomp.split.map(&:to_i)

$candidates = {}

def calc(combination, result)
    if $candidates.empty?
        $candidates[]
    end
end

(1..n).to_a.combination(k).each do |combination|
    puts (['?'] + combination).join ' '
    t = gets.chomp.to_i

    if t == -1
        # 不正解扱い
        exit
    else
        result = calc(combination, t)
        if result.count == 1
            puts result[0]
            exit
        end
    end
end
