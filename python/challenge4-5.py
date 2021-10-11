#!/usr/local/bin/python

def strTOfloat(x):
    """
    Takes a str and converts it to a float
    :param x: string
    :return: x as a float
    """
    return float(x)

i = 0

while i == 0 :

    try: 
        string = input("Enter a number: ")

        float = strTOfloat(string)

        print("Your string converted to a float is: ")
        print(float)

        i += 1

    except ValueError:
        print("Invalid input.  Please enter a number")


