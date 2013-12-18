require './encryptor.rb'

while true 
  @e = Encryptor.new 
  puts "Enter 'e' to encrypt, 'd' to decrypt, or 'q' to quit:"
  choice = gets.chomp

  if choice == "q"
    break
  elsif choice == "e"
    puts "What's your secret?"
    secret = gets.chomp
    puts "What rotation should we encrypt it with?"
    rotation = gets.chomp.to_i
    puts @e.encrypt(secret, rotation)
  elsif choice == "d"
    puts "What's the ciphertext?"
    cipher = gets.chomp
    puts "What rotation was it encrypted with?"
    rotation = gets.chomp.to_i
    puts @e.decrypt(cipher, rotation)
  else 
    puts "THERE'S ONLY THREE CHOICES."
  end 
end