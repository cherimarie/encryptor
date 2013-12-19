require './encryptor.rb'
require 'digest/md5'
 
@e = Encryptor.new
PASSWORD = "c4b4e9277626e187ae92a3d806faf229"
pw = false 

puts "What's the password?"
user_guess_enc = @e.encrypt(gets.chomp, 13)
user_guess_hash = Digest::MD5.hexdigest(user_guess_enc)
pw = true if user_guess_hash == PASSWORD 

while pw   
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