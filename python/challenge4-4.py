#!/usr/local/bin/python

i = 0

while i == 0:

    def div2(x):
        """
        Takes an integer as an input and returns the int divided by two
        :param x: int
        :return: x divided by two
        """
        return x/2

    def multiply4(y):
        """
        Takes an integer as an input and returns the int multiplied by 4
        :param y: int
        :return: y multiplied by 4
        """

        return y * 4

    try: 
        integer = int(input("Enter an integer: "))
        result = div2(integer)
        resultX4 = multiply4(result)

        print("Your integer divided by 2 equals: " + str(result))
        print(str(result) + " multiplied by 4 equals: " + str(resultX4))

        i += 1

    except ValueError:
        print("Invalid input.  Please enter a valid number")



