arr = (1..10).to_a

odd_arry = arr.select! {|num| num.odd?}

puts odd_arry
