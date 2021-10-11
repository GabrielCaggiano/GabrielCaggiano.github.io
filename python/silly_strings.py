#!/usr/local/bin/python
#Takes a string as an input and prints it

def strings(x):
    """
    Accepts a string as a paramter and prints it
    :param x: str.
    :return: the string printed.
    """
    return x

a = input("Write someting silly: ")
strings(str(a))
print("You wrote: " + a)

if len(a) % 2 == 0:
    print("That is hilarious!!")
else:
    print("Well, that is odd...")