

The specification can be found here: https://github.com/JumpstartLab/curriculum/blob/master/source/projects/enigma.markdown

# How to use Enigma?

1. cd into the bin directory. Only run commands from this directory!

2. Encrypting: Run encrypt.rb to encrypt a message. Pass the name of the text file with the message to encrypt and the file name you would like to use for the program to write the encrypted message to.

    ```
    $ ruby encrypt.rb message.txt encrypted.txt
    Created 'encrypted.txt' with the key 82648 and date 030415
    ```

3. Decrypting: Run decrypt.rb to decrypt a message. Pass in the name of the text file that holds the encrypted message, the file name you would like to use to save the decrypted message, the key, and the date.

```
$ ruby decrypt.rb encrypted.txt decrypted.txt 82648 030415
Created 'decrypted.txt' with the key 82648 and date 030415
```

4. Cracking: Run crack.rb to crack a message. Pass in the name of the encrypted file you would like to crack, the name of the file where you would like to save the cracked message, and a date.

```
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
Created 'cracked.txt' with the cracked key 82648 and date 030415
```








