def collatz(number)
  if number < 1 || !number.integer?
    puts "Your number must be a positive integer"
    return
  end
  
  sequence = [number]     
  
  while sequence.last != 1    
  
    if number.even?         
      sequence << number/2
      number = number/2
    else       
      sequence << 3*number + 1
      number = 3*number + 1
    end
  end
  
  sequence                
  
end

def collatz_longest_sequence_length1(low_num, high_num) 
  if low_num < 1 || !low_num.integer? || high_num < 1 || !high_num.integer?   
    puts "Your numbers must be positive integers"
    return
  end
  
  sequence_lengths = [[0, 0]]  
                             
  current_num = low_num  
  
  while current_num <= high_num
    current_sequence = collatz(current_num) 
    current_length = current_sequence.length   
    high_length = sequence_lengths[0][1]      
    
    if current_length > high_length  
      sequence_lengths = [[current_num, current_length]] 

    elsif current_length == high_length 
      sequence_lengths << [current_num, current_length]
    current_num += 1
  end
  
  puts
  puts "there is/are #{sequence_lengths.length} integer(s), from #{low_num} to #{high_num} iclusive, with the longest collatz sequence of #{sequence_lengths[0][1]}."
  puts

  sequence_lengths.each do |pair|
    puts "the collatz sequence for #{pair[0]} is #{collatz(pair[0])}"
    puts
  end
end


puts "#{collatz(-1)}"
puts "collatz sequence for 1 = #{collatz(1)}"
puts "collatz sequence for 2 = #{collatz(2)}"
puts "collatz sequence for 3 = #{collatz(3)}"
puts "collatz sequence for 4 = #{collatz(4)}"
puts "collatz sequence for 5 = #{collatz(5)}"
puts "collatz sequence for 6 = #{collatz(6)}"
puts "collatz sequence for 7 = #{collatz(7)}"
puts "collatz sequence for 100 = #{collatz(100)}"

collatz_longest_sequence_length1(1, 20)
collatz_longest_sequence_length1(1, 1000000)