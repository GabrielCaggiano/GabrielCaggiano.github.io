#!/usr/local/bin/python
#Write a function that takes at least 3 required parameters and 2 optional parameters

def group(x, y, a, b, l, m, i=0.2644, f = 100):
    """
    Finds the longest distance between 3 sets of coordinates (x,y),(a,b),(l,m) and returns the grouping size of the three points in inches, by default it returns the grouping size of a 6.5mm creedmoor cartridge shot at a distance of 100yds
    :param x: float.
    :param y: float.
    :param a: float.
    :param b: float.
    :param l: float.
    :param m: float.
    :param i: float.
    :param f: float.
    :return: the length of the longest distance between the three points, minus the diameter of the bullet used, and the distance of the target from the shooter.
    """

    #Formula for distance between 2 points on a graph
    #((x2 - x1)**2 + (y2 - y1)**2)**(1/2)
    #sqrt of x =  x ** (1/2)

    len1 = ((a - x)**2 + (b - y)**2)**(1/2) #distance between (x,y) and (a,b)
    len2 = ((l - x)**2 + (m - y)**2)**(1/2) #distance between (x,y) and (l,m)
    len3 = ((l - a)**2 + (m - b)**2)**(1/2) #distance between (a,b) and (l,m)

    def largest(array, n):
        """
        Retruns the largest number from an array
        :param array: array
        :param n: int, lenght of array
        :return: largest number in the array"""

        #set max as first array element
        max = array[0]

        #compare current max with next array element, replace max if next element is larger

        for i in range(1, n):
            if array[i] > max:
                max = array[i]
        return max

    #initialize array with distances betwen points, find length of the array and pass these as parameters to the largest() function
    arr = [len1, len2, len3]
    arr_len = len(arr)
    result = largest(arr, arr_len)

    #subtract the diameter of the bullet being used
    final = (100 * (result - i)//1)/100

    #print the group size, distance to target, and bullet diameter
    group_size = print("Group size is " + str(final) + " at a distance of" + str(f) + "yds with a bullet diameter of" + str(i))
    return group_size

print("Calculate the size of your grouping.")

#Get coordinates for each round
print("Enter coordinates for  round 1:")
r1x = float(input("Round 1 x: "))
r1y = float(input("Round 1 y: "))

print("Enter coordinates for  round 2:")
r2x = float(input("Round 2 x: "))
r2y = float(input("Round 2 y: "))

print("Enter coordinates for  round 3:")
r3x = float(input("Round 3 x: "))
r3y = float(input("Round 3 y: "))

#Get bullet diameter and distance to target
diameter = (input("Enter bullet diameter (default value is for 6.5 creedmoor): "))
distance = (input("Enter distance to target (default vale is 100yds): "))

grouping = print(group(r1x, r1y, r2x, r2y, r3x, r3y, diameter, distance))

print(grouping)

