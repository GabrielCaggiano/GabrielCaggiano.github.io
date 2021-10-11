#!/usr/local/bin/python
#Takes a number as an input and returns the number squared

def squared(x):
    '''
    Takes a number as parameter and returns the number squared
    :param x: float.
    :return: x sqaured
    '''
    return (100 * (x ** 2)//1)/100

a = input("Enter a number: ")

try:
    result = squared(float(a))
    print(str(a) + " sqaured equals: " + str(result))
except ValueError:
    print("Invalid input, not a number")

