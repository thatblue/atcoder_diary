divmods = []
5.times do
  dish = gets.chomp.to_i

  div, mod = dish.divmod(10)
  divmods << {:div => div, :mod => mod}
end

divmods.sort! {|a, b| a[:mod] <=> b[:mod] }

mod_zero, has_mod = divmods.partition {|divmod| divmod[:mod] == 0 }
