class Encryptor

  def supported_characters
    (" ".."z").to_a 
  end

  def cipher(num)
   super_secret_code = supported_characters.rotate(num)
   Hash[supported_characters.zip(super_secret_code)]
  end

  def encrypt_letter(letter, rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string, rotation)
    #cut the string into letters
    letters = string.split("")
    #encrypt the letters in array one at a time, gathering the results
    results = letters.collect do |l| 
      code_letter = encrypt_letter(l, rotation) 
    end 
    #join the results back together
    results.join
  end 

  def decrypt(string, rotation)
    encrypt(string, -(rotation))
  end 

  def decrypt_file(filename, rotation)
    #Create the file handle to the input file
    f = File.open(filename, "r")
    #Read the text of the input file
    impenetrable = f.read 
    f.close 
    #Encrypt the text
    plaintext = decrypt(impenetrable, rotation)
    #Create a name for the output file
    secret_file = filename.gsub("encrypted", "decrypted") 
    #Create an output file handle
    secrets = File.open(secret_file, "w")
    #Write out the text
    secrets.write(plaintext)
    #Close the file
    secrets.close
  end 

  def encrypt_file(filename, rotation)
    #Create the file handle to the input file
    f = File.open(filename, "r")
    #Read the text of the input file
    secrets = f.read 
    f.close 
    #Encrypt the text
    ciphertext = encrypt(secrets, rotation)
    #Create a name for the output file
    impenetrable_file = "encrypted" + filename 
    #Create an output file handle
    inpenetrated = File.open(impenetrable_file, "w")
    #Write out the text
    inpenetrated.write(ciphertext)
    #Close the file
    inpenetrated.close 
  end 

  def crack(message)
    supported_characters.count.times.collect do |attempt|
      cracky = decrypt(message, attempt)
      puts cracky
    end 
    
  end 

end