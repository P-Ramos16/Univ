# Complete the code to make the HiLo game...

import random

def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101);
    print("Can you guess my secret?")
    # put your code here

    guess = 0
    num_guesses = 0

    while guess != secret:
        guess = int(input("Enter your guess -->"))

        if 1 <= guess <= 100:

            if guess < secret:
                print("Your guess is too low!")
                
            elif guess > secret:
                print("Your guess is too High!")
        
        else:
            print("Your guess is out of range!")

        num_guesses += 1

    print("You guessed right! It only took you {:0d} guesses!".format(num_guesses))


main()
