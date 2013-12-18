require './encryptor.rb'

while true 
  @e = Encryptor.new 
  puts "Enter your secret message, or 'q' to quit:"
  secret = gets.chomp

  if secret == "q"
    break
  else 
    puts "What rotation should we encrypt it with?"
    rotation = gets.chomp.to_i
    puts @e.encrypt(secret, rotation)
  end 
end 

