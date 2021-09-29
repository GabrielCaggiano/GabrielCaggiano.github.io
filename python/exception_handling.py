#!/usr/local/bin/python

i = 0
while i == 0:

    try:
        print("Let's divide some numbers!")
        a1 = input("Enter numerator: ")
        b1 = input("Enter denominator: ")
        a = int(a1)
        b = int(b1)
    
        print(a1 + " divied by " + b1 + " equals: " + str(a/b))
        i += 1
    
    except (ZeroDivisionError, ValueError):
        print("\n" + "Invalid input, please enter a valid number e.g(1234) with a denominator that is not 0." + "\n")



